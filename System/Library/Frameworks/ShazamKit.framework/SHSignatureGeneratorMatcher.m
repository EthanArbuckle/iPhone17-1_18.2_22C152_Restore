@interface SHSignatureGeneratorMatcher
- (BOOL)shouldGenerateSpectralOutput;
- (SHAudioRecordingManager)audioRecordingManager;
- (SHAudioTap)tap;
- (SHMatcherDelegate)delegate;
- (SHMatcherRequest)request;
- (SHSessionDriver)sessionDriver;
- (SHSignatureGeneratorMatcher)initWithAudioTap:(id)a3 audioRecordingManager:(id)a4;
- (SHSignatureGeneratorMatcher)initWithAudioTap:(id)a3 sessionDriver:(id)a4 audioRecordingManager:(id)a5;
- (id)responseSignatureForRequest:(id)a3;
- (void)_stop;
- (void)matchSignature:(id)a3;
- (void)matcher:(id)a3 didProduceResponse:(id)a4;
- (void)sessionDriverEncounteredUnrecoverableError:(id)a3 forSignature:(id)a4;
- (void)setDelegate:(id)a3;
- (void)startRecognitionForRequest:(id)a3;
- (void)stopRecognition;
- (void)stopRecognitionForRequestID:(id)a3;
@end

@implementation SHSignatureGeneratorMatcher

- (SHSignatureGeneratorMatcher)initWithAudioTap:(id)a3 audioRecordingManager:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)SHCustomCatalog);
  id v9 = objc_alloc((Class)SHStreamingSessionDriver);
  [v8 minimumQuerySignatureDuration];
  double v11 = v10;
  [v8 maximumQuerySignatureDuration];
  double v13 = v12;
  v14 = [v8 _configuration];
  [v14 streamingBufferDuration];
  id v16 = [v9 initWithMinimumSignatureDuration:v11 maximumSignatureDuration:v13 bufferDuration:v15];

  v17 = [(SHSignatureGeneratorMatcher *)self initWithAudioTap:v7 sessionDriver:v16 audioRecordingManager:v6];
  return v17;
}

- (SHSignatureGeneratorMatcher)initWithAudioTap:(id)a3 sessionDriver:(id)a4 audioRecordingManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SHSignatureGeneratorMatcher;
  double v12 = [(SHSignatureGeneratorMatcher *)&v18 init];
  double v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_audioRecordingManager, a5);
    objc_storeStrong((id *)&v13->_tap, a3);
    objc_storeStrong((id *)&v13->_sessionDriver, a4);
    [(SHSessionDriver *)v13->_sessionDriver setSessionDriverDelegate:v13];
    objc_initWeak(&location, v13);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100024DF4;
    v15[3] = &unk_100075720;
    objc_copyWeak(&v16, &location);
    [(SHAudioTap *)v13->_tap setCompletion:v15];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v13;
}

- (void)matchSignature:(id)a3
{
  id v4 = a3;
  v5 = [(SHSignatureGeneratorMatcher *)self tap];
  id v6 = [v5 recordingSource];
  id v7 = [v4 metrics];
  [v7 setRecordingSource:v6];

  id v8 = objc_alloc((Class)SHMatcherResponse);
  id v9 = [(SHSignatureGeneratorMatcher *)self request];
  id v10 = [v9 requestID];
  id v12 = [v8 initWithRecordingIntermission:0 recordingSignatureOffset:v4 retrySeconds:v10 match:0 signature:0.0 runningAssociatedRequestID:0.0 error:0.0];

  id v11 = [(SHSignatureGeneratorMatcher *)self delegate];
  [v11 matcher:self didProduceResponse:v12];
}

- (void)sessionDriverEncounteredUnrecoverableError:(id)a3 forSignature:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SHSignatureGeneratorMatcher *)self delegate];
  id v9 = +[SHMatcherResponse errorResponseForSignature:v6 error:v7];

  [v8 matcher:self didProduceResponse:v9];

  [(SHSignatureGeneratorMatcher *)self _stop];
}

- (void)startRecognitionForRequest:(id)a3
{
  id v5 = a3;
  id v6 = [(SHSignatureGeneratorMatcher *)self request];

  if (v6)
  {
    NSErrorUserInfoKey v14 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v15 = @"Signature generator worker passed multiple requests";
    id v7 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    id v8 = +[SHError errorWithCode:202 underlyingError:0 keyOverrides:v7];

    id v9 = [(SHSignatureGeneratorMatcher *)self delegate];
    id v10 = [(SHSignatureGeneratorMatcher *)self request];
    id v11 = [(SHSignatureGeneratorMatcher *)self responseSignatureForRequest:v10];
    id v12 = +[SHMatcherResponse errorResponseForSignature:v11 error:v8];
    [v9 matcher:self didProduceResponse:v12];

    [(SHSignatureGeneratorMatcher *)self _stop];
  }
  else
  {
    objc_storeStrong((id *)&self->_request, a3);
    id v8 = [(SHSignatureGeneratorMatcher *)self audioRecordingManager];
    double v13 = [(SHSignatureGeneratorMatcher *)self tap];
    [v8 attachTap:v13];
  }
}

- (void)matcher:(id)a3 didProduceResponse:(id)a4
{
  id v24 = a4;
  id v5 = [(SHSignatureGeneratorMatcher *)self sessionDriver];
  [v5 matcher:self didProduceResponse:v24];

  id v6 = [(SHSignatureGeneratorMatcher *)self request];
  id v7 = [v6 deadline];
  if (v7)
  {
    BOOL v8 = 0;
  }
  else
  {
    [v24 retrySeconds];
    BOOL v8 = v9 <= 0.0;
  }

  id v10 = [(SHSignatureGeneratorMatcher *)self request];
  id v11 = [v10 deadline];
  if (v11)
  {
    id v12 = [(SHSignatureGeneratorMatcher *)self request];
    double v13 = [v12 deadline];
    NSErrorUserInfoKey v14 = +[NSDate date];
    CFStringRef v15 = [v13 earlierDate:v14];
    id v16 = [(SHSignatureGeneratorMatcher *)self request];
    v17 = [v16 deadline];
    BOOL v18 = v15 == v17;
  }
  else
  {
    BOOL v18 = 0;
  }

  if (v8 || v18)
  {
    v19 = +[SHError privateErrorWithCode:203 underlyingError:0];
    v20 = [(SHSignatureGeneratorMatcher *)self delegate];
    v21 = [(SHSignatureGeneratorMatcher *)self request];
    v22 = [(SHSignatureGeneratorMatcher *)self responseSignatureForRequest:v21];
    v23 = +[SHMatcherResponse errorResponseForSignature:v22 error:v19];
    [v20 matcher:self didProduceResponse:v23];

    [(SHSignatureGeneratorMatcher *)self _stop];
  }
}

- (void)_stop
{
  v3 = [(SHSignatureGeneratorMatcher *)self tap];

  if (v3)
  {
    id v4 = [(SHSignatureGeneratorMatcher *)self audioRecordingManager];
    id v5 = [(SHSignatureGeneratorMatcher *)self tap];
    [v4 detachTap:v5];

    tap = self->_tap;
    self->_tap = 0;
  }
}

- (void)stopRecognitionForRequestID:(id)a3
{
  id v4 = a3;
  id v5 = [(SHSignatureGeneratorMatcher *)self request];
  id v6 = [v5 requestID];
  unsigned int v7 = [v6 isEqual:v4];

  if (v7)
  {
    BOOL v8 = [(SHSignatureGeneratorMatcher *)self tap];

    if (v8)
    {
      [(SHSignatureGeneratorMatcher *)self _stop];
      double v9 = [(SHSignatureGeneratorMatcher *)self request];
      id v10 = [(SHSignatureGeneratorMatcher *)self responseSignatureForRequest:v9];
      id v11 = +[SHError privateErrorWithCode:203 underlyingError:0];
      id v13 = +[SHMatcherResponse errorResponseForSignature:v10 error:v11];

      id v12 = [(SHSignatureGeneratorMatcher *)self delegate];
      [v12 matcher:self didProduceResponse:v13];
    }
  }
}

- (void)stopRecognition
{
  id v4 = [(SHSignatureGeneratorMatcher *)self request];
  v3 = [v4 requestID];
  [(SHSignatureGeneratorMatcher *)self stopRecognitionForRequestID:v3];
}

- (id)responseSignatureForRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 signature];

  if (v5)
  {
    id v6 = [v4 signature];
  }
  else
  {
    id v6 = objc_opt_new();
    unsigned int v7 = [(SHSignatureGeneratorMatcher *)self tap];
    id v8 = [v7 recordingSource];
    double v9 = [v6 metrics];
    [v9 setRecordingSource:v8];
  }

  return v6;
}

- (BOOL)shouldGenerateSpectralOutput
{
  v3 = [(SHSignatureGeneratorMatcher *)self tap];
  id v4 = [v3 recordingSource];
  id v5 = [(SHSignatureGeneratorMatcher *)self audioRecordingManager];
  LOBYTE(v4) = v4 == [v5 suggestedAudioRecordingSource];

  return (char)v4;
}

- (SHMatcherDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SHMatcherDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SHAudioTap)tap
{
  return self->_tap;
}

- (SHSessionDriver)sessionDriver
{
  return self->_sessionDriver;
}

- (SHAudioRecordingManager)audioRecordingManager
{
  return self->_audioRecordingManager;
}

- (SHMatcherRequest)request
{
  return self->_request;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_audioRecordingManager, 0);
  objc_storeStrong((id *)&self->_sessionDriver, 0);
  objc_storeStrong((id *)&self->_tap, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end
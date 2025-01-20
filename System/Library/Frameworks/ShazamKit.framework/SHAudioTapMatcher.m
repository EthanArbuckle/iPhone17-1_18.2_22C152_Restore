@interface SHAudioTapMatcher
- (BOOL)finishSessionConditionsMetForRequest:(id)a3 response:(id)a4;
- (BOOL)isRunning;
- (BOOL)session:(id)a3 shouldAttemptToMatchSignature:(id)a4;
- (BOOL)shouldGenerateSpectralOutput;
- (NSRecursiveLock)lock;
- (SHAudioRecordingManager)audioRecordingManager;
- (SHAudioTap)audioTap;
- (SHAudioTapMatcher)initWithAudioTap:(id)a3 audioRecordingManager:(id)a4 catalog:(id)a5;
- (SHAudioTapMatcher)initWithAudioTap:(id)a3 audioRecordingManager:(id)a4 session:(id)a5;
- (SHAudioTapMatcher)initWithAudioTap:(id)a3 sessionDriver:(id)a4 audioRecordingManager:(id)a5 catalog:(id)a6;
- (SHMatcherDelegate)delegate;
- (SHMatcherRequest)matcherRequest;
- (SHSession)session;
- (id)errorResponseSignature;
- (void)_stop;
- (void)session:(id)a3 didProduceResponse:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setMatcherRequest:(id)a3;
- (void)startRecognitionForRequest:(id)a3;
- (void)stopRecognition;
- (void)stopRecognitionForRequestID:(id)a3;
@end

@implementation SHAudioTapMatcher

- (SHAudioTapMatcher)initWithAudioTap:(id)a3 sessionDriver:(id)a4 audioRecordingManager:(id)a5 catalog:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc((Class)SHSession);
  v15 = [v10 _createMatcher];
  id v16 = [v14 initWithCatalog:v10 matcher:v15 sessionDriver:v12];

  v17 = [(SHAudioTapMatcher *)self initWithAudioTap:v13 audioRecordingManager:v11 session:v16];
  return v17;
}

- (SHAudioTapMatcher)initWithAudioTap:(id)a3 audioRecordingManager:(id)a4 catalog:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [objc_alloc((Class)SHSession) initWithCatalog:v8];

  id v12 = [(SHAudioTapMatcher *)self initWithAudioTap:v10 audioRecordingManager:v9 session:v11];
  return v12;
}

- (SHAudioTapMatcher)initWithAudioTap:(id)a3 audioRecordingManager:(id)a4 session:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)SHAudioTapMatcher;
  id v12 = [(SHAudioTapMatcher *)&v21 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_audioTap, a3);
    objc_storeStrong((id *)&v13->_audioRecordingManager, a4);
    objc_storeStrong((id *)&v13->_session, a5);
    id v14 = (NSRecursiveLock *)objc_alloc_init((Class)NSRecursiveLock);
    lock = v13->_lock;
    v13->_lock = v14;

    objc_initWeak(&location, v13);
    objc_copyWeak(&v19, &location);
    id v16 = [(SHAudioTapMatcher *)v13 audioTap];
    [v16 setCompletion:&v18];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v13;
}

- (void)startRecognitionForRequest:(id)a3
{
  id v4 = a3;
  v5 = [(SHAudioTapMatcher *)self lock];
  [v5 lock];

  if ([(SHAudioTapMatcher *)self isRunning])
  {
    v6 = sh_log_object();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138412290;
      uint64_t v18 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Error: audio tap matcher: %@ asked to start recognition when it is already matching", (uint8_t *)&v17, 0xCu);
    }

    v7 = +[SHCoreError errorWithCode:101 underlyingError:0];
    id v8 = +[SHError errorWithCode:202 underlyingError:v7];
    id v9 = [(SHAudioTapMatcher *)self delegate];
    id v10 = [(SHAudioTapMatcher *)self errorResponseSignature];
    id v11 = +[SHMatcherResponse errorResponseForSignature:v10 error:v8];
    [v9 matcher:self didProduceResponse:v11];
  }
  else
  {
    [(SHAudioTapMatcher *)self setMatcherRequest:v4];
    id v12 = [(SHAudioTapMatcher *)self session];
    [v12 setDelegate:self];

    id v13 = sh_log_object();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      id v14 = [v4 deadline];
      int v17 = 138412290;
      uint64_t v18 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "startRecognition based upon deadline %@", (uint8_t *)&v17, 0xCu);
    }
    v15 = [(SHAudioTapMatcher *)self audioRecordingManager];
    id v16 = [(SHAudioTapMatcher *)self audioTap];
    [v15 attachTap:v16];

    v7 = [(SHAudioTapMatcher *)self lock];
    [v7 unlock];
  }
}

- (id)errorResponseSignature
{
  v3 = objc_opt_new();
  id v4 = [(SHAudioTapMatcher *)self audioTap];
  id v5 = [v4 recordingSource];
  v6 = [v3 metrics];
  [v6 setRecordingSource:v5];

  return v3;
}

- (BOOL)isRunning
{
  v2 = [(SHAudioTapMatcher *)self matcherRequest];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)session:(id)a3 shouldAttemptToMatchSignature:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SHAudioTapMatcher *)self audioTap];
  id v9 = [v8 recordingSource];
  id v10 = [v7 metrics];
  [v10 setRecordingSource:v9];

  if ([(SHAudioTapMatcher *)self isRunning])
  {
    id v11 = [(SHAudioTapMatcher *)self delegate];
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      id v13 = [(SHAudioTapMatcher *)self delegate];
      unsigned __int8 v14 = [v13 session:v6 shouldAttemptToMatchSignature:v7];
    }
    else
    {
      unsigned __int8 v14 = 1;
    }
  }
  else
  {
    unsigned __int8 v14 = 0;
  }

  return v14;
}

- (void)session:(id)a3 didProduceResponse:(id)a4
{
  id v21 = a4;
  id v5 = [(SHAudioTapMatcher *)self matcherRequest];
  unsigned int v6 = [(SHAudioTapMatcher *)self finishSessionConditionsMetForRequest:v5 response:v21];

  if ((v6 & 1) == 0)
  {
    id v7 = objc_alloc((Class)SHMatcherResponse);
    [v21 recordingIntermission];
    double v9 = v8;
    [v21 recordingSignatureOffset];
    double v11 = v10;
    [v21 retrySeconds];
    double v13 = v12;
    unsigned __int8 v14 = [v21 match];
    v15 = [v21 signature];
    id v16 = [(SHAudioTapMatcher *)self matcherRequest];
    int v17 = [v16 requestID];
    uint64_t v18 = [v21 error];
    id v19 = [v7 initWithRecordingIntermission:v14 recordingSignatureOffset:v15 retrySeconds:v17 match:v18 signature:v9 runningAssociatedRequestID:v11 error:v13];

    id v21 = v19;
  }
  v20 = [(SHAudioTapMatcher *)self delegate];
  [v20 matcher:self didProduceResponse:v21];

  if (v6) {
    [(SHAudioTapMatcher *)self _stop];
  }
}

- (BOOL)finishSessionConditionsMetForRequest:(id)a3 response:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 result];
  if ([v5 stopCondition] == (id)3) {
    unsigned int v8 = [v5 hasHitDeadline];
  }
  else {
    unsigned int v8 = 0;
  }
  id v9 = [v5 stopCondition];
  if ([v5 stopCondition] == (id)2)
  {
    double v10 = [v6 match];
    BOOL v11 = v10 != 0;
  }
  else
  {
    BOOL v11 = 0;
  }
  double v12 = sh_log_object();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v17[0] = 67109888;
    v17[1] = v8;
    __int16 v18 = 1024;
    BOOL v19 = v9 == 0;
    __int16 v20 = 1024;
    BOOL v21 = v11;
    __int16 v22 = 1024;
    BOOL v23 = v7 == (id)3;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Tagging finish conditions: timeOut %d, oneAttempt: %d, foundMatch: %d, failed %d", (uint8_t *)v17, 0x1Au);
  }

  if (v9) {
    char v13 = v8;
  }
  else {
    char v13 = 1;
  }
  char v14 = v13 | v11;
  if (v7 == (id)3) {
    BOOL v15 = 1;
  }
  else {
    BOOL v15 = v14;
  }

  return v15;
}

- (void)_stop
{
  BOOL v3 = sh_log_object();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)BOOL v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Stopping recognition", v11, 2u);
  }

  id v4 = [(SHAudioTapMatcher *)self lock];
  [v4 lock];

  [(SHAudioTapMatcher *)self setMatcherRequest:0];
  [(SHAudioTapMatcher *)self setDelegate:0];
  id v5 = [(SHAudioTapMatcher *)self session];
  [v5 setDelegate:0];

  id v6 = [(SHAudioTapMatcher *)self audioRecordingManager];
  id v7 = [(SHAudioTapMatcher *)self audioTap];
  [v6 detachTap:v7];

  audioRecordingManager = self->_audioRecordingManager;
  self->_audioRecordingManager = 0;

  audioTap = self->_audioTap;
  self->_audioTap = 0;

  double v10 = [(SHAudioTapMatcher *)self lock];
  [v10 unlock];
}

- (void)stopRecognition
{
  id v4 = [(SHAudioTapMatcher *)self matcherRequest];
  BOOL v3 = [v4 requestID];
  [(SHAudioTapMatcher *)self stopRecognitionForRequestID:v3];
}

- (void)stopRecognitionForRequestID:(id)a3
{
  id v4 = a3;
  id v5 = [(SHAudioTapMatcher *)self matcherRequest];
  id v6 = [v5 requestID];
  unsigned int v7 = [v6 isEqual:v4];

  if (v7)
  {
    unsigned int v8 = sh_log_object();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v15 = 138412290;
      id v16 = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Stopping recognition for matcher %@", (uint8_t *)&v15, 0xCu);
    }

    id v9 = [(SHAudioTapMatcher *)self lock];
    [v9 lock];

    double v10 = +[SHError privateErrorWithCode:203 underlyingError:0];
    BOOL v11 = [(SHAudioTapMatcher *)self errorResponseSignature];
    double v12 = +[SHMatcherResponse errorResponseForSignature:v11 error:v10];

    char v13 = [(SHAudioTapMatcher *)self delegate];
    [v13 matcher:self didProduceResponse:v12];

    [(SHAudioTapMatcher *)self _stop];
    char v14 = [(SHAudioTapMatcher *)self lock];
    [v14 unlock];
  }
}

- (BOOL)shouldGenerateSpectralOutput
{
  BOOL v3 = [(SHAudioTapMatcher *)self audioTap];
  id v4 = [v3 recordingSource];
  id v5 = [(SHAudioTapMatcher *)self audioRecordingManager];
  LOBYTE(v4) = v4 == [v5 suggestedAudioRecordingSource];

  return (char)v4;
}

- (SHMatcherDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return (SHMatcherDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SHAudioRecordingManager)audioRecordingManager
{
  return self->_audioRecordingManager;
}

- (SHAudioTap)audioTap
{
  return self->_audioTap;
}

- (SHSession)session
{
  return self->_session;
}

- (NSRecursiveLock)lock
{
  return self->_lock;
}

- (SHMatcherRequest)matcherRequest
{
  return self->_matcherRequest;
}

- (void)setMatcherRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matcherRequest, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_audioTap, 0);
  objc_storeStrong((id *)&self->_audioRecordingManager, 0);

  objc_destroyWeak((id *)&self->delegate);
}

@end
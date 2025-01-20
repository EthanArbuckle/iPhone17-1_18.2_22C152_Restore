@interface PHAudioRecorder
- (AVCaptureConnection)captureConnection;
- (AVCaptureMovieFileOutput)captureFileOutput;
- (AVCaptureSession)captureSession;
- (BOOL)handlingStop;
- (BOOL)isRecording;
- (BOOL)startWithError:(id *)a3;
- (NSError)buildCaptureSessionError;
- (NSString)outputFile;
- (NSTimer)updateTimer;
- (PHAudioRecorder)init;
- (PHAudioRecorderDelegate)audioRecorderDelegate;
- (double)maxRecordedDuration;
- (void)_buildCaptureSessionAndOutputIfNecessary;
- (void)_captureSessionErrored:(id)a3;
- (void)_captureSessionWasInterrupted:(id)a3;
- (void)_stopWithError:(id)a3;
- (void)_updateRecordProgress:(id)a3;
- (void)captureOutput:(id)a3 didFinishRecordingToOutputFileAtURL:(id)a4 fromConnections:(id)a5 error:(id)a6;
- (void)dealloc;
- (void)setAudioRecorderDelegate:(id)a3;
- (void)setHandlingStop:(BOOL)a3;
- (void)setIsRecording:(BOOL)a3;
- (void)setMaxRecordedDuration:(double)a3;
- (void)setOutputFile:(id)a3;
- (void)setUpdateTimer:(id)a3;
- (void)stop;
@end

@implementation PHAudioRecorder

- (PHAudioRecorder)init
{
  v3.receiver = self;
  v3.super_class = (Class)PHAudioRecorder;
  return [(PHAudioRecorder *)&v3 init];
}

- (void)dealloc
{
  objc_super v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  [(NSTimer *)self->_updateTimer invalidate];
  v4.receiver = self;
  v4.super_class = (Class)PHAudioRecorder;
  [(PHAudioRecorder *)&v4 dealloc];
}

- (BOOL)startWithError:(id *)a3
{
  unsigned int v5 = [(PHAudioRecorder *)self isRecording];
  if (a3 && v5)
  {
    NSErrorUserInfoKey v32 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v33 = @"Can't start recording, as we're already recording";
    v6 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    uint64_t v7 = 5;
LABEL_10:
    *a3 = +[NSError errorWithDomain:@"com.apple.mobilephone.PHAudioController" code:v7 userInfo:v6];

    return 0;
  }
  v8 = [(PHAudioRecorder *)self outputFile];

  if (a3 && !v8)
  {
    NSErrorUserInfoKey v30 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v31 = @"No output file specified";
    v6 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    uint64_t v7 = 3;
    goto LABEL_10;
  }
  [(PHAudioRecorder *)self maxRecordedDuration];
  if (a3 && v9 <= 0.0)
  {
    NSErrorUserInfoKey v28 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v29 = @"No max duration specified";
    v6 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    uint64_t v7 = 4;
    goto LABEL_10;
  }
  v12 = [(PHAudioRecorder *)self captureSession];

  if (!a3 || v12)
  {
    v14 = +[AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeAudio];
    unsigned int v15 = [v14 supportsAVCaptureSessionPreset:AVCaptureSessionPresetVoicemailGreeting] ^ 1;
    if (a3) {
      unsigned int v16 = v15;
    }
    else {
      unsigned int v16 = 0;
    }
    if (v16 == 1)
    {
      NSErrorUserInfoKey v26 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v27 = @"Audio capture device does not support voicemail greeting";
      id v17 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
      *a3 = +[NSError errorWithDomain:@"com.apple.mobilephone.PHAudioController" code:6 userInfo:v17];
    }
    else
    {
      [(PHAudioRecorder *)self setIsRecording:1];
      v18 = [(PHAudioRecorder *)self audioRecorderDelegate];

      if (v18)
      {
        v19 = [(PHAudioRecorder *)self audioRecorderDelegate];
        v20 = [(PHAudioRecorder *)self outputFile];
        [v19 audioRecorderStartedWithFile:v20];
      }
      v21 = [(PHAudioRecorder *)self captureSession];
      [v21 startRunning];

      id v22 = objc_alloc((Class)NSURL);
      v23 = [(PHAudioRecorder *)self outputFile];
      id v17 = [v22 initFileURLWithPath:v23];

      v24 = [(PHAudioRecorder *)self captureFileOutput];
      [v24 startRecordingToOutputFileURL:v17 recordingDelegate:self];

      v25 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_updateRecordProgress:" selector:0 userInfo:1 repeats:0.0333333351];
      [(PHAudioRecorder *)self setUpdateTimer:v25];

      if (a3) {
        *a3 = 0;
      }
    }

    char v10 = v16 ^ 1;
  }
  else
  {
    v13 = self->_buildCaptureSessionError;
    char v10 = 0;
    *a3 = v13;
  }
  return v10;
}

- (void)stop
{
}

- (void)setOutputFile:(id)a3
{
  id v8 = a3;
  if ([(PHAudioRecorder *)self isRecording])
  {
    v6 = +[NSString stringWithFormat:@"Already recording, cannot set output file"];
    NSLog(@"** TUAssertion failure: %@", v6);

    if (_TUAssertShouldCrashApplication())
    {
      if ([(PHAudioRecorder *)self isRecording])
      {
        uint64_t v7 = +[NSAssertionHandler currentHandler];
        [v7 handleFailureInMethod:a2, self, @"PHAudioRecorder.m", 126, @"Already recording, cannot set output file" object file lineNumber description];
      }
    }
  }
  if (![(PHAudioRecorder *)self isRecording]) {
    objc_storeStrong((id *)&self->_outputFile, a3);
  }
}

- (void)setMaxRecordedDuration:(double)a3
{
  if ([(PHAudioRecorder *)self isRecording])
  {
    v6 = +[NSString stringWithFormat:@"Already recording, cannot set max duration"];
    NSLog(@"** TUAssertion failure: %@", v6);

    if (_TUAssertShouldCrashApplication())
    {
      if ([(PHAudioRecorder *)self isRecording])
      {
        id v8 = +[NSAssertionHandler currentHandler];
        [v8 handleFailureInMethod:a2, self, @"PHAudioRecorder.m", 135, @"Already recording, cannot set max duration" object file lineNumber description];
      }
    }
  }
  if (![(PHAudioRecorder *)self isRecording])
  {
    self->_maxRecordedDuration = a3;
    CMTimeMakeWithSeconds(&v10, a3, 1);
    uint64_t v7 = [(PHAudioRecorder *)self captureFileOutput];
    CMTime v9 = v10;
    [v7 setMaxRecordedDuration:&v9];
  }
}

- (AVCaptureSession)captureSession
{
  [(PHAudioRecorder *)self _buildCaptureSessionAndOutputIfNecessary];
  captureSession = self->_captureSession;

  return captureSession;
}

- (AVCaptureMovieFileOutput)captureFileOutput
{
  [(PHAudioRecorder *)self _buildCaptureSessionAndOutputIfNecessary];
  captureFileOutput = self->_captureFileOutput;

  return captureFileOutput;
}

- (AVCaptureConnection)captureConnection
{
  [(PHAudioRecorder *)self _buildCaptureSessionAndOutputIfNecessary];
  captureConnection = self->_captureConnection;

  return captureConnection;
}

- (void)setUpdateTimer:(id)a3
{
  id v5 = a3;
  updateTimer = self->_updateTimer;
  p_updateTimer = (id *)&self->_updateTimer;
  v6 = updateTimer;
  id v10 = v5;
  if (updateTimer)
  {
    [(NSTimer *)v6 invalidate];
    id v9 = *p_updateTimer;
    id *p_updateTimer = 0;

    id v5 = v10;
  }
  if (v5)
  {
    objc_storeStrong(p_updateTimer, a3);
    id v5 = v10;
  }

  _objc_release_x1(v6, v5);
}

- (void)captureOutput:(id)a3 didFinishRecordingToOutputFileAtURL:(id)a4 fromConnections:(id)a5 error:(id)a6
{
  id v7 = a6;
  id v6 = v7;
  TUGuaranteeExecutionOnMainThreadAsync();
}

id __91__PHAudioRecorder_captureOutput_didFinishRecordingToOutputFileAtURL_fromConnections_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopWithError:*(void *)(a1 + 40)];
}

- (void)_captureSessionWasInterrupted:(id)a3
{
}

void __49__PHAudioRecorder__captureSessionWasInterrupted___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  NSErrorUserInfoKey v4 = NSLocalizedFailureReasonErrorKey;
  CFStringRef v5 = @"Capture session was interrupted";
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
  objc_super v3 = +[NSError errorWithDomain:@"com.apple.mobilephone.PHAudioController" code:7 userInfo:v2];
  [v1 _stopWithError:v3];
}

- (void)_captureSessionErrored:(id)a3
{
}

void __42__PHAudioRecorder__captureSessionErrored___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  NSErrorUserInfoKey v4 = NSLocalizedFailureReasonErrorKey;
  CFStringRef v5 = @"Capture session errored";
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
  objc_super v3 = +[NSError errorWithDomain:@"com.apple.mobilephone.PHAudioController" code:8 userInfo:v2];
  [v1 _stopWithError:v3];
}

- (void)_updateRecordProgress:(id)a3
{
  id v5 = a3;
  if (!self->_captureFileOutput)
  {
    id v6 = +[NSString stringWithFormat:@"Update timer fired while capture file output was nil!  This shouldn't happen."];
    NSLog(@"** TUAssertion failure: %@", v6);

    if (!_TUAssertShouldCrashApplication()) {
      goto LABEL_5;
    }
    if (!self->_captureFileOutput)
    {
      id v7 = +[NSAssertionHandler currentHandler];
      [v7 handleFailureInMethod:a2 object:self file:@"PHAudioRecorder.m" lineNumber:194 description:@"Update timer fired while capture file output was nil!  This shouldn't happen."];

LABEL_5:
      if (!self->_captureFileOutput) {
        goto LABEL_11;
      }
    }
  }
  id v8 = [(PHAudioRecorder *)self audioRecorderDelegate];

  if (v8)
  {
    id v9 = [(PHAudioRecorder *)self audioRecorderDelegate];
    outputFile = self->_outputFile;
    captureFileOutput = self->_captureFileOutput;
    if (captureFileOutput) {
      [(AVCaptureMovieFileOutput *)captureFileOutput recordedDuration];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    [v9 audioRecorderContinuedWithFile:outputFile duration:CMTimeGetSeconds(&time)];
  }
LABEL_11:
}

- (void)_buildCaptureSessionAndOutputIfNecessary
{
  if (!self->_captureSession)
  {
    buildCaptureSessionError = self->_buildCaptureSessionError;
    self->_buildCaptureSessionError = 0;

    NSErrorUserInfoKey v4 = (AVCaptureSession *)objc_alloc_init((Class)AVCaptureSession);
    captureSession = self->_captureSession;
    self->_captureSession = v4;

    [(AVCaptureSession *)self->_captureSession setSessionPreset:AVCaptureSessionPresetVoicemailGreeting];
    id v6 = +[AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeAudio];
    id v7 = +[AVCaptureDeviceInput deviceInputWithDevice:v6 error:0];
    if ([(AVCaptureSession *)self->_captureSession canAddInput:v7])
    {
      [(AVCaptureSession *)self->_captureSession addInput:v7];
      id v8 = (AVCaptureMovieFileOutput *)objc_alloc_init((Class)AVCaptureMovieFileOutput);
      captureFileOutput = self->_captureFileOutput;
      self->_captureFileOutput = v8;

      if ([(AVCaptureSession *)self->_captureSession canAddOutput:self->_captureFileOutput])
      {
        [(AVCaptureSession *)self->_captureSession addOutput:self->_captureFileOutput];
        id v10 = [(AVCaptureMovieFileOutput *)self->_captureFileOutput connectionWithMediaType:AVMediaTypeAudio];
        captureConnection = self->_captureConnection;
        self->_captureConnection = v10;

        v12 = +[NSNotificationCenter defaultCenter];
        [v12 addObserver:self selector:"_captureSessionWasInterrupted:" name:AVCaptureSessionWasInterruptedNotification object:self->_captureSession];

        v13 = +[NSNotificationCenter defaultCenter];
        [v13 addObserver:self selector:"_captureSessionErrored:" name:AVCaptureSessionRuntimeErrorNotification object:self->_captureSession];

LABEL_8:
        return;
      }
      NSErrorUserInfoKey v22 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v23 = @"Unable to add audio capture file output to capture session";
      v18 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      v19 = +[NSError errorWithDomain:@"com.apple.mobilephone.PHAudioController" code:2 userInfo:v18];
      v20 = self->_buildCaptureSessionError;
      self->_buildCaptureSessionError = v19;

      v21 = self->_captureSession;
      self->_captureSession = 0;

      id v17 = self->_captureFileOutput;
      self->_captureFileOutput = 0;
    }
    else
    {
      NSErrorUserInfoKey v24 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v25 = @"Unable to add audio device input to capture session";
      v14 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      unsigned int v15 = +[NSError errorWithDomain:@"com.apple.mobilephone.PHAudioController" code:1 userInfo:v14];
      unsigned int v16 = self->_buildCaptureSessionError;
      self->_buildCaptureSessionError = v15;

      id v17 = self->_captureSession;
      self->_captureSession = 0;
    }

    goto LABEL_8;
  }
}

- (void)_stopWithError:(id)a3
{
  id v4 = a3;
  if (![(PHAudioRecorder *)self handlingStop])
  {
    [(PHAudioRecorder *)self setHandlingStop:1];
    [(PHAudioRecorder *)self setUpdateTimer:0];
    if ([(PHAudioRecorder *)self isRecording])
    {
      id v5 = [(PHAudioRecorder *)self captureFileOutput];
      unsigned int v6 = [v5 isRecording];

      if (v6)
      {
        id v7 = [(PHAudioRecorder *)self captureFileOutput];
        [v7 stopRecording];
      }
      id v8 = [(PHAudioRecorder *)self captureSession];
      [v8 stopRunning];

      double v9 = 0.0;
      if (!v4)
      {
        id v10 = [(PHAudioRecorder *)self captureFileOutput];
        v11 = v10;
        if (v10) {
          [v10 recordedDuration];
        }
        else {
          memset(&time, 0, sizeof(time));
        }
        double v12 = round(CMTimeGetSeconds(&time));

        double v9 = fmax(v12, 1.0);
      }
      [(PHAudioRecorder *)self setIsRecording:0];
      v13 = [(PHAudioRecorder *)self audioRecorderDelegate];

      if (v13)
      {
        v14 = [(PHAudioRecorder *)self audioRecorderDelegate];
        unsigned int v15 = [(PHAudioRecorder *)self outputFile];
        [v14 audioRecorderEndedWithFile:v15 duration:v4 error:v9];
      }
    }
    [(PHAudioRecorder *)self setHandlingStop:0];
  }
}

- (NSTimer)updateTimer
{
  return self->_updateTimer;
}

- (NSError)buildCaptureSessionError
{
  return (NSError *)objc_getProperty(self, a2, 32, 1);
}

- (PHAudioRecorderDelegate)audioRecorderDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audioRecorderDelegate);

  return (PHAudioRecorderDelegate *)WeakRetained;
}

- (void)setAudioRecorderDelegate:(id)a3
{
}

- (NSString)outputFile
{
  return self->_outputFile;
}

- (double)maxRecordedDuration
{
  return self->_maxRecordedDuration;
}

- (BOOL)isRecording
{
  return self->_isRecording;
}

- (void)setIsRecording:(BOOL)a3
{
  self->_isRecording = a3;
}

- (BOOL)handlingStop
{
  return self->_handlingStop;
}

- (void)setHandlingStop:(BOOL)a3
{
  self->_handlingStop = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputFile, 0);
  objc_destroyWeak((id *)&self->_audioRecorderDelegate);
  objc_storeStrong((id *)&self->_updateTimer, 0);
  objc_storeStrong((id *)&self->_buildCaptureSessionError, 0);
  objc_storeStrong((id *)&self->_captureConnection, 0);
  objc_storeStrong((id *)&self->_captureFileOutput, 0);

  objc_storeStrong((id *)&self->_captureSession, 0);
}

@end
@interface AXLTTranscriber
+ (AXLTTranscriber)sharedInstance;
- (AXLTLanguageAssetManager)languageAssetManager;
- (AXLTTranscriber)init;
- (AXLTTranscription)currentTranscription;
- (BOOL)isAssetPending;
- (BOOL)isPending;
- (BOOL)isTranscribing;
- (BOOL)isTranscribingForPID:(int)a3;
- (BOOL)noPunctuation;
- (NSString)appName;
- (NSTimer)audioBufferTimeoutTimer;
- (SFSpeechAudioBufferRecognitionRequest)recognitionRequest;
- (SFSpeechRecognitionTask)recognitionTask;
- (SFSpeechRecognizer)recognizer;
- (float)_coalsecingTime;
- (id)completionCallback;
- (id)transcriptionCallback;
- (int)pid;
- (int64_t)defaultTaskHint;
- (int64_t)downloadState;
- (int64_t)mapUserTaskHint;
- (int64_t)recognitionTaskHint;
- (int64_t)taskHint;
- (void)_downloadAndInstallSpeechRecognizer;
- (void)_handleAssetDownloadError:(id)a3;
- (void)_restartTranscription;
- (void)appendAudioPCMBuffer:(id)a3 forPID:(int)a4;
- (void)dealloc;
- (void)isAssetPending;
- (void)resumeTranscriptionForPID:(int)a3;
- (void)setAppName:(id)a3;
- (void)setAudioBufferTimeoutTimer:(id)a3;
- (void)setCompletionCallback:(id)a3;
- (void)setCurrentTranscription:(id)a3;
- (void)setDownloadState:(int64_t)a3;
- (void)setIsPending:(BOOL)a3;
- (void)setIsTranscribing:(BOOL)a3;
- (void)setLanguageAssetManager:(id)a3;
- (void)setNoPunctuation:(BOOL)a3;
- (void)setPid:(int)a3;
- (void)setRecognitionRequest:(id)a3;
- (void)setRecognitionTask:(id)a3;
- (void)setRecognizer:(id)a3;
- (void)setTaskHint:(int64_t)a3;
- (void)setTranscriptionCallback:(id)a3;
- (void)speechRecognitionDidDetectSpeech:(id)a3;
- (void)speechRecognitionTask:(id)a3 didFinishRecognition:(id)a4;
- (void)speechRecognitionTask:(id)a3 didFinishSuccessfully:(BOOL)a4;
- (void)speechRecognitionTask:(id)a3 didHypothesizeTranscription:(id)a4;
- (void)speechRecognitionTaskFinishedReadingAudio:(id)a3;
- (void)speechRecognitionTaskWasCancelled:(id)a3;
- (void)startTranscriptionForPID:(int)a3 appName:(id)a4 callback:(id)a5 completionCallback:(id)a6;
- (void)stopTranscriptionForPID:(int)a3;
@end

@implementation AXLTTranscriber

+ (AXLTTranscriber)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__AXLTTranscriber_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_once != -1) {
    dispatch_once(&sharedInstance_once, block);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return (AXLTTranscriber *)v2;
}

uint64_t __33__AXLTTranscriber_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (AXLTTranscriber)init
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v12.receiver = self;
  v12.super_class = (Class)AXLTTranscriber;
  v2 = [(AXLTTranscriber *)&v12 init];
  if (v2)
  {
    uint64_t v3 = +[AXLTLanguageAssetManager sharedInstance];
    languageAssetManager = v2->_languageAssetManager;
    v2->_languageAssetManager = (AXLTLanguageAssetManager *)v3;

    v5 = [(AXLTTranscriber *)v2 languageAssetManager];
    v6 = [v5 locale];

    v7 = AXLogLiveTranscription();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [v6 localeIdentifier];
      *(_DWORD *)buf = 138412290;
      v14 = v8;
      _os_log_impl(&dword_23C242000, v7, OS_LOG_TYPE_DEFAULT, "Transcriber: Using locale: %@", buf, 0xCu);
    }
    v9 = (void *)[objc_alloc(MEMORY[0x263F17BA0]) initWithLocale:v6];
    [(AXLTTranscriber *)v2 setRecognizer:v9];

    v10 = [(AXLTTranscriber *)v2 recognizer];
    [v10 setDelegate:v2];

    v2->_downloadState = -2;
  }
  return v2;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_23C242000, v0, v1, "AXLTTranscriber dealloc", v2, v3, v4, v5, v6);
}

- (int64_t)recognitionTaskHint
{
  if (self->_taskHint) {
    return [(AXLTTranscriber *)self mapUserTaskHint];
  }
  else {
    return [(AXLTTranscriber *)self defaultTaskHint];
  }
}

- (int64_t)mapUserTaskHint
{
  int64_t result = [(AXLTTranscriber *)self taskHint] - 1;
  if ((unint64_t)result >= 4)
  {
    return [(AXLTTranscriber *)self defaultTaskHint];
  }
  return result;
}

- (int64_t)defaultTaskHint
{
  uint64_t v2 = [MEMORY[0x263EFF960] currentLocale];
  uint64_t v3 = [v2 localeIdentifier];
  int v4 = [v3 isEqualToString:@"en_US"];

  if (v4) {
    return 1004;
  }
  else {
    return 1;
  }
}

- (void)startTranscriptionForPID:(int)a3 appName:(id)a4 callback:(id)a5 completionCallback:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([(AXLTTranscriber *)self isAssetPending])
  {
    v13 = AXLogLiveTranscription();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[AXLTTranscriber startTranscriptionForPID:appName:callback:completionCallback:]();
    }

    goto LABEL_16;
  }
  BOOL v14 = [(AXLTTranscriber *)self isTranscribing];
  uint64_t v15 = AXLogLiveTranscription();
  v16 = v15;
  if (v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[AXLTTranscriber startTranscriptionForPID:appName:callback:completionCallback:]((uint64_t)v10, self, v16);
    }
    goto LABEL_15;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v17 = [NSNumber numberWithInt:v8];
    *(_DWORD *)buf = 138412802;
    id v22 = v10;
    __int16 v23 = 2112;
    v24 = v17;
    __int16 v25 = 1024;
    BOOL v26 = [(AXLTTranscriber *)self isPending];
    _os_log_impl(&dword_23C242000, v16, OS_LOG_TYPE_DEFAULT, "Transcriber: Starting transcription for app: %@, pid: %@, pending: %d", buf, 0x1Cu);
  }
  if ([(AXLTTranscriber *)self pid] != v8 || ![(AXLTTranscriber *)self isPending]) {
    [(AXLTTranscriber *)self stopTranscriptionForPID:[(AXLTTranscriber *)self pid]];
  }
  [(AXLTTranscriber *)self setPid:v8];
  [(AXLTTranscriber *)self setAppName:v10];
  [(AXLTTranscriber *)self setTranscriptionCallback:v11];
  [(AXLTTranscriber *)self setCompletionCallback:v12];
  [(AXLTTranscriber *)self setCurrentTranscription:0];
  if (![(AXLTTranscriber *)self isPending])
  {
    [(AXLTTranscriber *)self setIsPending:1];
    v16 = [(AXLTTranscriber *)self languageAssetManager];
    int64_t v18 = [(AXLTTranscriber *)self recognitionTaskHint];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __80__AXLTTranscriber_startTranscriptionForPID_appName_callback_completionCallback___block_invoke;
    v19[3] = &unk_264E399F0;
    v19[4] = self;
    int v20 = v8;
    [v16 languageAssetAvaliableForTaskHint:v18 completion:v19];
LABEL_15:
  }
LABEL_16:
}

uint64_t __80__AXLTTranscriber_startTranscriptionForPID_appName_callback_completionCallback___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v4 = AXLogLiveTranscription();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [NSNumber numberWithBool:a2];
    int v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_23C242000, v4, OS_LOG_TYPE_DEFAULT, "Transcriber: Language asset is available: %@", (uint8_t *)&v8, 0xCu);
  }
  uint8_t v6 = *(void **)(a1 + 32);
  if (a2) {
    return [v6 resumeTranscriptionForPID:*(unsigned int *)(a1 + 40)];
  }
  else {
    return [v6 _downloadAndInstallSpeechRecognizer];
  }
}

- (void)stopTranscriptionForPID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  if ([(AXLTTranscriber *)self pid] == a3)
  {
    [(AXLTTranscriber *)self setIsPending:0];
    [(AXLTTranscriber *)self setIsTranscribing:0];
    uint64_t v5 = AXLogLiveTranscription();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint8_t v6 = [(AXLTTranscriber *)self appName];
      v7 = objc_msgSend(NSNumber, "numberWithInt:", -[AXLTTranscriber pid](self, "pid"));
      int v14 = 138412546;
      uint64_t v15 = v6;
      __int16 v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_23C242000, v5, OS_LOG_TYPE_DEFAULT, "Transcriber: Stopping transcription for app: %@, pid: %@", (uint8_t *)&v14, 0x16u);
    }
    [(AXLTTranscriber *)self setCurrentTranscription:0];
    [(AXLTTranscriber *)self setPid:0];
    [(AXLTTranscriber *)self setAppName:0];
    int v8 = [(AXLTTranscriber *)self recognitionTask];

    if (v8)
    {
      v9 = AXLogLiveTranscription();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[AXLTTranscriber stopTranscriptionForPID:]();
      }

      uint64_t v10 = [(AXLTTranscriber *)self recognitionTask];
      [v10 cancel];

      id v11 = [(AXLTTranscriber *)self recognitionTask];
      [v11 finish];

      [(AXLTTranscriber *)self setRecognitionTask:0];
    }
    id v12 = [(AXLTTranscriber *)self recognitionRequest];
    [v12 endAudio];

    [(AXLTTranscriber *)self setRecognitionRequest:0];
  }
  else
  {
    v13 = AXLogLiveTranscription();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[AXLTTranscriber stopTranscriptionForPID:](v3, self);
    }
  }
}

- (void)resumeTranscriptionForPID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v29 = *MEMORY[0x263EF8340];
  if ([(AXLTTranscriber *)self isTranscribing])
  {
    uint64_t v5 = AXLogLiveTranscription();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[AXLTTranscriber resumeTranscriptionForPID:]();
    }
  }
  else if ([(AXLTTranscriber *)self pid])
  {
    if ([(AXLTTranscriber *)self pid] == v3)
    {
      uint8_t v6 = [(AXLTTranscriber *)self recognizer];
      char v7 = [v6 supportsOnDeviceRecognition];

      if (v7)
      {
        [(AXLTTranscriber *)self setIsPending:0];
        [(AXLTTranscriber *)self setIsTranscribing:1];
        [(AXLTTranscriber *)self setCurrentTranscription:0];
        id v8 = objc_alloc_init(MEMORY[0x263F17B78]);
        [(AXLTTranscriber *)self setRecognitionRequest:v8];

        v9 = [(AXLTTranscriber *)self recognitionRequest];
        [v9 setTaskIdentifier:@"systemlivecaptions"];

        uint64_t v10 = [(AXLTTranscriber *)self recognitionRequest];
        [v10 setShouldReportPartialResults:1];

        id v11 = [(AXLTTranscriber *)self recognitionRequest];
        [v11 setDetectMultipleUtterances:0];

        id v12 = [(AXLTTranscriber *)self recognitionRequest];
        [v12 _setMaximumRecognitionDuration:7200.0];

        v13 = [(AXLTTranscriber *)self recognitionRequest];
        [v13 setRequiresOnDeviceRecognition:1];

        if (_os_feature_enabled_impl())
        {
          uint64_t v14 = [(AXLTTranscriber *)self noPunctuation] ^ 1;
          uint64_t v15 = [(AXLTTranscriber *)self recognitionRequest];
          [v15 setAddsPunctuation:v14];
        }
        __int16 v16 = AXLogLiveTranscription();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
          -[AXLTTranscriber resumeTranscriptionForPID:](self);
        }

        int64_t v17 = [(AXLTTranscriber *)self recognitionTaskHint];
        uint64_t v18 = [(AXLTTranscriber *)self recognitionRequest];
        [v18 setTaskHint:v17];

        v19 = [(AXLTTranscriber *)self recognizer];
        int v20 = [(AXLTTranscriber *)self recognitionRequest];
        v21 = [v19 recognitionTaskWithRequest:v20 delegate:self];
        [(AXLTTranscriber *)self setRecognitionTask:v21];

        uint64_t v5 = AXLogLiveTranscription();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          id v22 = [(AXLTTranscriber *)self appName];
          __int16 v23 = objc_msgSend(NSNumber, "numberWithInt:", -[AXLTTranscriber pid](self, "pid"));
          int v25 = 138412546;
          BOOL v26 = v22;
          __int16 v27 = 2112;
          v28 = v23;
          _os_log_impl(&dword_23C242000, v5, OS_LOG_TYPE_DEFAULT, "Transcriber: Resuming transcription for app: %@, pid: %@", (uint8_t *)&v25, 0x16u);
        }
      }
      else
      {
        uint64_t v5 = AXLogLiveTranscription();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v25) = 0;
          _os_log_impl(&dword_23C242000, v5, OS_LOG_TYPE_DEFAULT, "Transcriber: Cannot start on-device recognition for Live Captions", (uint8_t *)&v25, 2u);
        }
      }
    }
    else
    {
      uint64_t v5 = AXLogLiveTranscription();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        -[AXLTTranscriber resumeTranscriptionForPID:](v3, self);
      }
    }
  }
  else
  {
    uint64_t v5 = AXLogLiveTranscription();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v24 = [NSNumber numberWithInt:v3];
      int v25 = 138412290;
      BOOL v26 = v24;
      _os_log_impl(&dword_23C242000, v5, OS_LOG_TYPE_DEFAULT, "Transcriber: Can't resume transcription for pid: %@, startTranscription wasn't called", (uint8_t *)&v25, 0xCu);
    }
  }
}

- (BOOL)isTranscribingForPID:(int)a3
{
  BOOL v5 = [(AXLTTranscriber *)self isTranscribing];
  if (v5) {
    LOBYTE(v5) = [(AXLTTranscriber *)self pid] == a3;
  }
  return v5;
}

- (void)appendAudioPCMBuffer:(id)a3 forPID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (![(AXLTTranscriber *)self pid])
  {
    v9 = AXLogLiveTranscription();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    uint64_t v10 = [NSNumber numberWithInt:v4];
    int v13 = 138412546;
    uint64_t v14 = v10;
    __int16 v15 = 1024;
    LODWORD(v16) = [(AXLTTranscriber *)self isTranscribing];
    _os_log_impl(&dword_23C242000, v9, OS_LOG_TYPE_DEFAULT, "Transcriber: Can't appendAudioPCMBuffer for pid: %@, no active transcribing session, isTranscribing: %d", (uint8_t *)&v13, 0x12u);
LABEL_10:

    goto LABEL_11;
  }
  int v7 = [(AXLTTranscriber *)self pid];
  id v8 = AXLogLiveTranscription();
  v9 = v8;
  if (v7 != v4)
  {
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    uint64_t v10 = [NSNumber numberWithInt:v4];
    id v11 = objc_msgSend(NSNumber, "numberWithInt:", -[AXLTTranscriber pid](self, "pid"));
    id v12 = [(AXLTTranscriber *)self appName];
    int v13 = 138412802;
    uint64_t v14 = v10;
    __int16 v15 = 2112;
    __int16 v16 = v11;
    __int16 v17 = 2112;
    uint64_t v18 = v12;
    _os_log_impl(&dword_23C242000, v9, OS_LOG_TYPE_DEFAULT, "Transcriber: Can't appendAudioPCMBuffer for pid: %@, transcribing for pid: %@ app: %@", (uint8_t *)&v13, 0x20u);

    goto LABEL_10;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[AXLTTranscriber appendAudioPCMBuffer:forPID:](v6, self, v9);
  }

  v9 = [(AXLTTranscriber *)self recognitionRequest];
  [v9 appendAudioPCMBuffer:v6];
LABEL_11:
}

- (void)_restartTranscription
{
  uint64_t v3 = [(AXLTTranscriber *)self pid];
  id v6 = [(AXLTTranscriber *)self appName];
  uint64_t v4 = [(AXLTTranscriber *)self transcriptionCallback];
  BOOL v5 = [(AXLTTranscriber *)self completionCallback];
  [(AXLTTranscriber *)self startTranscriptionForPID:v3 appName:v6 callback:v4 completionCallback:v5];
}

- (BOOL)isAssetPending
{
  if ([(AXLTTranscriber *)self downloadState] == -2
    || [(AXLTTranscriber *)self downloadState] == 100)
  {
    return 0;
  }
  int64_t v4 = [(AXLTTranscriber *)self downloadState];
  BOOL v5 = AXLogLiveTranscription();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4 == -1)
  {
    if (v6) {
      -[AXLTTranscriber isAssetPending]();
    }
  }
  else if (v6)
  {
    -[AXLTTranscriber isAssetPending]();
  }

  return 1;
}

- (void)_downloadAndInstallSpeechRecognizer
{
  uint64_t v1 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "downloadState"));
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_23C242000, v2, v3, "Transcriber: Downloading asset can't start, state: %@", v4, v5, v6, v7, v8);
}

void __54__AXLTTranscriber__downloadAndInstallSpeechRecognizer__block_invoke(uint64_t a1, uint64_t a2)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __54__AXLTTranscriber__downloadAndInstallSpeechRecognizer__block_invoke_2;
  v2[3] = &unk_264E39A18;
  v2[4] = *(void *)(a1 + 32);
  v2[5] = a2;
  dispatch_async(MEMORY[0x263EF83A0], v2);
}

void __54__AXLTTranscriber__downloadAndInstallSpeechRecognizer__block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = AXLogLiveTranscription();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v6 = 134217984;
    uint64_t v7 = v3;
    _os_log_impl(&dword_23C242000, v2, OS_LOG_TYPE_DEFAULT, "Transcriber: Language asset download fractionCompleted %lu", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v4 = [*(id *)(a1 + 32) transcriptionCallback];

  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 32) transcriptionCallback];
    v5[2](v5, 0, *(void *)(a1 + 40), 1);
  }
}

void __54__AXLTTranscriber__downloadAndInstallSpeechRecognizer__block_invoke_285(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __54__AXLTTranscriber__downloadAndInstallSpeechRecognizer__block_invoke_2_286;
  v6[3] = &unk_264E398D8;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __54__AXLTTranscriber__downloadAndInstallSpeechRecognizer__block_invoke_2_286(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = AXLogLiveTranscription();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v10 = 138412290;
    uint64_t v11 = v3;
    _os_log_impl(&dword_23C242000, v2, OS_LOG_TYPE_DEFAULT, "Transcriber: Language asset finished, error: %@", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) transcriptionCallback];

  if (v4)
  {
    if (v5)
    {
      int v6 = [*(id *)(a1 + 40) transcriptionCallback];
      uint64_t v7 = -1;
      v6[2](v6, 0, -1, 1);
    }
    else
    {
      uint64_t v7 = -1;
    }
  }
  else
  {
    if (v5)
    {
      uint64_t v8 = [*(id *)(a1 + 40) transcriptionCallback];
      v8[2](v8, 0, 100, 1);
    }
    objc_msgSend(*(id *)(a1 + 40), "resumeTranscriptionForPID:", objc_msgSend(*(id *)(a1 + 40), "pid"));
    uint64_t v7 = 100;
  }
  return [*(id *)(a1 + 40) setDownloadState:v7];
}

- (void)_handleAssetDownloadError:(id)a3
{
  uint64_t v4 = [(AXLTTranscriber *)self transcriptionCallback];
  v4[2](v4, 0, -1, 1);

  [(AXLTTranscriber *)self setDownloadState:-1];
}

- (void)speechRecognitionDidDetectSpeech:(id)a3
{
  uint64_t v3 = AXLogLiveTranscription();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[AXLTTranscriber speechRecognitionDidDetectSpeech:]();
  }
}

- (void)speechRecognitionTaskFinishedReadingAudio:(id)a3
{
  uint64_t v3 = AXLogLiveTranscription();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[AXLTTranscriber speechRecognitionTaskFinishedReadingAudio:]();
  }
}

- (void)speechRecognitionTaskWasCancelled:(id)a3
{
  uint64_t v3 = AXLogLiveTranscription();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[AXLTTranscriber speechRecognitionTaskWasCancelled:]();
  }
}

- (void)speechRecognitionTask:(id)a3 didFinishSuccessfully:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = AXLogLiveTranscription();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[AXLTTranscriber speechRecognitionTask:didFinishSuccessfully:]();
  }

  if (!a4)
  {
    uint64_t v8 = AXLogLiveTranscription();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_23C242000, v8, OS_LOG_TYPE_DEFAULT, "Transcriber: Task was unsuccessful", v12, 2u);
    }
  }
  [(AXLTTranscriber *)self setCurrentTranscription:0];
  v9 = [(AXLTTranscriber *)self transcriptionCallback];

  if (v9)
  {
    int v10 = [(AXLTTranscriber *)self transcriptionCallback];
    uint64_t v11 = [(AXLTTranscriber *)self recognitionTask];
    v10[2](v10, 0, -2, [v6 isEqual:v11]);
  }
}

- (void)speechRecognitionTask:(id)a3 didHypothesizeTranscription:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = AXLogLiveTranscription();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[AXLTTranscriber speechRecognitionTask:didHypothesizeTranscription:](v7);
  }

  v9 = [(AXLTTranscriber *)self transcriptionCallback];

  if (v9)
  {
    int v10 = [AXLTTranscription alloc];
    uint64_t v11 = [(AXLTTranscriber *)self currentTranscription];
    uint64_t v12 = [(AXLTTranscription *)v10 initWithRecognitionTask:v6 transcription:v7 previousTranscription:v11];

    [(AXLTTranscriber *)self setCurrentTranscription:v12];
    int v13 = [(AXLTTranscriber *)self transcriptionCallback];
    uint64_t v14 = [(AXLTTranscriber *)self currentTranscription];
    __int16 v15 = [(AXLTTranscriber *)self recognitionTask];
    ((void (**)(void, void *, uint64_t, uint64_t))v13)[2](v13, v14, -2, [v6 isEqual:v15]);
  }
}

- (void)speechRecognitionTask:(id)a3 didFinishRecognition:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = AXLogLiveTranscription();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[AXLTTranscriber speechRecognitionTask:didFinishRecognition:]();
  }

  [(AXLTTranscriber *)self setCurrentTranscription:0];
  v9 = [(AXLTTranscriber *)self transcriptionCallback];

  if (v9)
  {
    int v10 = [AXLTTranscription alloc];
    uint64_t v11 = [v7 bestTranscription];
    uint64_t v12 = [(AXLTTranscriber *)self currentTranscription];
    int v13 = [(AXLTTranscription *)v10 initWithRecognitionTask:v6 transcription:v11 previousTranscription:v12];

    uint64_t v14 = [(AXLTTranscriber *)self transcriptionCallback];
    __int16 v15 = [(AXLTTranscriber *)self recognitionTask];
    ((void (**)(void, AXLTTranscription *, uint64_t, uint64_t))v14)[2](v14, v13, -2, [v6 isEqual:v15]);
  }
  __int16 v16 = [(AXLTTranscriber *)self completionCallback];

  if (v16)
  {
    __int16 v17 = [(AXLTTranscriber *)self completionCallback];
    v17[2]();
  }
}

- (float)_coalsecingTime
{
  if (_coalsecingTime_onceToken != -1) {
    dispatch_once(&_coalsecingTime_onceToken, &__block_literal_global_2);
  }
  [(id)_coalsecingTime_s_userDefaults floatForKey:@"CoalesceCaptionsTimeKey"];
  if (result == 0.0) {
    return 0.5;
  }
  return result;
}

uint64_t __34__AXLTTranscriber__coalsecingTime__block_invoke()
{
  _coalsecingTime_s_userDefaults = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.accessibility.LiveCaptions"];
  return MEMORY[0x270F9A758]();
}

- (int64_t)downloadState
{
  return self->_downloadState;
}

- (void)setDownloadState:(int64_t)a3
{
  self->_downloadState = a3;
}

- (BOOL)noPunctuation
{
  return self->_noPunctuation;
}

- (void)setNoPunctuation:(BOOL)a3
{
  self->_noPunctuation = a3;
}

- (int64_t)taskHint
{
  return self->_taskHint;
}

- (void)setTaskHint:(int64_t)a3
{
  self->_taskHint = a3;
}

- (SFSpeechRecognizer)recognizer
{
  return self->_recognizer;
}

- (void)setRecognizer:(id)a3
{
}

- (SFSpeechAudioBufferRecognitionRequest)recognitionRequest
{
  return self->_recognitionRequest;
}

- (void)setRecognitionRequest:(id)a3
{
}

- (SFSpeechRecognitionTask)recognitionTask
{
  return self->_recognitionTask;
}

- (void)setRecognitionTask:(id)a3
{
}

- (AXLTTranscription)currentTranscription
{
  return self->_currentTranscription;
}

- (void)setCurrentTranscription:(id)a3
{
}

- (id)transcriptionCallback
{
  return objc_getProperty(self, a2, 64, 1);
}

- (void)setTranscriptionCallback:(id)a3
{
}

- (id)completionCallback
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)setCompletionCallback:(id)a3
{
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (NSString)appName
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setAppName:(id)a3
{
}

- (BOOL)isTranscribing
{
  return self->_isTranscribing;
}

- (void)setIsTranscribing:(BOOL)a3
{
  self->_isTranscribing = a3;
}

- (BOOL)isPending
{
  return self->_isPending;
}

- (void)setIsPending:(BOOL)a3
{
  self->_isPending = a3;
}

- (AXLTLanguageAssetManager)languageAssetManager
{
  return (AXLTLanguageAssetManager *)objc_getProperty(self, a2, 88, 1);
}

- (void)setLanguageAssetManager:(id)a3
{
}

- (NSTimer)audioBufferTimeoutTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 96, 1);
}

- (void)setAudioBufferTimeoutTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioBufferTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_languageAssetManager, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong(&self->_completionCallback, 0);
  objc_storeStrong(&self->_transcriptionCallback, 0);
  objc_storeStrong((id *)&self->_currentTranscription, 0);
  objc_storeStrong((id *)&self->_recognitionTask, 0);
  objc_storeStrong((id *)&self->_recognitionRequest, 0);
  objc_storeStrong((id *)&self->_recognizer, 0);
}

- (void)startTranscriptionForPID:appName:callback:completionCallback:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_23C242000, v0, OS_LOG_TYPE_DEBUG, "Transcriber: Can't start transcription for app, asset is not ready: %@", v1, 0xCu);
}

- (void)startTranscriptionForPID:(NSObject *)a3 appName:callback:completionCallback:.cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v6 = [a2 appName];
  id v7 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a2, "pid"));
  int v8 = 138412802;
  uint64_t v9 = a1;
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_23C242000, a3, OS_LOG_TYPE_DEBUG, "Transcriber: Can't start transcription for app: %@, transcribing for app: %@, pid: %@", (uint8_t *)&v8, 0x20u);
}

- (void)stopTranscriptionForPID:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_23C242000, v0, v1, "Transcriber: signaling recognition task finish", v2, v3, v4, v5, v6);
}

- (void)stopTranscriptionForPID:(uint64_t)a1 .cold.2(uint64_t a1, void *a2)
{
  uint64_t v3 = [NSNumber numberWithInt:a1];
  uint64_t v4 = [a2 appName];
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a2, "pid"));
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_23C242000, v6, v7, "Transcriber: Can't stop transcription for pid: %@, active app: %@, pid %@", v8, v9, v10, v11, 2u);
}

- (void)resumeTranscriptionForPID:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_23C242000, v0, v1, "Transcriber: Resume transcription, already transcribing, no action", v2, v3, v4, v5, v6);
}

- (void)resumeTranscriptionForPID:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1 = NSNumber;
  uint64_t v2 = [a1 recognitionRequest];
  uint64_t v3 = objc_msgSend(v1, "numberWithBool:", objc_msgSend(v2, "addsPunctuation"));
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_23C242000, v4, v5, "addsPunctuation is set to: %@", v6, v7, v8, v9, v10);
}

- (void)resumeTranscriptionForPID:(uint64_t)a1 .cold.3(uint64_t a1, void *a2)
{
  uint64_t v3 = [NSNumber numberWithInt:a1];
  uint64_t v4 = [a2 appName];
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a2, "pid"));
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_23C242000, v6, v7, "Transcriber: Can't resume transcription for pid: %@, active app: %@, pid: %@", v8, v9, v10, v11, 2u);
}

- (void)appendAudioPCMBuffer:(NSObject *)a3 forPID:.cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a1, "frameCapacity"));
  uint64_t v6 = [a2 appName];
  int v7 = 138412546;
  uint64_t v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_debug_impl(&dword_23C242000, a3, OS_LOG_TYPE_DEBUG, "Transcriber: appendAudioPCMBuffer buffer size: %@, app: %@", (uint8_t *)&v7, 0x16u);
}

- (void)isAssetPending
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_23C242000, v0, v1, "Transcriber: Asset downloading is in progress", v2, v3, v4, v5, v6);
}

- (void)speechRecognitionDidDetectSpeech:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_23C242000, v0, v1, "speechRecognitionDidDetectSpeech:(SFSpeechRecognitionTask *)task", v2, v3, v4, v5, v6);
}

- (void)speechRecognitionTaskFinishedReadingAudio:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_23C242000, v0, v1, "speechRecognitionTaskFinishedReadingAudio:(SFSpeechRecognitionTask *)task", v2, v3, v4, v5, v6);
}

- (void)speechRecognitionTaskWasCancelled:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_23C242000, v0, v1, "speechRecognitionTaskWasCancelled:(SFSpeechRecognitionTask *)task", v2, v3, v4, v5, v6);
}

- (void)speechRecognitionTask:didFinishSuccessfully:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_23C242000, v0, v1, "speechRecognitionTask:(SFSpeechRecognitionTask *)task didFinishSuccessfully:(BOOL)successfully", v2, v3, v4, v5, v6);
}

- (void)speechRecognitionTask:(void *)a1 didHypothesizeTranscription:.cold.1(void *a1)
{
  uint64_t v1 = [a1 formattedString];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_23C242000, v2, v3, "Transcriber: transcription didHypothesizeTranscription: %@", v4, v5, v6, v7, v8);
}

- (void)speechRecognitionTask:didFinishRecognition:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_23C242000, v0, v1, "Transcriber: transcription didFinishRecognition", v2, v3, v4, v5, v6);
}

@end
@interface AXLTSpeechTranscriber
- (AVAudioEngine)audioEngine;
- (AVAudioSession)audioSession;
- (AXLTSpeechTranscriber)initWithDelegate:(id)a3;
- (AXLTTranscriber)transcriber;
- (AXLTTranscriberDelegateProtocol)delegate;
- (BOOL)isTranscribing;
- (BOOL)startTranscription:(id *)a3;
- (BOOL)stopTranscription:(id *)a3;
- (NSDate)bufferLogTime;
- (NSDate)sessionStartTime;
- (NSDate)textLogTime;
- (int)pid;
- (void)audioEngineConfigurationDidChange:(id)a3;
- (void)calcHistogramForBuffer:(id)a3;
- (void)cleanUp;
- (void)initializeAudioTap;
- (void)mediaServicesWereReset:(id)a3;
- (void)resetTranscription;
- (void)setAudioEngine:(id)a3;
- (void)setAudioSession:(id)a3;
- (void)setBufferLogTime:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsTranscribing:(BOOL)a3;
- (void)setPid:(int)a3;
- (void)setSessionStartTime:(id)a3;
- (void)setTextLogTime:(id)a3;
- (void)setTranscriber:(id)a3;
- (void)setupAudioSession;
- (void)setupTranscriberIfNeeded;
@end

@implementation AXLTSpeechTranscriber

- (AXLTSpeechTranscriber)initWithDelegate:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXLTSpeechTranscriber;
  v5 = [(AXLTSpeechTranscriber *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_pid = -4;
    v6->_isTranscribing = 0;
    v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 addObserver:v6 selector:sel_audioEngineConfigurationDidChange_ name:*MEMORY[0x263EF9020] object:0];
  }
  return v6;
}

- (BOOL)startTranscription:(id *)a3
{
  id v4 = AXLogLiveTranscription();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[AXLTSpeechTranscriber startTranscription:](v4);
  }

  if (![(AXLTSpeechTranscriber *)self isTranscribing])
  {
    v6 = +[AXLTTranscriber sharedInstance];
    [(AXLTSpeechTranscriber *)self setTranscriber:v6];

    v7 = [(AXLTSpeechTranscriber *)self transcriber];
    uint64_t v8 = [v7 downloadState];

    if (v8 == -1)
    {
      id v13 = [(AXLTSpeechTranscriber *)self transcriber];
      [v13 setDownloadState:-2];
    }
    else
    {
      objc_super v9 = [MEMORY[0x263EFF910] date];
      sessionStartTime = self->_sessionStartTime;
      self->_sessionStartTime = v9;

      [(AXLTSpeechTranscriber *)self setupAudioSession];
      [(AXLTSpeechTranscriber *)self initializeAudioTap];
      v11 = [(AXLTSpeechTranscriber *)self audioEngine];
      [v11 prepare];

      v12 = [(AXLTSpeechTranscriber *)self audioEngine];
      id v16 = 0;
      [v12 startAndReturnError:&v16];
      id v13 = v16;

      if (!v13) {
        goto LABEL_10;
      }
      v14 = AXLogLiveTranscription();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[AXLTSpeechTranscriber startTranscription:](v13, v14);
      }

      if ([v13 code] == -10868)
      {
LABEL_10:
        BOOL v5 = 1;
        [(AXLTSpeechTranscriber *)self setIsTranscribing:1];
LABEL_14:

        return v5;
      }
      [(AXLTSpeechTranscriber *)self cleanUp];
    }
    BOOL v5 = 0;
    goto LABEL_14;
  }
  return 1;
}

- (void)initializeAudioTap
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23C242000, v0, v1, "error initializing audio engine: %@", v2, v3, v4, v5, v6);
}

void __43__AXLTSpeechTranscriber_initializeAudioTap__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = AXLogLiveTranscription();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __43__AXLTSpeechTranscriber_initializeAudioTap__block_invoke_cold_1(v3, v4);
  }

  [*(id *)(a1 + 32) setupTranscriberIfNeeded];
  [*(id *)(a1 + 32) calcHistogramForBuffer:v3];
  uint64_t v5 = [*(id *)(a1 + 32) transcriber];
  objc_msgSend(v5, "appendAudioPCMBuffer:forPID:", v3, objc_msgSend(*(id *)(a1 + 32), "pid"));

  uint8_t v6 = +[AXLTAudioTextDumper sharedInstance];
  v7 = [*(id *)(a1 + 32) sessionStartTime];
  [v6 saveAudioBuffer:v3 appName:@"Mic" sessionStartTime:v7];

  uint64_t v8 = [*(id *)(a1 + 32) bufferLogTime];
  if (!v8) {
    goto LABEL_5;
  }
  objc_super v9 = (void *)v8;
  v10 = [MEMORY[0x263EFF910] now];
  v11 = [*(id *)(a1 + 32) bufferLogTime];
  [v10 timeIntervalSinceDate:v11];
  double v13 = v12;

  if (v13 > 5.0)
  {
LABEL_5:
    v14 = AXLogLiveTranscription();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v3, "frameCapacity"));
      int v17 = 138412290;
      v18 = v15;
      _os_log_impl(&dword_23C242000, v14, OS_LOG_TYPE_DEFAULT, "Sent audio buffer with size: %@ for Mic", (uint8_t *)&v17, 0xCu);
    }
    id v16 = [MEMORY[0x263EFF910] now];
    [*(id *)(a1 + 32) setBufferLogTime:v16];
  }
}

- (void)setupAudioSession
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23C242000, v0, v1, "Audio session setup category error: %@", v2, v3, v4, v5, v6);
}

- (void)mediaServicesWereReset:(id)a3
{
  id v3 = a3;
  uint64_t v4 = AXLogLiveTranscription();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[AXLTSpeechTranscriber mediaServicesWereReset:]();
  }
}

- (void)setupTranscriberIfNeeded
{
  id v3 = [(AXLTSpeechTranscriber *)self transcriber];
  char v4 = objc_msgSend(v3, "isTranscribingForPID:", -[AXLTSpeechTranscriber pid](self, "pid"));

  if ((v4 & 1) == 0)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __49__AXLTSpeechTranscriber_setupTranscriberIfNeeded__block_invoke;
    block[3] = &unk_264E398B0;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __49__AXLTSpeechTranscriber_setupTranscriberIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) transcriber];
  uint64_t v3 = [*(id *)(a1 + 32) pid];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __49__AXLTSpeechTranscriber_setupTranscriberIfNeeded__block_invoke_2;
  v5[3] = &unk_264E39888;
  uint64_t v6 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __49__AXLTSpeechTranscriber_setupTranscriberIfNeeded__block_invoke_288;
  v4[3] = &unk_264E398B0;
  v4[4] = v6;
  [v2 startTranscriptionForPID:v3 appName:@"liveCaptions.microphone" callback:v5 completionCallback:v4];
}

void __49__AXLTSpeechTranscriber_setupTranscriberIfNeeded__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v6 = AXLogLiveTranscription();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __49__AXLTSpeechTranscriber_setupTranscriberIfNeeded__block_invoke_2_cold_1();
  }

  uint64_t v7 = [*(id *)(a1 + 32) textLogTime];
  if (!v7) {
    goto LABEL_5;
  }
  uint64_t v8 = (void *)v7;
  objc_super v9 = [MEMORY[0x263EFF910] now];
  v10 = [*(id *)(a1 + 32) textLogTime];
  [v9 timeIntervalSinceDate:v10];
  double v12 = v11;

  if (v12 > 5.0)
  {
LABEL_5:
    double v13 = AXLogLiveTranscription();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = NSNumber;
      v15 = [v5 formattedString];
      id v16 = objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v15, "length"));
      *(_DWORD *)buf = 138412290;
      v29 = v16;
      _os_log_impl(&dword_23C242000, v13, OS_LOG_TYPE_DEFAULT, "Transcribed text: %@ for Mic", buf, 0xCu);
    }
    int v17 = [MEMORY[0x263EFF910] now];
    [*(id *)(a1 + 32) setTextLogTime:v17];
  }
  v18 = [AXLTTranscribedData alloc];
  uint64_t v19 = [MEMORY[0x263EFF910] date];
  uint64_t v20 = getpid();
  v21 = AXLCLocString(@"liveCaptions.microphone");
  LOBYTE(v27) = 0;
  v22 = [(AXLTTranscribedData *)v18 initWithTranscription:v5 requestType:0 timestamp:v19 pid:v20 appID:@"Mic" appName:v21 downloadProgress:a3 silence:v27];

  v23 = [*(id *)(a1 + 32) delegate];
  [v23 transcriberOutputData:v22];

  v24 = +[AXLTAudioTextDumper sharedInstance];
  v25 = [v5 formattedString];
  v26 = [*(id *)(a1 + 32) sessionStartTime];
  [v24 saveTranscribedText:v25 appName:@"Mic" sessionStartTime:v26];
}

void __49__AXLTSpeechTranscriber_setupTranscriberIfNeeded__block_invoke_288(uint64_t a1)
{
  uint64_t v2 = [AXLTTranscribedData alloc];
  uint64_t v3 = [MEMORY[0x263EFF910] date];
  uint64_t v4 = getpid();
  id v5 = AXLCLocString(@"liveCaptions.microphone");
  LOBYTE(v7) = 0;
  uint64_t v8 = [(AXLTTranscribedData *)v2 initWithTranscription:0 requestType:0 timestamp:v3 pid:v4 appID:@"Mic" appName:v5 downloadProgress:-2 silence:v7];

  uint64_t v6 = [*(id *)(a1 + 32) delegate];
  [v6 transcriberOutputData:v8];
}

- (void)calcHistogramForBuffer:(id)a3
{
  id v4 = a3;
  id v5 = [(AXLTSpeechTranscriber *)self transcriber];
  int v6 = objc_msgSend(v5, "isTranscribingForPID:", -[AXLTSpeechTranscriber pid](self, "pid"));

  if (v6)
  {
    uint64_t v7 = +[AXLTHistogramCalculator histogramForAudioPCMBuffer:v4];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __48__AXLTSpeechTranscriber_calcHistogramForBuffer___block_invoke;
    v9[3] = &unk_264E398D8;
    id v10 = v7;
    double v11 = self;
    id v8 = v7;
    dispatch_async(MEMORY[0x263EF83A0], v9);
  }
}

void __48__AXLTSpeechTranscriber_calcHistogramForBuffer___block_invoke(uint64_t a1)
{
  uint64_t v3 = [[AXLTAudioInfo alloc] initWithAudioInfo:*(void *)(a1 + 32) requestType:0 pid:getpid()];
  uint64_t v2 = [*(id *)(a1 + 40) delegate];
  [v2 audioInfoData:v3];
}

- (BOOL)stopTranscription:(id *)a3
{
  id v4 = AXLogLiveTranscription();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[AXLTSpeechTranscriber stopTranscription:](v4);
  }

  if ([(AXLTSpeechTranscriber *)self isTranscribing])
  {
    [(AXLTSpeechTranscriber *)self cleanUp];
    [(AXLTSpeechTranscriber *)self setIsTranscribing:0];
  }
  return 1;
}

- (void)resetTranscription
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23C242000, v0, v1, "Reset transcription, stop error: %@", v2, v3, v4, v5, v6);
}

- (void)audioEngineConfigurationDidChange:(id)a3
{
  if ([(AXLTSpeechTranscriber *)self isTranscribing])
  {
    [(AXLTSpeechTranscriber *)self resetTranscription];
  }
}

- (void)cleanUp
{
  uint64_t v3 = AXLogLiveTranscription();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23C242000, v3, OS_LOG_TYPE_DEFAULT, "MicTranscriber: clean up", buf, 2u);
  }

  uint64_t v4 = [(AXLTSpeechTranscriber *)self audioEngine];

  if (v4)
  {
    uint64_t v5 = [(AXLTSpeechTranscriber *)self audioEngine];
    uint8_t v6 = [v5 inputNode];
    [v6 removeTapOnBus:0];

    uint64_t v7 = [(AXLTSpeechTranscriber *)self audioEngine];
    [v7 stop];

    [(AXLTSpeechTranscriber *)self setAudioEngine:0];
  }
  id v8 = [(AXLTSpeechTranscriber *)self audioSession];
  uint64_t v14 = 0;
  [v8 setActive:0 withOptions:1 error:&v14];

  objc_super v9 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v10 = *MEMORY[0x263EF90F8];
  double v11 = [(AXLTSpeechTranscriber *)self audioSession];
  [v9 removeObserver:self name:v10 object:v11];

  double v12 = [(AXLTSpeechTranscriber *)self transcriber];
  objc_msgSend(v12, "stopTranscriptionForPID:", -[AXLTSpeechTranscriber pid](self, "pid"));

  double v13 = +[AXLTAudioTextDumper sharedInstance];
  [v13 cleanUp];
}

- (BOOL)isTranscribing
{
  return self->_isTranscribing;
}

- (void)setIsTranscribing:(BOOL)a3
{
  self->_isTranscribing = a3;
}

- (AXLTTranscriberDelegateProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AXLTTranscriberDelegateProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AVAudioEngine)audioEngine
{
  return self->_audioEngine;
}

- (void)setAudioEngine:(id)a3
{
}

- (AVAudioSession)audioSession
{
  return self->_audioSession;
}

- (void)setAudioSession:(id)a3
{
}

- (AXLTTranscriber)transcriber
{
  return self->_transcriber;
}

- (void)setTranscriber:(id)a3
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

- (NSDate)bufferLogTime
{
  return self->_bufferLogTime;
}

- (void)setBufferLogTime:(id)a3
{
}

- (NSDate)textLogTime
{
  return self->_textLogTime;
}

- (void)setTextLogTime:(id)a3
{
}

- (NSDate)sessionStartTime
{
  return self->_sessionStartTime;
}

- (void)setSessionStartTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionStartTime, 0);
  objc_storeStrong((id *)&self->_textLogTime, 0);
  objc_storeStrong((id *)&self->_bufferLogTime, 0);
  objc_storeStrong((id *)&self->_transcriber, 0);
  objc_storeStrong((id *)&self->_audioSession, 0);
  objc_storeStrong((id *)&self->_audioEngine, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)startTranscription:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_23C242000, a2, OS_LOG_TYPE_ERROR, "error starting audioengine: %@", v4, 0xCu);
}

- (void)startTranscription:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_23C242000, log, OS_LOG_TYPE_DEBUG, "start speech transcription", v1, 2u);
}

void __43__AXLTSpeechTranscriber_initializeAudioTap__block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v3[0] = 67109120;
  v3[1] = [a1 frameLength];
  _os_log_debug_impl(&dword_23C242000, a2, OS_LOG_TYPE_DEBUG, "mic tap block: %d", (uint8_t *)v3, 8u);
}

- (void)mediaServicesWereReset:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23C242000, v0, v1, "Media Services notification: %@", v2, v3, v4, v5, v6);
}

void __49__AXLTSpeechTranscriber_setupTranscriberIfNeeded__block_invoke_2_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_23C242000, v0, OS_LOG_TYPE_DEBUG, "download progress: %ld", v1, 0xCu);
}

- (void)stopTranscription:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_23C242000, log, OS_LOG_TYPE_DEBUG, "stop speech transcription", v1, 2u);
}

@end
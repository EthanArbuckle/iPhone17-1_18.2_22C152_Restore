@interface AXLTTestTranscriber
- (AXLTTestTranscriber)initWithDelegate:(id)a3;
- (AXLTTranscriberDelegateProtocol)delegate;
- (BOOL)isTranscribing;
- (BOOL)startTranscription:(id *)a3;
- (BOOL)stopTranscription:(id *)a3;
- (OS_dispatch_source)dispatchSource;
- (void)setDelegate:(id)a3;
- (void)setDispatchSource:(id)a3;
- (void)setIsTranscribing:(BOOL)a3;
@end

@implementation AXLTTestTranscriber

- (AXLTTestTranscriber)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AXLTTestTranscriber;
  v5 = [(AXLTTestTranscriber *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_isTranscribing = 0;
  }

  return v6;
}

- (BOOL)startTranscription:(id *)a3
{
  id v4 = AXLogLiveTranscription();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[AXLTTestTranscriber startTranscription:]();
  }

  if (![(AXLTTestTranscriber *)self isTranscribing])
  {
    v5 = dispatch_get_global_queue(0, 0);
    dispatch_source_t v6 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v5);
    [(AXLTTestTranscriber *)self setDispatchSource:v6];

    dispatch_time_t v7 = dispatch_time(0, 0);
    objc_super v8 = [(AXLTTestTranscriber *)self dispatchSource];
    dispatch_source_set_timer(v8, v7, 0x3B9ACA00uLL, 0);

    v9 = [(AXLTTestTranscriber *)self dispatchSource];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __42__AXLTTestTranscriber_startTranscription___block_invoke;
    handler[3] = &unk_264E398B0;
    handler[4] = self;
    dispatch_source_set_event_handler(v9, handler);

    v10 = [(AXLTTestTranscriber *)self dispatchSource];
    dispatch_resume(v10);

    v11 = AXLogLiveTranscription();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[AXLTTestTranscriber startTranscription:]();
    }

    [(AXLTTestTranscriber *)self setIsTranscribing:1];
  }
  return 1;
}

void __42__AXLTTestTranscriber_startTranscription___block_invoke(uint64_t a1)
{
  v2 = AXLogLiveTranscription();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __42__AXLTTestTranscriber_startTranscription___block_invoke_cold_1();
  }

  v3 = [AXLTTranscribedData alloc];
  id v4 = [MEMORY[0x263EFF910] date];
  LOBYTE(v7) = 0;
  v5 = [(AXLTTranscribedData *)v3 initWithTranscribedText:@"This is a test" requestType:2 timestamp:v4 pid:getpid() appID:@"LiveTranscriptionService" appName:@"LiveTranscriptionService" downloadProgress:-2 silence:v7];

  dispatch_source_t v6 = [*(id *)(a1 + 32) delegate];
  [v6 transcriberOutputData:v5];
}

- (BOOL)stopTranscription:(id *)a3
{
  id v4 = AXLogLiveTranscription();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[AXLTTestTranscriber stopTranscription:]();
  }

  if ([(AXLTTestTranscriber *)self isTranscribing])
  {
    v5 = [(AXLTTestTranscriber *)self dispatchSource];
    dispatch_suspend(v5);

    dispatch_source_t v6 = AXLogLiveTranscription();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[AXLTTestTranscriber stopTranscription:]();
    }

    [(AXLTTestTranscriber *)self setIsTranscribing:0];
  }
  return 1;
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

- (OS_dispatch_source)dispatchSource
{
  return self->_dispatchSource;
}

- (void)setDispatchSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)startTranscription:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_23C242000, v0, v1, "starting transcription for testing", v2, v3, v4, v5, v6);
}

- (void)startTranscription:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_23C242000, v0, v1, "start test transcription", v2, v3, v4, v5, v6);
}

void __42__AXLTTestTranscriber_startTranscription___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_23C242000, v0, v1, "reporting test transcribed data", v2, v3, v4, v5, v6);
}

- (void)stopTranscription:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_23C242000, v0, v1, "stopping transcription for testing", v2, v3, v4, v5, v6);
}

- (void)stopTranscription:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_23C242000, v0, v1, "stop test transcription", v2, v3, v4, v5, v6);
}

@end
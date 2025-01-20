@interface AXLTAudioTextDumper
+ (AXLTAudioTextDumper)sharedInstance;
+ (BOOL)isInternalInstall;
- (AVAudioFile)audioFile;
- (AXLTAudioTextDumper)init;
- (NSString)filePath;
- (NSString)textFileName;
- (OS_dispatch_queue)saveQueue;
- (void)cleanUp;
- (void)init;
- (void)saveAudioBuffer:(id)a3 appName:(id)a4 sessionStartTime:(id)a5;
- (void)saveTranscribedText:(id)a3 appName:(id)a4 sessionStartTime:(id)a5;
- (void)setAudioFile:(id)a3;
- (void)setFilePath:(id)a3;
- (void)setSaveQueue:(id)a3;
- (void)setTextFileName:(id)a3;
@end

@implementation AXLTAudioTextDumper

+ (AXLTAudioTextDumper)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_4);
  }
  v2 = (void *)sharedInstance__shared_0;
  return (AXLTAudioTextDumper *)v2;
}

uint64_t __37__AXLTAudioTextDumper_sharedInstance__block_invoke()
{
  sharedInstance__shared_0 = objc_alloc_init(AXLTAudioTextDumper);
  return MEMORY[0x270F9A758]();
}

- (AXLTAudioTextDumper)init
{
  v13.receiver = self;
  v13.super_class = (Class)AXLTAudioTextDumper;
  id v2 = [(AXLTAudioTextDumper *)&v13 init];
  if (v2)
  {
    v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
    int v4 = [v3 BOOLForKey:@"saveTranscribedTextAndAudio"];
    if (v4) {
      LOBYTE(v4) = +[AXLTAudioTextDumper isInternalInstall];
    }
    *((unsigned char *)v2 + 8) = v4;

    v5 = AXLogLiveTranscription();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      [(AXLTAudioTextDumper *)(unsigned __int8 *)v2 + 8 init];
    }

    if (*((unsigned char *)v2 + 8))
    {
      dispatch_queue_t v6 = dispatch_queue_create("com.apple.accessibility.LiveTranscriptione.audioOutTranscriberSaveQueue", 0);
      v7 = (void *)*((void *)v2 + 5);
      *((void *)v2 + 5) = v6;

      uint64_t v8 = NSTemporaryDirectory();
      v9 = (void *)*((void *)v2 + 4);
      *((void *)v2 + 4) = v8;

      v10 = AXLogLiveTranscription();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        [(AXLTAudioTextDumper *)(uint64_t *)v2 + 4 init];
      }
    }
  }
  return (AXLTAudioTextDumper *)v2;
}

- (void)saveAudioBuffer:(id)a3 appName:(id)a4 sessionStartTime:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_dumpTestData)
  {
    saveQueue = self->_saveQueue;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __64__AXLTAudioTextDumper_saveAudioBuffer_appName_sessionStartTime___block_invoke;
    v12[3] = &unk_264E39AB8;
    v12[4] = self;
    id v13 = v8;
    id v14 = v9;
    id v15 = v10;
    dispatch_async(saveQueue, v12);
  }
}

void __64__AXLTAudioTextDumper_saveAudioBuffer_appName_sessionStartTime___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) audioFile];

  if (v2)
  {
    id v3 = 0;
  }
  else
  {
    id v4 = objc_alloc_init(MEMORY[0x263F08790]);
    [v4 setDateFormat:@"yyyy-MM-dd_HH-mm-ss"];
    v5 = [*(id *)(a1 + 40) format];
    dispatch_queue_t v6 = [v5 settings];
    v7 = (void *)[v6 mutableCopy];

    id v8 = [NSNumber numberWithInt:1463899717];
    [v7 setObject:v8 forKeyedSubscript:*MEMORY[0x263EF9038]];

    id v9 = [*(id *)(a1 + 32) filePath];
    id v10 = NSString;
    uint64_t v11 = *(void *)(a1 + 48);
    v12 = [v4 stringFromDate:*(void *)(a1 + 56)];
    id v13 = [v10 stringWithFormat:@"audio_%@_%@.wav", v11, v12];
    id v14 = [v9 stringByAppendingPathComponent:v13];

    id v15 = AXLogLiveTranscription();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      __64__AXLTAudioTextDumper_saveAudioBuffer_appName_sessionStartTime___block_invoke_cold_2();
    }

    v16 = [NSURL fileURLWithPath:v14];
    id v17 = objc_alloc(MEMORY[0x263EF9380]);
    v18 = [*(id *)(a1 + 40) format];
    uint64_t v19 = [v18 commonFormat];
    v20 = [*(id *)(a1 + 40) format];
    id v27 = 0;
    v21 = objc_msgSend(v17, "initForWriting:settings:commonFormat:interleaved:error:", v16, v7, v19, objc_msgSend(v20, "isInterleaved"), &v27);
    id v3 = v27;
    [*(id *)(a1 + 32) setAudioFile:v21];

    if (v3)
    {
      v22 = AXLogLiveTranscription();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        __64__AXLTAudioTextDumper_saveAudioBuffer_appName_sessionStartTime___block_invoke_cold_1();
      }
    }
  }
  v23 = [*(id *)(a1 + 32) audioFile];
  uint64_t v24 = *(void *)(a1 + 40);
  id v26 = v3;
  [v23 writeFromBuffer:v24 error:&v26];
  id v25 = v26;
}

- (void)saveTranscribedText:(id)a3 appName:(id)a4 sessionStartTime:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_dumpTestData && [v8 length])
  {
    uint64_t v11 = [MEMORY[0x263EFF910] date];
    saveQueue = self->_saveQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __68__AXLTAudioTextDumper_saveTranscribedText_appName_sessionStartTime___block_invoke;
    block[3] = &unk_264E39AE0;
    block[4] = self;
    id v15 = v9;
    id v16 = v10;
    id v17 = v11;
    id v18 = v8;
    id v13 = v11;
    dispatch_async(saveQueue, block);
  }
}

void __68__AXLTAudioTextDumper_saveTranscribedText_appName_sessionStartTime___block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  id v3 = [*(id *)(a1 + 32) textFileName];

  if (!v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F08790]);
    [v4 setDateFormat:@"yyyy-MM-dd_HH-mm-ss"];
    v5 = [*(id *)(a1 + 32) filePath];
    dispatch_queue_t v6 = NSString;
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = [v4 stringFromDate:*(void *)(a1 + 48)];
    id v9 = [v6 stringWithFormat:@"transcribed_text_%@_%@.txt", v7, v8];
    id v10 = [v5 stringByAppendingPathComponent:v9];
    [*(id *)(a1 + 32) setTextFileName:v10];

    uint64_t v11 = [MEMORY[0x263F08850] defaultManager];
    v12 = [*(id *)(a1 + 32) textFileName];
    [v11 createFileAtPath:v12 contents:0 attributes:0];

    id v13 = AXLogLiveTranscription();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      __68__AXLTAudioTextDumper_saveTranscribedText_appName_sessionStartTime___block_invoke_cold_1(v2, v13);
    }
  }
  id v14 = (void *)MEMORY[0x263F08840];
  id v15 = [*(id *)(a1 + 32) textFileName];
  id v16 = [v14 fileHandleForUpdatingAtPath:v15];

  [v16 seekToEndOfFile];
  id v17 = objc_alloc_init(MEMORY[0x263F08790]);
  [v17 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
  id v18 = [v17 stringFromDate:*(void *)(a1 + 56)];
  uint64_t v19 = [NSString stringWithFormat:@"%@ %@ %@ %@\n", v18, @"Speech", *(void *)(a1 + 40), *(void *)(a1 + 64)];
  v20 = [v19 dataUsingEncoding:4];
  [v16 writeData:v20];
  [v16 closeFile];
}

- (void)cleanUp
{
  if (self->_dumpTestData)
  {
    saveQueue = self->_saveQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __30__AXLTAudioTextDumper_cleanUp__block_invoke;
    block[3] = &unk_264E398B0;
    block[4] = self;
    dispatch_async(saveQueue, block);
  }
}

uint64_t __30__AXLTAudioTextDumper_cleanUp__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setTextFileName:0];
  id v2 = *(void **)(a1 + 32);
  return [v2 setAudioFile:0];
}

+ (BOOL)isInternalInstall
{
  if (isInternalInstall__AXIsInternalInstallOnceToken != -1) {
    dispatch_once(&isInternalInstall__AXIsInternalInstallOnceToken, &__block_literal_global_31);
  }
  return isInternalInstall__AXIsInternalInstall;
}

uint64_t __40__AXLTAudioTextDumper_isInternalInstall__block_invoke()
{
  uint64_t result = os_variant_has_internal_ui();
  isInternalInstall__AXIsInternalInstall = result;
  return result;
}

- (AVAudioFile)audioFile
{
  return self->_audioFile;
}

- (void)setAudioFile:(id)a3
{
}

- (NSString)textFileName
{
  return self->_textFileName;
}

- (void)setTextFileName:(id)a3
{
}

- (NSString)filePath
{
  return self->_filePath;
}

- (void)setFilePath:(id)a3
{
}

- (OS_dispatch_queue)saveQueue
{
  return self->_saveQueue;
}

- (void)setSaveQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saveQueue, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
  objc_storeStrong((id *)&self->_textFileName, 0);
  objc_storeStrong((id *)&self->_audioFile, 0);
}

- (void)init
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = [NSNumber numberWithBool:*a1];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_23C242000, a2, v4, "Should dump test data: %@", v5);
}

void __64__AXLTAudioTextDumper_saveAudioBuffer_appName_sessionStartTime___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_23C242000, v0, OS_LOG_TYPE_ERROR, "error %@", v1, 0xCu);
}

void __64__AXLTAudioTextDumper_saveAudioBuffer_appName_sessionStartTime___block_invoke_cold_2()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_23C242000, v0, v1, "Audio file path is %@", v2);
}

void __68__AXLTAudioTextDumper_saveTranscribedText_appName_sessionStartTime___block_invoke_cold_1(id *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [*a1 textFileName];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_23C242000, a2, v4, "Text log file path is %@", v5);
}

@end
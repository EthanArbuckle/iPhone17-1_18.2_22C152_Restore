@interface BKUIPearlAudioSession
+ (id)_loadSound:(id)a3;
- (AVAudioEngine)audioEngine;
- (AVAudioPCMBuffer)completeSoundBuffer;
- (AVAudioPCMBuffer)endSoundBuffer;
- (AVAudioPCMBuffer)failSoundBuffer;
- (AVAudioPCMBuffer)lockSoundBuffer;
- (AVAudioPCMBuffer)scanSoundBuffer;
- (BKUIPearlAudioSession)init;
- (id)_setupMediaStack;
- (void)_mediaServicesConnectionWasLost:(id)a3;
- (void)_mediaServicesReconnect:(id)a3;
- (void)dealloc;
- (void)init;
- (void)play;
- (void)scheduleBuffer:(id)a3 atTime:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6;
- (void)scheduleBuffer:(id)a3 completionHandler:(id)a4;
- (void)stop;
@end

@implementation BKUIPearlAudioSession

+ (id)_loadSound:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F28B50];
  id v4 = a3;
  v5 = [v3 bundleForClass:objc_opt_class()];
  v6 = [v5 URLForResource:v4 withExtension:@"caf"];

  if (v6)
  {
    id v18 = 0;
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F15390]) initForReading:v6 error:&v18];
    id v8 = v18;
    if (v7)
    {
      id v9 = objc_alloc(MEMORY[0x1E4F153B0]);
      v10 = [v7 processingFormat];
      v11 = objc_msgSend(v9, "initWithPCMFormat:frameCapacity:", v10, objc_msgSend(v7, "length"));

      id v17 = v8;
      char v12 = [v7 readIntoBuffer:v11 error:&v17];
      id v13 = v17;

      if (v12)
      {
        v11 = v11;
        v14 = v11;
      }
      else
      {
        v15 = _BKUILoggingFacility();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v20 = v13;
          _os_log_impl(&dword_1E4B6C000, v15, OS_LOG_TYPE_DEFAULT, "Failed to read audio file into buffer: %@", buf, 0xCu);
        }

        v14 = 0;
      }
    }
    else
    {
      v11 = _BKUILoggingFacility();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v8;
        _os_log_impl(&dword_1E4B6C000, v11, OS_LOG_TYPE_DEFAULT, "Failed to create audio file: %@", buf, 0xCu);
      }
      v14 = 0;
      id v13 = v8;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BKUIPearlAudioSession)init
{
  v21.receiver = self;
  v21.super_class = (Class)BKUIPearlAudioSession;
  v2 = [(BKUIPearlAudioSession *)&v21 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.biometrickitui.avPlayerNodeOperationQueue", 0);
    avPlayerNodeOperationQueue = v2->_avPlayerNodeOperationQueue;
    v2->_avPlayerNodeOperationQueue = (OS_dispatch_queue *)v3;

    uint64_t v5 = +[BKUIPearlAudioSession _loadSound:@"PearlEnrollment_Lock-D22"];
    lockSoundBuffer = v2->_lockSoundBuffer;
    v2->_lockSoundBuffer = (AVAudioPCMBuffer *)v5;

    uint64_t v7 = +[BKUIPearlAudioSession _loadSound:@"PearlEnrollment_Scan-D22"];
    scanSoundBuffer = v2->_scanSoundBuffer;
    v2->_scanSoundBuffer = (AVAudioPCMBuffer *)v7;

    uint64_t v9 = +[BKUIPearlAudioSession _loadSound:@"PearlEnrollment_Complete-D22"];
    completeSoundBuffer = v2->_completeSoundBuffer;
    v2->_completeSoundBuffer = (AVAudioPCMBuffer *)v9;

    uint64_t v11 = +[BKUIPearlAudioSession _loadSound:@"PearlEnrollment_End-D22"];
    endSoundBuffer = v2->_endSoundBuffer;
    v2->_endSoundBuffer = (AVAudioPCMBuffer *)v11;

    uint64_t v13 = +[BKUIPearlAudioSession _loadSound:@"PearlEnrollment_Fail-D22"];
    failSoundBuffer = v2->_failSoundBuffer;
    v2->_failSoundBuffer = (AVAudioPCMBuffer *)v13;

    v15 = [(BKUIPearlAudioSession *)v2 _setupMediaStack];
    if (v15)
    {
      v16 = _BKUILoggingFacility();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        [(BKUIPearlAudioSession *)(uint64_t)v15 init];
      }

      char v17 = 0;
    }
    else
    {
      char v17 = 1;
    }
    v2->_mediaServicesConnected = v17;
    id v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v18 addObserver:v2 selector:sel__mediaServicesReconnect_ name:*MEMORY[0x1E4F15048] object:0];

    v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v19 addObserver:v2 selector:sel__mediaServicesConnectionWasLost_ name:*MEMORY[0x1E4F15030] object:0];
  }
  return v2;
}

- (void)scheduleBuffer:(id)a3 atTime:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  avPlayerNodeOperationQueue = self->_avPlayerNodeOperationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__BKUIPearlAudioSession_scheduleBuffer_atTime_options_completionHandler___block_invoke;
  block[3] = &unk_1E6EA30A8;
  block[4] = self;
  id v18 = v10;
  id v20 = v12;
  unint64_t v21 = a5;
  id v19 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(avPlayerNodeOperationQueue, block);
}

void *__73__BKUIPearlAudioSession_scheduleBuffer_atTime_options_completionHandler___block_invoke(void *result)
{
  uint64_t v1 = result[4];
  if (*(unsigned char *)(v1 + 72)) {
    return (void *)[*(id *)(v1 + 16) scheduleBuffer:result[5] atTime:result[6] options:result[8] completionHandler:result[7]];
  }
  return result;
}

- (void)scheduleBuffer:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  avPlayerNodeOperationQueue = self->_avPlayerNodeOperationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__BKUIPearlAudioSession_scheduleBuffer_completionHandler___block_invoke;
  block[3] = &unk_1E6EA2290;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(avPlayerNodeOperationQueue, block);
}

void *__58__BKUIPearlAudioSession_scheduleBuffer_completionHandler___block_invoke(void *result)
{
  uint64_t v1 = result[4];
  if (*(unsigned char *)(v1 + 72)) {
    return (void *)[*(id *)(v1 + 16) scheduleBuffer:result[5] completionHandler:result[6]];
  }
  return result;
}

- (void)play
{
  avPlayerNodeOperationQueue = self->_avPlayerNodeOperationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__BKUIPearlAudioSession_play__block_invoke;
  block[3] = &unk_1E6EA20C0;
  block[4] = self;
  dispatch_async(avPlayerNodeOperationQueue, block);
}

uint64_t __29__BKUIPearlAudioSession_play__block_invoke(uint64_t result)
{
  if (*(unsigned char *)(*(void *)(result + 32) + 72))
  {
    uint64_t v1 = result;
    v2 = _BKUILoggingFacility();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_queue_t v3 = 0;
      _os_log_impl(&dword_1E4B6C000, v2, OS_LOG_TYPE_DEFAULT, "Audio node play called.", v3, 2u);
    }

    return [*(id *)(*(void *)(v1 + 32) + 16) play];
  }
  return result;
}

- (void)stop
{
  avPlayerNodeOperationQueue = self->_avPlayerNodeOperationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__BKUIPearlAudioSession_stop__block_invoke;
  block[3] = &unk_1E6EA20C0;
  block[4] = self;
  dispatch_async(avPlayerNodeOperationQueue, block);
}

uint64_t __29__BKUIPearlAudioSession_stop__block_invoke(uint64_t result)
{
  if (*(unsigned char *)(*(void *)(result + 32) + 72))
  {
    uint64_t v1 = result;
    v2 = _BKUILoggingFacility();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_queue_t v3 = 0;
      _os_log_impl(&dword_1E4B6C000, v2, OS_LOG_TYPE_DEFAULT, "Audio node stop called.", v3, 2u);
    }

    return [*(id *)(*(void *)(v1 + 32) + 16) stop];
  }
  return result;
}

- (void)_mediaServicesReconnect:(id)a3
{
  avPlayerNodeOperationQueue = self->_avPlayerNodeOperationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__BKUIPearlAudioSession__mediaServicesReconnect___block_invoke;
  block[3] = &unk_1E6EA20C0;
  block[4] = self;
  dispatch_async(avPlayerNodeOperationQueue, block);
}

void __49__BKUIPearlAudioSession__mediaServicesReconnect___block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 72))
  {
    v2 = _BKUILoggingFacility();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_1E4B6C000, v2, OS_LOG_TYPE_DEFAULT, "_mediaServicesReconnect called", v5, 2u);
    }

    dispatch_queue_t v3 = [*(id *)(a1 + 32) _setupMediaStack];
    if (v3)
    {
      id v4 = _BKUILoggingFacility();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        __49__BKUIPearlAudioSession__mediaServicesReconnect___block_invoke_cold_1((uint64_t)v3, v4);
      }
    }
    else
    {
      *(unsigned char *)(*(void *)(a1 + 32) + 72) = 1;
    }
  }
}

- (void)_mediaServicesConnectionWasLost:(id)a3
{
  id v4 = _BKUILoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4B6C000, v4, OS_LOG_TYPE_DEFAULT, "_mediaServicesConnectionWasLost called, niling cleaning up media stack", buf, 2u);
  }

  self->_mediaServicesConnected = 0;
  avPlayerNodeOperationQueue = self->_avPlayerNodeOperationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__BKUIPearlAudioSession__mediaServicesConnectionWasLost___block_invoke;
  block[3] = &unk_1E6EA20C0;
  block[4] = self;
  dispatch_async(avPlayerNodeOperationQueue, block);
}

void __57__BKUIPearlAudioSession__mediaServicesConnectionWasLost___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) stop];
  [*(id *)(*(void *)(a1 + 32) + 8) detachNode:*(void *)(*(void *)(a1 + 32) + 16)];
  uint64_t v2 = *(void *)(a1 + 32);
  dispatch_queue_t v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = 0;
}

- (id)_setupMediaStack
{
  dispatch_queue_t v3 = (AVAudioPlayerNode *)objc_alloc_init(MEMORY[0x1E4F153D0]);
  audioNode = self->_audioNode;
  self->_audioNode = v3;

  uint64_t v5 = (AVAudioEngine *)objc_alloc_init(MEMORY[0x1E4F15380]);
  audioEngine = self->_audioEngine;
  self->_audioEngine = v5;

  [(AVAudioEngine *)self->_audioEngine attachNode:self->_audioNode];
  id v7 = self->_audioEngine;
  id v8 = self->_audioNode;
  id v9 = [(AVAudioEngine *)v7 mainMixerNode];
  id v10 = [(AVAudioPCMBuffer *)self->_lockSoundBuffer format];
  [(AVAudioEngine *)v7 connect:v8 to:v9 format:v10];

  id v11 = self->_audioEngine;
  id v14 = 0;
  [(AVAudioEngine *)v11 startAndReturnError:&v14];
  id v12 = v14;

  return v12;
}

- (void)dealloc
{
  dispatch_queue_t v3 = _BKUILoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4B6C000, v3, OS_LOG_TYPE_DEFAULT, "BKUIPearlAudioSession dealloc.", buf, 2u);
  }

  uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  self->_mediaServicesConnected = 0;
  [(AVAudioEngine *)self->_audioEngine stop];
  [(AVAudioEngine *)self->_audioEngine detachNode:self->_audioNode];
  v5.receiver = self;
  v5.super_class = (Class)BKUIPearlAudioSession;
  [(BKUIPearlAudioSession *)&v5 dealloc];
}

- (AVAudioEngine)audioEngine
{
  return self->_audioEngine;
}

- (AVAudioPCMBuffer)lockSoundBuffer
{
  return self->_lockSoundBuffer;
}

- (AVAudioPCMBuffer)scanSoundBuffer
{
  return self->_scanSoundBuffer;
}

- (AVAudioPCMBuffer)completeSoundBuffer
{
  return self->_completeSoundBuffer;
}

- (AVAudioPCMBuffer)endSoundBuffer
{
  return self->_endSoundBuffer;
}

- (AVAudioPCMBuffer)failSoundBuffer
{
  return self->_failSoundBuffer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avPlayerNodeOperationQueue, 0);
  objc_storeStrong((id *)&self->_failSoundBuffer, 0);
  objc_storeStrong((id *)&self->_endSoundBuffer, 0);
  objc_storeStrong((id *)&self->_completeSoundBuffer, 0);
  objc_storeStrong((id *)&self->_scanSoundBuffer, 0);
  objc_storeStrong((id *)&self->_lockSoundBuffer, 0);
  objc_storeStrong((id *)&self->_audioNode, 0);

  objc_storeStrong((id *)&self->_audioEngine, 0);
}

- (void)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E4B6C000, a2, OS_LOG_TYPE_ERROR, "Failed to start audio engine: %@", (uint8_t *)&v2, 0xCu);
}

void __49__BKUIPearlAudioSession__mediaServicesReconnect___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E4B6C000, a2, OS_LOG_TYPE_ERROR, "Failed to start audio engine for _mediaServicesReconnect: %@", (uint8_t *)&v2, 0xCu);
}

@end
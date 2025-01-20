@interface AXSDVoiceTriggerModelManager
- (AXSDVoiceTriggerModelManager)initWithError:(id *)a3;
- (AXSDVoiceTriggerModelManagerDelegate)delegate;
- (OS_dispatch_queue)analyzerQueue;
- (OS_dispatch_queue)processingQueue;
- (id)_readConfigFileWithError:(id *)a3;
- (void)_startListening;
- (void)_startListeningWithFormat:(id)a3;
- (void)_stopListening;
- (void)_stopListeningWithError:(id)a3;
- (void)modelDidUpdate:(id)a3 assetVersion:(unint64_t)a4 withError:(id)a5;
- (void)processAudioBuffer:(id)a3 atTime:(id)a4;
- (void)request:(id)a3 didFailWithError:(id)a4;
- (void)request:(id)a3 didProduceResult:(id)a4;
- (void)setAnalyzerQueue:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setProcessingQueue:(id)a3;
- (void)startListening;
- (void)startListeningWithFormat:(id)a3;
- (void)stopListening;
- (void)stopListeningWithError:(id)a3;
@end

@implementation AXSDVoiceTriggerModelManager

- (AXSDVoiceTriggerModelManager)initWithError:(id *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)AXSDVoiceTriggerModelManager;
  v3 = [(AXSDVoiceTriggerModelManager *)&v13 init];
  v4 = v3;
  if (v3)
  {
    v3->_startRequested = 0;
    format = v3->_format;
    v3->_format = 0;

    assetPath = v4->_assetPath;
    v4->_assetPath = 0;

    v7 = [[AXSDVoiceTriggerAssetManager alloc] initWithDelegate:v4];
    assetManager = v4->_assetManager;
    v4->_assetManager = v7;

    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.accessibility.axsoundactions.analyzer", v9);
    analyzerQueue = v4->_analyzerQueue;
    v4->_analyzerQueue = (OS_dispatch_queue *)v10;
  }
  return v4;
}

- (OS_dispatch_queue)processingQueue
{
  return self->_analyzerQueue;
}

- (void)startListeningWithFormat:(id)a3
{
  id v4 = a3;
  analyzerQueue = self->_analyzerQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__AXSDVoiceTriggerModelManager_startListeningWithFormat___block_invoke;
  v7[3] = &unk_2647F4A58;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(analyzerQueue, v7);
}

uint64_t __57__AXSDVoiceTriggerModelManager_startListeningWithFormat___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startListeningWithFormat:*(void *)(a1 + 40)];
}

- (void)_startListeningWithFormat:(id)a3
{
  objc_storeStrong((id *)&self->_format, a3);
  self->_startRequested = 1;
  if (self->_assetPath)
  {
    [(AXSDVoiceTriggerModelManager *)self _startListening];
  }
}

- (void)startListening
{
  analyzerQueue = self->_analyzerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__AXSDVoiceTriggerModelManager_startListening__block_invoke;
  block[3] = &unk_2647F49E0;
  block[4] = self;
  dispatch_async(analyzerQueue, block);
}

uint64_t __46__AXSDVoiceTriggerModelManager_startListening__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startListening];
}

- (void)_startListening
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 16);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_226F20000, a2, OS_LOG_TYPE_DEBUG, "AXSDVoiceTriggerModelManager: startListeningWithFormat: %@", (uint8_t *)&v3, 0xCu);
}

- (void)processAudioBuffer:(id)a3 atTime:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  analyzerQueue = self->_analyzerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__AXSDVoiceTriggerModelManager_processAudioBuffer_atTime___block_invoke;
  block[3] = &unk_2647F4AD0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(analyzerQueue, block);
}

uint64_t __58__AXSDVoiceTriggerModelManager_processAudioBuffer_atTime___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = [*(id *)(a1 + 48) sampleTime];
  return [v2 analyzeAudioBuffer:v1 atAudioFramePosition:v3];
}

- (void)stopListening
{
  analyzerQueue = self->_analyzerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__AXSDVoiceTriggerModelManager_stopListening__block_invoke;
  block[3] = &unk_2647F49E0;
  block[4] = self;
  dispatch_async(analyzerQueue, block);
}

uint64_t __45__AXSDVoiceTriggerModelManager_stopListening__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopListeningWithError:0];
}

- (void)_stopListening
{
}

- (void)stopListeningWithError:(id)a3
{
  analyzerQueue = self->_analyzerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__AXSDVoiceTriggerModelManager_stopListeningWithError___block_invoke;
  block[3] = &unk_2647F49E0;
  block[4] = self;
  dispatch_async(analyzerQueue, block);
}

uint64_t __55__AXSDVoiceTriggerModelManager_stopListeningWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopListeningWithError:0];
}

- (void)_stopListeningWithError:(id)a3
{
  self->_startRequested = 0;
  streamAnalyzer = self->_streamAnalyzer;
  id v5 = a3;
  [(SNAudioStreamAnalyzer *)streamAnalyzer removeAllRequests];
  id v6 = self->_streamAnalyzer;
  self->_streamAnalyzer = 0;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained listeningStoppedWithError:v5];
}

- (void)request:(id)a3 didProduceResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AXLogSoundActions();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[AXSDVoiceTriggerModelManager request:didProduceResult:]((uint64_t)v7, v8);
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [(AXSDVoiceTriggerModelManager *)self delegate];
    [v9 receivedObservation:v7 forDetector:v6];
  }
}

- (void)request:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AXLogSoundActions();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[AXSDVoiceTriggerModelManager request:didFailWithError:]((uint64_t)v6, (uint64_t)v7, v8);
  }

  id v9 = [(AXSDVoiceTriggerModelManager *)self delegate];
  [v9 receivedError:v7 fromDetector:v6];
}

- (id)_readConfigFileWithError:(id *)a3
{
  uint64_t v4 = [(NSURL *)self->_assetPath URLByAppendingPathComponent:@"VoiceTriggerConfig"];
  id v5 = [v4 URLByAppendingPathExtension:@"json"];

  if (!v5)
  {
    if (a3)
    {
      v11 = (void *)MEMORY[0x263F087E8];
      id v12 = @"Cannot locate config file";
LABEL_11:
      objc_msgSend(v11, "ax_errorWithDomain:description:", @"VoiceTrigger", v12, v14);
      id v8 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
LABEL_12:
    id v8 = 0;
    goto LABEL_14;
  }
  uint64_t v6 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v5];
  if (!v6)
  {
    if (a3)
    {
      v11 = (void *)MEMORY[0x263F087E8];
      v14 = v5;
      id v12 = @"Cannot read config file: %@";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  id v7 = (void *)v6;
  id v15 = 0;
  id v8 = [MEMORY[0x263F08900] JSONObjectWithData:v6 options:0 error:&v15];
  id v9 = v15;
  if (v9)
  {
    id v10 = v9;
    if (a3) {
      *a3 = v9;
    }

    goto LABEL_12;
  }

LABEL_14:
  return v8;
}

- (void)modelDidUpdate:(id)a3 assetVersion:(unint64_t)a4 withError:(id)a5
{
  id v6 = a3;
  id v9 = a5;
  id v7 = v9;
  id v8 = v6;
  AXPerformBlockOnMainThread();
}

void __70__AXSDVoiceTriggerModelManager_modelDidUpdate_assetVersion_withError___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), *(id *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 40))
  {
    if (*(unsigned char *)(v2 + 32))
    {
      uint64_t v3 = *(NSObject **)(v2 + 64);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __70__AXSDVoiceTriggerModelManager_modelDidUpdate_assetVersion_withError___block_invoke_2;
      block[3] = &unk_2647F49E0;
      block[4] = v2;
      dispatch_async(v3, block);
    }
  }
  else
  {
    uint64_t v4 = *(NSObject **)(v2 + 64);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __70__AXSDVoiceTriggerModelManager_modelDidUpdate_assetVersion_withError___block_invoke_3;
    v5[3] = &unk_2647F4A58;
    v5[4] = v2;
    id v6 = *(id *)(a1 + 48);
    dispatch_async(v4, v5);
  }
}

uint64_t __70__AXSDVoiceTriggerModelManager_modelDidUpdate_assetVersion_withError___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startListening];
}

uint64_t __70__AXSDVoiceTriggerModelManager_modelDidUpdate_assetVersion_withError___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopListeningWithError:*(void *)(a1 + 40)];
}

- (AXSDVoiceTriggerModelManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AXSDVoiceTriggerModelManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setProcessingQueue:(id)a3
{
}

- (OS_dispatch_queue)analyzerQueue
{
  return self->_analyzerQueue;
}

- (void)setAnalyzerQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyzerQueue, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_assetPath, 0);
  objc_storeStrong((id *)&self->_assetManager, 0);
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_streamAnalyzer, 0);
}

- (void)request:(uint64_t)a1 didProduceResult:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_226F20000, a2, OS_LOG_TYPE_DEBUG, "AXSDVoiceTriggerModelManager: didProduceResult: %@", (uint8_t *)&v2, 0xCu);
}

- (void)request:(os_log_t)log didFailWithError:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_226F20000, log, OS_LOG_TYPE_ERROR, "Voice Trigger Request failed: %@, %@", (uint8_t *)&v3, 0x16u);
}

@end
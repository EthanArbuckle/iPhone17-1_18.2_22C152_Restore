@interface CSAudioStreamActivityMonitor
+ (id)sharedInstance;
- (BOOL)hasNonVoiceTriggerStreamsActive;
- (BOOL)hasNonVoiceTriggerStreamsOrStreamHoldersActive;
- (CSAudioStreamActivityMonitor)init;
- (OS_dispatch_queue)queue;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
- (void)notifyActiveStreamsChanged:(id)a3 streamHolders:(id)a4 streamId:(unint64_t)a5;
- (void)setHasNonVoiceTriggerStreamsActive:(BOOL)a3;
- (void)setQueue:(id)a3;
@end

@implementation CSAudioStreamActivityMonitor

- (void).cxx_destruct
{
}

- (void)setHasNonVoiceTriggerStreamsActive:(BOOL)a3
{
  self->_hasNonVoiceTriggerStreamsActive = a3;
}

- (BOOL)hasNonVoiceTriggerStreamsActive
{
  return self->_hasNonVoiceTriggerStreamsActive;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)hasNonVoiceTriggerStreamsOrStreamHoldersActive
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __78__CSAudioStreamActivityMonitor_hasNonVoiceTriggerStreamsOrStreamHoldersActive__block_invoke;
  v5[3] = &unk_1E6200F40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __78__CSAudioStreamActivityMonitor_hasNonVoiceTriggerStreamsOrStreamHoldersActive__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 24);
  return result;
}

- (void)notifyActiveStreamsChanged:(id)a3 streamHolders:(id)a4 streamId:(unint64_t)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v40 objects:v49 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v41;
    while (2)
    {
      id v13 = v8;
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v41 != v12) {
          objc_enumerationMutation(v9);
        }
        v15 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        v16 = [v15 streamRequest];
        if ([v16 clientIdentity] == 3)
        {

LABEL_13:
          v20 = (void *)CSLogContextFacilityCoreSpeech;
          char v19 = 1;
          id v8 = v13;
          if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
          {
            v21 = v20;
            v22 = [v15 name];
            *(_DWORD *)buf = 136315394;
            v46 = "-[CSAudioStreamActivityMonitor notifyActiveStreamsChanged:streamHolders:streamId:]";
            __int16 v47 = 2112;
            v48 = v22;
            _os_log_impl(&dword_1BA1A5000, v21, OS_LOG_TYPE_INFO, "%s stream %@ is active", buf, 0x16u);
          }
          goto LABEL_15;
        }
        v17 = [v15 streamRequest];
        uint64_t v18 = [v17 clientIdentity];

        if (v18 == 4) {
          goto LABEL_13;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v40 objects:v49 count:16];
      char v19 = 0;
      id v8 = v13;
      if (v11) {
        continue;
      }
      break;
    }
  }
  else
  {
    char v19 = 0;
  }
LABEL_15:

  long long v39 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v36 = 0u;
  id v23 = v8;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v37;
    while (2)
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v37 != v26) {
          objc_enumerationMutation(v23);
        }
        v28 = *(void **)(*((void *)&v36 + 1) + 8 * j);
        if ([v28 clientIdentity] == 6)
        {
          v29 = (void *)CSLogContextFacilityCoreSpeech;
          char v19 = 1;
          if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
          {
            v30 = v29;
            v31 = [v28 name];
            *(_DWORD *)buf = 136315394;
            v46 = "-[CSAudioStreamActivityMonitor notifyActiveStreamsChanged:streamHolders:streamId:]";
            __int16 v47 = 2112;
            v48 = v31;
            _os_log_impl(&dword_1BA1A5000, v30, OS_LOG_TYPE_INFO, "%s streamHolder %@ is active", buf, 0x16u);
          }
          goto LABEL_26;
        }
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v36 objects:v44 count:16];
      if (v25) {
        continue;
      }
      break;
    }
  }
LABEL_26:

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__CSAudioStreamActivityMonitor_notifyActiveStreamsChanged_streamHolders_streamId___block_invoke;
  block[3] = &unk_1E61FFE00;
  block[4] = self;
  char v35 = v19;
  dispatch_async(queue, block);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __82__CSAudioStreamActivityMonitor_notifyActiveStreamsChanged_streamHolders_streamId___block_invoke_2;
  v33[3] = &unk_1E6201240;
  v33[4] = self;
  [(CSEventMonitor *)self enumerateObserversInQueue:v33];
}

uint64_t __82__CSAudioStreamActivityMonitor_notifyActiveStreamsChanged_streamHolders_streamId___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setHasNonVoiceTriggerStreamsActive:*(unsigned __int8 *)(a1 + 40)];
}

uint64_t __82__CSAudioStreamActivityMonitor_notifyActiveStreamsChanged_streamHolders_streamId___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) notifyObserver:a2];
}

- (void)_stopMonitoring
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    v4 = "-[CSAudioStreamActivityMonitor _stopMonitoring]";
    _os_log_impl(&dword_1BA1A5000, v2, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : audio stream activity", (uint8_t *)&v3, 0xCu);
  }
}

- (void)_startMonitoringWithQueue:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[CSAudioStreamActivityMonitor _startMonitoringWithQueue:]";
    _os_log_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_DEFAULT, "%s Start monitoring : audio stream activity", (uint8_t *)&v4, 0xCu);
  }
}

- (CSAudioStreamActivityMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)CSAudioStreamActivityMonitor;
  v2 = [(CSEventMonitor *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSAudioStreamActivityMonitor", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1432 != -1) {
    dispatch_once(&sharedInstance_onceToken_1432, &__block_literal_global_1433);
  }
  v2 = (void *)sharedInstance_monitor;
  return v2;
}

uint64_t __46__CSAudioStreamActivityMonitor_sharedInstance__block_invoke()
{
  sharedInstance_monitor = objc_alloc_init(CSAudioStreamActivityMonitor);
  return MEMORY[0x1F41817F8]();
}

@end
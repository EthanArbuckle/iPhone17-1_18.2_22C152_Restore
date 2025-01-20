@interface CSSiriClientBehaviorMonitor
+ (id)sharedInstance;
- (BOOL)isStreaming;
- (CSAudioRecordContext)audioRecordContext;
- (CSSiriClientBehaviorMonitor)init;
- (NSHashTable)observers;
- (NSString)deviceId;
- (NSString)recordRoute;
- (OS_dispatch_queue)queue;
- (void)notifyActivateAudioSessionWithReason:(unint64_t)a3;
- (void)notifyAudioDeviceInfoUpdated:(id)a3;
- (void)notifyDidStartStreamWithContext:(id)a3 successfully:(BOOL)a4 option:(id)a5 withEventUUID:(id)a6;
- (void)notifyDidStopStream:(id)a3 withEventUUID:(id)a4;
- (void)notifyFetchedSiriClientAudioStream:(id)a3 successfully:(BOOL)a4;
- (void)notifyPreparedSiriClientAudioStream:(id)a3 successfully:(BOOL)a4;
- (void)notifyReleaseAudioSession;
- (void)notifyWillStartStreamWithContext:(id)a3 option:(id)a4 withEventUUID:(id)a5;
- (void)notifyWillStopStream:(id)a3 reason:(unint64_t)a4 withEventUUID:(id)a5;
- (void)registerObserver:(id)a3;
- (void)setAudioRecordContext:(id)a3;
- (void)setDeviceId:(id)a3;
- (void)setIsStreaming:(BOOL)a3;
- (void)setObservers:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRecordRoute:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CSSiriClientBehaviorMonitor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_deviceId, 0);
  objc_storeStrong((id *)&self->_recordRoute, 0);
  objc_storeStrong((id *)&self->_audioRecordContext, 0);
}

- (void)setIsStreaming:(BOOL)a3
{
  self->_isStreaming = a3;
}

- (void)setObservers:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setDeviceId:(id)a3
{
}

- (NSString)deviceId
{
  return self->_deviceId;
}

- (void)setRecordRoute:(id)a3
{
}

- (NSString)recordRoute
{
  return self->_recordRoute;
}

- (void)setAudioRecordContext:(id)a3
{
}

- (CSAudioRecordContext)audioRecordContext
{
  return self->_audioRecordContext;
}

- (BOOL)isStreaming
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__CSSiriClientBehaviorMonitor_isStreaming__block_invoke;
  v5[3] = &unk_1E6200F40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __42__CSSiriClientBehaviorMonitor_isStreaming__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 8);
  return result;
}

- (void)notifyAudioDeviceInfoUpdated:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__CSSiriClientBehaviorMonitor_notifyAudioDeviceInfoUpdated___block_invoke;
  v7[3] = &unk_1E6201030;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __60__CSSiriClientBehaviorMonitor_notifyAudioDeviceInfoUpdated___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v21 = "-[CSSiriClientBehaviorMonitor notifyAudioDeviceInfoUpdated:]_block_invoke";
    _os_log_impl(&dword_1BA1A5000, v2, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  char v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) recordDeviceInfo];
  v5 = [v4 route];
  [v3 setRecordRoute:v5];

  id v6 = *(void **)(a1 + 32);
  v7 = [*(id *)(a1 + 40) recordDeviceInfo];
  id v8 = [v7 remoteDeviceUIDString];
  [v6 setDeviceId:v8];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  char v9 = objc_msgSend(*(id *)(a1 + 32), "observers", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v15 + 1) + 8 * v13);
        if (objc_opt_respondsToSelector()) {
          [v14 siriClientBehaviorMonitorAudioDeviceInfoUpdated:*(void *)(a1 + 40)];
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
}

- (void)notifyReleaseAudioSession
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__CSSiriClientBehaviorMonitor_notifyReleaseAudioSession__block_invoke;
  block[3] = &unk_1E6201288;
  block[4] = self;
  dispatch_async(queue, block);
}

void __56__CSSiriClientBehaviorMonitor_notifyReleaseAudioSession__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    long long v15 = "-[CSSiriClientBehaviorMonitor notifyReleaseAudioSession]_block_invoke";
    _os_log_impl(&dword_1BA1A5000, v2, OS_LOG_TYPE_DEFAULT, "%s Notify release of audio session", buf, 0xCu);
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  char v3 = objc_msgSend(*(id *)(a1 + 32), "observers", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 siriClientBehaviorMonitorReleasedAudioSession:*(void *)(a1 + 32)];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)notifyActivateAudioSessionWithReason:(unint64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __68__CSSiriClientBehaviorMonitor_notifyActivateAudioSessionWithReason___block_invoke;
  v4[3] = &unk_1E6201378;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

void __68__CSSiriClientBehaviorMonitor_notifyActivateAudioSessionWithReason___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 136315394;
    uint64_t v16 = "-[CSSiriClientBehaviorMonitor notifyActivateAudioSessionWithReason:]_block_invoke";
    __int16 v17 = 2048;
    uint64_t v18 = v3;
    _os_log_impl(&dword_1BA1A5000, v2, OS_LOG_TYPE_DEFAULT, "%s reason: %lu", buf, 0x16u);
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "observers", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v9 siriClientBehaviorMonitor:*(void *)(a1 + 32) activatedAudioSessionWithReason:*(void *)(a1 + 40)];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)notifyDidStopStream:(id)a3 withEventUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__CSSiriClientBehaviorMonitor_notifyDidStopStream_withEventUUID___block_invoke;
  block[3] = &unk_1E6200E38;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __65__CSSiriClientBehaviorMonitor_notifyDidStopStream_withEventUUID___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    long long v15 = "-[CSSiriClientBehaviorMonitor notifyDidStopStream:withEventUUID:]_block_invoke";
    _os_log_impl(&dword_1BA1A5000, v2, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "observers", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        [v8 siriClientBehaviorMonitor:*(void *)(a1 + 32) didStopStream:*(void *)(a1 + 40) withEventUUID:*(void *)(a1 + 48)];
        if (objc_opt_respondsToSelector()) {
          [v8 siriClientBehaviorMonitor:*(void *)(a1 + 32) didChangedRecordState:0 withEventUUID:*(void *)(a1 + 48) withContext:0];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)notifyWillStopStream:(id)a3 reason:(unint64_t)a4 withEventUUID:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__CSSiriClientBehaviorMonitor_notifyWillStopStream_reason_withEventUUID___block_invoke;
  v13[3] = &unk_1E6200E68;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

void __73__CSSiriClientBehaviorMonitor_notifyWillStopStream_reason_withEventUUID___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v15 = "-[CSSiriClientBehaviorMonitor notifyWillStopStream:reason:withEventUUID:]_block_invoke";
    _os_log_impl(&dword_1BA1A5000, v2, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "observers", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        [v8 siriClientBehaviorMonitor:*(void *)(a1 + 32) willStopStream:*(void *)(a1 + 40) reason:*(void *)(a1 + 56)];
        if (objc_opt_respondsToSelector()) {
          [v8 siriClientBehaviorMonitor:*(void *)(a1 + 32) willStopStream:*(void *)(a1 + 40) reason:*(void *)(a1 + 56) withEventUUID:*(void *)(a1 + 48)];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)notifyDidStartStreamWithContext:(id)a3 successfully:(BOOL)a4 option:(id)a5 withEventUUID:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__CSSiriClientBehaviorMonitor_notifyDidStartStreamWithContext_successfully_option_withEventUUID___block_invoke;
  block[3] = &unk_1E62006D8;
  block[4] = self;
  id v18 = v10;
  BOOL v21 = a4;
  id v19 = v11;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(queue, block);
}

void __97__CSSiriClientBehaviorMonitor_notifyDidStartStreamWithContext_successfully_option_withEventUUID___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v17 = "-[CSSiriClientBehaviorMonitor notifyDidStartStreamWithContext:successfully:option:withEventUUID:]_block_invoke";
    _os_log_impl(&dword_1BA1A5000, v2, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = (void *)[*(id *)(a1 + 40) copy];
  [v3 setAudioRecordContext:v4];

  *(unsigned char *)(*(void *)(a1 + 32) + 8) = *(unsigned char *)(a1 + 64);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "observers", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        [v10 siriClientBehaviorMonitor:*(void *)(a1 + 32) didStartStreamWithContext:*(void *)(a1 + 40) successfully:*(unsigned __int8 *)(a1 + 64) option:*(void *)(a1 + 48) withEventUUID:*(void *)(a1 + 56)];
        if (*(unsigned char *)(a1 + 64) && (objc_opt_respondsToSelector() & 1) != 0) {
          [v10 siriClientBehaviorMonitor:*(void *)(a1 + 32) didChangedRecordState:1 withEventUUID:*(void *)(a1 + 56) withContext:*(void *)(a1 + 40)];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)notifyWillStartStreamWithContext:(id)a3 option:(id)a4 withEventUUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __85__CSSiriClientBehaviorMonitor_notifyWillStartStreamWithContext_option_withEventUUID___block_invoke;
  v15[3] = &unk_1E6201088;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

void __85__CSSiriClientBehaviorMonitor_notifyWillStartStreamWithContext_option_withEventUUID___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v17 = "-[CSSiriClientBehaviorMonitor notifyWillStartStreamWithContext:option:withEventUUID:]_block_invoke";
    _os_log_impl(&dword_1BA1A5000, v2, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = (void *)[*(id *)(a1 + 40) copy];
  [v3 setAudioRecordContext:v4];

  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "observers", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        [v10 siriClientBehaviorMonitor:*(void *)(a1 + 32) willStartStreamWithContext:*(void *)(a1 + 40) option:*(void *)(a1 + 48)];
        if (objc_opt_respondsToSelector()) {
          [v10 siriClientBehaviorMonitor:*(void *)(a1 + 32) willStartStreamWithContext:*(void *)(a1 + 40) option:*(void *)(a1 + 48) withEventUUID:*(void *)(a1 + 56)];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)notifyPreparedSiriClientAudioStream:(id)a3 successfully:(BOOL)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__CSSiriClientBehaviorMonitor_notifyPreparedSiriClientAudioStream_successfully___block_invoke;
  block[3] = &unk_1E62006B0;
  BOOL v11 = a4;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, block);
}

void __80__CSSiriClientBehaviorMonitor_notifyPreparedSiriClientAudioStream_successfully___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = @"YES";
    if (!*(unsigned char *)(a1 + 48)) {
      uint64_t v3 = @"NO";
    }
    *(_DWORD *)buf = 136315394;
    id v16 = "-[CSSiriClientBehaviorMonitor notifyPreparedSiriClientAudioStream:successfully:]_block_invoke";
    __int16 v17 = 2114;
    uint64_t v18 = v3;
    _os_log_impl(&dword_1BA1A5000, v2, OS_LOG_TYPE_DEFAULT, "%s Successfully ? %{public}@", buf, 0x16u);
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "observers", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v9 siriClientBehaviorMonitor:*(void *)(a1 + 32) preparedSiriClientAudioStream:*(void *)(a1 + 40) successfully:*(unsigned __int8 *)(a1 + 48)];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)notifyFetchedSiriClientAudioStream:(id)a3 successfully:(BOOL)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__CSSiriClientBehaviorMonitor_notifyFetchedSiriClientAudioStream_successfully___block_invoke;
  block[3] = &unk_1E62006B0;
  BOOL v11 = a4;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, block);
}

void __79__CSSiriClientBehaviorMonitor_notifyFetchedSiriClientAudioStream_successfully___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = @"YES";
    if (!*(unsigned char *)(a1 + 48)) {
      uint64_t v3 = @"NO";
    }
    *(_DWORD *)buf = 136315394;
    id v16 = "-[CSSiriClientBehaviorMonitor notifyFetchedSiriClientAudioStream:successfully:]_block_invoke";
    __int16 v17 = 2114;
    uint64_t v18 = v3;
    _os_log_impl(&dword_1BA1A5000, v2, OS_LOG_TYPE_DEFAULT, "%s Successfully ? %{public}@", buf, 0x16u);
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "observers", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v9 siriClientBehaviorMonitor:*(void *)(a1 + 32) fetchedSiriClientAudioStream:*(void *)(a1 + 40) successfully:*(unsigned __int8 *)(a1 + 48)];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__CSSiriClientBehaviorMonitor_unregisterObserver___block_invoke;
  v7[3] = &unk_1E6201030;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __50__CSSiriClientBehaviorMonitor_unregisterObserver___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observers];
  [v2 removeObject:*(void *)(a1 + 40)];
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__CSSiriClientBehaviorMonitor_registerObserver___block_invoke;
  v7[3] = &unk_1E6201030;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __48__CSSiriClientBehaviorMonitor_registerObserver___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observers];
  [v2 addObject:*(void *)(a1 + 40)];
}

- (CSSiriClientBehaviorMonitor)init
{
  v8.receiver = self;
  v8.super_class = (Class)CSSiriClientBehaviorMonitor;
  id v2 = [(CSSiriClientBehaviorMonitor *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSSiriClientBehaviorMonitor", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v5;

    v2->_isStreaming = 0;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_9112 != -1) {
    dispatch_once(&sharedInstance_onceToken_9112, &__block_literal_global_9113);
  }
  id v2 = (void *)sharedInstance_sharedInstance_9114;
  return v2;
}

uint64_t __45__CSSiriClientBehaviorMonitor_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_9114 = objc_alloc_init(CSSiriClientBehaviorMonitor);
  return MEMORY[0x1F41817F8]();
}

@end
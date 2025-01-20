@interface CSVoiceTriggerEventInfoProvider
+ (BOOL)isVoiceTriggerInfoAvailableLocally:(id)a3;
+ (id)sharedInstance;
- (BOOL)_isBuiltInDeviceFromDeviceId:(id)a3;
- (CSVoiceTriggerEventInfoProvider)init;
- (NSDictionary)rtsTriggerInfo;
- (unint64_t)triggerNotifiedMachTime;
- (void)fetchVoiceTriggerInfoWithAudioContext:(id)a3 resultVoiceTriggerInfo:(id *)a4 resultRTSTriggerInfo:(id *)a5;
- (void)setRtsTriggerInfo:(id)a3;
- (void)setTriggerNotifiedMachTime:(unint64_t)a3;
- (void)setVoiceTriggerInfo:(id)a3 deviceId:(id)a4;
@end

@implementation CSVoiceTriggerEventInfoProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rtsTriggerInfo, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_builtInVoiceTriggerEvent, 0);
  objc_storeStrong((id *)&self->_accessoryVoiceTriggerEvents, 0);
}

- (void)setTriggerNotifiedMachTime:(unint64_t)a3
{
  self->_triggerNotifiedMachTime = a3;
}

- (unint64_t)triggerNotifiedMachTime
{
  return self->_triggerNotifiedMachTime;
}

- (void)setRtsTriggerInfo:(id)a3
{
}

- (NSDictionary)rtsTriggerInfo
{
  return self->_rtsTriggerInfo;
}

- (BOOL)_isBuiltInDeviceFromDeviceId:(id)a3
{
  if (a3) {
    return [a3 isEqualToString:@"BuiltInMicrophoneDevice"];
  }
  else {
    return 1;
  }
}

- (void)fetchVoiceTriggerInfoWithAudioContext:(id)a3 resultVoiceTriggerInfo:(id *)a4 resultRTSTriggerInfo:(id *)a5
{
  id v8 = a3;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__2434;
  v32 = __Block_byref_object_dispose__2435;
  id v33 = 0;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__2434;
  v26 = __Block_byref_object_dispose__2435;
  id v27 = 0;
  v9 = [v8 deviceId];
  if ([v8 isDarwinVoiceTriggered])
  {
    v10 = +[CSRemoteDarwinDeviceInfo sharedInstance];
    v11 = [v8 deviceId];
    v12 = [v10 fetchDeviceUUIDStringFromUID:v11];

    v13 = +[CSDarwinVoiceTriggerEventInfoProvider sharedInstance];
    uint64_t v14 = [v13 getMachTimeAdjustedVoiceTriggerEventInfoForDeviceUUID:v12];
    v15 = (void *)v29[5];
    v29[5] = v14;
  }
  else
  {
    queue = self->_queue;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __117__CSVoiceTriggerEventInfoProvider_fetchVoiceTriggerInfoWithAudioContext_resultVoiceTriggerInfo_resultRTSTriggerInfo___block_invoke;
    v17[3] = &unk_1E6200EC8;
    id v18 = v9;
    v19 = self;
    v20 = &v28;
    v21 = &v22;
    dispatch_async_and_wait(queue, v17);
    v12 = v18;
  }

  if (a4) {
    *a4 = (id) v29[5];
  }
  if (a5) {
    *a5 = (id) v23[5];
  }

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);
}

void __117__CSVoiceTriggerEventInfoProvider_fetchVoiceTriggerInfoWithAudioContext_resultVoiceTriggerInfo_resultRTSTriggerInfo___block_invoke(void *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a1[4]
    && (objc_msgSend(*(id *)(a1[5] + 8), "objectForKeyedSubscript:"),
        v2 = objc_claimAutoreleasedReturnValue(),
        v2,
        v2))
  {
    v3 = CSLogCategoryVT;
    if (os_log_type_enabled((os_log_t)CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = a1[4];
      int v11 = 136315394;
      v12 = "-[CSVoiceTriggerEventInfoProvider fetchVoiceTriggerInfoWithAudioContext:resultVoiceTriggerInfo:resultRTSTrig"
            "gerInfo:]_block_invoke";
      __int16 v13 = 2114;
      uint64_t v14 = v4;
      _os_log_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_DEFAULT, "%s Providing voiceTriggerEventInfo with deviceId %{public}@", (uint8_t *)&v11, 0x16u);
    }
    uint64_t v5 = [*(id *)(a1[5] + 8) objectForKeyedSubscript:a1[4]];
    uint64_t v6 = *(void *)(a1[6] + 8);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  else
  {
    id v8 = CSLogCategoryVT;
    if (os_log_type_enabled((os_log_t)CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315138;
      v12 = "-[CSVoiceTriggerEventInfoProvider fetchVoiceTriggerInfoWithAudioContext:resultVoiceTriggerInfo:resultRTSTrig"
            "gerInfo:]_block_invoke";
      _os_log_impl(&dword_1BA1A5000, v8, OS_LOG_TYPE_DEFAULT, "%s Providing built-in voiceTriggerEventInfo", (uint8_t *)&v11, 0xCu);
    }
    uint64_t v9 = *(void *)(a1[6] + 8);
    id v10 = *(id *)(a1[5] + 16);
    v7 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v10;
  }

  objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), *(id *)(a1[5] + 32));
}

- (void)setVoiceTriggerInfo:(id)a3 deviceId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__CSVoiceTriggerEventInfoProvider_setVoiceTriggerInfo_deviceId___block_invoke;
  block[3] = &unk_1E6200E38;
  id v12 = v6;
  __int16 v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __64__CSVoiceTriggerEventInfoProvider_setVoiceTriggerInfo_deviceId___block_invoke(uint64_t result)
{
  if (*(void *)(result + 32))
  {
    v1 = (void *)result;
    int v2 = [*(id *)(result + 40) _isBuiltInDeviceFromDeviceId:*(void *)(result + 48)];
    result = v1[4];
    if (v2)
    {
      uint64_t v3 = v1[5];
      *(void *)(v3 + 16) = (id)result;
    }
    else
    {
      if (!result || !v1[6]) {
        return result;
      }
      objc_msgSend(*(id *)(v1[5] + 8), "setObject:forKeyedSubscript:", objc_msgSend((id)result, "copy"), v1[6]);
    }
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

- (CSVoiceTriggerEventInfoProvider)init
{
  v8.receiver = self;
  v8.super_class = (Class)CSVoiceTriggerEventInfoProvider;
  int v2 = [(CSVoiceTriggerEventInfoProvider *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSVoiceTriggerEventInfoProvider Queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    accessoryVoiceTriggerEvents = v2->_accessoryVoiceTriggerEvents;
    v2->_accessoryVoiceTriggerEvents = (NSMutableDictionary *)v5;
  }
  return v2;
}

+ (BOOL)isVoiceTriggerInfoAvailableLocally:(id)a3
{
  id v3 = a3;
  if (+[CSUtils isLocalVoiceTriggerAvailable]
    || ([v3 isHearstVoiceTriggered] & 1) != 0
    || ([v3 isJarvisVoiceTriggered] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isRemoraVoiceTriggered];
  }
  char v5 = [v3 isDarwinVoiceTriggered] | v4;

  return v5;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2449 != -1) {
    dispatch_once(&sharedInstance_onceToken_2449, &__block_literal_global_2450);
  }
  int v2 = (void *)sharedInstance_sharedInstance_2451;
  return v2;
}

uint64_t __49__CSVoiceTriggerEventInfoProvider_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_2451 = objc_alloc_init(CSVoiceTriggerEventInfoProvider);
  return MEMORY[0x1F41817F8]();
}

@end
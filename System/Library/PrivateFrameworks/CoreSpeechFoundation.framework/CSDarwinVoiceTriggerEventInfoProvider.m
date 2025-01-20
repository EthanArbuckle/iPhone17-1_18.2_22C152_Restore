@interface CSDarwinVoiceTriggerEventInfoProvider
+ (id)sharedInstance;
+ (id)voiceTriggerEventInfoWithAdjustedMachTime:(id)a3 deviceUUID:(id)a4 anchorHostMachTime:(unint64_t)a5 anchorDarwinMachTime:(unint64_t)a6;
- (CSDarwinVoiceTriggerEventInfoProvider)init;
- (NSMutableDictionary)triggerInfos;
- (OS_dispatch_queue)queue;
- (id)getMachTimeAdjustedVoiceTriggerEventInfoForDeviceUUID:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRawVoiceTriggerEventInfo:(id)a3 fromDeviceUUID:(id)a4 anchorHostMachTime:(unint64_t)a5 anchorDarwinMachTime:(unint64_t)a6;
- (void)setTriggerInfos:(id)a3;
@end

@implementation CSDarwinVoiceTriggerEventInfoProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_triggerInfos, 0);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setTriggerInfos:(id)a3
{
}

- (NSMutableDictionary)triggerInfos
{
  return self->_triggerInfos;
}

- (id)getMachTimeAdjustedVoiceTriggerEventInfoForDeviceUUID:(id)a3
{
  id v4 = a3;
  v5 = v4;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__4622;
  v17 = __Block_byref_object_dispose__4623;
  id v18 = 0;
  if (v4)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __95__CSDarwinVoiceTriggerEventInfoProvider_getMachTimeAdjustedVoiceTriggerEventInfoForDeviceUUID___block_invoke;
    block[3] = &unk_1E6201328;
    block[4] = self;
    id v11 = v4;
    v12 = &v13;
    dispatch_async_and_wait(queue, block);

    v7 = (void *)v14[5];
  }
  else
  {
    v7 = 0;
  }
  id v8 = v7;
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __95__CSDarwinVoiceTriggerEventInfoProvider_getMachTimeAdjustedVoiceTriggerEventInfoForDeviceUUID___block_invoke(void *a1)
{
  v2 = [*(id *)(a1[4] + 8) objectForKeyedSubscript:a1[5]];

  if (v2)
  {
    *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 8) objectForKeyedSubscript:a1[5]];
    MEMORY[0x1F41817F8]();
  }
}

- (void)setRawVoiceTriggerEventInfo:(id)a3 fromDeviceUUID:(id)a4 anchorHostMachTime:(unint64_t)a5 anchorDarwinMachTime:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  if (v11)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __124__CSDarwinVoiceTriggerEventInfoProvider_setRawVoiceTriggerEventInfo_fromDeviceUUID_anchorHostMachTime_anchorDarwinMachTime___block_invoke;
    block[3] = &unk_1E61FF8A0;
    id v14 = v10;
    unint64_t v17 = a5;
    unint64_t v18 = a6;
    id v15 = v11;
    v16 = self;
    dispatch_async(queue, block);
  }
}

void __124__CSDarwinVoiceTriggerEventInfoProvider_setRawVoiceTriggerEventInfo_fromDeviceUUID_anchorHostMachTime_anchorDarwinMachTime___block_invoke(void *a1)
{
  id v2 = +[CSDarwinVoiceTriggerEventInfoProvider voiceTriggerEventInfoWithAdjustedMachTime:a1[4] deviceUUID:a1[5] anchorHostMachTime:a1[7] anchorDarwinMachTime:a1[8]];
  [*(id *)(a1[6] + 8) setObject:v2 forKey:a1[5]];
}

- (CSDarwinVoiceTriggerEventInfoProvider)init
{
  v8.receiver = self;
  v8.super_class = (Class)CSDarwinVoiceTriggerEventInfoProvider;
  id v2 = [(CSDarwinVoiceTriggerEventInfoProvider *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSDarwinVoiceTriggerEventInfoProvider", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    triggerInfos = v2->_triggerInfos;
    v2->_triggerInfos = (NSMutableDictionary *)v5;
  }
  return v2;
}

+ (id)voiceTriggerEventInfoWithAdjustedMachTime:(id)a3 deviceUUID:(id)a4 anchorHostMachTime:(unint64_t)a5 anchorDarwinMachTime:(unint64_t)a6
{
  id v8 = a3;
  v9 = (void *)[v8 mutableCopy];
  [v9 setObject:@"Darwin" forKey:@"firstPassTriggerSource"];
  if (v8)
  {
    if (a5)
    {
      if (a6)
      {
        uint64_t v10 = [v8 objectForKeyedSubscript:@"earlyDetectFiredMachTime"];
        if (v10)
        {
          id v11 = (void *)v10;
          uint64_t v12 = [v8 objectForKeyedSubscript:@"triggerStartMachTime"];
          if (v12)
          {
            uint64_t v13 = (void *)v12;
            uint64_t v14 = [v8 objectForKeyedSubscript:@"triggerFireMachTime"];
            if (v14)
            {
              id v15 = (void *)v14;
              uint64_t v16 = [v8 objectForKeyedSubscript:@"triggerEndMachTime"];
              if (v16)
              {
                unint64_t v17 = (void *)v16;
                uint64_t v18 = [v8 objectForKeyedSubscript:@"triggerFireSeconds"];
                if (v18)
                {
                  v19 = (void *)v18;
                  v20 = [v8 objectForKeyedSubscript:@"triggerEndSeconds"];

                  if (!v20) {
                    goto LABEL_24;
                  }
                  v21 = [v8 objectForKeyedSubscript:@"earlyDetectFiredMachTime"];
                  unint64_t v22 = [v21 unsignedLongLongValue];

                  double v23 = 0.0;
                  double v24 = 0.0;
                  if (v22 < a6)
                  {
                    v25 = [v8 objectForKeyedSubscript:@"earlyDetectFiredMachTime"];
                    double v24 = (double)(a6 - [v25 unsignedLongLongValue]);
                  }
                  v26 = [v8 objectForKeyedSubscript:@"triggerStartMachTime"];
                  unint64_t v27 = [v26 unsignedLongLongValue];

                  if (v27 < a6)
                  {
                    v28 = [v8 objectForKeyedSubscript:@"triggerStartMachTime"];
                    double v23 = (double)(a6 - [v28 unsignedLongLongValue]);
                  }
                  v29 = [v8 objectForKeyedSubscript:@"triggerEndMachTime"];
                  unint64_t v30 = [v29 unsignedLongLongValue];

                  double v31 = 0.0;
                  double v32 = 0.0;
                  if (v30 < a6)
                  {
                    v33 = [v8 objectForKeyedSubscript:@"triggerEndMachTime"];
                    double v32 = (double)(a6 - [v33 unsignedLongLongValue]);
                  }
                  v34 = [v8 objectForKeyedSubscript:@"triggerFireMachTime"];
                  unint64_t v35 = [v34 unsignedLongLongValue];

                  if (v35 < a6)
                  {
                    v36 = [v8 objectForKeyedSubscript:@"triggerFireMachTime"];
                    double v31 = (double)(a6 - [v36 unsignedLongLongValue]);
                  }
                  v37 = [v8 objectForKeyedSubscript:@"triggerFireMachTime"];
                  uint64_t v38 = [v37 unsignedLongLongValue];
                  v39 = [v8 objectForKeyedSubscript:@"triggerEndMachTime"];
                  double v40 = (double)(unint64_t)(v38 - [v39 unsignedLongLongValue]);
                  v41 = [v8 objectForKeyedSubscript:@"triggerFireSeconds"];
                  [v41 floatValue];
                  float v43 = v42;
                  v44 = [v8 objectForKeyedSubscript:@"triggerEndSeconds"];
                  [v44 floatValue];
                  double v46 = v40 / (float)(v43 - v45);

                  double v47 = v24 / v46;
                  +[CSFTimeUtils getHostClockFrequency];
                  if ((unint64_t)(v47 * v48) >= a5)
                  {
                    unint64_t v50 = 0;
                  }
                  else
                  {
                    +[CSFTimeUtils getHostClockFrequency];
                    unint64_t v50 = a5 - (unint64_t)(v47 * v49);
                  }
                  double v53 = v23 / v46;
                  +[CSFTimeUtils getHostClockFrequency];
                  if ((unint64_t)(v53 * v54) >= a5)
                  {
                    unint64_t v56 = 0;
                  }
                  else
                  {
                    +[CSFTimeUtils getHostClockFrequency];
                    unint64_t v56 = a5 - (unint64_t)(v53 * v55);
                  }
                  +[CSFTimeUtils getHostClockFrequency];
                  if ((unint64_t)(v32 / v46 * v57) >= a5)
                  {
                    unint64_t v59 = 0;
                  }
                  else
                  {
                    +[CSFTimeUtils getHostClockFrequency];
                    unint64_t v59 = a5 - (unint64_t)(v32 / v46 * v58);
                  }
                  double v60 = v31 / v46;
                  +[CSFTimeUtils getHostClockFrequency];
                  if ((unint64_t)(v60 * v61) >= a5)
                  {
                    unint64_t v63 = 0;
                  }
                  else
                  {
                    +[CSFTimeUtils getHostClockFrequency];
                    unint64_t v63 = a5 - (unint64_t)(v60 * v62);
                  }
                  v64 = [NSNumber numberWithUnsignedLongLong:v50];
                  [v9 setObject:v64 forKey:@"earlyDetectFiredMachTime"];

                  v65 = [NSNumber numberWithUnsignedLongLong:v56];
                  [v9 setObject:v65 forKey:@"triggerStartMachTime"];

                  v66 = [NSNumber numberWithUnsignedLongLong:v59];
                  [v9 setObject:v66 forKey:@"triggerEndMachTime"];

                  id v11 = [NSNumber numberWithUnsignedLongLong:v63];
                  [v9 setObject:v11 forKey:@"triggerFireMachTime"];
                  goto LABEL_23;
                }
              }
            }
          }
LABEL_23:
        }
      }
    }
  }
LABEL_24:
  v51 = (void *)[v9 copy];

  return v51;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_4637 != -1) {
    dispatch_once(&sharedInstance_onceToken_4637, &__block_literal_global_4638);
  }
  id v2 = (void *)sharedInstance_sharedInstance_4639;
  return v2;
}

uint64_t __55__CSDarwinVoiceTriggerEventInfoProvider_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_4639 = objc_alloc_init(CSDarwinVoiceTriggerEventInfoProvider);
  return MEMORY[0x1F41817F8]();
}

@end
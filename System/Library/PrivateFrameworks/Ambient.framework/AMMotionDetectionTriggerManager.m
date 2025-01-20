@interface AMMotionDetectionTriggerManager
- (AMMotionDetectionTriggerManager)init;
- (AMMotionDetectionTriggerManager)initWithAWClientOverride:(id)a3;
- (BOOL)isMotionDetectionEnabled;
- (double)watchdogTimeout;
- (id)_firstOrderLowPassArray:(id)a3 last:(id)a4 dt:(float)a5 tau:(float)a6;
- (id)_subtractArrayX:(id)a3 andY:(id)a4;
- (id)_unitIntervalClipArray:(id)a3;
- (unint64_t)_computeThresholdMaskFromMotionData:(id)a3 filtered:(BOOL)a4;
- (unint64_t)triggerState;
- (void)_accessQueue_setPublishedTriggers:(unint64_t)a3;
- (void)_accessQueue_updatePublishedTriggers;
- (void)_handleMotionDataSample:(id)a3;
- (void)_handleMotionDetectBoolean:(BOOL)a3;
- (void)_injectSyntheticMotionData:(id)a3 timestampSeconds:(double)a4;
- (void)_injectSyntheticMotionDetectBoolean:(BOOL)a3 timestamp:(double)a4;
- (void)_notifyObserversUpdateMotionDetectionTriggerState:(unint64_t)a3;
- (void)_setEnabledTriggers:(unint64_t)a3;
- (void)_setMotionDetectionMonitoringEnabled:(BOOL)a3;
- (void)_updateFilteredMotionDensity:(id)a3;
- (void)_updateMotionDetectionTriggerMaskWithDataSample:(id)a3 andFilteredDataSample:(id)a4;
- (void)_updateWatchdogTimer;
- (void)addObserver:(id)a3 queue:(id)a4;
- (void)removeObserver:(id)a3;
- (void)setMotionDetectionEnabled:(BOOL)a3;
- (void)setWatchdogTimeout:(double)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
@end

@implementation AMMotionDetectionTriggerManager

- (AMMotionDetectionTriggerManager)initWithAWClientOverride:(id)a3
{
  id v5 = a3;
  v6 = [(AMMotionDetectionTriggerManager *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_awClientOverride, a3);
  }

  return v7;
}

- (AMMotionDetectionTriggerManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)AMMotionDetectionTriggerManager;
  v2 = [(AMMotionDetectionTriggerManager *)&v14 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.Ambient.MotionDetectionQueue", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    uint64_t v5 = +[AMMotionDetectionDomain rootSettings];
    settings = v2->_settings;
    v2->_settings = (AMMotionDetectionSettings *)v5;

    [(PTSettings *)v2->_settings addKeyObserver:v2];
    v2->_enabledTriggers = [(AMMotionDetectionSettings *)v2->_settings enabledTriggers];
    uint64_t v7 = +[_AMMotionDetectionDataSample zeroMotionDataWithTimestamp:0.0];
    dataSample = v2->_dataSample;
    v2->_dataSample = (_AMMotionDetectionDataSample *)v7;

    uint64_t v9 = +[_AMMotionDetectionDataSample zeroMotionDataWithTimestamp:0.0];
    filteredMotionDensity = v2->_filteredMotionDensity;
    v2->_filteredMotionDensity = (_AMMotionDetectionDataSample *)v9;

    uint64_t v11 = +[_AMMotionDetectionDataSample zeroMotionDataWithTimestamp:0.0];
    motionDensityBackground = v2->_motionDensityBackground;
    v2->_motionDensityBackground = (_AMMotionDetectionDataSample *)v11;

    v2->_watchdogTimeout = 10.0;
  }
  return v2;
}

- (BOOL)isMotionDetectionEnabled
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __59__AMMotionDetectionTriggerManager_isMotionDetectionEnabled__block_invoke;
  v5[3] = &unk_2652234F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __59__AMMotionDetectionTriggerManager_isMotionDetectionEnabled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 56);
  return result;
}

- (void)setMotionDetectionEnabled:(BOOL)a3
{
  accessQueue = self->_accessQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __61__AMMotionDetectionTriggerManager_setMotionDetectionEnabled___block_invoke;
  v4[3] = &unk_265223520;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(accessQueue, v4);
}

uint64_t __61__AMMotionDetectionTriggerManager_setMotionDetectionEnabled___block_invoke(uint64_t result)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (*(unsigned __int8 *)(*(void *)(result + 32) + 56) != *(unsigned __int8 *)(result + 40))
  {
    uint64_t v1 = result;
    v2 = AMLogMotion();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = *(unsigned __int8 *)(v1 + 40);
      v4[0] = 67109120;
      v4[1] = v3;
      _os_log_impl(&dword_24782A000, v2, OS_LOG_TYPE_DEFAULT, "Ambient motion detection enabled : %{BOOL}d", (uint8_t *)v4, 8u);
    }

    *(unsigned char *)(*(void *)(v1 + 32) + 56) = *(unsigned char *)(v1 + 40);
    return [*(id *)(v1 + 32) _setMotionDetectionMonitoringEnabled:*(unsigned __int8 *)(v1 + 40)];
  }
  return result;
}

- (unint64_t)triggerState
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __47__AMMotionDetectionTriggerManager_triggerState__block_invoke;
  v5[3] = &unk_2652234F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __47__AMMotionDetectionTriggerManager_triggerState__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 88);
  return result;
}

- (void)addObserver:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__AMMotionDetectionTriggerManager_addObserver_queue___block_invoke;
  block[3] = &unk_265223548;
  id v12 = v6;
  id v13 = v7;
  objc_super v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(accessQueue, block);
}

void __53__AMMotionDetectionTriggerManager_addObserver_queue___block_invoke(void *a1)
{
  v2 = [[_AMMotionDetectionTriggerManagerObserverContext alloc] initWithObserver:a1[4] queue:a1[5]];
  unint64_t v3 = *(void **)(a1[6] + 64);
  id v7 = v2;
  if (!v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v5 = a1[6];
    id v6 = *(void **)(v5 + 64);
    *(void *)(v5 + 64) = v4;

    v2 = v7;
    unint64_t v3 = *(void **)(a1[6] + 64);
  }
  [v3 addObject:v2];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__AMMotionDetectionTriggerManager_removeObserver___block_invoke;
  v7[3] = &unk_265223458;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(accessQueue, v7);
}

void __50__AMMotionDetectionTriggerManager_removeObserver___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 64);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v9 = objc_msgSend(v8, "observer", (void)v13);
        id v10 = *(void **)(a1 + 40);

        if (v9 == v10)
        {
          if (!v5) {
            uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:1];
          }
          [v5 addObject:v8];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
  else
  {
    uint64_t v5 = 0;
  }

  if ([v5 count])
  {
    [*(id *)(*(void *)(a1 + 32) + 64) removeObjectsInArray:v5];
    if (![*(id *)(*(void *)(a1 + 32) + 64) count])
    {
      uint64_t v11 = *(void *)(a1 + 32);
      id v12 = *(void **)(v11 + 64);
      *(void *)(v11 + 64) = 0;
    }
  }
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  if (self->_settings == a3)
  {
    uint64_t v5 = [a3 enabledTriggers];
    [(AMMotionDetectionTriggerManager *)self _setEnabledTriggers:v5];
  }
}

- (void)_injectSyntheticMotionData:(id)a3 timestampSeconds:(double)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(_AMMotionDetectionDataSample);
  [(_AMMotionDetectionDataSample *)v7 setData:v6];

  [(_AMMotionDetectionDataSample *)v7 setTimestampSeconds:a4];
  accessQueue = self->_accessQueue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __79__AMMotionDetectionTriggerManager__injectSyntheticMotionData_timestampSeconds___block_invoke;
  v10[3] = &unk_265223458;
  v10[4] = self;
  uint64_t v11 = v7;
  id v9 = v7;
  dispatch_async(accessQueue, v10);
}

uint64_t __79__AMMotionDetectionTriggerManager__injectSyntheticMotionData_timestampSeconds___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleMotionDataSample:*(void *)(a1 + 40)];
}

- (void)_injectSyntheticMotionDetectBoolean:(BOOL)a3 timestamp:(double)a4
{
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __81__AMMotionDetectionTriggerManager__injectSyntheticMotionDetectBoolean_timestamp___block_invoke;
  v5[3] = &unk_265223520;
  v5[4] = self;
  BOOL v6 = a3;
  dispatch_async(accessQueue, v5);
}

uint64_t __81__AMMotionDetectionTriggerManager__injectSyntheticMotionDetectBoolean_timestamp___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleMotionDetectBoolean:*(unsigned __int8 *)(a1 + 40)];
}

- (double)watchdogTimeout
{
  uint64_t v6 = 0;
  id v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __50__AMMotionDetectionTriggerManager_watchdogTimeout__block_invoke;
  v5[3] = &unk_2652234F8;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __50__AMMotionDetectionTriggerManager_watchdogTimeout__block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(a1 + 32) + 104);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setWatchdogTimeout:(double)a3
{
  accessQueue = self->_accessQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  _DWORD v4[2] = __54__AMMotionDetectionTriggerManager_setWatchdogTimeout___block_invoke;
  v4[3] = &unk_265223570;
  v4[4] = self;
  *(double *)&void v4[5] = a3;
  dispatch_sync(accessQueue, v4);
}

double __54__AMMotionDetectionTriggerManager_setWatchdogTimeout___block_invoke(uint64_t a1)
{
  double result = *(double *)(a1 + 40);
  *(double *)(*(void *)(a1 + 32) + 104) = result;
  return result;
}

- (void)_updateMotionDetectionTriggerMaskWithDataSample:(id)a3 andFilteredDataSample:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  accessQueue = self->_accessQueue;
  id v7 = a4;
  id v8 = a3;
  dispatch_assert_queue_V2(accessQueue);
  unint64_t v9 = [(AMMotionDetectionTriggerManager *)self _computeThresholdMaskFromMotionData:v8 filtered:0];

  unint64_t v10 = [(AMMotionDetectionTriggerManager *)self _computeThresholdMaskFromMotionData:v7 filtered:1];
  unint64_t v11 = v10 | v9;
  if (v11 != self->_triggerState)
  {
    self->_triggerState = v11;
    id v12 = AMLogMotion();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13[0] = 67109376;
      v13[1] = v11 != 0;
      __int16 v14 = 2048;
      unint64_t v15 = v11;
      _os_log_impl(&dword_24782A000, v12, OS_LOG_TYPE_DEFAULT, "Ambient motion detect : %{BOOL}d : 0x%04llx", (uint8_t *)v13, 0x12u);
    }

    [(AMMotionDetectionTriggerManager *)self _accessQueue_updatePublishedTriggers];
  }
}

- (void)_setEnabledTriggers:(unint64_t)a3
{
  accessQueue = self->_accessQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  _DWORD v4[2] = __55__AMMotionDetectionTriggerManager__setEnabledTriggers___block_invoke;
  v4[3] = &unk_265223570;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(accessQueue, v4);
}

uint64_t __55__AMMotionDetectionTriggerManager__setEnabledTriggers___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 80) = *(void *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "_accessQueue_updatePublishedTriggers");
}

- (void)_accessQueue_updatePublishedTriggers
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  unint64_t triggerState = self->_triggerState;
  if (triggerState == 0x8000000000000000) {
    unint64_t v4 = 0x8000000000000000;
  }
  else {
    unint64_t v4 = self->_enabledTriggers & triggerState;
  }
  [(AMMotionDetectionTriggerManager *)self _accessQueue_setPublishedTriggers:v4];
}

- (void)_accessQueue_setPublishedTriggers:(unint64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  if (self->_publishedTriggers != a3)
  {
    self->_publishedTriggers = a3;
    [(AMMotionDetectionTriggerManager *)self _notifyObserversUpdateMotionDetectionTriggerState:a3];
  }
}

- (void)_notifyObserversUpdateMotionDetectionTriggerState:(unint64_t)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  uint64_t v5 = (void *)[(NSMutableArray *)self->_observerContexts copy];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(obj);
        }
        unint64_t v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        unint64_t v11 = [v10 observer];
        id v12 = [v10 queue];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __85__AMMotionDetectionTriggerManager__notifyObserversUpdateMotionDetectionTriggerState___block_invoke;
        block[3] = &unk_265223598;
        id v16 = v11;
        v17 = self;
        unint64_t v18 = a3;
        id v13 = v11;
        dispatch_async(v12, block);
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }
}

uint64_t __85__AMMotionDetectionTriggerManager__notifyObserversUpdateMotionDetectionTriggerState___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) motionDetectionManager:*(void *)(a1 + 40) didUpdateMotionDetectionTriggerState:*(void *)(a1 + 48)];
}

- (unint64_t)_computeThresholdMaskFromMotionData:(id)a3 filtered:(BOOL)a4
{
  int v4 = a4;
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v29 = 0x3E4CCCCD3DCCCCCDLL;
  long long v30 = xmmword_247832330;
  char v31 = 0;
  uint64_t v32 = 0x3E99999A3E19999ALL;
  int64x2_t v33 = vdupq_n_s64(4uLL);
  char v34 = 0;
  uint64_t v35 = 0x3F19999A3F000000;
  long long v36 = xmmword_247832340;
  char v37 = 0;
  uint64_t v38 = 0x3E4CCCCD3DCCCCCDLL;
  long long v39 = xmmword_247832350;
  char v40 = 1;
  uint64_t v41 = 0x3E99999A3E19999ALL;
  long long v42 = xmmword_247832360;
  char v43 = 1;
  uint64_t v44 = 0x3F19999A3F000000;
  long long v45 = xmmword_247832370;
  char v46 = 1;
  uint64_t v6 = [MEMORY[0x263F08B30] sortDescriptorWithKey:0 ascending:0 selector:sel_compare_];
  v27 = v5;
  uint64_t v7 = [v5 data];
  v28 = v6;
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v28 count:1];
  unint64_t v9 = [v7 sortedArrayUsingDescriptors:v8];

  unint64_t v10 = [v9 objectAtIndexedSubscript:0];
  [v10 floatValue];
  float v12 = v11;

  unint64_t v13 = 0;
  for (uint64_t i = 0; i != 6; ++i)
  {
    unint64_t v15 = (float *)(&v29 + 4 * i);
    if (*((unsigned __int8 *)v15 + 24) == v4)
    {
      unint64_t v16 = *((void *)v15 + 1);
      unint64_t v17 = [v9 count];
      if (v16 >= v17) {
        unint64_t v18 = v17;
      }
      else {
        unint64_t v18 = v16;
      }
      if (v18)
      {
        unint64_t v19 = 0;
        float v20 = 0.0;
        do
        {
          long long v21 = [v9 objectAtIndexedSubscript:v19];
          [v21 floatValue];
          float v20 = v20 + v22;

          ++v19;
          unint64_t v23 = [v9 count];
          if (v16 >= v23) {
            unint64_t v24 = v23;
          }
          else {
            unint64_t v24 = v16;
          }
        }
        while (v19 < v24);
      }
      else
      {
        float v20 = 0.0;
      }
      v25 = (float *)(&v29 + 4 * i);
      if (v20 >= v25[1] || v12 >= *v15) {
        v13 |= *((void *)v25 + 2);
      }
    }
  }

  return v13;
}

- (id)_firstOrderLowPassArray:(id)a3 last:(id)a4 dt:(float)a5 tau:(float)a6
{
  id v9 = a3;
  id v10 = a4;
  float v11 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:16];
  uint64_t v12 = 0;
  float v13 = a5 / (float)(a5 + a6);
  LODWORD(v14) = 1.0;
  do
  {
    unint64_t v15 = objc_msgSend(v9, "objectAtIndexedSubscript:", v12, v14);
    unint64_t v16 = [v10 objectAtIndexedSubscript:v12];
    [v15 floatValue];
    float v18 = v17;
    [v16 floatValue];
    *(float *)&double v20 = (float)((float)(1.0 - v13) * v19) + (float)(v13 * v18);
    long long v21 = [NSNumber numberWithFloat:v20];
    [v11 setObject:v21 atIndexedSubscript:v12];

    ++v12;
  }
  while (v12 != 16);

  return v11;
}

- (id)_subtractArrayX:(id)a3 andY:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:16];
  for (uint64_t i = 0; i != 16; ++i)
  {
    id v9 = NSNumber;
    id v10 = [v5 objectAtIndexedSubscript:i];
    [v10 floatValue];
    float v12 = v11;
    float v13 = [v6 objectAtIndexedSubscript:i];
    [v13 floatValue];
    *(float *)&double v15 = v12 - v14;
    unint64_t v16 = [v9 numberWithFloat:v15];
    [v7 setObject:v16 atIndexedSubscript:i];
  }
  return v7;
}

- (id)_unitIntervalClipArray:(id)a3
{
  id v3 = a3;
  int v4 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:16];
  for (uint64_t i = 0; i != 16; ++i)
  {
    id v6 = [v3 objectAtIndexedSubscript:i];
    [v6 floatValue];
    uint64_t v8 = &unk_26FBC9288;
    if (v7 >= 0.0)
    {
      uint64_t v8 = &unk_26FBC9298;
      if (v7 <= 1.0)
      {
        uint64_t v8 = objc_msgSend(NSNumber, "numberWithFloat:");
      }
    }
    [v4 setObject:v8 atIndexedSubscript:i];
  }
  return v4;
}

- (void)_updateFilteredMotionDensity:(id)a3
{
  id v26 = a3;
  [(_AMMotionDetectionDataSample *)self->_dataSample timestampSeconds];
  double v5 = v4;
  [v26 timestampSeconds];
  double v7 = v6;
  double v8 = v6 - v5;
  if (v5 == 0.0) {
    double v9 = 0.0;
  }
  else {
    double v9 = v8;
  }
  if (v9 >= 0.0)
  {
    id v10 = [v26 data];
    float v11 = [(_AMMotionDetectionDataSample *)self->_motionDensityBackground data];
    float v12 = [(AMMotionDetectionTriggerManager *)self _subtractArrayX:v10 andY:v11];
    float v13 = [(AMMotionDetectionTriggerManager *)self _unitIntervalClipArray:v12];

    filteredMotionDensity = self->_filteredMotionDensity;
    double v15 = [(_AMMotionDetectionDataSample *)filteredMotionDensity data];
    float v16 = v9;
    LODWORD(v17) = 1045220557;
    *(float *)&double v18 = v16;
    float v19 = [(AMMotionDetectionTriggerManager *)self _firstOrderLowPassArray:v13 last:v15 dt:v18 tau:v17];
    [(_AMMotionDetectionDataSample *)filteredMotionDensity setData:v19];

    [(_AMMotionDetectionDataSample *)self->_filteredMotionDensity setTimestampSeconds:v7];
    motionDensityBackground = self->_motionDensityBackground;
    long long v21 = [v26 data];
    float v22 = [(_AMMotionDetectionDataSample *)self->_motionDensityBackground data];
    LODWORD(v23) = 1120403456;
    *(float *)&double v24 = v16;
    v25 = [(AMMotionDetectionTriggerManager *)self _firstOrderLowPassArray:v21 last:v22 dt:v24 tau:v23];
    [(_AMMotionDetectionDataSample *)motionDensityBackground setData:v25];

    [(_AMMotionDetectionDataSample *)self->_motionDensityBackground setTimestampSeconds:v7];
  }
}

- (void)_handleMotionDataSample:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  double v6 = [v5 data];
  uint64_t v7 = [v6 count];

  double v8 = [v5 data];
  double v9 = [v8 objectAtIndexedSubscript:0];
  [v9 floatValue];

  if (v7 == 16)
  {
    id v10 = AMLogMotion();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[AMMotionDetectionTriggerManager _handleMotionDataSample:]((uint64_t)v5, v10);
    }

    [(AMMotionDetectionTriggerManager *)self _updateFilteredMotionDensity:v5];
    [(AMMotionDetectionTriggerManager *)self _updateMotionDetectionTriggerMaskWithDataSample:v5 andFilteredDataSample:self->_filteredMotionDensity];
    objc_storeStrong((id *)&self->_dataSample, a3);
    [(AMMotionDetectionTriggerManager *)self _updateWatchdogTimer];
  }
}

- (void)_handleMotionDetectBoolean:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  if (v3) {
    unint64_t enabledTriggers = self->_enabledTriggers;
  }
  else {
    unint64_t enabledTriggers = 0;
  }
  if (self->_triggerState != enabledTriggers)
  {
    self->_unint64_t triggerState = enabledTriggers;
    double v6 = AMLogMotion();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109376;
      v7[1] = enabledTriggers != 0;
      __int16 v8 = 2048;
      unint64_t v9 = enabledTriggers;
      _os_log_impl(&dword_24782A000, v6, OS_LOG_TYPE_DEFAULT, "Ambient motion detect : %{BOOL}d : 0x%04llx", (uint8_t *)v7, 0x12u);
    }

    [(AMMotionDetectionTriggerManager *)self _accessQueue_updatePublishedTriggers];
    [(AMMotionDetectionTriggerManager *)self _updateWatchdogTimer];
  }
}

- (void)_setMotionDetectionMonitoringEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  self->_unint64_t triggerState = 0x8000000000000000;
  self->_publishedTriggers = 0x8000000000000000;
  if (v3)
  {
    watchdogTimer = (NSTimer *)objc_alloc_init(MEMORY[0x263F28870]);
    [(NSTimer *)watchdogTimer setIdentifier:@"com.apple.Ambient.MotionDetectionManager"];
    [(NSTimer *)watchdogTimer setEventMask:128];
    [(NSTimer *)watchdogTimer setSamplingInterval:2.0];
    [(NSTimer *)watchdogTimer setActivateMotionDetect:1];
    [(NSTimer *)watchdogTimer setAttentionLostTimeout:0.1];
    [(NSTimer *)watchdogTimer setSampleWhileAbsent:1];
    awClientOverride = self->_awClientOverride;
    if (awClientOverride) {
      uint64_t v7 = awClientOverride;
    }
    else {
      uint64_t v7 = (AWAttentionAwarenessClient *)objc_alloc_init(MEMORY[0x263F28868]);
    }
    awClient = self->_awClient;
    self->_awClient = v7;

    [(AWAttentionAwarenessClient *)self->_awClient setConfiguration:watchdogTimer];
    objc_initWeak(&location, self);
    accessQueue = self->_accessQueue;
    float v12 = self->_awClient;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __72__AMMotionDetectionTriggerManager__setMotionDetectionMonitoringEnabled___block_invoke;
    v18[3] = &unk_2652235C0;
    objc_copyWeak(&v19, &location);
    [(AWAttentionAwarenessClient *)v12 setEventHandlerWithQueue:accessQueue block:v18];
    float v14 = self->_awClient;
    id v17 = 0;
    [(AWAttentionAwarenessClient *)v14 resumeWithError:&v17];
    id v9 = v17;
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  else
  {
    __int16 v8 = self->_awClient;
    id v16 = 0;
    [(AWAttentionAwarenessClient *)v8 invalidateWithError:&v16];
    id v9 = v16;
    uint64_t v10 = self->_awClient;
    self->_awClient = 0;

    [(NSTimer *)self->_watchdogTimer invalidate];
    watchdogTimer = self->_watchdogTimer;
    self->_watchdogTimer = 0;
  }

  if (v9)
  {
    double v15 = AMLogMotion();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      [(AMMotionDetectionTriggerManager *)v3 _setMotionDetectionMonitoringEnabled:v15];
    }
  }
}

void __72__AMMotionDetectionTriggerManager__setMotionDetectionMonitoringEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v4 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = v9;
    if ([v6 motionResult])
    {
      objc_msgSend(WeakRetained, "_handleMotionDetectBoolean:", objc_msgSend(v6, "motionResult") == 2);
    }
    else
    {
      uint64_t v7 = objc_alloc_init(_AMMotionDetectionDataSample);
      __int16 v8 = [v6 motionData];
      [(_AMMotionDetectionDataSample *)v7 setData:v8];

      [v6 timestamp];
      -[_AMMotionDetectionDataSample setTimestampSeconds:](v7, "setTimestampSeconds:");
      [WeakRetained _handleMotionDataSample:v7];
    }
  }
}

- (void)_updateWatchdogTimer
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  [(NSTimer *)self->_watchdogTimer invalidate];
  watchdogTimer = self->_watchdogTimer;
  self->_watchdogTimer = 0;

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  _DWORD v4[2] = __55__AMMotionDetectionTriggerManager__updateWatchdogTimer__block_invoke;
  v4[3] = &unk_265223380;
  objc_copyWeak(&v5, &location);
  dispatch_async(MEMORY[0x263EF83A0], v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __55__AMMotionDetectionTriggerManager__updateWatchdogTimer__block_invoke(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v3 = WeakRetained;
  if (WeakRetained)
  {
    double v4 = WeakRetained[1];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __55__AMMotionDetectionTriggerManager__updateWatchdogTimer__block_invoke_2;
    v5[3] = &unk_265223638;
    v5[4] = WeakRetained;
    objc_copyWeak(&v6, v1);
    dispatch_sync(v4, v5);
    objc_destroyWeak(&v6);
  }
}

void __55__AMMotionDetectionTriggerManager__updateWatchdogTimer__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 72))
  {
    BOOL v3 = (void *)MEMORY[0x263EFFA20];
    double v4 = *(double *)(v1 + 104);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __55__AMMotionDetectionTriggerManager__updateWatchdogTimer__block_invoke_3;
    v9[3] = &unk_265223610;
    objc_copyWeak(&v10, (id *)(a1 + 40));
    uint64_t v5 = [v3 scheduledTimerWithTimeInterval:0 repeats:v9 block:v4];
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(v6 + 112);
    *(void *)(v6 + 112) = v5;

    if (!*(void *)(*(void *)(a1 + 32) + 112))
    {
      __int16 v8 = AMLogMotion();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __55__AMMotionDetectionTriggerManager__updateWatchdogTimer__block_invoke_2_cold_1(v8);
      }
    }
    objc_destroyWeak(&v10);
  }
}

void __55__AMMotionDetectionTriggerManager__updateWatchdogTimer__block_invoke_3(uint64_t a1)
{
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v3 = WeakRetained[1];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55__AMMotionDetectionTriggerManager__updateWatchdogTimer__block_invoke_4;
    block[3] = &unk_2652235E8;
    void block[4] = v2;
    dispatch_async(v3, block);
  }
}

uint64_t __55__AMMotionDetectionTriggerManager__updateWatchdogTimer__block_invoke_4(uint64_t result)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(result + 32);
  if (*(void *)(v1 + 72))
  {
    uint64_t v2 = result;
    *(void *)(v1 + 72) = 0;
    BOOL v3 = AMLogMotion();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(*(void *)(v2 + 32) + 72);
      v5[0] = 67109376;
      v5[1] = v4 != 0;
      __int16 v6 = 2048;
      uint64_t v7 = v4;
      _os_log_impl(&dword_24782A000, v3, OS_LOG_TYPE_DEFAULT, "Ambient motion detect (watchdog) : %{BOOL}d : 0x%04llx", (uint8_t *)v5, 0x12u);
    }

    return objc_msgSend(*(id *)(v2 + 32), "_accessQueue_updatePublishedTriggers");
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchdogTimer, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_observerContexts, 0);
  objc_storeStrong((id *)&self->_filteredMotionDensity, 0);
  objc_storeStrong((id *)&self->_motionDensityBackground, 0);
  objc_storeStrong((id *)&self->_dataSample, 0);
  objc_storeStrong((id *)&self->_awClientOverride, 0);
  objc_storeStrong((id *)&self->_awClient, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (void)_handleMotionDataSample:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_24782A000, a2, OS_LOG_TYPE_DEBUG, "Handling motion data sample: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_setMotionDetectionMonitoringEnabled:(NSObject *)a3 .cold.1(char a1, void *a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a2 localizedDescription];
  v6[0] = 67109378;
  v6[1] = a1 & 1;
  __int16 v7 = 2112;
  uint64_t v8 = v5;
  _os_log_error_impl(&dword_24782A000, a3, OS_LOG_TYPE_ERROR, "Ambient motion detection monitoring: %{BOOL}d failed : %@", (uint8_t *)v6, 0x12u);
}

void __55__AMMotionDetectionTriggerManager__updateWatchdogTimer__block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_24782A000, log, OS_LOG_TYPE_ERROR, "Watchdog timer creation failed.", v1, 2u);
}

@end
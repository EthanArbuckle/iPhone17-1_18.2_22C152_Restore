@interface CBColorFilter
+ ($1AB5FA073B851C12C2339EC22442E995)calculateTristimulusForChromaticity:(id)a3 andLux:(double)a4;
+ (double)calculateCCTForChromaticity:(id)a3;
+ (double)calculateCCTForTristimulus:(id)a3;
- (BOOL)ALSServiceConformsToPolicy:(id)a3;
- (BOOL)addHIDServiceClient:(__IOHIDServiceClient *)a3;
- (BOOL)forceSampleUpdate;
- (BOOL)handleHIDEvent:(__IOHIDEvent *)a3 from:(__IOHIDServiceClient *)a4;
- (BOOL)hasExtFrontSensor;
- (BOOL)hasExtRearSensor;
- (BOOL)removeHIDServiceClient:(__IOHIDServiceClient *)a3;
- (CBColorFilter)initWithQueue:(id)a3;
- (CBColorSample)sample;
- (id)newColorSampleConditionWeighted;
- (id)newColorSampleLinearWeightedForSamples:(id)a3;
- (id)newColorSampleLinearWeightedForServices:(id)a3;
- (id)newColorSampleLogWeighted;
- (id)newColorSampleLogWeightedForSamples:(id)a3;
- (id)newColorSampleWinnerTakesAll;
- (unint64_t)evaluatedFilterMode;
- (unint64_t)mode;
- (unint64_t)sensorPolicy;
- (void)dealloc;
- (void)registerNotificationBlock:(id)a3;
- (void)reportSampleUpdate;
- (void)sendNotificationForKey:(id)a3 withValue:(id)a4;
- (void)setMode:(unint64_t)a3;
- (void)setSensorPolicy:(unint64_t)a3;
- (void)unregisterNotificationBlock;
- (void)updateSample;
- (void)updateValidServices;
@end

@implementation CBColorFilter

- (CBColorFilter)initWithQueue:(id)a3
{
  v16 = self;
  SEL v15 = a2;
  id v14 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CBColorFilter;
  v16 = [(CBModule *)&v13 initWithQueue:a3];
  if (v16)
  {
    os_log_t v3 = os_log_create("com.apple.CoreBrightness.CBColorFilter", "default");
    v16->super._logHandle = (OS_os_log *)v3;
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v16->_services = v4;
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v16->_validServices = v5;
    v16->_mode = 6;
    v16->_sensorPolicy = 255;
  }
  else
  {
    v12 = 0;
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      inited = init_default_corebrightness_log();
    }
    v12 = inited;
    char v11 = 16;
    if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR))
    {
      log = v12;
      os_log_type_t type = v11;
      __os_log_helper_16_0_0(v10);
      _os_log_error_impl(&dword_1BA438000, log, type, "failed to initialise self", v10, 2u);
    }
  }
  return v16;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  if (self->super._logHandle)
  {

    v4->super._logHandle = 0;
  }

  if (v4->super._notificationBlock) {
    _Block_release(v4->super._notificationBlock);
  }
  v2.receiver = v4;
  v2.super_class = (Class)CBColorFilter;
  [(CBModule *)&v2 dealloc];
}

- (void)setMode:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a3 == 1 || a3 == 5)
  {
    if (self->super._logHandle)
    {
      logHandle = self->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      logHandle = inited;
    }
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_0_1_8_0((uint64_t)v10, a3);
      _os_log_error_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_ERROR, "invalid mode update (%lu)", v10, 0xCu);
    }
  }
  else
  {
    if (self->super._logHandle)
    {
      v4 = self->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v3 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v3 = init_default_corebrightness_log();
      }
      v4 = v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_2_8_0_8_0((uint64_t)v9, self->_mode, a3);
      _os_log_impl(&dword_1BA438000, v4, OS_LOG_TYPE_DEFAULT, "current=%lu new=%lu", v9, 0x16u);
    }
    if (self->_mode != a3)
    {
      self->_mode = a3;
      [(CBColorFilter *)self updateSample];
    }
  }
}

- (BOOL)addHIDServiceClient:(__IOHIDServiceClient *)a3
{
  SEL v15 = self;
  SEL v14 = a2;
  objc_super v13 = a3;
  char v12 = 0;
  uint64_t v11 = [[CBALSService alloc] initWithHIDALSServiceClient:a3];
  if (v11)
  {
    [(NSMutableArray *)v15->_services addObject:v11];
    [(CBColorFilter *)v15 updateValidServices];

    char v12 = 1;
  }
  else
  {
    v10 = 0;
    if (v15->super._logHandle)
    {
      logHandle = v15->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      logHandle = inited;
    }
    v10 = logHandle;
    char v9 = 16;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
    {
      log = v10;
      os_log_type_t type = v9;
      __os_log_helper_16_0_0(v8);
      _os_log_error_impl(&dword_1BA438000, log, type, "failed to create wrapper for the service", v8, 2u);
    }
  }
  return v12 & 1;
}

- (BOOL)handleHIDEvent:(__IOHIDEvent *)a3 from:(__IOHIDServiceClient *)a4
{
  return 0;
}

uint64_t __37__CBColorFilter_handleHIDEvent_from___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 conformsToHIDService:*(void *)(a1 + 32)];
  if (result)
  {
    uint64_t result = [a2 setEvent:*(void *)(a1 + 40)];
    *a4 = 1;
  }
  return result;
}

- (BOOL)removeHIDServiceClient:(__IOHIDServiceClient *)a3
{
  v16 = self;
  SEL v15 = a2;
  SEL v14 = a3;
  uint64_t v7 = 0;
  v8 = &v7;
  int v9 = 1375731712;
  int v10 = 48;
  uint64_t v11 = __Block_byref_object_copy__20;
  char v12 = __Block_byref_object_dispose__20;
  uint64_t v13 = 0;
  -[NSMutableArray enumerateObjectsUsingBlock:](self->_services, "enumerateObjectsUsingBlock:");
  if (v8[5])
  {
    id v3 = (id)v8[5];
    [(NSMutableArray *)v16->_validServices removeObject:v8[5]];
    [(NSMutableArray *)v16->_services removeObject:v8[5]];
    char v6 = [(CBColorFilter *)v16 hasExtRearSensor];
    char v5 = [(CBColorFilter *)v16 hasExtFrontSensor];
    if ((v6 & 1) == 0) {
      +[CBAnalyticsManager stopReporting:2];
    }
    if ((v5 & 1) == 0)
    {
      +[CBAnalyticsManager stopReporting:1];
      +[CBAnalyticsManager stopReporting:3];
    }
  }
  _Block_object_dispose(&v7, 8);
  return 1;
}

uint64_t __40__CBColorFilter_removeHIDServiceClient___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 service];
  if (result == *(void *)(a1 + 40))
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = a2;
    *a4 = 1;
  }
  return result;
}

- (void)setSensorPolicy:(unint64_t)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self->_sensorPolicy != a3)
  {
    self->_sensorPolicy = a3;
    [(CBColorFilter *)self updateValidServices];
    if (self->super._logHandle)
    {
      logHandle = self->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      logHandle = inited;
    }
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_0_8_66((uint64_t)v6, self->_sensorPolicy, (uint64_t)self->_validServices);
      _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "policy=0x%lX valid=%{public}@", v6, 0x16u);
    }
  }
}

- (unint64_t)evaluatedFilterMode
{
  return self->_mode;
}

- (id)newColorSampleLinearWeightedForServices:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  v40 = self;
  SEL v39 = a2;
  id v38 = a3;
  uint64_t v33 = 0;
  v34 = (double *)&v33;
  int v35 = 0x20000000;
  int v36 = 32;
  uint64_t v37 = 0;
  double v32 = 0.0;
  uint64_t v27 = 0;
  v28 = (double *)&v27;
  int v29 = 0x20000000;
  int v30 = 32;
  uint64_t v31 = 0;
  uint64_t v20 = 0;
  v21 = (double *)&v20;
  int v22 = 0x10000000;
  int v23 = 48;
  v24 = &unk_1BA6340B5;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  os_log_t oslog = 0;
  if (self->super._logHandle)
  {
    logHandle = v40->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    logHandle = inited;
  }
  os_log_t oslog = logHandle;
  os_log_type_t type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v42, (uint64_t)v38);
    _os_log_debug_impl(&dword_1BA438000, oslog, type, "ALS services: %@", v42, 0xCu);
  }
  memset(__b, 0, sizeof(__b));
  id obj = v38;
  uint64_t v13 = [v38 countByEnumeratingWithState:__b objects:v41 count:16];
  if (v13)
  {
    uint64_t v9 = *(void *)__b[2];
    uint64_t v10 = 0;
    unint64_t v11 = v13;
    while (1)
    {
      uint64_t v8 = v10;
      if (*(void *)__b[2] != v9) {
        objc_enumerationMutation(obj);
      }
      id v17 = 0;
      id v17 = *(id *)(__b[1] + 8 * v10);
      if ([v17 validData])
      {
        [v17 lux];
        v28[3] = v28[3] + v3;
      }
      ++v10;
      if (v8 + 1 >= v11)
      {
        uint64_t v10 = 0;
        unint64_t v11 = [obj countByEnumeratingWithState:__b objects:v41 count:16];
        if (!v11) {
          break;
        }
      }
    }
  }
  if (v28[3] != 0.0)
  {
    objc_msgSend(v38, "enumerateObjectsUsingBlock:");
    +[CBColorFilter calculateCCTForChromaticity:](CBColorFilter, "calculateCCTForChromaticity:", v21[4], v21[5]);
    double v32 = v4;
  }
  uint64_t v7 = [CBColorSample alloc];
  char v6 = -[CBColorSample initWithChromaticity:illuminance:andTempterature:](v7, "initWithChromaticity:illuminance:andTempterature:", v21[4], v21[5], v34[3], v32);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);
  return v6;
}

void __57__CBColorFilter_newColorSampleLinearWeightedForServices___block_invoke(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([a2 validData])
  {
    [a2 lux];
    *(float *)&double v2 = v2 / *(double *)(*(void *)(a1[5] + 8) + 24);
    float v13 = *(float *)&v2;
    [a2 x];
    *(double *)(*(void *)(a1[6] + 8) + 32) = *(double *)(*(void *)(a1[6] + 8) + 32) + v3 * v13;
    [a2 y];
    *(double *)(*(void *)(a1[6] + 8) + 40) = *(double *)(*(void *)(a1[6] + 8) + 40) + v4 * v13;
    [a2 lux];
    *(double *)(*(void *)(a1[7] + 8) + 24) = *(double *)(*(void *)(a1[7] + 8) + 24) + v5 * v13;
    if (*(void *)(a1[4] + 16))
    {
      unint64_t v11 = *(NSObject **)(a1[4] + 16);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      unint64_t v11 = inited;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = [a2 service];
      [a2 x];
      uint64_t v9 = v6;
      [a2 y];
      __os_log_helper_16_0_4_8_0_8_0_8_0_8_0((uint64_t)v15, v8, v9, v7, COERCE__INT64(v13));
      _os_log_debug_impl(&dword_1BA438000, v11, OS_LOG_TYPE_DEBUG, "service %p xy= %f | %f ratio=%f", v15, 0x2Au);
    }
  }
}

- (id)newColorSampleLinearWeightedForSamples:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  int v36 = self;
  SEL v35 = a2;
  id v34 = a3;
  uint64_t v29 = 0;
  int v30 = (double *)&v29;
  int v31 = 0x20000000;
  int v32 = 32;
  uint64_t v33 = 0;
  double v28 = 0.0;
  uint64_t v23 = 0;
  v24 = (double *)&v23;
  int v25 = 0x20000000;
  int v26 = 32;
  uint64_t v27 = 0;
  uint64_t v16 = 0;
  id v17 = (double *)&v16;
  int v18 = 0x10000000;
  int v19 = 48;
  uint64_t v20 = &unk_1BA6340B5;
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  memset(__b, 0, sizeof(__b));
  id obj = v34;
  uint64_t v13 = [v34 countByEnumeratingWithState:__b objects:v37 count:16];
  if (v13)
  {
    uint64_t v9 = *(void *)__b[2];
    uint64_t v10 = 0;
    unint64_t v11 = v13;
    while (1)
    {
      uint64_t v8 = v10;
      if (*(void *)__b[2] != v9) {
        objc_enumerationMutation(obj);
      }
      id v15 = 0;
      id v15 = *(id *)(__b[1] + 8 * v10);
      [v15 lux];
      v24[3] = v24[3] + v3;
      ++v10;
      if (v8 + 1 >= v11)
      {
        uint64_t v10 = 0;
        unint64_t v11 = [obj countByEnumeratingWithState:__b objects:v37 count:16];
        if (!v11) {
          break;
        }
      }
    }
  }
  if (v24[3] != 0.0)
  {
    objc_msgSend(v34, "enumerateObjectsUsingBlock:");
    +[CBColorFilter calculateCCTForChromaticity:](CBColorFilter, "calculateCCTForChromaticity:", v17[4], v17[5]);
    double v28 = v4;
  }
  uint64_t v7 = [CBColorSample alloc];
  uint64_t v6 = -[CBColorSample initWithChromaticity:illuminance:andTempterature:](v7, "initWithChromaticity:illuminance:andTempterature:", v17[4], v17[5], v30[3], v28);
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);
  return v6;
}

void __56__CBColorFilter_newColorSampleLinearWeightedForSamples___block_invoke(void *a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [a2 lux];
  *(float *)&double v2 = v2 / *(double *)(*(void *)(a1[5] + 8) + 24);
  float v12 = *(float *)&v2;
  [a2 xy];
  *(double *)(*(void *)(a1[6] + 8) + 32) = *(double *)(*(void *)(a1[6] + 8) + 32) + v3 * v12;
  [a2 xy];
  *(double *)(*(void *)(a1[6] + 8) + 40) = *(double *)(*(void *)(a1[6] + 8) + 40) + v4 * v12;
  [a2 lux];
  *(double *)(*(void *)(a1[7] + 8) + 24) = *(double *)(*(void *)(a1[7] + 8) + 24) + v5 * v12;
  if (*(void *)(a1[4] + 16))
  {
    uint64_t v10 = *(NSObject **)(a1[4] + 16);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    uint64_t v10 = inited;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    [a2 xy];
    uint64_t v8 = v6;
    [a2 xy];
    __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v14, v8, v7, COERCE__INT64(v12));
    _os_log_debug_impl(&dword_1BA438000, v10, OS_LOG_TYPE_DEBUG, "xy= %f | %f ratio=%f", v14, 0x20u);
  }
}

- (id)newColorSampleLogWeightedForSamples:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v37 = self;
  SEL v36 = a2;
  id v35 = a3;
  uint64_t v30 = 0;
  int v31 = (double *)&v30;
  int v32 = 0x20000000;
  int v33 = 32;
  uint64_t v34 = 0;
  double v29 = 0.0;
  uint64_t v24 = 0;
  int v25 = (double *)&v24;
  int v26 = 0x20000000;
  int v27 = 32;
  uint64_t v28 = 0;
  uint64_t v17 = 0;
  int v18 = (double *)&v17;
  int v19 = 0x10000000;
  int v20 = 48;
  uint64_t v21 = &unk_1BA6340B5;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  memset(__b, 0, sizeof(__b));
  id obj = v35;
  uint64_t v14 = [v35 countByEnumeratingWithState:__b objects:v38 count:16];
  if (v14)
  {
    uint64_t v10 = *(void *)__b[2];
    uint64_t v11 = 0;
    unint64_t v12 = v14;
    while (1)
    {
      uint64_t v9 = v11;
      if (*(void *)__b[2] != v10) {
        objc_enumerationMutation(obj);
      }
      id v16 = 0;
      id v16 = *(id *)(__b[1] + 8 * v11);
      [v16 lux];
      double v4 = log10(v3 + 1.0);
      v25[3] = v25[3] + v4;
      ++v11;
      if (v9 + 1 >= v12)
      {
        uint64_t v11 = 0;
        unint64_t v12 = [obj countByEnumeratingWithState:__b objects:v38 count:16];
        if (!v12) {
          break;
        }
      }
    }
  }
  if (v25[3] != 0.0)
  {
    objc_msgSend(v35, "enumerateObjectsUsingBlock:");
    +[CBColorFilter calculateCCTForChromaticity:](CBColorFilter, "calculateCCTForChromaticity:", v18[4], v18[5]);
    double v29 = v5;
  }
  uint64_t v8 = [CBColorSample alloc];
  uint64_t v7 = -[CBColorSample initWithChromaticity:illuminance:andTempterature:](v8, "initWithChromaticity:illuminance:andTempterature:", v18[4], v18[5], v31[3], v29);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);
  return v7;
}

void __53__CBColorFilter_newColorSampleLogWeightedForSamples___block_invoke(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [a2 lux];
  float v3 = log10(v2 + 1.0) / *(double *)(*(void *)(a1[5] + 8) + 24);
  float v13 = v3;
  [a2 xy];
  *(double *)(*(void *)(a1[6] + 8) + 32) = *(double *)(*(void *)(a1[6] + 8) + 32) + v4 * v13;
  [a2 xy];
  *(double *)(*(void *)(a1[6] + 8) + 40) = *(double *)(*(void *)(a1[6] + 8) + 40) + v5 * v13;
  [a2 lux];
  *(double *)(*(void *)(a1[7] + 8) + 24) = *(double *)(*(void *)(a1[7] + 8) + 24) + v6 * v13;
  if (*(void *)(a1[4] + 16))
  {
    uint64_t v11 = *(NSObject **)(a1[4] + 16);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    uint64_t v11 = inited;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    [a2 xy];
    uint64_t v9 = v7;
    [a2 xy];
    __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v15, v9, v8, COERCE__INT64(v13));
    _os_log_debug_impl(&dword_1BA438000, v11, OS_LOG_TYPE_DEBUG, "xy= %f | %f ratio=%f", v15, 0x20u);
  }
}

- (id)newColorSampleLogWeighted
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v39 = self;
  SEL v38 = a2;
  uint64_t v33 = 0;
  uint64_t v34 = (double *)&v33;
  int v35 = 0x20000000;
  int v36 = 32;
  uint64_t v37 = 0;
  double v32 = 0.0;
  uint64_t v27 = 0;
  uint64_t v28 = (double *)&v27;
  int v29 = 0x20000000;
  int v30 = 32;
  uint64_t v31 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = (double *)&v20;
  int v22 = 0x10000000;
  int v23 = 48;
  uint64_t v24 = &unk_1BA6340B5;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  os_log_t oslog = 0;
  if (self->super._logHandle)
  {
    logHandle = v39->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    logHandle = inited;
  }
  os_log_t oslog = logHandle;
  os_log_type_t type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v41, (uint64_t)v39->_validServices);
    _os_log_debug_impl(&dword_1BA438000, oslog, type, "ALS services: %@", v41, 0xCu);
  }
  memset(__b, 0, sizeof(__b));
  id obj = v39->_validServices;
  uint64_t v13 = [(NSMutableArray *)obj countByEnumeratingWithState:__b objects:v40 count:16];
  if (v13)
  {
    uint64_t v9 = *(void *)__b[2];
    uint64_t v10 = 0;
    unint64_t v11 = v13;
    while (1)
    {
      uint64_t v8 = v10;
      if (*(void *)__b[2] != v9) {
        objc_enumerationMutation(obj);
      }
      id v17 = 0;
      id v17 = *(id *)(__b[1] + 8 * v10);
      if ([v17 validData])
      {
        [v17 lux];
        double v3 = log10(v2 + 1.0);
        v28[3] = v28[3] + v3;
      }
      ++v10;
      if (v8 + 1 >= v11)
      {
        uint64_t v10 = 0;
        unint64_t v11 = [(NSMutableArray *)obj countByEnumeratingWithState:__b objects:v40 count:16];
        if (!v11) {
          break;
        }
      }
    }
  }
  if (v28[3] != 0.0)
  {
    -[NSMutableArray enumerateObjectsUsingBlock:](v39->_validServices, "enumerateObjectsUsingBlock:");
    +[CBColorFilter calculateCCTForChromaticity:](CBColorFilter, "calculateCCTForChromaticity:", v21[4], v21[5]);
    double v32 = v4;
  }
  uint64_t v7 = [CBColorSample alloc];
  double v6 = -[CBColorSample initWithChromaticity:illuminance:andTempterature:](v7, "initWithChromaticity:illuminance:andTempterature:", v21[4], v21[5], v34[3], v32);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);
  return v6;
}

void __42__CBColorFilter_newColorSampleLogWeighted__block_invoke(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([a2 validData])
  {
    [a2 lux];
    float v3 = log10(v2 + 1.0) / *(double *)(*(void *)(a1[5] + 8) + 24);
    float v14 = v3;
    [a2 x];
    *(double *)(*(void *)(a1[6] + 8) + 32) = *(double *)(*(void *)(a1[6] + 8) + 32) + v4 * v14;
    [a2 y];
    *(double *)(*(void *)(a1[6] + 8) + 40) = *(double *)(*(void *)(a1[6] + 8) + 40) + v5 * v14;
    [a2 lux];
    *(double *)(*(void *)(a1[7] + 8) + 24) = *(double *)(*(void *)(a1[7] + 8) + 24) + v6 * v14;
    if (*(void *)(a1[4] + 16))
    {
      unint64_t v12 = *(NSObject **)(a1[4] + 16);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      unint64_t v12 = inited;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = [a2 service];
      [a2 x];
      uint64_t v10 = v7;
      [a2 y];
      __os_log_helper_16_0_4_8_0_8_0_8_0_8_0((uint64_t)v16, v9, v10, v8, COERCE__INT64(v14));
      _os_log_debug_impl(&dword_1BA438000, v12, OS_LOG_TYPE_DEBUG, "service %p xy= %f | %f ratio=%f", v16, 0x2Au);
    }
  }
}

- (id)newColorSampleWinnerTakesAll
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v26 = self;
  SEL v25 = a2;
  uint64_t v20 = 0;
  uint64_t v21 = (double *)&v20;
  int v22 = 0x20000000;
  int v23 = 32;
  uint64_t v24 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = (double *)&v15;
  int v17 = 0x20000000;
  int v18 = 32;
  uint64_t v19 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = (double *)&v7;
  int v9 = 0x10000000;
  int v10 = 56;
  unint64_t v11 = &unk_1BA6340B5;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  if (self->super._logHandle)
  {
    logHandle = v26->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    logHandle = inited;
  }
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v27, (uint64_t)v26->_validServices);
    _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "ALS services: %@", v27, 0xCu);
  }
  -[NSMutableArray enumerateObjectsUsingBlock:](v26->_validServices, "enumerateObjectsUsingBlock:");
  double v4 = [CBColorSample alloc];
  float v3 = -[CBColorSample initWithTristimulus:illuminance:andTempterature:](v4, "initWithTristimulus:illuminance:andTempterature:", v8[4], v8[5], v8[6], v21[3], v16[3]);
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v20, 8);
  return v3;
}

uint64_t __45__CBColorFilter_newColorSampleWinnerTakesAll__block_invoke(void *a1, void *a2)
{
  uint64_t result = [a2 validData];
  if (result)
  {
    double v9 = *(double *)(*(void *)(a1[4] + 8) + 24);
    uint64_t result = [a2 lux];
    if (v9 < v3)
    {
      objc_msgSend(a2, "lux", v9);
      *(void *)(*(void *)(a1[4] + 8) + 24) = v4;
      [a2 CCT];
      *(void *)(*(void *)(a1[5] + 8) + 24) = v5;
      [a2 event];
      IOHIDEventGetDoubleValue();
      *(void *)(*(void *)(a1[6] + 8) + 32) = v6;
      [a2 event];
      IOHIDEventGetDoubleValue();
      *(void *)(*(void *)(a1[6] + 8) + 40) = v7;
      [a2 event];
      uint64_t result = IOHIDEventGetDoubleValue();
      *(void *)(*(void *)(a1[6] + 8) + 48) = v8;
    }
  }
  return result;
}

- (id)newColorSampleConditionWeighted
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  v103 = self;
  SEL v102 = a2;
  id v101 = 0;
  uint64_t v94 = 0;
  v95 = &v94;
  int v96 = 1375731712;
  int v97 = 48;
  v98 = __Block_byref_object_copy__20;
  v99 = __Block_byref_object_dispose__20;
  id v100 = 0;
  id v100 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v87 = 0;
  v88 = &v87;
  int v89 = 1375731712;
  int v90 = 48;
  v91 = __Block_byref_object_copy__20;
  v92 = __Block_byref_object_dispose__20;
  id v93 = 0;
  id v93 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v86 = 0;
  id v85 = 0;
  validServices = v103->_validServices;
  uint64_t v79 = MEMORY[0x1E4F143A8];
  int v80 = -1073741824;
  int v81 = 0;
  v82 = __48__CBColorFilter_newColorSampleConditionWeighted__block_invoke;
  v83 = &unk_1E621A028;
  v84 = &v87;
  -[NSMutableArray enumerateObjectsUsingBlock:](validServices, "enumerateObjectsUsingBlock:");
  double v3 = v103->_validServices;
  uint64_t v73 = MEMORY[0x1E4F143A8];
  int v74 = -1073741824;
  int v75 = 0;
  v76 = __48__CBColorFilter_newColorSampleConditionWeighted__block_invoke_2;
  v77 = &unk_1E621A028;
  v78 = &v94;
  -[NSMutableArray enumerateObjectsUsingBlock:](v3, "enumerateObjectsUsingBlock:");
  os_log_t oslog = 0;
  if (v103->super._logHandle)
  {
    logHandle = v103->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    logHandle = inited;
  }
  os_log_t oslog = logHandle;
  os_log_type_t type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v109, v95[5]);
    _os_log_debug_impl(&dword_1BA438000, oslog, type, "rear sensors: %@", v109, 0xCu);
  }
  os_log_t v70 = 0;
  if (v103->super._logHandle)
  {
    v50 = v103->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t v49 = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t v49 = init_default_corebrightness_log();
    }
    v50 = v49;
  }
  os_log_t v70 = v50;
  os_log_type_t v69 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v108, v88[5]);
    _os_log_debug_impl(&dword_1BA438000, v70, v69, "front sensors: %@", v108, 0xCu);
  }
  if ([(id)v95[5] count])
  {
    id v86 = [(CBColorFilter *)v103 newColorSampleLinearWeightedForServices:v95[5]];
    if ([(CBColorFilter *)v103 hasExtRearSensor])
    {
      [v86 setType:2];
      +[CBAnalyticsManager handleColorSample:v86];
    }
    os_log_t v68 = 0;
    if (v103->super._logHandle)
    {
      v48 = v103->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v47 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v47 = init_default_corebrightness_log();
      }
      v48 = v47;
    }
    os_log_t v68 = v48;
    os_log_type_t v67 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
    {
      [v86 lux];
      uint64_t v46 = v4;
      [v86 xy];
      uint64_t v65 = v5;
      uint64_t v66 = v6;
      uint64_t v45 = v5;
      [v86 xy];
      uint64_t v63 = v7;
      uint64_t v64 = v8;
      uint64_t v44 = v8;
      [v86 CCT];
      __os_log_helper_16_0_4_8_0_8_0_8_0_8_0((uint64_t)v107, v46, v45, v44, v9);
      _os_log_debug_impl(&dword_1BA438000, v68, v67, "rear consolidated sample: lux=%f x=%f y=%f CCT=%f", v107, 0x2Au);
    }
  }
  if ([(id)v88[5] count])
  {
    id v85 = [(CBColorFilter *)v103 newColorSampleLinearWeightedForServices:v88[5]];
    if ([(CBColorFilter *)v103 hasExtFrontSensor])
    {
      [v85 setType:1];
      +[CBAnalyticsManager handleColorSample:v85];
    }
    os_log_t v62 = 0;
    if (v103->super._logHandle)
    {
      uint64_t v43 = v103->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v42 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v42 = init_default_corebrightness_log();
      }
      uint64_t v43 = v42;
    }
    os_log_t v62 = v43;
    os_log_type_t v61 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
    {
      [v85 lux];
      uint64_t v41 = v10;
      [v85 xy];
      uint64_t v59 = v11;
      uint64_t v60 = v12;
      uint64_t v40 = v11;
      [v85 xy];
      uint64_t v57 = v13;
      uint64_t v58 = v14;
      uint64_t v39 = v14;
      [v85 CCT];
      __os_log_helper_16_0_4_8_0_8_0_8_0_8_0((uint64_t)v106, v41, v40, v39, v15);
      _os_log_debug_impl(&dword_1BA438000, v62, v61, "front consolidated sample: lux=%f x=%f y=%f CCT=%f", v106, 0x2Au);
    }
  }
  if (v86 && v85)
  {
    [v85 lux];
    if (v16 > 15.0)
    {
      objc_msgSend(v86, "lux", v16);
      if (v17 > 15.0)
      {
        id v56 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v86, v85, 0);
        if (v56)
        {
          [v86 lux];
          double v38 = v18;
          [v85 lux];
          if (v38 <= v19) {
            id v101 = -[CBColorFilter newColorSampleLogWeightedForSamples:](v103, "newColorSampleLogWeightedForSamples:", v56, v38);
          }
          else {
            id v101 = -[CBColorFilter newColorSampleLinearWeightedForSamples:](v103, "newColorSampleLinearWeightedForSamples:", v56, v38);
          }
        }
        else
        {
          os_log_t v55 = 0;
          if (v103->super._logHandle)
          {
            uint64_t v37 = v103->super._logHandle;
          }
          else
          {
            if (_COREBRIGHTNESS_LOG_DEFAULT) {
              uint64_t v36 = _COREBRIGHTNESS_LOG_DEFAULT;
            }
            else {
              uint64_t v36 = init_default_corebrightness_log();
            }
            uint64_t v37 = v36;
          }
          os_log_t v55 = v37;
          os_log_type_t v54 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            uint64_t v34 = v55;
            os_log_type_t v35 = v54;
            __os_log_helper_16_0_0(v53);
            _os_log_error_impl(&dword_1BA438000, v34, v35, "error: couldn't allocate samples array", v53, 2u);
          }
        }

        goto LABEL_71;
      }
LABEL_62:
      id v101 = v85;
      goto LABEL_71;
    }
    objc_msgSend(v86, "lux", v16);
    if (v20 <= 10.0) {
      goto LABEL_62;
    }
LABEL_58:
    id v101 = v86;
    goto LABEL_71;
  }
  if (v86) {
    goto LABEL_58;
  }
  if (v85) {
    goto LABEL_62;
  }
  if (v103->super._logHandle)
  {
    uint64_t v33 = v103->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t v32 = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t v32 = init_default_corebrightness_log();
    }
    uint64_t v33 = v32;
  }
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    __os_log_helper_16_2_4_8_66_8_66_8_66_8_66((uint64_t)v105, v95[5], (uint64_t)v86, v88[5], (uint64_t)v85);
    _os_log_error_impl(&dword_1BA438000, v33, OS_LOG_TYPE_ERROR, "ERROR: no samples (rear: %{public}@ -> %{public}@ | front: %{public}@ -> %{public}@)", v105, 0x2Au);
  }
LABEL_71:
  if ([(CBColorFilter *)v103 hasExtFrontSensor]
    || [(CBColorFilter *)v103 hasExtRearSensor])
  {
    [v101 setType:3];
    +[CBAnalyticsManager handleColorSample:v101];
  }

  if (v103->super._logHandle)
  {
    uint64_t v31 = v103->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t v30 = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t v30 = init_default_corebrightness_log();
    }
    uint64_t v31 = v30;
  }
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
    [v101 lux];
    uint64_t v29 = v21;
    [v101 xy];
    uint64_t v28 = v22;
    [v101 xy];
    uint64_t v27 = v23;
    [v101 CCT];
    __os_log_helper_16_0_4_8_0_8_0_8_0_8_0((uint64_t)v104, v29, v28, v27, v24);
    _os_log_debug_impl(&dword_1BA438000, v31, OS_LOG_TYPE_DEBUG, "result sample: lux=%f x=%f y=%f CCT=%f", v104, 0x2Au);
  }
  id v26 = v101;
  _Block_object_dispose(&v87, 8);
  _Block_object_dispose(&v94, 8);
  return v26;
}

uint64_t __48__CBColorFilter_newColorSampleConditionWeighted__block_invoke(uint64_t a1, void *a2)
{
  if ([a2 location] == 257 || (uint64_t result = objc_msgSend(a2, "builtIn"), (result & 1) != 0))
  {
    uint64_t result = [a2 validData];
    if (result) {
      return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:a2];
    }
  }
  return result;
}

uint64_t __48__CBColorFilter_newColorSampleConditionWeighted__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = [a2 location];
  if (result == 258)
  {
    uint64_t result = [a2 validData];
    if (result) {
      return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:a2];
    }
  }
  return result;
}

- (void)updateSample
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = 0;
  uint64_t v4 = [(CBColorFilter *)self evaluatedFilterMode];
  switch(v4)
  {
    case 3:
      uint64_t v5 = [(CBColorFilter *)self newColorSampleLinearWeightedForServices:self->_validServices];
      break;
    case 4:
      uint64_t v5 = [(CBColorFilter *)self newColorSampleLogWeighted];
      break;
    case 2:
      uint64_t v5 = [(CBColorFilter *)self newColorSampleWinnerTakesAll];
      break;
    case 6:
      uint64_t v5 = [(CBColorFilter *)self newColorSampleConditionWeighted];
      break;
    default:
      if (self->super._logHandle)
      {
        logHandle = self->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t inited = init_default_corebrightness_log();
        }
        logHandle = inited;
      }
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_0_1_8_0((uint64_t)v7, v4);
        _os_log_error_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_ERROR, "ERROR: unsupported mode %lu", v7, 0xCu);
      }
      break;
  }
  if (v5)
  {

    self->_sample = v5;
    [(CBColorSample *)self->_sample setMode:v4];
  }
  [(CBColorFilter *)self reportSampleUpdate];
}

- (void)reportSampleUpdate
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (self->super._logHandle)
  {
    logHandle = self->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    logHandle = inited;
  }
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    unint64_t mode = self->_mode;
    [(CBColorSample *)self->_sample lux];
    uint64_t v10 = v2;
    [(CBColorSample *)self->_sample CCT];
    uint64_t v11 = v3;
    [(CBColorSample *)self->_sample XYZ];
    uint64_t v12 = v4;
    [(CBColorSample *)self->_sample XYZ];
    uint64_t v13 = v5;
    [(CBColorSample *)self->_sample XYZ];
    uint64_t v15 = v6;
    [(CBColorSample *)self->_sample xy];
    uint64_t v14 = v7;
    [(CBColorSample *)self->_sample xy];
    __os_log_helper_16_0_8_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v24, mode, v10, v11, v12, v13, v15, v14, v8);
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_INFO, "sample update (mode %lu): lux=%f CCT=%f X=%f Y=%f Z=%f (xy = %f | %f)", v24, 0x52u);
  }
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v22)
  {
    id v21 = (id)[objc_alloc(NSNumber) initWithUnsignedInteger:self->_sensorPolicy];
    id v20 = (id)[objc_alloc(NSNumber) initWithUnsignedInteger:self->_mode];
    if (v21 && v20)
    {
      id v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v21, @"policy", v20, @"mode", 0);
      if (v19) {
        [v22 setObject:v19 forKey:@"cfg"];
      }
    }
    id v18 = [(CBColorSample *)self->_sample copyDataInDictionary];
    if (v18) {
      [v22 setObject:v18 forKey:@"sample"];
    }

    -[NSMutableArray enumerateObjectsUsingBlock:](self->_validServices, "enumerateObjectsUsingBlock:");
    [(CBColorFilter *)self sendNotificationForKey:@"ColorSample" withValue:v22];
  }
}

void __35__CBColorFilter_reportSampleUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v4 = (id)[a2 copyDataInDictionary];
  if (v4)
  {
    id v3 = (id)objc_msgSend([NSString alloc], "initWithFormat:", @"%lu", objc_msgSend(a2, "registryID"));
    if (v3) {
      [*(id *)(a1 + 32) setObject:v4 forKey:v3];
    }
  }
}

- (void)registerNotificationBlock:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  [(CBColorFilter *)self unregisterNotificationBlock];
  if (a3) {
    self->super._notificationBlock = _Block_copy(a3);
  }
  if (self->super._logHandle)
  {
    logHandle = self->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    logHandle = inited;
  }
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_0_1_8_0((uint64_t)v7, (uint64_t)self->super._notificationBlock);
    _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "notificationBlock = %p", v7, 0xCu);
  }
}

- (void)unregisterNotificationBlock
{
  if (self->super._notificationBlock)
  {
    _Block_release(self->super._notificationBlock);
    self->super._notificationBlock = 0;
  }
}

- (void)sendNotificationForKey:(id)a3 withValue:(id)a4
{
  if (self->super._notificationBlock) {
    (*((void (**)(void))self->super._notificationBlock + 2))();
  }
}

- (BOOL)ALSServiceConformsToPolicy:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v6 = 1;
  if ([a3 builtIn]) {
    BOOL v6 = (self->_sensorPolicy & 8) != 0;
  }
  if (([a3 builtIn] & 1) == 0 && (self->_sensorPolicy & 4) == 0) {
    BOOL v6 = 0;
  }
  if (([a3 builtIn] & 1) == 0)
  {
    if ([a3 location] == 257 && (self->_sensorPolicy & 1) == 0) {
      BOOL v6 = 0;
    }
    if ([a3 location] == 258 && (self->_sensorPolicy & 2) == 0) {
      BOOL v6 = 0;
    }
  }
  if (self->super._logHandle)
  {
    logHandle = self->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    logHandle = inited;
  }
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_0_5_8_0_4_0_8_0_8_0_4_0((uint64_t)v9, [a3 registryID], objc_msgSend(a3, "builtIn") & 1, objc_msgSend(a3, "location"), self->_sensorPolicy, v6);
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "ID=0x%lX internal=%d location=0x%lX | policy=0x%lX | OK=%d", v9, 0x2Cu);
  }
  return v6;
}

- (void)updateValidServices
{
}

uint64_t __36__CBColorFilter_updateValidServices__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) ALSServiceConformsToPolicy:a2];
  if (result) {
    return [*(id *)(*(void *)(a1 + 32) + 40) addObject:a2];
  }
  return result;
}

+ (double)calculateCCTForChromaticity:(id)a3
{
  long double __x = (a3.var0 - 0.332) / (a3.var1 - 0.1858);
  double v4 = pow(__x, 3.0);
  return 3525.0 * pow(__x, 2.0) + -449.0 * v4 + -6823.3 * __x + 5520.33;
}

+ (double)calculateCCTForTristimulus:(id)a3
{
  double v6 = -1.0;
  double v5 = a3.var0 + a3.var1 + a3.var2;
  if (v5 != 0.0)
  {
    +[CBColorFilter calculateCCTForChromaticity:](CBColorFilter, "calculateCCTForChromaticity:", a3.var0 / v5, a3.var1 / v5);
    return v3;
  }
  return v6;
}

+ ($1AB5FA073B851C12C2339EC22442E995)calculateTristimulusForChromaticity:(id)a3 andLux:(double)a4
{
  double v7 = 0.0;
  double v8 = 0.0;
  double v9 = 0.0;
  if (a3.var1 > 0.0 && a4 > 0.0)
  {
    double v7 = a3.var0 / a3.var1 * a4;
    double v8 = a4;
    double v9 = (1.0 - a3.var0 - a3.var1) / a3.var1 * a4;
  }
  double v4 = v7;
  double v5 = v8;
  double v6 = v9;
  result.var2 = v6;
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

- (BOOL)forceSampleUpdate
{
  uint64_t v10 = self;
  SEL v9 = a2;
  uint64_t v4 = 0;
  double v5 = &v4;
  int v6 = 0x20000000;
  int v7 = 32;
  char v8 = 0;
  -[NSMutableArray enumerateObjectsUsingBlock:](self->_validServices, "enumerateObjectsUsingBlock:");
  if (v5[3]) {
    [(CBColorFilter *)v10 updateSample];
  }
  char v3 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v3 & 1;
}

uint64_t __34__CBColorFilter_forceSampleUpdate__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 updateEventData];
  if (result) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  return result;
}

- (BOOL)hasExtRearSensor
{
  uint64_t v10 = self;
  SEL v9 = a2;
  uint64_t v4 = 0;
  double v5 = &v4;
  int v6 = 0x20000000;
  int v7 = 32;
  char v8 = 0;
  -[NSMutableArray enumerateObjectsUsingBlock:](self->_validServices, "enumerateObjectsUsingBlock:");
  char v3 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v3 & 1;
}

uint64_t __33__CBColorFilter_hasExtRearSensor__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 location];
  if (result == 258)
  {
    uint64_t result = [a2 validData];
    if (result)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
  return result;
}

- (BOOL)hasExtFrontSensor
{
  uint64_t v10 = self;
  SEL v9 = a2;
  uint64_t v4 = 0;
  double v5 = &v4;
  int v6 = 0x20000000;
  int v7 = 32;
  char v8 = 0;
  -[NSMutableArray enumerateObjectsUsingBlock:](self->_validServices, "enumerateObjectsUsingBlock:");
  char v3 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v3 & 1;
}

uint64_t __34__CBColorFilter_hasExtFrontSensor__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 location];
  if (result == 257)
  {
    uint64_t result = [a2 validData];
    if (result)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
  return result;
}

- (unint64_t)sensorPolicy
{
  return self->_sensorPolicy;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (CBColorSample)sample
{
  return self->_sample;
}

@end
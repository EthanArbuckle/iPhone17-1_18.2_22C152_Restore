@interface HMIPreference
+ (BOOL)isAudioAccessory;
+ (BOOL)isInternalInstall;
+ (BOOL)isProductTypeB238;
+ (BOOL)isProductTypeB520;
+ (BOOL)isProductTypeB620;
+ (BOOL)isProductTypeJ105;
+ (BOOL)isProductTypeJ255;
+ (BOOL)isProductTypeJ305;
+ (BOOL)isProductTypeJ42;
+ (HMIPreference)sharedInstance;
+ (NSDictionary)qosMap;
+ (NSNumber)pretendProductType;
+ (int)productType;
+ (void)setPretendProductType:(id)a3;
- (BOOL)BOOLPreferenceForKey:(id)a3 defaultValue:(BOOL)a4;
- (BOOL)hasPreferenceForKey:(id)a3;
- (BOOL)isIdle;
- (BOOL)shouldEnableTorsoRecognition;
- (BOOL)shouldGenerateThumbnailForAnalysisFPS:(double)a3;
- (BOOL)shouldUseCPUOnlyForVisionFaceDetection;
- (BOOL)usesCPUOnly;
- (HMFTimer)preferenceCacheFlushTimer;
- (HMIPreference)init;
- (NSDictionary)preferenceOverrides;
- (NSMutableDictionary)preferenceCache;
- (NSMutableDictionary)preferenceLoggedValues;
- (NSMutableDictionary)preferenceOverridesInternal;
- (double)maxAnalysisFPSForCurrentPeakPowerPressureLevel;
- (double)maxAnalysisFPSForCurrentThermalLevel;
- (double)maxAnalysisFPSForSystemResourceUsageLevel:(int64_t)a3;
- (id)numberPreferenceForKey:(id)a3;
- (id)numberPreferenceForKey:(id)a3 defaultValue:(id)a4;
- (id)numberPreferenceForKey:(id)a3 defaultValue:(id)a4 withMap:(id)a5;
- (id)numberPreferenceForKey:(id)a3 defaultValue:(id)a4 withParser:(id)a5;
- (id)stringPreferenceForKey:(id)a3 defaultValue:(id)a4;
- (id)systemPreferenceValueForKey:(id)a3;
- (id)valuePreferenceForKey:(id)a3 defaultValue:(id)a4 withMap:(id)a5;
- (id)valuePreferenceForKey:(id)a3 defaultValue:(id)a4 withParser:(id)a5;
- (unint64_t)maxConcurrentAnalyzersForCurrentPeakPowerPressureLevel;
- (unint64_t)maxConcurrentAnalyzersForCurrentThermalLevel;
- (unint64_t)maxConcurrentAnalyzersForSystemResourceUsageLevel:(int64_t)a3;
- (unsigned)analysisQOS;
- (void)addPreferenceOverrideFromDictionary:(id)a3;
- (void)logPreferenceForKey:(id)a3 value:(id)a4;
- (void)removeAllPreferenceOverrides;
- (void)setPreferenceOverrideFromDictionary:(id)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HMIPreference

+ (HMIPreference)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__HMIPreference_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_3 != -1) {
    dispatch_once(&sharedInstance_onceToken_3, block);
  }
  v2 = (void *)sharedInstance_instance_0;
  return (HMIPreference *)v2;
}

uint64_t __31__HMIPreference_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_instance_0 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

+ (NSDictionary)qosMap
{
  if (qosMap_onceToken != -1) {
    dispatch_once(&qosMap_onceToken, &__block_literal_global_31);
  }
  v2 = (void *)qosMap_map;
  return (NSDictionary *)v2;
}

void __23__HMIPreference_qosMap__block_invoke()
{
  v0 = (void *)qosMap_map;
  qosMap_map = (uint64_t)&unk_26D9A9CB0;
}

+ (BOOL)isInternalInstall
{
  return MEMORY[0x270F95FB8](@"apple-internal-install", a2);
}

+ (NSNumber)pretendProductType
{
  return (NSNumber *)(id)_pretendProductType;
}

+ (void)setPretendProductType:(id)a3
{
}

+ (int)productType
{
  v3 = [a1 pretendProductType];

  if (v3)
  {
    v4 = [a1 pretendProductType];
    int v5 = [v4 longLongValue];

    return v5;
  }
  else
  {
    return MEMORY[0x270F95FD8]();
  }
}

+ (BOOL)isProductTypeJ42
{
  return [a1 productType] == 1110205732;
}

+ (BOOL)isProductTypeJ105
{
  return [a1 productType] == 33245053;
}

+ (BOOL)isProductTypeJ305
{
  return [a1 productType] == 1114644381;
}

+ (BOOL)isProductTypeJ255
{
  return [a1 productType] == 3865897231;
}

+ (BOOL)isProductTypeB238
{
  return [a1 productType] == 4240173202 || objc_msgSend(a1, "productType") == 2702125347;
}

+ (BOOL)isProductTypeB520
{
  return [a1 productType] == 3348380076;
}

+ (BOOL)isProductTypeB620
{
  return [a1 productType] == 1540760353;
}

+ (BOOL)isAudioAccessory
{
  if (+[HMIPreference isProductTypeB238]
    || +[HMIPreference isProductTypeB520])
  {
    return 1;
  }
  return +[HMIPreference isProductTypeB620];
}

- (BOOL)usesCPUOnly
{
  BOOL v3 = +[HMIPreference isProductTypeJ105];
  v4 = [NSNumber numberWithBool:v3];
  int v5 = [(HMIPreference *)self numberPreferenceForKey:@"processingDevice" defaultValue:v4 withMap:&unk_26D9A9CD8];
  char v6 = [v5 BOOLValue];

  return v6;
}

- (BOOL)shouldUseCPUOnlyForVisionFaceDetection
{
  if (+[HMIPreference isProductTypeB520]) {
    return 1;
  }
  return +[HMIPreference isProductTypeB620];
}

- (unint64_t)maxConcurrentAnalyzersForCurrentThermalLevel
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = +[HMIThermalMonitor sharedInstance];
  uint64_t v3 = [v2 thermalLevel];

  if (+[HMIPreference isProductTypeJ105])
  {
    unint64_t result = 0;
    long long v5 = xmmword_225F2E210;
    long long v6 = xmmword_225F2E220;
    uint64_t v7 = 0x3FF0000000000000;
    do
    {
      if (*((double *)&v5 + result) <= (double)v3) {
        break;
      }
      ++result;
    }
    while (result != 5);
  }
  else if (+[HMIPreference isProductTypeB238])
  {
    unint64_t result = 0;
    while (dbl_225F2E230[result] > (double)v3)
    {
      if (++result == 3) {
        return 2;
      }
    }
  }
  else if (+[HMIPreference isProductTypeB520])
  {
    return 2 * (v3 < 10);
  }
  else if (+[HMIPreference isProductTypeB620])
  {
    if (v3 <= 9) {
      return 3;
    }
    else {
      return 0;
    }
  }
  else if (+[HMIPreference isProductTypeJ255])
  {
    unint64_t result = 0;
    long long v5 = xmmword_225F2E1F0;
    long long v6 = xmmword_225F2E200;
    uint64_t v7 = 0x4010000000000000;
    do
    {
      if (*((double *)&v5 + result) <= (double)v3) {
        break;
      }
      ++result;
    }
    while (result != 5);
  }
  else
  {
    return 5;
  }
  return result;
}

- (unint64_t)maxConcurrentAnalyzersForCurrentPeakPowerPressureLevel
{
  v2 = +[HMIPeakPowerPressureMonitor sharedInstance];
  uint64_t v3 = [v2 peakPowerPressureLevel];

  if (+[HMIPreference isProductTypeJ255]
    && (unint64_t)(v3 - 1) <= 3)
  {
    return qword_225F2E248[v3 - 1];
  }
  else
  {
    return 5;
  }
}

- (unint64_t)maxConcurrentAnalyzersForSystemResourceUsageLevel:(int64_t)a3
{
  unint64_t v5 = [(HMIPreference *)self maxConcurrentAnalyzersForCurrentThermalLevel];
  unint64_t v6 = [(HMIPreference *)self maxConcurrentAnalyzersForCurrentPeakPowerPressureLevel];
  if (v5 >= v6) {
    unint64_t v7 = v6;
  }
  else {
    unint64_t v7 = v5;
  }
  BOOL v8 = +[HMIPreference isProductTypeJ105];
  uint64_t v9 = 3;
  if (v7 < 3) {
    uint64_t v9 = v7;
  }
  if (a3 > 1 && v8) {
    unint64_t v10 = v9;
  }
  else {
    unint64_t v10 = v7;
  }
  BOOL v11 = +[HMIPreference isAudioAccessory];
  BOOL v12 = a3 > 2;
  v13 = [MEMORY[0x263F42620] productInfo];
  uint64_t v14 = [v13 productClass];

  int v15 = v14 == 3 || v11;
  if ((v12 & v15) != 0) {
    unint64_t v16 = 0;
  }
  else {
    unint64_t v16 = v10;
  }
  v17 = +[HMIPreference sharedInstance];
  v18 = [NSNumber numberWithUnsignedInteger:v16];
  v19 = [v17 numberPreferenceForKey:@"maxConcurrentAnalyzers" defaultValue:v18];
  unint64_t v20 = (int)[v19 intValue];

  return v20;
}

- (BOOL)shouldEnableTorsoRecognition
{
  if (+[HMIPreference isProductTypeB238]
    || +[HMIPreference isProductTypeJ42])
  {
    return 0;
  }
  uint64_t v3 = +[HMIPreference sharedInstance];
  char v4 = [v3 BOOLPreferenceForKey:@"enableTorsoRecognition" defaultValue:1];

  return v4;
}

- (double)maxAnalysisFPSForCurrentThermalLevel
{
  v2 = +[HMIThermalMonitor sharedInstance];
  uint64_t v3 = [v2 thermalLevel];

  if (!+[HMIPreference isProductTypeB238]
    || (double result = 0.125, v3 <= 3) && (double result = 0.25, v3 != 3) && (double result = 0.5, v3 <= 1))
  {
    if (!+[HMIPreference isProductTypeJ105]
      || (double result = 0.125, v3 <= 3) && (double result = 0.25, v3 != 3) && (double result = 0.5, v3 <= 1))
    {
      if (!+[HMIPreference isProductTypeB520]
        || (double result = 0.125, v3 <= 7) && (double result = 0.25, v3 != 7) && (double result = 0.5, v3 <= 5))
      {
        if (!+[HMIPreference isProductTypeB620]
          || (double result = 0.125, v3 <= 7) && (double result = 0.25, v3 != 7) && (double result = 0.5, v3 <= 5))
        {
          if (!+[HMIPreference isProductTypeJ255]) {
            return 1.0;
          }
          double result = 0.125;
          if (v3 <= 3)
          {
            double result = 0.25;
            if (v3 != 3)
            {
              double result = 0.5;
              if (v3 <= 1) {
                return 1.0;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

- (double)maxAnalysisFPSForCurrentPeakPowerPressureLevel
{
  v2 = +[HMIPeakPowerPressureMonitor sharedInstance];
  uint64_t v3 = [v2 peakPowerPressureLevel];

  BOOL v4 = +[HMIPreference isProductTypeJ255];
  double result = 1.0;
  if (v4 && (unint64_t)(v3 - 2) <= 2) {
    return dbl_225F2E268[v3 - 2];
  }
  return result;
}

- (double)maxAnalysisFPSForSystemResourceUsageLevel:(int64_t)a3
{
  [(HMIPreference *)self maxAnalysisFPSForCurrentThermalLevel];
  double v6 = v5;
  [(HMIPreference *)self maxAnalysisFPSForCurrentPeakPowerPressureLevel];
  if (v6 >= v7) {
    double v6 = v7;
  }
  BOOL v8 = +[HMIPreference isProductTypeJ105];
  double v9 = fmin(v6, 0.5);
  if (a3 > 1 && v8) {
    double v6 = v9;
  }
  unint64_t v10 = +[HMIPreference sharedInstance];
  BOOL v11 = [NSNumber numberWithDouble:v6];
  BOOL v12 = [v10 numberPreferenceForKey:@"maxAnalysisFPS" defaultValue:v11];
  [v12 doubleValue];
  double v14 = v13;

  return v14;
}

- (BOOL)isIdle
{
  return 1;
}

- (BOOL)shouldGenerateThumbnailForAnalysisFPS:(double)a3
{
  return a3 >= 0.4;
}

- (unsigned)analysisQOS
{
  v2 = +[HMIPreference sharedInstance];
  uint64_t v3 = +[HMIPreference qosMap];
  BOOL v4 = [v2 numberPreferenceForKey:@"analysisQOS" defaultValue:&unk_26D9A94E0 withMap:v3];
  unsigned int v5 = [v4 intValue];

  return v5;
}

- (HMIPreference)init
{
  v13.receiver = self;
  v13.super_class = (Class)HMIPreference;
  v2 = [(HMIPreference *)&v13 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:12 options:8.0];
    preferenceCacheFlushTimer = v3->_preferenceCacheFlushTimer;
    v3->_preferenceCacheFlushTimer = (HMFTimer *)v4;

    [(HMFTimer *)v3->_preferenceCacheFlushTimer setDelegate:v3];
    [(HMFTimer *)v3->_preferenceCacheFlushTimer resume];
    uint64_t v6 = [MEMORY[0x263EFF9A0] dictionary];
    preferenceCache = v3->_preferenceCache;
    v3->_preferenceCache = (NSMutableDictionary *)v6;

    uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
    preferenceLoggedValues = v3->_preferenceLoggedValues;
    v3->_preferenceLoggedValues = (NSMutableDictionary *)v8;

    uint64_t v10 = [MEMORY[0x263EFF9A0] dictionary];
    preferenceOverridesInternal = v3->_preferenceOverridesInternal;
    v3->_preferenceOverridesInternal = (NSMutableDictionary *)v10;
  }
  return v3;
}

- (void)timerDidFire:(id)a3
{
  id v7 = a3;
  uint64_t v4 = (void *)MEMORY[0x22A641C70]();
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v6 = [(HMIPreference *)self preferenceCache];
  [v6 removeAllObjects];

  os_unfair_lock_unlock(p_lock);
}

- (NSDictionary)preferenceOverrides
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = [(HMIPreference *)self preferenceOverridesInternal];
  unsigned int v5 = (void *)[v4 copy];

  os_unfair_lock_unlock(p_lock);
  return (NSDictionary *)v5;
}

- (void)addPreferenceOverrideFromDictionary:(id)a3
{
  id v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unsigned int v5 = [(HMIPreference *)self preferenceOverridesInternal];
  [v5 addEntriesFromDictionary:v6];

  os_unfair_lock_unlock(p_lock);
}

- (void)setPreferenceOverrideFromDictionary:(id)a3
{
  id v7 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unsigned int v5 = [(HMIPreference *)self preferenceOverridesInternal];
  [v5 removeAllObjects];

  id v6 = [(HMIPreference *)self preferenceOverridesInternal];
  [v6 addEntriesFromDictionary:v7];

  os_unfair_lock_unlock(p_lock);
}

- (void)removeAllPreferenceOverrides
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = [(HMIPreference *)self preferenceOverridesInternal];
  [v4 removeAllObjects];

  os_unfair_lock_unlock(p_lock);
}

- (void)logPreferenceForKey:(id)a3 value:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  double v9 = [(HMIPreference *)self preferenceLoggedValues];
  id v10 = [v9 objectForKeyedSubscript:v6];

  if (v10 != v7 && ([v10 isEqual:v7] & 1) == 0)
  {
    BOOL v11 = (void *)MEMORY[0x22A641C70]();
    BOOL v12 = self;
    HMFGetOSLogHandle();
    objc_super v13 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      double v14 = HMFGetLogIdentifier();
      int v16 = 138544130;
      v17 = v14;
      __int16 v18 = 2112;
      id v19 = v6;
      __int16 v20 = 2112;
      id v21 = v7;
      __int16 v22 = 2112;
      id v23 = v10;
      _os_log_impl(&dword_225DC6000, v13, OS_LOG_TYPE_INFO, "%{public}@Preference %@ is now %@, previously was %@", (uint8_t *)&v16, 0x2Au);
    }
    int v15 = [(HMIPreference *)v12 preferenceLoggedValues];
    if (v7) {
      [v15 setObject:v7 forKeyedSubscript:v6];
    }
    else {
      [v15 removeObjectForKey:v6];
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (id)systemPreferenceValueForKey:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v6 = [(HMIPreference *)self preferenceOverridesInternal];
  id v7 = [v6 objectForKeyedSubscript:v4];

  os_unfair_lock_unlock(&self->_lock);
  if (v7) {
    goto LABEL_2;
  }
  os_unfair_lock_lock_with_options();
  id v10 = [(HMIPreference *)self preferenceCache];
  id v7 = [v10 objectForKeyedSubscript:v4];

  if (v7)
  {
    BOOL v11 = [MEMORY[0x263EFF9D0] null];

    if (v7 == v11) {
      goto LABEL_14;
    }
  }
  else
  {
    BOOL v12 = (void *)[objc_alloc(MEMORY[0x263F42650]) initWithKey:v4 options:0 domain:@"com.apple.homed" defaultValue:0];
    id v7 = [v12 value];

    if (!v7)
    {
      id v7 = [MEMORY[0x263EFF9D0] null];
      int v15 = [(HMIPreference *)self preferenceCache];
      [v15 setObject:v7 forKeyedSubscript:v4];

LABEL_14:
      os_unfair_lock_unlock(p_lock);
      id v7 = 0;
      goto LABEL_2;
    }
    objc_super v13 = [(HMIPreference *)self preferenceCache];
    [v13 setObject:v7 forKeyedSubscript:v4];
  }
  os_unfair_lock_unlock(p_lock);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v14 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"Only NSNumber and NSString properties are supported." userInfo:0];
      objc_exception_throw(v14);
    }
  }
LABEL_2:
  id v8 = v7;

  return v8;
}

- (id)numberPreferenceForKey:(id)a3 defaultValue:(id)a4 withParser:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  id v11 = v9;
  BOOL v12 = [(HMIPreference *)self systemPreferenceValueForKey:v8];
  id v13 = v11;
  if (v12)
  {
    id v14 = v10[2](v10, v12);
    int v15 = v14;
    id v13 = v11;
    if (v14)
    {
      id v13 = v14;
    }
  }
  [(HMIPreference *)self logPreferenceForKey:v8 value:v13];

  return v13;
}

- (id)numberPreferenceForKey:(id)a3 defaultValue:(id)a4 withMap:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v9;
  BOOL v12 = [(HMIPreference *)self systemPreferenceValueForKey:v8];
  id v13 = objectAsString(v12);

  id v14 = v11;
  if (v13)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v23 = v10;
    id v15 = v10;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
    id v14 = v11;
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v25;
      id v14 = v11;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v25 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          if (![v13 caseInsensitiveCompare:v20])
          {
            uint64_t v21 = [v15 objectForKeyedSubscript:v20];

            id v14 = (void *)v21;
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v17);
    }

    id v10 = v23;
  }
  [(HMIPreference *)self logPreferenceForKey:v8 value:v14];

  return v14;
}

- (id)valuePreferenceForKey:(id)a3 defaultValue:(id)a4 withParser:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  id v11 = v9;
  BOOL v12 = [(HMIPreference *)self systemPreferenceValueForKey:v8];
  id v13 = v11;
  if (v12)
  {
    id v14 = v10[2](v10, v12);
    id v15 = v14;
    id v13 = v11;
    if (v14)
    {
      id v13 = v14;
    }
  }
  [(HMIPreference *)self logPreferenceForKey:v8 value:v13];

  return v13;
}

- (id)valuePreferenceForKey:(id)a3 defaultValue:(id)a4 withMap:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v9;
  BOOL v12 = [(HMIPreference *)self systemPreferenceValueForKey:v8];
  id v13 = objectAsString(v12);

  id v14 = v11;
  if (v13)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v23 = v10;
    id v15 = v10;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
    id v14 = v11;
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v25;
      id v14 = v11;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v25 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          if (![v13 caseInsensitiveCompare:v20])
          {
            uint64_t v21 = [v15 objectForKeyedSubscript:v20];

            id v14 = (void *)v21;
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v17);
    }

    id v10 = v23;
  }
  [(HMIPreference *)self logPreferenceForKey:v8 value:v14];

  return v14;
}

- (id)numberPreferenceForKey:(id)a3 defaultValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMIPreference *)self systemPreferenceValueForKey:v6];
  id v9 = objectAsNumber(v8);

  id v10 = v7;
  if (v9)
  {
    id v10 = v9;
  }
  [(HMIPreference *)self logPreferenceForKey:v6 value:v10];

  return v10;
}

- (id)numberPreferenceForKey:(id)a3
{
  uint64_t v3 = [(HMIPreference *)self systemPreferenceValueForKey:a3];
  id v4 = objectAsNumber(v3);

  return v4;
}

- (BOOL)hasPreferenceForKey:(id)a3
{
  uint64_t v3 = [(HMIPreference *)self systemPreferenceValueForKey:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)BOOLPreferenceForKey:(id)a3 defaultValue:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = NSNumber;
  id v7 = a3;
  id v8 = [v6 numberWithBool:v4];
  id v9 = [(HMIPreference *)self numberPreferenceForKey:v7 defaultValue:v8];

  LOBYTE(v6) = [v9 BOOLValue];
  return (char)v6;
}

- (id)stringPreferenceForKey:(id)a3 defaultValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMIPreference *)self systemPreferenceValueForKey:v6];
  id v9 = objectAsString(v8);

  id v10 = v7;
  if (v9)
  {
    id v10 = v9;
  }
  [(HMIPreference *)self logPreferenceForKey:v6 value:v10];

  return v10;
}

- (HMFTimer)preferenceCacheFlushTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 16, 1);
}

- (NSMutableDictionary)preferenceCache
{
  return self->_preferenceCache;
}

- (NSMutableDictionary)preferenceLoggedValues
{
  return self->_preferenceLoggedValues;
}

- (NSMutableDictionary)preferenceOverridesInternal
{
  return self->_preferenceOverridesInternal;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferenceOverridesInternal, 0);
  objc_storeStrong((id *)&self->_preferenceLoggedValues, 0);
  objc_storeStrong((id *)&self->_preferenceCache, 0);
  objc_storeStrong((id *)&self->_preferenceCacheFlushTimer, 0);
}

@end
@interface HKUnitPreferenceController
+ (HKUnitPreferenceController)unitPreferenceControllerWithHealthStore:(id)a3 completion:(id)a4;
+ (id)_displayNameKey:(id)a3 withNumber:(BOOL)a4;
+ (id)_displayNameKeyForUnit:(id)a3 nameContext:(int64_t)a4;
+ (id)_localizedHealthUIStringForDisplayType:(id)a3 unit:(id)a4 key:(id)a5 value:(id)a6;
+ (id)localizedUnitStringForObjectType:(id)a3 unit:(id)a4 value:(id)a5 wheelchairUse:(int64_t)a6;
- (HKHealthStore)healthStore;
- (HKUnitPreferenceController)initWithHealthStore:(id)a3;
- (double)scaleFactorForYAxisLabeling:(id)a3;
- (id)_changedKeysBetweenDictionary:(id)a3 andDictionary:(id)a4;
- (id)_displayNameKeyForDisplayType:(id)a3 withNumber:(BOOL)a4;
- (id)_displayNameKeyForDisplayType:(id)a3 withNumber:(BOOL)a4 nameContext:(int64_t)a5;
- (id)_generateDefaultHKUnitPreferences;
- (id)_initWithHealthStore:(id)a3 completion:(id)a4;
- (id)_lock_unitForDisplayType:(id)a3;
- (id)_lock_updatePreferredUnits:(id)a3;
- (id)_longDisplayNameForUnit:(id)a3;
- (id)_longDisplayNameOverrideForDisplayType:(id)a3;
- (id)_unitDisplayNameKeyForDisplayType:(id)a3 nameContext:(int64_t)a4;
- (id)displayRangeForDisplayType:(id)a3;
- (id)localizedDisplayNameForDisplayType:(id)a3;
- (id)localizedDisplayNameForDisplayType:(id)a3 value:(id)a4;
- (id)localizedDisplayNameForDisplayType:(id)a3 value:(id)a4 nameContext:(int64_t)a5;
- (id)localizedDisplayNameForUnit:(id)a3 value:(id)a4;
- (id)localizedDisplayNameForUnit:(id)a3 value:(id)a4 nameContext:(int64_t)a5;
- (id)localizedHealthUIStringForDisplayType:(id)a3 key:(id)a4 value:(id)a5;
- (id)localizedLongDisplayNameForDisplayType:(id)a3;
- (id)unitForChartingDisplayType:(id)a3;
- (id)unitForDisplayType:(id)a3;
- (void)_fetchHKUnitPreferencesWithAttempt:(int64_t)a3;
- (void)_fetchHKUnitPreferencesWithAttempt:(int64_t)a3 completion:(id)a4;
- (void)_initHKUnitPreferencesWithCompletion:(id)a3;
- (void)_localeDidChange:(id)a3;
- (void)_lock_updatePreferredUnit:(id)a3 forDisplayType:(id)a4;
- (void)_postNotificationWithChangedKeys:(id)a3;
- (void)_refreshHKUnitPreferencesWithCompletion:(id)a3;
- (void)_unitPreferencesDidUpdate:(id)a3;
- (void)dealloc;
- (void)setHealthStore:(id)a3;
- (void)updatePreferredUnit:(id)a3 forDisplayType:(id)a4;
@end

@implementation HKUnitPreferenceController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_unitPreferencesByObjectType, 0);
  objc_storeStrong((id *)&self->_unitStrings, 0);
}

void __70__HKUnitPreferenceController__refreshHKUnitPreferencesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__HKUnitPreferenceController__refreshHKUnitPreferencesWithCompletion___block_invoke_2;
    block[3] = &unk_1E6D51340;
    block[4] = *(void *)(a1 + 32);
    id v10 = v5;
    id v11 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    if ((HKIsUnitTesting() & 1) == 0)
    {
      _HKInitializeLogging();
      v7 = *MEMORY[0x1E4F29FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
        __70__HKUnitPreferenceController__refreshHKUnitPreferencesWithCompletion___block_invoke_cold_1((uint64_t)v6, v7);
      }
    }
    uint64_t v8 = *(void *)(a1 + 40);
    if (v8) {
      (*(void (**)(uint64_t, void))(v8 + 16))(v8, 0);
    }
  }
}

void __70__HKUnitPreferenceController__refreshHKUnitPreferencesWithCompletion___block_invoke_2(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
  objc_msgSend(*(id *)(a1 + 32), "_lock_updatePreferredUnits:", *(void *)(a1 + 40));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
  if ([v3 count]) {
    [*(id *)(a1 + 32) _postNotificationWithChangedKeys:v3];
  }
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2) {
    (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, 1);
  }
}

uint64_t __76__HKUnitPreferenceController__fetchHKUnitPreferencesWithAttempt_completion___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v2 = *(void *)(a1 + 48);
    if (v2 <= 2) {
      return [*(id *)(a1 + 32) _fetchHKUnitPreferencesWithAttempt:v2 + 1 completion:*(void *)(a1 + 40)];
    }
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)_lock_updatePreferredUnits:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  id v5 = [(HKUnitPreferenceController *)self _changedKeysBetweenDictionary:self->_unitPreferencesByObjectType andDictionary:v4];
  if ([v5 count])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          v12 = objc_msgSend(v4, "objectForKeyedSubscript:", v11, (void)v15);
          [(NSMutableDictionary *)self->_unitPreferencesByObjectType setObject:v12 forKeyedSubscript:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }

    id v13 = v6;
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (id)_generateDefaultHKUnitPreferences
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v3 = _HKAllQuantityTypes();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v33 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        uint64_t v9 = _HKGenerateDefaultUnitForQuantityType();
        [v2 setObject:v9 forKeyedSubscript:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v5);
  }

  v31 = [MEMORY[0x1E4F2AE60] correlationTypeForIdentifier:*MEMORY[0x1E4F29938]];
  id v10 = [MEMORY[0x1E4F2B618] unitFromString:@"mmHg"];
  [v2 setObject:v10 forKeyedSubscript:v31];

  v30 = [MEMORY[0x1E4F2B498] heartbeatSeriesType];
  uint64_t v11 = [MEMORY[0x1E4F2B618] unitFromString:@"count/min"];
  [v2 setObject:v11 forKeyedSubscript:v30];

  v12 = [MEMORY[0x1E4F2ACB8] tachycardiaType];
  id v13 = [MEMORY[0x1E4F2B618] countUnit];
  [v2 setObject:v13 forKeyedSubscript:v12];

  v14 = [MEMORY[0x1E4F2ACB8] dataTypeWithCode:189];
  long long v15 = [MEMORY[0x1E4F2B618] minuteUnit];
  [v2 setObject:v15 forKeyedSubscript:v14];

  long long v16 = [MEMORY[0x1E4F2ACB8] bradycardiaType];
  long long v17 = [MEMORY[0x1E4F2B618] countUnit];
  [v2 setObject:v17 forKeyedSubscript:v16];

  long long v18 = [MEMORY[0x1E4F2ACB8] atrialFibrillationEventType];
  v19 = [MEMORY[0x1E4F2B618] countUnit];
  [v2 setObject:v19 forKeyedSubscript:v18];

  uint64_t v20 = [MEMORY[0x1E4F2AFB8] electrocardiogramType];
  v21 = [MEMORY[0x1E4F2B618] countUnit];
  [v2 setObject:v21 forKeyedSubscript:v20];

  v22 = [MEMORY[0x1E4F2AC40] audiogramSampleType];
  v23 = [MEMORY[0x1E4F2B618] countUnit];
  [v2 setObject:v23 forKeyedSubscript:v22];

  v24 = [MEMORY[0x1E4F2B618] secondUnit];
  v25 = [MEMORY[0x1E4F2ACB8] handwashingEventType];
  [v2 setObject:v24 forKeyedSubscript:v25];

  v26 = [MEMORY[0x1E4F2B2C0] categoryTypeForIdentifier:*MEMORY[0x1E4F29870]];
  v27 = [MEMORY[0x1E4F2B618] secondUnit];
  [v2 setObject:v27 forKeyedSubscript:v26];

  v28 = (void *)[v2 copy];
  return v28;
}

- (id)_changedKeysBetweenDictionary:(id)a3 andDictionary:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v8 = _HKAllQuantityTypes();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        v14 = objc_msgSend(v5, "objectForKeyedSubscript:", v13, (void)v17);
        long long v15 = [v6 objectForKeyedSubscript:v13];
        if (([v14 isEqual:v15] & 1) == 0) {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  return v7;
}

void __57__HKUnitPreferenceController_displayRangeForDisplayType___block_invoke()
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = *MEMORY[0x1E4F2A610];
  v0 = (void *)MEMORY[0x1E4F2B380];
  v1 = (void *)MEMORY[0x1E4F2B370];
  id v2 = [MEMORY[0x1E4F2B618] unitFromString:@"mg/dL"];
  id v3 = [v1 quantityWithUnit:v2 doubleValue:0.0];
  uint64_t v4 = (void *)MEMORY[0x1E4F2B370];
  id v5 = [MEMORY[0x1E4F2B618] unitFromString:@"mg/dL"];
  id v6 = [v4 quantityWithUnit:v5 doubleValue:600.0];
  id v7 = [v0 inclusiveRangeWithMinimum:v3 maximum:v6];
  v11[0] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  uint64_t v9 = (void *)displayRangeForDisplayType____displayRanges;
  displayRangeForDisplayType____displayRanges = v8;
}

+ (id)_displayNameKey:(id)a3 withNumber:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = @"_NUMBERLESS_UNIT";
  if (v4) {
    id v6 = @"_NUMBERED_UNIT";
  }
  id v7 = v6;
  if ([v5 length] && (objc_msgSend(v5, "containsString:", v7) & 1) == 0)
  {
    uint64_t v8 = [NSString stringWithFormat:@"%@%@", v5, v7];
  }
  else
  {
    uint64_t v8 = &stru_1F3B9CF20;
  }

  return v8;
}

+ (id)_localizedHealthUIStringForDisplayType:(id)a3 unit:(id)a4 key:(id)a5 value:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v11)
  {
    if ([v11 length])
    {
      uint64_t v13 = [v9 localization];
      v14 = [v13 localizationTableNameOverride];

      if (!v14) {
        goto LABEL_6;
      }
      long long v15 = HKHealthKitFrameworkBundle();
      long long v16 = [v9 localization];
      long long v17 = [v16 localizationTableNameOverride];
      v14 = [v15 localizedStringForKey:v11 value:&stru_1F3B9CF20 table:v17];

      if (!v14 || (long long v18 = v14, [v14 isEqualToString:v11]))
      {
LABEL_6:
        long long v19 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
        long long v18 = [v19 localizedStringForKey:v11 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      }
      if (v12
        && ([MEMORY[0x1E4F2B618] percentUnit],
            long long v20 = objc_claimAutoreleasedReturnValue(),
            char v21 = [v10 isEqual:v20],
            v20,
            (v21 & 1) == 0))
      {
        if (![v18 containsString:@"unit_double"])
        {
          uint64_t v27 = [v12 integerValue];
          objc_msgSend(NSString, "localizedStringWithFormat:", v18, v27);
          v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (![(__CFString *)v23 length])
          {
            v28 = NSString;
            [v12 doubleValue];
            uint64_t v30 = objc_msgSend(v28, "localizedStringWithFormat:", v18, v29);

            v23 = (__CFString *)v30;
          }
          goto LABEL_11;
        }
        v25 = NSString;
        [v12 doubleValue];
        objc_msgSend(v25, "localizedStringWithFormat:", v18, v26);
        uint64_t v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v22 = v18;
      }
      v23 = v22;
LABEL_11:

      goto LABEL_14;
    }
    v23 = &stru_1F3B9CF20;
  }
  else
  {
    v23 = 0;
  }
LABEL_14:

  return v23;
}

- (id)localizedDisplayNameForDisplayType:(id)a3 value:(id)a4 nameContext:(int64_t)a5
{
  BOOL v8 = a4 != 0;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(HKUnitPreferenceController *)self _displayNameKeyForDisplayType:v10 withNumber:v8 nameContext:a5];
  id v12 = [(HKUnitPreferenceController *)self localizedHealthUIStringForDisplayType:v10 key:v11 value:v9];

  return v12;
}

- (id)localizedHealthUIStringForDisplayType:(id)a3 key:(id)a4 value:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(HKUnitPreferenceController *)self unitForDisplayType:v10];
  id v12 = +[HKUnitPreferenceController _localizedHealthUIStringForDisplayType:v10 unit:v11 key:v9 value:v8];

  return v12;
}

- (id)localizedDisplayNameForDisplayType:(id)a3 value:(id)a4
{
  return [(HKUnitPreferenceController *)self localizedDisplayNameForDisplayType:a3 value:a4 nameContext:1];
}

- (id)displayRangeForDisplayType:(id)a3
{
  uint64_t v3 = displayRangeForDisplayType__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&displayRangeForDisplayType__onceToken, &__block_literal_global_607);
  }
  id v5 = (void *)displayRangeForDisplayType____displayRanges;
  id v6 = [v4 objectType];

  id v7 = [v6 identifier];
  id v8 = [v5 objectForKeyedSubscript:v7];

  return v8;
}

- (id)_unitDisplayNameKeyForDisplayType:(id)a3 nameContext:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(HKUnitPreferenceController *)self unitForDisplayType:v6];
  id v8 = [v6 localization];

  id v9 = [v8 unitDisplayNameKeyOverrideForUnit:v7 nameContext:a4];

  if (!v9)
  {
    id v9 = +[HKUnitPreferenceController _displayNameKeyForUnit:v7 nameContext:a4];
  }

  return v9;
}

- (id)unitForDisplayType:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [(HKUnitPreferenceController *)self _lock_unitForDisplayType:v5];

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)_lock_unitForDisplayType:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (v4)
  {
    unitPreferencesByObjectType = self->_unitPreferencesByObjectType;
    id v6 = [v4 objectType];
    id v7 = [(NSMutableDictionary *)unitPreferencesByObjectType objectForKeyedSubscript:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_displayNameKeyForDisplayType:(id)a3 withNumber:(BOOL)a4 nameContext:(int64_t)a5
{
  BOOL v5 = a4;
  id v6 = [(HKUnitPreferenceController *)self _unitDisplayNameKeyForDisplayType:a3 nameContext:a5];
  id v7 = +[HKUnitPreferenceController _displayNameKey:v6 withNumber:v5];

  return v7;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HKUnitPreferenceController;
  [(HKUnitPreferenceController *)&v4 dealloc];
}

- (HKUnitPreferenceController)initWithHealthStore:(id)a3
{
  uint64_t v3 = [(HKUnitPreferenceController *)self _initWithHealthStore:a3 completion:0];
  objc_super v4 = v3;
  if (v3) {
    [(HKUnitPreferenceController *)v3 _initHKUnitPreferencesWithCompletion:0];
  }
  return v4;
}

- (id)_initWithHealthStore:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKUnitPreferenceController;
  id v7 = [(HKUnitPreferenceController *)&v13 init];
  if (v7)
  {
    id v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    unitStrings = v7->_unitStrings;
    v7->_unitStrings = v8;

    objc_storeStrong((id *)&v7->_healthStore, a3);
    v7->_lock._os_unfair_lock_opaque = 0;
    id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v7 selector:sel__localeDidChange_ name:*MEMORY[0x1E4F1C370] object:0];

    id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v7 selector:sel__unitPreferencesDidUpdate_ name:*MEMORY[0x1E4F2AAA0] object:v7->_healthStore];
  }
  return v7;
}

- (void)_initHKUnitPreferencesWithCompletion:(id)a3
{
  id v7 = a3;
  objc_super v4 = [(HKUnitPreferenceController *)self _generateDefaultHKUnitPreferences];
  BOOL v5 = (NSMutableDictionary *)[v4 mutableCopy];
  unitPreferencesByObjectType = self->_unitPreferencesByObjectType;
  self->_unitPreferencesByObjectType = v5;

  [(HKUnitPreferenceController *)self _fetchHKUnitPreferencesWithAttempt:0 completion:v7];
}

- (void)_fetchHKUnitPreferencesWithAttempt:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__HKUnitPreferenceController__fetchHKUnitPreferencesWithAttempt_completion___block_invoke;
  v8[3] = &unk_1E6D53010;
  id v9 = v6;
  int64_t v10 = a3;
  v8[4] = self;
  id v7 = v6;
  [(HKUnitPreferenceController *)self _refreshHKUnitPreferencesWithCompletion:v8];
}

- (void)_refreshHKUnitPreferencesWithCompletion:(id)a3
{
  id v4 = a3;
  healthStore = self->_healthStore;
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = _HKAllQuantityTypes();
  id v8 = [v6 setWithArray:v7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__HKUnitPreferenceController__refreshHKUnitPreferencesWithCompletion___block_invoke;
  v10[3] = &unk_1E6D53038;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  [(HKHealthStore *)healthStore preferredUnitsForQuantityTypes:v8 completion:v10];
}

+ (HKUnitPreferenceController)unitPreferenceControllerWithHealthStore:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[HKUnitPreferenceController alloc] _initWithHealthStore:v6 completion:0];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __81__HKUnitPreferenceController_unitPreferenceControllerWithHealthStore_completion___block_invoke;
  v11[3] = &unk_1E6D52370;
  id v12 = v7;
  id v13 = v5;
  id v8 = v7;
  id v9 = v5;
  [v8 _initHKUnitPreferencesWithCompletion:v11];

  return result;
}

uint64_t __81__HKUnitPreferenceController_unitPreferenceControllerWithHealthStore_completion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (a2) {
    uint64_t v4 = *(void *)(a1 + 32);
  }
  else {
    uint64_t v4 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, v4);
}

- (id)unitForChartingDisplayType:(id)a3
{
  id v4 = a3;
  id v5 = [(HKUnitPreferenceController *)self unitForDisplayType:v4];
  if (v5
    && ([v4 behavior],
        id v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 chartsRelativeData],
        v6,
        v7))
  {
    id v8 = [MEMORY[0x1E4F2B618] _changeInUnit:v5];
  }
  else
  {
    id v8 = v5;
  }
  id v9 = v8;

  return v9;
}

- (void)updatePreferredUnit:(id)a3 forDisplayType:(id)a4
{
  p_lock = &self->_lock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_lock);
  [(HKUnitPreferenceController *)self _lock_updatePreferredUnit:v8 forDisplayType:v7];

  os_unfair_lock_unlock(p_lock);
  id v9 = (void *)MEMORY[0x1E4F1CAD0];
  id v11 = [v7 objectType];

  int64_t v10 = [v9 setWithObject:v11];
  [(HKUnitPreferenceController *)self _postNotificationWithChangedKeys:v10];
}

- (id)localizedDisplayNameForDisplayType:(id)a3
{
  id v4 = a3;
  id v5 = [(HKUnitPreferenceController *)self _displayNameKeyForDisplayType:v4 withNumber:0];
  id v6 = [(HKUnitPreferenceController *)self localizedHealthUIStringForDisplayType:v4 key:v5 value:0];

  return v6;
}

- (id)localizedDisplayNameForUnit:(id)a3 value:(id)a4
{
  return [(HKUnitPreferenceController *)self localizedDisplayNameForUnit:a3 value:a4 nameContext:1];
}

- (id)localizedDisplayNameForUnit:(id)a3 value:(id)a4 nameContext:(int64_t)a5
{
  id v8 = a4;
  id v9 = +[HKUnitPreferenceController _displayNameKeyForUnit:a3 nameContext:a5];
  int64_t v10 = +[HKUnitPreferenceController _displayNameKey:v9 withNumber:v8 != 0];

  id v11 = [(HKUnitPreferenceController *)self localizedHealthUIStringForDisplayType:0 key:v10 value:v8];

  return v11;
}

- (id)localizedLongDisplayNameForDisplayType:(id)a3
{
  id v4 = a3;
  id v5 = [(HKUnitPreferenceController *)self unitForDisplayType:v4];
  id v6 = [(HKUnitPreferenceController *)self _longDisplayNameOverrideForDisplayType:v4];
  if (!v6)
  {
    id v6 = [(HKUnitPreferenceController *)self _longDisplayNameForUnit:v5];
    if (!v6)
    {
      id v6 = [(HKUnitPreferenceController *)self localizedDisplayNameForDisplayType:v4];
      if (!v6)
      {
        id v7 = [v4 localization];
        id v6 = [v7 displayName];
      }
    }
  }

  return v6;
}

- (id)_longDisplayNameOverrideForDisplayType:(id)a3
{
  uint64_t v3 = [a3 displayTypeIdentifier];
  id v4 = 0;
  if (v3 > 78)
  {
    if (v3 <= 136)
    {
      if (v3 == 79)
      {
        id v5 = @"LONG_WORKOUT_MINUTES";
        goto LABEL_23;
      }
      if (v3 != 118) {
        goto LABEL_24;
      }
    }
    else if (v3 != 137)
    {
      if (v3 == 251)
      {
        id v5 = @"LONG_NUMBER_OF_ALCOHOLIC_BEVERAGES";
        goto LABEL_23;
      }
      if (v3 != 266) {
        goto LABEL_24;
      }
    }
LABEL_17:
    id v5 = @"LONG_BEATS_PER_MINUTE";
LABEL_23:
    id v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    id v4 = [v6 localizedStringForKey:v5 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

    goto LABEL_24;
  }
  if (v3 > 6)
  {
    switch(v3)
    {
      case 7:
        id v5 = @"LONG_STEPS";
        break;
      case 12:
        id v5 = @"LONG_FLOORS";
        break;
      case 61:
        id v5 = @"LONG_BREATHS_PER_MINUTE";
        break;
      default:
        goto LABEL_24;
    }
    goto LABEL_23;
  }
  if (!v3)
  {
    id v5 = @"LONG_BMI";
    goto LABEL_23;
  }
  if (v3 == 5) {
    goto LABEL_17;
  }
LABEL_24:
  return v4;
}

- (double)scaleFactorForYAxisLabeling:(id)a3
{
  id v4 = a3;
  id v5 = [(HKUnitPreferenceController *)self unitForDisplayType:v4];
  uint64_t v6 = [v4 displayTypeIdentifier];

  double v7 = 1.0;
  if (v6 == 2)
  {
    id v8 = [MEMORY[0x1E4F2B618] unitFromString:@"ft"];
    int v9 = [v5 isEqual:v8];

    if (v9) {
      double v7 = 12.0;
    }
    else {
      double v7 = 1.0;
    }
  }

  return v7;
}

- (void)_lock_updatePreferredUnit:(id)a3 forDisplayType:(id)a4
{
  p_lock = &self->_lock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_assert_owner(p_lock);
  id v9 = [v7 objectType];

  [(NSMutableDictionary *)self->_unitPreferencesByObjectType setObject:v8 forKeyedSubscript:v9];
  [(HKHealthStore *)self->_healthStore _setPreferredUnit:v8 forType:v9 completion:&__block_literal_global_26];
}

void __71__HKUnitPreferenceController__lock_updatePreferredUnit_forDisplayType___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v5 = *MEMORY[0x1E4F29FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
      __71__HKUnitPreferenceController__lock_updatePreferredUnit_forDisplayType___block_invoke_cold_1((uint64_t)v4, v5);
    }
  }
}

- (void)_localeDidChange:(id)a3
{
}

- (void)_unitPreferencesDidUpdate:(id)a3
{
}

- (void)_fetchHKUnitPreferencesWithAttempt:(int64_t)a3
{
}

- (void)_postNotificationWithChangedKeys:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v8 = @"HKUnitPreferenceControllerUnitPreferenceChangedKey";
  v9[0] = a3;
  id v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  uint64_t v6 = [v4 dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];

  [v7 postNotificationName:@"HKUnitPreferenceControllerUnitPreferencesDidChangeNotification" object:self userInfo:v6];
}

- (id)_displayNameKeyForDisplayType:(id)a3 withNumber:(BOOL)a4
{
  return [(HKUnitPreferenceController *)self _displayNameKeyForDisplayType:a3 withNumber:a4 nameContext:1];
}

+ (id)_displayNameKeyForUnit:(id)a3 nameContext:(int64_t)a4
{
  id v5 = a3;
  if (_displayNameKeyForUnit_nameContext__onceToken != -1) {
    dispatch_once(&_displayNameKeyForUnit_nameContext__onceToken, &__block_literal_global_359);
  }
  uint64_t v6 = [MEMORY[0x1E4F2B618] largeCalorieUnit];
  int v7 = [v5 isEqual:v6];

  if (v7)
  {
    if (a4 == 2) {
      id v8 = @"LARGE_CALORIES";
    }
    else {
      id v8 = @"SMALL_CALORIES";
    }
  }
  else
  {
    id v8 = [(id)_displayNameKeyForUnit_nameContext__localizableStringDict objectForKeyedSubscript:v5];
  }

  return v8;
}

void __65__HKUnitPreferenceController__displayNameKeyForUnit_nameContext___block_invoke()
{
  v50[47] = *MEMORY[0x1E4F143B8];
  v48 = [MEMORY[0x1E4F2B618] inchUnit];
  v49[0] = v48;
  v50[0] = @"INCHES";
  v47 = [MEMORY[0x1E4F2B618] footUnit];
  v49[1] = v47;
  v50[1] = @"FEET";
  v46 = [MEMORY[0x1E4F2B618] poundUnit];
  v49[2] = v46;
  v50[2] = @"POUNDS";
  v45 = [MEMORY[0x1E4F2B618] secondUnit];
  v49[3] = v45;
  v50[3] = @"SECONDS_SHORT";
  v44 = [MEMORY[0x1E4F2B618] minuteUnit];
  v49[4] = v44;
  v50[4] = @"MINUTES_SHORT";
  v43 = [MEMORY[0x1E4F2B618] hourUnit];
  v49[5] = v43;
  v50[5] = @"HOURS_SHORT";
  v42 = [MEMORY[0x1E4F2B618] stoneUnit];
  v49[6] = v42;
  v50[6] = @"STONES";
  v41 = [MEMORY[0x1E4F2B618] gramUnitWithMetricPrefix:9];
  v49[7] = v41;
  v50[7] = @"KILOGRAMS";
  v40 = [MEMORY[0x1E4F2B618] mileUnit];
  v49[8] = v40;
  v50[8] = @"MILES";
  v39 = [MEMORY[0x1E4F2B618] yardUnit];
  v49[9] = v39;
  v50[9] = @"YARDS";
  v38 = [MEMORY[0x1E4F2B618] meterUnit];
  v49[10] = v38;
  v50[10] = @"METERS";
  uint64_t v37 = [MEMORY[0x1E4F2B618] meterUnitWithMetricPrefix:5];
  v49[11] = v37;
  v50[11] = @"CENTIMETERS";
  v36 = [MEMORY[0x1E4F2B618] meterUnitWithMetricPrefix:9];
  v49[12] = v36;
  v50[12] = @"KILOMETERS";
  long long v35 = [MEMORY[0x1E4F2B618] degreeCelsiusUnit];
  v49[13] = v35;
  v50[13] = @"DEGREES_CELSIUS";
  long long v34 = [MEMORY[0x1E4F2B618] degreeFahrenheitUnit];
  v49[14] = v34;
  v50[14] = @"DEGREES_FAHRENHEIT";
  long long v33 = [MEMORY[0x1E4F2B618] jouleUnitWithMetricPrefix:9];
  v49[15] = v33;
  v50[15] = @"KILOJOULES";
  long long v32 = [MEMORY[0x1E4F2B618] internationalUnit];
  v49[16] = v32;
  v50[16] = @"INTERNATIONAL_UNITS";
  v31 = [MEMORY[0x1E4F2B618] decibelHearingLevelUnit];
  v49[17] = v31;
  v50[17] = @"DECIBELS_HEARING";
  uint64_t v30 = [MEMORY[0x1E4F2B618] decibelAWeightedSoundPressureLevelUnit];
  v49[18] = v30;
  v50[18] = @"DECIBELS";
  uint64_t v29 = _HKBloodGlucoseMillimolesPerLiterUnit();
  v49[19] = v29;
  v50[19] = @"MILLIMOLES_PER_LITER";
  v28 = [MEMORY[0x1E4F2B618] percentUnit];
  v49[20] = v28;
  v50[20] = @"PERCENT";
  uint64_t v27 = [MEMORY[0x1E4F2B618] kilocalorieUnit];
  v49[21] = v27;
  v50[21] = @"KILOCALORIES";
  uint64_t v26 = [MEMORY[0x1E4F2B618] largeCalorieUnit];
  v49[22] = v26;
  v50[22] = @"LARGE_CALORIES";
  v25 = [MEMORY[0x1E4F2B618] literUnit];
  v49[23] = v25;
  v50[23] = @"LITERS";
  v24 = [MEMORY[0x1E4F2B618] gramUnit];
  v49[24] = v24;
  v50[24] = @"GRAMS";
  v23 = [MEMORY[0x1E4F2B618] wattUnit];
  v49[25] = v23;
  v50[25] = @"WATTS";
  uint64_t v22 = [MEMORY[0x1E4F2B618] unitFromString:@"cal"];
  v49[26] = v22;
  v50[26] = @"SMALL_CALORIES";
  char v21 = [MEMORY[0x1E4F2B618] unitFromString:@"mg/dL"];
  v49[27] = v21;
  v50[27] = @"MILLIGRAMS_PER_DECILITER";
  long long v20 = [MEMORY[0x1E4F2B618] unitFromString:@"mg"];
  v49[28] = v20;
  v50[28] = @"MILLIGRAMS";
  long long v19 = [MEMORY[0x1E4F2B618] unitFromString:@"mcg"];
  v49[29] = v19;
  v50[29] = @"MICROGRAMS";
  long long v18 = [MEMORY[0x1E4F2B618] unitFromString:@"mcS"];
  v49[30] = v18;
  v50[30] = @"MICROSIEMENS";
  long long v17 = [MEMORY[0x1E4F2B618] unitFromString:@"L/min"];
  v49[31] = v17;
  v50[31] = @"LITERS_PER_MINUTE";
  long long v16 = [MEMORY[0x1E4F2B618] unitFromString:@"mL"];
  v49[32] = v16;
  v50[32] = @"MILLILITERS";
  long long v15 = [MEMORY[0x1E4F2B618] unitFromString:@"mmHg"];
  v49[33] = v15;
  v50[33] = @"MILLIMETERS_MERCURY";
  v14 = [MEMORY[0x1E4F2B618] unitFromString:@"fl_oz_us"];
  v49[34] = v14;
  v50[34] = @"US_FLUID_OUNCES";
  id v13 = [MEMORY[0x1E4F2B618] unitFromString:@"fl_oz_imp"];
  v49[35] = v13;
  v50[35] = @"IMPERIAL_FLUID_OUNCES";
  id v12 = [MEMORY[0x1E4F2B618] unitFromString:@"pt_us"];
  v49[36] = v12;
  v50[36] = @"US_PINTS";
  v0 = [MEMORY[0x1E4F2B618] unitFromString:@"pt_imp"];
  v49[37] = v0;
  v50[37] = @"IMPERIAL_PINTS";
  v1 = [MEMORY[0x1E4F2B618] unitFromString:@"cup_us"];
  v49[38] = v1;
  v50[38] = @"US_CUPS";
  id v2 = [MEMORY[0x1E4F2B618] unitFromString:@"cup_imp"];
  v49[39] = v2;
  v50[39] = @"IMPERIAL_CUPS";
  uint64_t v3 = [MEMORY[0x1E4F2B618] unitFromString:@"ms"];
  v49[40] = v3;
  v50[40] = @"MILLISECONDS_SHORT";
  id v4 = [MEMORY[0x1E4F2B618] unitFromString:@"ml/(kg*min)"];
  v49[41] = v4;
  v50[41] = @"VO2_MAX";
  id v5 = [MEMORY[0x1E4F2B618] unitFromString:@"m/s"];
  v49[42] = v5;
  v50[42] = @"METERS_PER_SECOND";
  uint64_t v6 = [MEMORY[0x1E4F2B618] unitFromString:@"ft/s"];
  v49[43] = v6;
  v50[43] = @"FEET_PER_SECOND";
  int v7 = [MEMORY[0x1E4F2B618] unitFromString:@"mi/hr"];
  v49[44] = v7;
  v50[44] = @"MILES_PER_HOUR";
  id v8 = [MEMORY[0x1E4F2B618] unitFromString:@"km/hr"];
  v49[45] = v8;
  v50[45] = @"KILOMETERS_PER_HOUR";
  id v9 = [MEMORY[0x1E4F2B618] unitFromString:@"kcal/(kg*hr)"];
  v49[46] = v9;
  v50[46] = @"PHYSICAL_EFFORT";
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:47];
  id v11 = (void *)_displayNameKeyForUnit_nameContext__localizableStringDict;
  _displayNameKeyForUnit_nameContext__localizableStringDict = v10;
}

- (id)_longDisplayNameForUnit:(id)a3
{
  id v3 = a3;
  if (_longDisplayNameForUnit__onceToken != -1) {
    dispatch_once(&_longDisplayNameForUnit__onceToken, &__block_literal_global_562);
  }
  id v4 = (void *)_longDisplayNameForUnit__longUnitNameStringDict;
  id v5 = [v3 unitString];
  uint64_t v6 = [v4 objectForKey:v5];

  if (v6)
  {
    int v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    id v8 = [v7 localizedStringForKey:v6 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

void __54__HKUnitPreferenceController__longDisplayNameForUnit___block_invoke()
{
  v0 = (void *)_longDisplayNameForUnit__longUnitNameStringDict;
  _longDisplayNameForUnit__longUnitNameStringDict = (uint64_t)&unk_1F3C22C38;
}

+ (id)localizedUnitStringForObjectType:(id)a3 unit:(id)a4 value:(id)a5 wheelchairUse:(int64_t)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = +[HKDisplayTypeController displayTypeForObjectType:a3 wheelchairUse:a6];
  id v12 = [v11 localization];
  id v13 = [v12 unitDisplayNameKeyOverrideForUnit:v9 nameContext:1];

  if (!v13)
  {
    id v13 = +[HKUnitPreferenceController _displayNameKeyForUnit:v9 nameContext:1];
  }
  v14 = +[HKUnitPreferenceController _displayNameKey:v13 withNumber:1];

  long long v15 = +[HKUnitPreferenceController _localizedHealthUIStringForDisplayType:v11 unit:v9 key:v14 value:v10];

  return v15;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

void __71__HKUnitPreferenceController__lock_updatePreferredUnit_forDisplayType___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E0B26000, a2, OS_LOG_TYPE_ERROR, "Error setting preferred unit: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __70__HKUnitPreferenceController__refreshHKUnitPreferencesWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E0B26000, a2, OS_LOG_TYPE_ERROR, "Error fetching preferred units: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
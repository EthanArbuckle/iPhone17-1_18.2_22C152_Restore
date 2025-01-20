@interface HKFeatureSettings(HKMenstrualCycles)
- (uint64_t)deviationDetectionEnabledForAllTypes;
- (uint64_t)deviationDetectionEnabledForAnyType;
- (uint64_t)deviationDetectionEnabledForType:()HKMenstrualCycles;
- (uint64_t)deviationDetectionEnabledSetExplicitlyForAnyType;
- (uint64_t)fertileWindowProjectionsEnabled;
- (uint64_t)initWithMenstruationProjectionsEnabled:()HKMenstrualCycles fertileWindowProjectionsEnabled:areFertilityTrackingDisplayTypesVisible:isSexualActivityDisplayTypeVisible:;
- (uint64_t)isLoggingVisibleForDisplayTypeIdentifier:()HKMenstrualCycles;
- (uint64_t)menstruationProjectionsEnabled;
- (uint64_t)projectionsEnabledSettingsHaveChangedFromFeatureSettings:()HKMenstrualCycles;
@end

@implementation HKFeatureSettings(HKMenstrualCycles)

- (uint64_t)deviationDetectionEnabledSetExplicitlyForAnyType
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = HKMCAllDeviationTypes();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = HKFeatureSettingsKeyForDeviationDetectionTypeEnabled(objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v6), "integerValue", (void)v11));
        v8 = [a1 numberForKey:v7];

        if (v8)
        {
          uint64_t v9 = 1;
          goto LABEL_11;
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  uint64_t v9 = 0;
LABEL_11:

  return v9;
}

- (uint64_t)deviationDetectionEnabledForType:()HKMenstrualCycles
{
  uint64_t v4 = HKFeatureSettingsKeyForDeviationDetectionTypeEnabled(a3);
  uint64_t v5 = [a1 numberForKey:v4];
  uint64_t v6 = [v5 isEqualToNumber:MEMORY[0x263EFFA80]] ^ 1;

  return v6;
}

- (uint64_t)deviationDetectionEnabledForAnyType
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = HKMCAllDeviationTypes();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(a1, "deviationDetectionEnabledForType:", objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v6), "integerValue", (void)v9)))
        {
          uint64_t v7 = 1;
          goto LABEL_11;
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  uint64_t v7 = 0;
LABEL_11:

  return v7;
}

- (uint64_t)menstruationProjectionsEnabled
{
  v1 = [a1 numberForKey:@"MenstruationProjectionsEnabled"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (uint64_t)fertileWindowProjectionsEnabled
{
  v1 = [a1 numberForKey:@"FertileWindowProjectionsEnabled"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (uint64_t)isLoggingVisibleForDisplayTypeIdentifier:()HKMenstrualCycles
{
  if (@"DisplayTypeIdentifierMenstrualFlow" == a3) {
    return 1;
  }
  uint64_t v4 = HKFeatureSettingsKeyForIsLoggingHiddenForDisplayTypeIdentifier((uint64_t)a3);
  uint64_t v5 = [a1 numberForKey:v4];
  uint64_t v6 = [v5 isEqualToNumber:MEMORY[0x263EFFA88]] ^ 1;

  return v6;
}

- (uint64_t)projectionsEnabledSettingsHaveChangedFromFeatureSettings:()HKMenstrualCycles
{
  id v4 = a3;
  int v5 = [a1 menstruationProjectionsEnabled];
  if (v5 == [v4 menstruationProjectionsEnabled])
  {
    int v7 = [a1 fertileWindowProjectionsEnabled];
    uint64_t v6 = v7 ^ [v4 fertileWindowProjectionsEnabled];
  }
  else
  {
    uint64_t v6 = 1;
  }

  return v6;
}

- (uint64_t)initWithMenstruationProjectionsEnabled:()HKMenstrualCycles fertileWindowProjectionsEnabled:areFertilityTrackingDisplayTypesVisible:isSexualActivityDisplayTypeVisible:
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v11 = [NSNumber numberWithBool:a3];
  [v10 setObject:v11 forKeyedSubscript:@"MenstruationProjectionsEnabled"];

  long long v12 = [NSNumber numberWithBool:a4];
  [v10 setObject:v12 forKeyedSubscript:@"FertileWindowProjectionsEnabled"];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v13 = _HKMCFertilityDisplayTypeIdentifiers();
  uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v28;
    uint64_t v17 = a5 ^ 1u;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 8 * v18);
        v20 = [NSNumber numberWithInt:v17];
        v21 = HKFeatureSettingsKeyForIsLoggingHiddenForDisplayTypeIdentifier(v19);
        [v10 setObject:v20 forKeyedSubscript:v21];

        ++v18;
      }
      while (v15 != v18);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v15);
  }

  v22 = [NSNumber numberWithInt:a6 ^ 1u];
  v23 = HKFeatureSettingsKeyForIsLoggingHiddenForDisplayTypeIdentifier(@"DisplayTypeIdentifierSexualActivity");
  [v10 setObject:v22 forKeyedSubscript:v23];

  uint64_t v24 = [a1 initWithDictionary:v10];
  return v24;
}

- (uint64_t)deviationDetectionEnabledForAllTypes
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v2 = HKMCAllDeviationTypes();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if (!objc_msgSend(a1, "deviationDetectionEnabledForType:", objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v6), "integerValue", (void)v9)))
        {
          uint64_t v7 = 0;
          goto LABEL_11;
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  uint64_t v7 = 1;
LABEL_11:

  return v7;
}

@end
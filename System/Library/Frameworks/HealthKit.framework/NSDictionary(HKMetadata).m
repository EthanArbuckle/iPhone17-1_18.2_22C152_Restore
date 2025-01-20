@interface NSDictionary(HKMetadata)
+ (id)hk_acceptedMetadataValueClasses;
+ (id)hk_acceptedPublicMetadataValueClasses;
+ (id)hk_secureCodingClasses;
+ (uint64_t)hk_acceptsMetadataValue:()HKMetadata allowPrivateMetadata:;
+ (void)_addDerivedPublicKeyIfNecessaryForPrivateKey:()HKMetadata mutableDictionary:;
- (BOOL)_hk_validateMetadataBaseValueContent:()HKMetadata forKey:error:;
- (BOOL)_hk_validateMetadataIntroducedWithIOS13WithValue:()HKMetadata forKey:error:;
- (BOOL)_hk_validateMetadataIntroducedWithIOS14WithValue:()HKMetadata forKey:error:;
- (BOOL)_hk_validateMetadataIntroducedWithIOS16WithValue:()HKMetadata forKey:error:;
- (BOOL)_hk_validateMetadataIntroducedWithIOS17WithValue:()HKMetadata forKey:error:;
- (BOOL)_hk_validateMetadataIntroducedWithIOS18WithValue:()HKMetadata forKey:error:;
- (BOOL)hk_validateMetadataKeysAndValuesAllowingPrivateMetadataKeys:()HKMetadata applicationSDKVersionToken:error:;
- (id)_copyWithoutPrivateMetadataKeysShouldDerivePublicKeys:()HKMetadata;
- (id)hk_copySanitizedForPublicClient;
- (id)hk_copyWithoutPrivateMetadataKeys;
- (uint64_t)_hk_validateMetadataIntroducedWithIOS15WithValue:()HKMetadata forKey:error:;
- (uint64_t)_hk_validateMetadataValueContent:()HKMetadata forKey:applicationSDKVersionToken:error:;
@end

@implementation NSDictionary(HKMetadata)

+ (uint64_t)hk_acceptsMetadataValue:()HKMetadata allowPrivateMetadata:
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (a4) {
    objc_msgSend(a1, "hk_acceptedMetadataValueClasses");
  }
  else {
    objc_msgSend(a1, "hk_acceptedPublicMetadataValueClasses");
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        if (objc_opt_isKindOfClass())
        {
          uint64_t v8 = 1;
          goto LABEL_14;
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  return v8;
}

+ (id)hk_acceptedMetadataValueClasses
{
  if (hk_acceptedMetadataValueClasses_onceToken != -1) {
    dispatch_once(&hk_acceptedMetadataValueClasses_onceToken, &__block_literal_global_31);
  }
  v0 = (void *)hk_acceptedMetadataValueClasses_valueClasses;

  return v0;
}

+ (id)hk_secureCodingClasses
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__NSDictionary_HKMetadata__hk_secureCodingClasses__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (hk_secureCodingClasses_onceToken != -1) {
    dispatch_once(&hk_secureCodingClasses_onceToken, block);
  }
  v1 = (void *)hk_secureCodingClasses___secureCodingClasses;

  return v1;
}

- (BOOL)hk_validateMetadataKeysAndValuesAllowingPrivateMetadataKeys:()HKMetadata applicationSDKVersionToken:error:
{
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x3032000000;
  long long v14 = __Block_byref_object_copy__15;
  long long v15 = __Block_byref_object_dispose__15;
  id v16 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __121__NSDictionary_HKMetadata__hk_validateMetadataKeysAndValuesAllowingPrivateMetadataKeys_applicationSDKVersionToken_error___block_invoke;
  v9[3] = &unk_1E58C0B78;
  char v10 = a3;
  v9[4] = a1;
  v9[5] = &v11;
  v9[6] = a2;
  v9[7] = a4;
  [a1 enumerateKeysAndObjectsUsingBlock:v9];
  id v6 = (id)v12[5];
  id v7 = v6;
  if (v6)
  {
    if (a5) {
      *a5 = v6;
    }
    else {
      _HKLogDroppedError(v6);
    }
  }

  _Block_object_dispose(&v11, 8);
  return v7 == 0;
}

- (id)hk_copyWithoutPrivateMetadataKeys
{
  v1 = (void *)[a1 _copyWithoutPrivateMetadataKeysShouldDerivePublicKeys:0];

  return v1;
}

- (id)hk_copySanitizedForPublicClient
{
  v1 = (void *)[a1 _copyWithoutPrivateMetadataKeysShouldDerivePublicKeys:1];

  return v1;
}

- (id)_copyWithoutPrivateMetadataKeysShouldDerivePublicKeys:()HKMetadata
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v4 = [a1 allKeys];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (!v5)
  {

    goto LABEL_19;
  }
  uint64_t v7 = v5;
  uint64_t v8 = 0;
  uint64_t v9 = *(void *)v17;
  do
  {
    uint64_t v10 = 0;
    do
    {
      if (*(void *)v17 != v9) {
        objc_enumerationMutation(v4);
      }
      uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * v10);
      if (_HKMetadataKeyIsPrivate(v11, v6))
      {
        if (v8)
        {
          if (a3) {
            goto LABEL_9;
          }
        }
        else
        {
          uint64_t v8 = (void *)[a1 mutableCopy];
          if (a3) {
LABEL_9:
          }
            [(id)objc_opt_class() _addDerivedPublicKeyIfNecessaryForPrivateKey:v11 mutableDictionary:v8];
        }
        [v8 removeObjectForKey:v11];
      }
      ++v10;
    }
    while (v7 != v10);
    uint64_t v12 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    uint64_t v7 = v12;
  }
  while (v12);

  if (v8)
  {
    uint64_t v13 = [v8 copy];

    return (id)v13;
  }
LABEL_19:

  return a1;
}

+ (void)_addDerivedPublicKeyIfNecessaryForPrivateKey:()HKMetadata mutableDictionary:
{
  id v12 = a3;
  id v5 = a4;
  if ([v12 isEqualToString:@"_HKPrivateHeartRateContext"])
  {
    id v6 = [v5 objectForKeyedSubscript:v12];
    uint64_t v7 = HKHeartRateMotionContextForPrivateHeartRateContext([v6 integerValue]);

    uint64_t v8 = [NSNumber numberWithInteger:v7];
    [v5 setObject:v8 forKeyedSubscript:@"HKMetadataKeyHeartRateMotionContext"];
  }
  if ([v12 isEqualToString:@"_HKPrivateMetadataKeyAppleHeartbeatSeriesAlgorithmVersion"])
  {
    uint64_t v9 = [v5 objectForKeyedSubscript:v12];
    [v5 setObject:v9 forKeyedSubscript:@"HKAlgorithmVersion"];
  }
  if ([v12 isEqualToString:@"_HKPrivateMetadataKeyBackgroundAtrialFibrillationDetectionVersion"])
  {
    uint64_t v10 = [v5 objectForKeyedSubscript:v12];
    uint64_t v11 = [NSNumber numberWithInteger:HKAppleIrregularRhythmNotificationsAlgorithmVersionForPrivateVersionString(v10)];
    [v5 setObject:v11 forKeyedSubscript:@"HKAlgorithmVersion"];
  }
}

+ (id)hk_acceptedPublicMetadataValueClasses
{
  if (hk_acceptedPublicMetadataValueClasses_onceToken != -1) {
    dispatch_once(&hk_acceptedPublicMetadataValueClasses_onceToken, &__block_literal_global_23);
  }
  v0 = (void *)hk_acceptedPublicMetadataValueClasses_valueClasses;

  return v0;
}

- (BOOL)_hk_validateMetadataBaseValueContent:()HKMetadata forKey:error:
{
  id v8 = a3;
  id v9 = a4;
  if (_hk_validateMetadataBaseValueContent_forKey_error__onceToken != -1) {
    dispatch_once(&_hk_validateMetadataBaseValueContent_forKey_error__onceToken, &__block_literal_global_25);
  }
  if (+[HKMetadataValidationUtilities hk_validateMetadataValueClass:v8 forKey:v9 expectedClassLookupTable:_hk_validateMetadataBaseValueContent_forKey_error__supportedKeyLookupTableBase error:a5])
  {
    if ([@"HKDigitalSignature" isEqualToString:v9])
    {
      BOOL v10 = +[HKMetadataValidationUtilities hk_validateDigitalSignatureMetadataValue:v8 error:a5];
LABEL_19:
      BOOL v11 = v10;
      goto LABEL_20;
    }
    if ([@"HKTimeZone" isEqualToString:v9])
    {
      BOOL v10 = +[HKMetadataValidationUtilities hk_validateTimeZoneMetadataValue:v8 error:a5];
      goto LABEL_19;
    }
    if ([@"HKHeartRateSensorLocation" isEqualToString:v9])
    {
      BOOL v10 = +[HKMetadataValidationUtilities hk_validateHeartRateSensorLocationMetadataValue:v8 error:a5];
      goto LABEL_19;
    }
    if ([@"HKInsulinDeliveryReason" isEqualToString:v9])
    {
      BOOL v10 = +[HKMetadataValidationUtilities hk_validateInsulinDeliveryReasonMetadataValue:v8 error:a5];
      goto LABEL_19;
    }
    if ([@"HKBloodGlucoseMealTime" isEqualToString:v9])
    {
      BOOL v10 = +[HKMetadataValidationUtilities hk_validateMealTimeMetadataValue:v8 error:a5];
      goto LABEL_19;
    }
    if ([@"HKBodyTemperatureSensorLocation" isEqualToString:v9])
    {
      BOOL v10 = +[HKMetadataValidationUtilities hk_validateBodyTemperatureSensorLocationMetadataValue:v8 error:a5];
      goto LABEL_19;
    }
    if ([@"HKWeatherCondition" isEqualToString:v9])
    {
      BOOL v10 = +[HKMetadataValidationUtilities hk_validateWeatherConditionMetadataValue:v8 error:a5];
      goto LABEL_19;
    }
    if (![@"HKWeatherTemperature" isEqualToString:v9])
    {
      if ([@"HKWeatherHumidity" isEqualToString:v9])
      {
        uint64_t v13 = +[HKUnit percentUnit];
        goto LABEL_27;
      }
      if ([@"HKLapLength" isEqualToString:v9])
      {
        uint64_t v13 = +[HKUnit meterUnit];
        goto LABEL_27;
      }
      if ([@"HKSwimmingLocationType" isEqualToString:v9])
      {
        BOOL v10 = +[HKMetadataValidationUtilities hk_validateSwimmingLocationTypeMetadataValue:v8 error:a5];
        goto LABEL_19;
      }
      if ([@"HKSwimmingStrokeStyle" isEqualToString:v9])
      {
        BOOL v10 = +[HKMetadataValidationUtilities hk_validateSwimmingStrokeStyleMetadataValue:v8 error:a5];
        goto LABEL_19;
      }
      if ([@"HKMetadataKeySyncIdentifier" isEqualToString:v9])
      {
        BOOL v10 = +[HKMetadataValidationUtilities hk_validateSyncIdentifierMetadataValue:a1 error:a5];
        goto LABEL_19;
      }
      if ([@"HKMetadataKeySyncVersion" isEqualToString:v9])
      {
        BOOL v10 = +[HKMetadataValidationUtilities hk_validateSyncVersionMetadataValue:a1 error:a5];
        goto LABEL_19;
      }
      if ([@"HKVO2MaxTestType" isEqualToString:v9])
      {
        BOOL v10 = +[HKMetadataValidationUtilities hk_validateVO2MaxTestTypeMetadataValue:v8 error:a5];
        goto LABEL_19;
      }
      if ([@"_HKPrivateCoreMotionSourceIdentifier" isEqualToString:v9])
      {
        BOOL v10 = +[HKMetadataValidationUtilities hk_validateCoreMotionSourceIdentifierMetadataValue:v8 error:a5];
        goto LABEL_19;
      }
      if ([@"HKMetadataKeyUserMotionContext" isEqualToString:v9])
      {
        BOOL v10 = +[HKMetadataValidationUtilities hk_validateUserMotionContextMetadataValue:v8 error:a5];
        goto LABEL_19;
      }
      if ([@"HKMetadataKeyHeartRateRecoveryTestType" isEqualToString:v9])
      {
        BOOL v10 = +[HKMetadataValidationUtilities hk_validateHeartRateRecoveryTestTypeMetadataValue:v8 error:a5];
        goto LABEL_19;
      }
      if ([@"HKMetadataKeyHeartRateRecoveryActivityType" isEqualToString:v9])
      {
        BOOL v10 = +[HKMetadataValidationUtilities hk_validateHeartRateRecoveryActivityTypeMetadataValue:v8 error:a5];
        goto LABEL_19;
      }
      if ([@"HKMetadataKeyHeartRateRecoveryActivityDuration" isEqualToString:v9])
      {
        uint64_t v13 = +[HKUnit secondUnit];
        goto LABEL_27;
      }
      if ([@"HKMetadataKeyHeartRateRecoveryMaxObservedRecoveryHeartRate" isEqualToString:v9])
      {
        uint64_t v13 = +[HKUnit _countPerMinuteUnit];
        goto LABEL_27;
      }
      if (![@"_HKPrivateMetadataKeySkinSurfaceTemperature" isEqualToString:v9])
      {
        if ([@"HKMetadataKeyWaterSalinity" isEqualToString:v9])
        {
          BOOL v10 = +[HKMetadataValidationUtilities hk_validateWaterSalinityMetadataValue:v8 error:a5];
        }
        else if ([@"HKCyclingCyclingFunctionalThresholdPowerTestType" isEqualToString:v9])
        {
          BOOL v10 = +[HKMetadataValidationUtilities hk_validateCyclingFTPTestTypeMetadataValue:v8 error:a5];
        }
        else
        {
          if (![@"HKPhysicalEffortEstimationType" isEqualToString:v9])
          {
            BOOL v11 = 1;
            goto LABEL_20;
          }
          BOOL v10 = +[HKMetadataValidationUtilities hk_validatePhysicalEffortEstimationTypeMetadataValue:v8 error:a5];
        }
        goto LABEL_19;
      }
    }
    uint64_t v13 = +[HKUnit degreeCelsiusUnit];
LABEL_27:
    long long v14 = (void *)v13;
    BOOL v11 = +[HKMetadataValidationUtilities hk_validateQuantityMetadataValue:v9 value:v8 compatibleUnit:v13 error:a5];

    goto LABEL_20;
  }
  BOOL v11 = 0;
LABEL_20:

  return v11;
}

- (BOOL)_hk_validateMetadataIntroducedWithIOS13WithValue:()HKMetadata forKey:error:
{
  id v7 = a3;
  id v8 = a4;
  if (_hk_validateMetadataIntroducedWithIOS13WithValue_forKey_error__onceToken != -1) {
    dispatch_once(&_hk_validateMetadataIntroducedWithIOS13WithValue_forKey_error__onceToken, &__block_literal_global_29);
  }
  if (!+[HKMetadataValidationUtilities hk_validateMetadataValueClass:v7 forKey:v8 expectedClassLookupTable:_hk_validateMetadataIntroducedWithIOS13WithValue_forKey_error__supportedKeyLookupTableYukon error:a5])
  {
    BOOL v11 = 0;
    goto LABEL_9;
  }
  if ([@"HKElevationAscended" isEqualToString:v8]
    || [@"HKElevationDescended" isEqualToString:v8])
  {
LABEL_6:
    uint64_t v9 = +[HKUnit meterUnit];
LABEL_7:
    BOOL v10 = (void *)v9;
    BOOL v11 = +[HKMetadataValidationUtilities hk_validateQuantityMetadataValue:v8 value:v7 compatibleUnit:v9 error:a5];

    goto LABEL_9;
  }
  if ([@"HKAverageSpeed" isEqualToString:v8]
    || [@"HKMaximumSpeed" isEqualToString:v8])
  {
    uint64_t v13 = @"m/s";
LABEL_13:
    uint64_t v9 = +[HKUnit unitFromString:v13];
    goto LABEL_7;
  }
  if ([@"HKAlpineSlopeGrade" isEqualToString:v8])
  {
    uint64_t v9 = +[HKUnit percentUnit];
    goto LABEL_7;
  }
  if ([@"HKFitnessMachineDuration" isEqualToString:v8])
  {
    uint64_t v9 = +[HKUnit minuteUnit];
    goto LABEL_7;
  }
  if ([@"HKIndoorBikeDistance" isEqualToString:v8]
    || [@"HKCrossTrainerDistance" isEqualToString:v8])
  {
    goto LABEL_6;
  }
  if ([@"HKAverageMETs" isEqualToString:v8])
  {
    uint64_t v13 = @"kcal/(kg*hr)";
    goto LABEL_13;
  }
  if ([@"HKMetadataKeyAudioExposureLevel" isEqualToString:v8])
  {
    uint64_t v9 = +[HKUnit decibelAWeightedSoundPressureLevelUnit];
    goto LABEL_7;
  }
  if ([@"_HKPrivateWorkoutActivityMoveMode" isEqualToString:v8]) {
    BOOL v11 = +[HKMetadataValidationUtilities hk_validateActivityMoveModeMetadataValue:v7 error:a5];
  }
  else {
    BOOL v11 = 1;
  }
LABEL_9:

  return v11;
}

- (BOOL)_hk_validateMetadataIntroducedWithIOS14WithValue:()HKMetadata forKey:error:
{
  id v7 = a3;
  id v8 = a4;
  if (_hk_validateMetadataIntroducedWithIOS14WithValue_forKey_error__onceToken != -1) {
    dispatch_once(&_hk_validateMetadataIntroducedWithIOS14WithValue_forKey_error__onceToken, &__block_literal_global_37_0);
  }
  if (!+[HKMetadataValidationUtilities hk_validateMetadataValueClass:v7 forKey:v8 expectedClassLookupTable:_hk_validateMetadataIntroducedWithIOS14WithValue_forKey_error__supportedKeyLookupTableAzul error:a5])
  {
    BOOL v11 = 0;
    goto LABEL_13;
  }
  if (![@"HKMetadataKeyAudioExposureDuration" isEqualToString:v8])
  {
    if ([@"HKMetadataKeyAppleECGAlgorithmVersion" isEqualToString:v8])
    {
      BOOL v12 = +[HKMetadataValidationUtilities hk_validateAppleECGAlgorithmValue:v7 error:a5];
    }
    else
    {
      if (![@"HKMetadataKeyDevicePlacementSide" isEqualToString:v8])
      {
        if ([@"_HKPrivateMetadataKeyAudioExposureLimit" isEqualToString:v8])
        {
          uint64_t v9 = +[HKUnit decibelAWeightedSoundPressureLevelUnit];
        }
        else
        {
          if (![@"HKVO2MaxValue" isEqualToString:v8]
            && ![@"HKLowCardioFitnessEventThreshold" isEqualToString:v8])
          {
            BOOL v11 = 1;
            goto LABEL_13;
          }
          uint64_t v9 = +[HKUnit unitFromString:@"ml/kg*min"];
        }
        goto LABEL_6;
      }
      BOOL v12 = +[HKMetadataValidationUtilities hk_validateDevicePlacementSideValue:v7 error:a5];
    }
    BOOL v11 = v12;
    goto LABEL_13;
  }
  uint64_t v9 = +[HKUnit secondUnit];
LABEL_6:
  BOOL v10 = (void *)v9;
  BOOL v11 = +[HKMetadataValidationUtilities hk_validateQuantityMetadataValue:v8 value:v7 compatibleUnit:v9 error:a5];

LABEL_13:
  return v11;
}

- (uint64_t)_hk_validateMetadataIntroducedWithIOS15WithValue:()HKMetadata forKey:error:
{
  id v7 = a3;
  id v8 = a4;
  if (_hk_validateMetadataIntroducedWithIOS15WithValue_forKey_error__onceToken != -1) {
    dispatch_once(&_hk_validateMetadataIntroducedWithIOS15WithValue_forKey_error__onceToken, &__block_literal_global_42);
  }
  if (+[HKMetadataValidationUtilities hk_validateMetadataValueClass:v7 forKey:v8 expectedClassLookupTable:_hk_validateMetadataIntroducedWithIOS15WithValue_forKey_error__supportedKeyLookupTableSky error:a5])
  {
    if ([@"_HKPrivateMetadataKeyAppleHeartbeatSeriesAlgorithmVersion" isEqualToString:v8])
    {
      BOOL v9 = +[HKMetadataValidationUtilities hk_validateAppleHeartbeatSeriesAlgorithmVersionMetadataValue:v7 error:a5];
    }
    else
    {
      if (![@"HKMetadataKeyAppleIrregularRhythmNotificationsAlgorithmVersion" isEqualToString:v8])
      {
        uint64_t v10 = 1;
        goto LABEL_11;
      }
      BOOL v9 = +[HKMetadataValidationUtilities hk_validateAppleIrregularRhythmNotificationsAlgorithmVersionMetadataValue:v7 error:a5];
    }
    uint64_t v10 = v9;
  }
  else
  {
    uint64_t v10 = 0;
  }
LABEL_11:

  return v10;
}

- (BOOL)_hk_validateMetadataIntroducedWithIOS16WithValue:()HKMetadata forKey:error:
{
  id v7 = a3;
  id v8 = a4;
  if (_hk_validateMetadataIntroducedWithIOS16WithValue_forKey_error__onceToken != -1) {
    dispatch_once(&_hk_validateMetadataIntroducedWithIOS16WithValue_forKey_error__onceToken, &__block_literal_global_44);
  }
  if (+[HKMetadataValidationUtilities hk_validateMetadataValueClass:v7 forKey:v8 expectedClassLookupTable:_hk_validateMetadataIntroducedWithIOS16WithValue_forKey_error__supportedKeyLookupTableSydney error:a5])
  {
    if ([@"HKMetadataKeyHeadphoneGain" isEqualToString:v8])
    {
      BOOL v9 = +[HKUnit decibelAWeightedSoundPressureLevelUnit];
      BOOL v10 = +[HKMetadataValidationUtilities hk_validateQuantityMetadataValue:v8 value:v7 compatibleUnit:v9 error:a5];
    }
    else
    {
      BOOL v10 = 1;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)_hk_validateMetadataIntroducedWithIOS17WithValue:()HKMetadata forKey:error:
{
  uint64_t v7 = _hk_validateMetadataIntroducedWithIOS17WithValue_forKey_error__onceToken;
  id v8 = a4;
  id v9 = a3;
  if (v7 != -1) {
    dispatch_once(&_hk_validateMetadataIntroducedWithIOS17WithValue_forKey_error__onceToken, &__block_literal_global_46);
  }
  BOOL v10 = +[HKMetadataValidationUtilities hk_validateMetadataValueClass:v9 forKey:v8 expectedClassLookupTable:_hk_validateMetadataIntroducedWithIOS17WithValue_forKey_error__supportedKeyLookupTableDawn error:a5];

  return v10;
}

- (BOOL)_hk_validateMetadataIntroducedWithIOS18WithValue:()HKMetadata forKey:error:
{
  uint64_t v7 = _hk_validateMetadataIntroducedWithIOS18WithValue_forKey_error__onceToken;
  id v8 = a4;
  id v9 = a3;
  if (v7 != -1) {
    dispatch_once(&_hk_validateMetadataIntroducedWithIOS18WithValue_forKey_error__onceToken, &__block_literal_global_48);
  }
  BOOL v10 = +[HKMetadataValidationUtilities hk_validateMetadataValueClass:v9 forKey:v8 expectedClassLookupTable:_hk_validateMetadataIntroducedWithIOS18WithValue_forKey_error__supportedKeyLookupTableIOS18 error:a5];

  return v10;
}

- (uint64_t)_hk_validateMetadataValueContent:()HKMetadata forKey:applicationSDKVersionToken:error:
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = objc_msgSend(a1, "_hk_validateMetadataBaseValueContent:forKey:error:", v9, v10, a6);
  if (HKProgramSDKTokenAtLeast()) {
    uint64_t v11 = v11 & objc_msgSend(a1, "_hk_validateMetadataIntroducedWithIOS13WithValue:forKey:error:", v9, v10, a6);
  }
  if (HKProgramSDKTokenAtLeast()) {
    uint64_t v11 = v11 & objc_msgSend(a1, "_hk_validateMetadataIntroducedWithIOS14WithValue:forKey:error:", v9, v10, a6);
  }
  if (HKProgramSDKTokenAtLeast()) {
    uint64_t v11 = v11 & objc_msgSend(a1, "_hk_validateMetadataIntroducedWithIOS15WithValue:forKey:error:", v9, v10, a6);
  }
  if (HKProgramSDKTokenAtLeast()) {
    uint64_t v11 = v11 & objc_msgSend(a1, "_hk_validateMetadataIntroducedWithIOS16WithValue:forKey:error:", v9, v10, a6);
  }
  if (HKProgramSDKTokenAtLeast()) {
    uint64_t v11 = v11 & objc_msgSend(a1, "_hk_validateMetadataIntroducedWithIOS17WithValue:forKey:error:", v9, v10, a6);
  }
  if (HKProgramSDKTokenAtLeast()) {
    uint64_t v11 = v11 & objc_msgSend(a1, "_hk_validateMetadataIntroducedWithIOS18WithValue:forKey:error:", v9, v10, a6);
  }

  return v11;
}

@end
@interface NSDictionary
@end

@implementation NSDictionary

uint64_t __59__NSDictionary_HKMetadata__hk_acceptedMetadataValueClasses__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  hk_acceptedMetadataValueClasses_valueClasses = objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, objc_opt_class(), 0);

  return MEMORY[0x1F41817F8]();
}

void __50__NSDictionary_HKMetadata__hk_secureCodingClasses__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "hk_acceptedMetadataValueClasses");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v3 setByAddingObject:objc_opt_class()];
  uint64_t v2 = (void *)hk_secureCodingClasses___secureCodingClasses;
  hk_secureCodingClasses___secureCodingClasses = v1;
}

uint64_t __51__NSDictionary_HealthKit__hk_allValuesBySortedKeys__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
}

void __56__NSDictionary_HealthKit__hk_filteredDictionaryForKeys___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 32) containsObject:v6]) {
    [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:v6];
  }
}

void __37__NSDictionary_HealthKit__hk_filter___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))()) {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
  }
}

void __34__NSDictionary_HealthKit__hk_map___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__NSDictionary_HealthKit__hk_map___block_invoke_2;
  v6[3] = &unk_1E58BEC28;
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = *(id *)(a1 + 32);
  (*(void (**)(uint64_t, uint64_t, uint64_t, void *))(v5 + 16))(v5, a2, a3, v6);
}

uint64_t __34__NSDictionary_HealthKit__hk_map___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    if (a3) {
      return [*(id *)(result + 32) setObject:a3 forKeyedSubscript:a2];
    }
  }
  return result;
}

void __121__NSDictionary_HKMetadata__hk_validateMetadataKeysAndValuesAllowingPrivateMetadataKeys_applicationSDKVersionToken_error___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  if (objc_msgSend(MEMORY[0x1E4F1C9E8], "hk_acceptsMetadataValue:allowPrivateMetadata:", v8, *(unsigned __int8 *)(a1 + 64)))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (*(unsigned char *)(a1 + 64)
       || (_HKMetadataKeyIsPrivate(v7, v9) & 1) == 0 && !_HKMetadataKeyIsReadOnly(v7)))
    {
      uint64_t v10 = *(void *)(a1 + 56);
      v11 = *(void **)(a1 + 32);
      uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
      id obj = *(id *)(v12 + 40);
      char v13 = objc_msgSend(v11, "_hk_validateMetadataValueContent:forKey:applicationSDKVersionToken:error:", v8, v7, v10, &obj);
      objc_storeStrong((id *)(v12 + 40), obj);
      if (v13) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), *(void *)(a1 + 48), @"Invalid metadata key: %@"", v7, v17);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), *(void *)(a1 + 48), @"Invalid metadata value: %@, for key: %@"", v8, v7);
  uint64_t v14 = };
  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;

LABEL_11:
  *a4 = 1;
LABEL_12:
}

uint64_t __65__NSDictionary_HKMetadata__hk_acceptedPublicMetadataValueClasses__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  hk_acceptedPublicMetadataValueClasses_valueClasses = objc_msgSend(v0, "setWithObjects:", v1, v2, v3, objc_opt_class(), 0);

  return MEMORY[0x1F41817F8]();
}

void __78__NSDictionary_HKMetadata___hk_validateMetadataBaseValueContent_forKey_error___block_invoke()
{
  v3[52] = *MEMORY[0x1E4F143B8];
  v2[0] = @"_HKPrivateCoreMotionSourceIdentifier";
  v3[0] = objc_opt_class();
  v2[1] = @"_HKPrivateFallActionRequested";
  v3[1] = objc_opt_class();
  v2[2] = @"_HKPrivateHeartRateContext";
  v3[2] = objc_opt_class();
  v2[3] = @"_HKPrivateMetadataKeyInternalLiveOnAlgorithmVersion";
  v3[3] = objc_opt_class();
  v2[4] = @"_HKPrivateMetadataKeySkinSurfaceTemperature";
  v3[4] = objc_opt_class();
  v2[5] = @"HKActivityType";
  v3[5] = objc_opt_class();
  v2[6] = @"HKMetadataKeyAppleFitnessPlusCatalogIdentifier";
  v3[6] = objc_opt_class();
  v2[7] = @"HKMetadataKeyAppleFitnessPlusSession";
  v3[7] = objc_opt_class();
  v2[8] = @"HKBloodGlucoseMealTime";
  v3[8] = objc_opt_class();
  v2[9] = @"HKBodyTemperatureSensorLocation";
  v3[9] = objc_opt_class();
  v2[10] = @"HKCoachedWorkout";
  v3[10] = objc_opt_class();
  v2[11] = @"HKCyclingCyclingFunctionalThresholdPowerTestType";
  v3[11] = objc_opt_class();
  v2[12] = @"HKDeviceManufacturerName";
  v3[12] = objc_opt_class();
  v2[13] = @"HKDeviceName";
  v3[13] = objc_opt_class();
  v2[14] = @"HKDeviceSerialNumber";
  v3[14] = objc_opt_class();
  v2[15] = @"HKDigitalSignature";
  v3[15] = objc_opt_class();
  v2[16] = @"HKExternalUUID";
  v3[16] = objc_opt_class();
  v2[17] = @"HKFoodType";
  v3[17] = objc_opt_class();
  v2[18] = @"HKGroupFitness";
  v3[18] = objc_opt_class();
  v2[19] = @"HKHeartRateEventThreshold";
  v3[19] = objc_opt_class();
  v2[20] = @"HKMetadataKeyHeartRateMotionContext";
  v3[20] = objc_opt_class();
  v2[21] = @"HKMetadataKeyHeartRateRecoveryActivityDuration";
  v3[21] = objc_opt_class();
  v2[22] = @"HKMetadataKeyHeartRateRecoveryActivityType";
  v3[22] = objc_opt_class();
  v2[23] = @"HKMetadataKeyHeartRateRecoveryMaxObservedRecoveryHeartRate";
  v3[23] = objc_opt_class();
  v2[24] = @"HKMetadataKeyHeartRateRecoveryTestType";
  v3[24] = objc_opt_class();
  v2[25] = @"HKHeartRateSensorLocation";
  v3[25] = objc_opt_class();
  v2[26] = @"HKIndoorWorkout";
  v3[26] = objc_opt_class();
  v2[27] = @"HKInsulinDeliveryReason";
  v3[27] = objc_opt_class();
  v2[28] = @"HKLapLength";
  v3[28] = objc_opt_class();
  v2[29] = @"HKMetadataKeyMaximumLightIntensity";
  v3[29] = objc_opt_class();
  v2[30] = @"HKMenstrualCycleStart";
  v3[30] = objc_opt_class();
  v2[31] = @"HKPhysicalEffortEstimationType";
  v3[31] = objc_opt_class();
  v2[32] = @"HKMetadataKeyQuantityClampedToLowerBound";
  v3[32] = objc_opt_class();
  v2[33] = @"HKMetadataKeyQuantityClampedToUpperBound";
  v3[33] = objc_opt_class();
  v2[34] = @"HKReferenceRangeLowerLimit";
  v3[34] = objc_opt_class();
  v2[35] = @"HKReferenceRangeUpperLimit";
  v3[35] = objc_opt_class();
  v2[36] = @"HKMetadataKeySessionEstimate";
  v3[36] = objc_opt_class();
  v2[37] = @"HKSwimmingLocationType";
  v3[37] = objc_opt_class();
  v2[38] = @"HKSwimmingStrokeStyle";
  v3[38] = objc_opt_class();
  v2[39] = @"HKMetadataKeySyncIdentifier";
  v3[39] = objc_opt_class();
  v2[40] = @"HKMetadataKeySyncVersion";
  v3[40] = objc_opt_class();
  v2[41] = @"HKTimeZone";
  v3[41] = objc_opt_class();
  v2[42] = @"HKUDIDeviceIdentifier";
  v3[42] = objc_opt_class();
  v2[43] = @"HKUDIProductionIdentifier";
  v3[43] = objc_opt_class();
  v2[44] = @"HKMetadataKeyUserMotionContext";
  v3[44] = objc_opt_class();
  v2[45] = @"HKWasTakenInLab";
  v3[45] = objc_opt_class();
  v2[46] = @"HKWasUserEntered";
  v3[46] = objc_opt_class();
  v2[47] = @"HKMetadataKeyWaterSalinity";
  v3[47] = objc_opt_class();
  v2[48] = @"HKWeatherCondition";
  v3[48] = objc_opt_class();
  v2[49] = @"HKWeatherHumidity";
  v3[49] = objc_opt_class();
  v2[50] = @"HKWeatherTemperature";
  v3[50] = objc_opt_class();
  v2[51] = @"HKWorkoutBrandName";
  v3[51] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:52];
  uint64_t v1 = (void *)_hk_validateMetadataBaseValueContent_forKey_error__supportedKeyLookupTableBase;
  _hk_validateMetadataBaseValueContent_forKey_error__supportedKeyLookupTableBase = v0;
}

void __90__NSDictionary_HKMetadata___hk_validateMetadataIntroducedWithIOS13WithValue_forKey_error___block_invoke()
{
  v3[12] = *MEMORY[0x1E4F143B8];
  v2[0] = @"HKElevationAscended";
  v3[0] = objc_opt_class();
  v2[1] = @"HKElevationDescended";
  v3[1] = objc_opt_class();
  v2[2] = @"HKSexualActivityProtectionUsed";
  v3[2] = objc_opt_class();
  v2[3] = @"HKAverageSpeed";
  v3[3] = objc_opt_class();
  v2[4] = @"HKMaximumSpeed";
  v3[4] = objc_opt_class();
  v2[5] = @"HKAlpineSlopeGrade";
  v3[5] = objc_opt_class();
  v2[6] = @"HKFitnessMachineDuration";
  v3[6] = objc_opt_class();
  v2[7] = @"HKIndoorBikeDistance";
  v3[7] = objc_opt_class();
  v2[8] = @"HKCrossTrainerDistance";
  v3[8] = objc_opt_class();
  v2[9] = @"HKAverageMETs";
  v3[9] = objc_opt_class();
  v2[10] = @"HKMetadataKeyAudioExposureLevel";
  v3[10] = objc_opt_class();
  v2[11] = @"_HKPrivateWorkoutActivityMoveMode";
  v3[11] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:12];
  uint64_t v1 = (void *)_hk_validateMetadataIntroducedWithIOS13WithValue_forKey_error__supportedKeyLookupTableYukon;
  _hk_validateMetadataIntroducedWithIOS13WithValue_forKey_error__supportedKeyLookupTableYukon = v0;
}

void __90__NSDictionary_HKMetadata___hk_validateMetadataIntroducedWithIOS14WithValue_forKey_error___block_invoke()
{
  v3[12] = *MEMORY[0x1E4F143B8];
  v2[0] = @"HKMetadataKeyAudioExposureDuration";
  v3[0] = objc_opt_class();
  v2[1] = @"HKMetadataKeyAppleECGAlgorithmVersion";
  v3[1] = objc_opt_class();
  v2[2] = @"HKMetadataKeyDevicePlacementSide";
  v3[2] = objc_opt_class();
  v2[3] = @"HKMetadataKeyAppleDeviceCalibrated";
  v3[3] = objc_opt_class();
  v2[4] = @"HKVO2MaxValue";
  v3[4] = objc_opt_class();
  v2[5] = @"HKLowCardioFitnessEventThreshold";
  v3[5] = objc_opt_class();
  v2[6] = @"_HKPrivateMetadataKeyUserOnBetaBlocker";
  v3[6] = objc_opt_class();
  v2[7] = @"_HKPrivateMetadataKeySessionUUID";
  v3[7] = objc_opt_class();
  v2[8] = @"_HKPrivateMetadataKeyRepeatNotification";
  v3[8] = objc_opt_class();
  v2[9] = @"_HKPrivateMetadataKeyAudioExposureLimit";
  v3[9] = objc_opt_class();
  v2[10] = @"_HKPrivateMetadataKeyHeadphoneAudioDataIsTransient";
  v3[10] = objc_opt_class();
  v2[11] = @"_HKPrivateMetadataKeyNotificationIncludesPrunableData";
  v3[11] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:12];
  uint64_t v1 = (void *)_hk_validateMetadataIntroducedWithIOS14WithValue_forKey_error__supportedKeyLookupTableAzul;
  _hk_validateMetadataIntroducedWithIOS14WithValue_forKey_error__supportedKeyLookupTableAzul = v0;
}

void __90__NSDictionary_HKMetadata___hk_validateMetadataIntroducedWithIOS15WithValue_forKey_error___block_invoke()
{
  v3[4] = *MEMORY[0x1E4F143B8];
  v2[0] = @"_HKPrivateMetadataKeyAppleHeartbeatSeriesAlgorithmVersion";
  v3[0] = objc_opt_class();
  v2[1] = @"HKMetadataKeyAppleIrregularRhythmNotificationsAlgorithmVersion";
  v3[1] = objc_opt_class();
  v2[2] = @"HKDateOfEarliestDataUsedForEstimate";
  v3[2] = objc_opt_class();
  v2[3] = @"HKAlgorithmVersion";
  v3[3] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:4];
  uint64_t v1 = (void *)_hk_validateMetadataIntroducedWithIOS15WithValue_forKey_error__supportedKeyLookupTableSky;
  _hk_validateMetadataIntroducedWithIOS15WithValue_forKey_error__supportedKeyLookupTableSky = v0;
}

void __90__NSDictionary_HKMetadata___hk_validateMetadataIntroducedWithIOS16WithValue_forKey_error___block_invoke()
{
  v3[4] = *MEMORY[0x1E4F143B8];
  v2[0] = @"HKSWOLFScore";
  v3[0] = objc_opt_class();
  v2[1] = @"_HKPrivateWorkoutWeatherSourceName";
  v3[1] = objc_opt_class();
  v2[2] = @"_HKPrivateWorkoutExtendedMode";
  v3[2] = objc_opt_class();
  v2[3] = @"HKMetadataKeyHeadphoneGain";
  v3[3] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:4];
  uint64_t v1 = (void *)_hk_validateMetadataIntroducedWithIOS16WithValue_forKey_error__supportedKeyLookupTableSydney;
  _hk_validateMetadataIntroducedWithIOS16WithValue_forKey_error__supportedKeyLookupTableSydney = v0;
}

void __90__NSDictionary_HKMetadata___hk_validateMetadataIntroducedWithIOS17WithValue_forKey_error___block_invoke()
{
  v3[6] = *MEMORY[0x1E4F143B8];
  v2[0] = @"HKCyclingCyclingFunctionalThresholdPowerTestType";
  v3[0] = objc_opt_class();
  v2[1] = @"HKActivityType";
  v3[1] = objc_opt_class();
  v2[2] = @"HKPhysicalEffortEstimationType";
  v3[2] = objc_opt_class();
  v2[3] = @"HKMetadataKeyWaterSalinity";
  v3[3] = objc_opt_class();
  void v2[4] = @"HKMetadataKeyAppleFitnessPlusSession";
  v3[4] = objc_opt_class();
  v2[5] = @"HKMetadataKeyMaximumLightIntensity";
  void v3[5] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:6];
  uint64_t v1 = (void *)_hk_validateMetadataIntroducedWithIOS17WithValue_forKey_error__supportedKeyLookupTableDawn;
  _hk_validateMetadataIntroducedWithIOS17WithValue_forKey_error__supportedKeyLookupTableDawn = v0;
}

void __90__NSDictionary_HKMetadata___hk_validateMetadataIntroducedWithIOS18WithValue_forKey_error___block_invoke()
{
  v3[12] = *MEMORY[0x1E4F143B8];
  v2[0] = @"_HKPrivateMetadataKeyHearingTestTakenWithCongestion";
  v3[0] = objc_opt_class();
  v2[1] = @"_HKPrivateMetadataKeyHearingTestTakenWithRecentLoudNoiseExposure";
  v3[1] = objc_opt_class();
  v2[2] = @"_HKPrivateMetadataKeyHearingTestTakenFromFirstParty";
  v3[2] = objc_opt_class();
  v2[3] = @"_HKPrivateMetadataKeyHearingTestTakenWithLeftEarNoiseLevel";
  v3[3] = objc_opt_class();
  void v2[4] = @"_HKPrivateMetadataKeyHearingTestTakenWithRightEarNoiseLevel";
  v3[4] = objc_opt_class();
  v2[5] = @"_HKPrivateMetadataKeyPregnancyStartSourceMethod";
  void v3[5] = objc_opt_class();
  void v2[6] = @"_HKPrivateMetadataKeyPregnancyEmbryoAgeDays";
  v3[6] = objc_opt_class();
  v2[7] = @"_HKPrivateMetadataKeyPregnancyDetailsRecordedDate";
  void v3[7] = objc_opt_class();
  v2[8] = @"_HKPrivateMetadataKeyWorkoutActivityUUID";
  v3[8] = objc_opt_class();
  v2[9] = @"_HKPrivateMetadataKeyTransientRatingOfEstimatedExertion";
  v3[9] = objc_opt_class();
  v2[10] = @"_HKPrivateMetadataKeySessionIncomplete";
  v3[10] = objc_opt_class();
  v2[11] = @"HKMetadataKeyAppleFitnessPlusCatalogIdentifier";
  v3[11] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:12];
  uint64_t v1 = (void *)_hk_validateMetadataIntroducedWithIOS18WithValue_forKey_error__supportedKeyLookupTableIOS18;
  _hk_validateMetadataIntroducedWithIOS18WithValue_forKey_error__supportedKeyLookupTableIOS18 = v0;
}

void __121__NSDictionary_HKWorkoutEventMetadata__hk_validateMetadataKeysAndValuesForWorkoutEvent_applicationSDKVersionToken_error___block_invoke(void *a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  if (objc_msgSend(MEMORY[0x1E4F1C9E8], "hk_acceptsMetadataValue:allowPrivateMetadata:", v8, 1))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)a1[4];
      uint64_t v10 = a1[5];
      uint64_t v11 = a1[8];
      uint64_t v12 = *(void *)(a1[6] + 8);
      id obj = *(id *)(v12 + 40);
      char v13 = objc_msgSend(v9, "_hk_validateMetadataValueForWorkoutEvent:valueContent:forKey:applicationSDKVersionToken:error:", v10, v8, v7, v11, &obj);
      objc_storeStrong((id *)(v12 + 40), obj);
      if (v13) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a1[7], @"Invalid metadata key: %@"", v7, v17);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a1[7], @"Invalid metadata value: %@, for key: %@"", v8, v7);
  uint64_t v14 = };
  uint64_t v15 = *(void *)(a1[6] + 8);
  v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;

LABEL_8:
  *a4 = 1;
LABEL_9:
}

void __109__NSDictionary_HKWorkoutEventMetadata___hk_validateYukonMetadataValueForWorkoutEvent_valueContent_key_error___block_invoke()
{
  void v3[5] = *MEMORY[0x1E4F143B8];
  v2[0] = @"HKElevationAscended";
  v3[0] = objc_opt_class();
  v2[1] = @"HKElevationDescended";
  v3[1] = objc_opt_class();
  v2[2] = @"HKAverageSpeed";
  v3[2] = objc_opt_class();
  v2[3] = @"HKMaximumSpeed";
  v3[3] = objc_opt_class();
  void v2[4] = @"HKAlpineSlopeGrade";
  v3[4] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:5];
  uint64_t v1 = (void *)_hk_validateYukonMetadataValueForWorkoutEvent_valueContent_key_error__supportedWorkoutKeyLookupTableYukon;
  _hk_validateYukonMetadataValueForWorkoutEvent_valueContent_key_error__supportedWorkoutKeyLookupTableYukon = v0;
}

void __90__NSDictionary_HKAttachmentMetadata__hk_validateAttachmentMetadataKeysAndValuesWithError___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v13 = a2;
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = objc_msgSend(MEMORY[0x1E4F1C9E8], "hk_acceptedAttachmentMetadataValueClasses");

    if (v8) {
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), *(void *)(a1 + 48), @"Invalid metadata value: %@, for key: %@"", v7, v13);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), *(void *)(a1 + 48), @"Invalid metadata key: %@"", v13, v12);
  uint64_t v9 = };
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  *a4 = 1;
LABEL_6:
}

uint64_t __79__NSDictionary_HKAttachmentMetadata__hk_acceptedAttachmentMetadataValueClasses__block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_msgSend(v0, "setWithObjects:", v1, v2, objc_opt_class(), 0);
  uint64_t v4 = hk_acceptedAttachmentMetadataValueClasses_valueClasses;
  hk_acceptedAttachmentMetadataValueClasses_valueClasses = v3;

  return MEMORY[0x1F41817F8](v3, v4);
}

void __70__NSDictionary_HKAttachmentMetadata__hk_secureAttachmentCodingClasses__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "hk_acceptedAttachmentMetadataValueClasses");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v3 setByAddingObject:objc_opt_class()];
  uint64_t v2 = (void *)hk_secureAttachmentCodingClasses__secureCodingClasses;
  hk_secureAttachmentCodingClasses__secureCodingClasses = v1;
}

@end
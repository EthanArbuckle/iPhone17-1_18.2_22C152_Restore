@interface HKStringCache
+ (id)_buildDefaultDictionary;
+ (id)_initialStrings;
+ (id)sharedCache;
- initInternal;
- (id)cachedStringIfAvailable:(id)a3;
- (id)dictionaryReplacingKeysFromDictionary:(id)a3;
- (void)unittest_resetCache;
- (void)updateCacheWithStrings:(id)a3;
@end

@implementation HKStringCache

+ (id)_initialStrings
{
  v2[173] = *MEMORY[0x1E4F143B8];
  self;
  v2[0] = @"HKUDIDeviceIdentifier";
  v2[1] = @"HKUDIProductionIdentifier";
  v2[2] = @"HKDeviceSerialNumber";
  v2[3] = @"HKBodyTemperatureSensorLocation";
  v2[4] = @"HKHeartRateSensorLocation";
  v2[5] = @"HKFoodType";
  v2[6] = @"HKDigitalSignature";
  v2[7] = @"HKExternalUUID";
  v2[8] = @"HKMetadataKeySyncIdentifier";
  v2[9] = @"HKMetadataKeySyncVersion";
  v2[10] = @"HKTimeZone";
  v2[11] = @"HKDeviceName";
  v2[12] = @"HKDeviceManufacturerName";
  v2[13] = @"HKWasTakenInLab";
  v2[14] = @"HKReferenceRangeLowerLimit";
  v2[15] = @"HKReferenceRangeUpperLimit";
  v2[16] = @"HKWasUserEntered";
  v2[17] = @"HKWorkoutBrandName";
  v2[18] = @"HKGroupFitness";
  v2[19] = @"HKMetadataKeyAppleFitnessPlusCatalogIdentifier";
  v2[20] = @"HKMetadataKeyAppleFitnessPlusSession";
  v2[21] = @"HKIndoorWorkout";
  v2[22] = @"HKCoachedWorkout";
  v2[23] = @"HKSexualActivityProtectionUsed";
  v2[24] = @"HKMenstrualCycleStart";
  v2[25] = @"HKInsulinDeliveryReason";
  v2[26] = @"HKBloodGlucoseMealTime";
  v2[27] = @"HKVO2MaxTestType";
  v2[28] = @"HKHeartRateEventThreshold";
  v2[29] = @"HKVO2MaxValue";
  v2[30] = @"HKLowCardioFitnessEventThreshold";
  v2[31] = @"HKMetadataKeyAppleIrregularRhythmNotificationsAlgorithmVersion";
  v2[32] = @"HKDateOfEarliestDataUsedForEstimate";
  v2[33] = @"HKAlgorithmVersion";
  v2[34] = @"HKActivityType";
  v2[35] = @"HKPhysicalEffortEstimationType";
  v2[36] = @"HKWeatherCondition";
  v2[37] = @"HKWeatherTemperature";
  v2[38] = @"HKWeatherHumidity";
  v2[39] = @"HKLapLength";
  v2[40] = @"HKSwimmingLocationType";
  v2[41] = @"HKSwimmingStrokeStyle";
  v2[42] = @"HKAverageSpeed";
  v2[43] = @"HKMaximumSpeed";
  v2[44] = @"HKAlpineSlopeGrade";
  v2[45] = @"HKElevationAscended";
  v2[46] = @"HKElevationDescended";
  v2[47] = @"HKFitnessMachineDuration";
  v2[48] = @"HKIndoorBikeDistance";
  v2[49] = @"HKCrossTrainerDistance";
  v2[50] = @"HKAverageMETs";
  v2[51] = @"HKSWOLFScore";
  v2[52] = @"HKCyclingCyclingFunctionalThresholdPowerTestType";
  v2[53] = @"HKMetadataKeyGlassesPrescriptionDescription";
  v2[54] = @"HKdr";
  v2[55] = @"HKdt";
  v2[56] = @"HKgt";
  v2[57] = @"HKrg";
  v2[58] = @"HKng";
  v2[59] = @"_HKPrivateWeatherCondition";
  v2[60] = @"_HKPrivateWorkoutWasInDaytime";
  v2[61] = @"_HKPrivateWorkoutLocationSeriesIsSmoothed";
  v2[62] = @"_HKPrivateWorkoutAssociatedUUID";
  v2[63] = @"_HKPrivateWorkoutUnsmoothedCopyAssociatedUUID";
  v2[64] = @"_HKPrivateWorkoutElevationAscendedQuantity";
  v2[65] = @"_HKPrivateWorkoutWeatherLocationCoordinatesLatitude";
  v2[66] = @"_HKPrivateWorkoutWeatherLocationCoordinatesLongitude";
  v2[67] = @"_HKPrivateWorkoutWeatherSourceName";
  v2[68] = @"_HKPrivateWorkoutStrideCount";
  v2[69] = @"_HKPrivateWorkoutStepCount";
  v2[70] = @"_HKPrivateWorkoutAverageSpeed";
  v2[71] = @"_HKPrivateWorkoutAveragePace";
  v2[72] = @"_HKPrivateWorkoutAveragePower";
  v2[73] = @"_HKPrivateWorkoutInstantaneousCadence";
  v2[74] = @"_HKPrivateWorkoutAverageCadence";
  v2[75] = @"_HKPrivateWorkoutInstantaneousPower";
  v2[76] = @"_HKPrivateWorkoutMachineBrand";
  v2[77] = @"_HKPrivateWorkoutMachineType";
  v2[78] = @"_HKPrivateWorkoutActivityMoveMode";
  v2[79] = @"_HKPrivateWorkoutExtendedMode";
  v2[80] = @"_HKPrivateMetadataKeyRaceReferenceRouteWorkoutUUID";
  v2[81] = @"_HKPrivateMetadataKeyRaceStartOnRouteDate";
  v2[82] = @"_HKPrivateMetadataKeyRaceStartOnRouteDistance";
  v2[83] = @"_HKPrivateMetadataKeyRaceStartOnRouteDuration";
  v2[84] = @"_HKPrivateMetadataKeyRaceFinishRouteDate";
  v2[85] = @"_HKPrivateMetadataKeyRaceFinishRouteDistance";
  v2[86] = @"_HKPrivateMetadataKeyRaceFinishRouteDuration";
  v2[87] = @"_HKPrivateDeepBreathingEndReason";
  v2[88] = @"_HKPrivateDeepBreathingFinalHeartRate";
  v2[89] = @"_HKPrivateSleepAlarmUserSetBedtime";
  v2[90] = @"_HKPrivateSleepAlarmUserWakeTime";
  v2[91] = @"_HKPrivateBloodOxygenContext";
  v2[92] = @"HKMetadataKeyUserMotionContext";
  v2[93] = @"HKMetadataKeyHeartRateMotionContext";
  v2[94] = @"_HKPrivateHeartRateContext";
  v2[95] = @"_HKPrivateHeartbeatSequenceContext";
  v2[96] = @"_HKPrivateMetadataKeyHeartbeatLongestSubsequenceStart";
  v2[97] = @"_HKPrivateMetadataKeyHeartbeatLongestSubsequenceDuration";
  v2[98] = @"HKMetadataKeyHeartRateRecoveryTestType";
  v2[99] = @"HKMetadataKeyHeartRateRecoveryActivityType";
  v2[100] = @"HKMetadataKeyHeartRateRecoveryActivityDuration";
  v2[101] = @"HKMetadataKeyHeartRateRecoveryMaxObservedRecoveryHeartRate";
  v2[102] = @"HKMetadataKeySessionEstimate";
  v2[103] = @"_HKPrivateMetadataKeyAppleHeartbeatSeriesAlgorithmVersion";
  v2[104] = @"_HKPrivateMetadataKeyHeartRateEventThreshold";
  v2[105] = @"_HKPrivateMetadataKeyHeartRateEventMinMaxHeartRates";
  v2[106] = @"_HKPrivateMetadataKeyHeartRateDiscordanceThreshold";
  v2[107] = @"_HKPrivateMetadataKeyRegulatedUpdateVersion";
  v2[108] = @"_HKPrivateActivitySummaryIndex";
  v2[109] = @"_HKPrivateExtractionFailureInfo";
  v2[110] = @"_HKPrivateOriginalSignedClinicalDataSyncIdentifier";
  v2[111] = @"_HKPrivateMetadataKeyOriginalFHIRResourceROWID";
  v2[112] = @"_HKPrivateMedicalRecordUUID";
  v2[113] = @"_HKPrivateMetadataKeyClassification";
  v2[114] = @"_HKPrivateMetadataKeyElectrocardiogramSymptoms";
  v2[115] = @"_HKPrivateMetadataKeyElectrocardiogramHeartRate";
  v2[116] = @"HKMetadataKeyAppleECGAlgorithmVersion";
  v2[117] = @"_HKPrivateMetadataKeyBackgroundAtrialFibrillationDetectionVersion";
  v2[118] = @"_HKPrivateWasEnteredFromCycleTracking";
  v2[119] = @"HKMetadataKeyAudioExposureLevel";
  v2[120] = @"HKMetadataKeyAudioExposureDuration";
  v2[121] = @"HKMetadataKeyHeadphoneGain";
  v2[122] = @"_HKPrivateMetadataKeyAudioExposureLimit";
  v2[123] = @"_HKPrivateMediaSourceBundleIdentifier";
  v2[124] = @"_HKPrivateMetadataKeyHeadphoneAudioDataIsTransient";
  v2[125] = @"_HKPrivateMetadataKeyNotificationIncludesPrunableData";
  v2[126] = @"_HKPrivateMetadataKeyRepeatNotification";
  v2[127] = @"HKMetadataKeyDevicePlacementSide";
  v2[128] = @"HKMetadataKeyAppleDeviceCalibrated";
  v2[129] = @"_HKPrivateAutomaticTimeZone";
  v2[130] = @"_HKPrivateFallActionRequested";
  v2[131] = @"_HKPrivateMetadataKeyUserOnBetaBlocker";
  v2[132] = @"_HKPrivateMetadataKeySessionUUID";
  v2[133] = @"_HKPrivateMetadataKeySessionIncomplete";
  v2[134] = @"HKMetadataKeyQuantityClampedToLowerBound";
  v2[135] = @"HKMetadataKeyQuantityClampedToUpperBound";
  v2[136] = @"_HKPrivateCoreMotionSourceIdentifier";
  v2[137] = @"_HKPrivateMetadataKeySkinSurfaceTemperature";
  v2[138] = @"_HKPrivateMetadataKeyInternalLiveOnAlgorithmVersion";
  v2[139] = @"HKMetadataKeyMaximumLightIntensity";
  v2[140] = @"HKMetadataKeyWaterSalinity";
  v2[141] = @"_HKPrivateMetadataKeyVisionACCPayload";
  v2[142] = @"_HKPrivateMetadataKeyVisionDeviceType";
  v2[143] = @"_HKPrivateMetadataKeyVisionColorCode";
  v2[144] = @"_HKPrivateMetadataKeyVisionSerialNumber";
  v2[145] = @"_HKPrivateMetadataMindfulnessSessionType";
  v2[146] = @"_HKPrivateMetadataKeyIsLastScheduledDose";
  v2[147] = @"_HKPrivateMetadataKeyHearingTestTakenWithCongestion";
  v2[148] = @"_HKPrivateMetadataKeyHearingTestTakenWithRecentLoudNoiseExposure";
  v2[149] = @"_HKPrivateMetadataKeyHearingTestTakenFromFirstParty";
  v2[150] = @"_HKPrivateMetadataKeyHearingTestTakenWithLeftEarNoiseLevel";
  v2[151] = @"_HKPrivateMetadataKeyHearingTestTakenWithRightEarNoiseLevel";
  v2[152] = @"_HKPrivateWorkoutSegmentEventSubtype";
  v2[153] = @"_HKPrivateMetadataSplitMeasuringSystem";
  v2[154] = @"_HKPrivateMetadataSplitDistanceQuantity";
  v2[155] = @"_HKPrivateMetadataSplitActiveDurationQuantity";
  v2[156] = @"_HKPrivateMetadataIsPartialSplit";
  v2[157] = @"_HKPrivateMetadataTotalDistanceQuantity";
  v2[158] = @"_HKPrivateWorkoutSegmentDistance";
  v2[159] = @"_HKPrivateWorkoutSegmentDuration";
  v2[160] = @"_HKPrivateWorkoutMarkerEventSubtype";
  v2[161] = @"_HKPrivateWorkoutSegmentActiveEnergyBurn";
  v2[162] = @"_HKPrivateWorkoutSegmentIndex";
  v2[163] = @"_HKPrivateWorkoutAverageHeartRate";
  v2[164] = @"_HKPrivateWorkoutMaxHeartRate";
  v2[165] = @"_HKPrivateWorkoutMinHeartRate";
  v2[166] = @"_HKPrivateMetadataSplitAveragePowerQuantity";
  v2[167] = @"_HKPrivateWorkoutMaxGroundElevation";
  v2[168] = @"_HKPrivateWorkoutMinGroundElevation";
  v2[169] = @"_HKPrivateWorkoutConfiguration";
  v2[170] = @"_HKPrivateWorkoutHeartRateZonesConfigurationType";
  v2[171] = @"_HKPrivateWorkoutHeartRateZones";
  v2[172] = @"_HKPrivateWorkoutElapsedTimeInHeartRateZones";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:173];

  return v0;
}

+ (id)_buildDefaultDictionary
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  self;
  v0 = +[HKStringCache _initialStrings]();
  v1 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v0, "count"));
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = v0;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(v1, "setObject:forKeyedSubscript:", *(void *)(*((void *)&v9 + 1) + 8 * i), *(void *)(*((void *)&v9 + 1) + 8 * i), (void)v9);
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v1];

  return v7;
}

- initInternal
{
  _DWORD *v1;
  _DWORD *v2;
  uint64_t v3;
  void *v4;
  objc_super v6;

  if (!a1) {
    return 0;
  }
  v6.receiver = a1;
  v6.super_class = (Class)HKStringCache;
  v1 = objc_msgSendSuper2(&v6, sel_init);
  id v2 = v1;
  if (v1)
  {
    v1[2] = 0;
    uint64_t v3 = +[HKStringCache _buildDefaultDictionary]();
    uint64_t v4 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v3;
  }
  return v2;
}

+ (id)sharedCache
{
  if (sharedCache_onceToken != -1) {
    dispatch_once(&sharedCache_onceToken, &__block_literal_global_78);
  }
  id v2 = (void *)sharedCache_cache;

  return v2;
}

uint64_t __28__HKStringCache_sharedCache__block_invoke()
{
  sharedCache_cache = (uint64_t)-[HKStringCache initInternal]([HKStringCache alloc]);

  return MEMORY[0x1F41817F8]();
}

- (id)cachedStringIfAvailable:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[_HKBehavior sharedBehavior];
  v6 = [v5 features];
  char v7 = [v6 stringCache];

  if (v7)
  {
    uint64_t v8 = [(NSDictionary *)self->_cacheDictionary objectForKeyedSubscript:v4];
    long long v9 = (void *)v8;
    if (v8) {
      long long v10 = (void *)v8;
    }
    else {
      long long v10 = v4;
    }
    id v11 = v10;
  }
  else
  {
    id v11 = v4;
  }

  return v11;
}

- (id)dictionaryReplacingKeysFromDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[_HKBehavior sharedBehavior];
  v6 = [v5 features];
  char v7 = [v6 stringCache];

  if (v7)
  {
    uint64_t v8 = self->_cacheDictionary;
    long long v9 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __55__HKStringCache_dictionaryReplacingKeysFromDictionary___block_invoke;
    v15[3] = &unk_1E58C4EA0;
    v16 = v8;
    id v10 = v9;
    id v17 = v10;
    id v11 = v8;
    [v4 enumerateKeysAndObjectsUsingBlock:v15];
    long long v12 = v17;
    id v13 = v10;
  }
  else
  {
    id v13 = v4;
  }

  return v13;
}

void __55__HKStringCache_dictionaryReplacingKeysFromDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v10 = a2;
  char v7 = [v5 objectForKeyedSubscript:v10];
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = v10;
  }
  id v9 = v8;

  [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:v9];
}

- (void)updateCacheWithStrings:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:self->_cacheDictionary];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(v5, "setObject:forKeyedSubscript:", *(void *)(*((void *)&v13 + 1) + 8 * v10), *(void *)(*((void *)&v13 + 1) + 8 * v10), (void)v13);
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v5];
  cacheDictionary = self->_cacheDictionary;
  self->_cacheDictionary = v11;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)unittest_resetCache
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  +[HKStringCache _buildDefaultDictionary]();
  id v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  cacheDictionary = self->_cacheDictionary;
  self->_cacheDictionary = v4;

  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
}

@end
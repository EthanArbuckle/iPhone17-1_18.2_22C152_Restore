@interface HMDLogEventUserActivityAnalyzer
+ (id)logCategory;
+ (id)managedEventCounterRequestGroups;
- (BOOL)_isTriggerSource:(unint64_t)a3;
- (BOOL)_isUserSource:(unint64_t)a3;
- (HMDEventCounterGroup)counterGroup;
- (HMDLogEventUserActivityAnalyzer)initWithEventCountersManager:(id)a3 flagsManager:(id)a4 dateProvider:(id)a5;
- (HMDTimeBasedFlagsManager)flagsManager;
- (void)_handleAccessoryPairingLogEvent:(id)a3;
- (void)_handleActionSetRunLogEvent:(id)a3;
- (void)_handleAddActionSetLogEvent:(id)a3;
- (void)_handleAddTriggerLogEvent:(id)a3;
- (void)_handleCameraClipRequestLogEvent:(id)a3;
- (void)_handleCameraStreamLogEvent:(id)a3;
- (void)_handleReadWriteLogEvent:(id)a3;
- (void)coalesceLogEvent:(id)a3 fromSourceEvent:(id)a4;
- (void)contributeLogEvent:(id)a3 toCoreAnalyticsEvent:(id)a4;
- (void)contributeLogEvent:(id)a3 toSerializedMetric:(id)a4;
- (void)deserializeLogEvent:(id)a3 fromSerializedMetric:(id)a4;
- (void)didReceiveEventFromDispatcher:(id)a3;
- (void)finishCoalescingLogEvent:(id)a3;
- (void)markActiveForEventName:(id)a3 logEvent:(id)a4;
- (void)populateAggregationAnalysisLogEvent:(id)a3 forDate:(id)a4;
- (void)populateLogEvent:(id)a3 forHomeWithUUID:(id)a4 associatedToDate:(id)a5;
- (void)resetAggregationAnalysisContext;
- (void)updateLinkTypeActivityCountsForReadWriteLogEvent:(id)a3;
@end

@implementation HMDLogEventUserActivityAnalyzer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_counterGroup, 0);
  objc_storeStrong((id *)&self->_flagsManager, 0);
}

- (HMDEventCounterGroup)counterGroup
{
  return self->_counterGroup;
}

- (HMDTimeBasedFlagsManager)flagsManager
{
  return self->_flagsManager;
}

- (void)finishCoalescingLogEvent:(id)a3
{
  id v7 = a3;
  int8x8_t v3 = (int8x8_t)[v7 activeDaysBitField];
  [v7 setActiveDay:v3.i8[0] & 1];
  if (v3) {
    uint64_t v4 = (uint64_t)log2((double)(unint64_t)(*(void *)&v3 & -*(void *)&v3));
  }
  else {
    uint64_t v4 = -1;
  }
  [v7 setCountOfDaysSinceLastActive:v4];
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(v3);
  v5.i16[0] = vaddlv_u8(v5);
  if (v3) {
    uint64_t v6 = v5.u32[0];
  }
  else {
    uint64_t v6 = 0;
  }
  [v7 setActiveDaysPerMonthCount:v6];
}

- (void)coalesceLogEvent:(id)a3 fromSourceEvent:(id)a4
{
  id v5 = a4;
  id v7 = a3;
  objc_msgSend(v7, "setNumReadSiri:", objc_msgSend(v7, "numReadSiri") + objc_msgSend(v5, "numReadSiri"));
  objc_msgSend(v7, "setNumWriteSiri:", objc_msgSend(v7, "numWriteSiri") + objc_msgSend(v5, "numWriteSiri"));
  objc_msgSend(v7, "setNumReadFirstPartyApp:", objc_msgSend(v7, "numReadFirstPartyApp") + objc_msgSend(v5, "numReadFirstPartyApp"));
  objc_msgSend(v7, "setNumWriteFirstPartyApp:", objc_msgSend(v7, "numWriteFirstPartyApp") + objc_msgSend(v5, "numWriteFirstPartyApp"));
  objc_msgSend(v7, "setNumReadThirdPartyApp:", objc_msgSend(v7, "numReadThirdPartyApp") + objc_msgSend(v5, "numReadThirdPartyApp"));
  objc_msgSend(v7, "setNumWriteThirdPartyApp:", objc_msgSend(v7, "numWriteThirdPartyApp") + objc_msgSend(v5, "numWriteThirdPartyApp"));
  objc_msgSend(v7, "setNumAccessoriesAdded:", objc_msgSend(v7, "numAccessoriesAdded") + objc_msgSend(v5, "numAccessoriesAdded"));
  objc_msgSend(v7, "setNumScenesAdded:", objc_msgSend(v7, "numScenesAdded") + objc_msgSend(v5, "numScenesAdded"));
  objc_msgSend(v7, "setNumTriggersAdded:", objc_msgSend(v7, "numTriggersAdded") + objc_msgSend(v5, "numTriggersAdded"));
  objc_msgSend(v7, "setNumShortcutsAdded:", objc_msgSend(v7, "numShortcutsAdded") + objc_msgSend(v5, "numShortcutsAdded"));
  objc_msgSend(v7, "setNumScenesUserRun:", objc_msgSend(v7, "numScenesUserRun") + objc_msgSend(v5, "numScenesUserRun"));
  objc_msgSend(v7, "setNumShortcutsRun:", objc_msgSend(v7, "numShortcutsRun") + objc_msgSend(v5, "numShortcutsRun"));
  objc_msgSend(v7, "setNumTriggersFired:", objc_msgSend(v7, "numTriggersFired") + objc_msgSend(v5, "numTriggersFired"));
  objc_msgSend(v7, "setCameraStreamStartSuccessCount:", objc_msgSend(v7, "cameraStreamStartSuccessCount") + objc_msgSend(v5, "cameraStreamStartSuccessCount"));
  objc_msgSend(v7, "setCameraStreamStartFailureCount:", objc_msgSend(v7, "cameraStreamStartFailureCount") + objc_msgSend(v5, "cameraStreamStartFailureCount"));
  objc_msgSend(v7, "setFetchCameraClipVideoSegmentAssetCount:", objc_msgSend(v7, "fetchCameraClipVideoSegmentAssetCount")+ objc_msgSend(v5, "fetchCameraClipVideoSegmentAssetCount"));
  uint64_t v6 = [v5 activeDaysBitField];

  objc_msgSend(v7, "setActiveDaysBitField:", objc_msgSend(v7, "activeDaysBitField") | v6);
}

- (void)contributeLogEvent:(id)a3 toCoreAnalyticsEvent:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[HMDLogEventHistograms lowVolumeHistogram];
  v8 = objc_msgSend(v7, "intervalIndexForValue:", objc_msgSend(v6, "numReadSiri"));
  [v5 setObject:v8 forKeyedSubscript:@"siriReadCount"];

  v9 = +[HMDLogEventHistograms lowVolumeHistogram];
  v10 = objc_msgSend(v9, "intervalIndexForValue:", objc_msgSend(v6, "numWriteSiri"));
  [v5 setObject:v10 forKeyedSubscript:@"siriWriteCount"];

  v11 = +[HMDLogEventHistograms highVolumeHistogram];
  v12 = objc_msgSend(v11, "intervalIndexForValue:", objc_msgSend(v6, "numReadFirstPartyApp"));
  [v5 setObject:v12 forKeyedSubscript:@"firstPartyReadCount"];

  v13 = +[HMDLogEventHistograms highVolumeHistogram];
  v14 = objc_msgSend(v13, "intervalIndexForValue:", objc_msgSend(v6, "numWriteFirstPartyApp"));
  [v5 setObject:v14 forKeyedSubscript:@"firstPartyWriteCount"];

  v15 = +[HMDLogEventHistograms highVolumeHistogram];
  v16 = objc_msgSend(v15, "intervalIndexForValue:", objc_msgSend(v6, "numReadThirdPartyApp"));
  [v5 setObject:v16 forKeyedSubscript:@"thirdPartyReadCount"];

  v17 = +[HMDLogEventHistograms highVolumeHistogram];
  v18 = objc_msgSend(v17, "intervalIndexForValue:", objc_msgSend(v6, "numWriteThirdPartyApp"));
  [v5 setObject:v18 forKeyedSubscript:@"thirdPartyWriteCount"];

  v19 = +[HMDLogEventHistograms lowVolumeHistogram];
  v20 = objc_msgSend(v19, "intervalIndexForValue:", objc_msgSend(v6, "numAccessoriesAdded"));
  [v5 setObject:v20 forKeyedSubscript:@"accessoriesAddedCount"];

  v21 = +[HMDLogEventHistograms lowVolumeHistogram];
  v22 = objc_msgSend(v21, "intervalIndexForValue:", objc_msgSend(v6, "numScenesAdded"));
  [v5 setObject:v22 forKeyedSubscript:@"scenesAddedCount"];

  v23 = +[HMDLogEventHistograms lowVolumeHistogram];
  v24 = objc_msgSend(v23, "intervalIndexForValue:", objc_msgSend(v6, "numTriggersAdded"));
  [v5 setObject:v24 forKeyedSubscript:@"triggersAddedCount"];

  v25 = +[HMDLogEventHistograms lowVolumeHistogram];
  v26 = objc_msgSend(v25, "intervalIndexForValue:", objc_msgSend(v6, "numShortcutsAdded"));
  [v5 setObject:v26 forKeyedSubscript:@"shortcutsAddedCount"];

  v27 = +[HMDLogEventHistograms lowVolumeHistogram];
  v28 = objc_msgSend(v27, "intervalIndexForValue:", objc_msgSend(v6, "numScenesUserRun"));
  [v5 setObject:v28 forKeyedSubscript:@"scenesRunCount"];

  v29 = +[HMDLogEventHistograms lowVolumeHistogram];
  v30 = objc_msgSend(v29, "intervalIndexForValue:", objc_msgSend(v6, "numTriggersFired"));
  [v5 setObject:v30 forKeyedSubscript:@"triggersRunCount"];

  v31 = +[HMDLogEventHistograms lowVolumeHistogram];
  v32 = objc_msgSend(v31, "intervalIndexForValue:", objc_msgSend(v6, "numShortcutsRun"));
  [v5 setObject:v32 forKeyedSubscript:@"shortcutsRunCount"];

  v33 = +[HMDLogEventHistograms lowVolumeHistogram];
  v34 = objc_msgSend(v33, "intervalIndexForValue:", objc_msgSend(v6, "cameraStreamStartSuccessCount"));
  [v5 setObject:v34 forKeyedSubscript:@"cameraStreamStartSuccessCount"];

  v35 = +[HMDLogEventHistograms lowVolumeHistogram];
  v36 = objc_msgSend(v35, "intervalIndexForValue:", objc_msgSend(v6, "cameraStreamStartFailureCount"));
  [v5 setObject:v36 forKeyedSubscript:@"cameraStreamStartFailureCount"];

  v37 = +[HMDLogEventHistograms lowVolumeHistogram];
  v38 = objc_msgSend(v37, "intervalIndexForValue:", objc_msgSend(v6, "fetchCameraClipVideoSegmentAssetCount"));
  [v5 setObject:v38 forKeyedSubscript:@"fetchVideoSegmentsAssetCount"];

  v39 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "isActiveDay"));
  [v5 setObject:v39 forKeyedSubscript:@"activeDay"];

  v40 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "countOfDaysSinceLastActive"));
  [v5 setObject:v40 forKeyedSubscript:@"daysSinceLastActiveCount"];

  v41 = NSNumber;
  uint64_t v42 = [v6 activeDaysPerMonthCount];

  id v43 = [v41 numberWithInteger:v42];
  [v5 setObject:v43 forKeyedSubscript:@"activeDaysPerMonthCount"];
}

- (void)deserializeLogEvent:(id)a3 fromSerializedMetric:(id)a4
{
  id v6 = a4;
  id v75 = a3;
  id v7 = [v6 objectForKeyedSubscript:@"siriReadCount"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v8 = v7;
  }
  else {
    v8 = 0;
  }
  id v9 = v8;

  uint64_t v10 = [v9 unsignedIntegerValue];
  [v75 setNumReadSiri:v10];
  v11 = [v6 objectForKeyedSubscript:@"siriWriteCount"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  id v13 = v12;

  uint64_t v14 = [v13 unsignedIntegerValue];
  [v75 setNumWriteSiri:v14];
  v15 = [v6 objectForKeyedSubscript:@"firstPartyReadCount"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v16 = v15;
  }
  else {
    v16 = 0;
  }
  id v17 = v16;

  uint64_t v18 = [v17 unsignedIntegerValue];
  [v75 setNumReadFirstPartyApp:v18];
  v19 = [v6 objectForKeyedSubscript:@"firstPartyWriteCount"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v20 = v19;
  }
  else {
    v20 = 0;
  }
  id v21 = v20;

  uint64_t v22 = [v21 unsignedIntegerValue];
  [v75 setNumWriteFirstPartyApp:v22];
  v23 = [v6 objectForKeyedSubscript:@"thirdPartyReadCount"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v24 = v23;
  }
  else {
    v24 = 0;
  }
  id v25 = v24;

  uint64_t v26 = [v25 unsignedIntegerValue];
  [v75 setNumReadThirdPartyApp:v26];
  v27 = [v6 objectForKeyedSubscript:@"thirdPartyWriteCount"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v28 = v27;
  }
  else {
    v28 = 0;
  }
  id v29 = v28;

  uint64_t v30 = [v29 unsignedIntegerValue];
  [v75 setNumWriteThirdPartyApp:v30];
  v31 = [v6 objectForKeyedSubscript:@"accessoriesAddedCount"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v32 = v31;
  }
  else {
    v32 = 0;
  }
  id v33 = v32;

  uint64_t v34 = [v33 unsignedIntegerValue];
  [v75 setNumAccessoriesAdded:v34];
  v35 = [v6 objectForKeyedSubscript:@"scenesAddedCount"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v36 = v35;
  }
  else {
    v36 = 0;
  }
  id v37 = v36;

  uint64_t v38 = [v37 unsignedIntegerValue];
  [v75 setNumScenesAdded:v38];
  v39 = [v6 objectForKeyedSubscript:@"triggersAddedCount"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v40 = v39;
  }
  else {
    v40 = 0;
  }
  id v41 = v40;

  uint64_t v42 = [v41 unsignedIntegerValue];
  [v75 setNumTriggersAdded:v42];
  id v43 = [v6 objectForKeyedSubscript:@"shortcutsAddedCount"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v44 = v43;
  }
  else {
    v44 = 0;
  }
  id v45 = v44;

  uint64_t v46 = [v45 unsignedIntegerValue];
  [v75 setNumShortcutsAdded:v46];
  v47 = [v6 objectForKeyedSubscript:@"scenesRunCount"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v48 = v47;
  }
  else {
    v48 = 0;
  }
  id v49 = v48;

  uint64_t v50 = [v49 unsignedIntegerValue];
  [v75 setNumScenesUserRun:v50];
  v51 = [v6 objectForKeyedSubscript:@"shortcutsRunCount"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v52 = v51;
  }
  else {
    v52 = 0;
  }
  id v53 = v52;

  uint64_t v54 = [v53 unsignedIntegerValue];
  [v75 setNumShortcutsRun:v54];
  v55 = [v6 objectForKeyedSubscript:@"triggersRunCount"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v56 = v55;
  }
  else {
    v56 = 0;
  }
  id v57 = v56;

  uint64_t v58 = [v57 unsignedIntegerValue];
  [v75 setNumTriggersFired:v58];
  v59 = [v6 objectForKeyedSubscript:@"cameraStreamStartSuccessCount"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v60 = v59;
  }
  else {
    v60 = 0;
  }
  id v61 = v60;

  uint64_t v62 = [v61 unsignedIntegerValue];
  [v75 setCameraStreamStartSuccessCount:v62];
  v63 = [v6 objectForKeyedSubscript:@"cameraStreamStartFailureCount"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v64 = v63;
  }
  else {
    v64 = 0;
  }
  id v65 = v64;

  uint64_t v66 = [v65 unsignedIntegerValue];
  [v75 setCameraStreamStartFailureCount:v66];
  v67 = [v6 objectForKeyedSubscript:@"fetchVideoSegmentsAssetCount"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v68 = v67;
  }
  else {
    v68 = 0;
  }
  id v69 = v68;

  uint64_t v70 = [v69 unsignedIntegerValue];
  [v75 setFetchCameraClipVideoSegmentAssetCount:v70];
  v71 = [v6 objectForKeyedSubscript:@"activeDay"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v72 = v71;
  }
  else {
    v72 = 0;
  }
  id v73 = v72;

  uint64_t v74 = [v73 unsignedLongLongValue];
  [v75 setActiveDaysBitField:v74];
  [(HMDLogEventUserActivityAnalyzer *)self finishCoalescingLogEvent:v75];
}

- (void)contributeLogEvent:(id)a3 toSerializedMetric:(id)a4
{
  id v5 = NSNumber;
  id v6 = a4;
  id v7 = a3;
  v8 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v7, "numReadSiri"));
  [v6 setObject:v8 forKeyedSubscript:@"siriReadCount"];

  id v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "numWriteSiri"));
  [v6 setObject:v9 forKeyedSubscript:@"siriWriteCount"];

  uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "numReadFirstPartyApp"));
  [v6 setObject:v10 forKeyedSubscript:@"firstPartyReadCount"];

  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "numWriteFirstPartyApp"));
  [v6 setObject:v11 forKeyedSubscript:@"firstPartyWriteCount"];

  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "numReadThirdPartyApp"));
  [v6 setObject:v12 forKeyedSubscript:@"thirdPartyReadCount"];

  id v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "numWriteThirdPartyApp"));
  [v6 setObject:v13 forKeyedSubscript:@"thirdPartyWriteCount"];

  uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "numAccessoriesAdded"));
  [v6 setObject:v14 forKeyedSubscript:@"accessoriesAddedCount"];

  v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "numScenesAdded"));
  [v6 setObject:v15 forKeyedSubscript:@"scenesAddedCount"];

  v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "numTriggersAdded"));
  [v6 setObject:v16 forKeyedSubscript:@"triggersAddedCount"];

  id v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "numShortcutsAdded"));
  [v6 setObject:v17 forKeyedSubscript:@"shortcutsAddedCount"];

  uint64_t v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "numScenesUserRun"));
  [v6 setObject:v18 forKeyedSubscript:@"scenesRunCount"];

  v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "numShortcutsRun"));
  [v6 setObject:v19 forKeyedSubscript:@"shortcutsRunCount"];

  v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "numTriggersFired"));
  [v6 setObject:v20 forKeyedSubscript:@"triggersRunCount"];

  id v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "cameraStreamStartSuccessCount"));
  [v6 setObject:v21 forKeyedSubscript:@"cameraStreamStartSuccessCount"];

  uint64_t v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "cameraStreamStartFailureCount"));
  [v6 setObject:v22 forKeyedSubscript:@"cameraStreamStartFailureCount"];

  v23 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "fetchCameraClipVideoSegmentAssetCount"));
  [v6 setObject:v23 forKeyedSubscript:@"fetchVideoSegmentsAssetCount"];

  v24 = NSNumber;
  uint64_t v25 = [v7 activeDaysBitField];

  id v26 = [v24 numberWithUnsignedLongLong:v25];
  [v6 setObject:v26 forKeyedSubscript:@"activeDay"];
}

- (void)populateLogEvent:(id)a3 forHomeWithUUID:(id)a4 associatedToDate:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v14 = [(HMDHouseholdActivityLogEventContributor *)self householdGroupForHomeWithUUID:v9 associatedWithDate:v8];
  objc_msgSend(v10, "setNumReadSiri:", objc_msgSend(v14, "fetchEventCounterForEventName:", @"HMDLogEventUserActivityAnalyzerSiriReadEventCounter"));
  objc_msgSend(v10, "setNumWriteSiri:", objc_msgSend(v14, "fetchEventCounterForEventName:", @"HMDLogEventUserActivityAnalyzerSiriWriteEventCounter"));
  objc_msgSend(v10, "setNumReadFirstPartyApp:", objc_msgSend(v14, "fetchEventCounterForEventName:", @"HMDLogEventUserActivityAnalyzerFirstPartyReadEventCounter"));
  objc_msgSend(v10, "setNumWriteFirstPartyApp:", objc_msgSend(v14, "fetchEventCounterForEventName:", @"HMDLogEventUserActivityAnalyzerFirstPartyWriteEventCounter"));
  objc_msgSend(v10, "setNumReadThirdPartyApp:", objc_msgSend(v14, "fetchEventCounterForEventName:", @"HMDLogEventUserActivityAnalyzerThirdPartyReadEventCounter"));
  objc_msgSend(v10, "setNumWriteThirdPartyApp:", objc_msgSend(v14, "fetchEventCounterForEventName:", @"HMDLogEventUserActivityAnalyzerThirdPartyWriteEventCounter"));
  objc_msgSend(v10, "setNumAccessoriesAdded:", objc_msgSend(v14, "fetchEventCounterForEventName:", @"HMDLogEventUserActivityAnalyzerAddAccessoryEventCounter"));
  objc_msgSend(v10, "setNumScenesAdded:", objc_msgSend(v14, "fetchEventCounterForEventName:", @"HMDLogEventUserActivityAnalyzerAddSceneEventCounter"));
  objc_msgSend(v10, "setNumTriggersAdded:", objc_msgSend(v14, "fetchEventCounterForEventName:", @"HMDLogEventUserActivityAnalyzerAddTriggerEventCounter"));
  objc_msgSend(v10, "setNumShortcutsAdded:", objc_msgSend(v14, "fetchEventCounterForEventName:", @"HMDLogEventUserActivityAnalyzerAddShortcutEventCounter"));
  objc_msgSend(v10, "setNumScenesUserRun:", objc_msgSend(v14, "fetchEventCounterForEventName:", @"HMDLogEventUserActivityAnalyzerRunSceneEventCounter"));
  objc_msgSend(v10, "setNumShortcutsRun:", objc_msgSend(v14, "fetchEventCounterForEventName:", @"HMDLogEventUserActivityAnalyzerRunShortcutEventCounter"));
  objc_msgSend(v10, "setNumTriggersFired:", objc_msgSend(v14, "fetchEventCounterForEventName:", @"HMDLogEventUserActivityAnalyzerTriggerFiredEventCounter"));
  objc_msgSend(v10, "setCameraStreamStartSuccessCount:", objc_msgSend(v14, "fetchEventCounterForEventName:", @"HMDLogEventUserActivityAnalyzerCameraStreamStartSuccessEventCounter"));
  objc_msgSend(v10, "setCameraStreamStartFailureCount:", objc_msgSend(v14, "fetchEventCounterForEventName:", @"HMDLogEventUserActivityAnalyzerCameraStreamStartFailureEventCounter"));
  objc_msgSend(v10, "setFetchCameraClipVideoSegmentAssetCount:", objc_msgSend(v14, "fetchEventCounterForEventName:", @"HMDLogEventUserActivityAnalyzerFetchCameraClipVideoSegmentsAssetEventCounter"));
  v11 = [(HMDLogEventUserActivityAnalyzer *)self flagsManager];
  v12 = [v11 flagForName:@"HMDLogEventUserActivityAnalyzerIsActiveFlag" homeUUID:v9 periodicity:1];

  uint64_t v13 = [v12 bitsForDate:v8 bitCount:30 outValidBitCount:0];
  [v10 setActiveDaysBitField:v13];
  [(HMDLogEventUserActivityAnalyzer *)self finishCoalescingLogEvent:v10];
}

- (void)resetAggregationAnalysisContext
{
  id v2 = [(HMDLogEventUserActivityAnalyzer *)self counterGroup];
  [v2 resetEventCounters];
}

- (void)populateAggregationAnalysisLogEvent:(id)a3 forDate:(id)a4
{
  id v45 = a3;
  id v6 = a4;
  id v7 = [(HMDLogEventUserActivityAnalyzer *)self counterGroup];
  objc_msgSend(v45, "setNumReadSiri:", objc_msgSend(v7, "fetchEventCounterForEventName:forDate:", @"HMDLogEventUserActivityAnalyzerSiriReadEventCounter", v6));

  id v8 = [(HMDLogEventUserActivityAnalyzer *)self counterGroup];
  objc_msgSend(v45, "setNumWriteSiri:", objc_msgSend(v8, "fetchEventCounterForEventName:forDate:", @"HMDLogEventUserActivityAnalyzerSiriWriteEventCounter", v6));

  id v9 = [(HMDLogEventUserActivityAnalyzer *)self counterGroup];
  objc_msgSend(v45, "setNumReadFirstPartyApp:", objc_msgSend(v9, "fetchEventCounterForEventName:forDate:", @"HMDLogEventUserActivityAnalyzerFirstPartyReadEventCounter", v6));

  id v10 = [(HMDLogEventUserActivityAnalyzer *)self counterGroup];
  objc_msgSend(v45, "setNumWriteFirstPartyApp:", objc_msgSend(v10, "fetchEventCounterForEventName:forDate:", @"HMDLogEventUserActivityAnalyzerFirstPartyWriteEventCounter", v6));

  v11 = [(HMDLogEventUserActivityAnalyzer *)self counterGroup];
  objc_msgSend(v45, "setNumReadThirdPartyApp:", objc_msgSend(v11, "fetchEventCounterForEventName:forDate:", @"HMDLogEventUserActivityAnalyzerThirdPartyReadEventCounter", v6));

  v12 = [(HMDLogEventUserActivityAnalyzer *)self counterGroup];
  objc_msgSend(v45, "setNumWriteThirdPartyApp:", objc_msgSend(v12, "fetchEventCounterForEventName:forDate:", @"HMDLogEventUserActivityAnalyzerThirdPartyWriteEventCounter", v6));

  uint64_t v13 = [(HMDLogEventUserActivityAnalyzer *)self counterGroup];
  objc_msgSend(v45, "setNumReadInternalRequested:", objc_msgSend(v13, "fetchEventCounterForEventName:forDate:", @"HMDLogEventUserActivityAnalyzerInternalRequestedReadEventCounter", v6));

  id v14 = [(HMDLogEventUserActivityAnalyzer *)self counterGroup];
  objc_msgSend(v45, "setNumWriteInternalRequested:", objc_msgSend(v14, "fetchEventCounterForEventName:forDate:", @"HMDLogEventUserActivityAnalyzerInternalRequestedWriteEventCounter", v6));

  v15 = [(HMDLogEventUserActivityAnalyzer *)self counterGroup];
  objc_msgSend(v45, "setNumReadUnknownSource:", objc_msgSend(v15, "fetchEventCounterForEventName:forDate:", @"HMDLogEventUserActivityAnalyzerUnknownSourceReadEventCounter", v6));

  v16 = [(HMDLogEventUserActivityAnalyzer *)self counterGroup];
  objc_msgSend(v45, "setNumWriteUnknownSource:", objc_msgSend(v16, "fetchEventCounterForEventName:forDate:", @"HMDLogEventUserActivityAnalyzerUnknownSourceWriteEventCounter", v6));

  id v17 = [(HMDLogEventUserActivityAnalyzer *)self counterGroup];
  objc_msgSend(v45, "setNumReadWriteSuccessIP:", objc_msgSend(v17, "fetchEventCounterForEventName:forDate:", @"HMDLogEventUserActivityAnalyzerReadWriteIPSuccessEventCounter", v6));

  uint64_t v18 = [(HMDLogEventUserActivityAnalyzer *)self counterGroup];
  objc_msgSend(v45, "setNumReadWriteFailureIP:", objc_msgSend(v18, "fetchEventCounterForEventName:forDate:", @"HMDLogEventUserActivityAnalyzerReadWriteIPFailureEventCounter", v6));

  if ([v45 numReadWriteSuccessIP] || objc_msgSend(v45, "numReadWriteFailureIP"))
  {
    v19 = [(HMDLogEventUserActivityAnalyzer *)self counterGroup];
    unint64_t v20 = [v19 fetchEventCounterForEventName:@"HMDLogEventUserActivityAnalyzerIPDurationAggregate" forDate:v6];

    objc_msgSend(v45, "setAverageLatencyIP:", v20 / (objc_msgSend(v45, "numReadWriteFailureIP") + objc_msgSend(v45, "numReadWriteSuccessIP")));
  }
  id v21 = [(HMDLogEventUserActivityAnalyzer *)self counterGroup];
  objc_msgSend(v45, "setNumReadWriteSuccessBT:", objc_msgSend(v21, "fetchEventCounterForEventName:forDate:", @"HMDLogEventUserActivityAnalyzerReadWriteBTSuccessEventCounter", v6));

  uint64_t v22 = [(HMDLogEventUserActivityAnalyzer *)self counterGroup];
  objc_msgSend(v45, "setNumReadWriteFailureBT:", objc_msgSend(v22, "fetchEventCounterForEventName:forDate:", @"HMDLogEventUserActivityAnalyzerReadWriteBTFailureEventCounter", v6));

  if ([v45 numReadWriteSuccessBT] || objc_msgSend(v45, "numReadWriteFailureBT"))
  {
    v23 = [(HMDLogEventUserActivityAnalyzer *)self counterGroup];
    unint64_t v24 = [v23 fetchEventCounterForEventName:@"HMDLogEventUserActivityAnalyzerBTDurationAggregate" forDate:v6];

    objc_msgSend(v45, "setAverageLatencyBT:", v24 / (objc_msgSend(v45, "numReadWriteFailureBT") + objc_msgSend(v45, "numReadWriteSuccessBT")));
  }
  uint64_t v25 = [(HMDLogEventUserActivityAnalyzer *)self counterGroup];
  objc_msgSend(v45, "setNumReadWriteSuccessIDS:", objc_msgSend(v25, "fetchEventCounterForEventName:forDate:", @"HMDLogEventUserActivityAnalyzerReadWriteIDSSuccessEventCounter", v6));

  id v26 = [(HMDLogEventUserActivityAnalyzer *)self counterGroup];
  objc_msgSend(v45, "setNumReadWriteFailureIDS:", objc_msgSend(v26, "fetchEventCounterForEventName:forDate:", @"HMDLogEventUserActivityAnalyzerReadWriteIDSFailureEventCounter", v6));

  if ([v45 numReadWriteSuccessIDS] || objc_msgSend(v45, "numReadWriteFailureIDS"))
  {
    v27 = [(HMDLogEventUserActivityAnalyzer *)self counterGroup];
    unint64_t v28 = [v27 fetchEventCounterForEventName:@"HMDLogEventUserActivityAnalyzerIDSDurationAggregate" forDate:v6];

    objc_msgSend(v45, "setAverageLatencyIDS:", v28 / (objc_msgSend(v45, "numReadWriteFailureIDS") + objc_msgSend(v45, "numReadWriteSuccessIDS")));
  }
  id v29 = [(HMDLogEventUserActivityAnalyzer *)self counterGroup];
  objc_msgSend(v45, "setNumAccessoriesAdded:", objc_msgSend(v29, "fetchEventCounterForEventName:forDate:", @"HMDLogEventUserActivityAnalyzerAddAccessoryEventCounter", v6));

  uint64_t v30 = [(HMDLogEventUserActivityAnalyzer *)self counterGroup];
  objc_msgSend(v45, "setNumScenesAdded:", objc_msgSend(v30, "fetchEventCounterForEventName:forDate:", @"HMDLogEventUserActivityAnalyzerAddSceneEventCounter", v6));

  v31 = [(HMDLogEventUserActivityAnalyzer *)self counterGroup];
  objc_msgSend(v45, "setNumTriggersAdded:", objc_msgSend(v31, "fetchEventCounterForEventName:forDate:", @"HMDLogEventUserActivityAnalyzerAddTriggerEventCounter", v6));

  v32 = [(HMDLogEventUserActivityAnalyzer *)self counterGroup];
  objc_msgSend(v45, "setNumShortcutsAdded:", objc_msgSend(v32, "fetchEventCounterForEventName:forDate:", @"HMDLogEventUserActivityAnalyzerAddShortcutEventCounter", v6));

  id v33 = [(HMDLogEventUserActivityAnalyzer *)self counterGroup];
  objc_msgSend(v45, "setNumScenesUserRun:", objc_msgSend(v33, "fetchEventCounterForEventName:forDate:", @"HMDLogEventUserActivityAnalyzerRunSceneEventCounter", v6));

  uint64_t v34 = [(HMDLogEventUserActivityAnalyzer *)self counterGroup];
  objc_msgSend(v45, "setNumShortcutsRun:", objc_msgSend(v34, "fetchEventCounterForEventName:forDate:", @"HMDLogEventUserActivityAnalyzerRunShortcutEventCounter", v6));

  v35 = [(HMDLogEventUserActivityAnalyzer *)self counterGroup];
  objc_msgSend(v45, "setNumTriggersFired:", objc_msgSend(v35, "fetchEventCounterForEventName:forDate:", @"HMDLogEventUserActivityAnalyzerTriggerFiredEventCounter", v6));

  v36 = [(HMDLogEventUserActivityAnalyzer *)self counterGroup];
  objc_msgSend(v45, "setCameraStreamStartSuccessCount:", objc_msgSend(v36, "fetchEventCounterForEventName:forDate:", @"HMDLogEventUserActivityAnalyzerCameraStreamStartSuccessEventCounter", v6));

  id v37 = [(HMDLogEventUserActivityAnalyzer *)self counterGroup];
  objc_msgSend(v45, "setCameraStreamStartFailureCount:", objc_msgSend(v37, "fetchEventCounterForEventName:forDate:", @"HMDLogEventUserActivityAnalyzerCameraStreamStartFailureEventCounter", v6));

  uint64_t v38 = [(HMDLogEventUserActivityAnalyzer *)self counterGroup];
  objc_msgSend(v45, "setFetchCameraClipVideoSegmentAssetCount:", objc_msgSend(v38, "fetchEventCounterForEventName:forDate:", @"HMDLogEventUserActivityAnalyzerFetchCameraClipVideoSegmentsAssetEventCounter", v6));

  v39 = [(HMDLogEventUserActivityAnalyzer *)self flagsManager];
  v40 = [v39 flagForName:@"HMDLogEventUserActivityAnalyzerIsActiveFlag" periodicity:1];

  int8x8_t v41 = (int8x8_t)[v40 bitsForDate:v6 bitCount:30 outValidBitCount:0];
  [v45 setActiveDay:v41.i8[0] & 1];
  if (v41) {
    uint64_t v42 = (uint64_t)log2((double)(unint64_t)(*(void *)&v41 & -*(void *)&v41));
  }
  else {
    uint64_t v42 = -1;
  }
  [v45 setCountOfDaysSinceLastActive:v42];
  uint8x8_t v43 = (uint8x8_t)vcnt_s8(v41);
  v43.i16[0] = vaddlv_u8(v43);
  if (v41) {
    uint64_t v44 = v43.u32[0];
  }
  else {
    uint64_t v44 = 0;
  }
  [v45 setActiveDaysPerMonthCount:v44];
}

- (void)markActiveForEventName:(id)a3 logEvent:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  id v7 = [(HMDLogEventUserActivityAnalyzer *)self counterGroup];
  [v7 incrementEventCounterForEventName:v15];

  id v8 = HMMSafeHomeUUIDFromLogEvent();
  if (v8)
  {
    id v9 = [(HMDLogEventUserActivityAnalyzer *)self flagsManager];
    id v10 = [v9 flagForName:@"HMDLogEventUserActivityAnalyzerIsActiveFlag" homeUUID:v8 periodicity:1];

    [v10 setCurrentBit];
  }
  v11 = [(HMDLogEventUserActivityAnalyzer *)self flagsManager];
  v12 = [v11 flagForName:@"HMDLogEventUserActivityAnalyzerIsActiveFlag" periodicity:1];

  [v12 setCurrentBit];
  uint64_t v13 = [(HMDHouseholdActivityLogEventContributor *)self householdGroupForLogEvent:v6];
  id v14 = v13;
  if (v13) {
    [v13 incrementEventCounterForEventName:v15];
  }
}

- (BOOL)_isTriggerSource:(unint64_t)a3
{
  return a3 - 3 < 2;
}

- (BOOL)_isUserSource:(unint64_t)a3
{
  return ((a3 - 1) & 0xFFFFFFFFFFFFFFFALL) == 0;
}

- (void)_handleCameraClipRequestLogEvent:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [v6 requestName];
  int v5 = [v4 isEqualToString:@"HMDCameraClipManagerRequestLogEventFetchVideoSegmentsAssetRequestName"];

  if (v5) {
    [(HMDLogEventUserActivityAnalyzer *)self markActiveForEventName:@"HMDLogEventUserActivityAnalyzerFetchCameraClipVideoSegmentsAssetEventCounter" logEvent:v6];
  }
}

- (void)_handleCameraStreamLogEvent:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [v8 error];
  uint64_t v5 = [v4 code];
  id v6 = @"HMDLogEventUserActivityAnalyzerCameraStreamStartFailureEventCounter";
  if (!v5) {
    id v6 = @"HMDLogEventUserActivityAnalyzerCameraStreamStartSuccessEventCounter";
  }
  id v7 = v6;

  [(HMDLogEventUserActivityAnalyzer *)self markActiveForEventName:v7 logEvent:v8];
}

- (void)_handleActionSetRunLogEvent:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [v8 actionSetType];
  char v5 = [v4 isEqualToString:*MEMORY[0x1E4F2C940]];

  if (v5)
  {
    id v6 = v8;
    id v7 = @"HMDLogEventUserActivityAnalyzerRunShortcutEventCounter";
  }
  else if (-[HMDLogEventUserActivityAnalyzer _isUserSource:](self, "_isUserSource:", [v8 triggerSource]))
  {
    id v6 = v8;
    id v7 = @"HMDLogEventUserActivityAnalyzerRunSceneEventCounter";
  }
  else
  {
    if (!-[HMDLogEventUserActivityAnalyzer _isTriggerSource:](self, "_isTriggerSource:", [v8 triggerSource]))goto LABEL_8; {
    id v6 = v8;
    }
    id v7 = @"HMDLogEventUserActivityAnalyzerTriggerFiredEventCounter";
  }
  [(HMDLogEventUserActivityAnalyzer *)self markActiveForEventName:v7 logEvent:v6];
LABEL_8:
}

- (void)_handleAddTriggerLogEvent:(id)a3
{
  id v4 = a3;
  [(HMDLogEventUserActivityAnalyzer *)self markActiveForEventName:@"HMDLogEventUserActivityAnalyzerAddSceneEventCounter" logEvent:v4];
  [(HMDLogEventUserActivityAnalyzer *)self markActiveForEventName:@"HMDLogEventUserActivityAnalyzerAddTriggerEventCounter" logEvent:v4];
}

- (void)_handleAddActionSetLogEvent:(id)a3
{
  id v6 = a3;
  [(HMDLogEventUserActivityAnalyzer *)self markActiveForEventName:@"HMDLogEventUserActivityAnalyzerAddSceneEventCounter" logEvent:v6];
  id v4 = [v6 actionSetType];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F2C940]];

  if (v5) {
    [(HMDLogEventUserActivityAnalyzer *)self markActiveForEventName:@"HMDLogEventUserActivityAnalyzerAddShortcutEventCounter" logEvent:v6];
  }
}

- (void)_handleAccessoryPairingLogEvent:(id)a3
{
  id v6 = a3;
  if ([v6 isAddOperation])
  {
    id v4 = [v6 error];
    uint64_t v5 = [v4 code];

    if (!v5) {
      [(HMDLogEventUserActivityAnalyzer *)self markActiveForEventName:@"HMDLogEventUserActivityAnalyzerAddAccessoryEventCounter" logEvent:v6];
    }
  }
}

- (void)updateLinkTypeActivityCountsForReadWriteLogEvent:(id)a3
{
  id v15 = a3;
  if ([v15 linkType] == 1 && objc_msgSend(v15, "isLocal"))
  {
    id v4 = [(HMDLogEventUserActivityAnalyzer *)self counterGroup];
    objc_msgSend(v4, "incrementEventCounterForEventName:withValue:", @"HMDLogEventUserActivityAnalyzerIPDurationAggregate", objc_msgSend(v15, "durationMilliseconds"));

    uint64_t v5 = [v15 error];
    uint64_t v6 = [v5 code];

    id v7 = [(HMDLogEventUserActivityAnalyzer *)self counterGroup];
    if (v6) {
      id v8 = @"HMDLogEventUserActivityAnalyzerReadWriteIPFailureEventCounter";
    }
    else {
      id v8 = @"HMDLogEventUserActivityAnalyzerReadWriteIPSuccessEventCounter";
    }
  }
  else if ([v15 linkType] == 2 && objc_msgSend(v15, "isLocal"))
  {
    id v9 = [(HMDLogEventUserActivityAnalyzer *)self counterGroup];
    objc_msgSend(v9, "incrementEventCounterForEventName:withValue:", @"HMDLogEventUserActivityAnalyzerBTDurationAggregate", objc_msgSend(v15, "durationMilliseconds"));

    id v10 = [v15 error];
    uint64_t v11 = [v10 code];

    id v7 = [(HMDLogEventUserActivityAnalyzer *)self counterGroup];
    if (v11) {
      id v8 = @"HMDLogEventUserActivityAnalyzerReadWriteBTFailureEventCounter";
    }
    else {
      id v8 = @"HMDLogEventUserActivityAnalyzerReadWriteBTSuccessEventCounter";
    }
  }
  else
  {
    if ([v15 isLocal]) {
      goto LABEL_16;
    }
    v12 = [(HMDLogEventUserActivityAnalyzer *)self counterGroup];
    objc_msgSend(v12, "incrementEventCounterForEventName:withValue:", @"HMDLogEventUserActivityAnalyzerIDSDurationAggregate", objc_msgSend(v15, "durationMilliseconds"));

    uint64_t v13 = [v15 error];
    uint64_t v14 = [v13 code];

    id v7 = [(HMDLogEventUserActivityAnalyzer *)self counterGroup];
    if (v14) {
      id v8 = @"HMDLogEventUserActivityAnalyzerReadWriteIDSFailureEventCounter";
    }
    else {
      id v8 = @"HMDLogEventUserActivityAnalyzerReadWriteIDSSuccessEventCounter";
    }
  }
  [v7 incrementEventCounterForEventName:v8];

LABEL_16:
}

- (void)_handleReadWriteLogEvent:(id)a3
{
  id v17 = a3;
  switch([v17 triggerSource])
  {
    case 0:
      int v4 = [v17 isWriteOperation];
      uint64_t v5 = @"HMDLogEventUserActivityAnalyzerUnknownSourceReadEventCounter";
      uint64_t v6 = @"HMDLogEventUserActivityAnalyzerUnknownSourceWriteEventCounter";
      goto LABEL_13;
    case 1:
      int v7 = [v17 isWriteOperation];
      id v8 = @"HMDLogEventUserActivityAnalyzerSiriReadEventCounter";
      id v9 = @"HMDLogEventUserActivityAnalyzerSiriWriteEventCounter";
      goto LABEL_7;
    case 5:
      char v10 = [v17 isWriteOperation];
      id v11 = v17;
      if (v10)
      {
        v12 = @"HMDLogEventUserActivityAnalyzerFirstPartyWriteEventCounter";
LABEL_11:
        [(HMDLogEventUserActivityAnalyzer *)self markActiveForEventName:v12 logEvent:v11];
LABEL_17:

        goto LABEL_18;
      }
      v12 = [v17 bundleId];
      uint64_t v13 = [(__CFString *)v12 lowercaseString];
      if ([v13 isEqualToString:@"com.apple.springboard"])
      {
LABEL_16:

        goto LABEL_17;
      }
      uint64_t v14 = [v17 bundleId];
      id v15 = [v14 lowercaseString];
      char v16 = [v15 isEqualToString:@"com.apple.home.homewidget"];

      if ((v16 & 1) == 0)
      {
        v12 = @"HMDLogEventUserActivityAnalyzerFirstPartyReadEventCounter";
LABEL_10:
        id v11 = v17;
        goto LABEL_11;
      }
LABEL_18:
      [(HMDLogEventUserActivityAnalyzer *)self updateLinkTypeActivityCountsForReadWriteLogEvent:v17];

      return;
    case 6:
      int v7 = [v17 isWriteOperation];
      id v8 = @"HMDLogEventUserActivityAnalyzerThirdPartyReadEventCounter";
      id v9 = @"HMDLogEventUserActivityAnalyzerThirdPartyWriteEventCounter";
LABEL_7:
      if (v7) {
        id v8 = v9;
      }
      v12 = v8;
      goto LABEL_10;
    case 7:
      int v4 = [v17 isWriteOperation];
      uint64_t v5 = @"HMDLogEventUserActivityAnalyzerInternalRequestedReadEventCounter";
      uint64_t v6 = @"HMDLogEventUserActivityAnalyzerInternalRequestedWriteEventCounter";
LABEL_13:
      if (v4) {
        uint64_t v5 = v6;
      }
      v12 = v5;
      uint64_t v13 = [(HMDLogEventUserActivityAnalyzer *)self counterGroup];
      [v13 incrementEventCounterForEventName:v12];
      goto LABEL_16;
    default:
      goto LABEL_18;
  }
}

- (void)didReceiveEventFromDispatcher:(id)a3
{
  id v24 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v4 = v24;
  }
  else {
    int v4 = 0;
  }
  id v5 = v4;
  if (v5)
  {
    [(HMDLogEventUserActivityAnalyzer *)self _handleReadWriteLogEvent:v5];
  }
  else
  {
    id v6 = v24;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v7 = v6;
    }
    else {
      int v7 = 0;
    }
    id v8 = v7;

    if (v8)
    {
      [(HMDLogEventUserActivityAnalyzer *)self _handleAccessoryPairingLogEvent:v8];
    }
    else
    {
      id v9 = v6;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        char v10 = v9;
      }
      else {
        char v10 = 0;
      }
      id v11 = v10;

      if (v11)
      {
        [(HMDLogEventUserActivityAnalyzer *)self _handleAddActionSetLogEvent:v11];
      }
      else
      {
        id v12 = v9;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v13 = v12;
        }
        else {
          uint64_t v13 = 0;
        }
        id v14 = v13;

        if (v14)
        {
          [(HMDLogEventUserActivityAnalyzer *)self _handleAddTriggerLogEvent:v14];
        }
        else
        {
          id v15 = v12;
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            char v16 = v15;
          }
          else {
            char v16 = 0;
          }
          id v17 = v16;

          if (v17)
          {
            [(HMDLogEventUserActivityAnalyzer *)self _handleActionSetRunLogEvent:v17];
          }
          else
          {
            id v18 = v15;
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              v19 = v18;
            }
            else {
              v19 = 0;
            }
            id v20 = v19;

            if (v20)
            {
              [(HMDLogEventUserActivityAnalyzer *)self _handleCameraStreamLogEvent:v20];
            }
            else
            {
              id v21 = v18;
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                uint64_t v22 = v21;
              }
              else {
                uint64_t v22 = 0;
              }
              id v23 = v22;

              if (v23) {
                [(HMDLogEventUserActivityAnalyzer *)self _handleCameraClipRequestLogEvent:v23];
              }
            }
          }
        }
      }
    }
  }
}

- (HMDLogEventUserActivityAnalyzer)initWithEventCountersManager:(id)a3 flagsManager:(id)a4 dateProvider:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDLogEventUserActivityAnalyzer;
  char v10 = [(HMDHouseholdActivityLogEventContributor *)&v14 initWithHouseholdGroupName:@"HMDLogEventUserActivityAnalyzerRequestGroup" countersManager:v8 dateProvider:a5];
  if (v10)
  {
    uint64_t v11 = [v8 counterGroupForName:@"HMDLogEventUserActivityAnalyzerRequestGroup"];
    counterGroup = v10->_counterGroup;
    v10->_counterGroup = (HMDEventCounterGroup *)v11;

    objc_storeStrong((id *)&v10->_flagsManager, a4);
  }

  return v10;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t24_47452 != -1) {
    dispatch_once(&logCategory__hmf_once_t24_47452, &__block_literal_global_47453);
  }
  id v2 = (void *)logCategory__hmf_once_v25_47454;
  return v2;
}

uint64_t __46__HMDLogEventUserActivityAnalyzer_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v25_47454;
  logCategory__hmf_once_v25_47454 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)managedEventCounterRequestGroups
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"HMDLogEventUserActivityAnalyzerRequestGroup";
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

@end
@interface ATXNotificationBreakthroughEventMetric
+ (id)coreAnalyticsDictionaryFromQueryResult:(id)a3 featureCollectionSet:(id)a4;
- (ATXNotificationBreakthroughEventMetric)initWithQueryResult:(id)a3 featureCollectionSet:(id)a4;
- (ATXNotificationCategorizationFeatureCollectionSet)featureCollectionSet;
- (ATXNotificationTelemetryQueryResult)queryResult;
- (id)coreAnalyticsDictionary;
- (id)metricName;
- (void)setFeatureCollectionSet:(id)a3;
- (void)setQueryResult:(id)a3;
@end

@implementation ATXNotificationBreakthroughEventMetric

- (id)metricName
{
  return @"com.apple.ModeActivity.NotificationBreakthrough.event";
}

- (ATXNotificationBreakthroughEventMetric)initWithQueryResult:(id)a3 featureCollectionSet:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXNotificationBreakthroughEventMetric;
  v9 = [(_ATXCoreAnalyticsMetric *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_featureCollectionSet, a4);
    objc_storeStrong((id *)&v10->_queryResult, a3);
  }

  return v10;
}

- (id)coreAnalyticsDictionary
{
  v3 = objc_opt_class();
  queryResult = self->_queryResult;
  featureCollectionSet = self->_featureCollectionSet;
  return (id)[v3 coreAnalyticsDictionaryFromQueryResult:queryResult featureCollectionSet:featureCollectionSet];
}

+ (id)coreAnalyticsDictionaryFromQueryResult:(id)a3 featureCollectionSet:(id)a4
{
  v225[53] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v224[0] = @"bundleId";
  uint64_t v7 = [v5 bundleId];
  id v8 = (void *)v7;
  if (!v7)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v139 = (void *)v7;
  v225[0] = v7;
  v224[1] = @"destinationReason";
  uint64_t v9 = [v5 destinationReason];
  v10 = (void *)v9;
  if (!v9)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v218 = v10;
  v138 = (void *)v9;
  v225[1] = v9;
  v224[2] = @"handleDestination";
  uint64_t v11 = [v5 finalDestination];
  v217 = (void *)v11;
  if (!v11)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v219 = v8;
  v137 = (void *)v11;
  v225[2] = v11;
  v224[3] = @"handleMode";
  v216 = [v5 resolution];
  v215 = [v216 resolutionTimestamp];
  uint64_t v12 = +[ATXNotificationEventMetric atxComputedModeStringForTimestamp:](ATXNotificationEventMetric, "atxComputedModeStringForTimestamp:");
  v13 = (void *)v12;
  if (!v12)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v136 = (void *)v12;
  v225[3] = v12;
  v224[4] = @"isMessage";
  v213 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "isMessage"));
  v225[4] = v213;
  v224[5] = @"notificationUrgency";
  [v5 urgency];
  uint64_t v14 = ATXUserNotificationDeliveryUrgencyToString();
  v15 = (void *)v14;
  if (!v14)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v135 = (void *)v14;
  v225[5] = v14;
  v224[6] = @"originalDestination";
  uint64_t v16 = [v5 originalDestination];
  v211 = (void *)v16;
  if (!v16)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v134 = (void *)v16;
  v225[6] = v16;
  v224[7] = @"deliveryMethod";
  [v5 deliveryMethod];
  uint64_t v17 = ATXUserNotificationDeliveryMethodToString();
  v18 = (void *)v17;
  if (!v17)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v133 = (void *)v17;
  v225[7] = v17;
  v224[8] = @"receiveMode";
  v209 = [v5 receiveTimestamp];
  uint64_t v19 = +[ATXNotificationEventMetric atxComputedModeStringForTimestamp:](ATXNotificationEventMetric, "atxComputedModeStringForTimestamp:");
  v20 = (void *)v19;
  if (!v19)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v132 = (void *)v19;
  v225[8] = v19;
  v224[9] = @"resolutionType";
  v207 = [v5 resolution];
  uint64_t v21 = ATXUserNotificationResolutionTypeToString([v207 resolutionType]);
  v223 = (void *)v21;
  if (!v21)
  {
    uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v131 = (void *)v21;
  v225[9] = v21;
  v224[10] = @"secureBundleId";
  v206 = [v5 bundleId];
  uint64_t v22 = +[ATXCoreAnalyticsFieldUtilities hashBoundString:](ATXCoreAnalyticsFieldUtilities, "hashBoundString:");
  v222 = (void *)v22;
  if (!v22)
  {
    uint64_t v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v130 = (void *)v22;
  v225[10] = v22;
  v224[11] = @"timeToResolution";
  v23 = NSNumber;
  v205 = [v5 resolution];
  v24 = [v205 resolutionTimestamp];
  [v5 receiveTimestamp];
  v203 = v204 = v24;
  objc_msgSend(v24, "timeIntervalSinceDate:");
  v202 = objc_msgSend(v23, "numberWithDouble:");
  v225[11] = v202;
  v224[12] = @"receiveInferredMode";
  v25 = (void *)MEMORY[0x1E4F93658];
  v201 = [v5 receiveTimestamp];
  v200 = objc_msgSend(v25, "currentModeEventAtGivenTime:");
  v199 = [v200 eventBody];
  [v199 modeType];
  BMUserFocusInferredModeTypeToActivity();
  ATXModeFromActivityType();
  uint64_t v26 = ATXModeToString();
  v221 = (void *)v26;
  if (!v26)
  {
    uint64_t v26 = [MEMORY[0x1E4F1CA98] null];
  }
  v129 = (void *)v26;
  v225[12] = v26;
  v224[13] = @"handleInferredMode";
  v27 = (void *)MEMORY[0x1E4F93658];
  v198 = [v5 resolution];
  v197 = [v198 resolutionTimestamp];
  v196 = objc_msgSend(v27, "currentModeEventAtGivenTime:");
  v195 = [v196 eventBody];
  [v195 modeType];
  BMUserFocusInferredModeTypeToActivity();
  ATXModeFromActivityType();
  uint64_t v28 = ATXModeToString();
  v194 = (void *)v28;
  if (!v28)
  {
    uint64_t v28 = [MEMORY[0x1E4F1CA98] null];
  }
  v208 = v20;
  v210 = v18;
  v212 = v15;
  v214 = v13;
  v128 = (void *)v28;
  v225[13] = v28;
  v224[14] = @"currentUnifiedMode";
  [v6 currentUnifiedMode];
  v193 = ATXModeToString();
  v225[14] = v193;
  v224[15] = @"contactRelationships";
  v192 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "contactRelationships"));
  v225[15] = v192;
  v224[16] = @"relationshipFromMegadome";
  v191 = [v6 relationshipsFromMegadome];
  uint64_t v29 = [v191 firstObject];
  v190 = (void *)v29;
  if (!v29)
  {
    uint64_t v29 = [MEMORY[0x1E4F1CA98] null];
  }
  v127 = (void *)v29;
  v225[16] = v29;
  v224[17] = @"dayOfWeek";
  v189 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "dayOfWeek"));
  v225[17] = v189;
  v224[18] = @"timeOfDay";
  v188 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v6, "timeOfDay"));
  v225[18] = v188;
  v224[19] = @"locationSemantic";
  v187 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v6, "locationSemantic"));
  v225[19] = v187;
  v224[20] = @"appModeAffinityScore";
  v30 = NSNumber;
  [v6 appModeAffinityScore];
  uint64_t v31 = objc_msgSend(v30, "numberWithDouble:");
  v186 = (void *)v31;
  if (v31) {
    v32 = (void *)v31;
  }
  else {
    v32 = &unk_1F27F1D10;
  }
  v225[20] = v32;
  v224[21] = @"contactModeAffinityScore";
  v33 = NSNumber;
  [v6 contactModeAffinityScore];
  uint64_t v34 = objc_msgSend(v33, "numberWithDouble:");
  v185 = (void *)v34;
  if (v34) {
    v35 = (void *)v34;
  }
  else {
    v35 = &unk_1F27F1D10;
  }
  v225[21] = v35;
  v224[22] = @"notificationModeAffinityScore";
  v36 = NSNumber;
  [v6 notificationModeAffinityScore];
  uint64_t v37 = objc_msgSend(v36, "numberWithDouble:");
  v184 = (void *)v37;
  if (v37) {
    v38 = (void *)v37;
  }
  else {
    v38 = &unk_1F27F1D10;
  }
  v225[22] = v38;
  v224[23] = @"appCategoryScoreInMode";
  v39 = NSNumber;
  [v6 appCategoryScoreInMode];
  uint64_t v40 = objc_msgSend(v39, "numberWithDouble:");
  v183 = (void *)v40;
  if (v40) {
    v41 = (void *)v40;
  }
  else {
    v41 = &unk_1F27F1D10;
  }
  v225[23] = v41;
  v224[24] = @"urgencyScore";
  v42 = NSNumber;
  [v6 urgencyScore];
  uint64_t v43 = objc_msgSend(v42, "numberWithDouble:");
  v182 = (void *)v43;
  if (v43) {
    v44 = (void *)v43;
  }
  else {
    v44 = &unk_1F27F1D10;
  }
  v225[24] = v44;
  v224[25] = @"importanceScore";
  v45 = NSNumber;
  [v6 importanceScore];
  uint64_t v46 = objc_msgSend(v45, "numberWithDouble:");
  v181 = (void *)v46;
  if (v46) {
    v47 = (void *)v46;
  }
  else {
    v47 = &unk_1F27F1D10;
  }
  v225[25] = v47;
  v224[26] = @"lengthOfNotificationBody";
  v220 = v5;
  v180 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "bodyLength"));
  v225[26] = v180;
  v224[27] = @"timeBucketToLaunchApp";
  v179 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "timeToLaunchApp"));
  v225[27] = v179;
  v224[28] = @"dailyNumberOfNotificationsReceivedForBundleID";
  v48 = NSNumber;
  v178 = [v6 historicalVolumeByCountAndPercentage];
  uint64_t v49 = objc_msgSend(v48, "numberWithUnsignedInteger:", objc_msgSend(v178, "dailyNumberOfNotificationsReceivedForBundleID"));
  v177 = (void *)v49;
  if (v49) {
    v50 = (void *)v49;
  }
  else {
    v50 = &unk_1F27F1D10;
  }
  v225[28] = v50;
  v224[29] = @"weeklyNumberOfNotificationsReceivedForBundleID";
  v51 = NSNumber;
  v176 = [v6 historicalVolumeByCountAndPercentage];
  uint64_t v52 = objc_msgSend(v51, "numberWithUnsignedInteger:", objc_msgSend(v176, "weeklyNumberOfNotificationsReceivedForBundleID"));
  v175 = (void *)v52;
  if (v52) {
    v53 = (void *)v52;
  }
  else {
    v53 = &unk_1F27F1D10;
  }
  v225[29] = v53;
  v224[30] = @"dailyPercentageOfNotificationsReceivedForBundleID";
  v54 = NSNumber;
  v174 = [v6 historicalVolumeByCountAndPercentage];
  [v174 dailyPercentageOfNotificationsReceivedForBundleID];
  uint64_t v55 = objc_msgSend(v54, "numberWithDouble:");
  v173 = (void *)v55;
  if (v55) {
    v56 = (void *)v55;
  }
  else {
    v56 = &unk_1F27F1D10;
  }
  v225[30] = v56;
  v224[31] = @"weeklyPercentageOfNotificationsReceivedForBundleID";
  v57 = NSNumber;
  v172 = [v6 historicalVolumeByCountAndPercentage];
  [v172 weeklyPercentageOfNotificationsReceivedForBundleID];
  uint64_t v58 = objc_msgSend(v57, "numberWithDouble:");
  v171 = (void *)v58;
  if (v58) {
    v59 = (void *)v58;
  }
  else {
    v59 = &unk_1F27F1D10;
  }
  v225[31] = v59;
  v224[32] = @"modeDailyNumberOfNotificationsReceivedForBundleID";
  v60 = NSNumber;
  v170 = [v6 modeConditionedHistoricalVolumeByCountAndPercentage];
  uint64_t v61 = objc_msgSend(v60, "numberWithUnsignedInteger:", objc_msgSend(v170, "dailyNumberOfNotificationsReceivedForBundleID"));
  v169 = (void *)v61;
  if (v61) {
    v62 = (void *)v61;
  }
  else {
    v62 = &unk_1F27F1D10;
  }
  v225[32] = v62;
  v224[33] = @"modeWeeklyNumberOfNotificationsReceivedForBundleID";
  v63 = NSNumber;
  v168 = [v6 modeConditionedHistoricalVolumeByCountAndPercentage];
  uint64_t v64 = objc_msgSend(v63, "numberWithUnsignedInteger:", objc_msgSend(v168, "weeklyNumberOfNotificationsReceivedForBundleID"));
  v167 = (void *)v64;
  if (v64) {
    v65 = (void *)v64;
  }
  else {
    v65 = &unk_1F27F1D10;
  }
  v225[33] = v65;
  v224[34] = @"modeDailyPercentageOfNotificationsReceivedForBundleID";
  v66 = NSNumber;
  v166 = [v6 modeConditionedHistoricalVolumeByCountAndPercentage];
  [v166 dailyPercentageOfNotificationsReceivedForBundleID];
  uint64_t v67 = objc_msgSend(v66, "numberWithDouble:");
  v165 = (void *)v67;
  if (v67) {
    v68 = (void *)v67;
  }
  else {
    v68 = &unk_1F27F1D10;
  }
  v225[34] = v68;
  v224[35] = @"modeWeeklyPercentageOfNotificationsReceivedForBundleID";
  v69 = NSNumber;
  v164 = [v6 modeConditionedHistoricalVolumeByCountAndPercentage];
  [v164 weeklyPercentageOfNotificationsReceivedForBundleID];
  uint64_t v70 = objc_msgSend(v69, "numberWithDouble:");
  v163 = (void *)v70;
  if (v70) {
    v71 = (void *)v70;
  }
  else {
    v71 = &unk_1F27F1D10;
  }
  v225[35] = v71;
  v224[36] = @"percentageForOneMinuteDuration";
  v72 = NSNumber;
  v162 = [v6 historicalResolutionByPercentage];
  [v162 percentageForOneMinuteDuration];
  uint64_t v73 = objc_msgSend(v72, "numberWithDouble:");
  v161 = (void *)v73;
  if (v73) {
    v74 = (void *)v73;
  }
  else {
    v74 = &unk_1F27F1D10;
  }
  v225[36] = v74;
  v224[37] = @"percentageForTwoMinutesDuration";
  v75 = NSNumber;
  v160 = [v6 historicalResolutionByPercentage];
  [v160 percentageForTwoMinutesDuration];
  uint64_t v76 = objc_msgSend(v75, "numberWithDouble:");
  v159 = (void *)v76;
  if (v76) {
    v77 = (void *)v76;
  }
  else {
    v77 = &unk_1F27F1D10;
  }
  v225[37] = v77;
  v224[38] = @"percentageForFiveMinutesDuration";
  v78 = NSNumber;
  v158 = [v6 historicalResolutionByPercentage];
  [v158 percentageForFiveMinutesDuration];
  uint64_t v79 = objc_msgSend(v78, "numberWithDouble:");
  v157 = (void *)v79;
  if (v79) {
    v80 = (void *)v79;
  }
  else {
    v80 = &unk_1F27F1D10;
  }
  v225[38] = v80;
  v224[39] = @"percentageForTenMinutesDuration";
  v81 = NSNumber;
  v156 = [v6 historicalResolutionByPercentage];
  [v156 percentageForTenMinutesDuration];
  uint64_t v82 = objc_msgSend(v81, "numberWithDouble:");
  v155 = (void *)v82;
  if (v82) {
    v83 = (void *)v82;
  }
  else {
    v83 = &unk_1F27F1D10;
  }
  v225[39] = v83;
  v224[40] = @"percentageForTwentyMinutesDuration";
  v84 = NSNumber;
  v154 = [v6 historicalResolutionByPercentage];
  [v154 percentageForTwentyMinutesDuration];
  uint64_t v85 = objc_msgSend(v84, "numberWithDouble:");
  v153 = (void *)v85;
  if (v85) {
    v86 = (void *)v85;
  }
  else {
    v86 = &unk_1F27F1D10;
  }
  v225[40] = v86;
  v224[41] = @"percentageForThirtyMinutesDuration";
  v87 = NSNumber;
  v152 = [v6 historicalResolutionByPercentage];
  [v152 percentageForThirtyMinutesDuration];
  uint64_t v88 = objc_msgSend(v87, "numberWithDouble:");
  v151 = (void *)v88;
  if (v88) {
    v89 = (void *)v88;
  }
  else {
    v89 = &unk_1F27F1D10;
  }
  v225[41] = v89;
  v224[42] = @"percentageForSixtyMinutesDuration";
  v90 = NSNumber;
  v150 = [v6 historicalResolutionByPercentage];
  [v150 percentageForSixtyMinutesDuration];
  uint64_t v91 = objc_msgSend(v90, "numberWithDouble:");
  v149 = (void *)v91;
  if (v91) {
    v92 = (void *)v91;
  }
  else {
    v92 = &unk_1F27F1D10;
  }
  v225[42] = v92;
  v224[43] = @"modePercentageForOneMinuteDuration";
  v93 = NSNumber;
  v148 = [v6 modeConditionedHistoricalResolutionByPercentage];
  [v148 percentageForOneMinuteDuration];
  uint64_t v94 = objc_msgSend(v93, "numberWithDouble:");
  v147 = (void *)v94;
  if (v94) {
    v95 = (void *)v94;
  }
  else {
    v95 = &unk_1F27F1D10;
  }
  v225[43] = v95;
  v224[44] = @"modePercentageForTwoMinutesDuration";
  v96 = NSNumber;
  v146 = [v6 modeConditionedHistoricalResolutionByPercentage];
  [v146 percentageForTwoMinutesDuration];
  uint64_t v97 = objc_msgSend(v96, "numberWithDouble:");
  v145 = (void *)v97;
  if (v97) {
    v98 = (void *)v97;
  }
  else {
    v98 = &unk_1F27F1D10;
  }
  v225[44] = v98;
  v224[45] = @"modePercentageForFiveMinutesDuration";
  v99 = NSNumber;
  v144 = [v6 modeConditionedHistoricalResolutionByPercentage];
  [v144 percentageForFiveMinutesDuration];
  uint64_t v100 = objc_msgSend(v99, "numberWithDouble:");
  v143 = (void *)v100;
  if (v100) {
    v101 = (void *)v100;
  }
  else {
    v101 = &unk_1F27F1D10;
  }
  v225[45] = v101;
  v224[46] = @"modePercentageForTenMinutesDuration";
  v102 = NSNumber;
  v142 = [v6 modeConditionedHistoricalResolutionByPercentage];
  [v142 percentageForTenMinutesDuration];
  uint64_t v103 = objc_msgSend(v102, "numberWithDouble:");
  v104 = (void *)v103;
  if (v103) {
    v105 = (void *)v103;
  }
  else {
    v105 = &unk_1F27F1D10;
  }
  v225[46] = v105;
  v224[47] = @"modePercentageForTwentyMinutesDuration";
  v106 = NSNumber;
  v141 = [v6 modeConditionedHistoricalResolutionByPercentage];
  [v141 percentageForTwentyMinutesDuration];
  uint64_t v107 = objc_msgSend(v106, "numberWithDouble:");
  v108 = (void *)v107;
  if (v107) {
    v109 = (void *)v107;
  }
  else {
    v109 = &unk_1F27F1D10;
  }
  v225[47] = v109;
  v224[48] = @"modePercentageForThirtyMinutesDuration";
  v110 = NSNumber;
  v111 = [v6 modeConditionedHistoricalResolutionByPercentage];
  [v111 percentageForThirtyMinutesDuration];
  uint64_t v112 = objc_msgSend(v110, "numberWithDouble:");
  v113 = (void *)v112;
  if (v112) {
    v114 = (void *)v112;
  }
  else {
    v114 = &unk_1F27F1D10;
  }
  v225[48] = v114;
  v224[49] = @"modePercentageForSixtyMinutesDuration";
  v115 = NSNumber;
  v116 = [v6 modeConditionedHistoricalResolutionByPercentage];
  [v116 percentageForSixtyMinutesDuration];
  uint64_t v117 = objc_msgSend(v115, "numberWithDouble:");
  v118 = (void *)v117;
  if (v117) {
    v119 = (void *)v117;
  }
  else {
    v119 = &unk_1F27F1D10;
  }
  v225[49] = v119;
  v224[50] = @"trialDeploymentId";
  v120 = [MEMORY[0x1E4F1CA98] null];
  v225[50] = v120;
  v224[51] = @"trialExperimentId";
  v121 = [MEMORY[0x1E4F1CA98] null];
  v225[51] = v121;
  v224[52] = @"trialTreatmentId";
  v122 = [MEMORY[0x1E4F1CA98] null];
  v225[52] = v122;
  id v140 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v225 forKeys:v224 count:53];

  if (!v190) {
  if (!v194)
  }

  v123 = v221;
  if (!v221)
  {

    v123 = 0;
  }

  v124 = v222;
  if (!v222)
  {

    v124 = 0;
  }

  v125 = v223;
  if (!v223)
  {

    v125 = 0;
  }

  if (!v208) {
  if (!v210)
  }

  if (!v211) {
  if (!v212)
  }

  if (!v214) {
  if (!v217)
  }

  if (!v218) {
  if (!v219)
  }

  return v140;
}

- (ATXNotificationTelemetryQueryResult)queryResult
{
  return self->_queryResult;
}

- (void)setQueryResult:(id)a3
{
}

- (ATXNotificationCategorizationFeatureCollectionSet)featureCollectionSet
{
  return self->_featureCollectionSet;
}

- (void)setFeatureCollectionSet:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureCollectionSet, 0);
  objc_storeStrong((id *)&self->_queryResult, 0);
}

@end
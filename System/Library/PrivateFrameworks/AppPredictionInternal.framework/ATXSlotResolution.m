@interface ATXSlotResolution
+ (BOOL)isNotLaunchedWithinShortTimeSpan:(id)a3;
+ (BOOL)matchForCurrentGeohash:(int64_t)a3 rowGeohash:(int64_t)a4;
+ (BOOL)shouldCountRowForGeohashIndividualContextStatistics:(int64_t)a3 rowGeohash:(int64_t)a4;
+ (BOOL)shouldCountRowForGeohashOccurrencesCalculationForCurrentGeohash:(int64_t)a3 rowGeohash:(int64_t)a4;
+ (double)exponentialDecay:(double)a3 withHalflife:(double)a4;
+ (id)yearMonthDayComponentsForDate:(id)a3;
+ (void)setDistributionBasedScoreInputsForDayOfWeekForItem:(ATXPredictionItem *)a3 withLaunchDistribution:(id)a4;
+ (void)setDistributionBasedScoreInputsForItem:(ATXPredictionItem *)a3 withGeoHashResolution:(unint64_t)a4 withLaunchCounts:(id)a5;
+ (void)setDistributionBasedScoreInputsForTimeOfDayForItem:(ATXPredictionItem *)a3 withLaunchDistribution:(id)a4;
+ (void)setSlotLogProbabilityForCandidateActionPredictions:(id)a3;
+ (void)setSlotResolutionPredictionItemForTopUpcomingMediaActionContainer:(id)a3 appActionPredictionItem:(const ATXPredictionItem *)a4 appActionLogProbability:(double)a5;
- (ATXSlotResolution)init;
- (ATXSlotResolution)initWithDataStore:(id)a3;
- (id)actionPredictionsForStatistics:(id)a3;
- (id)actionPredictionsForStatistics:(id)a3 appActionPredictionItem:(const ATXPredictionItem *)a4 appActionLogProbability:(double)a5 scoreLogger:(id)a6 currentDate:(id)a7;
- (id)fastStatisticsOnSlotsForBundleId:(id)a3 actionType:(id)a4 currentDate:(id)a5 previousLocationUUID:(id)a6 currentLocationUUID:(id)a7 currentMotionType:(int64_t)a8 currentGeohash:(int64_t)a9 currentCoarseGeohash:(int64_t)a10;
- (id)statisticsForActionKey:(id)a3;
- (id)statisticsForActionKey:(id)a3 context:(id)a4;
- (id)statisticsForActionKey:(id)a3 currentDate:(id)a4 previousLocationUUID:(id)a5 currentLocationUUID:(id)a6 currentMotionType:(int64_t)a7 currentGeohash:(int64_t)a8 currentCoarseGeohash:(int64_t)a9;
- (id)updateStatisticsWithFeedbackForBundleId:(id)a3 actionType:(id)a4 statistics:(id)a5 currentDate:(id)a6 currentGeohash:(int64_t)a7 currentCoarseGeohash:(int64_t)a8;
- (id)updateStatisticsWithHigherLevelFeaturesForStatistics:(id)a3;
@end

@implementation ATXSlotResolution

- (ATXSlotResolution)initWithDataStore:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"ATXSlotResolution.mm", 52, @"Invalid parameter not satisfying: %@", @"dataStore" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)ATXSlotResolution;
  v7 = [(ATXSlotResolution *)&v14 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_dataStore, a3);
    v9 = +[ATXScoreInterpreterCache sharedInstance];
    uint64_t v10 = [v9 scoreInterpreterForConsumerSubType:25];
    slotResolutionInterpreter = v8->_slotResolutionInterpreter;
    v8->_slotResolutionInterpreter = (_ATXScoreInterpreter *)v10;
  }
  return v8;
}

- (ATXSlotResolution)init
{
  v3 = +[_ATXDataStore sharedInstance];
  v4 = [(ATXSlotResolution *)self initWithDataStore:v3];

  return v4;
}

+ (id)yearMonthDayComponentsForDate:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v5 = [v4 components:28 fromDate:v3];

  return v5;
}

+ (double)exponentialDecay:(double)a3 withHalflife:(double)a4
{
  if (a4 <= 0.0)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"ATXSlotResolution.mm", 72, @"Invalid parameter not satisfying: %@", @"halflife > 0" object file lineNumber description];
  }
  return exp(-0.693147181 / a4 * a3);
}

+ (BOOL)matchForCurrentGeohash:(int64_t)a3 rowGeohash:(int64_t)a4
{
  return a3 == -1 || a3 == a4;
}

+ (BOOL)shouldCountRowForGeohashOccurrencesCalculationForCurrentGeohash:(int64_t)a3 rowGeohash:(int64_t)a4
{
  return a3 == -1 || a4 != -1;
}

+ (BOOL)shouldCountRowForGeohashIndividualContextStatistics:(int64_t)a3 rowGeohash:(int64_t)a4
{
  return a3 != -1 && a4 != -1;
}

- (id)fastStatisticsOnSlotsForBundleId:(id)a3 actionType:(id)a4 currentDate:(id)a5 previousLocationUUID:(id)a6 currentLocationUUID:(id)a7 currentMotionType:(int64_t)a8 currentGeohash:(int64_t)a9 currentCoarseGeohash:(int64_t)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v58 = a7;
  v59 = v19;
  v61 = v17;
  v62 = v16;
  v60 = v18;
  v57 = +[_ATXActionUtils timeOfDayAndDayOfWeekForDate:v18 timeZone:0];
  v20 = [v57 first];
  uint64_t v21 = [v20 integerValue];

  v22 = [v57 second];
  uint64_t v23 = [v22 integerValue];

  v56 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  LODWORD(v22) = [v56 isDateInWeekend:v18];
  v55 = +[ATXSlotResolution yearMonthDayComponentsForDate:v18];
  v24 = +[_ATXGlobals sharedInstance];
  v25 = [ATXSlotResolutionStatistics alloc];
  v26 = [MEMORY[0x1E4F4AE38] getActionKeyForBundleId:v16 actionType:v17];
  uint64_t v27 = [(ATXSlotResolutionStatistics *)v25 initWithActionKey:v26];

  v209[0] = 0;
  v209[1] = v209;
  v209[2] = 0x2020000000;
  v209[3] = -1;
  v208[0] = 0;
  v208[1] = v208;
  v208[2] = 0x2020000000;
  v208[3] = 0;
  v207[0] = 0;
  v207[1] = v207;
  v207[2] = 0x2020000000;
  v207[3] = 0;
  v206[0] = 0;
  v206[1] = v206;
  v206[2] = 0x2020000000;
  v206[3] = 0;
  v205[0] = 0;
  v205[1] = v205;
  v205[2] = 0x2020000000;
  v205[3] = 0;
  v204[0] = 0;
  v204[1] = v204;
  v204[2] = 0x2020000000;
  v204[3] = 0;
  v203[0] = 0;
  v203[1] = v203;
  v203[2] = 0x2020000000;
  v203[3] = 0;
  v201[0] = 0;
  v201[1] = v201;
  v201[2] = 0x2020000000;
  int v202 = 0;
  v199[0] = 0;
  v199[1] = v199;
  v199[2] = 0x2020000000;
  int v200 = 0;
  v198[0] = 0;
  v198[1] = v198;
  v198[2] = 0x2020000000;
  v198[3] = 0;
  v197[0] = 0;
  v197[1] = v197;
  v197[2] = 0x2020000000;
  v197[3] = 0;
  v195[0] = 0;
  v195[1] = v195;
  v195[2] = 0x2020000000;
  int v196 = 0;
  v193[0] = 0;
  v193[1] = v193;
  v193[2] = 0x2020000000;
  int v194 = 0;
  v191[0] = 0;
  v191[1] = v191;
  v191[2] = 0x2020000000;
  int v192 = 0;
  v190[0] = 0;
  v190[1] = v190;
  v190[2] = 0x2020000000;
  v190[3] = 0;
  v189[0] = 0;
  v189[1] = v189;
  v189[2] = 0x2020000000;
  v189[3] = 0;
  v187[0] = 0;
  v187[1] = v187;
  v187[2] = 0x2020000000;
  int v188 = 0;
  v186[0] = 0;
  v186[1] = v186;
  v186[2] = 0x2020000000;
  v186[3] = 0;
  v184[0] = 0;
  v184[1] = v184;
  v184[2] = 0x2020000000;
  int v185 = 0;
  v182[0] = 0;
  v182[1] = v182;
  v182[2] = 0x2020000000;
  int v183 = 0;
  v181[0] = 0;
  v181[1] = v181;
  v181[2] = 0x2020000000;
  v181[3] = 0;
  v179[0] = 0;
  v179[1] = v179;
  v179[2] = 0x2020000000;
  int v180 = 0;
  v178[0] = 0;
  v178[1] = v178;
  v178[2] = 0x2020000000;
  v178[3] = 0;
  v177[0] = 0;
  v177[1] = v177;
  v177[2] = 0x2020000000;
  v177[3] = 0;
  v175[0] = 0;
  v175[1] = v175;
  v175[2] = 0x2020000000;
  int v176 = 0;
  v173[0] = 0;
  v173[1] = v173;
  v173[2] = 0x2020000000;
  int v174 = 0;
  v171[0] = 0;
  v171[1] = v171;
  v171[2] = 0x2020000000;
  int v172 = 0;
  v170[0] = 0;
  v170[1] = v170;
  v170[2] = 0x2020000000;
  v170[3] = 0;
  v169[0] = 0;
  v169[1] = v169;
  v169[2] = 0x2020000000;
  v169[3] = 0;
  v168[0] = 0;
  v168[1] = v168;
  v168[2] = 0x2020000000;
  v168[3] = 0;
  v167[0] = 0;
  v167[1] = v167;
  v167[2] = 0x2020000000;
  v167[3] = 0;
  v166[0] = 0;
  v166[1] = v166;
  v166[2] = 0x2020000000;
  v166[3] = 0;
  v165[0] = 0;
  v165[1] = v165;
  v165[2] = 0x2020000000;
  v165[3] = 0;
  v164[0] = 0;
  v164[1] = v164;
  v164[2] = 0x2020000000;
  v164[3] = 0;
  v163[0] = 0;
  v163[1] = v163;
  v163[2] = 0x2020000000;
  v163[3] = 0;
  v162[0] = 0;
  v162[1] = v162;
  v162[2] = 0x2020000000;
  v162[3] = 0;
  v161[0] = 0;
  v161[1] = v161;
  v161[2] = 0x2020000000;
  v161[3] = 0;
  v160[0] = 0;
  v160[1] = v160;
  v160[2] = 0x2020000000;
  v160[3] = 0;
  v159[0] = 0;
  v159[1] = v159;
  v159[2] = 0x2020000000;
  v159[3] = 0;
  v158[0] = 0;
  v158[1] = v158;
  v158[2] = 0x2020000000;
  v158[3] = 0;
  v156[0] = 0;
  v156[1] = v156;
  v156[2] = 0x2020000000;
  double v157 = 0.0;
  v54 = (void *)v27;
  [v24 slotResolutionLaunchDecayHalflife];
  double v157 = v28 * 86400.0;
  v154[0] = 0;
  v154[1] = v154;
  v154[2] = 0x2020000000;
  double v155 = 0.0;
  [v24 slotResolutionTimeOfDayLaunchDecayHalflife];
  double v155 = v29 * 86400.0;
  v152[0] = 0;
  v152[1] = v152;
  v152[2] = 0x2020000000;
  double v153 = 0.0;
  [v24 slotResolutionDayOfWeekLaunchDecayHalflife];
  double v153 = v30 * 86400.0;
  v150[0] = 0;
  v150[1] = v150;
  v150[2] = 0x2020000000;
  double v151 = 0.0;
  [v24 slotResolutionLocationLaunchDecayHalflife];
  double v151 = v31 * 86400.0;
  v148[0] = 0;
  v148[1] = v148;
  v148[2] = 0x2020000000;
  double v149 = 0.0;
  [v24 actionSpecificGeoHashDecayHalflife];
  double v149 = v32 * 86400.0;
  v146[0] = 0;
  v146[1] = v146;
  v146[2] = 0x2020000000;
  double v147 = 0.0;
  [v24 actionCoarseGeoHashDecayHalflife];
  double v147 = v33 * 86400.0;
  v144[0] = 0;
  v144[1] = v144;
  v144[2] = 0x2020000000;
  double v145 = 0.0;
  [v24 slotResolutionPreviousLocationLaunchDecayHalflife];
  double v145 = v34 * 86400.0;
  v142[0] = 0;
  v142[1] = v142;
  v142[2] = 0x2020000000;
  double v143 = 0.0;
  [v24 slotResolutionMotionTypeLaunchDecayHalflife];
  double v143 = v35 * 86400.0;
  v140[0] = 0;
  v140[1] = v140;
  v140[2] = 0x2020000000;
  double v141 = 0.0;
  [v24 appLaunchDecayHalflife];
  double v141 = v36 * 86400.0;
  v138[0] = 0;
  v138[1] = v138;
  v138[2] = 0x2020000000;
  double v139 = 0.0;
  [v24 slotResolutionPartOfWeekLaunchDecayHalflife];
  double v139 = v37 * 86400.0;
  v136[0] = 0;
  v136[1] = v136;
  v136[2] = 0x2020000000;
  double v137 = 0.0;
  [v24 appAndActionCoarseTimePowLocationDecayHalflife];
  double v137 = v38 * 86400.0;
  v134[0] = 0;
  v134[1] = v134;
  v134[2] = 0x2020000000;
  double v135 = 0.0;
  [v24 appAndActionSpecificTimePowLocationDecayHalflife];
  double v135 = v39 * 86400.0;
  v40 = objc_opt_new();
  v132[0] = 0;
  v132[1] = v132;
  v132[2] = 0x3032000000;
  v132[3] = __Block_byref_object_copy__33;
  v132[4] = __Block_byref_object_dispose__33;
  id v133 = 0;
  v41 = objc_opt_new();
  dataStore = self->_dataStore;
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __172__ATXSlotResolution_fastStatisticsOnSlotsForBundleId_actionType_currentDate_previousLocationUUID_currentLocationUUID_currentMotionType_currentGeohash_currentCoarseGeohash___block_invoke;
  v63[3] = &unk_1E68AF168;
  v73 = v209;
  v74 = v208;
  uint64_t v126 = v21;
  v75 = v207;
  v76 = v206;
  v77 = v205;
  v78 = v204;
  v79 = v203;
  v80 = v201;
  uint64_t v127 = v23;
  id v53 = v56;
  id v64 = v53;
  v81 = v171;
  v82 = v195;
  id v52 = v58;
  id v65 = v52;
  v83 = v199;
  uint64_t v128 = v22;
  v84 = v198;
  v85 = v197;
  int64_t v129 = a8;
  v86 = v193;
  v87 = v191;
  id v43 = v59;
  v88 = v190;
  v89 = v189;
  v90 = v187;
  v91 = v186;
  v92 = v184;
  v93 = v182;
  v94 = v181;
  v95 = v179;
  id v66 = v43;
  v67 = self;
  int64_t v131 = a9;
  v96 = v175;
  v97 = v173;
  v98 = v178;
  v99 = v177;
  int64_t v130 = a10;
  v100 = v170;
  id v44 = v60;
  v101 = v169;
  v102 = v156;
  v103 = v168;
  v104 = v154;
  v105 = v167;
  v106 = v152;
  v107 = v166;
  v108 = v150;
  v109 = v165;
  v110 = v148;
  v111 = v164;
  v112 = v146;
  v113 = v163;
  v114 = v144;
  v115 = v162;
  v116 = v142;
  v117 = v161;
  v118 = v140;
  v119 = v160;
  v120 = v138;
  v121 = v159;
  v122 = v136;
  v123 = v158;
  v124 = v134;
  v125 = v132;
  id v68 = v44;
  id v69 = v41;
  id v45 = v40;
  id v70 = v45;
  id v46 = v54;
  id v71 = v46;
  id v47 = v55;
  id v72 = v47;
  id v48 = v41;
  [(_ATXDataStore *)dataStore enumerateSlotUuidsOfType:v61 bundleId:v62 block:v63];
  v49 = v72;
  id v50 = v46;

  _Block_object_dispose(v132, 8);
  _Block_object_dispose(v134, 8);
  _Block_object_dispose(v136, 8);
  _Block_object_dispose(v138, 8);
  _Block_object_dispose(v140, 8);
  _Block_object_dispose(v142, 8);
  _Block_object_dispose(v144, 8);
  _Block_object_dispose(v146, 8);
  _Block_object_dispose(v148, 8);
  _Block_object_dispose(v150, 8);
  _Block_object_dispose(v152, 8);
  _Block_object_dispose(v154, 8);
  _Block_object_dispose(v156, 8);
  _Block_object_dispose(v158, 8);
  _Block_object_dispose(v159, 8);
  _Block_object_dispose(v160, 8);
  _Block_object_dispose(v161, 8);
  _Block_object_dispose(v162, 8);
  _Block_object_dispose(v163, 8);
  _Block_object_dispose(v164, 8);
  _Block_object_dispose(v165, 8);
  _Block_object_dispose(v166, 8);
  _Block_object_dispose(v167, 8);
  _Block_object_dispose(v168, 8);
  _Block_object_dispose(v169, 8);
  _Block_object_dispose(v170, 8);
  _Block_object_dispose(v171, 8);
  _Block_object_dispose(v173, 8);
  _Block_object_dispose(v175, 8);
  _Block_object_dispose(v177, 8);
  _Block_object_dispose(v178, 8);
  _Block_object_dispose(v179, 8);
  _Block_object_dispose(v181, 8);
  _Block_object_dispose(v182, 8);
  _Block_object_dispose(v184, 8);
  _Block_object_dispose(v186, 8);
  _Block_object_dispose(v187, 8);
  _Block_object_dispose(v189, 8);
  _Block_object_dispose(v190, 8);
  _Block_object_dispose(v191, 8);
  _Block_object_dispose(v193, 8);
  _Block_object_dispose(v195, 8);
  _Block_object_dispose(v197, 8);
  _Block_object_dispose(v198, 8);
  _Block_object_dispose(v199, 8);
  _Block_object_dispose(v201, 8);
  _Block_object_dispose(v203, 8);
  _Block_object_dispose(v204, 8);
  _Block_object_dispose(v205, 8);
  _Block_object_dispose(v206, 8);
  _Block_object_dispose(v207, 8);
  _Block_object_dispose(v208, 8);
  _Block_object_dispose(v209, 8);

  return v50;
}

uint64_t __172__ATXSlotResolution_fastStatisticsOnSlotsForBundleId_actionType_currentDate_previousLocationUUID_currentLocationUUID_currentMotionType_currentGeohash_currentCoarseGeohash___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, void *a8, double a9, uint64_t a10, uint64_t a11, void *a12, void *a13, uint64_t a14, void *a15, void *a16, uint64_t a17, uint64_t a18)
{
  uint64_t v269 = *MEMORY[0x1E4F143B8];
  id v262 = a2;
  id v259 = a7;
  id v264 = a8;
  id v261 = a12;
  id v260 = a13;
  id v258 = a15;
  id v257 = a16;
  if (*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) != a3)
  {
    +[ATXSlotResolutionParametersStatistics _smoothedCountForTimeOfDay:a10 currentTimeOfDay:*(void *)(a1 + 528)];
    *(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = v24;
    +[ATXSlotResolutionParametersStatistics _smoothedCountForThirtyMinuteWindow:a10 currentTimeOfDay:*(void *)(a1 + 528)];
    *(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 24) = v25;
    +[ATXSlotResolutionParametersStatistics _smoothedCountForHourWindow:a10 currentTimeOfDay:*(void *)(a1 + 528)];
    *(void *)(*(void *)(*(void *)(a1 + 128) + 8) + 24) = v26;
    +[ATXSlotResolutionParametersStatistics _smoothedCountForEightHourWindow:a10 currentTimeOfDay:*(void *)(a1 + 528)];
    *(void *)(*(void *)(*(void *)(a1 + 136) + 8) + 24) = v27;
    +[ATXSlotResolutionParametersStatistics _smoothedCountForCoarseTimeOfDay:a10 currentTimeOfDay:*(void *)(a1 + 528)];
    *(void *)(*(void *)(*(void *)(a1 + 144) + 8) + 24) = v28;
    +[ATXSlotResolutionParametersStatistics _smoothedBudgetForTimeOfDay:a10 currentTimeOfDay:*(void *)(a1 + 528)];
    *(void *)(*(void *)(*(void *)(a1 + 152) + 8) + 24) = v29;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 160) + 8) + 24) = *(void *)(a1 + 536) == a11;
    int v30 = [*(id *)(a1 + 32) isDateInWeekend:v264];
    *(_DWORD *)(*(void *)(*(void *)(a1 + 168) + 8) + 24) = +[_ATXActionUtils timeBucketFromZeroToTwentyFour:a10];
    if (*(void *)(a1 + 40)) {
      int v31 = objc_msgSend(v260, "isEqual:");
    }
    else {
      int v31 = 0;
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 176) + 8) + 24) = v31;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 184) + 8) + 24) = *(void *)(a1 + 544) == v30;
    int v32 = *(_DWORD *)(*(void *)(*(void *)(a1 + 184) + 8) + 24);
    double v33 = 0.0;
    double v34 = 0.0;
    if (v32)
    {
      int v35 = *(_DWORD *)(*(void *)(*(void *)(a1 + 176) + 8) + 24);
      if (v35) {
        double v34 = (double)(v35 + v32) * 0.5;
      }
    }
    *(double *)(*(void *)(*(void *)(a1 + 192) + 8) + 24) = v34;
    double v36 = *(double *)(*(void *)(*(void *)(a1 + 144) + 8) + 24);
    if (v36 != 0.0)
    {
      int v37 = *(_DWORD *)(*(void *)(*(void *)(a1 + 184) + 8) + 24);
      if (v37) {
        double v33 = (v36 + (double)v37) * 0.5;
      }
    }
    *(double *)(*(void *)(*(void *)(a1 + 200) + 8) + 24) = v33;
    BOOL v38 = a14 != 4 && *(void *)(a1 + 552) == a14;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 208) + 8) + 24) = v38;
    if (v261) {
      int v39 = [v261 isEqual:*(void *)(a1 + 48)];
    }
    else {
      int v39 = 0;
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 216) + 8) + 24) = v39;
    double v40 = *(double *)(*(void *)(*(void *)(a1 + 144) + 8) + 24);
    double v41 = 0.0;
    double v42 = 0.0;
    if (v40 != 0.0)
    {
      int v43 = *(_DWORD *)(*(void *)(*(void *)(a1 + 160) + 8) + 24);
      if (v43) {
        double v42 = (v40 + (double)v43) * 0.5;
      }
    }
    *(double *)(*(void *)(*(void *)(a1 + 224) + 8) + 24) = v42;
    double v44 = *(double *)(*(void *)(*(void *)(a1 + 144) + 8) + 24);
    if (v44 != 0.0)
    {
      int v45 = *(_DWORD *)(*(void *)(*(void *)(a1 + 176) + 8) + 24);
      if (v45) {
        double v41 = (v44 + (double)v45) * 0.5;
      }
    }
    *(double *)(*(void *)(*(void *)(a1 + 232) + 8) + 24) = v41;
    int v46 = *(_DWORD *)(*(void *)(*(void *)(a1 + 160) + 8) + 24);
    double v47 = 0.0;
    double v48 = 0.0;
    if (v46)
    {
      int v49 = *(_DWORD *)(*(void *)(*(void *)(a1 + 176) + 8) + 24);
      if (v49) {
        double v48 = (double)(v49 + v46) * 0.5;
      }
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 240) + 8) + 24) = (int)v48;
    double v50 = *(double *)(*(void *)(*(void *)(a1 + 144) + 8) + 24);
    if (v50 != 0.0)
    {
      int v51 = *(_DWORD *)(*(void *)(*(void *)(a1 + 160) + 8) + 24);
      if (v51)
      {
        int v52 = *(_DWORD *)(*(void *)(*(void *)(a1 + 176) + 8) + 24);
        if (v52) {
          double v47 = (v50 + (double)v51 + (double)v52) / 3.0;
        }
      }
    }
    *(double *)(*(void *)(*(void *)(a1 + 248) + 8) + 24) = v47;
    int v53 = *(_DWORD *)(*(void *)(*(void *)(a1 + 216) + 8) + 24);
    double v54 = 0.0;
    double v55 = 0.0;
    if (v53)
    {
      int v56 = *(_DWORD *)(*(void *)(*(void *)(a1 + 208) + 8) + 24);
      if (v56) {
        double v55 = (double)(v56 + v53) * 0.5;
      }
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 256) + 8) + 24) = (int)v55;
    int v57 = *(_DWORD *)(*(void *)(*(void *)(a1 + 216) + 8) + 24);
    if (v57)
    {
      int v58 = *(_DWORD *)(*(void *)(*(void *)(a1 + 176) + 8) + 24);
      if (v58) {
        double v54 = (double)(v58 + v57) * 0.5;
      }
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 264) + 8) + 24) = (int)v54;
    double v59 = *(double *)(*(void *)(*(void *)(a1 + 144) + 8) + 24);
    double v60 = 0.0;
    double v61 = 0.0;
    if (v59 != 0.0)
    {
      int v62 = *(_DWORD *)(*(void *)(*(void *)(a1 + 216) + 8) + 24);
      if (v62) {
        double v61 = (v59 + (double)v62) * 0.5;
      }
    }
    *(double *)(*(void *)(*(void *)(a1 + 272) + 8) + 24) = v61;
    int v63 = *(_DWORD *)(*(void *)(*(void *)(a1 + 160) + 8) + 24);
    if (v63)
    {
      int v64 = *(_DWORD *)(*(void *)(*(void *)(a1 + 216) + 8) + 24);
      if (v64) {
        double v60 = (double)(v64 + v63) * 0.5;
      }
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 280) + 8) + 24) = (int)v60;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 288) + 8) + 24) = [(id)objc_opt_class() matchForCurrentGeohash:*(void *)(a1 + 560) rowGeohash:a18];
    *(_DWORD *)(*(void *)(*(void *)(a1 + 296) + 8) + 24) = [(id)objc_opt_class() matchForCurrentGeohash:*(void *)(a1 + 568) rowGeohash:a17];
    double v65 = *(double *)(*(void *)(*(void *)(a1 + 144) + 8) + 24);
    double v66 = 0.0;
    double v67 = 0.0;
    if (v65 != 0.0)
    {
      int v68 = *(_DWORD *)(*(void *)(*(void *)(a1 + 184) + 8) + 24);
      if (v68)
      {
        int v69 = *(_DWORD *)(*(void *)(*(void *)(a1 + 288) + 8) + 24);
        if (v69) {
          double v67 = (v65 + (double)v68 + (double)v69) / 3.0;
        }
      }
    }
    *(double *)(*(void *)(*(void *)(a1 + 304) + 8) + 24) = v67;
    double v70 = *(double *)(*(void *)(*(void *)(a1 + 120) + 8) + 24);
    if (v70 != 0.0)
    {
      int v71 = *(_DWORD *)(*(void *)(*(void *)(a1 + 160) + 8) + 24);
      if (v71)
      {
        int v72 = *(_DWORD *)(*(void *)(*(void *)(a1 + 296) + 8) + 24);
        if (v72) {
          double v66 = (v70 + (double)v71 + (double)v72) / 3.0;
        }
      }
    }
    *(double *)(*(void *)(*(void *)(a1 + 312) + 8) + 24) = v66;
    [*(id *)(a1 + 64) timeIntervalSinceDate:v264];
    *(void *)(*(void *)(*(void *)(a1 + 320) + 8) + 24) = v73;
    +[ATXSlotResolution exponentialDecay:*(double *)(*(void *)(*(void *)(a1 + 320) + 8) + 24) withHalflife:*(double *)(*(void *)(*(void *)(a1 + 336) + 8) + 24)];
    *(void *)(*(void *)(*(void *)(a1 + 328) + 8) + 24) = v74;
    +[ATXSlotResolution exponentialDecay:*(double *)(*(void *)(*(void *)(a1 + 320) + 8) + 24) withHalflife:*(double *)(*(void *)(*(void *)(a1 + 352) + 8) + 24)];
    *(void *)(*(void *)(*(void *)(a1 + 344) + 8) + 24) = v75;
    +[ATXSlotResolution exponentialDecay:*(double *)(*(void *)(*(void *)(a1 + 320) + 8) + 24) withHalflife:*(double *)(*(void *)(*(void *)(a1 + 368) + 8) + 24)];
    *(void *)(*(void *)(*(void *)(a1 + 360) + 8) + 24) = v76;
    +[ATXSlotResolution exponentialDecay:*(double *)(*(void *)(*(void *)(a1 + 320) + 8) + 24) withHalflife:*(double *)(*(void *)(*(void *)(a1 + 384) + 8) + 24)];
    *(void *)(*(void *)(*(void *)(a1 + 376) + 8) + 24) = v77;
    +[ATXSlotResolution exponentialDecay:*(double *)(*(void *)(*(void *)(a1 + 320) + 8) + 24) withHalflife:*(double *)(*(void *)(*(void *)(a1 + 400) + 8) + 24)];
    *(void *)(*(void *)(*(void *)(a1 + 392) + 8) + 24) = v78;
    +[ATXSlotResolution exponentialDecay:*(double *)(*(void *)(*(void *)(a1 + 320) + 8) + 24) withHalflife:*(double *)(*(void *)(*(void *)(a1 + 416) + 8) + 24)];
    *(void *)(*(void *)(*(void *)(a1 + 408) + 8) + 24) = v79;
    +[ATXSlotResolution exponentialDecay:*(double *)(*(void *)(*(void *)(a1 + 320) + 8) + 24) withHalflife:*(double *)(*(void *)(*(void *)(a1 + 432) + 8) + 24)];
    *(void *)(*(void *)(*(void *)(a1 + 424) + 8) + 24) = v80;
    +[ATXSlotResolution exponentialDecay:*(double *)(*(void *)(*(void *)(a1 + 320) + 8) + 24) withHalflife:*(double *)(*(void *)(*(void *)(a1 + 448) + 8) + 24)];
    *(void *)(*(void *)(*(void *)(a1 + 440) + 8) + 24) = v81;
    +[ATXSlotResolution exponentialDecay:*(double *)(*(void *)(*(void *)(a1 + 320) + 8) + 24) withHalflife:*(double *)(*(void *)(*(void *)(a1 + 464) + 8) + 24)];
    *(void *)(*(void *)(*(void *)(a1 + 456) + 8) + 24) = v82;
    +[ATXSlotResolution exponentialDecay:*(double *)(*(void *)(*(void *)(a1 + 320) + 8) + 24) withHalflife:*(double *)(*(void *)(*(void *)(a1 + 480) + 8) + 24)];
    *(void *)(*(void *)(*(void *)(a1 + 472) + 8) + 24) = v83;
    +[ATXSlotResolution exponentialDecay:*(double *)(*(void *)(*(void *)(a1 + 320) + 8) + 24) withHalflife:*(double *)(*(void *)(*(void *)(a1 + 496) + 8) + 24)];
    *(void *)(*(void *)(*(void *)(a1 + 488) + 8) + 24) = v84;
    +[ATXSlotResolution exponentialDecay:*(double *)(*(void *)(*(void *)(a1 + 320) + 8) + 24) withHalflife:*(double *)(*(void *)(*(void *)(a1 + 512) + 8) + 24)];
    *(void *)(*(void *)(*(void *)(a1 + 504) + 8) + 24) = v85;
    uint64_t v86 = +[ATXSlotResolution yearMonthDayComponentsForDate:v264];
    uint64_t v87 = *(void *)(*(void *)(a1 + 520) + 8);
    v88 = *(void **)(v87 + 40);
    *(void *)(v87 + 40) = v86;

    *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = a3;
    [*(id *)(a1 + 72) removeAllObjects];
  }
  int v89 = [(id)objc_opt_class() shouldCountRowForGeohashOccurrencesCalculationForCurrentGeohash:*(void *)(a1 + 560) rowGeohash:a18];
  int v90 = [(id)objc_opt_class() shouldCountRowForGeohashOccurrencesCalculationForCurrentGeohash:*(void *)(a1 + 568) rowGeohash:a17];
  int v255 = [(id)objc_opt_class() shouldCountRowForGeohashIndividualContextStatistics:*(void *)(a1 + 560) rowGeohash:a18];
  int v254 = [(id)objc_opt_class() shouldCountRowForGeohashIndividualContextStatistics:*(void *)(a1 + 568) rowGeohash:a17];
  v91 = *(void **)(a1 + 80);
  v92 = [NSNumber numberWithLongLong:a3];
  LOBYTE(v91) = [v91 containsObject:v92];

  if ((v91 & 1) == 0)
  {
    *(double *)(*(void *)(a1 + 88) + 48) = *(double *)(*(void *)(a1 + 88) + 48)
                                             + *(double *)(*(void *)(*(void *)(a1 + 344) + 8) + 24)
                                             * a9
                                             * *(double *)(*(void *)(*(void *)(a1 + 112) + 8) + 24);
    *(double *)(*(void *)(a1 + 88) + 56) = *(double *)(*(void *)(a1 + 88) + 56)
                                             + *(double *)(*(void *)(*(void *)(a1 + 344) + 8) + 24)
                                             * a9
                                             * *(double *)(*(void *)(*(void *)(a1 + 120) + 8) + 24);
    *(double *)(*(void *)(a1 + 88) + 64) = *(double *)(*(void *)(a1 + 88) + 64)
                                             + *(double *)(*(void *)(*(void *)(a1 + 344) + 8) + 24)
                                             * a9
                                             * *(double *)(*(void *)(*(void *)(a1 + 128) + 8) + 24);
    *(double *)(*(void *)(a1 + 88) + 72) = *(double *)(*(void *)(a1 + 88) + 72)
                                             + *(double *)(*(void *)(*(void *)(a1 + 344) + 8) + 24)
                                             * a9
                                             * *(double *)(*(void *)(*(void *)(a1 + 136) + 8) + 24);
    *(double *)(*(void *)(a1 + 88) + 80) = *(double *)(*(void *)(a1 + 88) + 80)
                                             + *(double *)(*(void *)(*(void *)(a1 + 344) + 8) + 24)
                                             * a9
                                             * *(double *)(*(void *)(*(void *)(a1 + 144) + 8) + 24);
    *(double *)(*(void *)(a1 + 88) + 88) = *(double *)(*(void *)(a1 + 88) + 88)
                                             + *(double *)(*(void *)(*(void *)(a1 + 360) + 8) + 24)
                                             * a9
                                             * (double)*(int *)(*(void *)(*(void *)(a1 + 160) + 8) + 24);
    *(double *)(*(void *)(a1 + 88) + 96) = *(double *)(*(void *)(a1 + 88) + 96)
                                             + *(double *)(*(void *)(*(void *)(a1 + 472) + 8) + 24)
                                             * a9
                                             * (double)*(int *)(*(void *)(*(void *)(a1 + 184) + 8) + 24);
    double v93 = *(double *)(*(void *)(*(void *)(a1 + 472) + 8) + 24);
    uint64_t v94 = *(void *)(*(void *)(a1 + 376) + 8);
    if (v93 < *(double *)(v94 + 24)) {
      double v93 = *(double *)(v94 + 24);
    }
    *(double *)(*(void *)(a1 + 88) + 296) = *(double *)(*(void *)(a1 + 88) + 296)
                                              + v93 * a9 * *(double *)(*(void *)(*(void *)(a1 + 192) + 8) + 24);
    double v95 = *(double *)(*(void *)(*(void *)(a1 + 472) + 8) + 24);
    uint64_t v96 = *(void *)(*(void *)(a1 + 344) + 8);
    if (v95 < *(double *)(v96 + 24)) {
      double v95 = *(double *)(v96 + 24);
    }
    *(double *)(*(void *)(a1 + 88) + 304) = *(double *)(*(void *)(a1 + 88) + 304)
                                              + v95 * a9 * *(double *)(*(void *)(*(void *)(a1 + 200) + 8) + 24);
    *(double *)(*(void *)(a1 + 88) + 104) = *(double *)(*(void *)(a1 + 88) + 104)
                                              + *(double *)(*(void *)(*(void *)(a1 + 376) + 8) + 24)
                                              * a9
                                              * (double)*(int *)(*(void *)(*(void *)(a1 + 176) + 8) + 24);
    *(double *)(*(void *)(a1 + 88) + 120) = *(double *)(*(void *)(a1 + 88) + 120)
                                              + *(double *)(*(void *)(*(void *)(a1 + 424) + 8) + 24)
                                              * a9
                                              * (double)*(int *)(*(void *)(*(void *)(a1 + 216) + 8) + 24);
    *(double *)(*(void *)(a1 + 88) + 112) = *(double *)(*(void *)(a1 + 88) + 112)
                                              + *(double *)(*(void *)(*(void *)(a1 + 440) + 8) + 24)
                                              * a9
                                              * (double)*(int *)(*(void *)(*(void *)(a1 + 208) + 8) + 24);
    double v97 = *(double *)(*(void *)(*(void *)(a1 + 344) + 8) + 24);
    uint64_t v98 = *(void *)(*(void *)(a1 + 360) + 8);
    if (v97 < *(double *)(v98 + 24)) {
      double v97 = *(double *)(v98 + 24);
    }
    *(double *)(*(void *)(a1 + 88) + 240) = *(double *)(*(void *)(a1 + 88) + 240)
                                              + v97 * a9 * *(double *)(*(void *)(*(void *)(a1 + 224) + 8) + 24);
    double v99 = *(double *)(*(void *)(*(void *)(a1 + 344) + 8) + 24);
    uint64_t v100 = *(void *)(*(void *)(a1 + 376) + 8);
    if (v99 < *(double *)(v100 + 24)) {
      double v99 = *(double *)(v100 + 24);
    }
    *(double *)(*(void *)(a1 + 88) + 232) = *(double *)(*(void *)(a1 + 88) + 232)
                                              + v99 * a9 * *(double *)(*(void *)(*(void *)(a1 + 232) + 8) + 24);
    double v101 = *(double *)(*(void *)(*(void *)(a1 + 360) + 8) + 24);
    uint64_t v102 = *(void *)(*(void *)(a1 + 376) + 8);
    if (v101 < *(double *)(v102 + 24)) {
      double v101 = *(double *)(v102 + 24);
    }
    *(double *)(*(void *)(a1 + 88) + 248) = *(double *)(*(void *)(a1 + 88) + 248)
                                              + v101
                                              * a9
                                              * (double)*(int *)(*(void *)(*(void *)(a1 + 240) + 8) + 24);
    double v103 = *(double *)(*(void *)(*(void *)(a1 + 344) + 8) + 24);
    double v104 = *(double *)(*(void *)(*(void *)(a1 + 360) + 8) + 24);
    uint64_t v105 = *(void *)(*(void *)(a1 + 376) + 8);
    if (v104 < *(double *)(v105 + 24)) {
      double v104 = *(double *)(v105 + 24);
    }
    if (v103 < v104) {
      double v103 = v104;
    }
    *(double *)(*(void *)(a1 + 88) + 256) = *(double *)(*(void *)(a1 + 88) + 256)
                                              + v103 * a9 * *(double *)(*(void *)(*(void *)(a1 + 248) + 8) + 24);
    double v106 = *(double *)(*(void *)(*(void *)(a1 + 424) + 8) + 24);
    uint64_t v107 = *(void *)(*(void *)(a1 + 440) + 8);
    if (v106 < *(double *)(v107 + 24)) {
      double v106 = *(double *)(v107 + 24);
    }
    *(double *)(*(void *)(a1 + 88) + 264) = *(double *)(*(void *)(a1 + 88) + 264)
                                              + v106
                                              * a9
                                              * (double)*(int *)(*(void *)(*(void *)(a1 + 256) + 8) + 24);
    double v108 = *(double *)(*(void *)(*(void *)(a1 + 424) + 8) + 24);
    uint64_t v109 = *(void *)(*(void *)(a1 + 376) + 8);
    if (v108 < *(double *)(v109 + 24)) {
      double v108 = *(double *)(v109 + 24);
    }
    *(double *)(*(void *)(a1 + 88) + 272) = *(double *)(*(void *)(a1 + 88) + 272)
                                              + v108
                                              * a9
                                              * (double)*(int *)(*(void *)(*(void *)(a1 + 264) + 8) + 24);
    double v110 = *(double *)(*(void *)(*(void *)(a1 + 344) + 8) + 24);
    uint64_t v111 = *(void *)(*(void *)(a1 + 424) + 8);
    if (v110 < *(double *)(v111 + 24)) {
      double v110 = *(double *)(v111 + 24);
    }
    *(double *)(*(void *)(a1 + 88) + 280) = *(double *)(*(void *)(a1 + 88) + 280)
                                              + v110 * a9 * *(double *)(*(void *)(*(void *)(a1 + 272) + 8) + 24);
    double v112 = *(double *)(*(void *)(*(void *)(a1 + 360) + 8) + 24);
    uint64_t v113 = *(void *)(*(void *)(a1 + 424) + 8);
    if (v112 < *(double *)(v113 + 24)) {
      double v112 = *(double *)(v113 + 24);
    }
    *(double *)(*(void *)(a1 + 88) + 288) = *(double *)(*(void *)(a1 + 88) + 288)
                                              + v112
                                              * a9
                                              * (double)*(int *)(*(void *)(*(void *)(a1 + 280) + 8) + 24);
    *(double *)(*(void *)(a1 + 88) + 440) = *(double *)(*(void *)(a1 + 88) + 440)
                                              + *(double *)(*(void *)(*(void *)(a1 + 488) + 8) + 24)
                                              * a9
                                              * *(double *)(*(void *)(*(void *)(a1 + 304) + 8) + 24);
    *(double *)(*(void *)(a1 + 88) + 488) = *(double *)(*(void *)(a1 + 88) + 488)
                                              + *(double *)(*(void *)(*(void *)(a1 + 504) + 8) + 24)
                                              * a9
                                              * *(double *)(*(void *)(*(void *)(a1 + 312) + 8) + 24);
    *(double *)(*(void *)(a1 + 88) + 312) = *(double *)(*(void *)(a1 + 88) + 312)
                                              + a9 * *(double *)(*(void *)(*(void *)(a1 + 344) + 8) + 24);
    *(double *)(*(void *)(a1 + 88) + 320) = *(double *)(*(void *)(a1 + 88) + 320)
                                              + a9 * *(double *)(*(void *)(*(void *)(a1 + 360) + 8) + 24);
    *(double *)(*(void *)(a1 + 88) + 328) = *(double *)(*(void *)(a1 + 88) + 328)
                                              + a9 * *(double *)(*(void *)(*(void *)(a1 + 376) + 8) + 24);
    *(double *)(*(void *)(a1 + 88) + 336) = *(double *)(*(void *)(a1 + 88) + 336)
                                              + a9 * *(double *)(*(void *)(*(void *)(a1 + 440) + 8) + 24);
    *(double *)(*(void *)(a1 + 88) + 344) = *(double *)(*(void *)(a1 + 88) + 344)
                                              + a9 * *(double *)(*(void *)(*(void *)(a1 + 424) + 8) + 24);
    *(double *)(*(void *)(a1 + 88) + 352) = *(double *)(*(void *)(a1 + 88) + 352)
                                              + a9 * *(double *)(*(void *)(*(void *)(a1 + 472) + 8) + 24);
    double v114 = *(double *)(*(void *)(*(void *)(a1 + 344) + 8) + 24);
    if (v114 < *(double *)(*(void *)(*(void *)(a1 + 360) + 8) + 24)) {
      double v114 = *(double *)(*(void *)(*(void *)(a1 + 360) + 8) + 24);
    }
    *(double *)(*(void *)(a1 + 88) + 360) = *(double *)(*(void *)(a1 + 88) + 360) + a9 * v114;
    double v115 = *(double *)(*(void *)(*(void *)(a1 + 344) + 8) + 24);
    uint64_t v116 = *(void *)(*(void *)(a1 + 376) + 8);
    if (v115 < *(double *)(v116 + 24)) {
      double v115 = *(double *)(v116 + 24);
    }
    *(double *)(*(void *)(a1 + 88) + 368) = *(double *)(*(void *)(a1 + 88) + 368) + a9 * v115;
    double v117 = *(double *)(*(void *)(*(void *)(a1 + 360) + 8) + 24);
    uint64_t v118 = *(void *)(*(void *)(a1 + 376) + 8);
    if (v117 < *(double *)(v118 + 24)) {
      double v117 = *(double *)(v118 + 24);
    }
    *(double *)(*(void *)(a1 + 88) + 376) = *(double *)(*(void *)(a1 + 88) + 376) + a9 * v117;
    double v119 = *(double *)(*(void *)(*(void *)(a1 + 344) + 8) + 24);
    double v120 = *(double *)(*(void *)(*(void *)(a1 + 360) + 8) + 24);
    uint64_t v121 = *(void *)(*(void *)(a1 + 376) + 8);
    if (v120 < *(double *)(v121 + 24)) {
      double v120 = *(double *)(v121 + 24);
    }
    if (v119 < v120) {
      double v119 = v120;
    }
    *(double *)(*(void *)(a1 + 88) + 384) = *(double *)(*(void *)(a1 + 88) + 384) + a9 * v119;
    double v122 = *(double *)(*(void *)(*(void *)(a1 + 424) + 8) + 24);
    uint64_t v123 = *(void *)(*(void *)(a1 + 376) + 8);
    if (v122 < *(double *)(v123 + 24)) {
      double v122 = *(double *)(v123 + 24);
    }
    *(double *)(*(void *)(a1 + 88) + 392) = *(double *)(*(void *)(a1 + 88) + 392) + a9 * v122;
    double v124 = *(double *)(*(void *)(*(void *)(a1 + 424) + 8) + 24);
    uint64_t v125 = *(void *)(*(void *)(a1 + 440) + 8);
    if (v124 < *(double *)(v125 + 24)) {
      double v124 = *(double *)(v125 + 24);
    }
    *(double *)(*(void *)(a1 + 88) + 400) = *(double *)(*(void *)(a1 + 88) + 400) + a9 * v124;
    double v126 = *(double *)(*(void *)(*(void *)(a1 + 344) + 8) + 24);
    uint64_t v127 = *(void *)(*(void *)(a1 + 424) + 8);
    if (v126 < *(double *)(v127 + 24)) {
      double v126 = *(double *)(v127 + 24);
    }
    *(double *)(*(void *)(a1 + 88) + 408) = *(double *)(*(void *)(a1 + 88) + 408) + a9 * v126;
    double v128 = *(double *)(*(void *)(*(void *)(a1 + 360) + 8) + 24);
    uint64_t v129 = *(void *)(*(void *)(a1 + 424) + 8);
    if (v128 < *(double *)(v129 + 24)) {
      double v128 = *(double *)(v129 + 24);
    }
    *(double *)(*(void *)(a1 + 88) + 416) = *(double *)(*(void *)(a1 + 88) + 416) + a9 * v128;
    double v130 = *(double *)(*(void *)(*(void *)(a1 + 472) + 8) + 24);
    uint64_t v131 = *(void *)(*(void *)(a1 + 376) + 8);
    if (v130 < *(double *)(v131 + 24)) {
      double v130 = *(double *)(v131 + 24);
    }
    *(double *)(*(void *)(a1 + 88) + 424) = *(double *)(*(void *)(a1 + 88) + 424) + a9 * v130;
    double v132 = *(double *)(*(void *)(*(void *)(a1 + 472) + 8) + 24);
    uint64_t v133 = *(void *)(*(void *)(a1 + 344) + 8);
    if (v132 < *(double *)(v133 + 24)) {
      double v132 = *(double *)(v133 + 24);
    }
    *(double *)(*(void *)(a1 + 88) + 432) = *(double *)(*(void *)(a1 + 88) + 432) + a9 * v132;
    if (v89) {
      *(double *)(*(void *)(a1 + 88) + 448) = *(double *)(*(void *)(a1 + 88) + 448)
    }
                                                + a9 * *(double *)(*(void *)(*(void *)(a1 + 488) + 8) + 24);
    if (v90) {
      *(double *)(*(void *)(a1 + 88) + 496) = *(double *)(*(void *)(a1 + 88) + 496)
    }
                                                + a9 * *(double *)(*(void *)(*(void *)(a1 + 504) + 8) + 24);
    if (v255) {
      *(double *)(*(void *)(a1 + 88) + 544) = *(double *)(*(void *)(a1 + 88) + 544)
    }
                                                + *(double *)(*(void *)(*(void *)(a1 + 408) + 8) + 24)
                                                * a9
                                                * (double)*(int *)(*(void *)(*(void *)(a1 + 288) + 8) + 24);
    if (v254) {
      *(double *)(*(void *)(a1 + 88) + 552) = *(double *)(*(void *)(a1 + 88) + 552)
    }
                                                + *(double *)(*(void *)(*(void *)(a1 + 392) + 8) + 24)
                                                * a9
                                                * (double)*(int *)(*(void *)(*(void *)(a1 + 296) + 8) + 24);
    *(double *)(*(void *)(a1 + 88) + 536) = *(double *)(*(void *)(a1 + 88) + 536)
                                              + *(double *)(*(void *)(*(void *)(a1 + 360) + 8) + 24)
                                              * a9
                                              * (double)*(int *)(*(void *)(*(void *)(a1 + 160) + 8) + 24);
    *(double *)(*(void *)(a1 + 88) + 560) = *(double *)(*(void *)(a1 + 88) + 560)
                                              + *(double *)(*(void *)(*(void *)(a1 + 344) + 8) + 24)
                                              * a9
                                              * *(double *)(*(void *)(*(void *)(a1 + 128) + 8) + 24);
    *(double *)(*(void *)(a1 + 88) + 32) = *(double *)(*(void *)(a1 + 88) + 32)
                                             + a9 * *(double *)(*(void *)(*(void *)(a1 + 328) + 8) + 24);
    [*(id *)(*(void *)(a1 + 88) + 128) addObject:*(void *)(*(void *)(*(void *)(a1 + 520) + 8) + 40)];
    v134 = *(void **)(a1 + 80);
    double v135 = [NSNumber numberWithLongLong:a3];
    [v134 addObject:v135];
  }
  v136 = [[ATXMinimalSlotResolutionParameters alloc] initWithParameterHash:a4 slotHash:a5 uuid:v262 paramCount:a6];
  if ([*(id *)(a1 + 72) containsObject:v136])
  {
    double v137 = __atxlog_handle_action_prediction();
    if (os_log_type_enabled(v137, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v266 = v259;
      __int16 v267 = 2048;
      uint64_t v268 = a3;
      _os_log_impl(&dword_1D0FA3000, v137, OS_LOG_TYPE_DEFAULT, "Skipping previously encountered parameter combination for actionType: %@ alogRowID: %lld", buf, 0x16u);
    }

    v138 = v258;
    goto LABEL_194;
  }
  [*(id *)(a1 + 72) addObject:v136];
  double v139 = [*(id *)(*(void *)(a1 + 88) + 16) objectForKey:v136];

  if (!v139)
  {
    v140 = *(void **)(*(void *)(a1 + 88) + 16);
    double v141 = [[ATXSlotResolutionParametersStatistics alloc] initWithNumParameters:a6];
    [v140 setObject:v141 forKey:v136];

    ++*(_DWORD *)(*(void *)(a1 + 88) + 40);
  }
  uint64_t v142 = [*(id *)(*(void *)(a1 + 88) + 16) objectForKeyedSubscript:v136];
  uint64_t v143 = v142;
  ++*(_DWORD *)(v142 + 8);
  *(double *)(v142 + 16) = *(double *)(v142 + 16) + a9;
  *(double *)(v142 + 232) = *(double *)(v142 + 232) + a9 * *(double *)(*(void *)(*(void *)(a1 + 328) + 8) + 24);
  *(double *)(v142 + 240) = *(double *)(v142 + 240) + a9 * *(double *)(*(void *)(*(void *)(a1 + 344) + 8) + 24);
  *(double *)(v142 + 248) = *(double *)(v142 + 248) + a9 * *(double *)(*(void *)(*(void *)(a1 + 360) + 8) + 24);
  *(double *)(v142 + 256) = *(double *)(v142 + 256) + a9 * *(double *)(*(void *)(*(void *)(a1 + 472) + 8) + 24);
  *(double *)(v142 + 264) = *(double *)(v142 + 264) + a9 * *(double *)(*(void *)(*(void *)(a1 + 376) + 8) + 24);
  *(double *)(v142 + 272) = *(double *)(v142 + 272) + a9 * *(double *)(*(void *)(*(void *)(a1 + 424) + 8) + 24);
  *(double *)(v142 + 280) = *(double *)(v142 + 280) + a9 * *(double *)(*(void *)(*(void *)(a1 + 440) + 8) + 24);
  double v144 = *(double *)(*(void *)(*(void *)(a1 + 344) + 8) + 24);
  uint64_t v145 = *(void *)(*(void *)(a1 + 360) + 8);
  if (v144 < *(double *)(v145 + 24)) {
    double v144 = *(double *)(v145 + 24);
  }
  *(double *)(v142 + 288) = *(double *)(v142 + 288) + a9 * v144;
  double v146 = *(double *)(*(void *)(*(void *)(a1 + 344) + 8) + 24);
  uint64_t v147 = *(void *)(*(void *)(a1 + 376) + 8);
  if (v146 < *(double *)(v147 + 24)) {
    double v146 = *(double *)(v147 + 24);
  }
  *(double *)(v142 + 296) = *(double *)(v142 + 296) + a9 * v146;
  double v148 = *(double *)(*(void *)(*(void *)(a1 + 360) + 8) + 24);
  uint64_t v149 = *(void *)(*(void *)(a1 + 376) + 8);
  if (v148 < *(double *)(v149 + 24)) {
    double v148 = *(double *)(v149 + 24);
  }
  *(double *)(v142 + 304) = *(double *)(v142 + 304) + a9 * v148;
  double v150 = *(double *)(*(void *)(*(void *)(a1 + 344) + 8) + 24);
  double v151 = *(double *)(*(void *)(*(void *)(a1 + 360) + 8) + 24);
  uint64_t v152 = *(void *)(*(void *)(a1 + 376) + 8);
  if (v151 < *(double *)(v152 + 24)) {
    double v151 = *(double *)(v152 + 24);
  }
  if (v150 < v151) {
    double v150 = v151;
  }
  *(double *)(v142 + 312) = *(double *)(v142 + 312) + a9 * v150;
  double v153 = *(double *)(*(void *)(*(void *)(a1 + 424) + 8) + 24);
  if (v153 < *(double *)(*(void *)(*(void *)(a1 + 440) + 8) + 24)) {
    double v153 = *(double *)(*(void *)(*(void *)(a1 + 440) + 8) + 24);
  }
  *(double *)(v142 + 320) = *(double *)(v142 + 320) + a9 * v153;
  double v154 = *(double *)(*(void *)(*(void *)(a1 + 424) + 8) + 24);
  uint64_t v155 = *(void *)(*(void *)(a1 + 376) + 8);
  if (v154 < *(double *)(v155 + 24)) {
    double v154 = *(double *)(v155 + 24);
  }
  *(double *)(v142 + 328) = *(double *)(v142 + 328) + a9 * v154;
  double v156 = *(double *)(*(void *)(*(void *)(a1 + 344) + 8) + 24);
  uint64_t v157 = *(void *)(*(void *)(a1 + 424) + 8);
  if (v156 < *(double *)(v157 + 24)) {
    double v156 = *(double *)(v157 + 24);
  }
  *(double *)(v142 + 336) = *(double *)(v142 + 336) + a9 * v156;
  double v158 = *(double *)(*(void *)(*(void *)(a1 + 360) + 8) + 24);
  if (v158 < *(double *)(*(void *)(*(void *)(a1 + 424) + 8) + 24)) {
    double v158 = *(double *)(*(void *)(*(void *)(a1 + 424) + 8) + 24);
  }
  *(double *)(v142 + 344) = *(double *)(v142 + 344) + a9 * v158;
  double v159 = *(double *)(*(void *)(*(void *)(a1 + 472) + 8) + 24);
  uint64_t v160 = *(void *)(*(void *)(a1 + 376) + 8);
  if (v159 < *(double *)(v160 + 24)) {
    double v159 = *(double *)(v160 + 24);
  }
  *(double *)(v142 + 352) = *(double *)(v142 + 352) + a9 * v159;
  double v161 = *(double *)(*(void *)(*(void *)(a1 + 472) + 8) + 24);
  uint64_t v162 = *(void *)(*(void *)(a1 + 344) + 8);
  if (v161 < *(double *)(v162 + 24)) {
    double v161 = *(double *)(v162 + 24);
  }
  *(double *)(v142 + 360) = *(double *)(v142 + 360) + a9 * v161;
  v138 = v258;
  if (v89) {
    *(double *)(v142 + 648) = *(double *)(v142 + 648)
  }
                            + a9 * *(double *)(*(void *)(*(void *)(a1 + 488) + 8) + 24);
  if (v90) {
    *(double *)(v142 + 696) = *(double *)(v142 + 696)
  }
                            + a9 * *(double *)(*(void *)(*(void *)(a1 + 504) + 8) + 24);
  *(double *)(v142 + 368) = *(double *)(v142 + 368)
                          + *(double *)(*(void *)(*(void *)(a1 + 344) + 8) + 24)
                          * a9
                          * *(double *)(*(void *)(*(void *)(a1 + 112) + 8) + 24);
  *(double *)(v142 + 376) = *(double *)(v142 + 376)
                          + *(double *)(*(void *)(*(void *)(a1 + 344) + 8) + 24)
                          * a9
                          * *(double *)(*(void *)(*(void *)(a1 + 120) + 8) + 24);
  *(double *)(v142 + 384) = *(double *)(v142 + 384)
                          + *(double *)(*(void *)(*(void *)(a1 + 344) + 8) + 24)
                          * a9
                          * *(double *)(*(void *)(*(void *)(a1 + 128) + 8) + 24);
  *(double *)(v142 + 392) = *(double *)(v142 + 392)
                          + *(double *)(*(void *)(*(void *)(a1 + 344) + 8) + 24)
                          * a9
                          * *(double *)(*(void *)(*(void *)(a1 + 136) + 8) + 24);
  *(double *)(v142 + 400) = *(double *)(v142 + 400)
                          + *(double *)(*(void *)(*(void *)(a1 + 344) + 8) + 24)
                          * a9
                          * *(double *)(*(void *)(*(void *)(a1 + 144) + 8) + 24);
  *(double *)(v142 + 408) = *(double *)(v142 + 408)
                          + *(double *)(*(void *)(*(void *)(a1 + 360) + 8) + 24)
                          * a9
                          * (double)*(int *)(*(void *)(*(void *)(a1 + 160) + 8) + 24);
  *(double *)(v142 + 416) = *(double *)(v142 + 416)
                          + *(double *)(*(void *)(*(void *)(a1 + 472) + 8) + 24)
                          * a9
                          * (double)*(int *)(*(void *)(*(void *)(a1 + 184) + 8) + 24);
  double v163 = *(double *)(*(void *)(*(void *)(a1 + 472) + 8) + 24);
  uint64_t v164 = *(void *)(*(void *)(a1 + 376) + 8);
  if (v163 < *(double *)(v164 + 24)) {
    double v163 = *(double *)(v164 + 24);
  }
  *(double *)(v142 + 424) = *(double *)(v142 + 424)
                          + v163 * a9 * *(double *)(*(void *)(*(void *)(a1 + 192) + 8) + 24);
  double v165 = *(double *)(*(void *)(*(void *)(a1 + 472) + 8) + 24);
  uint64_t v166 = *(void *)(*(void *)(a1 + 344) + 8);
  if (v165 < *(double *)(v166 + 24)) {
    double v165 = *(double *)(v166 + 24);
  }
  *(double *)(v142 + 520) = *(double *)(v142 + 520)
                          + v165 * a9 * *(double *)(*(void *)(*(void *)(a1 + 200) + 8) + 24);
  *(double *)(v142 + 432) = *(double *)(v142 + 432)
                          + *(double *)(*(void *)(*(void *)(a1 + 376) + 8) + 24)
                          * a9
                          * (double)*(int *)(*(void *)(*(void *)(a1 + 176) + 8) + 24);
  *(double *)(v142 + 448) = *(double *)(v142 + 448)
                          + *(double *)(*(void *)(*(void *)(a1 + 424) + 8) + 24)
                          * a9
                          * (double)*(int *)(*(void *)(*(void *)(a1 + 216) + 8) + 24);
  *(double *)(v142 + 440) = *(double *)(v142 + 440)
                          + *(double *)(*(void *)(*(void *)(a1 + 440) + 8) + 24)
                          * a9
                          * (double)*(int *)(*(void *)(*(void *)(a1 + 208) + 8) + 24);
  double v167 = *(double *)(*(void *)(*(void *)(a1 + 344) + 8) + 24);
  uint64_t v168 = *(void *)(*(void *)(a1 + 360) + 8);
  if (v167 < *(double *)(v168 + 24)) {
    double v167 = *(double *)(v168 + 24);
  }
  *(double *)(v142 + 464) = *(double *)(v142 + 464)
                          + v167 * a9 * *(double *)(*(void *)(*(void *)(a1 + 224) + 8) + 24);
  double v169 = *(double *)(*(void *)(*(void *)(a1 + 344) + 8) + 24);
  uint64_t v170 = *(void *)(*(void *)(a1 + 376) + 8);
  if (v169 < *(double *)(v170 + 24)) {
    double v169 = *(double *)(v170 + 24);
  }
  *(double *)(v142 + 456) = *(double *)(v142 + 456)
                          + v169 * a9 * *(double *)(*(void *)(*(void *)(a1 + 232) + 8) + 24);
  double v171 = *(double *)(*(void *)(*(void *)(a1 + 360) + 8) + 24);
  uint64_t v172 = *(void *)(*(void *)(a1 + 376) + 8);
  if (v171 < *(double *)(v172 + 24)) {
    double v171 = *(double *)(v172 + 24);
  }
  *(double *)(v142 + 472) = *(double *)(v142 + 472)
                          + v171 * a9 * (double)*(int *)(*(void *)(*(void *)(a1 + 240) + 8) + 24);
  double v173 = *(double *)(*(void *)(*(void *)(a1 + 344) + 8) + 24);
  double v174 = *(double *)(*(void *)(*(void *)(a1 + 360) + 8) + 24);
  uint64_t v175 = *(void *)(*(void *)(a1 + 376) + 8);
  if (v174 < *(double *)(v175 + 24)) {
    double v174 = *(double *)(v175 + 24);
  }
  if (v173 < v174) {
    double v173 = v174;
  }
  *(double *)(v142 + 480) = *(double *)(v142 + 480)
                          + v173 * a9 * *(double *)(*(void *)(*(void *)(a1 + 248) + 8) + 24);
  double v176 = *(double *)(*(void *)(*(void *)(a1 + 424) + 8) + 24);
  uint64_t v177 = *(void *)(*(void *)(a1 + 440) + 8);
  if (v176 < *(double *)(v177 + 24)) {
    double v176 = *(double *)(v177 + 24);
  }
  *(double *)(v142 + 488) = *(double *)(v142 + 488)
                          + v176 * a9 * (double)*(int *)(*(void *)(*(void *)(a1 + 256) + 8) + 24);
  double v178 = *(double *)(*(void *)(*(void *)(a1 + 424) + 8) + 24);
  uint64_t v179 = *(void *)(*(void *)(a1 + 376) + 8);
  if (v178 < *(double *)(v179 + 24)) {
    double v178 = *(double *)(v179 + 24);
  }
  *(double *)(v142 + 496) = *(double *)(v142 + 496)
                          + v178 * a9 * (double)*(int *)(*(void *)(*(void *)(a1 + 264) + 8) + 24);
  double v180 = *(double *)(*(void *)(*(void *)(a1 + 344) + 8) + 24);
  uint64_t v181 = *(void *)(*(void *)(a1 + 424) + 8);
  if (v180 < *(double *)(v181 + 24)) {
    double v180 = *(double *)(v181 + 24);
  }
  *(double *)(v142 + 504) = *(double *)(v142 + 504)
                          + v180 * a9 * *(double *)(*(void *)(*(void *)(a1 + 272) + 8) + 24);
  double v182 = *(double *)(*(void *)(*(void *)(a1 + 360) + 8) + 24);
  uint64_t v183 = *(void *)(*(void *)(a1 + 424) + 8);
  if (v182 < *(double *)(v183 + 24)) {
    double v182 = *(double *)(v183 + 24);
  }
  *(double *)(v142 + 512) = *(double *)(v142 + 512)
                          + v182 * a9 * (double)*(int *)(*(void *)(*(void *)(a1 + 280) + 8) + 24);
  *(double *)(v142 + 640) = *(double *)(v142 + 640)
                          + *(double *)(*(void *)(*(void *)(a1 + 488) + 8) + 24)
                          * a9
                          * *(double *)(*(void *)(*(void *)(a1 + 304) + 8) + 24);
  *(double *)(v142 + 688) = *(double *)(v142 + 688)
                          + *(double *)(*(void *)(*(void *)(a1 + 504) + 8) + 24)
                          * a9
                          * *(double *)(*(void *)(*(void *)(a1 + 312) + 8) + 24);
  v184 = *(void **)(v142 + 1136);
  int v185 = [NSNumber numberWithInteger:a11];
  v186 = [v184 objectForKey:v185];

  if (!v186)
  {
    v187 = *(void **)(v143 + 1136);
    int v188 = [NSNumber numberWithInteger:a11];
    [v187 setObject:&unk_1F27F06C0 forKeyedSubscript:v188];
  }
  v189 = *(void **)(v143 + 1136);
  v190 = [NSNumber numberWithInteger:a11];
  v191 = [v189 objectForKeyedSubscript:v190];
  [v191 doubleValue];
  double v193 = v192;

  int v194 = [NSNumber numberWithDouble:v193 + a9 * *(double *)(*(void *)(*(void *)(a1 + 360) + 8) + 24)];
  v195 = *(void **)(v143 + 1136);
  int v196 = [NSNumber numberWithInteger:a11];
  [v195 setObject:v194 forKeyedSubscript:v196];

  v197 = *(void **)(v143 + 1144);
  v198 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 168) + 8) + 24)];
  v199 = [v197 objectForKey:v198];

  if (!v199)
  {
    int v200 = *(void **)(v143 + 1144);
    v201 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 168) + 8) + 24)];
    [v200 setObject:&unk_1F27F06C0 forKeyedSubscript:v201];
  }
  int v202 = *(void **)(v143 + 1144);
  v203 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 168) + 8) + 24)];
  v204 = [v202 objectForKeyedSubscript:v203];
  [v204 doubleValue];
  double v206 = v205;

  v207 = [NSNumber numberWithDouble:v206 + a9 * *(double *)(*(void *)(*(void *)(a1 + 344) + 8) + 24)];
  v208 = *(void **)(v143 + 1144);
  v209 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 168) + 8) + 24)];
  [v208 setObject:v207 forKeyedSubscript:v209];

  v210 = *(void **)(v143 + 1152);
  v211 = [NSNumber numberWithLongLong:a18];
  v212 = [v210 objectForKey:v211];

  if (!v212)
  {
    v213 = *(void **)(v143 + 1152);
    v214 = [NSNumber numberWithLongLong:a18];
    [v213 setObject:&unk_1F27F06C0 forKeyedSubscript:v214];
  }
  v215 = *(void **)(v143 + 1152);
  v216 = [NSNumber numberWithLongLong:a18];
  v217 = [v215 objectForKeyedSubscript:v216];
  [v217 doubleValue];
  double v219 = v218;

  v220 = [NSNumber numberWithDouble:v219 + a9 * *(double *)(*(void *)(*(void *)(a1 + 408) + 8) + 24)];
  v221 = *(void **)(v143 + 1152);
  v222 = [NSNumber numberWithLongLong:a18];
  [v221 setObject:v220 forKeyedSubscript:v222];

  v223 = *(void **)(v143 + 1160);
  v224 = [NSNumber numberWithLongLong:a17];
  v225 = [v223 objectForKey:v224];

  if (!v225)
  {
    v226 = *(void **)(v143 + 1160);
    v227 = [NSNumber numberWithLongLong:a17];
    [v226 setObject:&unk_1F27F06C0 forKeyedSubscript:v227];
  }
  v228 = *(void **)(v143 + 1160);
  v229 = [NSNumber numberWithLongLong:a17];
  v230 = [v228 objectForKeyedSubscript:v229];
  [v230 doubleValue];
  double v232 = v231;

  v233 = [NSNumber numberWithDouble:v232 + a9 * *(double *)(*(void *)(*(void *)(a1 + 392) + 8) + 24)];
  v234 = *(void **)(v143 + 1160);
  v235 = [NSNumber numberWithLongLong:a17];
  [v234 setObject:v233 forKeyedSubscript:v235];

  if (v255)
  {
    *(double *)(v143 + 744) = *(double *)(v143 + 744)
                            + *(double *)(*(void *)(*(void *)(a1 + 408) + 8) + 24)
                            * a9
                            * (double)*(int *)(*(void *)(*(void *)(a1 + 288) + 8) + 24);
    *(double *)(v143 + 752) = *(double *)(v143 + 752)
                            + a9 * *(double *)(*(void *)(*(void *)(a1 + 408) + 8) + 24);
  }
  if (v254)
  {
    *(double *)(v143 + 760) = *(double *)(v143 + 760)
                            + *(double *)(*(void *)(*(void *)(a1 + 392) + 8) + 24)
                            * a9
                            * (double)*(int *)(*(void *)(*(void *)(a1 + 296) + 8) + 24);
    *(double *)(v143 + 768) = *(double *)(v143 + 768)
                            + a9 * *(double *)(*(void *)(*(void *)(a1 + 392) + 8) + 24);
  }
  *(double *)(v143 + 736) = *(double *)(v143 + 736) + a9 * *(double *)(*(void *)(*(void *)(a1 + 360) + 8) + 24);
  *(double *)(v143 + 776) = *(double *)(v143 + 776) + a9 * *(double *)(*(void *)(*(void *)(a1 + 344) + 8) + 24);
  v236 = *(void **)(v143 + 48);
  if (v236)
  {
    id v237 = [v236 earlierDate:v264];
  }
  else
  {
    id v237 = v264;
  }
  v238 = *(void **)(v143 + 48);
  *(void *)(v143 + 48) = v237;

  v239 = *(void **)(v143 + 56);
  if (v239)
  {
    id v240 = [v239 laterDate:v264];
  }
  else
  {
    id v240 = v264;
  }
  v241 = *(void **)(v143 + 56);
  *(void *)(v143 + 56) = v240;

  if (*(void *)(v143 + 32))
  {
    char v242 = objc_msgSend(v258, "isEqualToDate:");
    if (v258) {
      char v243 = v242;
    }
    else {
      char v243 = 1;
    }
    if (v243) {
      goto LABEL_185;
    }
    goto LABEL_184;
  }
  if (v258)
  {
LABEL_184:
    objc_storeStrong((id *)(v143 + 32), a15);
    *(double *)(v143 + 592) = *(double *)(*(void *)(*(void *)(a1 + 456) + 8) + 24) + *(double *)(v143 + 592);
  }
LABEL_185:
  if (([*(id *)(v143 + 40) containsObject:*(void *)(*(void *)(*(void *)(a1 + 520) + 8) + 40)] & 1) == 0)
  {
    if ([*(id *)(v143 + 40) count])
    {
      [(id)v143 _updateTimeOfDayBudgetStatisticsForNewTimeOfDayBudget:*(double *)(v143 + 632)];
      *(void *)(v143 + 632) = 0;
    }
    [*(id *)(v143 + 40) addObject:*(void *)(*(void *)(*(void *)(a1 + 520) + 8) + 40)];
  }
  *(double *)(v143 + 632) = *(double *)(*(void *)(*(void *)(a1 + 152) + 8) + 24) + *(double *)(v143 + 632);
  if ([*(id *)(*(void *)(*(void *)(a1 + 520) + 8) + 40) isEqual:*(void *)(a1 + 96)])*(double *)(v143 + 624) = *(double *)(*(void *)(*(void *)(a1 + 152) + 8) + 24) + *(double *)(v143 + 624); {
  v244 = *(void **)(*(void *)(a1 + 88) + 24);
  }
  v245 = [NSNumber numberWithUnsignedLongLong:a5];
  v246 = [v244 objectForKey:v245];

  if (!v246)
  {
    v247 = *(void **)(*(void *)(a1 + 88) + 24);
    v248 = objc_alloc_init(ATXSlotResolutionSlotSetStatistics);
    v249 = [NSNumber numberWithUnsignedLongLong:a5];
    [v247 setObject:v248 forKey:v249];
  }
  v250 = *(void **)(*(void *)(a1 + 88) + 24);
  v251 = [NSNumber numberWithUnsignedLongLong:a5];
  v252 = [v250 objectForKeyedSubscript:v251];

  v252[2] = v252[2] + a9 * *(double *)(*(void *)(*(void *)(a1 + 328) + 8) + 24);
LABEL_194:

  return 1;
}

- (id)updateStatisticsWithFeedbackForBundleId:(id)a3 actionType:(id)a4 statistics:(id)a5 currentDate:(id)a6 currentGeohash:(int64_t)a7 currentCoarseGeohash:(int64_t)a8
{
  id v39 = a3;
  id v38 = a4;
  id v37 = a5;
  id v14 = a6;
  double v36 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v15 = +[_ATXGlobals sharedInstance];
  int v35 = +[_ATXActionUtils timeOfDayAndDayOfWeekForDate:v14 timeZone:0];
  id v16 = [v35 first];
  uint64_t v17 = [v16 integerValue];

  id v18 = [v35 second];
  uint64_t v19 = [v18 integerValue];

  LODWORD(v18) = [v36 isDateInWeekend:v14];
  v70[0] = 0;
  v70[1] = v70;
  v70[2] = 0x2020000000;
  double v71 = 0.0;
  [v15 slotResolutionTimeOfDayLaunchDecayHalflife];
  double v71 = v20 * 86400.0;
  v68[0] = 0;
  v68[1] = v68;
  v68[2] = 0x2020000000;
  double v69 = 0.0;
  [v15 slotResolutionDayOfWeekLaunchDecayHalflife];
  double v69 = v21 * 86400.0;
  v66[0] = 0;
  v66[1] = v66;
  v66[2] = 0x2020000000;
  double v67 = 0.0;
  [v15 slotResolutionPartOfWeekLaunchDecayHalflife];
  double v67 = v22 * 86400.0;
  v64[0] = 0;
  v64[1] = v64;
  v64[2] = 0x2020000000;
  double v65 = 0.0;
  [v15 appAndActionCoarseTimePowLocationDecayHalflife];
  double v65 = v23 * 86400.0;
  v62[0] = 0;
  v62[1] = v62;
  v62[2] = 0x2020000000;
  double v63 = 0.0;
  [v15 appAndActionSpecificTimePowLocationDecayHalflife];
  double v63 = v24 * 86400.0;
  v60[0] = 0;
  v60[1] = v60;
  v60[2] = 0x2020000000;
  double v61 = 0.0;
  [v15 actionCoarseGeoHashDecayHalflife];
  double v61 = v25 * 86400.0;
  v58[0] = 0;
  v58[1] = v58;
  v58[2] = 0x2020000000;
  double v59 = 0.0;
  [v15 actionSpecificGeoHashDecayHalflife];
  double v59 = v26 * 86400.0;
  dataStore = self->_dataStore;
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __131__ATXSlotResolution_updateStatisticsWithFeedbackForBundleId_actionType_statistics_currentDate_currentGeohash_currentCoarseGeohash___block_invoke;
  v40[3] = &unk_1E68AF190;
  uint64_t v53 = v17;
  uint64_t v54 = v19;
  id v28 = v36;
  id v41 = v28;
  double v42 = self;
  int64_t v56 = a8;
  int64_t v57 = a7;
  int v46 = v70;
  double v47 = v68;
  double v48 = v66;
  int v49 = v64;
  double v50 = v62;
  int v51 = v60;
  uint64_t v55 = v18;
  int v52 = v58;
  id v29 = v37;
  id v43 = v29;
  id v30 = v14;
  id v44 = v30;
  id v31 = v15;
  id v45 = v31;
  [(_ATXDataStore *)dataStore enumerateFeedbackForActionOfType:v38 bundleId:v39 block:v40];
  int v32 = v45;
  id v33 = v29;

  _Block_object_dispose(v58, 8);
  _Block_object_dispose(v60, 8);
  _Block_object_dispose(v62, 8);
  _Block_object_dispose(v64, 8);
  _Block_object_dispose(v66, 8);
  _Block_object_dispose(v68, 8);
  _Block_object_dispose(v70, 8);

  return v33;
}

uint64_t __131__ATXSlotResolution_updateStatisticsWithFeedbackForBundleId_actionType_statistics_currentDate_currentGeohash_currentCoarseGeohash___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, double a10)
{
  id v95 = a2;
  id v98 = a3;
  id v17 = a4;
  [v17 timeIntervalSinceNow];
  double v19 = v18;
  +[_ATXFeedbackConstants actionDecayHalfLifeSeconds];
  +[ATXSlotResolution exponentialDecay:-v19 withHalflife:v20];
  double v93 = v21;
  uint64_t v96 = +[ATXSlotResolution yearMonthDayComponentsForDate:v17];
  uint64_t v94 = +[_ATXActionUtils timeOfDayAndDayOfWeekForDate:v17 timeZone:0];
  double v22 = [v94 first];
  uint64_t v23 = [v22 integerValue];

  double v24 = [v94 second];
  uint64_t v25 = [v24 integerValue];

  +[ATXSlotResolutionParametersStatistics _smoothedCountForTimeOfDay:v23 currentTimeOfDay:*(void *)(a1 + 128)];
  double v27 = v26;
  +[ATXSlotResolutionParametersStatistics _smoothedCountForCoarseTimeOfDay:v23 currentTimeOfDay:*(void *)(a1 + 128)];
  double v29 = v28;
  +[ATXSlotResolutionParametersStatistics _smoothedCountForThirtyMinuteWindow:v23 currentTimeOfDay:*(void *)(a1 + 128)];
  double v31 = v30;
  +[ATXSlotResolutionParametersStatistics _smoothedCountForHourWindow:v23 currentTimeOfDay:*(void *)(a1 + 128)];
  double v88 = v32;
  uint64_t v33 = *(void *)(a1 + 136);
  int v34 = [*(id *)(a1 + 32) isDateInWeekend:v17];
  uint64_t v35 = *(void *)(a1 + 144);
  unsigned int v97 = [(id)objc_opt_class() matchForCurrentGeohash:*(void *)(a1 + 152) rowGeohash:a8];
  unsigned int v36 = [(id)objc_opt_class() matchForCurrentGeohash:*(void *)(a1 + 160) rowGeohash:a7];
  unsigned int v37 = v36;
  BOOL v38 = v29 != 0.0 && v35 == v34;
  unsigned int v39 = v97;
  if (!v38) {
    unsigned int v39 = 0;
  }
  double v40 = (v29 + 1.0 + 1.0) / 3.0;
  if (v39 != 1) {
    double v40 = 0.0;
  }
  double v90 = v40;
  if (v31 != 0.0 && v33 == v25) {
    unsigned int v42 = v36;
  }
  else {
    unsigned int v42 = 0;
  }
  if (v42 == 1) {
    double v43 = (v31 + 1.0 + 1.0) / 3.0;
  }
  else {
    double v43 = 0.0;
  }
  +[ATXSlotResolution exponentialDecay:-v19 withHalflife:*(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
  double v92 = v44;
  +[ATXSlotResolution exponentialDecay:-v19 withHalflife:*(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)];
  double v91 = v45;
  +[ATXSlotResolution exponentialDecay:-v19 withHalflife:*(double *)(*(void *)(*(void *)(a1 + 88) + 8) + 24)];
  double v85 = v46;
  +[ATXSlotResolution exponentialDecay:-v19 withHalflife:*(double *)(*(void *)(*(void *)(a1 + 96) + 8) + 24)];
  double v89 = v47;
  +[ATXSlotResolution exponentialDecay:-v19 withHalflife:*(double *)(*(void *)(*(void *)(a1 + 104) + 8) + 24)];
  double v49 = v48;
  +[ATXSlotResolution exponentialDecay:-v19 withHalflife:*(double *)(*(void *)(*(void *)(a1 + 112) + 8) + 24)];
  double v86 = v50;
  +[ATXSlotResolution exponentialDecay:-v19 withHalflife:*(double *)(*(void *)(*(void *)(a1 + 120) + 8) + 24)];
  if (v19 <= 0.0)
  {
    double v84 = v51;
    uint64_t v87 = [[ATXMinimalSlotResolutionParameters alloc] initWithAction:v95 slots:v98];
    int v52 = [*(id *)(*(void *)(a1 + 48) + 16) objectForKey:v87];

    if (!v52)
    {
LABEL_96:

      goto LABEL_97;
    }
    uint64_t v53 = [*(id *)(*(void *)(a1 + 48) + 16) objectForKeyedSubscript:v87];
    double v83 = v19 / -60.0;
    if ([MEMORY[0x1E4F4B680] isActionSpotlightConsumerSubType:a5])
    {
      if (v19 >= -3600.0)
      {
        if (a9 != 0.0) {
          v53[17] = v53[17] + 1.0;
        }
        if (a10 != 0.0) {
          v53[18] = v53[18] + 1.0;
        }
      }
      if (v19 >= -7200.0)
      {
        if (a9 != 0.0) {
          v53[19] = v53[19] + 1.0;
        }
        if (a10 != 0.0) {
          v53[20] = v53[20] + 1.0;
        }
      }
      if ([*(id *)(a1 + 32) isDate:v17 inSameDayAsDate:*(void *)(a1 + 56)])
      {
        if (a9 != 0.0) {
          v53[21] = v53[21] + 1.0;
        }
        if (a10 != 0.0) {
          v53[22] = v53[22] + 1.0;
        }
      }
      [*(id *)(a1 + 64) maximumActionFeedbackMeanCalculationEntryAge];
      if (v54 * 86400.0 >= -v19)
      {
        if (a10 != 0.0) {
          *(double *)(*(void *)(a1 + 48) + 184) = *(double *)(*(void *)(a1 + 48) + 184) + 1.0;
        }
        if (a9 != 0.0) {
          *(double *)(*(void *)(a1 + 48) + 176) = *(double *)(*(void *)(a1 + 48) + 176) + 1.0;
        }
        [*(id *)(*(void *)(a1 + 48) + 192) addObject:v96];
      }
      if (a9 != 0.0)
      {
        double v55 = v53[11];
        if (v55 >= v83) {
          double v55 = v19 / -60.0;
        }
        v53[11] = v55;
        v53[68] = v53[68] + v92 * v27;
        v53[69] = v53[69] + v92 * v29;
        v53[23] = v93 + v53[23];
        *(double *)(*(void *)(a1 + 48) + 160) = v93 + *(double *)(*(void *)(a1 + 48) + 160);
        if (*(void *)(a1 + 136) == v25) {
          v53[67] = v91 + v53[67];
        }
        int v56 = [*(id *)(a1 + 32) isDateInWeekend:*(void *)(a1 + 56)];
        if (v56 == [*(id *)(a1 + 32) isDateInWeekend:v17]) {
          v53[66] = v85 + v53[66];
        }
      }
      double v57 = v88;
      double v58 = v43;
      if (a10 == 0.0) {
        goto LABEL_83;
      }
      v53[24] = v93 + v53[24];
      *(double *)(*(void *)(a1 + 48) + 168) = v93 + *(double *)(*(void *)(a1 + 48) + 168);
      if (a6 != 2) {
        goto LABEL_83;
      }
      double v59 = &OBJC_IVAR___ATXSlotResolutionParametersStatistics__minutesSinceLastExplicitRejectInSpotlight;
    }
    else
    {
      double v57 = v88;
      double v58 = v43;
      if ((a5 - 38) < 2 || a5 == 36)
      {
        if (a9 != 0.0)
        {
          double v63 = 0.0;
          if (v33 == v25) {
            double v63 = 1.0;
          }
          double v64 = v91 * v63;
          v53[114] = v53[114] + v64 * a9;
          v53[118] = v53[118] + v88 * v92 * a9;
          double v65 = v86 * (double)v97;
          v53[122] = v53[122] + v65 * a9;
          double v66 = v84 * (double)v37;
          v53[126] = v53[126] + v66 * a9;
          v53[130] = v53[130] + v90 * v89 * a9;
          v53[134] = v53[134] + v43 * v49 * a9;
          v53[115] = v53[115] + v91 * a9;
          v53[119] = v53[119] + v92 * a9;
          v53[123] = v53[123] + v86 * a9;
          v53[127] = v53[127] + v84 * a9;
          v53[131] = v53[131] + v89 * a9;
          v53[135] = v53[135] + v49 * a9;
          *(double *)(*(void *)(a1 + 48) + 632) = *(double *)(*(void *)(a1 + 48) + 632) + v64 * a9;
          *(double *)(*(void *)(a1 + 48) + 648) = *(double *)(*(void *)(a1 + 48) + 648) + v88 * v92 * a9;
          *(double *)(*(void *)(a1 + 48) + 664) = *(double *)(*(void *)(a1 + 48) + 664) + v65 * a9;
          *(double *)(*(void *)(a1 + 48) + 680) = *(double *)(*(void *)(a1 + 48) + 680) + v66 * a9;
          *(double *)(*(void *)(a1 + 48) + 696) = *(double *)(*(void *)(a1 + 48) + 696) + v90 * v89 * a9;
          *(double *)(*(void *)(a1 + 48) + 712) = *(double *)(*(void *)(a1 + 48) + 712) + v43 * v49 * a9;
        }
        if (a10 == 0.0) {
          goto LABEL_83;
        }
        double v67 = 0.0;
        if (v33 == v25) {
          double v67 = 1.0;
        }
        double v68 = v91 * v67;
        v53[116] = v53[116] + v68 * a10;
        v53[120] = v53[120] + v88 * v92 * a10;
        double v69 = v86 * (double)v97;
        v53[124] = v53[124] + v69 * a10;
        double v70 = v84 * (double)v37;
        v53[128] = v53[128] + v70 * a10;
        v53[132] = v53[132] + v90 * v89 * a10;
        v53[136] = v53[136] + v43 * v49 * a10;
        v53[117] = v53[117] + v91 * a10;
        v53[121] = v53[121] + v92 * a10;
        v53[125] = v53[125] + v86 * a10;
        v53[129] = v53[129] + v84 * a10;
        v53[133] = v53[133] + v89 * a10;
        v53[137] = v53[137] + v49 * a10;
        *(double *)(*(void *)(a1 + 48) + 640) = *(double *)(*(void *)(a1 + 48) + 640) + v68 * a10;
        *(double *)(*(void *)(a1 + 48) + 656) = *(double *)(*(void *)(a1 + 48) + 656) + v88 * v92 * a10;
        *(double *)(*(void *)(a1 + 48) + 672) = *(double *)(*(void *)(a1 + 48) + 672) + v69 * a10;
        *(double *)(*(void *)(a1 + 48) + 688) = *(double *)(*(void *)(a1 + 48) + 688) + v70 * a10;
        *(double *)(*(void *)(a1 + 48) + 704) = *(double *)(*(void *)(a1 + 48) + 704) + v90 * v89 * a10;
        *(double *)(*(void *)(a1 + 48) + 720) = *(double *)(*(void *)(a1 + 48) + 720) + v43 * v49 * a10;
        if (a6 != 2) {
          goto LABEL_83;
        }
        double v59 = &OBJC_IVAR___ATXSlotResolutionParametersStatistics__minutesSinceLastExplicitRejectInHomeScreen;
      }
      else
      {
        if (a5 != 22) {
          goto LABEL_83;
        }
        if ([*(id *)(a1 + 32) isDate:v17 inSameDayAsDate:*(void *)(a1 + 56)])
        {
          if (a9 != 0.0)
          {
            v53[25] = v53[25] + 1.0;
            *(double *)(*(void *)(a1 + 48) + 200) = *(double *)(*(void *)(a1 + 48) + 200) + 1.0;
          }
          if (a10 != 0.0)
          {
            v53[26] = v53[26] + 1.0;
            *(double *)(*(void *)(a1 + 48) + 208) = *(double *)(*(void *)(a1 + 48) + 208) + 1.0;
          }
        }
        double v57 = v88;
        double v58 = v43;
        if (a9 != 0.0)
        {
          double v60 = v53[13];
          if (v60 >= v83) {
            double v60 = v83;
          }
          v53[13] = v60;
          v53[72] = v53[72] + v92 * v27;
          v53[73] = v53[73] + v92 * v29;
          v53[27] = v93 + v53[27];
          *(double *)(*(void *)(a1 + 48) + 216) = v93 + *(double *)(*(void *)(a1 + 48) + 216);
          if (*(void *)(a1 + 136) == v25) {
            v53[71] = v91 + v53[71];
          }
          int v61 = [*(id *)(a1 + 32) isDateInWeekend:*(void *)(a1 + 56)];
          double v57 = v88;
          double v58 = v43;
          if (v61 == [*(id *)(a1 + 32) isDateInWeekend:v17]) {
            v53[70] = v85 + v53[70];
          }
        }
        if (a10 == 0.0) {
          goto LABEL_83;
        }
        double v62 = v53[14];
        if (v62 >= v83) {
          double v62 = v83;
        }
        v53[14] = v62;
        v53[28] = v93 + v53[28];
        *(double *)(*(void *)(a1 + 48) + 224) = v93 + *(double *)(*(void *)(a1 + 48) + 224);
        if (a6 != 2) {
          goto LABEL_83;
        }
        double v59 = &OBJC_IVAR___ATXSlotResolutionParametersStatistics__minutesSinceLastExplicitRejectInLockscreen;
      }
    }
    uint64_t v71 = *v59;
    double v72 = *(double *)((char *)v53 + v71);
    if (v72 >= v83) {
      double v72 = v83;
    }
    *(double *)((char *)v53 + v71) = v72;
LABEL_83:
    if ([(id)objc_opt_class() shouldCountRowForGeohashOccurrencesCalculationForCurrentGeohash:*(void *)(a1 + 152) rowGeohash:a8])
    {
      v53[83] = v53[83] + v89 * a9;
      v53[85] = v53[85] + v89 * a10;
      *(double *)(*(void *)(a1 + 48) + 464) = *(double *)(*(void *)(a1 + 48) + 464) + v89 * a9;
      *(double *)(*(void *)(a1 + 48) + 480) = *(double *)(*(void *)(a1 + 48) + 480) + v89 * a10;
    }
    if ([(id)objc_opt_class() shouldCountRowForGeohashOccurrencesCalculationForCurrentGeohash:*(void *)(a1 + 160) rowGeohash:a7])
    {
      v53[89] = v53[89] + v49 * a9;
      v53[91] = v53[91] + v49 * a10;
      *(double *)(*(void *)(a1 + 48) + 512) = *(double *)(*(void *)(a1 + 48) + 512) + v49 * a9;
      *(double *)(*(void *)(a1 + 48) + 528) = *(double *)(*(void *)(a1 + 48) + 528) + v49 * a10;
    }
    double v73 = v90 * v89;
    v53[82] = v53[82] + v90 * v89 * a9;
    double v74 = v58 * v49;
    v53[88] = v53[88] + v58 * v49 * a9;
    v53[84] = v53[84] + v90 * v89 * a10;
    v53[90] = v53[90] + v58 * v49 * a10;
    double v75 = v57 * v92;
    v53[98] = v53[98] + v57 * v92 * a9;
    double v76 = 0.0;
    if (v33 == v25) {
      double v76 = 1.0;
    }
    double v77 = v91 * v76;
    v53[102] = v53[102] + v91 * v76 * a9;
    v53[100] = v53[100] + v75 * a10;
    v53[104] = v53[104] + v91 * v76 * a10;
    v53[99] = v53[99] + v92 * a9;
    v53[103] = v53[103] + v91 * a9;
    v53[101] = v53[101] + v92 * a10;
    v53[105] = v53[105] + v91 * a10;
    int v78 = [(id)objc_opt_class() shouldCountRowForGeohashIndividualContextStatistics:*(void *)(a1 + 160) rowGeohash:a7];
    int v79 = [(id)objc_opt_class() shouldCountRowForGeohashIndividualContextStatistics:*(void *)(a1 + 152) rowGeohash:a8];
    if (v78)
    {
      double v80 = v84 * (double)v37;
      v53[110] = v53[110] + v80 * a9;
      v53[111] = v53[111] + v84 * a9;
      v53[113] = v53[113] + v84 * a10;
      v53[112] = v53[112] + v80 * a10;
      *(double *)(*(void *)(a1 + 48) + 616) = *(double *)(*(void *)(a1 + 48) + 616) + v80 * a9;
      *(double *)(*(void *)(a1 + 48) + 624) = *(double *)(*(void *)(a1 + 48) + 624) + v80 * a10;
    }
    if (v79)
    {
      double v81 = v86 * (double)v97;
      v53[106] = v53[106] + v81 * a9;
      v53[107] = v53[107] + v86 * a9;
      v53[109] = v53[109] + v86 * a10;
      v53[108] = v53[108] + v81 * a10;
      *(double *)(*(void *)(a1 + 48) + 600) = *(double *)(*(void *)(a1 + 48) + 600) + v81 * a9;
      *(double *)(*(void *)(a1 + 48) + 608) = *(double *)(*(void *)(a1 + 48) + 608) + v81 * a10;
    }
    *(double *)(*(void *)(a1 + 48) + 456) = *(double *)(*(void *)(a1 + 48) + 456) + v73 * a9;
    *(double *)(*(void *)(a1 + 48) + 504) = *(double *)(*(void *)(a1 + 48) + 504) + v74 * a9;
    *(double *)(*(void *)(a1 + 48) + 472) = *(double *)(*(void *)(a1 + 48) + 472) + v73 * a10;
    *(double *)(*(void *)(a1 + 48) + 520) = *(double *)(*(void *)(a1 + 48) + 520) + v74 * a10;
    *(double *)(*(void *)(a1 + 48) + 584) = *(double *)(*(void *)(a1 + 48) + 584) + v77 * a9;
    *(double *)(*(void *)(a1 + 48) + 592) = *(double *)(*(void *)(a1 + 48) + 592) + v77 * a10;
    *(double *)(*(void *)(a1 + 48) + 568) = *(double *)(*(void *)(a1 + 48) + 568) + v75 * a9;
    *(double *)(*(void *)(a1 + 48) + 576) = *(double *)(*(void *)(a1 + 48) + 576) + v75 * a10;
    v53[8] = v53[8] + v93 * a9;
    v53[9] = v53[9] + v93 * a10;
    *(double *)(*(void *)(a1 + 48) + 136) = *(double *)(*(void *)(a1 + 48) + 136) + v93 * a9;
    *(double *)(*(void *)(a1 + 48) + 144) = *(double *)(*(void *)(a1 + 48) + 144) + v93 * a10;
    if (a6 == 2)
    {
      *(double *)(*(void *)(a1 + 48) + 152) = *(double *)(*(void *)(a1 + 48) + 152) + a10;
      v53[10] = v53[10] + a10;
    }

    goto LABEL_96;
  }
LABEL_97:

  return 1;
}

- (id)updateStatisticsWithHigherLevelFeaturesForStatistics:(id)a3
{
  id v3 = a3;
  v4 = (void *)v3[2];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__ATXSlotResolution_updateStatisticsWithHigherLevelFeaturesForStatistics___block_invoke;
  v7[3] = &unk_1E68AF1B8;
  v5 = v3;
  id v8 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

void __74__ATXSlotResolution_updateStatisticsWithHigherLevelFeaturesForStatistics___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v26 = a2;
  v5 = a3;
  [v5 _totalFeedbackEvents];
  if (v6 > 0.0)
  {
    v7 = *(void **)(a1 + 32);
    [v5 _confirmRatio];
    objc_msgSend(v7, "_updateConfirmRatioStatisticsForNewConfirmRatio:");
  }
  id v8 = *(void **)(*(void *)(a1 + 32) + 24);
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v26, "slotHash"));
  uint64_t v10 = [v8 objectForKeyedSubscript:v9];

  ATXProbability(v5[29], v10[2]);
  double v12 = v11;
  double v13 = log2(v11);
  if (v12 <= 0.0) {
    double v13 = 0.0;
  }
  v10[1] = v10[1] - v13 * v12;
  ATXProbability(v5[48], *(double *)(*(void *)(a1 + 32) + 560));
  double v15 = v14;
  double v16 = log2(v14);
  if (v15 <= 0.0) {
    double v16 = 0.0;
  }
  v5[138] = v5[138] - v16 * v15;
  ATXProbability(v5[51], *(double *)(*(void *)(a1 + 32) + 536));
  double v18 = v17;
  double v19 = log2(v17);
  if (v18 <= 0.0) {
    double v19 = 0.0;
  }
  v5[139] = v5[139] - v19 * v18;
  ATXProbability(v5[93], *(double *)(*(void *)(a1 + 32) + 544));
  double v21 = v20;
  double v22 = log2(v20);
  if (v21 <= 0.0) {
    double v22 = 0.0;
  }
  v5[140] = v5[140] - v22 * v21;
  ATXProbability(v5[95], *(double *)(*(void *)(a1 + 32) + 552));
  double v24 = v23;
  double v25 = log2(v23);
  if (v24 <= 0.0) {
    double v25 = 0.0;
  }
  v5[141] = v5[141] - v25 * v24;
  [v5 _updateTimeOfDayBudgetStatisticsForNewTimeOfDayBudget:v5[79]];
}

- (id)statisticsForActionKey:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F935D0] sharedInstance];
  double v6 = [v5 previousLOIAndCurrentLOI];

  v7 = [v6 first];
  id v8 = [v7 uuid];

  v9 = [v6 second];
  uint64_t v10 = [v9 uuid];

  long double v11 = [MEMORY[0x1E4F93610] sharedInstance];
  double v12 = [v11 getCurrentActivity];

  double v13 = [MEMORY[0x1E4F935D0] sharedInstance];
  long double v14 = [v13 getCurrentLocation];

  double v15 = [MEMORY[0x1E4F935D0] sharedInstance];
  uint64_t v16 = [v15 locationEnabled];

  int64_t v17 = +[ATXPrivacyPreservingLocationHash privacyPreservingGeohashForLocation:v14 locationEnabled:v16];
  int64_t v18 = +[ATXPrivacyPreservingLocationHash privacyPreservingCoarseGeohashForLocation:v14 locationEnabled:v16];
  double v19 = objc_opt_new();
  long double v20 = -[ATXSlotResolution statisticsForActionKey:currentDate:previousLocationUUID:currentLocationUUID:currentMotionType:currentGeohash:currentCoarseGeohash:](self, "statisticsForActionKey:currentDate:previousLocationUUID:currentLocationUUID:currentMotionType:currentGeohash:currentCoarseGeohash:", v4, v19, v8, v10, [v12 motiontype], v17, v18);

  return v20;
}

- (id)statisticsForActionKey:(id)a3 context:(id)a4
{
  id v22 = a3;
  id v5 = a4;
  long double v20 = [v5 timeContext];
  double v21 = [v20 date];
  double v19 = [v5 locationMotionContext];
  int64_t v17 = [v19 previousLOI];
  int64_t v18 = [v17 uuid];
  uint64_t v16 = [v5 locationMotionContext];
  long double v14 = [v16 currentLOI];
  double v6 = [v14 uuid];
  v7 = [v5 locationMotionContext];
  uint64_t v8 = [v7 motionType];
  v9 = [v5 locationMotionContext];
  uint64_t v10 = [v9 geohash];
  long double v11 = [v5 locationMotionContext];
  double v12 = -[ATXSlotResolution statisticsForActionKey:currentDate:previousLocationUUID:currentLocationUUID:currentMotionType:currentGeohash:currentCoarseGeohash:](self, "statisticsForActionKey:currentDate:previousLocationUUID:currentLocationUUID:currentMotionType:currentGeohash:currentCoarseGeohash:", v22, v21, v18, v6, v8, v10, [v11 coarseGeohash]);

  return v12;
}

- (id)statisticsForActionKey:(id)a3 currentDate:(id)a4 previousLocationUUID:(id)a5 currentLocationUUID:(id)a6 currentMotionType:(int64_t)a7 currentGeohash:(int64_t)a8 currentCoarseGeohash:(int64_t)a9
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v33 = a4;
  id v32 = a5;
  id v15 = a6;
  uint64_t v16 = +[_ATXActionUtils getBundleIdAndActionTypeFromActionKey:v14];
  int64_t v17 = [v16 first];
  uint64_t v18 = [v16 second];
  double v19 = (void *)v18;
  if (v17) {
    BOOL v20 = v18 == 0;
  }
  else {
    BOOL v20 = 1;
  }
  if (v20)
  {
    double v21 = __atxlog_handle_action_prediction();
    double v29 = v33;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v35 = v14;
      _os_log_impl(&dword_1D0FA3000, v21, OS_LOG_TYPE_DEFAULT, "Error parsing '%@'", buf, 0xCu);
    }

    double v27 = [[ATXSlotResolutionStatistics alloc] initWithActionKey:v14];
  }
  else
  {
    uint64_t v22 = MEMORY[0x1D25F6CC0]();
    id v23 = v15;
    double v24 = (void *)v22;
    double v31 = v23;
    double v25 = -[ATXSlotResolution fastStatisticsOnSlotsForBundleId:actionType:currentDate:previousLocationUUID:currentLocationUUID:currentMotionType:currentGeohash:currentCoarseGeohash:](self, "fastStatisticsOnSlotsForBundleId:actionType:currentDate:previousLocationUUID:currentLocationUUID:currentMotionType:currentGeohash:currentCoarseGeohash:", v17, v19, v33, v32, a8, a9);
    id v26 = [(ATXSlotResolution *)self updateStatisticsWithFeedbackForBundleId:v17 actionType:v19 statistics:v25 currentDate:v33 currentGeohash:a8 currentCoarseGeohash:a9];

    double v27 = [(ATXSlotResolution *)self updateStatisticsWithHigherLevelFeaturesForStatistics:v26];

    double v28 = v24;
    id v15 = v31;
    double v29 = v33;
  }

  return v27;
}

- (id)actionPredictionsForStatistics:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  double v6 = [(ATXSlotResolution *)self actionPredictionsForStatistics:v4 appActionPredictionItem:0 appActionLogProbability:0 scoreLogger:v5 currentDate:0.0];

  return v6;
}

- (id)actionPredictionsForStatistics:(id)a3 appActionPredictionItem:(const ATXPredictionItem *)a4 appActionLogProbability:(double)a5 scoreLogger:(id)a6 currentDate:(id)a7
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  double v12 = a3;
  id v13 = a6;
  id v14 = a7;
  id v15 = +[_ATXActionUtils getBundleIdFromActionKey:v12[1]];
  if (v15)
  {
    *(void *)buf = 0;
    float v39 = -31337.0;
    __int16 v40 = 0;
    for (uint64_t i = 16; i != 3284; i += 4)
      *(float *)&buf[i] = -31337.0;
    if (a4) {
      int64_t v17 = a4;
    }
    else {
      int64_t v17 = (const ATXPredictionItem *)buf;
    }
    v36[0] = 0;
    v36[1] = v36;
    v36[2] = 0x3032000000;
    v36[3] = __Block_byref_object_copy__33;
    v36[4] = __Block_byref_object_dispose__33;
    id v37 = (id)[objc_alloc(MEMORY[0x1E4F93B48]) initWithCountLimit:2];
    uint64_t v18 = objc_opt_new();
    double v19 = (void *)v12[2];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __124__ATXSlotResolution_actionPredictionsForStatistics_appActionPredictionItem_appActionLogProbability_scoreLogger_currentDate___block_invoke;
    v26[3] = &unk_1E68AF1E0;
    double v27 = v12;
    id v28 = v13;
    int v34 = v17;
    double v35 = a5;
    id v29 = v14;
    id v33 = v36;
    id v30 = v15;
    double v31 = self;
    id v20 = v18;
    id v32 = v20;
    [v19 enumerateKeysAndObjectsUsingBlock:v26];
    double v21 = v32;
    id v22 = v20;

    _Block_object_dispose(v36, 8);
  }
  else
  {
    id v23 = __atxlog_handle_action_prediction();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = v12[1];
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v24;
      _os_log_impl(&dword_1D0FA3000, v23, OS_LOG_TYPE_DEFAULT, "Error parsing '%@'", buf, 0xCu);
    }

    id v22 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v22;
}

void __124__ATXSlotResolution_actionPredictionsForStatistics_appActionPredictionItem_appActionLogProbability_scoreLogger_currentDate___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = MEMORY[0x1F4188790](a1, a2);
  id v4 = v3;
  uint64_t v5 = v2;
  v97[1] = *MEMORY[0x1E4F143B8];
  id v92 = v6;
  id v7 = v4;
  id v90 = *(id *)(*(void *)(v5 + 32) + 8);
  if (*(void *)(v5 + 40))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = [NSString stringWithFormat:@"ActionKey: %@\nSlotSet Hash: %lu\nParameter Hash: %lu", *(void *)(*(void *)(v5 + 32) + 8), objc_msgSend(v92, "slotHash"), objc_msgSend(v92, "hash")];
LABEL_7:
      v9 = (void *)v8;

      uint64_t v10 = v9;
      goto LABEL_9;
    }
    if (*(void *)(v5 + 40))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v8 = [NSString stringWithFormat:@"%@:%tu", *(void *)(*(void *)(v5 + 32) + 8), objc_msgSend(v92, "hash")];
        goto LABEL_7;
      }
    }
  }
  uint64_t v10 = v90;
LABEL_9:
  long double v11 = *(id **)(v5 + 88);
  id v12 = *v11;
  memcpy(v96, v11 + 1, 0xCD2uLL);
  id v91 = v10;
  id v95 = v91;

  v96[0] = [v92 hash];
  ATXSetInput((uint64_t)&v95, 0x17DuLL, *(float *)(*(void *)(v5 + 88) + 3284));
  ATXSetInput((uint64_t)&v95, 0x17EuLL, *(double *)(v5 + 96));
  ATXProbability(*((double *)v7 + 29), *(double *)(*(void *)(v5 + 32) + 32));
  ATXSetInput((uint64_t)&v95, 0xBBuLL, v13);
  ATXSmoothedProbability(*((double *)v7 + 46), *((double *)v7 + 30));
  ATXSetInput((uint64_t)&v95, 0xD0uLL, v14);
  ATXProbability(*((double *)v7 + 47), *(double *)(*(void *)(v5 + 32) + 56));
  ATXSetInput((uint64_t)&v95, 0xBDuLL, v15);
  ATXProbability(*((double *)v7 + 48), *(double *)(*(void *)(v5 + 32) + 64));
  ATXSetInput((uint64_t)&v95, 0xBEuLL, v16);
  ATXProbability(*((double *)v7 + 49), *(double *)(*(void *)(v5 + 32) + 72));
  ATXSetInput((uint64_t)&v95, 0xBFuLL, v17);
  ATXSetInput((uint64_t)&v95, 0xE1uLL, *((double *)v7 + 46));
  ATXSetInput((uint64_t)&v95, 0xE5uLL, *((double *)v7 + 47));
  ATXSetInput((uint64_t)&v95, 0xE6uLL, *((double *)v7 + 48));
  ATXSetInput((uint64_t)&v95, 0xE7uLL, *((double *)v7 + 49));
  ATXProbability(*((double *)v7 + 46), *(double *)(*(void *)(v5 + 32) + 48));
  ATXSetInput((uint64_t)&v95, 0xBCuLL, v18);
  ATXSmoothedProbability(*((double *)v7 + 51), *((double *)v7 + 31));
  ATXSetInput((uint64_t)&v95, 0xD2uLL, v19);
  ATXSmoothedProbability(*((double *)v7 + 52), *((double *)v7 + 32));
  ATXSetInput((uint64_t)&v95, 0xD3uLL, v20);
  ATXSmoothedProbability(*((double *)v7 + 53), *((double *)v7 + 44));
  ATXSetInput((uint64_t)&v95, 0xD4uLL, v21);
  ATXProbability(*((double *)v7 + 53), *(double *)(*(void *)(v5 + 32) + 296));
  ATXSetInput((uint64_t)&v95, 0xC2uLL, v22);
  ATXSetInput((uint64_t)&v95, 0xE2uLL, *((double *)v7 + 51));
  ATXSetInput((uint64_t)&v95, 0xE3uLL, *((double *)v7 + 52));
  ATXProbability(*((double *)v7 + 51), *(double *)(*(void *)(v5 + 32) + 88));
  ATXSetInput((uint64_t)&v95, 0xC0uLL, v23);
  ATXProbability(*((double *)v7 + 52), *(double *)(*(void *)(v5 + 32) + 96));
  ATXSetInput((uint64_t)&v95, 0xC1uLL, v24);
  ATXSmoothedProbability(*((double *)v7 + 50), *((double *)v7 + 30));
  ATXSetInput((uint64_t)&v95, 0xD1uLL, v25);
  ATXSetInput((uint64_t)&v95, 0xE4uLL, *((double *)v7 + 50));
  ATXProbability(*((double *)v7 + 50), *(double *)(*(void *)(v5 + 32) + 80));
  ATXSetInput((uint64_t)&v95, 0xC3uLL, v26);
  ATXSetInputAge((uint64_t)&v95, 0xFBuLL, *((void **)v7 + 7), *(void **)(v5 + 48));
  ATXSmoothedProbability(*((double *)v7 + 54), *((double *)v7 + 33));
  ATXSetInput((uint64_t)&v95, 0xD5uLL, v27);
  ATXSetInput((uint64_t)&v95, 0xE8uLL, *((double *)v7 + 54));
  ATXProbability(*((double *)v7 + 54), *(double *)(*(void *)(v5 + 32) + 104));
  ATXSetInput((uint64_t)&v95, 0xC4uLL, v28);
  ATXSmoothedProbability(*((double *)v7 + 56), *((double *)v7 + 34));
  ATXSetInput((uint64_t)&v95, 0xD7uLL, v29);
  ATXSetInput((uint64_t)&v95, 0xEAuLL, *((double *)v7 + 56));
  ATXProbability(*((double *)v7 + 56), *(double *)(*(void *)(v5 + 32) + 120));
  ATXSetInput((uint64_t)&v95, 0xC6uLL, v30);
  ATXSmoothedProbability(*((double *)v7 + 55), *((double *)v7 + 35));
  ATXSetInput((uint64_t)&v95, 0xD6uLL, v31);
  ATXSetInput((uint64_t)&v95, 0xE9uLL, *((double *)v7 + 55));
  ATXProbability(*((double *)v7 + 55), *(double *)(*(void *)(v5 + 32) + 112));
  ATXSetInput((uint64_t)&v95, 0xC5uLL, v32);
  ATXSetInput((uint64_t)&v95, 0x101uLL, (double)*((int *)v7 + 6));
  ATXSetInput((uint64_t)&v95, 0xFFuLL, *((double *)v7 + 29));
  *(float *)&double v33 = ATXSetInput((uint64_t)&v95, 0xFDuLL, (double)*((int *)v7 + 2));
  *(float *)&double v34 = ATXSetInput((uint64_t)&v95, 0xBAuLL, (double)(unint64_t)objc_msgSend(*(id *)(*(void *)(v5 + 32) + 128), "count", v33));
  ATXSetInput((uint64_t)&v95, 0xFEuLL, (double)(unint64_t)objc_msgSend(*((id *)v7 + 5), "count", v34));
  *(float *)&double v35 = ATXSetInput((uint64_t)&v95, 0x107uLL, *((double *)v7 + 75));
  objc_msgSend(v7, "_timeOfDayBudgetStandardDeviation", v35);
  ATXSetInput((uint64_t)&v95, 0x108uLL, v36);
  ATXSetInput((uint64_t)&v95, 0x109uLL, *((double *)v7 + 78));
  ATXSetInput((uint64_t)&v95, 0xB9uLL, *(double *)(*(void *)(v5 + 32) + 32));
  ATXSetInput((uint64_t)&v95, 0xB8uLL, (double)*(int *)(*(void *)(v5 + 32) + 40));
  ATXSetInput((uint64_t)&v95, 0xEBuLL, *((double *)v7 + 30));
  ATXSetInput((uint64_t)&v95, 0xECuLL, *((double *)v7 + 31));
  ATXSetInput((uint64_t)&v95, 0xEDuLL, *((double *)v7 + 33));
  ATXSetInput((uint64_t)&v95, 0xEEuLL, *((double *)v7 + 35));
  ATXSetInput((uint64_t)&v95, 0xEFuLL, *((double *)v7 + 34));
  ATXSetInput((uint64_t)&v95, 0xF0uLL, *((double *)v7 + 32));
  ATXSetInput((uint64_t)&v95, 0xF1uLL, *((double *)v7 + 36));
  ATXSetInput((uint64_t)&v95, 0xF2uLL, *((double *)v7 + 37));
  ATXSetInput((uint64_t)&v95, 0xF3uLL, *((double *)v7 + 38));
  ATXSetInput((uint64_t)&v95, 0xF4uLL, *((double *)v7 + 39));
  ATXSetInput((uint64_t)&v95, 0xF5uLL, *((double *)v7 + 41));
  ATXSetInput((uint64_t)&v95, 0xF6uLL, *((double *)v7 + 40));
  ATXSetInput((uint64_t)&v95, 0xF7uLL, *((double *)v7 + 42));
  ATXSetInput((uint64_t)&v95, 0xF8uLL, *((double *)v7 + 43));
  ATXSetInput((uint64_t)&v95, 0xF9uLL, *((double *)v7 + 44));
  ATXSetInput((uint64_t)&v95, 0xFAuLL, *((double *)v7 + 45));
  ATXProbability(*((double *)v7 + 58), *(double *)(*(void *)(v5 + 32) + 240));
  ATXSetInput((uint64_t)&v95, 0xC7uLL, v37);
  ATXSmoothedProbability(*((double *)v7 + 58), *((double *)v7 + 36));
  ATXSetInput((uint64_t)&v95, 0xD8uLL, v38);
  ATXProbability(*((double *)v7 + 65), *(double *)(*(void *)(v5 + 32) + 304));
  ATXSetInput((uint64_t)&v95, 0xCFuLL, v39);
  ATXSmoothedProbability(*((double *)v7 + 65), *((double *)v7 + 45));
  ATXSetInput((uint64_t)&v95, 0xE0uLL, v40);
  ATXProbability(*((double *)v7 + 57), *(double *)(*(void *)(v5 + 32) + 232));
  ATXSetInput((uint64_t)&v95, 0xC8uLL, v41);
  ATXSmoothedProbability(*((double *)v7 + 57), *((double *)v7 + 37));
  ATXSetInput((uint64_t)&v95, 0xD9uLL, v42);
  ATXProbability(*((double *)v7 + 59), *(double *)(*(void *)(v5 + 32) + 248));
  ATXSetInput((uint64_t)&v95, 0xC9uLL, v43);
  ATXSmoothedProbability(*((double *)v7 + 59), *((double *)v7 + 38));
  ATXSetInput((uint64_t)&v95, 0xDAuLL, v44);
  ATXProbability(*((double *)v7 + 60), *(double *)(*(void *)(v5 + 32) + 256));
  ATXSetInput((uint64_t)&v95, 0xCAuLL, v45);
  ATXSmoothedProbability(*((double *)v7 + 60), *((double *)v7 + 39));
  ATXSetInput((uint64_t)&v95, 0xDBuLL, v46);
  ATXProbability(*((double *)v7 + 62), *(double *)(*(void *)(v5 + 32) + 272));
  ATXSetInput((uint64_t)&v95, 0xCCuLL, v47);
  ATXSmoothedProbability(*((double *)v7 + 62), *((double *)v7 + 41));
  ATXSetInput((uint64_t)&v95, 0xDDuLL, v48);
  ATXProbability(*((double *)v7 + 61), *(double *)(*(void *)(v5 + 32) + 264));
  ATXSetInput((uint64_t)&v95, 0xCBuLL, v49);
  ATXSmoothedProbability(*((double *)v7 + 61), *((double *)v7 + 40));
  ATXSetInput((uint64_t)&v95, 0xDCuLL, v50);
  ATXProbability(*((double *)v7 + 63), *(double *)(*(void *)(v5 + 32) + 280));
  ATXSetInput((uint64_t)&v95, 0xCDuLL, v51);
  ATXSmoothedProbability(*((double *)v7 + 63), *((double *)v7 + 42));
  ATXSetInput((uint64_t)&v95, 0xDEuLL, v52);
  ATXProbability(*((double *)v7 + 64), *(double *)(*(void *)(v5 + 32) + 288));
  ATXSetInput((uint64_t)&v95, 0xCEuLL, v53);
  ATXSmoothedProbability(*((double *)v7 + 64), *((double *)v7 + 43));
  *(float *)&double v55 = ATXSetInput((uint64_t)&v95, 0xDFuLL, v54);
  objc_msgSend(v7, "_confirmRatio", v55);
  ATXSetInput((uint64_t)&v95, 0x110uLL, v56);
  ATXSetInput((uint64_t)&v95, 0x10AuLL, *((double *)v7 + 8));
  ATXSetInput((uint64_t)&v95, 0x10BuLL, *((double *)v7 + 9));
  ATXSetInput((uint64_t)&v95, 0x10CuLL, *((double *)v7 + 10));
  ATXSetInput((uint64_t)&v95, 0x10DuLL, *(double *)(*(void *)(v5 + 32) + 136));
  ATXSetInput((uint64_t)&v95, 0x10EuLL, *(double *)(*(void *)(v5 + 32) + 144));
  ATXSetInput((uint64_t)&v95, 0x10FuLL, *(double *)(*(void *)(v5 + 32) + 152));
  *(float *)&double v57 = ATXSetInput((uint64_t)&v95, 0x112uLL, *(double *)(*(void *)(v5 + 32) + 736));
  objc_msgSend(*(id *)(v5 + 32), "_totalConfirmRatioStandardDeviation", v57);
  ATXSetInput((uint64_t)&v95, 0x111uLL, v58);
  ATXSetInput((uint64_t)&v95, 0x113uLL, (double)*(int *)(*(void *)(v5 + 32) + 728));
  ATXSetInput((uint64_t)&v95, 0x114uLL, *((double *)v7 + 16));
  ATXSetInput((uint64_t)&v95, 0x115uLL, *((double *)v7 + 11));
  ATXSetInput((uint64_t)&v95, 0x116uLL, *((double *)v7 + 12));
  ATXSetInput((uint64_t)&v95, 0x117uLL, *((double *)v7 + 17));
  ATXSetInput((uint64_t)&v95, 0x118uLL, *((double *)v7 + 18));
  ATXSetInput((uint64_t)&v95, 0x119uLL, *((double *)v7 + 19));
  ATXSetInput((uint64_t)&v95, 0x11AuLL, *((double *)v7 + 20));
  ATXSetInput((uint64_t)&v95, 0x11BuLL, *((double *)v7 + 21));
  ATXSetInput((uint64_t)&v95, 0x11CuLL, *((double *)v7 + 22));
  ATXSetInput((uint64_t)&v95, 0x11DuLL, *((double *)v7 + 23));
  ATXSetInput((uint64_t)&v95, 0x11EuLL, *((double *)v7 + 24));
  ATXSetInput((uint64_t)&v95, 0x123uLL, *(double *)(*(void *)(v5 + 32) + 160));
  ATXSetInput((uint64_t)&v95, 0x124uLL, *(double *)(*(void *)(v5 + 32) + 168));
  ATXSetInput((uint64_t)&v95, 0x11FuLL, *((double *)v7 + 66));
  ATXSetInput((uint64_t)&v95, 0x120uLL, *((double *)v7 + 67));
  ATXSetInput((uint64_t)&v95, 0x121uLL, *((double *)v7 + 68));
  ATXSetInput((uint64_t)&v95, 0x122uLL, *((double *)v7 + 69));
  ATXSetInput((uint64_t)&v95, 0x125uLL, *((double *)v7 + 25));
  ATXSetInput((uint64_t)&v95, 0x126uLL, *((double *)v7 + 26));
  ATXSetInput((uint64_t)&v95, 0x127uLL, *((double *)v7 + 13));
  ATXSetInput((uint64_t)&v95, 0x128uLL, *((double *)v7 + 14));
  ATXSetInput((uint64_t)&v95, 0x129uLL, *((double *)v7 + 15));
  ATXSetInput((uint64_t)&v95, 0x12AuLL, *((double *)v7 + 27));
  ATXSetInput((uint64_t)&v95, 0x12BuLL, *((double *)v7 + 28));
  ATXSetInput((uint64_t)&v95, 0x130uLL, *(double *)(*(void *)(v5 + 32) + 200));
  ATXSetInput((uint64_t)&v95, 0x131uLL, *(double *)(*(void *)(v5 + 32) + 208));
  ATXSetInput((uint64_t)&v95, 0x132uLL, *(double *)(*(void *)(v5 + 32) + 216));
  ATXSetInput((uint64_t)&v95, 0x133uLL, *(double *)(*(void *)(v5 + 32) + 224));
  ATXSetInput((uint64_t)&v95, 0x12CuLL, *((double *)v7 + 70));
  ATXSetInput((uint64_t)&v95, 0x12DuLL, *((double *)v7 + 71));
  ATXSetInput((uint64_t)&v95, 0x12EuLL, *((double *)v7 + 72));
  ATXSetInput((uint64_t)&v95, 0x12FuLL, *((double *)v7 + 73));
  ATXSetInput((uint64_t)&v95, 0x1A5uLL, *((double *)v7 + 80));
  ATXSetInput((uint64_t)&v95, 0x1A7uLL, *((double *)v7 + 81));
  ATXSetInput((uint64_t)&v95, 0x1A9uLL, *((double *)v7 + 82));
  ATXSetInput((uint64_t)&v95, 0x1ABuLL, *((double *)v7 + 83));
  ATXSetInput((uint64_t)&v95, 0x1ADuLL, *((double *)v7 + 84));
  ATXSetInput((uint64_t)&v95, 0x1AFuLL, *((double *)v7 + 85));
  ATXSetInput((uint64_t)&v95, 0x1B1uLL, *((double *)v7 + 86));
  ATXSetInput((uint64_t)&v95, 0x1B3uLL, *((double *)v7 + 87));
  ATXSetInput((uint64_t)&v95, 0x1B5uLL, *((double *)v7 + 88));
  ATXSetInput((uint64_t)&v95, 0x1B7uLL, *((double *)v7 + 89));
  ATXSetInput((uint64_t)&v95, 0x1B9uLL, *((double *)v7 + 90));
  ATXSetInput((uint64_t)&v95, 0x1BBuLL, *((double *)v7 + 91));
  ATXSetInput((uint64_t)&v95, 0x232uLL, *((double *)v7 + 48));
  ATXSetInput((uint64_t)&v95, 0x234uLL, *((double *)v7 + 97));
  ATXSetInput((uint64_t)&v95, 0x229uLL, *((double *)v7 + 51));
  ATXSetInput((uint64_t)&v95, 0x22BuLL, *((double *)v7 + 92));
  ATXSetInput((uint64_t)&v95, 0x22CuLL, *((double *)v7 + 93));
  ATXSetInput((uint64_t)&v95, 0x22EuLL, *((double *)v7 + 94));
  ATXSetInput((uint64_t)&v95, 0x22FuLL, *((double *)v7 + 95));
  ATXSetInput((uint64_t)&v95, 0x231uLL, *((double *)v7 + 96));
  ATXSetInput((uint64_t)&v95, 0x235uLL, *((double *)v7 + 98));
  ATXSetInput((uint64_t)&v95, 0x237uLL, *((double *)v7 + 99));
  ATXSetInput((uint64_t)&v95, 0x238uLL, *((double *)v7 + 100));
  ATXSetInput((uint64_t)&v95, 0x23AuLL, *((double *)v7 + 101));
  ATXSetInput((uint64_t)&v95, 0x23BuLL, *((double *)v7 + 102));
  ATXSetInput((uint64_t)&v95, 0x23DuLL, *((double *)v7 + 103));
  ATXSetInput((uint64_t)&v95, 0x23EuLL, *((double *)v7 + 104));
  ATXSetInput((uint64_t)&v95, 0x240uLL, *((double *)v7 + 105));
  ATXSetInput((uint64_t)&v95, 0x241uLL, *((double *)v7 + 106));
  ATXSetInput((uint64_t)&v95, 0x243uLL, *((double *)v7 + 107));
  ATXSetInput((uint64_t)&v95, 0x244uLL, *((double *)v7 + 108));
  ATXSetInput((uint64_t)&v95, 0x246uLL, *((double *)v7 + 109));
  ATXSetInput((uint64_t)&v95, 0x247uLL, *((double *)v7 + 110));
  ATXSetInput((uint64_t)&v95, 0x249uLL, *((double *)v7 + 111));
  ATXSetInput((uint64_t)&v95, 0x24AuLL, *((double *)v7 + 112));
  ATXSetInput((uint64_t)&v95, 0x24CuLL, *((double *)v7 + 113));
  ATXSetInput((uint64_t)&v95, 0x302uLL, *((double *)v7 + 114));
  ATXSetInput((uint64_t)&v95, 0x305uLL, *((double *)v7 + 118));
  ATXSetInput((uint64_t)&v95, 0x308uLL, *((double *)v7 + 122));
  ATXSetInput((uint64_t)&v95, 0x30BuLL, *((double *)v7 + 126));
  ATXSetInput((uint64_t)&v95, 0x30EuLL, *((double *)v7 + 130));
  ATXSetInput((uint64_t)&v95, 0x311uLL, *((double *)v7 + 134));
  ATXSetInput((uint64_t)&v95, 0x314uLL, *((double *)v7 + 116));
  ATXSetInput((uint64_t)&v95, 0x317uLL, *((double *)v7 + 120));
  ATXSetInput((uint64_t)&v95, 0x31AuLL, *((double *)v7 + 124));
  ATXSetInput((uint64_t)&v95, 0x31DuLL, *((double *)v7 + 128));
  ATXSetInput((uint64_t)&v95, 0x320uLL, *((double *)v7 + 132));
  ATXSetInput((uint64_t)&v95, 0x323uLL, *((double *)v7 + 136));
  ATXSetInput((uint64_t)&v95, 0x304uLL, *((double *)v7 + 115));
  ATXSetInput((uint64_t)&v95, 0x307uLL, *((double *)v7 + 119));
  ATXSetInput((uint64_t)&v95, 0x30AuLL, *((double *)v7 + 123));
  ATXSetInput((uint64_t)&v95, 0x30DuLL, *((double *)v7 + 127));
  ATXSetInput((uint64_t)&v95, 0x310uLL, *((double *)v7 + 131));
  ATXSetInput((uint64_t)&v95, 0x313uLL, *((double *)v7 + 135));
  ATXSetInput((uint64_t)&v95, 0x316uLL, *((double *)v7 + 117));
  ATXSetInput((uint64_t)&v95, 0x319uLL, *((double *)v7 + 121));
  ATXSetInput((uint64_t)&v95, 0x31CuLL, *((double *)v7 + 125));
  ATXSetInput((uint64_t)&v95, 0x31FuLL, *((double *)v7 + 129));
  ATXSetInput((uint64_t)&v95, 0x322uLL, *((double *)v7 + 133));
  *(float *)&double v59 = ATXSetInput((uint64_t)&v95, 0x325uLL, *((double *)v7 + 137));
  double v89 = objc_msgSend(*((id *)v7 + 145), "allValues", v59);
  double v60 = [*((id *)v7 + 144) allValues];
  int v61 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:*((void *)v7 + 143)];
  +[ATXSlotResolution setDistributionBasedScoreInputsForTimeOfDayForItem:&v95 withLaunchDistribution:v61];

  double v62 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:*((void *)v7 + 142)];
  +[ATXSlotResolution setDistributionBasedScoreInputsForDayOfWeekForItem:&v95 withLaunchDistribution:v62];

  +[ATXSlotResolution setDistributionBasedScoreInputsForItem:&v95 withGeoHashResolution:0 withLaunchCounts:v89];
  +[ATXSlotResolution setDistributionBasedScoreInputsForItem:&v95 withGeoHashResolution:1 withLaunchCounts:v60];
  double v63 = [*(id *)(*(void *)(*(void *)(v5 + 80) + 8) + 40) objectForKey:*(void *)(v5 + 56)];
  LODWORD(v62) = v63 == 0;

  if (v62)
  {
    double v64 = *(void **)(*(void *)(*(void *)(v5 + 80) + 8) + 40);
    double v65 = NSNumber;
    double v66 = +[_ATXAppLaunchHistogramManager sharedInstance];
    double v67 = [v66 histogramForLaunchType:0];
    v97[0] = *(void *)(v5 + 56);
    double v68 = [MEMORY[0x1E4F1C978] arrayWithObjects:v97 count:1];
    [v67 totalLaunchesForBundleIds:v68];
    double v69 = objc_msgSend(v65, "numberWithDouble:");
    [v64 setObject:v69 forKey:*(void *)(v5 + 56)];
  }
  double v70 = [*(id *)(*(void *)(*(void *)(v5 + 80) + 8) + 40) objectForKey:*(void *)(v5 + 56)];
  [v70 doubleValue];
  ATXSetInput((uint64_t)&v95, 0x103uLL, v71 + 1.0);

  ATXSetInput((uint64_t)&v95, 0x104uLL, *((double *)v7 + 74));
  *(float *)&double v72 = ATXSetInput((uint64_t)&v95, 0x102uLL, -31337.0);
  double v73 = *(void **)(*(void *)(v5 + 32) + 24);
  double v74 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v92, "slotHash", v72));
  double v75 = [v73 objectForKeyedSubscript:v74];

  ATXSetInput((uint64_t)&v95, 0x105uLL, v75[1]);
  ATXSetInput((uint64_t)&v95, 0x286uLL, *((double *)v7 + 138));
  ATXSetInput((uint64_t)&v95, 0x287uLL, *((double *)v7 + 139));
  ATXSetInput((uint64_t)&v95, 0x288uLL, *((double *)v7 + 140));
  ATXSetInput((uint64_t)&v95, 0x289uLL, *((double *)v7 + 141));
  *(float *)&double v76 = ATXSetInput((uint64_t)&v95, 0x106uLL, v75[2]);
  double v77 = +[ATXActionLOIBoost sharedInstance];
  [v77 boostForActionKey:*(void *)(*(void *)(v5 + 32) + 8)];
  ATXSetInput((uint64_t)&v95, 0x100uLL, v78);

  *(float *)&double v79 = ATXSetInput((uint64_t)&v95, 0xFCuLL, (double)(+[ATXSlotResolution isNotLaunchedWithinShortTimeSpan:v7] ^ 1));
  double v80 = +[_ATXAppPredictor sharedInstance];
  [v80 setupScoreLogger:*(void *)(v5 + 40) forConsumerSubType:25];

  double v81 = +[_ATXAppPredictor sharedInstance];
  [v81 _predictionScoreAndUpdateConfidenceForItem:&v95 interpreter:*(void *)(*(void *)(v5 + 64) + 16) consumerSubType:25 scoreLogger:*(void *)(v5 + 40) intentType:0];
  double v83 = v82;

  float v84 = v83;
  *((float *)&v96[409] + 1) = v84;
  ATXSetInput((uint64_t)&v95, 0x17FuLL, v83);
  double v85 = [ATXActionPredictionContainer alloc];
  *(float *)&double v86 = v83;
  uint64_t v87 = [(ATXActionPredictionContainer *)v85 initWithMinimalSlotResolutionParameters:v92 score:*(void *)(*(void *)(v5 + 32) + 8) actionKey:v86];
  id v88 = v95;
  id v93 = v88;
  memcpy(v94, v96, sizeof(v94));
  if (v87) {
    [(ATXActionPredictionContainer *)v87 setPredictionItem:&v93];
  }
  else {

  }
  [*(id *)(v5 + 72) addObject:v87];
}

+ (void)setDistributionBasedScoreInputsForTimeOfDayForItem:(ATXPredictionItem *)a3 withLaunchDistribution:(id)a4
{
  id v12 = a4;
  for (uint64_t i = 0; i != 25; ++i)
  {
    id v6 = (void *)MEMORY[0x1D25F6CC0]();
    unint64_t v7 = +[_ATXScoreTypes mappingForTimeOfDayDistributionSignals:i forScoreInputCategory:1];
    uint64_t v8 = [NSNumber numberWithInt:i];
    v9 = [v12 objectForKeyedSubscript:v8];
    [v9 doubleValue];
    double v11 = v10;

    ATXSetInput((uint64_t)a3, v7, v11);
  }
}

+ (void)setDistributionBasedScoreInputsForDayOfWeekForItem:(ATXPredictionItem *)a3 withLaunchDistribution:(id)a4
{
  id v12 = a4;
  for (uint64_t i = 0; i != 7; ++i)
  {
    id v6 = (void *)MEMORY[0x1D25F6CC0]();
    unint64_t v7 = +[_ATXScoreTypes mappingForDayOfWeekDistributionSignals:i forScoreInputCategory:1];
    uint64_t v8 = [NSNumber numberWithInt:i];
    v9 = [v12 objectForKeyedSubscript:v8];
    [v9 doubleValue];
    double v11 = v10;

    ATXSetInput((uint64_t)a3, v7, v11);
  }
}

+ (void)setDistributionBasedScoreInputsForItem:(ATXPredictionItem *)a3 withGeoHashResolution:(unint64_t)a4 withLaunchCounts:(id)a5
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v20 = a5;
  int v8 = 0;
  if ((uint64_t)a4 <= 1)
  {
    if (a4)
    {
      if (a4 != 1) {
        goto LABEL_11;
      }
      *(float *)&double v7 = ATXSetInput((uint64_t)a3, 0x28BuLL, (double)(unint64_t)[v20 count]);
      v9 = &kATXActionNumberOfScoreInputsForCoarseGeoHash;
    }
    else
    {
      *(float *)&double v7 = ATXSetInput((uint64_t)a3, 0x28AuLL, (double)(unint64_t)[v20 count]);
      v9 = &kATXActionNumberOfScoreInputsForSpecificGeoHash;
    }
    int v8 = *v9;
LABEL_11:
    double v10 = objc_msgSend(MEMORY[0x1E4F29008], "sortDescriptorWithKey:ascending:", @"self", 0, v7);
    v21[0] = v10;
    double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    id v12 = [v20 sortedArrayUsingDescriptors:v11];

    for (unint64_t i = 0; ; ++i)
    {
      unint64_t v14 = [v12 count];
      unint64_t v15 = v14 >= v8 ? v8 : v14;
      if (i >= v15) {
        break;
      }
      double v16 = (void *)MEMORY[0x1D25F6CC0]();
      unint64_t v17 = +[_ATXScoreTypes mappingForTopRankedGeoHashSignalsWithResolution:a4 withRank:i forScoreInputCategory:1];
      double v18 = [v12 objectAtIndex:i];
      [v18 doubleValue];
      ATXSetInput((uint64_t)a3, v17, v19);
    }

    goto LABEL_18;
  }
  if (a4 == 2)
  {
    double v10 = __atxlog_handle_action_prediction();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[ATXSlotResolution setDistributionBasedScoreInputsForItem:withGeoHashResolution:withLaunchCounts:](v10);
    }
  }
  else
  {
    if (a4 != 0xFFFFFFFF) {
      goto LABEL_11;
    }
    double v10 = __atxlog_handle_action_prediction();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[ATXSlotResolution setDistributionBasedScoreInputsForItem:withGeoHashResolution:withLaunchCounts:](v10);
    }
  }
LABEL_18:
}

+ (BOOL)isNotLaunchedWithinShortTimeSpan:(id)a3
{
  id v3 = a3;
  if (+[ATXSlotResolution isNotLaunchedWithinShortTimeSpan:]::onceToken != -1) {
    dispatch_once(&+[ATXSlotResolution isNotLaunchedWithinShortTimeSpan:]::onceToken, &__block_literal_global_68);
  }
  BOOL v6 = 1;
  if (v3[6])
  {
    id v4 = (void *)v3[7];
    if (v4)
    {
      objc_msgSend(v4, "timeIntervalSinceDate:");
      if (v5 <= (double)+[ATXSlotResolution isNotLaunchedWithinShortTimeSpan:]::minimumTimespanForOnceOffActions) {
        BOOL v6 = 0;
      }
    }
  }

  return v6;
}

void __54__ATXSlotResolution_isNotLaunchedWithinShortTimeSpan___block_invoke()
{
  id v0 = +[_ATXGlobals sharedInstance];
  +[ATXSlotResolution isNotLaunchedWithinShortTimeSpan:]::minimumTimespanForOnceOffActions = [v0 minimumTimespanForOnceOffActions];
}

+ (void)setSlotResolutionPredictionItemForTopUpcomingMediaActionContainer:(id)a3 appActionPredictionItem:(const ATXPredictionItem *)a4 appActionLogProbability:(double)a5
{
  double v5 = MEMORY[0x1F4188790](a1, a2);
  uint64_t v7 = v6;
  id v9 = v8;
  if (v7)
  {
    id v13 = *(id *)v7;
    memcpy(v14, (const void *)(v7 + 8), sizeof(v14));
    ATXSetInput((uint64_t)&v13, 0x17DuLL, *(float *)(v7 + 3284));
    ATXSetInput((uint64_t)&v13, 0x17EuLL, v5);
    id v10 = v13;
    id v11 = v10;
    memcpy(v12, v14, sizeof(v12));
    if (v9) {
      [v9 setPredictionItem:&v11];
    }
    else {
  }
    }
}

+ (void)setSlotLogProbabilityForCandidateActionPredictions:(id)a3
{
  MEMORY[0x1F4188790](a1, a2);
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v16;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v15 + 1) + 8 * v7);
        if (v8) {
          [*(id *)(*((void *)&v15 + 1) + 8 * v7) predictionItem];
        }
        else {
          bzero(&v13, 0xCE0uLL);
        }
        objc_msgSend(v8, "score", v11);
        ATXSetInput((uint64_t)&v13, 0x180uLL, v9);
        id v10 = v13;
        id v11 = v10;
        memcpy(v12, v14, sizeof(v12));
        if (v8) {
          [v8 setPredictionItem:&v11];
        }
        else {

        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16, v11);
    }
    while (v5);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slotResolutionInterpreter, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
}

+ (void)setDistributionBasedScoreInputsForItem:(os_log_t)log withGeoHashResolution:withLaunchCounts:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 134217984;
  uint64_t v2 = 2;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "GeoHash Resolution not supported in ATXSlotResolution: %lu", (uint8_t *)&v1, 0xCu);
}

+ (void)setDistributionBasedScoreInputsForItem:(os_log_t)log withGeoHashResolution:withLaunchCounts:.cold.2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 134217984;
  uint64_t v2 = 0xFFFFFFFFLL;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "Unknown GeoHash Resolution: %lu", (uint8_t *)&v1, 0xCu);
}

@end
@interface _ATXAppPredictor
+ (id)_arrayFromSet:(id)a3 upToSize:(unint64_t)a4;
+ (id)getParseTreeForConsumerSubType:(unsigned __int8)a3;
+ (id)inputScoresForPredictionItem:(const ATXPredictionItem *)a3;
+ (id)pruneItemsToRankForConsumerSubType:(unsigned __int8)a3 itemsToRank:(id)a4 datastore:(id)a5;
+ (id)recreateSharedInstanceWithCurrentABGroup;
+ (id)sharedInstance;
+ (void)updateConfidenceForItem:(ATXPredictionItem *)a3 subscores:(id)a4;
- (ATXCDNDownloaderTriggerManager)cdnDownloaderTriggerManager;
- (BOOL)_initAppLaunchAndInstallMonitors;
- (BOOL)_initDependencies;
- (BOOL)predictAndWriteCacheFileWithLimit:(unint64_t)a3 consumerSubType:(unsigned __int8)a4 intent:(id)a5 candidateBundleIdentifiers:(id)a6 candidateActiontypes:(id)a7 scoreLogger:(id)a8 path:(id)a9 cacheFileDescriptors:(id)a10 featureCache:(id)a11;
- (BOOL)writeCacheFileWithSerializedChunks:(id)a3 path:(id)a4 cacheFileDescriptors:(id)a5 consumerSubType:(unsigned __int8)a6;
- (NSArray)abGroupIdentifiers;
- (double)_predictionScoreAndUpdateConfidenceForItem:(ATXPredictionItem *)a3 interpreter:(id)a4 consumerSubType:(unsigned __int8)a5 scoreLogger:(id)a6 intentType:(id)a7;
- (double)finalScoreForSubscores:(id)a3 consumerSubType:(unsigned __int8)a4;
- (double)predictionScoreAndUpdateConfidenceForItem:(ATXPredictionItem *)a3 consumerSubType:(unsigned __int8)a4;
- (float)_getPredictionForItems:(unint64_t)a3 clipBundleIdsToRank:(void *)a4 consumerSubType:intent:scoreLogger:context:featureCache:;
- (id)_allDayZeroApps;
- (id)_appPredictionsSeedAppsGivenSBAppList:(id)a3 consumerSubType:(unsigned __int8)a4 minimumDesiredApps:(unint64_t)a5;
- (id)_appsToPredictWithConsumerSubType:(unsigned __int8)a3 intent:(id)a4 candidateBundleIdentifiers:(id)a5 allSBApps:(id)a6 appPredictionBlacklist:(id)a7 digitalHealthBlacklist:(id)a8;
- (id)appInstallMonitor;
- (id)appIntentMonitor;
- (id)appLaunchMonitor;
- (id)getABGroups;
- (id)getPredictionModelDetailsForConsumerSubType:(unsigned __int8)a3;
- (id)initInternal;
- (id)predictWithLimit:(unint64_t)a3 consumerSubType:(unsigned __int8)a4 intent:(id)a5 candidateBundleIdentifiers:(id)a6 candidateActiontypes:(id)a7 scoreLogger:(id)a8;
- (id)predictWithLimit:(unint64_t)a3 consumerSubType:(unsigned __int8)a4 intent:(id)a5 candidateBundleIdentifiers:(id)a6 candidateActiontypes:(id)a7 scoreLogger:(id)a8 predictionItemsToKeep:(void *)a9 predictedItemsOutParameter:(void *)a10 context:(id)a11 datastore:(id)a12 featureCache:(id)a13;
- (id)predictWithLimit:(unint64_t)a3 consumerSubType:(unsigned __int8)a4 intent:(id)a5 candidateBundleIdentifiers:(id)a6 candidateActiontypes:(id)a7 scoreLogger:(id)a8 predictionItemsToKeep:(void *)a9 predictedItemsOutParameter:(void *)a10 context:(id)a11 featureCache:(id)a12;
- (id)predictWithLimit:(unint64_t)a3 consumerSubType:(unsigned __int8)a4 intent:(id)a5 candidateBundleIdentifiers:(id)a6 candidateActiontypes:(id)a7 scoreLogger:(id)a8 predictionItemsToKeep:(void *)a9 predictedItemsOutParameter:(void *)a10 datastore:(id)a11;
- (id)predictWithLimit:(unint64_t)a3 consumerSubType:(unsigned __int8)a4 intent:(id)a5 candidateBundleIdentifiers:(id)a6 candidateActiontypes:(id)a7 scoreLogger:(id)a8 predictionItemsToKeep:(void *)a9 predictedItemsOutParameter:(void *)a10 featureCache:(id)a11;
- (id)recentInstallCache;
- (unordered_map<NSString)_createMapOfKeyToItemForPredictionItems:()ATXNSStringHash;
- (vector<ATXPredictionItem,)_evalFeaturesForActions:(_ATXAppPredictor *)self scoreLogger:(SEL)a3 context:(id)a4 featureCache:(id)a5;
- (vector<ATXPredictionItem,)_evalFeaturesForAppForAllIntents:(_ATXAppPredictor *)self scoreLogger:(SEL)a3 context:(id)a4;
- (vector<ATXPredictionItem,)_evalFeaturesForAppIntents:(_ATXAppPredictor *)self scoreLogger:(SEL)a3 context:(id)a4;
- (vector<ATXPredictionItem,)_getPredictionForItems:(_ATXAppPredictor *)self clipBundleIdsToRank:(SEL)a3 consumerSubType:(id)a4 intent:(id)a5 scoreLogger:(unsigned __int8)a6 context:(id)a7 featureCache:(id)a8;
- (void)_addZeroDayAppIntentKeysToBundleIdTable:(id)a3;
- (void)_copyValidScoreInputsFromPredictionItem:(const ATXPredictionItem *)a3 toPredictionItem:(ATXPredictionItem *)a4;
- (void)_getPredictionForItems:(unint64_t)a3 clipBundleIdsToRank:(void *)a4 consumerSubType:(uint64_t)a5 intent:scoreLogger:context:featureCache:;
- (void)_getPredictionForItems:(void *)a1 clipBundleIdsToRank:(void *)a2 consumerSubType:(void *)a3 intent:(uint64_t)a4 scoreLogger:(uint64_t)a5 context:(id *)a6 featureCache:(uint64_t)a7;
- (void)_initAppLaunchAndInstallMonitors;
- (void)_initDependencies;
- (void)_initFeaturizers;
- (void)_setActionBlacklist:(id)a3;
- (void)_updateFromAsset;
- (void)_updateFromZeroDayAsset;
- (void)_updateFromZeroDayIntentAsset;
- (void)dealloc;
- (void)initInternal;
- (void)iterZeroDayAppIntentKeysWithBlock:(id)a3;
- (void)logCacheAgeAtRefreshForNonBlendingCachesWithCachePath:(id)a3 consumerSubType:(unsigned __int8)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)receiveFeedbackForConsumerType:(unint64_t)a3 consumerSubType:(unsigned __int8)a4 atxResponse:(id)a5 engagementType:(unint64_t)a6 engagedBundleId:(id)a7 bundleIdsShown:(id)a8 explicitlyRejectedBundleIds:(id)a9 context:(id)a10;
- (void)resetRecentInstallCache;
- (void)setAbGroupIdentifiers:(id)a3;
- (void)setCdnDownloaderTriggerManager:(id)a3;
- (void)setupScoreLogger:(id)a3 forConsumerSubType:(unsigned __int8)a4;
- (void)train;
- (void)trainWithActivity:(id)a3;
@end

@implementation _ATXAppPredictor

- (id)_allDayZeroApps
{
  v2 = [MEMORY[0x1E4F4AF40] dayZeroBundleIdsAndScoresFromDayZeroParameters:self->_dayZeroParameters];
  v3 = [v2 allKeys];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v3];

  return v4;
}

- (id)_appPredictionsSeedAppsGivenSBAppList:(id)a3 consumerSubType:(unsigned __int8)a4 minimumDesiredApps:(unint64_t)a5
{
  id v7 = a3;
  id v8 = objc_alloc(MEMORY[0x1E4F1CA80]);
  if (v7) {
    id v9 = v7;
  }
  else {
    id v9 = (id)MEMORY[0x1E4F1CBF0];
  }
  v10 = (void *)[v8 initWithArray:v9];
  v11 = [(_ATXRecentInstallCache *)self->_recentInstallCache allRecentlyInstalledApplications];
  [v10 unionSet:v11];

  v12 = [(_ATXAppPredictor *)self _allDayZeroApps];
  v13 = [(_ATXAppInfoManager *)self->_appInfoManager allAppsLaunchedOrInstalledWithin30Days];
  [v12 unionSet:v13];

  [v10 intersectSet:v12];
  if ([v10 count] < a5)
  {
    v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v9];
    [v14 minusSet:v10];
    v15 = +[_ATXAppPredictor _arrayFromSet:upToSize:](_ATXAppPredictor, "_arrayFromSet:upToSize:", v14, a5 - [v10 count]);
    [v10 addObjectsFromArray:v15];
  }
  return v10;
}

+ (id)_arrayFromSet:(id)a3 upToSize:(unint64_t)a4
{
  id v5 = a3;
  if ([v5 count] <= a4)
  {
    id v7 = [v5 allObjects];
  }
  else
  {
    v6 = [v5 allObjects];
    id v7 = objc_msgSend(v6, "subarrayWithRange:", 0, a4);
  }
  return v7;
}

- (id)_appsToPredictWithConsumerSubType:(unsigned __int8)a3 intent:(id)a4 candidateBundleIdentifiers:(id)a5 allSBApps:(id)a6 appPredictionBlacklist:(id)a7 digitalHealthBlacklist:(id)a8
{
  uint64_t v11 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  if ([v13 count])
  {
    if (v13) {
      id v17 = v13;
    }
    else {
      id v17 = (id)MEMORY[0x1E4F1CBF0];
    }
    uint64_t v18 = [MEMORY[0x1E4F1CA80] setWithArray:v17];
  }
  else
  {
    uint64_t v18 = [(_ATXAppPredictor *)self _appPredictionsSeedAppsGivenSBAppList:v14 consumerSubType:v11 minimumDesiredApps:40];
  }
  v19 = (void *)v18;
  unint64_t v20 = [MEMORY[0x1E4F4B680] consumerTypeForSubType:v11];
  if (v20 <= 0xF && ((1 << v20) & 0xC006) != 0 && v15) {
    [v19 minusSet:v15];
  }
  if (v16) {
    [v19 minusSet:v16];
  }

  return v19;
}

- (vector<ATXPredictionItem,)_evalFeaturesForAppForAllIntents:(_ATXAppPredictor *)self scoreLogger:(SEL)a3 context:(id)a4
{
  id v120 = a4;
  id v101 = a5;
  id v113 = a6;
  id v8 = [v113 timeContext];
  id v9 = [v8 date];

  int v10 = [v120 count];
  std::vector<ATXPredictionItem>::vector(retstr, v10);
  uint64_t v11 = [v113 deviceStateContext];
  int v115 = [v11 inAirplaneMode];

  v12 = [v113 userContext];
  v114 = [v12 lastUnlockDate];

  id v13 = [v113 deviceStateContext];
  v122 = [v13 wifiSSID];

  id v14 = [v113 locationMotionContext];
  uint64_t v15 = [v14 motionType];

  v119 = [MEMORY[0x1E4F93608] getMotionStringFromMotionType:v15];
  id v16 = [v113 locationMotionContext];
  v110 = [v16 currentLOI];

  id v17 = +[_ATXAppLaunchHistogramManager sharedInstance];
  uint64_t v18 = [v17 histogramForLaunchType:16];
  v19 = [v17 histogramForLaunchType:19];
  v102 = [v17 histogramForLaunchType:25];
  v111 = [v17 histogramForLaunchType:28];
  v123 = [v17 histogramForLaunchType:22];
  unint64_t v20 = [v17 categoricalHistogramForLaunchType:31];
  v118 = [v17 categoricalHistogramForLaunchType:39];
  v117 = [v17 categoricalHistogramForLaunchType:33];
  v116 = [v17 categoricalHistogramForLaunchType:34];
  [v18 entropy];
  double v108 = v21;
  [v19 entropy];
  double v107 = v22;
  [v19 entropyForDate:v9];
  double v106 = v23;
  [v123 entropy];
  double v105 = v24;
  v121 = v19;
  [v20 entropy];
  double v26 = v25;
  uint64_t v104 = v15;
  [v20 entropyForCategory:v122];
  if (v10 >= 1)
  {
    double v28 = v27;
    uint64_t v29 = 0;
    double v30 = 0.0;
    double v31 = 0.0;
    double v32 = 0.0;
    do
    {
      v33 = [v120 objectAtIndexedSubscript:v29];
      [v18 overallLaunchPopularityForBundleId:v33];
      double v35 = v34;
      [v19 relativeLaunchPopularityWithBundleId:v33 date:v9];
      double v37 = v36;
      [v123 relativeLaunchPopularityWithBundleId:v33 date:v9];
      double v39 = v38;
      [v20 relativeLaunchPopularityWithBundleId:v33 category:v122];
      double v32 = v32 + vabdd_f64(v35, v37);
      double v31 = v31 + vabdd_f64(v35, v39);
      double v30 = v30 + vabdd_f64(v35, v40);

      ++v29;
    }
    while (v10 != v29);
    uint64_t v103 = v10;
    unint64_t v41 = 0;
    double v42 = (double)v10;
    do
    {
      v43 = (void *)MEMORY[0x1D25F6CC0]();
      id v44 = [v120 objectAtIndexedSubscript:v41];
      id v124 = v44;
      *(float *)&v125[819] = -31337.0;
      LOWORD(v125[820]) = 0;
      for (uint64_t i = 4; i != 821; ++i)
        *(float *)&v125[i - 2] = -31337.0;
      [v18 overallLaunchPopularityForBundleId:v44];
      *(float *)&double v47 = ATXSetInput((uint64_t)&v124, 0x9DuLL, v46);
      objc_msgSend(v18, "launchPopularityWithBundleId:date:", v44, v9, v47);
      *(float *)&double v49 = ATXSetInput((uint64_t)&v124, 0xA7uLL, v48);
      objc_msgSend(v18, "relativeLaunchPopularityWithBundleId:date:", v44, v9, v49);
      ATXSetInput((uint64_t)&v124, 0x9EuLL, v50);
      LODWORD(v51) = 1036831949;
      [v18 relativeLaunchPopularityWithBundleId:v44 date:v9 distanceScale:v51];
      *(float *)&double v53 = ATXSetInput((uint64_t)&v124, 0xA0uLL, v52);
      objc_msgSend(v18, "totalLaunches", v53);
      *(float *)&double v55 = ATXSetInput((uint64_t)&v124, 0x98uLL, v54);
      objc_msgSend(v121, "launchPopularityWithBundleId:date:", v44, v9, v55);
      *(float *)&double v57 = ATXSetInput((uint64_t)&v124, 0xA8uLL, v56);
      objc_msgSend(v121, "relativeLaunchPopularityWithBundleId:date:", v44, v9, v57);
      *(float *)&double v59 = ATXSetInput((uint64_t)&v124, 0x9FuLL, v58);
      if (v114)
      {
        objc_msgSend(v9, "timeIntervalSinceDate:", v114, v59);
        if (v60 >= 0.0)
        {
          HIDWORD(v61) = 1085021696;
          if (v60 >= 3600.0) {
            double v60 = 3599.0;
          }
          LODWORD(v61) = 1.0;
          [v102 relativeLaunchPopularityWithBundleId:v44 elapsedTime:v60 distanceScale:v61];
          ATXSetInput((uint64_t)&v124, 0xA1uLL, v62);
        }
      }
      double v63 = 0.0;
      if (v115) {
        objc_msgSend(v111, "overallLaunchPopularityForBundleId:", v44, 0.0);
      }
      ATXSetInput((uint64_t)&v124, 0xA2uLL, v63);
      double v64 = 0.0;
      if (v115) {
        objc_msgSend(v111, "totalLaunches", 0.0);
      }
      *(float *)&double v65 = ATXSetInput((uint64_t)&v124, 0x99uLL, v64);
      objc_msgSend(v123, "overallLaunchPopularityForBundleId:", v44, v65);
      *(float *)&double v67 = ATXSetInput((uint64_t)&v124, 0xA5uLL, v66);
      objc_msgSend(v123, "totalLaunches", v67);
      *(float *)&double v69 = ATXSetInput((uint64_t)&v124, 0x9CuLL, v68);
      objc_msgSend(v20, "overallLaunchPopularityForBundleId:category:", v44, v122, v69);
      *(float *)&double v71 = ATXSetInput((uint64_t)&v124, 0xA3uLL, v70);
      objc_msgSend(v20, "totalLaunchesForCategory:", v122, v71);
      *(float *)&double v73 = ATXSetInput((uint64_t)&v124, 0x9AuLL, v72);
      objc_msgSend(v118, "overallLaunchPopularityForBundleId:category:", v44, v119, v73);
      *(float *)&double v75 = ATXSetInput((uint64_t)&v124, 0xA4uLL, v74);
      objc_msgSend(v118, "totalLaunchesForCategory:", v119, v75);
      *(float *)&double v77 = ATXSetInput((uint64_t)&v124, 0x9BuLL, v76);
      appLaunchLocation = self->_appLaunchLocation;
      v79 = objc_msgSend(v113, "locationMotionContext", v77);
      v80 = [v79 currentLOI];
      [(_ATXAppLaunchLocation *)appLaunchLocation launchProbabilityAtLOI:v80 appForAllIntentsBundleId:v44];
      ATXSetInput((uint64_t)&v124, 0xA6uLL, v81);

      ATXSetInput((uint64_t)&v124, 0xA9uLL, v108);
      ATXSetInput((uint64_t)&v124, 0xAAuLL, v107);
      *(float *)&double v82 = ATXSetInput((uint64_t)&v124, 0xABuLL, v106);
      objc_msgSend(v121, "entropyForBundleId:", v44, v82);
      ATXSetInput((uint64_t)&v124, 0xACuLL, v83);
      ATXSetInput((uint64_t)&v124, 0xB2uLL, v32);
      ATXSetInput((uint64_t)&v124, 0xADuLL, v105);
      ATXSetInput((uint64_t)&v124, 0xB3uLL, v31);
      ATXSetInput((uint64_t)&v124, 0xAEuLL, v26);
      *(float *)&double v84 = ATXSetInput((uint64_t)&v124, 0xAFuLL, v28);
      objc_msgSend(v20, "entropyForBundleId:", v44, v84);
      ATXSetInput((uint64_t)&v124, 0xB0uLL, v85);
      ATXSetInput((uint64_t)&v124, 0xB1uLL, v30);
      *(float *)&double v86 = ATXSetInput((uint64_t)&v124, 0x97uLL, v42);
      objc_msgSend(v117, "totalLaunchesForBundleId:", v44, v86);
      *(float *)&double v88 = ATXSetInput((uint64_t)&v124, 0xB4uLL, v87);
      objc_msgSend(v116, "totalLaunchesForBundleId:", v44, v88);
      *(float *)&double v90 = ATXSetInput((uint64_t)&v124, 0xB5uLL, v89);
      objc_msgSend(v117, "totalLaunches", v90);
      *(float *)&double v92 = ATXSetInput((uint64_t)&v124, 0xB6uLL, v91);
      objc_msgSend(v116, "totalLaunches", v92);
      *(float *)&double v94 = ATXSetInput((uint64_t)&v124, 0xB7uLL, v93);
      *(float *)&double v95 = ATXSetInput((uint64_t)&v124, 0x178uLL, (double)+[ATXAWDUtils awdMotionTypeWithMotionType:](ATXAWDUtils, "awdMotionTypeWithMotionType:", v104, v94));
      if (v110) {
        ATXSetInput((uint64_t)&v124, 0x179uLL, (double)+[ATXAWDUtils awdLOITypeWithRTLOI:](ATXAWDUtils, "awdLOITypeWithRTLOI:", objc_msgSend(v110, "type", v95)));
      }
      else {
        v125[379] = 0;
      }
      if (0xDAB7EC1DD3431B57 * (((char *)retstr->__end_ - (char *)retstr->__begin_) >> 5) <= v41) {
        std::vector<ATXPredictionItem>::__throw_out_of_range[abi:ne180100]();
      }
      v96 = &retstr->__begin_[v41];
      v97 = v124;
      key = v96->key;
      v96->key = (NSString *)v124;
      id v99 = v97;

      memcpy(&v96->actionHash, v125, 0xCD2uLL);
      ++v41;
    }
    while (v41 != v103);
  }

  return result;
}

- (vector<ATXPredictionItem,)_evalFeaturesForAppIntents:(_ATXAppPredictor *)self scoreLogger:(SEL)a3 context:(id)a4
{
  id v179 = a4;
  id v153 = a5;
  id v187 = a6;
  id v9 = [v187 timeContext];
  int v10 = [v9 date];

  int v11 = [v179 count];
  std::vector<ATXPredictionItem>::vector(retstr, v11);
  v12 = [v187 deviceStateContext];
  int v13 = [v12 inAirplaneMode];

  v184 = +[_ATXAppInfoManager sharedInstance];
  id v14 = [v187 userContext];
  v170 = [v14 lastUnlockDate];

  uint64_t v15 = [v187 deviceStateContext];
  v185 = [v15 wifiSSID];

  id v16 = (void *)MEMORY[0x1E4F93608];
  id v17 = [v187 locationMotionContext];
  v178 = objc_msgSend(v16, "getMotionStringFromMotionType:", objc_msgSend(v17, "motionType"));

  uint64_t v18 = [v184 totalSlotsInDatastore];
  [v18 doubleValue];
  double v164 = v19;

  v156 = +[_ATXAppLaunchHistogramManager sharedInstance];
  v190 = [v156 histogramForLaunchType:14];
  unint64_t v20 = [v156 histogramForLaunchType:17];
  v157 = [v156 histogramForLaunchType:23];
  v167 = [v156 histogramForLaunchType:26];
  v186 = [v156 histogramForLaunchType:20];
  v189 = [v156 categoricalHistogramForLaunchType:29];
  v177 = [v156 categoricalHistogramForLaunchType:38];
  v176 = [v156 categoricalHistogramForLaunchType:40];
  v165 = [v156 categoricalHistogramForLaunchType:41];
  double v21 = [v187 userContext];
  uint64_t v22 = [v21 lastAppActionLaunch];

  v155 = (void *)v22;
  if (v22)
  {
    double v23 = +[_ATXAppLaunchSequenceManager sharedInstance];
    v169 = [v23 launchSequenceForAppAction:v22];
  }
  else
  {
    v169 = 0;
  }
  double v24 = [v187 userContext];
  uint64_t v25 = [v24 secondMostRecentAppLaunch];

  v162 = v10;
  v154 = (void *)v25;
  if (v25)
  {
    double v26 = +[_ATXAppLaunchSequenceManager sharedInstance];
    double v27 = [NSString stringWithFormat:@"%@:#AppLaunched", v25, v153];
    v168 = [v26 launchSequenceForAppAction:v27];
  }
  else
  {
    v168 = 0;
  }
  v174 = [v156 categoricalHistogramForLaunchType:33];
  v173 = [v156 categoricalHistogramForLaunchType:34];
  [v190 entropy];
  double v163 = v28;
  [v20 entropy];
  double v161 = v29;
  [v20 entropyForDate:v10];
  double v160 = v30;
  [v186 entropy];
  double v159 = v31;
  [v189 entropy];
  double v33 = v32;
  [v189 entropyForCategory:v185];
  double v35 = v34;
  if (v11 < 1)
  {
    double v39 = 0.0;
    double v38 = 0.0;
    double v37 = 0.0;
  }
  else
  {
    uint64_t v36 = 0;
    double v37 = 0.0;
    double v38 = 0.0;
    double v39 = 0.0;
    do
    {
      double v40 = [v179 objectAtIndexedSubscript:v36];
      [v190 overallLaunchPopularityForBundleId:v40];
      double v42 = v41;
      [v20 relativeLaunchPopularityWithBundleId:v40 date:v10];
      double v44 = v43;
      [v186 relativeLaunchPopularityWithBundleId:v40 date:v10];
      double v46 = v45;
      [v189 relativeLaunchPopularityWithBundleId:v40 category:v185];
      double v39 = v39 + vabdd_f64(v42, v44);
      double v38 = v38 + vabdd_f64(v42, v46);
      double v37 = v37 + vabdd_f64(v42, v47);

      ++v36;
    }
    while (v11 != v36);
  }
  double v48 = off_1E68AA000;
  v175 = +[_ATXActionUtils partOfWeekStringForDate:v10];
  if (v11 >= 1)
  {
    unint64_t v49 = 0;
    double v50 = (double)v11;
    uint64_t v158 = v11;
    v188 = v20;
    do
    {
      context = (void *)MEMORY[0x1D25F6CC0]();
      unint64_t v51 = v49;
      id v191 = [v179 objectAtIndexedSubscript:v49];
      id v192 = v191;
      v193[819] = -31337.0;
      LOWORD(v193[820]) = 0;
      for (uint64_t i = 4; i != 821; ++i)
        v193[i - 2] = -31337.0;
      *(float *)&double v53 = ATXSetInput((uint64_t)&v192, 0x66uLL, v164);
      objc_msgSend(v190, "overallLaunchPopularityForBundleId:", v191, v53);
      *(float *)&double v55 = ATXSetInput((uint64_t)&v192, 0x6FuLL, v54);
      objc_msgSend(v190, "launchPopularityWithBundleId:date:", v191, v10, v55);
      *(float *)&double v57 = ATXSetInput((uint64_t)&v192, 0x7CuLL, v56);
      objc_msgSend(v190, "relativeLaunchPopularityWithBundleId:date:", v191, v10, v57);
      ATXSetInput((uint64_t)&v192, 0x71uLL, v58);
      LODWORD(v59) = 1036831949;
      [v190 relativeLaunchPopularityWithBundleId:v191 date:v10 distanceScale:v59];
      *(float *)&double v61 = ATXSetInput((uint64_t)&v192, 0x72uLL, v60);
      objc_msgSend(v190, "totalLaunches", v61);
      *(float *)&double v63 = ATXSetInput((uint64_t)&v192, 0x67uLL, v62);
      objc_msgSend(v188, "launchPopularityWithBundleId:date:", v191, v10, v63);
      *(float *)&double v65 = ATXSetInput((uint64_t)&v192, 0x7DuLL, v64);
      objc_msgSend(v188, "relativeLaunchPopularityWithBundleId:date:", v191, v10, v65);
      *(float *)&double v67 = ATXSetInput((uint64_t)&v192, 0x73uLL, v66);
      if (v170)
      {
        objc_msgSend(v10, "timeIntervalSinceDate:", v170, v67);
        if (v67 >= 0.0)
        {
          HIDWORD(v68) = 1085021696;
          if (v67 >= 3600.0) {
            double v67 = 3599.0;
          }
          LODWORD(v68) = 1.0;
          [v157 relativeLaunchPopularityWithBundleId:v191 elapsedTime:v67 distanceScale:v68];
          *(float *)&double v67 = ATXSetInput((uint64_t)&v192, 0x74uLL, v69);
        }
      }
      double v70 = objc_msgSend(v184, "lastAppActionLaunchDateForActionKey:", v191, v67);
      double v71 = [v187 timeContext];
      double v72 = [v71 date];
      ATXSetInputAge((uint64_t)&v192, 0x7EuLL, v70, v72);

      v181 = [v184 averageSecondsBetweenAppActionsForActionKey:v191];
      if (v181)
      {
        [v181 doubleValue];
        *(float *)&double v73 = ATXSetInput((uint64_t)&v192, 0x7FuLL, v74);
      }
      v180 = objc_msgSend(v184, "medianSecondsBetweenAppActionsForActionKey:", v191, v73);
      if (v180)
      {
        [v180 doubleValue];
        *(float *)&double v75 = ATXSetInput((uint64_t)&v192, 0x80uLL, v76);
      }
      objc_msgSend(v167, "overallLaunchPopularityForBundleId:", v191, v75);
      if (!v13) {
        double v77 = 0.0;
      }
      ATXSetInput((uint64_t)&v192, 0x77uLL, v77);
      double v78 = 0.0;
      if (v13) {
        objc_msgSend(v167, "totalLaunches", 0.0);
      }
      *(float *)&double v79 = ATXSetInput((uint64_t)&v192, 0x68uLL, v78);
      objc_msgSend(v186, "overallLaunchPopularityForBundleId:", v191, v79);
      *(float *)&double v81 = ATXSetInput((uint64_t)&v192, 0x70uLL, v80);
      objc_msgSend(v186, "totalLaunches", v81);
      *(float *)&double v83 = ATXSetInput((uint64_t)&v192, 0x6BuLL, v82);
      objc_msgSend(v189, "overallLaunchPopularityForBundleId:category:", v191, v185, v83);
      *(float *)&double v85 = ATXSetInput((uint64_t)&v192, 0x75uLL, v84);
      objc_msgSend(v189, "totalLaunchesForCategory:", v185, v85);
      *(float *)&double v87 = ATXSetInput((uint64_t)&v192, 0x69uLL, v86);
      objc_msgSend(v177, "overallLaunchPopularityForBundleId:category:", v191, v178, v87);
      *(float *)&double v89 = ATXSetInput((uint64_t)&v192, 0x76uLL, v88);
      objc_msgSend(v177, "totalLaunchesForCategory:", v178, v89);
      *(float *)&double v91 = ATXSetInput((uint64_t)&v192, 0x6AuLL, v90);
      objc_msgSend(v176, "launchPopularityWithBundleId:category:", v191, v175, v91);
      *(float *)&double v93 = ATXSetInput((uint64_t)&v192, 0x4FuLL, v92);
      objc_msgSend(v176, "relativeLaunchPopularityWithBundleId:category:", v191, v175, v93);
      *(float *)&double v95 = ATXSetInput((uint64_t)&v192, 0x50uLL, v94);
      v96 = objc_msgSend(v187, "ambientLightContext", v95);
      uint64_t v97 = [v96 ambientLightType];

      if (v97 != 7)
      {
        v98 = [NSNumber numberWithInt:v97];
        id v99 = [v98 stringValue];
        [v165 launchPopularityWithBundleId:v191 category:v99];
        ATXSetInput((uint64_t)&v192, 0x188uLL, v100);

        id v101 = [NSNumber numberWithInt:v97];
        v102 = [v101 stringValue];
        [v165 relativeLaunchPopularityWithBundleId:v191 category:v102];
        ATXSetInput((uint64_t)&v192, 0x187uLL, v103);
      }
      appLaunchLocation = self->_appLaunchLocation;
      double v105 = [v187 locationMotionContext];
      double v106 = [v105 currentLOI];
      [(_ATXAppLaunchLocation *)appLaunchLocation launchProbabilityAtLOI:v106 appIntent:v191];
      ATXSetInput((uint64_t)&v192, 0x78uLL, v107);

      [(ATXAppLaunchMicroLocation *)self->_microLocation popularityAtCurrentMicroLocationForActionKey:v191];
      *(float *)&double v109 = ATXSetInput((uint64_t)&v192, 0x79uLL, v108);
      v110 = [(NSDictionary *)self->_dayZeroIntentParameters objectForKeyedSubscript:@"dayZero", v109];
      v111 = [v110 objectForKeyedSubscript:@"dayZeroBumps"];
      v112 = [v111 objectForKeyedSubscript:v191];

      [v112 doubleValue];
      *(float *)&double v114 = ATXSetInput((uint64_t)&v192, 0x81uLL, v113);
      int v115 = [(NSDictionary *)self->_dayZeroIntentParameters objectForKeyedSubscript:@"staticPenalties", v114];
      v116 = [v115 objectForKeyedSubscript:v191];

      [v116 doubleValue];
      *(float *)&double v118 = ATXSetInput((uint64_t)&v192, 0x82uLL, v117);
      v119 = [(NSDictionary *)self->_dayZeroIntentParameters objectForKeyedSubscript:@"valueScores", v118];
      id v120 = [v119 objectForKeyedSubscript:v191];

      v183 = v120;
      [v120 doubleValue];
      *(float *)&double v122 = ATXSetInput((uint64_t)&v192, 0x83uLL, v121);
      v123 = [(NSDictionary *)self->_dayZeroIntentParameters objectForKeyedSubscript:@"intentCategories", v122];
      id v124 = [(__objc2_class *)v48[343] getActionTypeFromActionKey:v191];
      v125 = [v123 objectForKeyedSubscript:v124];

      *(float *)&double v126 = ATXSetInput((uint64_t)&v192, 0x85uLL, (double)(int)[v125 intValue]);
      v127 = [(NSDictionary *)self->_dayZeroIntentParameters objectForKeyedSubscript:@"actionKeyCategories", v126];
      v182 = v112;
      v128 = [v127 objectForKeyedSubscript:v191];

      *(float *)&double v129 = ATXSetInput((uint64_t)&v192, 0x86uLL, (double)(int)[v128 intValue]);
      if (v169)
      {
        objc_msgSend(v169, "likelihoodForLaunch:", v191, v129);
        *(float *)&double v129 = ATXSetInput((uint64_t)&v192, 0x7AuLL, v130);
      }
      if (v168)
      {
        objc_msgSend(v168, "likelihoodForLaunch:", v191, v129);
        ATXSetInput((uint64_t)&v192, 0x7BuLL, v131);
      }
      ATXSetInput((uint64_t)&v192, 0x88uLL, v163);
      ATXSetInput((uint64_t)&v192, 0x89uLL, v161);
      *(float *)&double v132 = ATXSetInput((uint64_t)&v192, 0x8AuLL, v160);
      objc_msgSend(v188, "entropyForBundleId:", v191, v132);
      ATXSetInput((uint64_t)&v192, 0x8BuLL, v133);
      ATXSetInput((uint64_t)&v192, 0x90uLL, v39);
      ATXSetInput((uint64_t)&v192, 0x8CuLL, v159);
      ATXSetInput((uint64_t)&v192, 0x91uLL, v38);
      ATXSetInput((uint64_t)&v192, 0x8DuLL, v33);
      *(float *)&double v134 = ATXSetInput((uint64_t)&v192, 0x8EuLL, v35);
      objc_msgSend(v189, "entropyForBundleId:", v191, v134);
      ATXSetInput((uint64_t)&v192, 0x8FuLL, v135);
      ATXSetInput((uint64_t)&v192, 0x92uLL, v37);
      *(float *)&double v136 = ATXSetInput((uint64_t)&v192, 0x65uLL, v50);
      v171 = v128;
      v137 = +[_ATXActionUtils getBundleIdFromActionKey:](_ATXActionUtils, "getBundleIdFromActionKey:", v191, v136);
      v138 = +[_ATXActionUtils getActionTypeFromActionKey:v191];
      [v174 totalLaunchesForBundleId:v137 category:v138];
      *(float *)&double v140 = ATXSetInput((uint64_t)&v192, 0x93uLL, v139);
      objc_msgSend(v173, "totalLaunchesForBundleId:category:", v137, v138, v140);
      *(float *)&double v142 = ATXSetInput((uint64_t)&v192, 0x94uLL, v141);
      objc_msgSend(v174, "totalLaunches", v142);
      *(float *)&double v144 = ATXSetInput((uint64_t)&v192, 0x95uLL, v143);
      objc_msgSend(v173, "totalLaunches", v144);
      ATXSetInput((uint64_t)&v192, 0x96uLL, v145);
      v146 = v125;
      if (0xDAB7EC1DD3431B57 * (((char *)retstr->__end_ - (char *)retstr->__begin_) >> 5) <= v51) {
        std::vector<ATXPredictionItem>::__throw_out_of_range[abi:ne180100]();
      }
      unint64_t v147 = v51;
      v148 = &retstr->__begin_[v51];
      v149 = v192;
      key = v148->key;
      v148->key = (NSString *)v192;
      id v151 = v149;

      memcpy(&v148->actionHash, v193, 0xCD2uLL);
      unint64_t v49 = v147 + 1;
      int v10 = v162;
      unint64_t v20 = v188;
      double v48 = off_1E68AA000;
    }
    while (v49 != v158);
  }

  return result;
}

- (unordered_map<NSString)_createMapOfKeyToItemForPredictionItems:()ATXNSStringHash
{
  size_t v6 = 0xDAB7EC1DD3431B57 * ((uint64_t)(*((void *)a4 + 1) - *(void *)a4) >> 5);
  retstr->var0.var0 = 0u;
  *(_OWORD *)&retstr->var0.var1.var0.var0 = 0u;
  retstr->var0.var3.var0 = 1.0;
  std::__hash_table<std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,ATXNSStringHash,ATXNSStringEqual,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,ATXNSStringEqual,ATXNSStringHash,true>,std::allocator<std::__hash_value_type<NSString * {__strong},ATXPredictionItem>>>::__rehash<true>((uint64_t)retstr, v6);
  id v9 = *(id **)a4;
  id v8 = (id *)*((void *)a4 + 1);
  while (v9 != v8)
  {
    *(void *)&long long v10 = *v9;
    *((void *)&v10 + 1) = v9;
    std::__hash_table<std::__hash_value_type<NSString * {__strong},ATXPredictionItem const*>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},ATXPredictionItem const*>,ATXNSStringHash,ATXNSStringEqual,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},ATXPredictionItem const*>,ATXNSStringEqual,ATXNSStringHash,true>,std::allocator<std::__hash_value_type<NSString * {__strong},ATXPredictionItem const*>>>::__emplace_unique_key_args<NSString * {__strong},std::pair<NSString * {__strong},ATXPredictionItem const*>>((uint64_t)retstr, (id *)&v10, &v10);

    v9 += 412;
  }
  return result;
}

- (void)_copyValidScoreInputsFromPredictionItem:(const ATXPredictionItem *)a3 toPredictionItem:(ATXPredictionItem *)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __77___ATXAppPredictor__copyValidScoreInputsFromPredictionItem_toPredictionItem___block_invoke;
  v4[3] = &__block_descriptor_48_e12_v24__0Q8_B16l;
  v4[4] = a3;
  v4[5] = a4;
  +[_ATXScoreTypes iterScoreInputsWithBlock:v4];
}

- (vector<ATXPredictionItem,)_evalFeaturesForActions:(_ATXAppPredictor *)self scoreLogger:(SEL)a3 context:(id)a4 featureCache:(id)a5
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  int v16 = [v12 count];
  [(_ATXAppPredictor *)self _evalFeaturesForAppIntents:v12 scoreLogger:v13 context:v14];
  double v44 = +[_ATXActionUtils getBundleIdsFromActionKeys:v12];
  id v17 = (void *)MEMORY[0x1D25F6CC0]();
  appFeaturizer = self->_appFeaturizer;
  if (appFeaturizer) {
    [(ATXAppFeaturizer *)appFeaturizer evaluateFeaturesForApps:v44 clipBundleIdsToRank:0 consumerSubType:4 intent:0 scoreLogger:v13 context:v14 featureCache:v15];
  }
  else {
    memset(v47, 0, 24);
  }
  double v38 = v15;
  double v42 = v14;
  double v43 = v13;
  double v39 = v12;
  double v19 = [(_ATXAppPredictor *)self _createMapOfKeyToItemForPredictionItems:v47];
  int v40 = v16;
  if (v16 >= 1)
  {
    unint64_t v20 = 0;
    uint64_t v21 = v16;
    do
    {
      uint64_t v22 = MEMORY[0x1D25F6CC0](v19);
      if (0xDAB7EC1DD3431B57 * (((char *)retstr->__end_ - (char *)retstr->__begin_) >> 5) <= v20) {
        std::vector<ATXPredictionItem>::__throw_out_of_range[abi:ne180100]();
      }
      double v23 = (void *)v22;
      double v24 = &retstr->__begin_[v20];
      id v45 = +[_ATXActionUtils getBundleIdFromActionKey:v24->key];
      uint64_t v25 = std::__hash_table<std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,ATXNSStringHash,ATXNSStringEqual,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,ATXNSStringEqual,ATXNSStringHash,true>,std::allocator<std::__hash_value_type<NSString * {__strong},ATXPredictionItem>>>::find<NSString * {__strong}>(v46, &v45);
      if (!v25)
      {
        double v35 = [MEMORY[0x1E4F28B00] currentHandler];
        [v35 handleFailureInMethod:a3 object:self file:@"_ATXAppPredictor.mm" lineNumber:635 description:@"Failed to find bundleId in lookup table"];
      }
      [(_ATXAppPredictor *)self _copyValidScoreInputsFromPredictionItem:v25[3] toPredictionItem:v24];

      ++v20;
    }
    while (v20 != v21);
  }
  std::__hash_table<std::__hash_value_type<ATXAction * {__strong},int>,std::__unordered_map_hasher<ATXAction * {__strong},std::__hash_value_type<ATXAction * {__strong},int>,ATXActionHash,ATXActionEqual,true>,std::__unordered_map_equal<ATXAction * {__strong},std::__hash_value_type<ATXAction * {__strong},int>,ATXActionEqual,ATXActionHash,true>,std::allocator<std::__hash_value_type<ATXAction * {__strong},int>>>::~__hash_table((uint64_t)v46);
  v46[0] = (void **)v47;
  std::vector<ATXPredictionItem>::__destroy_vector::operator()[abi:ne180100](v46);
  uint64_t v26 = MEMORY[0x1D25F6CC0]();
  [(_ATXAppPredictor *)self _evalFeaturesForAppForAllIntents:v44 scoreLogger:v43 context:v42];
  context = (void *)v26;
  double v27 = [(_ATXAppPredictor *)self _createMapOfKeyToItemForPredictionItems:v47];
  if (v40 >= 1)
  {
    unint64_t v28 = 0;
    uint64_t v29 = v40;
    do
    {
      uint64_t v30 = MEMORY[0x1D25F6CC0](v27);
      if (0xDAB7EC1DD3431B57 * (((char *)retstr->__end_ - (char *)retstr->__begin_) >> 5) <= v28) {
        std::vector<ATXPredictionItem>::__throw_out_of_range[abi:ne180100]();
      }
      double v31 = (void *)v30;
      double v32 = &retstr->__begin_[v28];
      id v45 = +[_ATXActionUtils getBundleIdFromActionKey:v32->key];
      double v33 = std::__hash_table<std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,ATXNSStringHash,ATXNSStringEqual,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,ATXNSStringEqual,ATXNSStringHash,true>,std::allocator<std::__hash_value_type<NSString * {__strong},ATXPredictionItem>>>::find<NSString * {__strong}>(v46, &v45);
      if (!v33)
      {
        double v41 = [MEMORY[0x1E4F28B00] currentHandler];
        [v41 handleFailureInMethod:a3 object:self file:@"_ATXAppPredictor.mm" lineNumber:655 description:@"Failed to find bundleId in lookup table"];
      }
      [(_ATXAppPredictor *)self _copyValidScoreInputsFromPredictionItem:v33[3] toPredictionItem:v32];

      ++v28;
    }
    while (v28 != v29);
  }
  std::__hash_table<std::__hash_value_type<ATXAction * {__strong},int>,std::__unordered_map_hasher<ATXAction * {__strong},std::__hash_value_type<ATXAction * {__strong},int>,ATXActionHash,ATXActionEqual,true>,std::__unordered_map_equal<ATXAction * {__strong},std::__hash_value_type<ATXAction * {__strong},int>,ATXActionEqual,ATXActionHash,true>,std::allocator<std::__hash_value_type<ATXAction * {__strong},int>>>::~__hash_table((uint64_t)v46);
  v46[0] = (void **)v47;
  std::vector<ATXPredictionItem>::__destroy_vector::operator()[abi:ne180100](v46);

  return result;
}

- (vector<ATXPredictionItem,)_getPredictionForItems:(_ATXAppPredictor *)self clipBundleIdsToRank:(SEL)a3 consumerSubType:(id)a4 intent:(id)a5 scoreLogger:(unsigned __int8)a6 context:(id)a7 featureCache:(id)a8
{
  uint64_t v13 = a6;
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v18 = a4;
  id v46 = a5;
  id v47 = a7;
  id v19 = a8;
  id v43 = a9;
  id v44 = a10;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  unint64_t v20 = __atxlog_handle_default();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v21 = NSStringFromSelector(a3);
    -[_ATXAppPredictor _getPredictionForItems:clipBundleIdsToRank:consumerSubType:intent:scoreLogger:context:featureCache:](v21, buf, v20);
  }

  sel_getName(a3);
  id v45 = (id)os_transaction_create();
  [(_ATXAppPredictor *)self setupScoreLogger:v19 forConsumerSubType:v13];
  uint64_t v22 = [v47 _className];
  uint64_t v56 = 0;
  double v57 = (id **)&v56;
  uint64_t v58 = 0x4812000000;
  double v59 = __Block_byref_object_copy__92;
  double v60 = __Block_byref_object_dispose__92;
  double v61 = &unk_1D14E1507;
  memset(v62, 0, sizeof(v62));
  if ([MEMORY[0x1E4F4B680] consumerTypeForSubType:v13] == 8)
  {
    [(_ATXAppPredictor *)self _evalFeaturesForActions:v18 scoreLogger:v19 context:v43 featureCache:v44];
    double v23 = v57;
    std::vector<ATXPredictionItem>::__vdeallocate(v57 + 6);
    *((_OWORD *)v23 + 3) = v54;
    v23[8] = v55;
    double v55 = 0;
    long long v54 = 0uLL;
    double v63 = (void **)&v54;
  }
  else
  {
    appFeaturizer = self->_appFeaturizer;
    if (appFeaturizer)
    {
      [(ATXAppFeaturizer *)appFeaturizer evaluateFeaturesForApps:v18 clipBundleIdsToRank:v46 consumerSubType:v13 intent:v47 scoreLogger:v19 context:v43 featureCache:v44];
    }
    else
    {
      long long v54 = 0uLL;
      double v55 = 0;
    }
    uint64_t v25 = v57;
    std::vector<ATXPredictionItem>::__vdeallocate(v57 + 6);
    *((_OWORD *)v25 + 3) = v54;
    v25[8] = v55;
    double v55 = 0;
    long long v54 = 0uLL;
    double v63 = (void **)&v54;
  }
  std::vector<ATXPredictionItem>::__destroy_vector::operator()[abi:ne180100](&v63);
  uint64_t v26 = +[ATXScoreInterpreterCache sharedInstance];
  double v27 = [v26 scoreInterpreterForConsumerSubType:v13];

  unint64_t v28 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v29 = dispatch_queue_create("prediction-scoring", v28);

  uint64_t v30 = [v18 count];
  double v31 = v18;
  size_t v32 = [v46 count] + v30;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __119___ATXAppPredictor__getPredictionForItems_clipBundleIdsToRank_consumerSubType_intent_scoreLogger_context_featureCache___block_invoke;
  block[3] = &unk_1E68B4820;
  double v52 = &v56;
  block[4] = self;
  id v33 = v27;
  id v49 = v33;
  char v53 = v13;
  id v34 = v19;
  id v50 = v34;
  id v35 = v22;
  id v51 = v35;
  dispatch_apply(v32, v29, block);
  uint64_t v36 = (uint64_t)v57[6];
  double v37 = v57[7];
  if ((uint64_t)v37 - v36 < 1)
  {
    double v38 = 0;
    uint64_t v40 = 0;
  }
  else
  {
    double v38 = (void **)std::get_temporary_buffer[abi:ne180100]<ATXPredictionItem>(0xDAB7EC1DD3431B57 * (((uint64_t)v37 - v36) >> 5));
    uint64_t v40 = v39;
  }
  std::__stable_sort<std::_ClassicAlgPolicy,-[_ATXAppPredictor _getPredictionForItems:clipBundleIdsToRank:consumerSubType:intent:scoreLogger:context:featureCache:]::$_0 &,std::__wrap_iter<ATXPredictionItem *>>(v36, v37, 0xDAB7EC1DD3431B57 * (((uint64_t)v37 - v36) >> 5), v38, v40);
  if (v38) {
    operator delete(v38);
  }
  double v41 = v57;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  retstr->__begin_ = 0;
  std::vector<ATXPredictionItem>::__init_with_size[abi:ne180100]<ATXPredictionItem*,ATXPredictionItem*>(retstr, v41[6], v41[7], 0xDAB7EC1DD3431B57 * (((char *)v41[7] - (char *)v41[6]) >> 5));

  _Block_object_dispose(&v56, 8);
  *(void *)&long long v54 = v62;
  std::vector<ATXPredictionItem>::__destroy_vector::operator()[abi:ne180100]((void ***)&v54);

  return result;
}

- (void)setupScoreLogger:(id)a3 forConsumerSubType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v10 = a3;
  size_t v6 = NSString;
  id v7 = [(NSArray *)self->_abGroupIdentifiers objectAtIndexedSubscript:v4];
  id v8 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:v4];
  id v9 = [v6 stringWithFormat:@"%@[%@]", v7, v8];

  [v10 setPredictionClass:v9];
  [v10 setConsumerSubType:v4];
}

- (double)_predictionScoreAndUpdateConfidenceForItem:(ATXPredictionItem *)a3 interpreter:(id)a4 consumerSubType:(unsigned __int8)a5 scoreLogger:(id)a6 intentType:(id)a7
{
  uint64_t v9 = a5;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  int v16 = [(id)objc_opt_class() inputScoresForPredictionItem:a3];
  if (!v13)
  {
    uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v22 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:v9];
    [v21 handleFailureInMethod:a2, self, @"_ATXAppPredictor.mm", 736, @"No interpreter defined for ATXConsumerSubType of '%@'", v22 object file lineNumber description];
  }
  id v17 = [v13 evaluateWithInputScoreDict:v16 intentType:v15];
  [(_ATXAppPredictor *)self finalScoreForSubscores:v17 consumerSubType:v9];
  double v19 = v18;
  if (v14) {
    [v14 logInputDict:v16 subscores:v17 forBundleId:a3->key];
  }
  [(id)objc_opt_class() updateConfidenceForItem:a3 subscores:v17];

  return v19;
}

+ (id)inputScoresForPredictionItem:(const ATXPredictionItem *)a3
{
  uint64_t v4 = [[ATXScoreDict alloc] initWithDefaultValueForScoreTypeKeys];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49___ATXAppPredictor_inputScoresForPredictionItem___block_invoke;
  v7[3] = &unk_1E68B4848;
  id v5 = v4;
  id v8 = v5;
  uint64_t v9 = a3;
  +[_ATXScoreTypes iterScoreInputsWithBlock:v7];

  return v5;
}

- (double)finalScoreForSubscores:(id)a3 consumerSubType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  id v7 = [(ATXCurrentABGroupDetails *)self->_currentABGroupDetails finalSubScoreForConsumerSubType:v4];
  [v6 scoreForKey:v7 found:0];
  double v9 = v8;

  return v9;
}

+ (void)updateConfidenceForItem:(ATXPredictionItem *)a3 subscores:(id)a4
{
  id v7 = a4;
  [v7 scoreForKey:@"isMediumConfidenceForBlendingLayer" found:0];
  a3->isMediumConfidenceForBlendingLayer = v5 == 1.0;
  [v7 scoreForKey:@"isHighConfidenceForBlendingLayer" found:0];
  a3->isHighConfidenceForBlendingLayer = v6 == 1.0;
}

- (id)initInternal
{
  v23.receiver = self;
  v23.super_class = (Class)_ATXAppPredictor;
  v2 = [(_ATXAppPredictor *)&v23 init];
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    id v4 = objc_claimAutoreleasedReturnValue();
    double v5 = (const char *)[v4 UTF8String];
    double v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create(v5, v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    [(_ATXAppPredictor *)v2 _updateFromAsset];
    [(_ATXAppPredictor *)v2 _updateFromZeroDayAsset];
    [(_ATXAppPredictor *)v2 _updateFromZeroDayIntentAsset];
    double v9 = (void *)MEMORY[0x1E4F93B10];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __32___ATXAppPredictor_initInternal__block_invoke;
    v21[3] = &unk_1E68AF850;
    id v10 = v2;
    uint64_t v22 = v10;
    [v9 runBlockWhenDeviceIsClassCUnlocked:v21];
    if ([MEMORY[0x1E4F93B08] isInternalBuild])
    {
      id v11 = objc_alloc(MEMORY[0x1E4F1CB18]);
      uint64_t v12 = [v11 initWithSuiteName:*MEMORY[0x1E4F4B688]];
      userDefaults = v10->_userDefaults;
      v10->_userDefaults = (NSUserDefaults *)v12;

      [(NSUserDefaults *)v10->_userDefaults addObserver:v10 forKeyPath:@"appPredictionABGroupOverride" options:1 context:0];
    }
    uint64_t v14 = +[ATXAppPredictionBlacklist sharedInstance];
    appPredictionBlacklist = v10->_appPredictionBlacklist;
    v10->_appPredictionBlacklist = (ATXAppPredictionBlacklist *)v14;

    uint64_t v16 = +[ATXActionPredictionBlacklist sharedInstanceWithAppPredictionBlacklist];
    actionPredictionBlacklist = v10->_actionPredictionBlacklist;
    v10->_actionPredictionBlacklist = (ATXActionPredictionBlacklist *)v16;

    id v18 = +[ATXLockscreenBlacklist sharedInstance];
    double v19 = __atxlog_handle_default();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[_ATXAppPredictor initInternal]();
    }
  }
  return v2;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  [(_ATXAppPredictor *)self _updateFromAsset];
  double v8 = __atxlog_handle_app_prediction();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    double v9 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F284C8]];
    int v10 = 138412290;
    id v11 = v9;
    _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_INFO, "Updating assets because AppPrediction A/B group override detected: %@", (uint8_t *)&v10, 0xCu);
  }
}

- (void)_updateFromAsset
{
  v3 = (ATXCurrentABGroupDetails *)objc_opt_new();
  currentABGroupDetails = self->_currentABGroupDetails;
  self->_currentABGroupDetails = v3;

  double v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:48];
  double v6 = (void *)MEMORY[0x1E4F4B680];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __36___ATXAppPredictor__updateFromAsset__block_invoke;
  id v13 = &unk_1E68B4870;
  uint64_t v14 = self;
  id v7 = v5;
  id v15 = v7;
  [v6 iterConsumerSubTypesWithBlock:&v10];
  double v8 = (NSArray *)objc_msgSend(v7, "copy", v10, v11, v12, v13, v14);
  abGroupIdentifiers = self->_abGroupIdentifiers;
  self->_abGroupIdentifiers = v8;
}

- (void)_updateFromZeroDayAsset
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_DEBUG, "_ATXAppPredictor dayZero ABGroup set to %@", (uint8_t *)&v3, 0xCu);
}

- (void)_addZeroDayAppIntentKeysToBundleIdTable:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60___ATXAppPredictor__addZeroDayAppIntentKeysToBundleIdTable___block_invoke;
  v6[3] = &unk_1E68B4898;
  id v7 = v4;
  id v5 = v4;
  [(_ATXAppPredictor *)self iterZeroDayAppIntentKeysWithBlock:v6];
}

- (void)iterZeroDayAppIntentKeysWithBlock:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void, char *))a3;
  char v14 = 0;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(NSDictionary *)self->_dayZeroIntentParameters objectForKeyedSubscript:@"dayZero", 0];
  double v6 = [v5 objectForKeyedSubscript:@"dayZeroAppIntents"];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v11 != v8) {
        objc_enumerationMutation(v6);
      }
      v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9), &v14);
      if (v14) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v15 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)_updateFromZeroDayIntentAsset
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_DEBUG, "_ATXAppPredictor dayZero Intent ABGroup set to %@", (uint8_t *)&v3, 0xCu);
}

- (BOOL)_initAppLaunchAndInstallMonitors
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_appLaunchAndInstallMonitorsInitialized);
  if (v2) {
    return 1;
  }
  if (![MEMORY[0x1E4F93B10] isClassCLocked])
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52___ATXAppPredictor__initAppLaunchAndInstallMonitors__block_invoke;
    block[3] = &unk_1E68AF850;
    block[4] = self;
    dispatch_sync(queue, block);
    return 1;
  }
  uint64_t v4 = __atxlog_handle_app_prediction();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    -[_ATXAppPredictor _initAppLaunchAndInstallMonitors]();
  }

  return 0;
}

- (BOOL)_initDependencies
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_dependenciesAreInitialized);
  if (v2) {
    return 1;
  }
  if (![MEMORY[0x1E4F93B10] isClassCLocked])
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37___ATXAppPredictor__initDependencies__block_invoke;
    block[3] = &unk_1E68AF850;
    block[4] = self;
    dispatch_sync(queue, block);
    return 1;
  }
  uint64_t v4 = __atxlog_handle_app_prediction();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    -[_ATXAppPredictor _initDependencies]();
  }

  return 0;
}

- (void)_initFeaturizers
{
  int v3 = [ATXAppFeaturizer alloc];
  dayZeroParameters = self->_dayZeroParameters;
  dayZeroIntentParameters = self->_dayZeroIntentParameters;
  objc_super v23 = +[_ATXFeedback sharedInstance];
  uint64_t v22 = +[_ATXAppLaunchHistogramManager sharedInstance];
  uint64_t v6 = +[_ATXAppLaunchSequenceManager sharedInstance];
  appInstallMonitor = self->_appInstallMonitor;
  mediaApps = self->_mediaApps;
  appLaunchLocation = self->_appLaunchLocation;
  appDailyDose = self->_appDailyDose;
  uint64_t v21 = (void *)v6;
  unint64_t v20 = +[ATXGlobalAppScorePredictor sharedInstance];
  id v18 = appLaunchLocation;
  double v19 = objc_opt_new();
  id v17 = dayZeroParameters;
  appInfoManager = self->_appInfoManager;
  mmPredictionMonitor = self->_mmPredictionMonitor;
  long long v13 = [(ATXCDNDownloaderTriggerManager *)self->_cdnDownloaderTriggerManager server];
  char v14 = +[_ATXAppIconState sharedInstance];
  id v15 = -[ATXAppFeaturizer initWithDayZeroParameters:dayZeroIntentParameters:feedback:appLaunchHistogramManager:appLaunchSequenceManager:appLaunchLocation:appInstallMontior:mediaApplications:appDailyDose:globalAppScorePredictor:globalSmartSuppression:appInfoManager:magicalMomentsUpdateMonitor:heroAppPredictions:appIconState:appLaunchMicroLocation:notificationManager:](v3, "initWithDayZeroParameters:dayZeroIntentParameters:feedback:appLaunchHistogramManager:appLaunchSequenceManager:appLaunchLocation:appInstallMontior:mediaApplications:appDailyDose:globalAppScorePredictor:globalSmartSuppression:appInfoManager:magicalMomentsUpdateMonitor:heroAppPredictions:appIconState:appLaunchMicroLocation:notificationManager:", v17, dayZeroIntentParameters, v23, v22, v21, v18, appInstallMonitor, mediaApps, appDailyDose, v20, v19, appInfoManager, mmPredictionMonitor, v13, v14,
          self->_microLocation,
          self->_notificationManager);
  appFeaturizer = self->_appFeaturizer;
  self->_appFeaturizer = v15;
}

- (void)dealloc
{
  if ([MEMORY[0x1E4F93B08] isInternalBuild]) {
    [(NSUserDefaults *)self->_userDefaults removeObserver:self forKeyPath:@"appPredictionABGroupOverride"];
  }
  [(_ATXAppLaunchMonitor *)self->_appLaunchMonitor stop];
  [(ATXAppIntentMonitor *)self->_appIntentMonitor stop];
  [(_ATXAppInstallMonitor *)self->_appInstallMonitor stop];
  v3.receiver = self;
  v3.super_class = (Class)_ATXAppPredictor;
  [(_ATXAppPredictor *)&v3 dealloc];
}

+ (id)sharedInstance
{
  pthread_mutex_lock(&sharedInstanceLock);
  unsigned __int8 v2 = (void *)sharedInstance;
  if (!sharedInstance)
  {
    id v3 = [[_ATXAppPredictor alloc] initInternal];
    uint64_t v4 = (void *)sharedInstance;
    sharedInstance = (uint64_t)v3;

    unsigned __int8 v2 = (void *)sharedInstance;
  }
  id v5 = v2;
  pthread_mutex_unlock(&sharedInstanceLock);
  return v5;
}

- (double)predictionScoreAndUpdateConfidenceForItem:(ATXPredictionItem *)a3 consumerSubType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  uint64_t v7 = +[ATXScoreInterpreterCache sharedInstance];
  uint64_t v8 = [v7 scoreInterpreterForConsumerSubType:v4];

  [(_ATXAppPredictor *)self _predictionScoreAndUpdateConfidenceForItem:a3 interpreter:v8 consumerSubType:v4 scoreLogger:0 intentType:0];
  double v10 = v9;

  return v10;
}

+ (id)recreateSharedInstanceWithCurrentABGroup
{
  pthread_mutex_lock(&sharedInstanceLock);
  id v2 = [[_ATXAppPredictor alloc] initInternal];
  id v3 = (void *)sharedInstance;
  sharedInstance = (uint64_t)v2;

  id v4 = (id)sharedInstance;
  pthread_mutex_unlock(&sharedInstanceLock);
  return v4;
}

- (void)_setActionBlacklist:(id)a3
{
}

- (id)recentInstallCache
{
  if ([(_ATXAppPredictor *)self _initAppLaunchAndInstallMonitors]) {
    recentInstallCache = self->_recentInstallCache;
  }
  else {
    recentInstallCache = 0;
  }
  return recentInstallCache;
}

- (id)appLaunchMonitor
{
  if ([(_ATXAppPredictor *)self _initAppLaunchAndInstallMonitors]) {
    appLaunchMonitor = self->_appLaunchMonitor;
  }
  else {
    appLaunchMonitor = 0;
  }
  return appLaunchMonitor;
}

- (id)appIntentMonitor
{
  if ([(_ATXAppPredictor *)self _initAppLaunchAndInstallMonitors]) {
    appIntentMonitor = self->_appIntentMonitor;
  }
  else {
    appIntentMonitor = 0;
  }
  return appIntentMonitor;
}

- (ATXCDNDownloaderTriggerManager)cdnDownloaderTriggerManager
{
  if ([(_ATXAppPredictor *)self _initDependencies]) {
    cdnDownloaderTriggerManager = self->_cdnDownloaderTriggerManager;
  }
  else {
    cdnDownloaderTriggerManager = 0;
  }
  return cdnDownloaderTriggerManager;
}

- (void)resetRecentInstallCache
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43___ATXAppPredictor_resetRecentInstallCache__block_invoke;
  block[3] = &unk_1E68AF850;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (id)appInstallMonitor
{
  if ([(_ATXAppPredictor *)self _initAppLaunchAndInstallMonitors]) {
    appInstallMonitor = self->_appInstallMonitor;
  }
  else {
    appInstallMonitor = 0;
  }
  return appInstallMonitor;
}

- (id)predictWithLimit:(unint64_t)a3 consumerSubType:(unsigned __int8)a4 intent:(id)a5 candidateBundleIdentifiers:(id)a6 candidateActiontypes:(id)a7 scoreLogger:(id)a8
{
  uint64_t v11 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = objc_opt_new();
  double v19 = [(_ATXAppPredictor *)self predictWithLimit:a3 consumerSubType:v11 intent:v14 candidateBundleIdentifiers:v15 candidateActiontypes:v16 scoreLogger:v17 predictionItemsToKeep:0 predictedItemsOutParameter:0 featureCache:v18];

  return v19;
}

- (BOOL)predictAndWriteCacheFileWithLimit:(unint64_t)a3 consumerSubType:(unsigned __int8)a4 intent:(id)a5 candidateBundleIdentifiers:(id)a6 candidateActiontypes:(id)a7 scoreLogger:(id)a8 path:(id)a9 cacheFileDescriptors:(id)a10 featureCache:(id)a11
{
  uint64_t v14 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  id v22 = a11;
  unint64_t v28 = v16;
  objc_super v23 = +[ATXAppBlendingUpdater clientModelIdForConsumerSubType:v14];
  memset(v29, 0, sizeof(v29));
  double v24 = [(_ATXAppPredictor *)self predictWithLimit:a3 consumerSubType:v14 intent:v16 candidateBundleIdentifiers:v17 candidateActiontypes:v18 scoreLogger:v19 predictionItemsToKeep:0 predictedItemsOutParameter:v29 featureCache:v22];
  if (!v23) {
    [(_ATXAppPredictor *)self logCacheAgeAtRefreshForNonBlendingCachesWithCachePath:v20 consumerSubType:v14];
  }
  BOOL v25 = [(_ATXAppPredictor *)self writeCacheFileWithSerializedChunks:v24 path:v20 cacheFileDescriptors:v21 consumerSubType:v14];

  uint64_t v30 = (void **)v29;
  std::vector<ATXPredictionItem>::__destroy_vector::operator()[abi:ne180100](&v30);

  return v25;
}

- (void)logCacheAgeAtRefreshForNonBlendingCachesWithCachePath:(id)a3 consumerSubType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  +[ATXFileUtil cacheAgeForCache:v5 withCurrentTime:CFAbsoluteTimeGetCurrent()];
  double v7 = v6;
  uint64_t v8 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:v4];
  double v9 = objc_opt_new();
  [v9 setCacheName:v8];
  double v10 = [MEMORY[0x1E4F93728] sharedInstance];
  [v10 trackDistributionForMessage:v9 value:v7];

  uint64_t v11 = __atxlog_handle_metrics();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    long long v12 = (objc_class *)objc_opt_class();
    long long v13 = NSStringFromClass(v12);
    int v14 = 138412802;
    id v15 = v13;
    __int16 v16 = 2112;
    id v17 = v8;
    __int16 v18 = 2048;
    double v19 = v7;
    _os_log_debug_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_DEBUG, "LOGGED: %@ - ATXMCacheAgeAtCacheRefreshTracker with cacheName: %@ and cacheAge: %f", (uint8_t *)&v14, 0x20u);
  }
}

- (BOOL)writeCacheFileWithSerializedChunks:(id)a3 path:(id)a4 cacheFileDescriptors:(id)a5 consumerSubType:(unsigned __int8)a6
{
  uint64_t v6 = a6;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  long long v12 = v11;
  if (v9)
  {
    long long v13 = [v11 objectForKeyedSubscript:v10];
    int v14 = v13;
    if (v13)
    {
      if (([v13 intValue] & 0x80000000) != 0) {
        goto LABEL_14;
      }
    }
    else
    {
      id v16 = v10;
      uint64_t v17 = open_dprotected_np((const char *)[v16 UTF8String], 1537, 3, 0, 420);
      if ((v17 & 0x80000000) != 0)
      {
        objc_super v23 = __atxlog_handle_default();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          int v25 = *__error();
          uint64_t v26 = __error();
          double v27 = strerror(*v26);
          *(_DWORD *)buf = 138412802;
          id v29 = v16;
          __int16 v30 = 1024;
          int v31 = v25;
          __int16 v32 = 2080;
          id v33 = v27;
          _os_log_error_impl(&dword_1D0FA3000, v23, OS_LOG_TYPE_ERROR, "Error opening %@: [%i] %s", buf, 0x1Cu);
        }

        goto LABEL_14;
      }
      __int16 v18 = [NSNumber numberWithInt:v17];
      [v12 setObject:v18 forKeyedSubscript:v16];
    }
    double v19 = [v9 chunkArray];
    int v20 = ATXCacheFileWriteChunks();

    if (v20)
    {
      id v21 = __atxlog_handle_default();
      BOOL v15 = 1;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        id v22 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:v6];
        *(_DWORD *)buf = 138412290;
        id v29 = v22;
        _os_log_impl(&dword_1D0FA3000, v21, OS_LOG_TYPE_INFO, "Updated ATXCache for subtype: %@", buf, 0xCu);
      }
      goto LABEL_17;
    }
LABEL_14:
    id v21 = __atxlog_handle_default();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[_ATXAppPredictor writeCacheFileWithSerializedChunks:path:cacheFileDescriptors:consumerSubType:]((uint64_t)v10, v21);
    }
    BOOL v15 = 0;
LABEL_17:

    goto LABEL_18;
  }
  BOOL v15 = 0;
LABEL_18:

  return v15;
}

- (id)predictWithLimit:(unint64_t)a3 consumerSubType:(unsigned __int8)a4 intent:(id)a5 candidateBundleIdentifiers:(id)a6 candidateActiontypes:(id)a7 scoreLogger:(id)a8 predictionItemsToKeep:(void *)a9 predictedItemsOutParameter:(void *)a10 featureCache:(id)a11
{
  uint64_t v14 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a11;
  id v22 = [(ATXPredictionContextBuilder *)self->_predictionContextBuilder predictionContextForCurrentContext];
  objc_super v23 = [(_ATXAppPredictor *)self predictWithLimit:a3 consumerSubType:v14 intent:v17 candidateBundleIdentifiers:v18 candidateActiontypes:v19 scoreLogger:v20 predictionItemsToKeep:0 predictedItemsOutParameter:a10 context:v22 featureCache:v21];

  return v23;
}

- (id)predictWithLimit:(unint64_t)a3 consumerSubType:(unsigned __int8)a4 intent:(id)a5 candidateBundleIdentifiers:(id)a6 candidateActiontypes:(id)a7 scoreLogger:(id)a8 predictionItemsToKeep:(void *)a9 predictedItemsOutParameter:(void *)a10 context:(id)a11 featureCache:(id)a12
{
  unsigned int v26 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a11;
  id v21 = a12;
  id v22 = +[_ATXDataStore sharedInstance];
  objc_super v23 = [(_ATXAppPredictor *)self predictWithLimit:a3 consumerSubType:v26 intent:v16 candidateBundleIdentifiers:v17 candidateActiontypes:v18 scoreLogger:v19 predictionItemsToKeep:a9 predictedItemsOutParameter:a10 context:v20 datastore:v22 featureCache:v21];

  return v23;
}

- (id)predictWithLimit:(unint64_t)a3 consumerSubType:(unsigned __int8)a4 intent:(id)a5 candidateBundleIdentifiers:(id)a6 candidateActiontypes:(id)a7 scoreLogger:(id)a8 predictionItemsToKeep:(void *)a9 predictedItemsOutParameter:(void *)a10 datastore:(id)a11
{
  unsigned int v24 = a4;
  id v25 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a11;
  id v20 = [(ATXPredictionContextBuilder *)self->_predictionContextBuilder predictionContextForCurrentContext];
  id v21 = objc_opt_new();
  id v22 = [(_ATXAppPredictor *)self predictWithLimit:a3 consumerSubType:v24 intent:v25 candidateBundleIdentifiers:v16 candidateActiontypes:v17 scoreLogger:v18 predictionItemsToKeep:a9 predictedItemsOutParameter:a10 context:v20 datastore:v19 featureCache:v21];

  return v22;
}

- (id)predictWithLimit:(unint64_t)a3 consumerSubType:(unsigned __int8)a4 intent:(id)a5 candidateBundleIdentifiers:(id)a6 candidateActiontypes:(id)a7 scoreLogger:(id)a8 predictionItemsToKeep:(void *)a9 predictedItemsOutParameter:(void *)a10 context:(id)a11 datastore:(id)a12 featureCache:(id)a13
{
  int v16 = a4;
  id v19 = a10;
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v41 = a5;
  id v45 = a6;
  id v42 = a7;
  id v43 = a8;
  id v20 = a11;
  id v44 = a12;
  id v21 = a13;
  memset(v61, 0, sizeof(v61));
  if (!a10) {
    id v19 = v61;
  }
  id v22 = [(_ATXAppPredictor *)self appLaunchMonitor];

  id v23 = 0;
  if (v20)
  {
    unsigned int v24 = v41;
    if (v22)
    {
      id v25 = +[_ATXAppIconState sharedInstance];
      uint64_t v40 = [v25 allInstalledAppsKnownToSpringBoard];

      if ([v45 count] || objc_msgSend(v40, "count"))
      {
        unsigned int v26 = __atxlog_handle_default();
        os_signpost_id_t v27 = os_signpost_id_generate(v26);

        unint64_t v28 = __atxlog_handle_default();
        id v29 = v28;
        os_signpost_id_t spid = v27;
        unint64_t v30 = v27 - 1;
        if (v30 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
        {
          ClassName = object_getClassName(v41);
          *(_DWORD *)buf = 67240450;
          *(_DWORD *)&uint8_t buf[4] = v16;
          LOWORD(v67) = 2082;
          *(void *)((char *)&v67 + 2) = ClassName;
          _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v29, OS_SIGNPOST_INTERVAL_BEGIN, spid, "Predict", "Subtype=%{public,signpost.telemetry:number1}u Intent=%{public,signpost.telemetry:string1}s  enableTelemetry=YES ", buf, 0x12u);
        }

        *(void *)buf = 0;
        *(void *)&long long v67 = buf;
        *((void *)&v67 + 1) = 0x3032000000;
        double v68 = __Block_byref_object_copy__146;
        double v69 = __Block_byref_object_dispose__147;
        id v70 = 0;
        queue = self->_queue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __200___ATXAppPredictor_predictWithLimit_consumerSubType_intent_candidateBundleIdentifiers_candidateActiontypes_scoreLogger_predictionItemsToKeep_predictedItemsOutParameter_context_datastore_featureCache___block_invoke;
        block[3] = &unk_1E68B48E8;
        block[4] = self;
        char v60 = v16;
        id v33 = v41;
        id v47 = v33;
        id v48 = v45;
        id v49 = v40;
        id v50 = v42;
        id v51 = v44;
        uint64_t v56 = v19;
        id v52 = v43;
        id v53 = v20;
        unint64_t v57 = a3;
        uint64_t v58 = a9;
        id v54 = v21;
        double v55 = buf;
        SEL v59 = a2;
        dispatch_sync(queue, block);
        uint64_t v34 = __atxlog_handle_default();
        id v35 = v34;
        if (v30 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
        {
          uint64_t v36 = object_getClassName(v33);
          *(_DWORD *)double v62 = 67240450;
          int v63 = v16;
          __int16 v64 = 2082;
          uint64_t v65 = v36;
          _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v35, OS_SIGNPOST_INTERVAL_END, spid, "Predict", "Subtype=%{public,signpost.telemetry:number1}u Intent=%{public,signpost.telemetry:string1}s  enableTelemetry=YES ", v62, 0x12u);
        }

        id v23 = *(id *)(v67 + 40);
        _Block_object_dispose(buf, 8);
      }
      else
      {
        id v23 = 0;
      }
    }
  }
  else
  {
    unsigned int v24 = v41;
  }
  *(void *)buf = v61;
  std::vector<ATXPredictionItem>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);

  return v23;
}

+ (id)pruneItemsToRankForConsumerSubType:(unsigned __int8)a3 itemsToRank:(id)a4 datastore:(id)a5
{
  uint64_t v6 = a3;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  id v21 = v7;
  if ([MEMORY[0x1E4F4B680] consumerTypeForSubType:v6] == 8)
  {
    id v22 = objc_opt_new();
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v29 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          uint64_t v14 = +[_ATXActionUtils getBundleIdFromActionKey:v13];
          uint64_t v15 = +[_ATXActionUtils getActionTypeFromActionKey:v13];
          int v16 = (void *)v15;
          if (v14) {
            BOOL v17 = v15 == 0;
          }
          else {
            BOOL v17 = 1;
          }
          if (!v17)
          {
            if ([v8 actionExistsForBundleId:v14 actionType:v15])
            {
              [v22 addObject:v13];
            }
            else
            {
              id v18 = __atxlog_handle_default();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v28 = v13;
                _os_log_impl(&dword_1D0FA3000, v18, OS_LOG_TYPE_DEFAULT, "No actions found in _ATXDataStore for %@. Skipping this actionKey.", buf, 0xCu);
              }
            }
          }
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v29 count:16];
      }
      while (v10);
    }

    id v19 = (id)[v22 copy];
  }
  else
  {
    id v19 = v7;
  }

  return v19;
}

+ (id)getParseTreeForConsumerSubType:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F4AEE8] sharedInstanceWithMobileAssets];
  id v5 = [v4 getAssetFileAndSubscoreForConsumerSubType:v3];
  uint64_t v6 = [v5 first];

  id v7 = (void *)MEMORY[0x1E4F4AF08];
  id v8 = [MEMORY[0x1E4F4AE28] abGroupOverride];
  id v9 = [v7 dictionaryForResource:v6 ofType:@"plist" specifiedABGroup:v8];

  return v9;
}

- (id)getPredictionModelDetailsForConsumerSubType:(unsigned __int8)a3
{
  unsigned int v3 = a3;
  id v5 = [MEMORY[0x1E4F4AF08] asset];
  uint64_t v6 = [_ATXPredictionModelDetails alloc];
  uint64_t v7 = [v5 compatibilityVersion];
  uint64_t v8 = [v5 assetVersion];
  id v9 = [(NSArray *)self->_abGroupIdentifiers objectAtIndexedSubscript:v3];
  uint64_t v10 = [(_ATXPredictionModelDetails *)v6 initWithAssetCompatibilityVersion:v7 assetVersion:v8 abGroup:v9];

  return v10;
}

- (id)getABGroups
{
  id v2 = [MEMORY[0x1E4F4AEE8] sharedInstanceWithMobileAssets];
  unsigned int v3 = [v2 getAssetFileAndSubscoreForConsumerSubType:4];
  uint64_t v4 = [v3 first];

  id v5 = [MEMORY[0x1E4F4AF08] rawDictionaryForResource:v4 ofType:@"plplist"];
  uint64_t v6 = [v5 allKeys];

  return v6;
}

- (void)receiveFeedbackForConsumerType:(unint64_t)a3 consumerSubType:(unsigned __int8)a4 atxResponse:(id)a5 engagementType:(unint64_t)a6 engagedBundleId:(id)a7 bundleIdsShown:(id)a8 explicitlyRejectedBundleIds:(id)a9 context:(id)a10
{
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  id v19 = a10;
  id v32 = v16;
  id v33 = v15;
  id v31 = v18;
  id v20 = (void *)os_transaction_create();
  v52[0] = 0;
  v52[1] = v52;
  v52[2] = 0x3032000000;
  v52[3] = __Block_byref_object_copy__146;
  v52[4] = __Block_byref_object_dispose__147;
  id v53 = 0;
  queue = self->_queue;
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v38 = 3221225472;
  uint64_t v39 = __161___ATXAppPredictor_receiveFeedbackForConsumerType_consumerSubType_atxResponse_engagementType_engagedBundleId_bundleIdsShown_explicitlyRejectedBundleIds_context___block_invoke;
  uint64_t v40 = &unk_1E68B4910;
  id v48 = v52;
  unint64_t v49 = a3;
  id v41 = self;
  unsigned __int8 v51 = a4;
  id v36 = v15;
  id v42 = v36;
  unint64_t v50 = a6;
  id v34 = v16;
  id v43 = v34;
  id v22 = v17;
  id v44 = v22;
  id v23 = v18;
  id v45 = v23;
  id v24 = v19;
  id v46 = v24;
  id v25 = v20;
  id v47 = v25;
  dispatch_sync(queue, &block);
  if (a3 == 1)
  {
    if (a6 - 2 < 2)
    {
      appLaunchLogger = self->_appLaunchLogger;
      os_signpost_id_t v27 = objc_msgSend(v24, "timeContext", v31, v17, v32, v33, v34, v36, block, v38, v39, v40, v41, v42, v43, v44, v45, v46);
      uint64_t v28 = [v27 date];
      [(ATXAppLaunchLogger *)appLaunchLogger logAppLaunchFrom:12 at:v28];
LABEL_9:

      goto LABEL_10;
    }
    if (a6 == 1)
    {
      uint64_t v30 = self->_appLaunchLogger;
      os_signpost_id_t v27 = objc_msgSend(v24, "timeContext", v31, v17, v32, v33, v34, v36, block, v38, v39, v40, v41, v42, v43, v44, v45, v46);
      uint64_t v28 = [v27 date];
      [(ATXAppLaunchLogger *)v30 logAppLaunchFrom:13 at:v28];
      goto LABEL_9;
    }
  }
  else if (a3 == 2 && a6 == 1)
  {
    id v29 = self->_appLaunchLogger;
    os_signpost_id_t v27 = objc_msgSend(v24, "timeContext", v31, v17, v32, v33, v34, v36, block, v38, v39, v40, v41, v42, v43, v44, v45, v46);
    uint64_t v28 = [v27 date];
    [(ATXAppLaunchLogger *)v29 logAppLaunchFrom:15 at:v28];
    goto LABEL_9;
  }
LABEL_10:

  _Block_object_dispose(v52, 8);
}

- (void)train
{
}

- (void)trainWithActivity:(id)a3
{
  id v4 = a3;
  if ([v4 didDefer])
  {
    id v5 = __atxlog_handle_default();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "App prediction training immediately deferred", buf, 2u);
    }
LABEL_9:

    goto LABEL_10;
  }
  if (v4 && ([v4 setContinue] & 1) == 0)
  {
    id v5 = __atxlog_handle_default();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[_ATXAppPredictor trainWithActivity:]();
    }
    goto LABEL_9;
  }
  uint64_t v6 = (void *)MEMORY[0x1E4F93B10];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38___ATXAppPredictor_trainWithActivity___block_invoke;
  v7[3] = &unk_1E68B48C0;
  void v7[4] = self;
  id v8 = v4;
  [v6 runBlockWhenDeviceIsClassCUnlocked:v7];

LABEL_10:
}

- (NSArray)abGroupIdentifiers
{
  return self->_abGroupIdentifiers;
}

- (void)setAbGroupIdentifiers:(id)a3
{
}

- (void)setCdnDownloaderTriggerManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cdnDownloaderTriggerManager, 0);
  objc_storeStrong((id *)&self->_abGroupIdentifiers, 0);
  objc_storeStrong((id *)&self->_currentABGroupDetails, 0);
  objc_storeStrong((id *)&self->_microLocation, 0);
  objc_storeStrong((id *)&self->_appInfoManager, 0);
  objc_storeStrong((id *)&self->_mediaApps, 0);
  objc_storeStrong((id *)&self->_actionPredictionBlacklist, 0);
  objc_storeStrong((id *)&self->_appPredictionBlacklist, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_mmPredictionMonitor, 0);
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_storeStrong((id *)&self->_appFeaturizer, 0);
  objc_storeStrong((id *)&self->_appLaunchLogger, 0);
  objc_storeStrong((id *)&self->_appInstallMonitor, 0);
  objc_storeStrong((id *)&self->_appIntentMonitor, 0);
  objc_storeStrong((id *)&self->_appLaunchMonitor, 0);
  objc_storeStrong((id *)&self->_predictionContextBuilder, 0);
  objc_storeStrong((id *)&self->_recentInstallCache, 0);
  objc_storeStrong((id *)&self->_appDailyDose, 0);
  objc_storeStrong((id *)&self->_appLaunchLocation, 0);
  objc_storeStrong((id *)&self->_dayZeroIntentABGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_dayZeroABGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_dayZeroIntentParameters, 0);
  objc_storeStrong((id *)&self->_dayZeroParameters, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_getPredictionForItems:(unint64_t)a3 clipBundleIdsToRank:(void *)a4 consumerSubType:(uint64_t)a5 intent:scoreLogger:context:featureCache:
{
  uint64_t v30 = a2;
  id v31 = (void **)a1;
  if (a3 >= 2)
  {
    uint64_t v6 = (void **)a1;
    if (a3 == 2)
    {
      uint64_t v30 = a2 - 412;
      if (*(float *)(a1 + 3284) < *((float *)a2 - 3)) {
        std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<std::__wrap_iter<ATXPredictionItem *> &,std::__wrap_iter<ATXPredictionItem *> &>(&v31, &v30);
      }
    }
    else if ((uint64_t)a3 <= 0)
    {
      std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,-[_ATXAppPredictor _getPredictionForItems:clipBundleIdsToRank:consumerSubType:intent:scoreLogger:context:featureCache:]::$_0 &,std::__wrap_iter<ATXPredictionItem *>>((char *)a1, (char *)a2);
    }
    else
    {
      id v9 = a4;
      unint64_t v10 = a3 >> 1;
      uint64_t v11 = (float *)(a1 + 3296 * (a3 >> 1));
      unint64_t v12 = a3 >> 1;
      if ((uint64_t)a3 <= a5)
      {
        std::__stable_sort_move<std::_ClassicAlgPolicy,-[_ATXAppPredictor _getPredictionForItems:clipBundleIdsToRank:consumerSubType:intent:scoreLogger:context:featureCache:]::$_0 &,std::__wrap_iter<ATXPredictionItem *>>((float *)a1, v11, v12, a4);
        uint64_t v13 = &v9[412 * v10];
        std::__stable_sort_move<std::_ClassicAlgPolicy,-[_ATXAppPredictor _getPredictionForItems:clipBundleIdsToRank:consumerSubType:intent:scoreLogger:context:featureCache:]::$_0 &,std::__wrap_iter<ATXPredictionItem *>>((float *)&v6[412 * (a3 >> 1)], (float *)a2, a3 - (a3 >> 1), v13);
        uint64_t v14 = &v9[412 * a3];
        id v15 = v13;
        id v16 = v9;
        while (v15 != v14)
        {
          if (*((float *)v16 + 821) >= *((float *)v15 + 821))
          {
            id v19 = *v16;
            *id v16 = 0;
            id v20 = *v6;
            void *v6 = v19;

            memcpy(v6 + 1, v16 + 1, 0xCD2uLL);
            v16 += 412;
          }
          else
          {
            id v17 = *v15;
            void *v15 = 0;
            id v18 = *v6;
            void *v6 = v17;

            memcpy(v6 + 1, v15 + 1, 0xCD2uLL);
            v15 += 412;
          }
          v6 += 412;
          if (v16 == v13)
          {
            if (v15 != v14)
            {
              uint64_t v21 = 0;
              do
              {
                id v22 = &v15[v21];
                id v23 = v15[v21];
                v15[v21] = 0;
                id v24 = v6[v21];
                v6[v21] = v23;

                memcpy(&v6[v21 + 1], &v15[v21 + 1], 0xCD2uLL);
                v21 += 412;
              }
              while (v22 + 412 != v14);
            }
            goto LABEL_27;
          }
        }
        if (v16 != v13)
        {
          uint64_t v25 = 0;
          do
          {
            long long v26 = &v16[v25];
            id v27 = v16[v25];
            v16[v25] = 0;
            uint64_t v28 = v6[v25];
            v6[v25] = v27;

            memcpy(&v6[v25 + 1], &v16[v25 + 1], 0xCD2uLL);
            v25 += 412;
          }
          while (v26 + 412 != v13);
        }
LABEL_27:
        if (v9)
        {
          unint64_t v29 = a3;
          do
          {

            v9 += 412;
            --v29;
          }
          while (v29);
        }
      }
      else
      {
        std::__stable_sort<std::_ClassicAlgPolicy,-[_ATXAppPredictor _getPredictionForItems:clipBundleIdsToRank:consumerSubType:intent:scoreLogger:context:featureCache:]::$_0 &,std::__wrap_iter<ATXPredictionItem *>>(a1, v11, v12, a4, a5);
        std::__stable_sort<std::_ClassicAlgPolicy,-[_ATXAppPredictor _getPredictionForItems:clipBundleIdsToRank:consumerSubType:intent:scoreLogger:context:featureCache:]::$_0 &,std::__wrap_iter<ATXPredictionItem *>>(&v6[412 * (a3 >> 1)], a2, a3 - (a3 >> 1), v9, a5);
        std::__inplace_merge<std::_ClassicAlgPolicy,-[_ATXAppPredictor _getPredictionForItems:clipBundleIdsToRank:consumerSubType:intent:scoreLogger:context:featureCache:]::$_0 &,std::__wrap_iter<ATXPredictionItem *>>(v6, &v6[412 * (a3 >> 1)], a2, a3 >> 1, a3 - (a3 >> 1), v9, a5);
      }
    }
  }
}

- (float)_getPredictionForItems:(unint64_t)a3 clipBundleIdsToRank:(void *)a4 consumerSubType:intent:scoreLogger:context:featureCache:
{
  if (!a3) {
    return result;
  }
  id v4 = a4;
  uint64_t v7 = result;
  if (a3 == 2)
  {
    uint64_t v11 = (void **)(a2 - 824);
    float v12 = result[821];
    uint64_t v13 = a4 + 1;
    if (v12 >= *(a2 - 3))
    {
      id v31 = *(void **)v7;
      *(void *)uint64_t v7 = 0;
      *a4 = v31;
      memcpy(v13, v7 + 2, 0xCD2uLL);
      id v32 = *v11;
      float *v11 = 0;
      v4[412] = v32;
      id v16 = a2 - 822;
      unint64_t v10 = v4 + 413;
      goto LABEL_23;
    }
    uint64_t v14 = *v11;
    float *v11 = 0;
    *a4 = v14;
    memcpy(v13, a2 - 822, 0xCD2uLL);
    id v15 = *(void **)v7;
    *(void *)uint64_t v7 = 0;
    id v9 = v7 + 2;
    v4[412] = v15;
    unint64_t v10 = v4 + 413;
LABEL_7:
    id v16 = v9;
LABEL_23:
    return (float *)memcpy(v10, v16, 0xCD2uLL);
  }
  if (a3 == 1)
  {
    id v8 = *(void **)result;
    *(void *)result = 0;
    id v9 = result + 2;
    *a4 = v8;
    unint64_t v10 = a4 + 1;
    goto LABEL_7;
  }
  if ((uint64_t)a3 > 8)
  {
    uint64_t v33 = 3296 * (a3 >> 1);
    id v34 = &result[(unint64_t)v33 / 4];
    std::__stable_sort<std::_ClassicAlgPolicy,-[_ATXAppPredictor _getPredictionForItems:clipBundleIdsToRank:consumerSubType:intent:scoreLogger:context:featureCache:]::$_0 &,std::__wrap_iter<ATXPredictionItem *>>(result, &result[(unint64_t)v33 / 4], a3 >> 1, a4, a3 >> 1);
    result = (float *)std::__stable_sort<std::_ClassicAlgPolicy,-[_ATXAppPredictor _getPredictionForItems:clipBundleIdsToRank:consumerSubType:intent:scoreLogger:context:featureCache:]::$_0 &,std::__wrap_iter<ATXPredictionItem *>>(&v7[(unint64_t)v33 / 4], a2, a3 - (a3 >> 1), &v4[(unint64_t)v33 / 8], a3 - (a3 >> 1));
    id v35 = &v7[(unint64_t)v33 / 4];
    while (v35 != a2)
    {
      id v36 = v4 + 1;
      if (v7[821] >= v35[821])
      {
        uint64_t v38 = *(void **)v7;
        *(void *)uint64_t v7 = 0;
        void *v4 = v38;
        result = (float *)memcpy(v36, v7 + 2, 0xCD2uLL);
        v7 += 824;
      }
      else
      {
        double v37 = *(void **)v35;
        *(void *)id v35 = 0;
        void *v4 = v37;
        result = (float *)memcpy(v36, v35 + 2, 0xCD2uLL);
        v35 += 824;
      }
      v4 += 412;
      if (v7 == v34)
      {
        if (v35 != a2)
        {
          unint64_t v39 = 0;
          do
          {
            uint64_t v40 = &v35[v39 / 4];
            id v41 = *(void **)&v35[v39 / 4];
            *(void *)&v35[v39 / 4] = 0;
            v4[v39 / 8] = v41;
            result = (float *)memcpy(&v4[v39 / 8 + 1], &v35[v39 / 4 + 2], 0xCD2uLL);
            v39 += 3296;
          }
          while (v40 + 824 != a2);
        }
        return result;
      }
    }
    if (v7 != v34)
    {
      unint64_t v42 = 0;
      do
      {
        id v43 = &v7[v42 / 4];
        id v44 = *(void **)&v7[v42 / 4];
        *(void *)&v7[v42 / 4] = 0;
        v4[v42 / 8] = v44;
        result = (float *)memcpy(&v4[v42 / 8 + 1], &v7[v42 / 4 + 2], 0xCD2uLL);
        v42 += 3296;
      }
      while (v43 + 824 != v34);
    }
  }
  else if (result != a2)
  {
    id v17 = *(void **)result;
    *(void *)result = 0;
    *a4 = v17;
    result = (float *)memcpy(a4 + 1, result + 2, 0xCD2uLL);
    id v18 = v7 + 824;
    if (v7 + 824 != a2)
    {
      uint64_t v19 = 0;
      id v20 = v4;
      do
      {
        uint64_t v21 = v18;
        id v22 = v20 + 413;
        if (*((float *)v20 + 821) >= v7[1645])
        {
          uint64_t v30 = (void *)*v18;
          *uint64_t v21 = 0;
          v20[412] = v30;
        }
        else
        {
          id v23 = *v20;
          *id v20 = 0;
          v20[412] = v23;
          memcpy(v20 + 413, v20 + 1, 0xCD2uLL);
          id v24 = v4;
          if (v20 != v4)
          {
            uint64_t v25 = v19;
            while (1)
            {
              id v24 = (void **)((char *)v4 + v25);
              if (*(float *)((char *)v4 + v25 - 12) >= v7[1645]) {
                break;
              }
              long long v26 = *(v24 - 412);
              *(v24 - 412) = 0;
              id v27 = *v24;
              *id v24 = v26;

              memcpy(v24 + 1, v24 - 411, 0xCD2uLL);
              v25 -= 3296;
              if (!v25)
              {
                id v24 = v4;
                break;
              }
            }
          }
          uint64_t v28 = (void *)*v21;
          *uint64_t v21 = 0;
          unint64_t v29 = *v24;
          *id v24 = v28;
          id v22 = v24 + 1;
        }
        result = (float *)memcpy(v22, v7 + 826, 0xCD2uLL);
        id v18 = v21 + 412;
        v19 += 3296;
        v20 += 412;
        uint64_t v7 = (float *)v21;
      }
      while (v21 + 412 != (void *)a2);
    }
  }
  return result;
}

- (void)_getPredictionForItems:(void *)a1 clipBundleIdsToRank:(void *)a2 consumerSubType:(void *)a3 intent:(uint64_t)a4 scoreLogger:(uint64_t)a5 context:(id *)a6 featureCache:(uint64_t)a7
{
  double v77 = a2;
  double v78 = a1;
  if (a5)
  {
    uint64_t v7 = a6;
    uint64_t v8 = a5;
    unint64_t v10 = a2;
    uint64_t v11 = a1;
    float v12 = v77;
    while (v8 > a7 && a4 > a7)
    {
      if (!a4) {
        goto LABEL_43;
      }
      uint64_t v13 = 0;
      uint64_t v14 = -a4;
      while (1)
      {
        id v15 = &v11[v13];
        if (*((float *)&v11[v13 + 410] + 1) < *((float *)v10 + 821)) {
          break;
        }
        v13 += 412;
        if (__CFADD__(v14++, 1)) {
          goto LABEL_43;
        }
      }
      double v78 = &v11[v13];
      uint64_t v17 = -v14;
      if (-v14 >= v8)
      {
        if (v14 == -1)
        {
          double v77 = v12;
          std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<std::__wrap_iter<ATXPredictionItem *> &,std::__wrap_iter<ATXPredictionItem *> &>(&v78, &v77);
          return;
        }
        if (v14 > 0) {
          uint64_t v17 = 1 - v14;
        }
        uint64_t v27 = v17 >> 1;
        if (a3 == v10)
        {
          float v12 = a3;
        }
        else
        {
          unint64_t v28 = 0xDAB7EC1DD3431B57 * (((char *)a3 - (char *)v10) >> 5);
          float v12 = v10;
          do
          {
            unint64_t v29 = v28 >> 1;
            uint64_t v30 = &v12[412 * (v28 >> 1)];
            float v31 = *((float *)v30 + 821);
            id v32 = v30 + 412;
            v28 += ~(v28 >> 1);
            if (*(float *)((char *)&v11[412 * v27 + 410] + v13 * 8 + 4) < v31) {
              float v12 = v32;
            }
            else {
              unint64_t v28 = v29;
            }
          }
          while (v28);
        }
        id v20 = (void **)((char *)&v11[412 * v27] + v13 * 8);
        uint64_t v19 = 0xDAB7EC1DD3431B57 * (((char *)v12 - (char *)v10) >> 5);
      }
      else
      {
        if (v8 >= 0) {
          uint64_t v18 = v8;
        }
        else {
          uint64_t v18 = v8 + 1;
        }
        uint64_t v19 = v18 >> 1;
        id v20 = v10;
        uint64_t v21 = (char *)v10 - (char *)v11 - v13 * 8;
        if (v21)
        {
          unint64_t v22 = 0xDAB7EC1DD3431B57 * (v21 >> 5);
          id v20 = &v11[v13];
          do
          {
            unint64_t v23 = v22 >> 1;
            id v24 = &v20[412 * (v22 >> 1)];
            float v25 = *((float *)v24 + 821);
            long long v26 = v24 + 412;
            v22 += ~(v22 >> 1);
            if (v25 < *((float *)&v10[412 * v19 + 410] + 1)) {
              unint64_t v22 = v23;
            }
            else {
              id v20 = v26;
            }
          }
          while (v22);
        }
        float v12 = &v10[412 * v19];
        uint64_t v27 = 0xDAB7EC1DD3431B57 * (((char *)v20 - (char *)v11 - v13 * 8) >> 5);
      }
      if (v20 == v10)
      {
        uint64_t v38 = v12;
      }
      else if (v10 == v12)
      {
        uint64_t v38 = v20;
      }
      else
      {
        uint64_t v33 = v10;
        id v34 = a3;
        uint64_t v35 = a7;
        uint64_t v36 = v19;
        double v37 = std::__rotate_forward[abi:ne180100]<std::_ClassicAlgPolicy,std::__wrap_iter<ATXPredictionItem *>>(v20, v33, v12);
        uint64_t v19 = v36;
        a7 = v35;
        a3 = v34;
        uint64_t v38 = v37;
      }
      a4 = -(v27 + v14);
      uint64_t v39 = v8 - v19;
      if (v27 + v19 >= v8 - (v27 + v19) - v14)
      {
        uint64_t v45 = -(v27 + v14);
        uint64_t v46 = v19;
        a4 = v27;
        id v43 = a6;
        uint64_t v44 = a7;
        std::__inplace_merge<std::_ClassicAlgPolicy,-[_ATXAppPredictor _getPredictionForItems:clipBundleIdsToRank:consumerSubType:intent:scoreLogger:context:featureCache:]::$_0 &,std::__wrap_iter<ATXPredictionItem *>>(v38, v12, a3, v45, v8 - v19);
        float v12 = v20;
        uint64_t v39 = v46;
        a3 = v38;
      }
      else
      {
        uint64_t v40 = v20;
        id v41 = a3;
        uint64_t v42 = v27;
        id v43 = a6;
        uint64_t v44 = a7;
        std::__inplace_merge<std::_ClassicAlgPolicy,-[_ATXAppPredictor _getPredictionForItems:clipBundleIdsToRank:consumerSubType:intent:scoreLogger:context:featureCache:]::$_0 &,std::__wrap_iter<ATXPredictionItem *>>(v15, v40, v38, v42, v19);
        a3 = v41;
        double v78 = v38;
        id v15 = v38;
      }
      unint64_t v10 = v12;
      uint64_t v11 = v15;
      uint64_t v8 = v39;
      a7 = v44;
      uint64_t v7 = v43;
      if (!v39)
      {
LABEL_43:
        double v77 = v12;
        return;
      }
    }
    double v77 = v12;
    if (a4 <= v8)
    {
      if (v11 == v10) {
        return;
      }
      char v60 = a3;
      uint64_t v61 = 0;
      uint64_t v48 = 0;
      do
      {
        double v62 = &v11[v61];
        int v63 = v11[v61];
        v11[v61] = 0;
        v7[v61] = v63;
        memcpy(&v7[v61 + 1], &v11[v61 + 1], 0xCD2uLL);
        ++v48;
        v61 += 412;
      }
      while (v62 + 412 != v10);
      if (v61 * 8)
      {
        __int16 v64 = &v7[v61];
        uint64_t v65 = v11;
        double v66 = v7;
        long long v67 = v60;
        while (v10 != v67)
        {
          if (*((float *)v66 + 821) >= *((float *)v10 + 821))
          {
            id v70 = *v66;
            *double v66 = 0;
            uint64_t v71 = *v11;
            float *v11 = v70;

            memcpy(v11 + 1, v66 + 1, 0xCD2uLL);
            v66 += 412;
          }
          else
          {
            double v68 = *v10;
            void *v10 = 0;
            double v69 = *v11;
            float *v11 = v68;

            memcpy(v11 + 1, v10 + 1, 0xCD2uLL);
            v10 += 412;
          }
          v11 += 412;
          v65 += 412;
          long long v67 = v60;
          if (v64 == v66) {
            goto LABEL_79;
          }
        }
        std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,ATXPredictionItem *,ATXPredictionItem *,std::__wrap_iter<ATXPredictionItem *>,0>(v66, v64, v65);
      }
    }
    else
    {
      if (v10 == a3) {
        return;
      }
      uint64_t v47 = 0;
      uint64_t v48 = 0;
      do
      {
        unint64_t v49 = &v10[v47];
        unint64_t v50 = v10[v47];
        v10[v47] = 0;
        v7[v47] = v50;
        unsigned __int8 v51 = a3;
        memcpy(&v7[v47 + 1], &v10[v47 + 1], 0xCD2uLL);
        a3 = v51;
        ++v48;
        v47 += 412;
      }
      while (v49 + 412 != v51);
      if (v47 * 8)
      {
        id v52 = &v7[v47];
        id v53 = v51 - 412;
        while (v10 != v11)
        {
          float v54 = *((float *)v10 - 3);
          float v55 = *((float *)v52 - 3);
          if (v54 < v55) {
            uint64_t v56 = v10 - 412;
          }
          else {
            uint64_t v56 = v52 - 412;
          }
          if (v54 < v55) {
            unint64_t v57 = v10;
          }
          else {
            unint64_t v57 = v52;
          }
          if (v54 >= v55) {
            v52 -= 412;
          }
          else {
            v10 -= 412;
          }
          uint64_t v58 = *v56;
          *uint64_t v56 = 0;
          SEL v59 = *v53;
          *id v53 = v58;

          memcpy(v53 + 1, v57 - 411, 0xCD2uLL);
          v53 -= 412;
          if (v52 == v7) {
            goto LABEL_79;
          }
        }
        uint64_t v72 = 0;
        do
        {
          double v73 = &v52[v72 - 412];
          double v74 = *v73;
          *double v73 = 0;
          double v75 = v53[v72];
          v53[v72] = v74;

          memcpy(&v53[v72 + 1], &v52[v72 - 411], 0xCD2uLL);
          v72 -= 412;
        }
        while (&v52[v72] != v7);
      }
    }
LABEL_79:
    if (v7)
    {
      do
      {

        v7 += 412;
        --v48;
      }
      while (v48);
    }
  }
}

- (void)_getPredictionForItems:(os_log_t)log clipBundleIdsToRank:consumerSubType:intent:scoreLogger:context:featureCache:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_DEBUG, "Generating new predictions: %@", buf, 0xCu);
}

- (void)initInternal
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "_ATXAppPredictor initialized", v2, v3, v4, v5, v6);
}

- (void)_initAppLaunchAndInstallMonitors
{
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_FAULT, "Can not initialize app launch and install monitors before first unlock!", v1, 2u);
}

- (void)_initDependencies
{
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_FAULT, "Can not initialize dependencies before first unlock!", v1, 2u);
}

- (void)writeCacheFileWithSerializedChunks:(uint64_t)a1 path:(NSObject *)a2 cacheFileDescriptors:consumerSubType:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "Failed to open prediction cache at \"%@\" for write!", (uint8_t *)&v2, 0xCu);
}

- (void)trainWithActivity:.cold.1()
{
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_ERROR, "App prediction training could not be set to CONTINUE, cancelling", v1, 2u);
}

@end
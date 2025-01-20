@interface ATXAppFeaturizer
+ (BOOL)_predictNextAppLaunchEmbedding:(id)a3 into:(float *)a4 launchSequence:(id)a5;
+ (double)time:(double)a3 toAccuracyInSeconds:(double)a4;
+ (float)_computeL2DistanceFromBundleId:(id)a3 to:(const float *)a4 app2vecMapping:(id)a5;
- (ATXAppFeaturizer)initWithDayZeroParameters:(id)a3 dayZeroIntentParameters:(id)a4 feedback:(id)a5 appLaunchHistogramManager:(id)a6 appLaunchSequenceManager:(id)a7 appLaunchLocation:(id)a8 appInstallMontior:(id)a9 mediaApplications:(id)a10 appDailyDose:(id)a11 globalAppScorePredictor:(id)a12 globalSmartSuppression:(id)a13 appInfoManager:(id)a14 magicalMomentsUpdateMonitor:(id)a15 heroAppPredictions:(id)a16 appIconState:(id)a17 appLaunchMicroLocation:(id)a18 notificationManager:(id)a19;
- (ATXAppFeaturizer)initWithDayZeroParameters:(id)a3 dayZeroIntentParameters:(id)a4 feedback:(id)a5 appLaunchHistogramManager:(id)a6 appLaunchSequenceManager:(id)a7 appLaunchLocation:(id)a8 appInstallMontior:(id)a9 mediaApplications:(id)a10 appDailyDose:(id)a11 globalAppScorePredictor:(id)a12 globalSmartSuppression:(id)a13 appInfoManager:(id)a14 magicalMomentsUpdateMonitor:(id)a15 heroAppPredictions:(id)a16 appIconState:(id)a17 appLaunchMicroLocation:(id)a18 notificationManager:(id)a19 heroPoiManager:(id)a20;
- (vector<ATXPredictionItem,)evaluateFeaturesForApps:(ATXAppFeaturizer *)self clipBundleIdsToRank:(SEL)a3 consumerSubType:(id)a4 intent:(id)a5 scoreLogger:(unsigned __int8)a6 context:(id)a7 featureCache:(id)a8;
- (void)setDistributionBasedScoreInputsForItem:(ATXPredictionItem *)a3 withGeoHashResolution:(unint64_t)a4 withGeoHashLaunchCounts:(id)a5;
- (void)setDistributionBasedScoreInputsForTimeAndDay:(ATXPredictionItem *)a3 forBundleId:(id)a4 withTimeOfDayHistogram:(id)a5 withDayOfWeekHistogram:(id)a6;
- (void)setModeAffinityScores:(ATXPredictionItem *)a3 appModeEntityScores:(id)a4;
- (void)setZeroValuesForModeEntityFeatures:(ATXPredictionItem *)a3;
@end

@implementation ATXAppFeaturizer

- (ATXAppFeaturizer)initWithDayZeroParameters:(id)a3 dayZeroIntentParameters:(id)a4 feedback:(id)a5 appLaunchHistogramManager:(id)a6 appLaunchSequenceManager:(id)a7 appLaunchLocation:(id)a8 appInstallMontior:(id)a9 mediaApplications:(id)a10 appDailyDose:(id)a11 globalAppScorePredictor:(id)a12 globalSmartSuppression:(id)a13 appInfoManager:(id)a14 magicalMomentsUpdateMonitor:(id)a15 heroAppPredictions:(id)a16 appIconState:(id)a17 appLaunchMicroLocation:(id)a18 notificationManager:(id)a19
{
  id v38 = a3;
  id v44 = a4;
  id v43 = a5;
  id v42 = a6;
  id v41 = a7;
  id v40 = a8;
  id v39 = a9;
  id v37 = a10;
  id v24 = a11;
  id v25 = a12;
  id v26 = a13;
  id v27 = a14;
  id v28 = a15;
  id v29 = a16;
  id v30 = a17;
  id v31 = a18;
  id v32 = a19;
  v33 = objc_opt_new();
  v36 = -[ATXAppFeaturizer initWithDayZeroParameters:dayZeroIntentParameters:feedback:appLaunchHistogramManager:appLaunchSequenceManager:appLaunchLocation:appInstallMontior:mediaApplications:appDailyDose:globalAppScorePredictor:globalSmartSuppression:appInfoManager:magicalMomentsUpdateMonitor:heroAppPredictions:appIconState:appLaunchMicroLocation:notificationManager:heroPoiManager:](self, "initWithDayZeroParameters:dayZeroIntentParameters:feedback:appLaunchHistogramManager:appLaunchSequenceManager:appLaunchLocation:appInstallMontior:mediaApplications:appDailyDose:globalAppScorePredictor:globalSmartSuppression:appInfoManager:magicalMomentsUpdateMonitor:heroAppPredictions:appIconState:appLaunchMicroLocation:notificationManager:heroPoiManager:", v38, v44, v43, v42, v41, v40, v39, v37, v24, v25, v26, v27, v28, v29,
          v30,
          v31,
          v32,
          v33);

  return v36;
}

- (ATXAppFeaturizer)initWithDayZeroParameters:(id)a3 dayZeroIntentParameters:(id)a4 feedback:(id)a5 appLaunchHistogramManager:(id)a6 appLaunchSequenceManager:(id)a7 appLaunchLocation:(id)a8 appInstallMontior:(id)a9 mediaApplications:(id)a10 appDailyDose:(id)a11 globalAppScorePredictor:(id)a12 globalSmartSuppression:(id)a13 appInfoManager:(id)a14 magicalMomentsUpdateMonitor:(id)a15 heroAppPredictions:(id)a16 appIconState:(id)a17 appLaunchMicroLocation:(id)a18 notificationManager:(id)a19 heroPoiManager:(id)a20
{
  id v50 = a3;
  id v49 = a4;
  id v35 = a5;
  id v48 = a5;
  id v36 = a6;
  id v47 = a6;
  id v37 = a7;
  id v46 = a7;
  id v45 = a8;
  id v44 = a9;
  id v43 = a10;
  id v42 = a11;
  id v41 = a12;
  id v40 = a13;
  id v39 = a14;
  id v25 = a15;
  id v26 = a16;
  id v27 = a17;
  id v28 = a18;
  id v29 = a19;
  id v30 = a20;
  v51.receiver = self;
  v51.super_class = (Class)ATXAppFeaturizer;
  id v31 = [(ATXAppFeaturizer *)&v51 init];
  id v32 = v31;
  if (v31)
  {
    objc_storeStrong((id *)&v31->_dayZeroParameters, a3);
    objc_storeStrong((id *)&v32->_dayZeroIntentParameters, a4);
    objc_storeStrong((id *)&v32->_feedback, v35);
    objc_storeStrong((id *)&v32->_appLaunchHistogramManager, v36);
    objc_storeStrong((id *)&v32->_appLaunchSequenceManager, v37);
    objc_storeStrong((id *)&v32->_appLaunchLocation, a8);
    objc_storeStrong((id *)&v32->_appInstallMonitor, a9);
    objc_storeStrong((id *)&v32->_mediaApps, a10);
    objc_storeStrong((id *)&v32->_appDailyDose, a11);
    objc_storeStrong((id *)&v32->_globalAppScorePredictor, a12);
    objc_storeStrong((id *)&v32->_globalSmartSuppression, a13);
    objc_storeStrong((id *)&v32->_appInfoManager, a14);
    objc_storeStrong((id *)&v32->_mmPredictionMonitor, a15);
    objc_storeStrong((id *)&v32->_heroPredictionServer, a16);
    objc_storeStrong((id *)&v32->_appIconState, a17);
    objc_storeStrong((id *)&v32->_microLocation, a18);
    objc_storeStrong((id *)&v32->_notificationManager, a19);
    objc_storeStrong((id *)&v32->_heroPoiManager, a20);
  }

  return v32;
}

- (vector<ATXPredictionItem,)evaluateFeaturesForApps:(ATXAppFeaturizer *)self clipBundleIdsToRank:(SEL)a3 consumerSubType:(id)a4 intent:(id)a5 scoreLogger:(unsigned __int8)a6 context:(id)a7 featureCache:(id)a8
{
  MEMORY[0x1F4188790](self, a3);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  uint64_t v17 = v16;
  v19 = v18;
  v21 = v20;
  v846 = v22;
  v895[16] = *MEMORY[0x1E4F143B8];
  id v731 = v23;
  id v24 = v19;
  id v727 = v15;
  id v728 = v13;
  id v858 = v11;
  id v770 = a10;
  v729 = v24;
  v754 = [v21[1] recentNotifications];
  if (v24)
  {
    id v761 = [v731 arrayByAddingObjectsFromArray:v24];
  }
  else
  {
    id v761 = v731;
  }
  id v25 = __atxlog_handle_app_prediction();
  v863 = v21;
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    id v26 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:v17];
    LODWORD(v892[0]) = 138412290;
    *(id *)((char *)v892 + 4) = v26;
    _os_log_impl(&dword_1D0FA3000, v25, OS_LOG_TYPE_DEFAULT, "Evaluating app features for consumer: %@.", (uint8_t *)v892, 0xCu);
  }
  if (v770)
  {
    [v770 itemsForBundleIds:v761];
    uint64_t v27 = *((void *)&v884 + 1);
    uint64_t v28 = v884;
  }
  else
  {
    uint64_t v28 = 0;
    uint64_t v27 = 0;
    long long v884 = 0uLL;
    uint64_t v885 = 0;
  }
  if (0xDAB7EC1DD3431B57 * ((v27 - v28) >> 5) == [v761 count])
  {
    id v29 = __atxlog_handle_app_prediction();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      id v30 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:v17];
      LODWORD(v892[0]) = 138412290;
      *(id *)((char *)v892 + 4) = v30;
      _os_log_impl(&dword_1D0FA3000, v29, OS_LOG_TYPE_DEFAULT, "Found all bundleIds in the feature cache. Using the cached values for consumer: %@.", (uint8_t *)v892, 0xCu);
    }
    *(_OWORD *)v846 = v884;
    v846[2] = v885;
    uint64_t v885 = 0;
    long long v884 = 0uLL;
    goto LABEL_132;
  }
  std::vector<ATXPredictionItem>::vector(v846, [v761 count]);
  int v834 = [v731 count];
  uint64_t v829 = [v24 count] + v834;
  v800 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:(int)v829];
  v799 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:(int)v829];
  v722 = (void *)MEMORY[0x1D25F6CC0]();
  std::vector<double>::vector(&v882, (int)v829);
  std::vector<double>::vector(&v880, (int)v829);
  std::vector<double>::vector(&v878, (int)v829);
  [v21[2] putFeedbackScoresForApps:v761 intoScores:v882 confirms:v880 rejects:v878];
  id v31 = [v858 timeContext];
  id v32 = [v31 date];

  v33 = [v858 userContext];
  v752 = [v33 lastUnlockDate];

  v861 = [v21[3] histogramForLaunchType:0];
  v822 = [v21[3] histogramForLaunchType:1];
  v758 = [v21[3] histogramForLaunchType:92];
  v757 = [v21[3] histogramForLaunchType:93];
  v730 = [v21[3] histogramForLaunchType:11];
  v859 = [v21[3] histogramForLaunchType:2];
  v762 = [v21[3] histogramForLaunchType:3];
  v798 = [v21[3] histogramForLaunchType:5];
  v832 = [v21[3] categoricalHistogramForLaunchType:4];
  v794 = [v21[3] categoricalHistogramForLaunchType:37];
  v750 = [v21[3] categoricalHistogramForLaunchType:41];
  v833 = [v21[3] categoricalHistogramForLaunchType:42];
  v811 = [v21[3] categoricalHistogramForLaunchType:43];
  v807 = [v21[3] categoricalHistogramForLaunchType:44];
  v810 = [v21[3] categoricalHistogramForLaunchType:45];
  v806 = [v21[3] categoricalHistogramForLaunchType:46];
  v809 = [v21[3] categoricalHistogramForLaunchType:47];
  v805 = [v21[3] categoricalHistogramForLaunchType:48];
  v808 = [v21[3] categoricalHistogramForLaunchType:87];
  v831 = [v21[3] categoricalHistogramForLaunchType:50];
  v830 = [v21[3] categoricalHistogramForLaunchType:51];
  v825 = [v21[3] categoricalHistogramForLaunchType:61];
  v777 = [v21[3] categoricalHistogramForLaunchType:52];
  v776 = [v21[3] categoricalHistogramForLaunchType:53];
  v775 = [v21[3] categoricalHistogramForLaunchType:54];
  v774 = [v21[3] categoricalHistogramForLaunchType:55];
  v773 = [v21[3] categoricalHistogramForLaunchType:56];
  v804 = [v21[3] categoricalHistogramForLaunchType:57];
  v803 = [v21[3] categoricalHistogramForLaunchType:58];
  v802 = [v21[3] categoricalHistogramForLaunchType:59];
  v801 = [v21[3] categoricalHistogramForLaunchType:60];
  v821 = [v21[3] categoricalHistogramForLaunchType:63];
  v818 = [v21[3] categoricalHistogramForLaunchType:64];
  v791 = [v21[3] categoricalHistogramForLaunchType:65];
  v793 = [v21[3] categoricalHistogramForLaunchType:66];
  v789 = [v21[3] categoricalHistogramForLaunchType:67];
  v787 = [v21[3] categoricalHistogramForLaunchType:68];
  v820 = [v21[3] categoricalHistogramForLaunchType:69];
  v817 = [v21[3] categoricalHistogramForLaunchType:70];
  v790 = [v21[3] categoricalHistogramForLaunchType:71];
  v792 = [v21[3] categoricalHistogramForLaunchType:72];
  v788 = [v21[3] categoricalHistogramForLaunchType:73];
  v786 = [v21[3] categoricalHistogramForLaunchType:74];
  v819 = [v21[3] categoricalHistogramForLaunchType:88];
  v816 = [v21[3] categoricalHistogramForLaunchType:75];
  v813 = [v21[3] categoricalHistogramForLaunchType:76];
  v783 = [v21[3] categoricalHistogramForLaunchType:77];
  v785 = [v21[3] categoricalHistogramForLaunchType:78];
  v781 = [v21[3] categoricalHistogramForLaunchType:79];
  v779 = [v21[3] categoricalHistogramForLaunchType:80];
  v815 = [v21[3] categoricalHistogramForLaunchType:81];
  v812 = [v21[3] categoricalHistogramForLaunchType:82];
  v782 = [v21[3] categoricalHistogramForLaunchType:83];
  v784 = [v21[3] categoricalHistogramForLaunchType:84];
  v780 = [v21[3] categoricalHistogramForLaunchType:85];
  v778 = [v21[3] categoricalHistogramForLaunchType:86];
  v814 = [v21[3] categoricalHistogramForLaunchType:89];
  v772 = [v21[3] categoricalHistogramForLaunchType:95];
  v34 = [v858 userContext];
  v725 = [v34 lastAppLaunch];

  if (v725)
  {
    objc_msgSend(v21[4], "launchSequenceForBundle:");
    id v856 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v856 = 0;
  }
  id v35 = (void *)MEMORY[0x1E4F93608];
  id v36 = [v858 locationMotionContext];
  v795 = objc_msgSend(v35, "getMotionStringFromMotionType:", objc_msgSend(v36, "motionType"));

  id v37 = [v858 deviceStateContext];
  unsigned int v827 = [v37 onWifi];

  id v38 = [v858 deviceStateContext];
  v823 = [v38 wifiSSID];

  id v39 = [v858 deviceStateContext];
  int v755 = [v39 inAirplaneMode];

  [v861 entropy];
  double v747 = v40;
  [v859 entropy];
  double v746 = v41;
  [v859 entropyForDate:v32];
  double v745 = v42;
  [v798 entropy];
  double v744 = v43;
  [v832 entropy];
  double v743 = v44;
  [v832 entropyForCategory:v823];
  double v742 = v45;
  id v46 = [v858 locationMotionContext];
  int context = [v46 locationEnabled];

  if ((int)v829 < 1)
  {
    double v50 = 0.0;
    double v49 = 0.0;
    double v48 = 0.0;
    v52 = v21;
  }
  else
  {
    uint64_t v47 = 0;
    double v48 = 0.0;
    double v49 = 0.0;
    double v50 = 0.0;
    objc_super v51 = v859;
    v52 = v21;
    do
    {
      v53 = [v761 objectAtIndexedSubscript:v47];
      [v861 overallLaunchPopularityForBundleId:v53];
      double v55 = v54;
      [v51 relativeLaunchPopularityWithBundleId:v53 date:v32];
      double v57 = v56;
      [v798 relativeLaunchPopularityWithBundleId:v53 date:v32];
      double v59 = v58;
      [v832 relativeLaunchPopularityWithBundleId:v53 category:v823];
      double v61 = v60;

      double v48 = v48 + vabdd_f64(v55, v57);
      double v49 = v49 + vabdd_f64(v55, v59);
      double v50 = v50 + vabdd_f64(v55, v61);
      ++v47;
      objc_super v51 = v859;
    }
    while (v829 != v47);
  }
  [MEMORY[0x1E4F4AF08] pathForResource:@"_ATXApp2VecMapping" ofType:@"dat" isDirectory:0];
  v876 = 0;
  __p = 0;
  v723 = uint64_t v877 = 0;
  if (v723)
  {
    v62 = [[ATXApp2VecMapping alloc] initWithPath:v723];
    std::vector<float>::resize((uint64_t)&__p, [(ATXApp2VecMapping *)v62 vectorLength]);
    v63 = objc_opt_class();
    v64 = __p;
    v65 = [v52[4] launchSequence];
    v732 = v62;
    int v741 = [v63 _predictNextAppLaunchEmbedding:v62 into:v64 launchSequence:v65];
  }
  else
  {
    int v741 = 0;
    v732 = 0;
  }
  v66 = [v858 timeContext];
  int v768 = [v66 dayOfWeek];

  v67 = [v858 timeContext];
  int v766 = [v67 timeOfDay];

  v68 = [v858 timeContext];
  unsigned int v764 = [v68 dateInWeekend];

  v826 = +[_ATXActionUtils stringForTimeOfDayAndDayOfWeek:v32 timeZone:0];
  v69 = [v858 locationMotionContext];
  v840 = +[_ATXActionUtils stringForSpecificGeohash:](_ATXActionUtils, "stringForSpecificGeohash:", [v69 geohash]);

  v70 = [v858 locationMotionContext];
  v842 = +[_ATXActionUtils stringForCoarseGeohash:](_ATXActionUtils, "stringForCoarseGeohash:", [v70 coarseGeohash]);

  v71 = [v858 locationMotionContext];
  v756 = +[_ATXActionUtils stringForZoom7Geohash:](_ATXActionUtils, "stringForZoom7Geohash:", [v71 largeGeohash]);

  v838 = +[_ATXActionUtils stringForTwoHourTimeWindow:v32 timeZone:0];
  v836 = +[_ATXActionUtils stringForDayOfWeek:v32 timeZone:0];
  v72 = [v858 locationMotionContext];
  v844 = +[_ATXActionUtils stringForCoarseTimePOWLocation:timeZone:coarseGeohash:](_ATXActionUtils, "stringForCoarseTimePOWLocation:timeZone:coarseGeohash:", v32, 0, [v72 coarseGeohash]);

  v73 = [v858 locationMotionContext];
  v837 = +[_ATXActionUtils stringForSpecificTimeDOWLocation:timeZone:geohash:](_ATXActionUtils, "stringForSpecificTimeDOWLocation:timeZone:geohash:", v32, 0, [v73 geohash]);

  v753 = [v863[10] globalPopularityForBundleIdsGivenTimeDayLocationAndLastApp:v761 context:v858];
  v848 = objc_opt_new();
  v850 = objc_opt_new();
  v854 = objc_opt_new();
  v852 = objc_opt_new();
  long long v874 = 0u;
  long long v873 = 0u;
  long long v872 = 0u;
  long long v871 = 0u;
  obuint64_t j = v761;
  uint64_t v74 = [obj countByEnumeratingWithState:&v871 objects:v895 count:16];
  if (v74)
  {
    uint64_t v75 = *(void *)v872;
    do
    {
      for (uint64_t i = 0; i != v74; ++i)
      {
        if (*(void *)v872 != v75) {
          objc_enumerationMutation(obj);
        }
        uint64_t v77 = *(void *)(*((void *)&v871 + 1) + 8 * i);
        v78 = NSNumber;
        id v79 = v863[5];
        v80 = [v858 locationMotionContext];
        v81 = [v80 currentLOI];
        v82 = objc_msgSend(v78, "numberWithInt:", objc_msgSend(v79, "launchCountAtLOI:bundleId:", v81, v77));
        [v854 setObject:v82 forKeyedSubscript:v77];

        v83 = NSNumber;
        [v856 launchCount:v77];
        v84 = objc_msgSend(v83, "numberWithDouble:");
        [v852 setObject:v84 forKeyedSubscript:v77];

        v85 = NSNumber;
        uint64_t v894 = v77;
        v86 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v894 count:1];
        LODWORD(v87) = 1045220557;
        [v861 totalLaunchesForBundleIds:v86 forDate:v32 distanceScale:v87];
        v88 = objc_msgSend(v85, "numberWithDouble:");
        [v850 setObject:v88 forKeyedSubscript:v77];

        v89 = NSNumber;
        uint64_t v893 = v77;
        v90 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v893 count:1];
        LODWORD(v91) = 1.0;
        [v859 totalLaunchesForBundleIds:v90 forDate:v32 distanceScale:v91];
        v92 = objc_msgSend(v89, "numberWithDouble:");
        [v848 setObject:v92 forKeyedSubscript:v77];
      }
      uint64_t v74 = [obj countByEnumeratingWithState:&v871 objects:v895 count:16];
    }
    while (v74);
  }

  v824 = +[ATXBlendedLocalAndGlobalScores blendedGlobalAndLocalScoresForGlobalScores:v753 LOITypeLaunches:v854 lastAppLaunches:v852 timeOfDayLaunches:v850 dayOfWeekLaunches:v848 forApps:obj];
  v749 = [v863[10] globalPopularityForBundleIdsGivenTimeDayAndLocation:obj context:v858];
  uint32_t v93 = arc4random();
  unint64_t v740 = [v863[12] launchedAppCount];
  v771 = [v863[16] currentPoiCategory];
  v94 = objc_opt_new();
  uint64_t v95 = [v94 efficientCurrentMode];
  v96 = (void *)v95;
  v97 = @"Default";
  if (v95) {
    v97 = (__CFString *)v95;
  }
  v726 = v97;

  v98 = __atxlog_handle_app_prediction();
  if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
  {
    v99 = (objc_class *)objc_opt_class();
    NSStringFromClass(v99);
    id v100 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(v892[0]) = 138412546;
    *(id *)((char *)v892 + 4) = v100;
    WORD2(v892[1]) = 2112;
    *(id *)((char *)&v892[1] + 6) = v726;
    _os_log_impl(&dword_1D0FA3000, v98, OS_LOG_TYPE_DEFAULT, "%@ - retrieved current mode of %@ from ATXUnifiedActivityBiomeStream", (uint8_t *)v892, 0x16u);
  }
  id v101 = objc_alloc(MEMORY[0x1E4F4B178]);
  v102 = +[ATXModeEntityScorerServer sharedInstance];
  v724 = (void *)[v101 initWithModeEntityScorerClient:v102];

  v748 = [v724 modeEntityScoresFromCacheForModeEntityTypeIdentifier:*MEMORY[0x1E4F93678] modeIdentifier:v726 modeConfigurationType:0];
  if ((int)v829 >= 1)
  {
    unint64_t v103 = 0;
    char v751 = 0;
    double v735 = (double)v93 / 4294967300.0;
    double v737 = (double)v766;
    double v738 = (double)v768;
    double v736 = (double)v764;
    int64_t v739 = v834;
    double v733 = (double)(context ^ 1u);
    double v734 = (double)v827;
    while (1)
    {
      contexta = (void *)MEMORY[0x1D25F6CC0]();
      v828 = [obj objectAtIndexedSubscript:v103];
      if (!v770) {
        break;
      }
      [v770 itemForBundleId:v828];
      if (!v892[0]) {
        goto LABEL_42;
      }
      uint64_t v104 = *v846;
      if (0xDAB7EC1DD3431B57 * ((uint64_t)(v846[1] - *v846) >> 5) <= v103) {
        std::vector<ATXPredictionItem>::__throw_out_of_range[abi:ne180100]();
      }
      objc_storeStrong((id *)(v104 + 3296 * v103), v892[0]);
      memcpy((void *)(v104 + 3296 * v103 + 8), &v892[1], 0xCD2uLL);
LABEL_114:

      if (++v103 == v829) {
        goto LABEL_115;
      }
    }
    bzero(v892, 0xCE0uLL);
LABEL_42:
    id v105 = v828;
    id v869 = v105;
    v870[819] = -31337.0;
    LOWORD(v870[820]) = 0;
    for (uint64_t j = 4; j != 821; ++j)
      v870[j - 2] = -31337.0;
    v835 = [v863[12] appInfoForBundleId:v105];
    v107 = __atxlog_handle_app_prediction();
    if (os_log_type_enabled(v107, OS_LOG_TYPE_DEBUG))
    {
      int v890 = 138412290;
      id v891 = v105;
      _os_log_debug_impl(&dword_1D0FA3000, v107, OS_LOG_TYPE_DEBUG, "Setting score inputs for app with BundleId: %@", (uint8_t *)&v890, 0xCu);
    }

    v108 = [v835 genreId];
    BOOL v109 = v108 == 0;

    if (!v109)
    {
      v110 = [v835 genreId];
      [v800 setValue:v110 forKey:v105];
    }
    v111 = [v835 app2VecCluster];
    BOOL v112 = v111 == 0;

    if (!v112)
    {
      v113 = [v835 app2VecCluster];
      [v799 setValue:v113 forKey:v105];
    }
    uint64_t v114 = [v835 installDate];
    if ((v114 != 0) | v751 & 1)
    {
      v115 = (void *)v114;
      if (!v114) {
        goto LABEL_62;
      }
      v116 = [v858 timeContext];
      v117 = [v116 date];
      ATXSetInputAge((uint64_t)&v869, 0, v115, v117);

      v118 = v835;
      v119 = v115;
    }
    else
    {
      if ([v105 hasPrefix:@"com.apple"])
      {
        char v751 = 0;
        v115 = 0;
        goto LABEL_62;
      }
      [v863[6] train];
      v118 = [v863[12] appInfoForBundleId:v105];

      v119 = [v118 installDate];
      if (v119)
      {
        v116 = [v858 timeContext];
        v120 = [v116 date];
        ATXSetInputAge((uint64_t)&v869, 0, v119, v120);
      }
      else
      {
        v116 = __atxlog_handle_app_prediction();
        if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
        {
          int v890 = 138412290;
          id v891 = v105;
        }
        v119 = 0;
      }
      char v751 = 1;
    }

    v835 = v118;
    v115 = v119;
LABEL_62:
    double v121 = 0.0;
    if ((uint64_t)v103 >= v739)
    {
      v122 = objc_msgSend(v858, "timeContext", 0.0);
      v123 = [v122 date];
      v124 = [v123 dateByAddingTimeInterval:-43200.0];
      v125 = [v858 timeContext];
      v126 = [v125 date];
      ATXSetInputAge((uint64_t)&v869, 0, v124, v126);

      double v121 = 1.0;
    }
    ATXSetInput((uint64_t)&v869, 0x301uLL, v121);
    ATXSetInput((uint64_t)&v869, 0x6CuLL, v738);
    ATXSetInput((uint64_t)&v869, 0x6DuLL, v737);
    ATXSetInput((uint64_t)&v869, 0x6EuLL, v736);
    ATXSetInput((uint64_t)&v869, 0x161uLL, v735);
    uint32_t v127 = arc4random();
    *(float *)&double v128 = ATXSetInput((uint64_t)&v869, 0x162uLL, (double)v127 / 4294967300.0);
    v129 = objc_msgSend(v858, "ambientLightContext", v128);
    uint64_t v130 = [v129 ambientLightType];

    if (v130 != 7)
    {
      v131 = [NSNumber numberWithInt:v130];
      v132 = [v131 stringValue];
      [v750 launchPopularityWithBundleId:v105 category:v132];
      ATXSetInput((uint64_t)&v869, 0x186uLL, v133);

      v134 = [NSNumber numberWithInt:v130];
      v135 = [v134 stringValue];
      [v750 relativeLaunchPopularityWithBundleId:v105 category:v135];
      ATXSetInput((uint64_t)&v869, 0x185uLL, v136);
    }
    double v137 = ATXDayZeroScore(v105, v863[17], v740);
    *(float *)&double v138 = ATXSetInput((uint64_t)&v869, 0x21uLL, v137);
    v139 = objc_msgSend(v863[17], "objectForKeyedSubscript:", @"staticPenalties", v138);
    v769 = [v139 objectForKeyedSubscript:v105];

    [v769 doubleValue];
    *(float *)&double v141 = ATXSetInput((uint64_t)&v869, 0x22uLL, v140);
    +[_ATXFeedbackConstants alphaForBundleId:](_ATXFeedbackConstants, "alphaForBundleId:", v105, v141);
    *(float *)&double v143 = ATXSetInput((uint64_t)&v869, 0x166uLL, v142);
    +[_ATXFeedbackConstants betaForBundleId:](_ATXFeedbackConstants, "betaForBundleId:", v105, v143);
    *(float *)&double v145 = ATXSetInput((uint64_t)&v869, 0x167uLL, v144);
    v146 = objc_msgSend(v854, "objectForKeyedSubscript:", v105, v145);
    [v146 doubleValue];
    ATXSetInput((uint64_t)&v869, 0x16AuLL, v147);

    v148 = [v852 objectForKeyedSubscript:v105];
    [v148 doubleValue];
    ATXSetInput((uint64_t)&v869, 0x16BuLL, v149);

    v150 = [v850 objectForKeyedSubscript:v105];
    [v150 doubleValue];
    ATXSetInput((uint64_t)&v869, 0x16CuLL, v151);

    v152 = [v848 objectForKeyedSubscript:v105];
    [v152 doubleValue];
    ATXSetInput((uint64_t)&v869, 0x16DuLL, v153);

    if (v753)
    {
      v154 = [v753 objectForKeyedSubscript:v105];
      [v154 doubleValue];
      ATXSetInput((uint64_t)&v869, 0x168uLL, v155);

      v156 = [v824 objectForKeyedSubscript:@"DayOfWeek"];
      v157 = [v156 objectForKeyedSubscript:v105];
      [v157 doubleValue];
      ATXSetInput((uint64_t)&v869, 0x171uLL, v158);

      v159 = [v824 objectForKeyedSubscript:@"LOIType"];
      v160 = [v159 objectForKeyedSubscript:v105];
      [v160 doubleValue];
      ATXSetInput((uint64_t)&v869, 0x16EuLL, v161);

      v162 = [v824 objectForKeyedSubscript:@"LastApp"];
      v163 = [v162 objectForKeyedSubscript:v105];
      [v163 doubleValue];
      ATXSetInput((uint64_t)&v869, 0x16FuLL, v164);

      v165 = [v824 objectForKeyedSubscript:@"TimeOfDay"];
      v166 = [v165 objectForKeyedSubscript:v105];
      [v166 doubleValue];
      ATXSetInput((uint64_t)&v869, 0x170uLL, v167);

      v168 = [v824 objectForKeyedSubscript:@"DayOfWeek_sampled"];
      v169 = [v168 objectForKeyedSubscript:v105];
      [v169 doubleValue];
      ATXSetInput((uint64_t)&v869, 0x175uLL, v170);

      v171 = [v824 objectForKeyedSubscript:@"LOIType_sampled"];
      v172 = [v171 objectForKeyedSubscript:v105];
      [v172 doubleValue];
      ATXSetInput((uint64_t)&v869, 0x172uLL, v173);

      v174 = [v824 objectForKeyedSubscript:@"LastApp_sampled"];
      v175 = [v174 objectForKeyedSubscript:v105];
      [v175 doubleValue];
      ATXSetInput((uint64_t)&v869, 0x173uLL, v176);

      v177 = [v824 objectForKeyedSubscript:@"TimeOfDay_sampled"];
      v178 = [v177 objectForKeyedSubscript:v105];
      [v178 doubleValue];
      ATXSetInput((uint64_t)&v869, 0x174uLL, v179);
    }
    v180 = [v749 objectForKeyedSubscript:v105];
    [v180 doubleValue];
    ATXSetInput((uint64_t)&v869, 0x169uLL, v181);

    v182 = [v863[11] fetchContextualAssociationScoresForBundleId:v105];
    v183 = [v182 objectForKeyedSubscript:@"GeohashZoom7"];
    [v183 doubleValue];
    ATXSetInput((uint64_t)&v869, 0x29BuLL, v184);

    v185 = [v182 objectForKeyedSubscript:@"GeohashCoarse"];
    [v185 doubleValue];
    ATXSetInput((uint64_t)&v869, 0x29CuLL, v186);

    v187 = [v182 objectForKeyedSubscript:@"GeohashSpecific"];
    [v187 doubleValue];
    ATXSetInput((uint64_t)&v869, 0x29DuLL, v188);

    v189 = [v182 objectForKeyedSubscript:@"PartOfWeek"];
    [v189 doubleValue];
    ATXSetInput((uint64_t)&v869, 0x29EuLL, v190);

    v191 = [v182 objectForKeyedSubscript:@"CoarseTime"];
    [v191 doubleValue];
    ATXSetInput((uint64_t)&v869, 0x29FuLL, v192);

    v193 = [v182 objectForKeyedSubscript:@"LOIType"];
    [v193 doubleValue];
    ATXSetInput((uint64_t)&v869, 0x2A0uLL, v194);

    v195 = [v835 lastLaunch];
    v196 = [v858 timeContext];
    v197 = [v196 date];
    ATXSetInputAge((uint64_t)&v869, 2uLL, v195, v197);

    v198 = [v835 lastSpotlightLaunch];
    v199 = [v858 timeContext];
    v200 = [v199 date];
    ATXSetInputAge((uint64_t)&v869, 1uLL, v198, v200);

    v759 = [v835 averageSecondsBetweenLaunches];
    if (v759)
    {
      [v759 doubleValue];
      *(float *)&double v201 = ATXSetInput((uint64_t)&v869, 4uLL, v202);
    }
    v760 = objc_msgSend(v835, "medianSecondsBetweenLaunches", v201);
    if (v760)
    {
      [v760 doubleValue];
      *(float *)&double v203 = ATXSetInput((uint64_t)&v869, 3uLL, v204);
    }
    if (v752)
    {
      objc_msgSend(v32, "timeIntervalSinceDate:", v752, v203);
      if (v203 >= 0.0)
      {
        HIDWORD(v205) = 1085021696;
        if (v203 >= 3600.0) {
          double v203 = 3599.0;
        }
        LODWORD(v205) = 1.0;
        [v730 relativeLaunchPopularityWithBundleId:v105 elapsedTime:v203 distanceScale:v205];
        *(float *)&double v203 = ATXSetInput((uint64_t)&v869, 5uLL, v206);
      }
    }
    unsigned int v207 = objc_msgSend(v863[13], "appInFolderWithBundleId:", v105, v203);
    if (v207) {
      ATXSetInput((uint64_t)&v869, 7uLL, (double)[v863[13] folderPageNumberForBundleId:v105]);
    }
    *(float *)&double v208 = ATXSetInput((uint64_t)&v869, 6uLL, (double)v207);
    uint64_t v209 = objc_msgSend(v863[13], "springboardPageNumberForBundleId:", v105, v208);
    double v210 = 0.0;
    if (v209 != -1) {
      double v210 = 1.0;
    }
    ATXSetInput((uint64_t)&v869, 8uLL, v210);
    *(float *)&double v211 = ATXSetInput((uint64_t)&v869, 9uLL, (double)v209);
    if (v209 == -1) {
      *(float *)&double v211 = ATXSetInput((uint64_t)&v869, 9uLL, 0.0);
    }
    *(float *)&double v212 = ATXSetInput((uint64_t)&v869, 0xAuLL, (double)objc_msgSend(v863[13], "appOnDockWithBundleId:", v105, v211));
    id v213 = v863[5];
    v214 = objc_msgSend(v858, "locationMotionContext", v212);
    v215 = [v214 currentLOI];
    [v213 launchProbabilityAtLOI:v215 bundleId:v105];
    ATXSetInput((uint64_t)&v869, 0x26uLL, v216);

    [v863[7] popularityAtCurrentMicroLocationForApp:v105];
    *(float *)&double v218 = ATXSetInput((uint64_t)&v869, 0x27uLL, v217);
    objc_msgSend(v762, "overallLaunchPopularityForBundleId:", v105, v218);
    if (!v755) {
      double v219 = 0.0;
    }
    ATXSetInput((uint64_t)&v869, 0x3DuLL, v219);
    double v220 = 0.0;
    if (v755) {
      objc_msgSend(v762, "totalLaunches", 0.0);
    }
    *(float *)&double v221 = ATXSetInput((uint64_t)&v869, 0x3EuLL, v220);
    id v889 = v105;
    v222 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v889, 1, v221);
    [v762 totalLaunchesForBundleIds:v222];
    ATXSetInput((uint64_t)&v869, 0x2A4uLL, v223);

    [v798 overallLaunchPopularityForBundleId:v105];
    *(float *)&double v225 = ATXSetInput((uint64_t)&v869, 0x3FuLL, v224);
    objc_msgSend(v798, "totalLaunches", v225);
    *(float *)&double v227 = ATXSetInput((uint64_t)&v869, 0x40uLL, v226);
    objc_msgSend(v832, "overallLaunchPopularityForBundleId:category:", v105, v823, v227);
    *(float *)&double v229 = ATXSetInput((uint64_t)&v869, 0x41uLL, v228);
    objc_msgSend(v832, "totalLaunchesForCategory:", v823, v229);
    *(float *)&double v231 = ATXSetInput((uint64_t)&v869, 0x42uLL, v230);
    objc_msgSend(v832, "totalLaunchesForBundleId:category:", v105, v823, v231);
    *(float *)&double v233 = ATXSetInput((uint64_t)&v869, 0x2A1uLL, v232);
    objc_msgSend(v832, "totalLaunchesForBundleId:", v105, v233);
    ATXSetInput((uint64_t)&v869, 0x2A2uLL, v234);
    *(float *)&double v235 = ATXSetInput((uint64_t)&v869, 0x43uLL, v734);
    objc_msgSend(v794, "overallLaunchPopularityForBundleId:category:", v105, v795, v235);
    *(float *)&double v237 = ATXSetInput((uint64_t)&v869, 0x44uLL, v236);
    objc_msgSend(v794, "totalLaunchesForCategory:", v795, v237);
    *(float *)&double v239 = ATXSetInput((uint64_t)&v869, 0x45uLL, v238);
    objc_msgSend(v794, "totalLaunchesForBundleId:category:", v105, v795, v239);
    *(float *)&double v241 = ATXSetInput((uint64_t)&v869, 0x2A3uLL, v240);
    objc_msgSend(v833, "overallLaunchPopularityForBundleId:category:", v105, v826, v241);
    *(float *)&double v243 = ATXSetInput((uint64_t)&v869, 0x61uLL, v242);
    objc_msgSend(v833, "totalLaunchesForBundleId:category:", v105, v826, v243);
    *(float *)&double v245 = ATXSetInput((uint64_t)&v869, 0x1FFuLL, v244);
    objc_msgSend(v833, "totalLaunchesForBundleId:", v105, v245);
    *(float *)&double v247 = ATXSetInput((uint64_t)&v869, 0x201uLL, v246);
    objc_msgSend(v833, "relativeLaunchPopularityWithBundleId:category:", v105, v826, v247);
    *(float *)&double v249 = ATXSetInput((uint64_t)&v869, 0x62uLL, v248);
    objc_msgSend(v833, "launchPopularityWithBundleId:category:", v105, v826, v249);
    *(float *)&double v251 = ATXSetInput((uint64_t)&v869, 0x63uLL, v250);
    objc_msgSend(v833, "totalLaunches", v251);
    *(float *)&double v253 = ATXSetInput((uint64_t)&v869, 0x64uLL, v252);
    objc_msgSend(v861, "totalLaunches", v253);
    *(float *)&double v255 = ATXSetInput((uint64_t)&v869, 0x3BuLL, v254);
    objc_msgSend(v861, "launchPopularityWithBundleId:date:", v105, v32, v255);
    *(float *)&double v257 = ATXSetInput((uint64_t)&v869, 0x1AuLL, v256);
    objc_msgSend(v861, "relativeLaunchPopularityWithBundleId:date:", v105, v32, v257);
    ATXSetInput((uint64_t)&v869, 0x1BuLL, v258);
    LODWORD(v259) = 1045220557;
    [v861 relativeLaunchPopularityWithBundleId:v105 date:v32 distanceScale:v259];
    *(float *)&double v261 = ATXSetInput((uint64_t)&v869, 0x1CuLL, v260);
    objc_msgSend(v861, "overallLaunchPopularityForBundleId:", v105, v261);
    *(float *)&double v263 = ATXSetInput((uint64_t)&v869, 0x1DuLL, v262);
    objc_msgSend(v822, "totalLaunches", v263);
    *(float *)&double v265 = ATXSetInput((uint64_t)&v869, 0x3CuLL, v264);
    objc_msgSend(v822, "launchPopularityWithBundleId:date:", v105, v32, v265);
    *(float *)&double v267 = ATXSetInput((uint64_t)&v869, 0x1EuLL, v266);
    objc_msgSend(v822, "relativeLaunchPopularityWithBundleId:date:", v105, v32, v267);
    *(float *)&double v269 = ATXSetInput((uint64_t)&v869, 0x1FuLL, v268);
    objc_msgSend(v822, "overallLaunchPopularityForBundleId:", v105, v269);
    *(float *)&double v271 = ATXSetInput((uint64_t)&v869, 0x20uLL, v270);
    id v888 = v105;
    v272 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v888, 1, v271);
    [v758 totalLaunchesForBundleIds:v272];
    ATXSetInput((uint64_t)&v869, 0x2CCuLL, v273);

    [v758 totalLaunches];
    *(float *)&double v275 = ATXSetInput((uint64_t)&v869, 0x2CDuLL, v274);
    id v887 = v105;
    v276 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v887, 1, v275);
    [v757 totalLaunchesForBundleIds:v276];
    ATXSetInput((uint64_t)&v869, 0x2CEuLL, v277);

    [v757 totalLaunches];
    *(float *)&double v279 = ATXSetInput((uint64_t)&v869, 0x2CFuLL, v278);
    objc_msgSend(v859, "launchPopularityWithBundleId:date:", v105, v32, v279);
    *(float *)&double v281 = ATXSetInput((uint64_t)&v869, 0x23uLL, v280);
    objc_msgSend(v859, "relativeLaunchPopularityWithBundleId:date:", v105, v32, v281);
    *(float *)&double v283 = ATXSetInput((uint64_t)&v869, 0x24uLL, v282);
    v284 = objc_msgSend(v831, "launchCountsForEachCategoryForBundleId:", v105, v283);
    v285 = [v284 allValues];

    v286 = [v830 launchCountsForEachCategoryForBundleId:v105];
    v765 = [v286 allValues];

    v287 = [v825 launchCountsForEachCategoryForBundleId:v105];
    v767 = [v287 allValues];

    [v863 setDistributionBasedScoreInputsForTimeAndDay:&v869 forBundleId:v105 withTimeOfDayHistogram:v861 withDayOfWeekHistogram:v859];
    [v863 setDistributionBasedScoreInputsForItem:&v869 withGeoHashResolution:0 withGeoHashLaunchCounts:v285];
    [v863 setDistributionBasedScoreInputsForItem:&v869 withGeoHashResolution:1 withGeoHashLaunchCounts:v765];
    [v863 setDistributionBasedScoreInputsForItem:&v869 withGeoHashResolution:2 withGeoHashLaunchCounts:v767];
    *(float *)&double v288 = ATXSetInput((uint64_t)&v869, 0x228uLL, (double)+[_ATXActionUtils timeBucketFromZeroToTwentyFour:v32 timeZone:0]);
    objc_msgSend(v861, "entropyForBundleId:", v105, v288);
    ATXSetInput((uint64_t)&v869, 0x1F8uLL, v289);
    LODWORD(v290) = 1.0;
    [v859 totalLaunchesForBundleIds:obj forDate:v32 distanceScale:v290];
    *(float *)&double v292 = ATXSetInput((uint64_t)&v869, 0x1FDuLL, v291);
    id v886 = v105;
    v293 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v886, 1, v292);
    [v859 totalLaunchesForBundleIds:v293];
    ATXSetInput((uint64_t)&v869, 0x1FEuLL, v294);

    [v833 totalLaunchesForCategory:v826];
    *(float *)&double v296 = ATXSetInput((uint64_t)&v869, 0x200uLL, v295);
    objc_msgSend(v831, "totalLaunchesForBundleId:category:", v105, v840, v296);
    *(float *)&double v298 = ATXSetInput((uint64_t)&v869, 0x1FBuLL, v297);
    objc_msgSend(v831, "totalLaunchesForBundleId:", v105, v298);
    *(float *)&double v300 = ATXSetInput((uint64_t)&v869, 0x205uLL, v299);
    objc_msgSend(v831, "totalLaunchesForCategory:", v840, v300);
    *(float *)&double v302 = ATXSetInput((uint64_t)&v869, 0x204uLL, v301);
    objc_msgSend(v831, "entropyForBundleId:", v105, v302);
    *(float *)&double v304 = ATXSetInput((uint64_t)&v869, 0x1F9uLL, v303);
    objc_msgSend(v830, "totalLaunchesForBundleId:category:", v105, v842, v304);
    *(float *)&double v306 = ATXSetInput((uint64_t)&v869, 0x1FCuLL, v305);
    objc_msgSend(v830, "totalLaunchesForBundleId:", v105, v306);
    *(float *)&double v308 = ATXSetInput((uint64_t)&v869, 0x203uLL, v307);
    objc_msgSend(v830, "totalLaunchesForCategory:", v842, v308);
    *(float *)&double v310 = ATXSetInput((uint64_t)&v869, 0x202uLL, v309);
    objc_msgSend(v830, "entropyForBundleId:", v105, v310);
    *(float *)&double v312 = ATXSetInput((uint64_t)&v869, 0x1FAuLL, v311);
    objc_msgSend(v825, "totalLaunchesForBundleId:category:", v105, v756, v312);
    *(float *)&double v314 = ATXSetInput((uint64_t)&v869, 0x28CuLL, v313);
    objc_msgSend(v825, "totalLaunchesForBundleId:", v105, v314);
    *(float *)&double v316 = ATXSetInput((uint64_t)&v869, 0x28EuLL, v315);
    objc_msgSend(v825, "totalLaunchesForCategory:", v756, v316);
    *(float *)&double v318 = ATXSetInput((uint64_t)&v869, 0x28DuLL, v317);
    objc_msgSend(v825, "entropyForBundleId:", v105, v318);
    *(float *)&double v320 = ATXSetInput((uint64_t)&v869, 0x299uLL, v319);
    objc_msgSend(v793, "totalLaunchesForBundleId:category:", v105, v836, v320);
    *(float *)&double v322 = ATXSetInput((uint64_t)&v869, 0x2A5uLL, v321);
    objc_msgSend(v793, "totalLaunchesForCategory:", v836, v322);
    *(float *)&double v324 = ATXSetInput((uint64_t)&v869, 0x2A6uLL, v323);
    objc_msgSend(v793, "totalLaunchesForBundleId:", v105, v324);
    *(float *)&double v326 = ATXSetInput((uint64_t)&v869, 0x2A7uLL, v325);
    objc_msgSend(v792, "totalLaunchesForBundleId:category:", v105, v836, v326);
    *(float *)&double v328 = ATXSetInput((uint64_t)&v869, 0x2A8uLL, v327);
    objc_msgSend(v792, "totalLaunchesForCategory:", v836, v328);
    *(float *)&double v330 = ATXSetInput((uint64_t)&v869, 0x2A9uLL, v329);
    objc_msgSend(v792, "totalLaunchesForBundleId:", v105, v330);
    *(float *)&double v332 = ATXSetInput((uint64_t)&v869, 0x2AAuLL, v331);
    objc_msgSend(v791, "totalLaunchesForBundleId:category:", v105, v838, v332);
    *(float *)&double v334 = ATXSetInput((uint64_t)&v869, 0x2ABuLL, v333);
    objc_msgSend(v791, "totalLaunchesForCategory:", v838, v334);
    *(float *)&double v336 = ATXSetInput((uint64_t)&v869, 0x2ACuLL, v335);
    objc_msgSend(v791, "totalLaunchesForBundleId:", v105, v336);
    *(float *)&double v338 = ATXSetInput((uint64_t)&v869, 0x2ADuLL, v337);
    objc_msgSend(v790, "totalLaunchesForBundleId:category:", v105, v838, v338);
    *(float *)&double v340 = ATXSetInput((uint64_t)&v869, 0x2AEuLL, v339);
    objc_msgSend(v790, "totalLaunchesForCategory:", v838, v340);
    *(float *)&double v342 = ATXSetInput((uint64_t)&v869, 0x2AFuLL, v341);
    objc_msgSend(v790, "totalLaunchesForBundleId:", v105, v342);
    *(float *)&double v344 = ATXSetInput((uint64_t)&v869, 0x2B0uLL, v343);
    objc_msgSend(v789, "totalLaunchesForBundleId:category:", v105, v842, v344);
    *(float *)&double v346 = ATXSetInput((uint64_t)&v869, 0x2B1uLL, v345);
    objc_msgSend(v789, "totalLaunchesForCategory:", v842, v346);
    *(float *)&double v348 = ATXSetInput((uint64_t)&v869, 0x2B2uLL, v347);
    objc_msgSend(v789, "totalLaunchesForBundleId:", v105, v348);
    *(float *)&double v350 = ATXSetInput((uint64_t)&v869, 0x2B3uLL, v349);
    objc_msgSend(v788, "totalLaunchesForBundleId:category:", v105, v842, v350);
    *(float *)&double v352 = ATXSetInput((uint64_t)&v869, 0x2B4uLL, v351);
    objc_msgSend(v788, "totalLaunchesForCategory:", v842, v352);
    *(float *)&double v354 = ATXSetInput((uint64_t)&v869, 0x2B5uLL, v353);
    objc_msgSend(v788, "totalLaunchesForBundleId:", v105, v354);
    *(float *)&double v356 = ATXSetInput((uint64_t)&v869, 0x2B6uLL, v355);
    objc_msgSend(v787, "totalLaunchesForBundleId:category:", v105, v840, v356);
    *(float *)&double v358 = ATXSetInput((uint64_t)&v869, 0x2B7uLL, v357);
    objc_msgSend(v787, "totalLaunchesForCategory:", v840, v358);
    *(float *)&double v360 = ATXSetInput((uint64_t)&v869, 0x2B8uLL, v359);
    objc_msgSend(v787, "totalLaunchesForBundleId:", v105, v360);
    *(float *)&double v362 = ATXSetInput((uint64_t)&v869, 0x2B9uLL, v361);
    objc_msgSend(v786, "totalLaunchesForBundleId:category:", v105, v840, v362);
    *(float *)&double v364 = ATXSetInput((uint64_t)&v869, 0x2BAuLL, v363);
    objc_msgSend(v786, "totalLaunchesForCategory:", v840, v364);
    *(float *)&double v366 = ATXSetInput((uint64_t)&v869, 0x2BBuLL, v365);
    objc_msgSend(v786, "totalLaunchesForBundleId:", v105, v366);
    *(float *)&double v368 = ATXSetInput((uint64_t)&v869, 0x2BCuLL, v367);
    objc_msgSend(v821, "totalLaunchesForBundleId:category:", v105, v844, v368);
    *(float *)&double v370 = ATXSetInput((uint64_t)&v869, 0x2BDuLL, v369);
    objc_msgSend(v821, "totalLaunchesForCategory:", v844, v370);
    *(float *)&double v372 = ATXSetInput((uint64_t)&v869, 0x2BEuLL, v371);
    objc_msgSend(v821, "totalLaunchesForBundleId:", v105, v372);
    *(float *)&double v374 = ATXSetInput((uint64_t)&v869, 0x2BFuLL, v373);
    objc_msgSend(v820, "totalLaunchesForBundleId:category:", v105, v844, v374);
    *(float *)&double v376 = ATXSetInput((uint64_t)&v869, 0x2C0uLL, v375);
    objc_msgSend(v820, "totalLaunchesForCategory:", v844, v376);
    *(float *)&double v378 = ATXSetInput((uint64_t)&v869, 0x2C1uLL, v377);
    objc_msgSend(v820, "totalLaunchesForBundleId:", v105, v378);
    *(float *)&double v380 = ATXSetInput((uint64_t)&v869, 0x2C2uLL, v379);
    objc_msgSend(v819, "totalLaunchesForBundleId:category:", v105, v844, v380);
    *(float *)&double v382 = ATXSetInput((uint64_t)&v869, 0x2C3uLL, v381);
    objc_msgSend(v819, "totalLaunchesForCategory:", v844, v382);
    *(float *)&double v384 = ATXSetInput((uint64_t)&v869, 0x2C4uLL, v383);
    objc_msgSend(v819, "totalLaunchesForBundleId:", v105, v384);
    *(float *)&double v386 = ATXSetInput((uint64_t)&v869, 0x2C5uLL, v385);
    objc_msgSend(v818, "totalLaunchesForBundleId:category:", v105, v837, v386);
    *(float *)&double v388 = ATXSetInput((uint64_t)&v869, 0x2C6uLL, v387);
    objc_msgSend(v818, "totalLaunchesForCategory:", v837, v388);
    *(float *)&double v390 = ATXSetInput((uint64_t)&v869, 0x2C7uLL, v389);
    objc_msgSend(v818, "totalLaunchesForBundleId:", v105, v390);
    *(float *)&double v392 = ATXSetInput((uint64_t)&v869, 0x2C8uLL, v391);
    objc_msgSend(v817, "totalLaunchesForBundleId:category:", v105, v837, v392);
    *(float *)&double v394 = ATXSetInput((uint64_t)&v869, 0x2C9uLL, v393);
    objc_msgSend(v817, "totalLaunchesForCategory:", v837, v394);
    *(float *)&double v396 = ATXSetInput((uint64_t)&v869, 0x2CAuLL, v395);
    objc_msgSend(v817, "totalLaunchesForBundleId:", v105, v396);
    *(float *)&double v398 = ATXSetInput((uint64_t)&v869, 0x2CBuLL, v397);
    objc_msgSend(v785, "totalLaunchesForBundleId:category:", v105, v836, v398);
    *(float *)&double v400 = ATXSetInput((uint64_t)&v869, 0x2D0uLL, v399);
    objc_msgSend(v785, "totalLaunchesForCategory:", v836, v400);
    *(float *)&double v402 = ATXSetInput((uint64_t)&v869, 0x2D1uLL, v401);
    objc_msgSend(v785, "totalLaunchesForBundleId:", v105, v402);
    *(float *)&double v404 = ATXSetInput((uint64_t)&v869, 0x2D2uLL, v403);
    objc_msgSend(v784, "totalLaunchesForBundleId:category:", v105, v836, v404);
    *(float *)&double v406 = ATXSetInput((uint64_t)&v869, 0x2D3uLL, v405);
    objc_msgSend(v784, "totalLaunchesForCategory:", v836, v406);
    *(float *)&double v408 = ATXSetInput((uint64_t)&v869, 0x2D4uLL, v407);
    objc_msgSend(v784, "totalLaunchesForBundleId:", v105, v408);
    *(float *)&double v410 = ATXSetInput((uint64_t)&v869, 0x2D5uLL, v409);
    objc_msgSend(v783, "totalLaunchesForBundleId:category:", v105, v838, v410);
    *(float *)&double v412 = ATXSetInput((uint64_t)&v869, 0x2D6uLL, v411);
    objc_msgSend(v783, "totalLaunchesForCategory:", v838, v412);
    *(float *)&double v414 = ATXSetInput((uint64_t)&v869, 0x2D7uLL, v413);
    objc_msgSend(v783, "totalLaunchesForBundleId:", v105, v414);
    *(float *)&double v416 = ATXSetInput((uint64_t)&v869, 0x2D8uLL, v415);
    objc_msgSend(v782, "totalLaunchesForBundleId:category:", v105, v838, v416);
    *(float *)&double v418 = ATXSetInput((uint64_t)&v869, 0x2D9uLL, v417);
    objc_msgSend(v782, "totalLaunchesForCategory:", v838, v418);
    *(float *)&double v420 = ATXSetInput((uint64_t)&v869, 0x2DAuLL, v419);
    objc_msgSend(v782, "totalLaunchesForBundleId:", v105, v420);
    *(float *)&double v422 = ATXSetInput((uint64_t)&v869, 0x2DBuLL, v421);
    objc_msgSend(v781, "totalLaunchesForBundleId:category:", v105, v842, v422);
    *(float *)&double v424 = ATXSetInput((uint64_t)&v869, 0x2DCuLL, v423);
    objc_msgSend(v781, "totalLaunchesForCategory:", v842, v424);
    *(float *)&double v426 = ATXSetInput((uint64_t)&v869, 0x2DDuLL, v425);
    objc_msgSend(v781, "totalLaunchesForBundleId:", v105, v426);
    *(float *)&double v428 = ATXSetInput((uint64_t)&v869, 0x2DEuLL, v427);
    objc_msgSend(v780, "totalLaunchesForBundleId:category:", v105, v842, v428);
    *(float *)&double v430 = ATXSetInput((uint64_t)&v869, 0x2DFuLL, v429);
    objc_msgSend(v780, "totalLaunchesForCategory:", v842, v430);
    *(float *)&double v432 = ATXSetInput((uint64_t)&v869, 0x2E0uLL, v431);
    objc_msgSend(v780, "totalLaunchesForBundleId:", v105, v432);
    *(float *)&double v434 = ATXSetInput((uint64_t)&v869, 0x2E1uLL, v433);
    objc_msgSend(v779, "totalLaunchesForBundleId:category:", v105, v840, v434);
    *(float *)&double v436 = ATXSetInput((uint64_t)&v869, 0x2E2uLL, v435);
    objc_msgSend(v779, "totalLaunchesForCategory:", v840, v436);
    *(float *)&double v438 = ATXSetInput((uint64_t)&v869, 0x2E3uLL, v437);
    objc_msgSend(v779, "totalLaunchesForBundleId:", v105, v438);
    *(float *)&double v440 = ATXSetInput((uint64_t)&v869, 0x2E4uLL, v439);
    objc_msgSend(v778, "totalLaunchesForBundleId:category:", v105, v840, v440);
    *(float *)&double v442 = ATXSetInput((uint64_t)&v869, 0x2E5uLL, v441);
    objc_msgSend(v778, "totalLaunchesForCategory:", v840, v442);
    *(float *)&double v444 = ATXSetInput((uint64_t)&v869, 0x2E6uLL, v443);
    objc_msgSend(v778, "totalLaunchesForBundleId:", v105, v444);
    *(float *)&double v446 = ATXSetInput((uint64_t)&v869, 0x2E7uLL, v445);
    objc_msgSend(v816, "totalLaunchesForBundleId:category:", v105, v844, v446);
    *(float *)&double v448 = ATXSetInput((uint64_t)&v869, 0x2E8uLL, v447);
    objc_msgSend(v816, "totalLaunchesForCategory:", v844, v448);
    *(float *)&double v450 = ATXSetInput((uint64_t)&v869, 0x2E9uLL, v449);
    objc_msgSend(v816, "totalLaunchesForBundleId:", v105, v450);
    *(float *)&double v452 = ATXSetInput((uint64_t)&v869, 0x2EAuLL, v451);
    objc_msgSend(v815, "totalLaunchesForBundleId:category:", v105, v844, v452);
    *(float *)&double v454 = ATXSetInput((uint64_t)&v869, 0x2EBuLL, v453);
    objc_msgSend(v815, "totalLaunchesForCategory:", v844, v454);
    *(float *)&double v456 = ATXSetInput((uint64_t)&v869, 0x2ECuLL, v455);
    objc_msgSend(v815, "totalLaunchesForBundleId:", v105, v456);
    *(float *)&double v458 = ATXSetInput((uint64_t)&v869, 0x2EDuLL, v457);
    objc_msgSend(v814, "totalLaunchesForBundleId:category:", v105, v844, v458);
    *(float *)&double v460 = ATXSetInput((uint64_t)&v869, 0x2EEuLL, v459);
    objc_msgSend(v814, "totalLaunchesForCategory:", v844, v460);
    *(float *)&double v462 = ATXSetInput((uint64_t)&v869, 0x2EFuLL, v461);
    objc_msgSend(v814, "totalLaunchesForBundleId:", v105, v462);
    *(float *)&double v464 = ATXSetInput((uint64_t)&v869, 0x2F0uLL, v463);
    objc_msgSend(v813, "totalLaunchesForBundleId:category:", v105, v837, v464);
    *(float *)&double v466 = ATXSetInput((uint64_t)&v869, 0x2F1uLL, v465);
    objc_msgSend(v813, "totalLaunchesForCategory:", v837, v466);
    *(float *)&double v468 = ATXSetInput((uint64_t)&v869, 0x2F2uLL, v467);
    objc_msgSend(v813, "totalLaunchesForBundleId:", v105, v468);
    *(float *)&double v470 = ATXSetInput((uint64_t)&v869, 0x2F3uLL, v469);
    objc_msgSend(v812, "totalLaunchesForBundleId:category:", v105, v837, v470);
    *(float *)&double v472 = ATXSetInput((uint64_t)&v869, 0x2F4uLL, v471);
    objc_msgSend(v812, "totalLaunchesForCategory:", v837, v472);
    *(float *)&double v474 = ATXSetInput((uint64_t)&v869, 0x2F5uLL, v473);
    objc_msgSend(v812, "totalLaunchesForBundleId:", v105, v474);
    *(float *)&double v476 = ATXSetInput((uint64_t)&v869, 0x2F6uLL, v475);
    objc_msgSend(v821, "totalLaunches", v476);
    *(float *)&double v478 = ATXSetInput((uint64_t)&v869, 0x2F7uLL, v477);
    objc_msgSend(v818, "totalLaunches", v478);
    *(float *)&double v480 = ATXSetInput((uint64_t)&v869, 0x2F8uLL, v479);
    objc_msgSend(v820, "totalLaunches", v480);
    *(float *)&double v482 = ATXSetInput((uint64_t)&v869, 0x2F9uLL, v481);
    objc_msgSend(v817, "totalLaunches", v482);
    *(float *)&double v484 = ATXSetInput((uint64_t)&v869, 0x2FAuLL, v483);
    objc_msgSend(v819, "totalLaunches", v484);
    *(float *)&double v486 = ATXSetInput((uint64_t)&v869, 0x2FBuLL, v485);
    objc_msgSend(v816, "totalLaunches", v486);
    *(float *)&double v488 = ATXSetInput((uint64_t)&v869, 0x2FCuLL, v487);
    objc_msgSend(v813, "totalLaunches", v488);
    *(float *)&double v490 = ATXSetInput((uint64_t)&v869, 0x2FDuLL, v489);
    objc_msgSend(v815, "totalLaunches", v490);
    *(float *)&double v492 = ATXSetInput((uint64_t)&v869, 0x2FEuLL, v491);
    objc_msgSend(v812, "totalLaunches", v492);
    *(float *)&double v494 = ATXSetInput((uint64_t)&v869, 0x2FFuLL, v493);
    objc_msgSend(v814, "totalLaunches", v494);
    *(float *)&double v496 = ATXSetInput((uint64_t)&v869, 0x300uLL, v495);
    objc_msgSend(v831, "totalLaunches", v496);
    *(float *)&double v498 = ATXSetInput((uint64_t)&v869, 0x207uLL, v497);
    objc_msgSend(v830, "totalLaunches", v498);
    ATXSetInput((uint64_t)&v869, 0x206uLL, v499);
    *(float *)&double v500 = ATXSetInput((uint64_t)&v869, 0x208uLL, v733);
    if (v856)
    {
      objc_msgSend(v856, "likelihoodForLaunch:", v105, v500);
      ATXSetInput((uint64_t)&v869, 0x25uLL, v501);
    }
    ATXSetInput((uint64_t)&v869, 0x28uLL, v747);
    ATXSetInput((uint64_t)&v869, 0x29uLL, v746);
    *(float *)&double v502 = ATXSetInput((uint64_t)&v869, 0x2AuLL, v745);
    objc_msgSend(v859, "entropyForBundleId:", v105, v502);
    ATXSetInput((uint64_t)&v869, 0x2BuLL, v503);
    ATXSetInput((uint64_t)&v869, 0x2CuLL, v48);
    ATXSetInput((uint64_t)&v869, 0x2DuLL, v744);
    ATXSetInput((uint64_t)&v869, 0x2EuLL, v49);
    ATXSetInput((uint64_t)&v869, 0x2FuLL, v743);
    *(float *)&double v504 = ATXSetInput((uint64_t)&v869, 0x30uLL, v742);
    objc_msgSend(v832, "entropyForBundleId:", v105, v504);
    ATXSetInput((uint64_t)&v869, 0x31uLL, v505);
    ATXSetInput((uint64_t)&v869, 0x32uLL, v50);
    ATXSetInput((uint64_t)&v869, 0x33uLL, (double)(int)v829);
    float v506 = -1.0;
    if (v741) {
      [(id)objc_opt_class() _computeL2DistanceFromBundleId:v105 to:__p app2vecMapping:v732];
    }
    *(float *)&double v507 = ATXSetInput((uint64_t)&v869, 0x34uLL, v506);
    *(float *)&double v508 = ATXSetInput((uint64_t)&v869, 0x60uLL, (double)objc_msgSend(v863[8], "appSupportsMedia:", v105, v507));
    v509 = objc_msgSend(v754, "objectForKeyedSubscript:", v105, v508);
    BOOL v510 = v509 == 0;

    if (!v510)
    {
      v511 = objc_opt_class();
      v512 = [v754 objectForKeyedSubscript:v105];
      [v512 timeIntervalSinceNow];
      [v511 time:-v513 toAccuracyInSeconds:0.1];
      ATXSetInput((uint64_t)&v869, 0x4DuLL, v514);
    }
    v515 = [v863[14] predictionsForBundleId:v105];
    if (v515)
    {
      v516 = v515;
      if ([v515 predictionSource] == 2)
      {
        [v516 confidence];
        *(float *)&double v518 = ATXSetInput((uint64_t)&v869, 0x46uLL, v517);
        *(float *)&double v519 = ATXSetInput((uint64_t)&v869, 0x47uLL, (double)objc_msgSend(v516, "pmmReason", v518));
        *(float *)&double v520 = ATXSetInput((uint64_t)&v869, 0x48uLL, (double)objc_msgSend(v516, "anchorType", v519));
        unint64_t v521 = objc_msgSend(v516, "predictionIndex", v520);
LABEL_101:
        *(float *)&double v523 = ATXSetInput((uint64_t)&v869, 0x4BuLL, (double)v521);
        *(float *)&double v524 = ATXSetInput((uint64_t)&v869, 0x4CuLL, (double)(unint64_t)objc_msgSend(v863[14], "mmPredictionCount", v523));
        objc_msgSend(v863[9], "getCurrentDoseForApp:", v105, v524);
        double v526 = v525;
        *(float *)&double v527 = ATXSetInput((uint64_t)&v869, 0x38uLL, v525);
        v528 = objc_msgSend(v863[9], "getDoseForApp:", v105, v527);
        if (v528)
        {
          v529 = v528;
          [v528 movingAverage];
          *(float *)&double v531 = ATXSetInput((uint64_t)&v869, 0x37uLL, v530);
          objc_msgSend(v529, "movingError", v531);
          *(float *)&double v533 = ATXSetInput((uint64_t)&v869, 0x3AuLL, v532);
          objc_msgSend(v529, "movingAverage", v533);
          ATXSetInput((uint64_t)&v869, 0x39uLL, v534 - v526);
        }
        else
        {
          v529 = 0;
          v535 = __atxlog_handle_app_prediction();
          if (os_log_type_enabled(v535, OS_LOG_TYPE_DEBUG))
          {
            int v890 = 138412290;
            id v891 = v105;
            _os_log_debug_impl(&dword_1D0FA3000, v535, OS_LOG_TYPE_DEBUG, "[DailyDose]:can not find historical dose for: %@", (uint8_t *)&v890, 0xCu);
          }
        }
        if (v103 >= (v883 - (unsigned char *)v882) >> 3
          || (ATXSetInput((uint64_t)&v869, 0xBuLL, *((double *)v882 + v103)), v103 >= (v881 - (unsigned char *)v880) >> 3)
          || (ATXSetInput((uint64_t)&v869, 0xCuLL, *((double *)v880 + v103)), v103 >= (v879 - (unsigned char *)v878) >> 3))
        {
          std::vector<ATXPredictionItem>::__throw_out_of_range[abi:ne180100]();
        }
        *(float *)&double v536 = ATXSetInput((uint64_t)&v869, 0xDuLL, *((double *)v878 + v103));
        v537 = objc_msgSend(v863[18], "objectForKeyedSubscript:", @"appCategories", v536);
        v763 = [v537 objectForKeyedSubscript:v105];

        *(float *)&double v538 = ATXSetInput((uint64_t)&v869, 0x84uLL, (double)(int)[v763 intValue]);
        objc_msgSend(v811, "totalLaunchesForBundleId:category:", v105, v844, v538);
        *(float *)&double v540 = ATXSetInput((uint64_t)&v869, 0x189uLL, v539);
        objc_msgSend(v811, "totalLaunchesForCategory:", v844, v540);
        *(float *)&double v542 = ATXSetInput((uint64_t)&v869, 0x18AuLL, v541);
        objc_msgSend(v811, "totalLaunchesForBundleId:", v105, v542);
        *(float *)&double v544 = ATXSetInput((uint64_t)&v869, 0x18BuLL, v543);
        objc_msgSend(v811, "totalLaunches", v544);
        *(float *)&double v546 = ATXSetInput((uint64_t)&v869, 0x18CuLL, v545);
        objc_msgSend(v810, "totalLaunchesForBundleId:category:", v105, v844, v546);
        *(float *)&double v548 = ATXSetInput((uint64_t)&v869, 0x18DuLL, v547);
        objc_msgSend(v810, "totalLaunchesForCategory:", v844, v548);
        *(float *)&double v550 = ATXSetInput((uint64_t)&v869, 0x18EuLL, v549);
        objc_msgSend(v810, "totalLaunchesForBundleId:", v105, v550);
        *(float *)&double v552 = ATXSetInput((uint64_t)&v869, 0x18FuLL, v551);
        objc_msgSend(v810, "totalLaunches", v552);
        *(float *)&double v554 = ATXSetInput((uint64_t)&v869, 0x190uLL, v553);
        objc_msgSend(v809, "totalLaunchesForBundleId:category:", v105, v844, v554);
        *(float *)&double v556 = ATXSetInput((uint64_t)&v869, 0x191uLL, v555);
        objc_msgSend(v809, "totalLaunchesForCategory:", v844, v556);
        *(float *)&double v558 = ATXSetInput((uint64_t)&v869, 0x192uLL, v557);
        objc_msgSend(v809, "totalLaunchesForBundleId:", v105, v558);
        *(float *)&double v560 = ATXSetInput((uint64_t)&v869, 0x193uLL, v559);
        objc_msgSend(v809, "totalLaunches", v560);
        *(float *)&double v562 = ATXSetInput((uint64_t)&v869, 0x194uLL, v561);
        objc_msgSend(v808, "totalLaunchesForBundleId:category:", v105, v844, v562);
        *(float *)&double v564 = ATXSetInput((uint64_t)&v869, 0x195uLL, v563);
        objc_msgSend(v808, "totalLaunchesForCategory:", v844, v564);
        *(float *)&double v566 = ATXSetInput((uint64_t)&v869, 0x196uLL, v565);
        objc_msgSend(v808, "totalLaunchesForBundleId:", v105, v566);
        *(float *)&double v568 = ATXSetInput((uint64_t)&v869, 0x197uLL, v567);
        objc_msgSend(v808, "totalLaunches", v568);
        *(float *)&double v570 = ATXSetInput((uint64_t)&v869, 0x198uLL, v569);
        objc_msgSend(v807, "totalLaunchesForBundleId:category:", v105, v837, v570);
        *(float *)&double v572 = ATXSetInput((uint64_t)&v869, 0x199uLL, v571);
        objc_msgSend(v807, "totalLaunchesForCategory:", v837, v572);
        *(float *)&double v574 = ATXSetInput((uint64_t)&v869, 0x19AuLL, v573);
        objc_msgSend(v807, "totalLaunchesForBundleId:", v105, v574);
        *(float *)&double v576 = ATXSetInput((uint64_t)&v869, 0x19BuLL, v575);
        objc_msgSend(v807, "totalLaunches", v576);
        *(float *)&double v578 = ATXSetInput((uint64_t)&v869, 0x19CuLL, v577);
        objc_msgSend(v806, "totalLaunchesForBundleId:category:", v105, v837, v578);
        *(float *)&double v580 = ATXSetInput((uint64_t)&v869, 0x19DuLL, v579);
        objc_msgSend(v806, "totalLaunchesForCategory:", v837, v580);
        *(float *)&double v582 = ATXSetInput((uint64_t)&v869, 0x19EuLL, v581);
        objc_msgSend(v806, "totalLaunchesForBundleId:", v105, v582);
        *(float *)&double v584 = ATXSetInput((uint64_t)&v869, 0x19FuLL, v583);
        objc_msgSend(v806, "totalLaunches", v584);
        *(float *)&double v586 = ATXSetInput((uint64_t)&v869, 0x1A0uLL, v585);
        objc_msgSend(v805, "totalLaunchesForBundleId:category:", v105, v837, v586);
        *(float *)&double v588 = ATXSetInput((uint64_t)&v869, 0x1A1uLL, v587);
        objc_msgSend(v805, "totalLaunchesForCategory:", v837, v588);
        *(float *)&double v590 = ATXSetInput((uint64_t)&v869, 0x1A2uLL, v589);
        objc_msgSend(v805, "totalLaunchesForBundleId:", v105, v590);
        *(float *)&double v592 = ATXSetInput((uint64_t)&v869, 0x1A3uLL, v591);
        objc_msgSend(v805, "totalLaunches", v592);
        *(float *)&double v594 = ATXSetInput((uint64_t)&v869, 0x1A4uLL, v593);
        objc_msgSend(v777, "totalLaunchesForBundleId:category:", v105, v838, v594);
        *(float *)&double v596 = ATXSetInput((uint64_t)&v869, 0x209uLL, v595);
        objc_msgSend(v777, "totalLaunchesForCategory:", v838, v596);
        *(float *)&double v598 = ATXSetInput((uint64_t)&v869, 0x20AuLL, v597);
        objc_msgSend(v777, "totalLaunchesForBundleId:", v105, v598);
        *(float *)&double v600 = ATXSetInput((uint64_t)&v869, 0x20BuLL, v599);
        objc_msgSend(v776, "totalLaunchesForBundleId:category:", v105, v838, v600);
        *(float *)&double v602 = ATXSetInput((uint64_t)&v869, 0x20CuLL, v601);
        objc_msgSend(v776, "totalLaunchesForCategory:", v838, v602);
        *(float *)&double v604 = ATXSetInput((uint64_t)&v869, 0x20DuLL, v603);
        objc_msgSend(v776, "totalLaunchesForBundleId:", v105, v604);
        *(float *)&double v606 = ATXSetInput((uint64_t)&v869, 0x20EuLL, v605);
        objc_msgSend(v775, "totalLaunchesForBundleId:category:", v105, v838, v606);
        *(float *)&double v608 = ATXSetInput((uint64_t)&v869, 0x20FuLL, v607);
        objc_msgSend(v775, "totalLaunchesForCategory:", v838, v608);
        *(float *)&double v610 = ATXSetInput((uint64_t)&v869, 0x210uLL, v609);
        objc_msgSend(v775, "totalLaunchesForBundleId:", v105, v610);
        *(float *)&double v612 = ATXSetInput((uint64_t)&v869, 0x211uLL, v611);
        objc_msgSend(v774, "totalLaunchesForBundleId:category:", v105, v836, v612);
        *(float *)&double v614 = ATXSetInput((uint64_t)&v869, 0x212uLL, v613);
        objc_msgSend(v774, "totalLaunchesForCategory:", v836, v614);
        *(float *)&double v616 = ATXSetInput((uint64_t)&v869, 0x213uLL, v615);
        objc_msgSend(v774, "totalLaunchesForBundleId:", v105, v616);
        *(float *)&double v618 = ATXSetInput((uint64_t)&v869, 0x214uLL, v617);
        objc_msgSend(v773, "totalLaunchesForBundleId:category:", v105, v836, v618);
        *(float *)&double v620 = ATXSetInput((uint64_t)&v869, 0x215uLL, v619);
        objc_msgSend(v773, "totalLaunchesForCategory:", v836, v620);
        *(float *)&double v622 = ATXSetInput((uint64_t)&v869, 0x216uLL, v621);
        objc_msgSend(v773, "totalLaunchesForBundleId:", v105, v622);
        *(float *)&double v624 = ATXSetInput((uint64_t)&v869, 0x217uLL, v623);
        objc_msgSend(v804, "totalLaunchesForBundleId:category:", v105, v842, v624);
        *(float *)&double v626 = ATXSetInput((uint64_t)&v869, 0x218uLL, v625);
        objc_msgSend(v804, "totalLaunchesForCategory:", v842, v626);
        *(float *)&double v628 = ATXSetInput((uint64_t)&v869, 0x219uLL, v627);
        objc_msgSend(v804, "totalLaunchesForBundleId:", v105, v628);
        *(float *)&double v630 = ATXSetInput((uint64_t)&v869, 0x21AuLL, v629);
        objc_msgSend(v803, "totalLaunchesForBundleId:category:", v105, v842, v630);
        *(float *)&double v632 = ATXSetInput((uint64_t)&v869, 0x21BuLL, v631);
        objc_msgSend(v803, "totalLaunchesForCategory:", v842, v632);
        *(float *)&double v634 = ATXSetInput((uint64_t)&v869, 0x21CuLL, v633);
        objc_msgSend(v803, "totalLaunchesForBundleId:", v105, v634);
        *(float *)&double v636 = ATXSetInput((uint64_t)&v869, 0x21DuLL, v635);
        objc_msgSend(v802, "totalLaunchesForBundleId:category:", v105, v840, v636);
        *(float *)&double v638 = ATXSetInput((uint64_t)&v869, 0x21EuLL, v637);
        objc_msgSend(v802, "totalLaunchesForCategory:", v840, v638);
        *(float *)&double v640 = ATXSetInput((uint64_t)&v869, 0x21FuLL, v639);
        objc_msgSend(v802, "totalLaunchesForBundleId:", v105, v640);
        *(float *)&double v642 = ATXSetInput((uint64_t)&v869, 0x220uLL, v641);
        objc_msgSend(v801, "totalLaunchesForBundleId:category:", v105, v840, v642);
        *(float *)&double v644 = ATXSetInput((uint64_t)&v869, 0x221uLL, v643);
        objc_msgSend(v801, "totalLaunchesForCategory:", v840, v644);
        *(float *)&double v646 = ATXSetInput((uint64_t)&v869, 0x222uLL, v645);
        objc_msgSend(v801, "totalLaunchesForBundleId:", v105, v646);
        *(float *)&double v648 = ATXSetInput((uint64_t)&v869, 0x223uLL, v647);
        objc_msgSend(v804, "totalLaunches", v648);
        *(float *)&double v650 = ATXSetInput((uint64_t)&v869, 0x224uLL, v649);
        objc_msgSend(v802, "totalLaunches", v650);
        *(float *)&double v652 = ATXSetInput((uint64_t)&v869, 0x225uLL, v651);
        objc_msgSend(v803, "totalLaunches", v652);
        *(float *)&double v654 = ATXSetInput((uint64_t)&v869, 0x226uLL, v653);
        objc_msgSend(v801, "totalLaunches", v654);
        *(float *)&double v656 = ATXSetInput((uint64_t)&v869, 0x227uLL, v655);
        objc_msgSend(v772, "launchPopularityWithBundleId:category:", v105, v771, v656);
        *(float *)&double v658 = ATXSetInput((uint64_t)&v869, 0x326uLL, v657);
        objc_msgSend(v772, "relativeLaunchPopularityWithBundleId:category:", v105, v771, v658);
        *(float *)&double v660 = ATXSetInput((uint64_t)&v869, 0x327uLL, v659);
        objc_msgSend(v772, "totalLaunchesForBundleId:category:", v105, v771, v660);
        *(float *)&double v662 = ATXSetInput((uint64_t)&v869, 0x329uLL, v661);
        objc_msgSend(v863, "setModeAffinityScores:appModeEntityScores:", &v869, v748, v662);
        id v663 = v869;
        id v865 = v663;
        memcpy(v866, v870, sizeof(v866));
        if (v770) {
          [v770 addItem:&v865 forBundleId:v105];
        }
        else {

        }
        uint64_t v664 = *v846;
        if (0xDAB7EC1DD3431B57 * ((uint64_t)(v846[1] - *v846) >> 5) <= v103) {
          std::vector<ATXPredictionItem>::__throw_out_of_range[abi:ne180100]();
        }
        objc_storeStrong((id *)(v664 + 3296 * v103), v869);
        memcpy((void *)(v664 + 3296 * v103 + 8), v870, 0xCD2uLL);

        goto LABEL_114;
      }
      v522 = __atxlog_handle_pmm();
      if (os_log_type_enabled(v522, OS_LOG_TYPE_ERROR)) {
        -[ATXAppFeaturizer evaluateFeaturesForApps:clipBundleIdsToRank:consumerSubType:intent:scoreLogger:context:featureCache:](&v867, v868, v522);
      }
    }
    else
    {
      v516 = 0;
    }
    unint64_t v521 = 0x7FFFLL;
    goto LABEL_101;
  }
LABEL_115:

  if (__p)
  {
    v876 = __p;
    operator delete(__p);
  }

  if (v878)
  {
    v879 = v878;
    operator delete(v878);
  }
  if (v880)
  {
    v881 = v880;
    operator delete(v880);
  }
  if (v882)
  {
    v883 = v882;
    operator delete(v882);
  }
  v665 = objc_opt_new();
  v841 = v665;
  v864 = objc_opt_new();
  v862 = objc_opt_new();
  v860 = objc_opt_new();
  v857 = objc_opt_new();
  v855 = objc_opt_new();
  v853 = objc_opt_new();
  v851 = objc_opt_new();
  v849 = objc_opt_new();
  v845 = objc_opt_new();
  v843 = objc_opt_new();
  v666 = objc_opt_new();
  v667 = objc_opt_new();
  v668 = objc_opt_new();
  v839 = objc_opt_new();
  if ((int)v829 >= 1)
  {
    uint64_t v669 = 0;
    uint64_t v670 = 0;
    do
    {
      v671 = [obj objectAtIndexedSubscript:v670];
      v672 = [v800 objectForKeyedSubscript:v671];
      [v665 addScore:v672 group:*(float *)(*v846 + v669 + 124)];
      [v864 addScore:v672 group:*(float *)(*v846 + v669 + 164)];
      [v862 addScore:v672 group:*(float *)(*v846 + v669 + 160)];
      [v860 addScore:v672 group:*(float *)(*v846 + v669 + 144)];
      [v857 addScore:v672 group:*(float *)(*v846 + v669 + 268)];
      [v855 addScore:v672 group:*(float *)(*v846 + v669 + 260)];
      [v853 addScore:v672 group:*(float *)(*v846 + v669 + 244)];
      [v851 addScore:v672 group:*(float *)(*v846 + v669 + 168)];
      [v849 addScore:v672 group:*(float *)(*v846 + v669 + 276)];
      v673 = [v799 objectForKeyedSubscript:v671];
      [v845 addScore:v673 group:*(float *)(*v846 + v669 + 124)];
      [v843 addScore:v673 group:*(float *)(*v846 + v669 + 164)];
      [v666 addScore:v673 group:*(float *)(*v846 + v669 + 160)];
      [v667 addScore:v673 group:*(float *)(*v846 + v669 + 268)];
      [v668 addScore:v673 group:*(float *)(*v846 + v669 + 168)];
      if (v673) {
        [v839 addObject:v673];
      }

      v665 = v841;
      ++v670;
      v669 += 3296;
    }
    while (3296 * v829 != v669);
  }
  uint64_t v674 = [v839 count];
  if ((int)v829 >= 1)
  {
    uint64_t v675 = 0;
    double v676 = (double)v674;
    do
    {
      v677 = [obj objectAtIndexedSubscript:v675];
      v678 = [v800 objectForKeyedSubscript:v677];
      uint64_t v679 = *v846;
      [v665 getScoreForGroup:v678];
      *(float *)&double v681 = ATXSetInput(v679 + 3296 * v675, 0x51uLL, v680);
      uint64_t v682 = *v846;
      objc_msgSend(v864, "getScoreForGroup:", v678, v681);
      *(float *)&double v684 = ATXSetInput(v682 + 3296 * v675, 0x52uLL, v683);
      uint64_t v685 = *v846;
      objc_msgSend(v862, "getScoreForGroup:", v678, v684);
      *(float *)&double v687 = ATXSetInput(v685 + 3296 * v675, 0x53uLL, v686);
      uint64_t v688 = *v846;
      objc_msgSend(v860, "getScoreForGroup:", v678, v687);
      *(float *)&double v690 = ATXSetInput(v688 + 3296 * v675, 0x54uLL, v689);
      uint64_t v691 = *v846;
      objc_msgSend(v857, "getScoreForGroup:", v678, v690);
      *(float *)&double v693 = ATXSetInput(v691 + 3296 * v675, 0x55uLL, v692);
      uint64_t v694 = *v846;
      objc_msgSend(v855, "getScoreForGroup:", v678, v693);
      *(float *)&double v696 = ATXSetInput(v694 + 3296 * v675, 0x56uLL, v695);
      uint64_t v697 = *v846;
      objc_msgSend(v853, "getScoreForGroup:", v678, v696);
      *(float *)&double v699 = ATXSetInput(v697 + 3296 * v675, 0x57uLL, v698);
      uint64_t v700 = *v846;
      objc_msgSend(v851, "getScoreForGroup:", v678, v699);
      *(float *)&double v702 = ATXSetInput(v700 + 3296 * v675, 0x58uLL, v701);
      uint64_t v703 = *v846;
      objc_msgSend(v849, "getScoreForGroup:", v678, v702);
      *(float *)&double v705 = ATXSetInput(v703 + 3296 * v675, 0x59uLL, v704);
      v706 = objc_msgSend(v799, "objectForKeyedSubscript:", v677, v705);
      uint64_t v707 = *v846;
      [v845 getScoreForGroup:v706];
      *(float *)&double v709 = ATXSetInput(v707 + 3296 * v675, 0x5AuLL, v708);
      uint64_t v710 = *v846;
      objc_msgSend(v843, "getScoreForGroup:", v706, v709);
      *(float *)&double v712 = ATXSetInput(v710 + 3296 * v675, 0x5BuLL, v711);
      uint64_t v713 = *v846;
      objc_msgSend(v666, "getScoreForGroup:", v706, v712);
      *(float *)&double v715 = ATXSetInput(v713 + 3296 * v675, 0x5CuLL, v714);
      uint64_t v716 = *v846;
      objc_msgSend(v667, "getScoreForGroup:", v706, v715);
      *(float *)&double v718 = ATXSetInput(v716 + 3296 * v675, 0x5DuLL, v717);
      uint64_t v719 = *v846;
      objc_msgSend(v668, "getScoreForGroup:", v706, v718);
      ATXSetInput(v719 + 3296 * v675, 0x5EuLL, v720);
      ATXSetInput(*v846 + 3296 * v675, 0x5FuLL, v676);

      ++v675;
    }
    while (v675 != v829);
  }

LABEL_132:
  v892[0] = &v884;
  std::vector<ATXPredictionItem>::__destroy_vector::operator()[abi:ne180100]((void ***)v892);

  return result;
}

- (void)setModeAffinityScores:(ATXPredictionItem *)a3 appModeEntityScores:(id)a4
{
  id v24 = [a4 objectForKeyedSubscript:a3->key];
  if (v24)
  {
    v6 = [ATXModeEntityScoringFeatures alloc];
    v7 = [v24 scoreMetadata];
    v8 = [v7 featureVector];
    id v9 = [(ATXModeEntityScoringFeatures *)v6 initFromJSON:v8];

    v10 = [v9 entitySpecificFeatures];
    v11 = [v10 appCategoryScore];
    [v11 doubleValue];
    double v13 = v12;

    *(float *)&double v14 = ATXSetInput((uint64_t)a3, 0x32AuLL, v13);
    objc_msgSend(v9, "posteriorProbability", v14);
    *(float *)&double v16 = ATXSetInput((uint64_t)a3, 0x32BuLL, v15);
    objc_msgSend(v9, "classConditionalProbability", v16);
    *(float *)&double v18 = ATXSetInput((uint64_t)a3, 0x32CuLL, v17);
    *(float *)&double v19 = ATXSetInput((uint64_t)a3, 0x32DuLL, (double)(unint64_t)objc_msgSend(v9, "uniqueOccurrencesInMode", v18));
    *(float *)&double v20 = ATXSetInput((uint64_t)a3, 0x32EuLL, (double)(unint64_t)objc_msgSend(v9, "localOccurrences", v19));
    *(float *)&double v21 = ATXSetInput((uint64_t)a3, 0x32FuLL, (double)(unint64_t)objc_msgSend(v9, "globalOccurrences", v20));
    v22 = objc_msgSend(v24, "scoreMetadata", v21);
    [v22 score];
    ATXSetInput((uint64_t)a3, 0x330uLL, v23);
  }
  else
  {
    [(ATXAppFeaturizer *)self setZeroValuesForModeEntityFeatures:a3];
  }
}

- (void)setZeroValuesForModeEntityFeatures:(ATXPredictionItem *)a3
{
  ATXSetInput((uint64_t)a3, 0x32AuLL, 0.0);
  ATXSetInput((uint64_t)a3, 0x32BuLL, 0.0);
  ATXSetInput((uint64_t)a3, 0x32CuLL, 0.0);
  ATXSetInput((uint64_t)a3, 0x32DuLL, 0.0);
  ATXSetInput((uint64_t)a3, 0x32EuLL, 0.0);
  ATXSetInput((uint64_t)a3, 0x32FuLL, 0.0);
  ATXSetInput((uint64_t)a3, 0x330uLL, 0.0);
}

- (void)setDistributionBasedScoreInputsForTimeAndDay:(ATXPredictionItem *)a3 forBundleId:(id)a4 withTimeOfDayHistogram:(id)a5 withDayOfWeekHistogram:(id)a6
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v29 = a6;
  unsigned int v12 = [v11 bucketCount];
  if (v12 <= 7)
  {
    uint64_t v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2 object:self file:@"ATXAppFeaturizer.mm" lineNumber:964 description:@"Number of aggregated time buckets should be greater than 0"];
  }
  __int16 v13 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = v12 >> 3;
  while (v14 != v15)
  {
    double v16 = (void *)MEMORY[0x1D25F6CC0]();
    int v17 = 0;
    double v18 = 0.0;
    do
    {
      v32[0] = v10;
      double v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
      [v11 unsmoothedLaunchesForBundleIds:v19 forLocalTime:(unsigned __int16)(v13 + v17)];
      double v21 = v20;

      double v18 = v18 + v21;
      ++v17;
    }
    while (v17 != 8);
    ATXSetInput((uint64_t)a3, +[_ATXScoreTypes mappingForTimeOfDayDistributionSignals:v14 forScoreInputCategory:0], v18);
    v13 += 8;
    ++v14;
  }
  for (uint64_t i = 0; i != 7; ++i)
  {
    double v23 = (void *)MEMORY[0x1D25F6CC0]();
    unint64_t v24 = +[_ATXScoreTypes mappingForDayOfWeekDistributionSignals:i forScoreInputCategory:0];
    id v31 = v10;
    id v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
    [v29 unsmoothedLaunchesForBundleIds:v25 forLocalTime:(unsigned __int16)i];
    double v27 = v26;

    ATXSetInput((uint64_t)a3, v24, v27);
  }
}

- (void)setDistributionBasedScoreInputsForItem:(ATXPredictionItem *)a3 withGeoHashResolution:(unint64_t)a4 withGeoHashLaunchCounts:(id)a5
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  v22 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"self" ascending:0];
  v23[0] = v22;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  id v9 = [v7 sortedArrayUsingDescriptors:v8];

  int v11 = 0;
  if ((uint64_t)a4 <= 1)
  {
    if (a4)
    {
      if (a4 != 1) {
        goto LABEL_14;
      }
      *(float *)&double v10 = ATXSetInput((uint64_t)a3, 0x1F7uLL, (double)(unint64_t)[v7 count]);
      unsigned int v12 = &kATXAppNumberOfScoreInputsForCoarseGeoHash;
    }
    else
    {
      *(float *)&double v10 = ATXSetInput((uint64_t)a3, 0x1F6uLL, (double)(unint64_t)[v7 count]);
      unsigned int v12 = &kATXAppNumberOfScoreInputsForSpecificGeoHash;
    }
    goto LABEL_13;
  }
  if (a4 == 2)
  {
    *(float *)&double v10 = ATXSetInput((uint64_t)a3, 0x29AuLL, (double)(unint64_t)[v7 count]);
    unsigned int v12 = &kATXAppNumberOfScoreInputsForZoom7GeoHash;
LABEL_13:
    int v11 = *v12;
LABEL_14:
    unint64_t v14 = 0;
    unint64_t v15 = v11;
    while (1)
    {
      unint64_t v16 = objc_msgSend(v9, "count", v10);
      unint64_t v17 = v16 >= v15 ? v15 : v16;
      if (v14 >= v17) {
        break;
      }
      double v18 = (void *)MEMORY[0x1D25F6CC0]();
      unint64_t v19 = +[_ATXScoreTypes mappingForTopRankedGeoHashSignalsWithResolution:a4 withRank:v14 forScoreInputCategory:0];
      double v20 = [v9 objectAtIndex:v14];
      [v20 doubleValue];
      ATXSetInput((uint64_t)a3, v19, v21);

      ++v14;
    }
    goto LABEL_10;
  }
  if (a4 != 0xFFFFFFFF) {
    goto LABEL_14;
  }
  __int16 v13 = __atxlog_handle_app_prediction();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    -[ATXAppFeaturizer setDistributionBasedScoreInputsForItem:withGeoHashResolution:withGeoHashLaunchCounts:](v13);
  }

LABEL_10:
}

+ (float)_computeL2DistanceFromBundleId:(id)a3 to:(const float *)a4 app2vecMapping:(id)a5
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a5;
  size_t v8 = 4 * [v7 vectorLength];
  id v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (([v7 getVectorForBundleIdWithGenreBackup:v6 into:v9] & 1) == 0) {
    bzero(v9, v8);
  }
  catlas_saxpby_NEWLAPACK();
  cblas_snrm2_NEWLAPACK();
  float v11 = v10;

  return v11;
}

+ (BOOL)_predictNextAppLaunchEmbedding:(id)a3 into:(float *)a4 launchSequence:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = [v7 vectorLength];
  std::vector<float>::vector(&__p, 4 * v9);
  unint64_t v10 = 0;
  *(void *)&long long v11 = 138412546;
  long long v18 = v11;
  while (objc_msgSend(v8, "count", v18) > v10)
  {
    unsigned int v12 = [v8 objectAtIndexedSubscript:v10];
    unint64_t v13 = (v10 - [v8 count] + 4) * v9;
    if (v13 >= (v20 - (unsigned char *)__p) >> 2) {
      std::vector<ATXPredictionItem>::__throw_out_of_range[abi:ne180100]();
    }
    int v14 = [v7 getVectorForBundleIdWithGenreBackup:v12 into:(char *)__p + 4 * v13];

    unint64_t v15 = __atxlog_handle_app_prediction();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v16 = [v8 objectAtIndexedSubscript:v10];
      *(_DWORD *)buf = v18;
      v22 = v16;
      __int16 v23 = 1024;
      int v24 = v14;
      _os_log_debug_impl(&dword_1D0FA3000, v15, OS_LOG_TYPE_DEBUG, "Embeddings found for %@: %i", buf, 0x12u);
    }
    ++v10;
  }
  if (+[ATXAppFeaturizer _predictNextAppLaunchEmbedding:into:launchSequence:]::onceToken != -1) {
    dispatch_once(&+[ATXAppFeaturizer _predictNextAppLaunchEmbedding:into:launchSequence:]::onceToken, &__block_literal_global_198);
  }
  [(id)+[ATXAppFeaturizer _predictNextAppLaunchEmbedding:into:launchSequence:]::nn forInputs:__p computeOutputLayer:a4];
  if (__p)
  {
    double v20 = __p;
    operator delete(__p);
  }

  return 1;
}

void __71__ATXAppFeaturizer__predictNextAppLaunchEmbedding_into_launchSequence___block_invoke()
{
  v0 = [MEMORY[0x1E4F4AF08] pathForResource:@"_ATXAppLaunchSequenceModel" ofType:@"dat" isDirectory:0];
  if (v0)
  {
    id v5 = 0;
    v1 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v0 options:1 error:&v5];
    id v2 = v5;
    if (v1)
    {
      v3 = [[_ATXNeuralNetwork alloc] initWithData:v1];
      v4 = +[ATXAppFeaturizer _predictNextAppLaunchEmbedding:into:launchSequence:]::nn;
      +[ATXAppFeaturizer _predictNextAppLaunchEmbedding:into:launchSequence:]::nn = (uint64_t)v3;
    }
    else
    {
      v4 = __atxlog_handle_app_prediction();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        __71__ATXAppFeaturizer__predictNextAppLaunchEmbedding_into_launchSequence___block_invoke_cold_1((uint64_t)v0, (uint64_t)v2, v4);
      }
    }
  }
}

+ (double)time:(double)a3 toAccuracyInSeconds:(double)a4
{
  if (a4 <= 0.0)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:a1 file:@"ATXAppFeaturizer.mm" lineNumber:1069 description:@"Accuracy must be greater than 0"];
  }
  return (double)(uint64_t)(a3 / a4) * a4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dayZeroIntentParameters, 0);
  objc_storeStrong((id *)&self->_dayZeroParameters, 0);
  objc_storeStrong((id *)&self->_heroPoiManager, 0);
  objc_storeStrong((id *)&self->_heroPredictionServer, 0);
  objc_storeStrong((id *)&self->_mmPredictionMonitor, 0);
  objc_storeStrong((id *)&self->_appIconState, 0);
  objc_storeStrong((id *)&self->_appInfoManager, 0);
  objc_storeStrong((id *)&self->_globalSmartSuppression, 0);
  objc_storeStrong((id *)&self->_globalAppScorePredictor, 0);
  objc_storeStrong((id *)&self->_appDailyDose, 0);
  objc_storeStrong((id *)&self->_mediaApps, 0);
  objc_storeStrong((id *)&self->_microLocation, 0);
  objc_storeStrong((id *)&self->_appInstallMonitor, 0);
  objc_storeStrong((id *)&self->_appLaunchLocation, 0);
  objc_storeStrong((id *)&self->_appLaunchSequenceManager, 0);
  objc_storeStrong((id *)&self->_appLaunchHistogramManager, 0);
  objc_storeStrong((id *)&self->_feedback, 0);
  objc_storeStrong((id *)&self->_notificationManager, 0);
}

- (void)evaluateFeaturesForApps:(os_log_t)log clipBundleIdsToRank:consumerSubType:intent:scoreLogger:context:featureCache:.cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "MagicalMoment with unknown source. This shouldn't happen.", buf, 2u);
}

- (void)setDistributionBasedScoreInputsForItem:(os_log_t)log withGeoHashResolution:withGeoHashLaunchCounts:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 134217984;
  uint64_t v2 = 0xFFFFFFFFLL;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "Unknown GeoHash Resolution: %ld", (uint8_t *)&v1, 0xCu);
}

void __71__ATXAppFeaturizer__predictNextAppLaunchEmbedding_into_launchSequence___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "Could not read neural network from %@: %@", (uint8_t *)&v3, 0x16u);
}

@end
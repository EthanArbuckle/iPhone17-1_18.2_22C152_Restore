@interface _ATXAppLaunchHistogram
+ (BOOL)supportsSecureCoding;
- (BOOL)bundleHasBeenLaunched:(id)a3;
- (BOOL)removeHistoryForBundleId:(id)a3;
- (NSString)description;
- (_ATXAppLaunchHistogram)initWithCoder:(id)a3;
- (_ATXAppLaunchHistogram)initWithHistogram:(id)a3 bucketCount:(unsigned __int16)a4 filter:(BOOL)a5 timeBase:(int)a6;
- (_ATXAppLaunchHistogram)initWithType:(int64_t)a3;
- (double)averageLaunchesPerBundleId:(id)a3;
- (double)entropy;
- (double)entropyForBundleId:(id)a3;
- (double)entropyForDate:(id)a3;
- (double)launchPopularityWithBundleId:(id)a3 date:(id)a4;
- (double)overallLaunchPopularityForBundleId:(id)a3;
- (double)ratio:(double)a3 over:(double)a4;
- (double)relativeLaunchPopularityWithBundleId:(id)a3 date:(id)a4;
- (double)relativeLaunchPopularityWithBundleId:(id)a3 date:(id)a4 distanceScale:(float)a5;
- (double)relativeLaunchPopularityWithBundleId:(id)a3 elapsedTime:(double)a4 distanceScale:(float)a5;
- (double)totalLaunches;
- (double)totalLaunchesForBundleIds:(id)a3;
- (double)totalLaunchesForBundleIds:(id)a3 forDate:(id)a4 distanceScale:(float)a5;
- (double)totalTimeOfDayLaunchesForDate:(id)a3;
- (double)totalTimeOfDayLaunchesForDate:(id)a3 distanceScale:(float)a4;
- (double)totalTimeOfDayLaunchesForElapsedTime:(double)a3;
- (double)totalTimeOfDayLaunchesForElapsedTime:(double)a3 distanceScale:(float)a4;
- (double)unsmoothedLaunchesForBundleIds:(id)a3 forLocalTime:(unsigned __int16)a4;
- (int)removeHistoryForBundleIds:(id)a3;
- (unsigned)_eventIdforBundleId:(id)a3;
- (unsigned)_localTimeWithDate:(id)a3;
- (unsigned)_localTimeWithDate:(id)a3 timeZone:(id)a4;
- (unsigned)bucketCount;
- (void)_addLaunchWithBundleId:(id)a3 date:(id)a4 timeZone:(id)a5 arbitraryWeight:(float)a6;
- (void)addLaunchWithBundleId:(id)a3 date:(id)a4 timeZone:(id)a5;
- (void)addLaunchWithBundleId:(id)a3 date:(id)a4 timeZone:(id)a5 weight:(float)a6;
- (void)addLaunchWithBundleId:(id)a3 elapsedTime:(double)a4;
- (void)addLaunchWithBundleId:(id)a3 elapsedTime:(double)a4 weight:(float)a5;
- (void)dealloc;
- (void)decayByFactor:(double)a3;
- (void)decayWithHalfLifeInDays:(double)a3;
- (void)encodeWithCoder:(id)a3;
- (void)removeLaunchWithBundleId:(id)a3 date:(id)a4 timeZone:(id)a5 weight:(float)a6;
- (void)resetData;
- (void)resetHistogram:(id)a3;
@end

@implementation _ATXAppLaunchHistogram

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42___ATXAppLaunchHistogram_encodeWithCoder___block_invoke;
  v7[3] = &unk_1E68AFEB8;
  id v8 = v4;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
  [v6 encodeInt32:self->_timeBase forKey:@"timeBase"];
}

- (_ATXAppLaunchHistogram)initWithHistogram:(id)a3 bucketCount:(unsigned __int16)a4 filter:(BOOL)a5 timeBase:(int)a6
{
  BOOL v7 = a5;
  uint64_t v8 = a4;
  id v11 = a3;
  v26.receiver = self;
  v26.super_class = (Class)_ATXAppLaunchHistogram;
  v12 = [(_ATXAppLaunchHistogram *)&v26 init];
  if (v12)
  {
    v13 = [[ATXGuardedHistData alloc] initWithHistogramData:v11 bucketCount:v8 filter:v7];
    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v13];
    lock = v12->_lock;
    v12->_lock = (_PASLock *)v14;

    v12->_timeBase = a6;
    v12->_secondsPerLocaltimeInterval = a6 / (int)v8;
    pthread_mutex_init(&v12->_prevLocaltimeLock, 0);
    objc_initWeak(&location, v12);
    uint64_t v16 = objc_opt_new();
    uninstallNotificationListener = v12->_uninstallNotificationListener;
    v12->_uninstallNotificationListener = (_ATXInternalUninstallNotification *)v16;

    v18 = v12->_uninstallNotificationListener;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __72___ATXAppLaunchHistogram_initWithHistogram_bucketCount_filter_timeBase___block_invoke;
    v23[3] = &unk_1E68AB9D8;
    objc_copyWeak(&v24, &location);
    [(_ATXInternalUninstallNotification *)v18 registerForNotificationsWithUninstallBlock:v23];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __72___ATXAppLaunchHistogram_initWithHistogram_bucketCount_filter_timeBase___block_invoke_2;
    v20[3] = &unk_1E68ACD10;
    SEL v22 = a2;
    v21 = v12;
    if (initWithHistogram_bucketCount_filter_timeBase__onceToken != -1) {
      dispatch_once(&initWithHistogram_bucketCount_filter_timeBase__onceToken, v20);
    }

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
  return v12;
}

- (void)dealloc
{
  pthread_mutex_destroy(&self->_prevLocaltimeLock);
  v3.receiver = self;
  v3.super_class = (Class)_ATXAppLaunchHistogram;
  [(_ATXAppLaunchHistogram *)&v3 dealloc];
}

- (_ATXAppLaunchHistogram)initWithType:(int64_t)a3
{
  objc_super v3 = self;
  uint64_t v4 = 0;
  uint64_t v5 = 1;
  uint64_t v6 = 86400;
  switch(a3)
  {
    case 0:
    case 1:
      uint64_t v5 = 200;
      goto LABEL_6;
    case 2:
    case 17:
    case 19:
      uint64_t v4 = 0;
      uint64_t v6 = 604800;
      uint64_t v5 = 7;
      goto LABEL_7;
    case 4:
      uint64_t v8 = __atxlog_handle_default();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:]4(v8, v9, v10, v11, v12, v13, v14, v15);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypeWifiAppLaunch";
      goto LABEL_243;
    case 6:
      v19 = __atxlog_handle_default();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:]0(v19, v20, v21, v22, v23, v24, v25, v26);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_APRHistogramTypeAppIntentExplicitConfirms";
      goto LABEL_243;
    case 7:
      v27 = __atxlog_handle_default();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:]1(v27, v28, v29, v30, v31, v32, v33, v34);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_APRHistogramTypeAppIntentExplicitRejects";
      goto LABEL_243;
    case 8:
      v35 = __atxlog_handle_default();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:]4();
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v36 = @"_APRHistogramTypeAppIntentDonation is deprecated.";
      goto LABEL_244;
    case 9:
      v37 = __atxlog_handle_default();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:]2(v37, v38, v39, v40, v41, v42, v43, v44);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_APRHistogramTypeAppIntentImplicitConfirms";
      goto LABEL_243;
    case 10:
      v45 = __atxlog_handle_default();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:]3(v45, v46, v47, v48, v49, v50, v51, v52);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_APRHistogramTypeAppIntentImplicitRejects";
      goto LABEL_243;
    case 11:
    case 23:
    case 25:
      uint64_t v6 = 7200;
      uint64_t v5 = 240;
      goto LABEL_6;
    case 12:
      v53 = __atxlog_handle_default();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:]5(v53, v54, v55, v56, v57, v58, v59, v60);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_APRHistogramTypeAppIntentSiriKitDonation";
      goto LABEL_243;
    case 13:
      v61 = __atxlog_handle_default();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:]6(v61, v62, v63, v64, v65, v66, v67, v68);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_APRHistogramTypeAppIntentNonSiriKitDonation";
      goto LABEL_243;
    case 14:
    case 16:
      uint64_t v5 = 100;
LABEL_6:
      uint64_t v4 = 1;
      goto LABEL_7;
    case 15:
      v69 = __atxlog_handle_default();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:].cold.6(v69, v70, v71, v72, v73, v74, v75, v76);
      }

      v77 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v78 = *MEMORY[0x1E4F1C3B8];
      v79 = @"_ATXHistogramTypeIntentForAllAppsLaunch";
      goto LABEL_53;
    case 18:
      v80 = __atxlog_handle_default();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:].cold.5(v80, v81, v82, v83, v84, v85, v86, v87);
      }

      v77 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v78 = *MEMORY[0x1E4F1C3B8];
      v79 = @"_ATXHistogramTypeIntentForAllAppsDayOfWeek";
      goto LABEL_53;
    case 21:
      v88 = __atxlog_handle_default();
      if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:].cold.4(v88, v89, v90, v91, v92, v93, v94, v95);
      }

      v77 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v78 = *MEMORY[0x1E4F1C3B8];
      v79 = @"_ATXHistogramTypeIntentForAllAppsTrendingLaunch";
      goto LABEL_53;
    case 24:
      v96 = __atxlog_handle_default();
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:](v96, v97, v98, v99, v100, v101, v102, v103);
      }

      v77 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v78 = *MEMORY[0x1E4F1C3B8];
      v79 = @"_ATXHistogramTypeIntentForAllAppsUnlockTime";
      goto LABEL_53;
    case 27:
      v104 = __atxlog_handle_default();
      if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:](v104, v105, v106, v107, v108, v109, v110, v111);
      }

      v77 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v78 = *MEMORY[0x1E4F1C3B8];
      v79 = @"_ATXHistogramTypeIntentForAllAppsAirplaneModeLaunch";
      goto LABEL_53;
    case 29:
      v112 = __atxlog_handle_default();
      if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:]5(v112, v113, v114, v115, v116, v117, v118, v119);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypeAppIntentWifiLaunch";
      goto LABEL_243;
    case 30:
      v120 = __atxlog_handle_default();
      if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:](v120, v121, v122, v123, v124, v125, v126, v127);
      }

      v77 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v78 = *MEMORY[0x1E4F1C3B8];
      v79 = @"_ATXHistogramTypeIntentForAllAppsWifiLaunch";
LABEL_53:
      [v77 raise:v78, @"%@ is deprecated.", v79 format];
      goto LABEL_245;
    case 31:
      v128 = __atxlog_handle_default();
      if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:]6(v128, v129, v130, v131, v132, v133, v134, v135);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypeAppForAllIntentsWifiLaunch";
      goto LABEL_243;
    case 32:
      v136 = __atxlog_handle_default();
      if (os_log_type_enabled(v136, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:]3(v136, v137, v138, v139, v140, v141, v142, v143);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypeNotifications";
      goto LABEL_243;
    case 33:
      v144 = __atxlog_handle_default();
      if (os_log_type_enabled(v144, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:]7(v144, v145, v146, v147, v148, v149, v150, v151);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypeActionsConfirms";
      goto LABEL_243;
    case 34:
      v152 = __atxlog_handle_default();
      if (os_log_type_enabled(v152, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:]8(v152, v153, v154, v155, v156, v157, v158, v159);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypeActionsRejects";
      goto LABEL_243;
    case 37:
      v160 = __atxlog_handle_default();
      if (os_log_type_enabled(v160, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:]7(v160, v161, v162, v163, v164, v165, v166, v167);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypeCoreMotionLaunch";
      goto LABEL_243;
    case 38:
      v168 = __atxlog_handle_default();
      if (os_log_type_enabled(v168, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:]8(v168, v169, v170, v171, v172, v173, v174, v175);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypeAppIntentCoreMotionLaunch";
      goto LABEL_243;
    case 39:
      v176 = __atxlog_handle_default();
      if (os_log_type_enabled(v176, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:]9(v176, v177, v178, v179, v180, v181, v182, v183);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypeAppForAllIntentsCoreMotionLaunch";
      goto LABEL_243;
    case 40:
      v184 = __atxlog_handle_default();
      if (os_log_type_enabled(v184, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:]9(v184, v185, v186, v187, v188, v189, v190, v191);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypePartOfWeek";
      goto LABEL_243;
    case 41:
      v192 = __atxlog_handle_default();
      if (os_log_type_enabled(v192, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:]0(v192, v193, v194, v195, v196, v197, v198, v199);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypeAmbientLight";
      goto LABEL_243;
    case 42:
      v200 = __atxlog_handle_default();
      if (os_log_type_enabled(v200, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:]1(v200, v201, v202, v203, v204, v205, v206, v207);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypeTimeOfDayAndDayOfWeek";
      goto LABEL_243;
    case 43:
      v208 = __atxlog_handle_default();
      if (os_log_type_enabled(v208, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:]2(v208, v209, v210, v211, v212, v213, v214, v215);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypeAppCoarseTimePOWLocationLaunches";
      goto LABEL_243;
    case 44:
      v216 = __atxlog_handle_default();
      if (os_log_type_enabled(v216, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:]3(v216, v217, v218, v219, v220, v221, v222, v223);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypeAppSpecificTimeDOWLocationLaunches";
      goto LABEL_243;
    case 45:
      v224 = __atxlog_handle_default();
      if (os_log_type_enabled(v224, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:]4(v224, v225, v226, v227, v228, v229, v230, v231);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypeAppCoarseTimePOWLocationConfirms";
      goto LABEL_243;
    case 46:
      v232 = __atxlog_handle_default();
      if (os_log_type_enabled(v232, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:]5(v232, v233, v234, v235, v236, v237, v238, v239);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypeAppSpecificTimeDOWLocationConfirms";
      goto LABEL_243;
    case 47:
      v240 = __atxlog_handle_default();
      if (os_log_type_enabled(v240, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:]6(v240, v241, v242, v243, v244, v245, v246, v247);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypeAppCoarseTimePOWLocationRejects";
      goto LABEL_243;
    case 48:
      v248 = __atxlog_handle_default();
      if (os_log_type_enabled(v248, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:]7(v248, v249, v250, v251, v252, v253, v254, v255);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypeAppSpecificTimeDOWLocationRejects";
      goto LABEL_243;
    case 49:
      v256 = __atxlog_handle_default();
      if (os_log_type_enabled(v256, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:]8(v256, v257, v258, v259, v260, v261, v262, v263);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypeAppClipsAndHeroApp";
      goto LABEL_243;
    case 50:
      v264 = __atxlog_handle_default();
      if (os_log_type_enabled(v264, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:].cold.40(v264, v265, v266, v267, v268, v269, v270, v271);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypeAppSpecificLocation";
      goto LABEL_243;
    case 51:
      v272 = __atxlog_handle_default();
      if (os_log_type_enabled(v272, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:].cold.41(v272, v273, v274, v275, v276, v277, v278, v279);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypeAppCoarseLocation";
      goto LABEL_243;
    case 52:
      v280 = __atxlog_handle_default();
      if (os_log_type_enabled(v280, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:].cold.43(v280, v281, v282, v283, v284, v285, v286, v287);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypeAppLaunchesTwoHourTimeInterval";
      goto LABEL_243;
    case 53:
      v288 = __atxlog_handle_default();
      if (os_log_type_enabled(v288, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:].cold.44(v288, v289, v290, v291, v292, v293, v294, v295);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypeAppConfirmsTwoHourTimeInterval";
      goto LABEL_243;
    case 54:
      v296 = __atxlog_handle_default();
      if (os_log_type_enabled(v296, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:].cold.45(v296, v297, v298, v299, v300, v301, v302, v303);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypeAppRejectsTwoHourTimeInterval";
      goto LABEL_243;
    case 55:
      v304 = __atxlog_handle_default();
      if (os_log_type_enabled(v304, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:].cold.46(v304, v305, v306, v307, v308, v309, v310, v311);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypeAppConfirmsDayOfWeek";
      goto LABEL_243;
    case 56:
      v312 = __atxlog_handle_default();
      if (os_log_type_enabled(v312, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:].cold.47(v312, v313, v314, v315, v316, v317, v318, v319);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypeAppRejectsDayOfWeek";
      goto LABEL_243;
    case 57:
      v320 = __atxlog_handle_default();
      if (os_log_type_enabled(v320, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:].cold.48(v320, v321, v322, v323, v324, v325, v326, v327);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypeAppConfirmsCoarseGeoHash";
      goto LABEL_243;
    case 58:
      v328 = __atxlog_handle_default();
      if (os_log_type_enabled(v328, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:].cold.49(v328, v329, v330, v331, v332, v333, v334, v335);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypeAppRejectsCoarseGeoHash";
      goto LABEL_243;
    case 59:
      v336 = __atxlog_handle_default();
      if (os_log_type_enabled(v336, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:].cold.50(v336, v337, v338, v339, v340, v341, v342, v343);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypeAppConfirmsSpecificGeoHash";
      goto LABEL_243;
    case 60:
      v344 = __atxlog_handle_default();
      if (os_log_type_enabled(v344, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:].cold.51(v344, v345, v346, v347, v348, v349, v350, v351);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypeAppRejectsSpecificGeoHash";
      goto LABEL_243;
    case 61:
      v352 = __atxlog_handle_default();
      if (os_log_type_enabled(v352, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:].cold.42(v352, v353, v354, v355, v356, v357, v358, v359);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypeAppZoom7GeoHash";
      goto LABEL_243;
    case 62:
      v360 = __atxlog_handle_default();
      if (os_log_type_enabled(v360, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:].cold.53(v360, v361, v362, v363, v364, v365, v366, v367);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypeHomeScreenWidgetInteractions";
      goto LABEL_243;
    case 63:
      v368 = __atxlog_handle_default();
      if (os_log_type_enabled(v368, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:].cold.54(v368, v369, v370, v371, v372, v373, v374, v375);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypeHomeScreenAppConfirmsCoarseTimePOWLocation";
      goto LABEL_243;
    case 64:
      v376 = __atxlog_handle_default();
      if (os_log_type_enabled(v376, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:].cold.55(v376, v377, v378, v379, v380, v381, v382, v383);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypeHomeScreenAppConfirmsSpecificTimeDOWLocation";
      goto LABEL_243;
    case 65:
      v384 = __atxlog_handle_default();
      if (os_log_type_enabled(v384, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:].cold.56(v384, v385, v386, v387, v388, v389, v390, v391);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypeHomeScreenAppConfirmsTwoHourTimeInterval";
      goto LABEL_243;
    case 66:
      v392 = __atxlog_handle_default();
      if (os_log_type_enabled(v392, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:].cold.57(v392, v393, v394, v395, v396, v397, v398, v399);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypeHomeScreenAppConfirmsDayOfWeek";
      goto LABEL_243;
    case 67:
      v400 = __atxlog_handle_default();
      if (os_log_type_enabled(v400, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:].cold.58(v400, v401, v402, v403, v404, v405, v406, v407);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypeHomeScreenAppConfirmsCoarseGeohash";
      goto LABEL_243;
    case 68:
      v408 = __atxlog_handle_default();
      if (os_log_type_enabled(v408, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:].cold.59(v408, v409, v410, v411, v412, v413, v414, v415);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypeHomeScreenAppConfirmsSpecificGeohash";
      goto LABEL_243;
    case 69:
      v416 = __atxlog_handle_default();
      if (os_log_type_enabled(v416, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:].cold.60(v416, v417, v418, v419, v420, v421, v422, v423);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypeHomeScreenAppRejectsCoarseTimePOWLocation";
      goto LABEL_243;
    case 70:
      v424 = __atxlog_handle_default();
      if (os_log_type_enabled(v424, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:].cold.61(v424, v425, v426, v427, v428, v429, v430, v431);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypeHomeScreenAppRejectsSpecificTimeDOWLocation";
      goto LABEL_243;
    case 71:
      v432 = __atxlog_handle_default();
      if (os_log_type_enabled(v432, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:].cold.62(v432, v433, v434, v435, v436, v437, v438, v439);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypeHomeScreenAppRejectsTwoHourTimeInterval";
      goto LABEL_243;
    case 72:
      v440 = __atxlog_handle_default();
      if (os_log_type_enabled(v440, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:].cold.63(v440, v441, v442, v443, v444, v445, v446, v447);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypeHomeScreenAppRejectsDayOfWeek";
      goto LABEL_243;
    case 73:
      v448 = __atxlog_handle_default();
      if (os_log_type_enabled(v448, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:].cold.64(v448, v449, v450, v451, v452, v453, v454, v455);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypeHomeScreenAppRejectsCoarseGeohash";
      goto LABEL_243;
    case 74:
      v456 = __atxlog_handle_default();
      if (os_log_type_enabled(v456, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:].cold.65(v456, v457, v458, v459, v460, v461, v462, v463);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypeHomeScreenAppRejectsSpecificGeohash";
      goto LABEL_243;
    case 75:
      v464 = __atxlog_handle_default();
      if (os_log_type_enabled(v464, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:].cold.67(v464, v465, v466, v467, v468, v469, v470, v471);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypeAppDirectoryConfirmsCoarseTimePOWLocation";
      goto LABEL_243;
    case 76:
      v472 = __atxlog_handle_default();
      if (os_log_type_enabled(v472, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:].cold.68(v472, v473, v474, v475, v476, v477, v478, v479);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypeAppDirectoryConfirmsSpecificTimeDOWLocation";
      goto LABEL_243;
    case 77:
      v480 = __atxlog_handle_default();
      if (os_log_type_enabled(v480, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:].cold.69(v480, v481, v482, v483, v484, v485, v486, v487);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypeAppDirectoryConfirmsTwoHourTimeInterval";
      goto LABEL_243;
    case 78:
      v488 = __atxlog_handle_default();
      if (os_log_type_enabled(v488, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:].cold.70(v488, v489, v490, v491, v492, v493, v494, v495);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypeAppDirectoryConfirmsDayOfWeek";
      goto LABEL_243;
    case 79:
      v496 = __atxlog_handle_default();
      if (os_log_type_enabled(v496, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:].cold.71(v496, v497, v498, v499, v500, v501, v502, v503);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypeAppDirectoryConfirmsCoarseGeohash";
      goto LABEL_243;
    case 80:
      v504 = __atxlog_handle_default();
      if (os_log_type_enabled(v504, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:].cold.72(v504, v505, v506, v507, v508, v509, v510, v511);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypeAppDirectoryConfirmsSpecificGeohash";
      goto LABEL_243;
    case 81:
      v512 = __atxlog_handle_default();
      if (os_log_type_enabled(v512, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:].cold.73(v512, v513, v514, v515, v516, v517, v518, v519);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypeAppDirectoryRejectsCoarseTimePOWLocation";
      goto LABEL_243;
    case 82:
      v520 = __atxlog_handle_default();
      if (os_log_type_enabled(v520, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:].cold.74(v520, v521, v522, v523, v524, v525, v526, v527);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypeAppDirectoryRejectsSpecificTimeDOWLocation";
      goto LABEL_243;
    case 83:
      v528 = __atxlog_handle_default();
      if (os_log_type_enabled(v528, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:].cold.75(v528, v529, v530, v531, v532, v533, v534, v535);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypeAppDirectoryRejectsTwoHourTimeInterval";
      goto LABEL_243;
    case 84:
      v536 = __atxlog_handle_default();
      if (os_log_type_enabled(v536, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:].cold.76(v536, v537, v538, v539, v540, v541, v542, v543);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypeAppDirectoryRejectsDayOfWeek";
      goto LABEL_243;
    case 85:
      v544 = __atxlog_handle_default();
      if (os_log_type_enabled(v544, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:].cold.77(v544, v545, v546, v547, v548, v549, v550, v551);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypeAppDirectoryRejectsCoarseGeohash";
      goto LABEL_243;
    case 86:
      v552 = __atxlog_handle_default();
      if (os_log_type_enabled(v552, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:].cold.78(v552, v553, v554, v555, v556, v557, v558, v559);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypeAppDirectoryRejectsSpecificGeohash";
      goto LABEL_243;
    case 87:
      v560 = __atxlog_handle_default();
      if (os_log_type_enabled(v560, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:].cold.52(v560, v561, v562, v563, v564, v565, v566, v567);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypeAppExplicitRejectsCoarseTimePOWLocation";
      goto LABEL_243;
    case 88:
      v568 = __atxlog_handle_default();
      if (os_log_type_enabled(v568, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:].cold.66(v568, v569, v570, v571, v572, v573, v574, v575);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypeHomeScreenAppExplicitRejectsCoarseTimePOWLocation";
      goto LABEL_243;
    case 89:
      v576 = __atxlog_handle_default();
      if (os_log_type_enabled(v576, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:]2(v576, v577, v578, v579, v580, v581, v582, v583);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypeAppDirectoryExplicitRejectsCoarseTimePOWLocation";
      goto LABEL_243;
    case 94:
      v584 = __atxlog_handle_default();
      if (os_log_type_enabled(v584, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:]9(v584, v585, v586, v587, v588, v589, v590, v591);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypeAppClipsAndHeroAppNoDecay";
      goto LABEL_243;
    case 95:
      v592 = __atxlog_handle_default();
      if (os_log_type_enabled(v592, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:]1(v592, v593, v594, v595, v596, v597, v598, v599);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypePOICategory";
      goto LABEL_243;
    case 96:
      v600 = __atxlog_handle_default();
      if (os_log_type_enabled(v600, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:]0(v600, v601, v602, v603, v604, v605, v606, v607);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypeActivitySuggestionsFeedback";
      goto LABEL_243;
    case 97:
      v608 = __atxlog_handle_default();
      if (os_log_type_enabled(v608, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:].cold.9(v608, v609, v610, v611, v612, v613, v614, v615);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypeNotificationDigestAppEngagement";
      goto LABEL_243;
    case 98:
      v616 = __atxlog_handle_default();
      if (os_log_type_enabled(v616, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:].cold.8(v616, v617, v618, v619, v620, v621, v622, v623);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypeNotificationDigestAlltimeMarqueeAppearances";
      goto LABEL_243;
    case 99:
      v624 = __atxlog_handle_default();
      if (os_log_type_enabled(v624, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogram initWithType:].cold.7(v624, v625, v626, v627, v628, v629, v630, v631);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      v18 = @"_ATXHistogramTypeMax";
LABEL_243:
      v633 = v18;
      v36 = @"%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.";
LABEL_244:
      objc_msgSend(v16, "raise:format:", v17, v36, v633);
LABEL_245:
      BOOL v7 = 0;
      break;
    default:
LABEL_7:
      objc_super v3 = [(_ATXAppLaunchHistogram *)self initWithHistogram:0 bucketCount:v5 filter:v4 timeBase:v6];
      BOOL v7 = v3;
      break;
  }

  return v7;
}

- (unsigned)_localTimeWithDate:(id)a3 timeZone:(id)a4
{
  BOOL v7 = (NSDate *)a3;
  uint64_t v8 = (NSTimeZone *)a4;
  pthread_mutex_lock(&self->_prevLocaltimeLock);
  prevDate = self->_prevDate;
  if (prevDate
    && (prevDate == v7 || -[NSDate isEqualToDate:](v7, "isEqualToDate:"))
    && (self->_prevTimeZone == v8 || -[NSTimeZone isEqualToTimeZone:](v8, "isEqualToTimeZone:")))
  {
    LOWORD(v10) = self->_prevLocaltime;
    pthread_mutex_unlock(&self->_prevLocaltimeLock);
  }
  else
  {
    pthread_mutex_unlock(&self->_prevLocaltimeLock);
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    uint64_t v15 = 0;
    uint64_t v11 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    uint64_t v12 = v11;
    if (v8) {
      [v11 setTimeZone:v8];
    }
    uint64_t v13 = [v12 component:512 fromDate:v7];
    [v12 getHour:&v17 minute:&v16 second:&v15 nanosecond:0 fromDate:v7];
    uint64_t v10 = (3600 * v17 + 86400 * v13 + 60 * v16 + v15 - 86400) % self->_timeBase / self->_secondsPerLocaltimeInterval;
    pthread_mutex_lock(&self->_prevLocaltimeLock);
    self->_prevLocaltime = v10;
    objc_storeStrong((id *)&self->_prevDate, a3);
    objc_storeStrong((id *)&self->_prevTimeZone, a4);
    pthread_mutex_unlock(&self->_prevLocaltimeLock);
  }
  return v10;
}

- (unsigned)_localTimeWithDate:(id)a3
{
  return [(_ATXAppLaunchHistogram *)self _localTimeWithDate:a3 timeZone:0];
}

- (unsigned)_eventIdforBundleId:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[ATXHistogramBundleIdTable sharedInstance];
  unsigned __int16 v5 = [v4 intern:v3];

  return v5;
}

- (void)addLaunchWithBundleId:(id)a3 date:(id)a4 timeZone:(id)a5
{
  LODWORD(v5) = 1.0;
  [(_ATXAppLaunchHistogram *)self addLaunchWithBundleId:a3 date:a4 timeZone:a5 weight:v5];
}

- (void)_addLaunchWithBundleId:(id)a3 date:(id)a4 timeZone:(id)a5 arbitraryWeight:(float)a6
{
  id v11 = a4;
  id v12 = a5;
  if (a3)
  {
    unsigned __int16 v13 = [(_ATXAppLaunchHistogram *)self _eventIdforBundleId:a3];
    unsigned __int16 v14 = [(_ATXAppLaunchHistogram *)self _localTimeWithDate:v11 timeZone:v12];
    lock = self->_lock;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __79___ATXAppLaunchHistogram__addLaunchWithBundleId_date_timeZone_arbitraryWeight___block_invoke;
    v17[3] = &__block_descriptor_40_e28_v16__0__ATXGuardedHistData_8l;
    float v18 = a6;
    unsigned __int16 v19 = v13;
    unsigned __int16 v20 = v14;
    [(_PASLock *)lock runWithLockAcquired:v17];
  }
  else
  {
    uint64_t v16 = __atxlog_handle_default();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[_ATXAppLaunchHistogram _addLaunchWithBundleId:date:timeZone:arbitraryWeight:](a2);
    }
  }
}

- (void)addLaunchWithBundleId:(id)a3 date:(id)a4 timeZone:(id)a5 weight:(float)a6
{
  if (a6 >= 0.0 && a6 <= 1.0)
  {
    [(_ATXAppLaunchHistogram *)self _addLaunchWithBundleId:a3 date:a4 timeZone:a5 arbitraryWeight:*(double *)&a6];
  }
  else
  {
    uint64_t v8 = __atxlog_handle_default();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[_ATXAppLaunchHistogram addLaunchWithBundleId:date:timeZone:weight:](v8, a6);
    }
  }
}

- (void)removeLaunchWithBundleId:(id)a3 date:(id)a4 timeZone:(id)a5 weight:(float)a6
{
  *(float *)&double v6 = -a6;
  [(_ATXAppLaunchHistogram *)self _addLaunchWithBundleId:a3 date:a4 timeZone:a5 arbitraryWeight:v6];
}

- (void)addLaunchWithBundleId:(id)a3 elapsedTime:(double)a4
{
  LODWORD(v4) = 1.0;
  [(_ATXAppLaunchHistogram *)self addLaunchWithBundleId:a3 elapsedTime:a4 weight:v4];
}

- (void)addLaunchWithBundleId:(id)a3 elapsedTime:(double)a4 weight:(float)a5
{
  id v9 = a3;
  if (v9)
  {
    if (a5 >= 0.0 && a5 <= 1.0)
    {
      unsigned __int16 v12 = [(_ATXAppLaunchHistogram *)self _eventIdforBundleId:v9];
      uint64_t v13 = (int)a4 % self->_timeBase;
      int64_t secondsPerLocaltimeInterval = self->_secondsPerLocaltimeInterval;
      lock = self->_lock;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __67___ATXAppLaunchHistogram_addLaunchWithBundleId_elapsedTime_weight___block_invoke;
      v16[3] = &__block_descriptor_40_e28_v16__0__ATXGuardedHistData_8l;
      float v17 = a5;
      unsigned __int16 v18 = v12;
      __int16 v19 = v13 / secondsPerLocaltimeInterval;
      [(_PASLock *)lock runWithLockAcquired:v16];
      goto LABEL_12;
    }
    id v11 = __atxlog_handle_default();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[_ATXAppLaunchHistogram addLaunchWithBundleId:date:timeZone:weight:](v11, a5);
    }
  }
  else
  {
    id v11 = __atxlog_handle_default();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[_ATXAppLaunchHistogram _addLaunchWithBundleId:date:timeZone:arbitraryWeight:](a2);
    }
  }

LABEL_12:
}

- (void)resetHistogram:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41___ATXAppLaunchHistogram_resetHistogram___block_invoke;
  v7[3] = &unk_1E68AFEB8;
  id v8 = v4;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
}

- (BOOL)removeHistoryForBundleId:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2020000000;
    char v17 = 1;
    lock = self->_lock;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __51___ATXAppLaunchHistogram_removeHistoryForBundleId___block_invoke;
    v11[3] = &unk_1E68AFEE0;
    id v12 = v5;
    uint64_t v13 = &v14;
    [(_PASLock *)lock runWithLockAcquired:v11];
    BOOL v8 = *((unsigned char *)v15 + 24) != 0;

    _Block_object_dispose(&v14, 8);
  }
  else
  {
    id v9 = __atxlog_handle_default();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[_ATXAppLaunchHistogram _addLaunchWithBundleId:date:timeZone:arbitraryWeight:](a2);
    }

    BOOL v8 = 0;
  }

  return v8;
}

- (int)removeHistoryForBundleIds:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52___ATXAppLaunchHistogram_removeHistoryForBundleIds___block_invoke;
  v8[3] = &unk_1E68AFEE0;
  id v6 = v4;
  id v9 = v6;
  uint64_t v10 = &v11;
  [(_PASLock *)lock runWithLockAcquired:v8];
  LODWORD(lock) = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  return (int)lock;
}

- (double)ratio:(double)a3 over:(double)a4
{
  return a3 * a4 / ((*(double *)&kLaunchThreshold + a4) * (*(double *)&kLaunchThreshold + a4));
}

- (double)launchPopularityWithBundleId:(id)a3 date:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    unsigned __int16 v8 = [(_ATXAppLaunchHistogram *)self _localTimeWithDate:v7];
    unsigned __int16 v9 = [(_ATXAppLaunchHistogram *)self _eventIdforBundleId:v6];
    uint64_t v17 = 0;
    unsigned __int16 v18 = (double *)&v17;
    uint64_t v19 = 0x2020000000;
    uint64_t v20 = 0;
    lock = self->_lock;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __60___ATXAppLaunchHistogram_launchPopularityWithBundleId_date___block_invoke;
    v14[3] = &unk_1E68AFF08;
    v14[4] = self;
    v14[5] = &v17;
    unsigned __int16 v15 = v9;
    unsigned __int16 v16 = v8;
    [(_PASLock *)lock runWithLockAcquired:v14];
    double v11 = v18[3];
    _Block_object_dispose(&v17, 8);
  }
  else
  {
    id v12 = __atxlog_handle_default();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[_ATXAppLaunchHistogram launchPopularityWithBundleId:date:]();
    }

    double v11 = 0.0;
  }

  return v11;
}

- (double)relativeLaunchPopularityWithBundleId:(id)a3 date:(id)a4
{
  LODWORD(v4) = 1.0;
  [(_ATXAppLaunchHistogram *)self relativeLaunchPopularityWithBundleId:a3 date:a4 distanceScale:v4];
  return result;
}

- (double)relativeLaunchPopularityWithBundleId:(id)a3 date:(id)a4 distanceScale:(float)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    unsigned __int16 v10 = [(_ATXAppLaunchHistogram *)self _localTimeWithDate:v9];
    unsigned __int16 v11 = [(_ATXAppLaunchHistogram *)self _eventIdforBundleId:v8];
    uint64_t v20 = 0;
    uint64_t v21 = (double *)&v20;
    uint64_t v22 = 0x2020000000;
    uint64_t v23 = 0;
    lock = self->_lock;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __82___ATXAppLaunchHistogram_relativeLaunchPopularityWithBundleId_date_distanceScale___block_invoke;
    v16[3] = &unk_1E68AFF30;
    void v16[4] = self;
    v16[5] = &v20;
    unsigned __int16 v18 = v11;
    unsigned __int16 v19 = v10;
    float v17 = a5;
    [(_PASLock *)lock runWithLockAcquired:v16];
    double v13 = v21[3];
    _Block_object_dispose(&v20, 8);
  }
  else
  {
    int v14 = __atxlog_handle_default();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[_ATXAppLaunchHistogram relativeLaunchPopularityWithBundleId:date:distanceScale:]();
    }

    double v13 = 0.0;
  }

  return v13;
}

- (double)relativeLaunchPopularityWithBundleId:(id)a3 elapsedTime:(double)a4 distanceScale:(float)a5
{
  id v8 = a3;
  if (v8)
  {
    int64_t v9 = (int)a4 % self->_timeBase / self->_secondsPerLocaltimeInterval;
    unsigned __int16 v10 = [(_ATXAppLaunchHistogram *)self _eventIdforBundleId:v8];
    uint64_t v19 = 0;
    uint64_t v20 = (double *)&v19;
    uint64_t v21 = 0x2020000000;
    uint64_t v22 = 0;
    lock = self->_lock;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __89___ATXAppLaunchHistogram_relativeLaunchPopularityWithBundleId_elapsedTime_distanceScale___block_invoke;
    v15[3] = &unk_1E68AFF30;
    v15[4] = self;
    v15[5] = &v19;
    unsigned __int16 v17 = v10;
    __int16 v18 = v9;
    float v16 = a5;
    [(_PASLock *)lock runWithLockAcquired:v15];
    double v12 = v20[3];
    _Block_object_dispose(&v19, 8);
  }
  else
  {
    double v13 = __atxlog_handle_default();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[_ATXAppLaunchHistogram relativeLaunchPopularityWithBundleId:elapsedTime:distanceScale:]();
    }

    double v12 = 0.0;
  }

  return v12;
}

- (double)totalTimeOfDayLaunchesForDate:(id)a3 distanceScale:(float)a4
{
  id v6 = a3;
  unsigned __int16 v7 = [(_ATXAppLaunchHistogram *)self _localTimeWithDate:v6];
  uint64_t v14 = 0;
  unsigned __int16 v15 = (double *)&v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70___ATXAppLaunchHistogram_totalTimeOfDayLaunchesForDate_distanceScale___block_invoke;
  v11[3] = &unk_1E68AFF58;
  void v11[4] = &v14;
  unsigned __int16 v13 = v7;
  float v12 = a4;
  [(_PASLock *)lock runWithLockAcquired:v11];
  double v9 = v15[3];
  _Block_object_dispose(&v14, 8);

  return v9;
}

- (double)totalTimeOfDayLaunchesForDate:(id)a3
{
  LODWORD(v3) = 1.0;
  [(_ATXAppLaunchHistogram *)self totalTimeOfDayLaunchesForDate:a3 distanceScale:v3];
  return result;
}

- (double)totalTimeOfDayLaunchesForElapsedTime:(double)a3 distanceScale:(float)a4
{
  uint64_t v12 = 0;
  unsigned __int16 v13 = (double *)&v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  uint64_t v4 = (int)a3 % self->_timeBase;
  int64_t secondsPerLocaltimeInterval = self->_secondsPerLocaltimeInterval;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __77___ATXAppLaunchHistogram_totalTimeOfDayLaunchesForElapsedTime_distanceScale___block_invoke;
  v9[3] = &unk_1E68AFF58;
  v9[4] = &v12;
  __int16 v11 = v4 / secondsPerLocaltimeInterval;
  float v10 = a4;
  [(_PASLock *)lock runWithLockAcquired:v9];
  double v7 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v7;
}

- (double)totalTimeOfDayLaunchesForElapsedTime:(double)a3
{
  LODWORD(v3) = 1.0;
  [(_ATXAppLaunchHistogram *)self totalTimeOfDayLaunchesForElapsedTime:a3 distanceScale:v3];
  return result;
}

- (double)overallLaunchPopularityForBundleId:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    unsigned __int16 v5 = [(_ATXAppLaunchHistogram *)self _eventIdforBundleId:v4];
    uint64_t v12 = 0;
    unsigned __int16 v13 = (double *)&v12;
    uint64_t v14 = 0x2020000000;
    uint64_t v15 = 0;
    lock = self->_lock;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __61___ATXAppLaunchHistogram_overallLaunchPopularityForBundleId___block_invoke;
    v10[3] = &unk_1E68AFF80;
    v10[4] = self;
    v10[5] = &v12;
    unsigned __int16 v11 = v5;
    [(_PASLock *)lock runWithLockAcquired:v10];
    double v7 = v13[3];
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v8 = __atxlog_handle_default();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[_ATXAppLaunchHistogram overallLaunchPopularityForBundleId:]();
    }

    double v7 = 0.0;
  }

  return v7;
}

- (double)totalLaunches
{
  uint64_t v6 = 0;
  double v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39___ATXAppLaunchHistogram_totalLaunches__block_invoke;
  v5[3] = &unk_1E68AFFA8;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (double)averageLaunchesPerBundleId:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    [(_ATXAppLaunchHistogram *)self totalLaunchesForBundleIds:v4];
    double v6 = v5 / (double)(unint64_t)[v4 count];
  }
  else
  {
    double v6 = 0.0;
  }

  return v6;
}

- (double)totalLaunchesForBundleIds:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = (double *)&v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52___ATXAppLaunchHistogram_totalLaunchesForBundleIds___block_invoke;
  v9[3] = &unk_1E68AFFD0;
  id v6 = v4;
  id v10 = v6;
  unsigned __int16 v11 = self;
  uint64_t v12 = &v13;
  [(_PASLock *)lock runWithLockAcquired:v9];
  double v7 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (double)totalLaunchesForBundleIds:(id)a3 forDate:(id)a4 distanceScale:(float)a5
{
  id v8 = a3;
  id v9 = a4;
  unsigned __int16 v10 = [(_ATXAppLaunchHistogram *)self _localTimeWithDate:v9];
  uint64_t v21 = 0;
  uint64_t v22 = (double *)&v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  lock = self->_lock;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __74___ATXAppLaunchHistogram_totalLaunchesForBundleIds_forDate_distanceScale___block_invoke;
  v15[3] = &unk_1E68AFFF8;
  id v12 = v8;
  id v16 = v12;
  uint64_t v17 = self;
  __int16 v18 = &v21;
  unsigned __int16 v20 = v10;
  float v19 = a5;
  [(_PASLock *)lock runWithLockAcquired:v15];
  double v13 = v22[3];

  _Block_object_dispose(&v21, 8);
  return v13;
}

- (double)unsmoothedLaunchesForBundleIds:(id)a3 forLocalTime:(unsigned __int16)a4
{
  id v6 = a3;
  uint64_t v16 = 0;
  uint64_t v17 = (double *)&v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70___ATXAppLaunchHistogram_unsmoothedLaunchesForBundleIds_forLocalTime___block_invoke;
  v11[3] = &unk_1E68B0020;
  id v8 = v6;
  id v12 = v8;
  double v13 = self;
  uint64_t v14 = &v16;
  unsigned __int16 v15 = a4;
  [(_PASLock *)lock runWithLockAcquired:v11];
  double v9 = v17[3];

  _Block_object_dispose(&v16, 8);
  return v9;
}

- (BOOL)bundleHasBeenLaunched:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    unsigned __int16 v6 = [(_ATXAppLaunchHistogram *)self _eventIdforBundleId:v5];
    uint64_t v13 = 0;
    uint64_t v14 = (double *)&v13;
    uint64_t v15 = 0x2020000000;
    uint64_t v16 = 0;
    lock = self->_lock;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __48___ATXAppLaunchHistogram_bundleHasBeenLaunched___block_invoke;
    v11[3] = &unk_1E68B0048;
    void v11[4] = &v13;
    unsigned __int16 v12 = v6;
    [(_PASLock *)lock runWithLockAcquired:v11];
    BOOL v8 = v14[3] > 0.0;
    _Block_object_dispose(&v13, 8);
  }
  else
  {
    double v9 = __atxlog_handle_default();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[_ATXAppLaunchHistogram _addLaunchWithBundleId:date:timeZone:arbitraryWeight:](a2);
    }

    BOOL v8 = 0;
  }

  return v8;
}

- (void)decayByFactor:(double)a3
{
  lock = self->_lock;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40___ATXAppLaunchHistogram_decayByFactor___block_invoke;
  v4[3] = &__block_descriptor_40_e28_v16__0__ATXGuardedHistData_8l;
  *(double *)&v4[4] = a3;
  [(_PASLock *)lock runWithLockAcquired:v4];
}

- (void)decayWithHalfLifeInDays:(double)a3
{
  lock = self->_lock;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50___ATXAppLaunchHistogram_decayWithHalfLifeInDays___block_invoke;
  v4[3] = &__block_descriptor_40_e28_v16__0__ATXGuardedHistData_8l;
  *(double *)&v4[4] = a3;
  [(_PASLock *)lock runWithLockAcquired:v4];
}

- (void)resetData
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_ATXAppLaunchHistogram)initWithCoder:(id)a3
{
  uint64_t v4 = 86400;
  id v5 = a3;
  if ([v5 containsValueForKey:@"timeBase"])
  {
    uint64_t v6 = [v5 decodeInt32ForKey:@"timeBase"];
    int v7 = v6;
    if ((int)v6 <= 0)
    {
      BOOL v8 = __atxlog_handle_default();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        -[_ATXAppLaunchHistogram initWithCoder:].cold.6(v7, v8);
      }
    }
    else
    {
      uint64_t v4 = v6;
    }
  }
  double v9 = [v5 error];

  if (!v9)
  {
    unsigned __int16 v10 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"histogram"];
    if (v10)
    {
      unsigned __int16 v12 = [[ATXHistogramData alloc] initWithTimeHistogram:v10];
      uint64_t v13 = (void *)MEMORY[0x1D25F6CC0]();
      id v14 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      uint64_t v15 = objc_opt_class();
      uint64_t v16 = objc_opt_class();
      uint64_t v17 = objc_msgSend(v14, "initWithObjects:", v15, v16, objc_opt_class(), 0);
      uint64_t v18 = [v5 decodeObjectOfClasses:v17 forKey:@"bundleIdToEventId"];

      if (v18)
      {
        uint64_t v19 = +[ATXHistogramBundleIdTable sharedInstance];
        unsigned __int16 v20 = [v19 permutationFrom:v18];
        [(ATXHistogramData *)v12 applyPermutationToA:v20];

        self = [(_ATXAppLaunchHistogram *)self initWithHistogram:v12 bucketCount:[v10 pointsPerTimeInterval] filter:[v10 applyFilter] timeBase:v4];
        unsigned __int16 v11 = self;
      }
      else
      {
        uint64_t v25 = __atxlog_handle_default();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
          -[_ATXAppLaunchHistogram initWithCoder:].cold.4(v5);
        }

        unsigned __int16 v11 = 0;
      }

      goto LABEL_26;
    }
    unsigned __int16 v12 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"histogramData"];
    uint64_t v21 = [v5 error];

    if (v21 || !v12)
    {
      uint64_t v24 = __atxlog_handle_default();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
        -[_ATXAppLaunchHistogram initWithCoder:](v5);
      }
    }
    else
    {
      unsigned __int16 v22 = [v5 decodeInt32ForKey:@"bucketCount"];
      uint64_t v23 = [v5 error];

      if (v23)
      {
        uint64_t v24 = __atxlog_handle_default();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
          -[_ATXAppLaunchHistogram initWithCoder:](v5);
        }
      }
      else
      {
        uint64_t v27 = [v5 decodeBoolForKey:@"filter"];
        uint64_t v28 = [v5 error];

        if (!v28)
        {
          self = [(_ATXAppLaunchHistogram *)self initWithHistogram:v12 bucketCount:v22 filter:v27 timeBase:v4];
          unsigned __int16 v11 = self;
          goto LABEL_26;
        }
        uint64_t v24 = __atxlog_handle_default();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
          -[_ATXAppLaunchHistogram initWithCoder:](v5);
        }
      }
    }

    unsigned __int16 v11 = 0;
LABEL_26:

    goto LABEL_27;
  }
  unsigned __int16 v10 = __atxlog_handle_default();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
    -[_ATXAppLaunchHistogram initWithCoder:].cold.5(v5);
  }
  unsigned __int16 v11 = 0;
LABEL_27:

  return v11;
}

- (NSString)description
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x3032000000;
  double v9 = __Block_byref_object_copy__41;
  unsigned __int16 v10 = __Block_byref_object_dispose__41;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37___ATXAppLaunchHistogram_description__block_invoke;
  v5[3] = &unk_1E68AFFA8;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (double)entropyForBundleId:(id)a3
{
  id v4 = a3;
  unsigned __int16 v5 = [(_ATXAppLaunchHistogram *)self _eventIdforBundleId:v4];
  uint64_t v11 = 0;
  unsigned __int16 v12 = (double *)&v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45___ATXAppLaunchHistogram_entropyForBundleId___block_invoke;
  v9[3] = &unk_1E68B0048;
  void v9[4] = &v11;
  unsigned __int16 v10 = v5;
  [(_PASLock *)lock runWithLockAcquired:v9];
  double v7 = v12[3];
  _Block_object_dispose(&v11, 8);

  return v7;
}

- (double)entropyForDate:(id)a3
{
  id v4 = a3;
  unsigned __int16 v5 = [(_ATXAppLaunchHistogram *)self _localTimeWithDate:v4];
  uint64_t v11 = 0;
  unsigned __int16 v12 = (double *)&v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __41___ATXAppLaunchHistogram_entropyForDate___block_invoke;
  v9[3] = &unk_1E68B0048;
  void v9[4] = &v11;
  unsigned __int16 v10 = v5;
  [(_PASLock *)lock runWithLockAcquired:v9];
  double v7 = v12[3];
  _Block_object_dispose(&v11, 8);

  return v7;
}

- (double)entropy
{
  uint64_t v6 = 0;
  double v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33___ATXAppLaunchHistogram_entropy__block_invoke;
  v5[3] = &unk_1E68AFFA8;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unsigned)bucketCount
{
  uint64_t v6 = 0;
  double v7 = &v6;
  uint64_t v8 = 0x2020000000;
  __int16 v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37___ATXAppLaunchHistogram_bucketCount__block_invoke;
  v5[3] = &unk_1E68AFFA8;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  unsigned __int16 v3 = *((_WORD *)v7 + 12);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prevTimeZone, 0);
  objc_storeStrong((id *)&self->_prevDate, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_uninstallNotificationListener, 0);
}

- (void)initWithType:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.9(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.10(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.11(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.12(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.13(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.14(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.15(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.16(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.17(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.18(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.19(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.20(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.21(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.22(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.23(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:.cold.24()
{
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_ERROR, "_APRHistogramTypeAppIntentDonation is deprecated.", v1, 2u);
}

- (void)initWithType:(uint64_t)a3 .cold.25(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.26(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.27(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.28(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.29(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.30(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.31(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.32(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.33(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.34(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.35(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.36(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.37(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.38(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.39(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.40(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.41(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.42(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.43(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.44(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.45(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.46(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.47(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.48(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.49(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.50(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.51(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.52(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.53(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.54(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.55(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.56(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.57(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.58(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.59(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.60(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.61(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.62(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.63(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.64(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.65(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.66(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.67(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.68(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.69(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.70(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.71(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.72(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.73(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.74(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.75(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.76(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.77(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 .cold.78(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_addLaunchWithBundleId:(const char *)a1 date:timeZone:arbitraryWeight:.cold.1(const char *a1)
{
  sel_getName(a1);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_1D0FA3000, v1, v2, "Bundle id can not be nil in %s", v3, v4, v5, v6, v7);
}

- (void)addLaunchWithBundleId:(os_log_t)log date:(float)a2 timeZone:weight:.cold.1(os_log_t log, float a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  double v3 = a2;
  _os_log_debug_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_DEBUG, "Attempt to update histogram with unexpected weight %f", (uint8_t *)&v2, 0xCu);
}

- (void)launchPopularityWithBundleId:date:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "launchPopularityWithBundleId:date: called with nil bundle identifier. Returning 0", v2, v3, v4, v5, v6);
}

- (void)relativeLaunchPopularityWithBundleId:date:distanceScale:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "relativeLaunchPopularityWithBundleId:date:distanceScale: called with nil bundle identifier. Returning 0", v2, v3, v4, v5, v6);
}

- (void)relativeLaunchPopularityWithBundleId:elapsedTime:distanceScale:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "relativeLaunchPopularityWithBundleId:elapsedTime:distanceScale: called with nil bundle identifier. Returning 0", v2, v3, v4, v5, v6);
}

- (void)overallLaunchPopularityForBundleId:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "overallLaunchPopularityForBundleId: called with nil bundle identifier. Returning 0", v2, v3, v4, v5, v6);
}

- (void)initWithCoder:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 error];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0FA3000, v2, v3, "Could not decode histogram from NSCoder, error: %@", v4, v5, v6, v7, v8);
}

- (void)initWithCoder:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1 = [a1 error];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0FA3000, v2, v3, "Could not decode filter from NSCoder, error: %@", v4, v5, v6, v7, v8);
}

- (void)initWithCoder:(void *)a1 .cold.3(void *a1)
{
  uint64_t v1 = [a1 error];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0FA3000, v2, v3, "Could not decode bucketCount from NSCoder, error: %@", v4, v5, v6, v7, v8);
}

- (void)initWithCoder:(void *)a1 .cold.4(void *a1)
{
  uint64_t v1 = [a1 error];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0FA3000, v2, v3, "Could not decode bundleIdToEventId from NSCoder, error: %@", v4, v5, v6, v7, v8);
}

- (void)initWithCoder:(void *)a1 .cold.5(void *a1)
{
  uint64_t v1 = [a1 error];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0FA3000, v2, v3, "Could not decode timeBase from NSCoder, error: %@", v4, v5, v6, v7, v8);
}

- (void)initWithCoder:(int)a1 .cold.6(int a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109376;
  v2[1] = a1;
  __int16 v3 = 1024;
  int v4 = 86400;
  _os_log_fault_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_FAULT, "timeBase is an invalid value: %d. Falling back to the default histogram time base of %d.", (uint8_t *)v2, 0xEu);
}

@end
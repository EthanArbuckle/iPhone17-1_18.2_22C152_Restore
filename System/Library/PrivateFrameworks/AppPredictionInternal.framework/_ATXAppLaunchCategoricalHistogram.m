@interface _ATXAppLaunchCategoricalHistogram
+ (BOOL)supportsSecureCoding;
+ (id)stringForPruningMethod:(int64_t)a3;
- (BOOL)_tryGetCategoryIdforCategory:(id)a3 createIfMissing:(BOOL)a4 categoryIdOut:(unsigned __int16 *)a5;
- (BOOL)_tryGetEventIdforBundleId:(id)a3 createIfMissing:(BOOL)a4 eventIdOut:(unsigned __int16 *)a5;
- (BOOL)bundleHasBeenLaunched:(id)a3;
- (BOOL)removeHistoryForBundleId:(id)a3;
- (BOOL)removeHistoryForCategory:(id)a3;
- (_ATXAppLaunchCategoricalHistogram)initWithCoder:(id)a3;
- (_ATXAppLaunchCategoricalHistogram)initWithHistogram:(id)a3 categoryToCategoryId:(id)a4 maxCategoryId:(unsigned __int16)a5 maxCategoryCount:(unsigned __int16)a6 lastDates:(id)a7 pruningMethod:(int64_t)a8;
- (_ATXAppLaunchCategoricalHistogram)initWithType:(int64_t)a3;
- (_ATXAppLaunchCategoricalHistogram)initWithType:(int64_t)a3 maxCategoryCount:(unsigned __int16)a4 pruningMethod:(int64_t)a5;
- (double)entropy;
- (double)entropyForBundleId:(id)a3;
- (double)entropyForCategory:(id)a3;
- (double)launchPopularityWithBundleId:(id)a3 category:(id)a4;
- (double)overallLaunchPopularityForBundleId:(id)a3;
- (double)overallLaunchPopularityForBundleId:(id)a3 category:(id)a4;
- (double)overallLaunchPopularityForCategory:(id)a3;
- (double)ratio:(double)a3 over:(double)a4;
- (double)relativeLaunchPopularityWithBundleId:(id)a3 category:(id)a4;
- (double)totalLaunches;
- (double)totalLaunchesForBundleId:(id)a3;
- (double)totalLaunchesForBundleId:(id)a3 category:(id)a4;
- (double)totalLaunchesForCategory:(id)a3;
- (id)description;
- (id)lastDate;
- (id)launchCountsForEachCategoryForBundleId:(id)a3;
- (int)removeHistoryForBundleIds:(id)a3;
- (int64_t)pruningMethod;
- (unsigned)_categoryIdforCategory:(id)a3;
- (unsigned)_eventIdforBundleId:(id)a3;
- (unsigned)categoryCount;
- (unsigned)maxCategoryCount;
- (void)_garbageCollectCategoryIds;
- (void)_reduceCategoryCountTo:(unsigned __int16)a3;
- (void)_removeMappingForCategory:(id)a3;
- (void)_setMaxCategoryCount:(unsigned __int16)a3 pruningMethod:(int64_t)a4;
- (void)addLaunchWithBundleId:(id)a3 date:(id)a4 category:(id)a5;
- (void)addLaunchWithBundleId:(id)a3 date:(id)a4 category:(id)a5 weight:(float)a6;
- (void)decayByFactor:(double)a3;
- (void)decayWithHalfLifeInDays:(double)a3;
- (void)encodeWithCoder:(id)a3;
- (void)resetData;
- (void)resetHistogram:(id)a3;
- (void)verifyDataIntegrity;
@end

@implementation _ATXAppLaunchCategoricalHistogram

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  [v5 encodeObject:v4->_histogramData forKey:@"histogramData"];
  [v5 encodeObject:v4->_categoryToCategoryId forKey:@"categoryToCategoryId"];
  [v5 encodeInt32:v4->_maxCategoryId forKey:@"maxCategoryId"];
  [v5 encodeObject:v4->_lastDates forKey:@"lastDates"];
  [v5 encodeInt32:v4->_maxCategoryCount forKey:@"maxCategoryCount"];
  [v5 encodeInteger:v4->_pruningMethod forKey:@"pruningMethod"];
  objc_sync_exit(v4);
}

+ (id)stringForPruningMethod:(int64_t)a3
{
  if ((unint64_t)a3 >= 3)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"_ATXAppLaunchCategoricalHistogram.m", 62, @"Invalid parameter not satisfying: %@", @"pruningMethod >= 0 && pruningMethod < _ATXAppLaunchCategoricalHistogramPruningMethodMax" object file lineNumber description];
  }
  if ((unint64_t)a3 < 4) {
    return off_1E68B5038[a3];
  }
  id v5 = __atxlog_handle_default();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    +[_ATXAppLaunchCategoricalHistogram stringForPruningMethod:]();
  }

  objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"stringForPruningMethod called with invalid _ATXAppLaunchCategoricalHistogramPruningMethod value of %lu", a3);
  return @"Error";
}

- (_ATXAppLaunchCategoricalHistogram)initWithHistogram:(id)a3 categoryToCategoryId:(id)a4 maxCategoryId:(unsigned __int16)a5 maxCategoryCount:(unsigned __int16)a6 lastDates:(id)a7 pruningMethod:(int64_t)a8
{
  uint64_t v10 = a6;
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  v39.receiver = self;
  v39.super_class = (Class)_ATXAppLaunchCategoricalHistogram;
  v18 = [(_ATXAppLaunchCategoricalHistogram *)&v39 init];
  if (v18)
  {
    if (v15) {
      v19 = (ATXHistogramData *)v15;
    }
    else {
      v19 = (ATXHistogramData *)objc_opt_new();
    }
    histogramData = v18->_histogramData;
    v18->_histogramData = v19;

    v18->_maxCategoryId = a5;
    v21 = (void *)[v16 mutableCopy];
    v22 = v21;
    if (v21) {
      v23 = v21;
    }
    else {
      v23 = (NSMutableDictionary *)objc_opt_new();
    }
    categoryToCategoryId = v18->_categoryToCategoryId;
    v18->_categoryToCategoryId = v23;

    [(_ATXAppLaunchCategoricalHistogram *)v18 _setMaxCategoryCount:v10 pruningMethod:a8];
    v25 = (void *)[v17 mutableCopy];
    v26 = v25;
    if (v25) {
      v27 = v25;
    }
    else {
      v27 = (NSMutableDictionary *)objc_opt_new();
    }
    lastDates = v18->_lastDates;
    v18->_lastDates = v27;

    objc_initWeak(&location, v18);
    uint64_t v29 = objc_opt_new();
    uninstallNotificationListener = v18->_uninstallNotificationListener;
    v18->_uninstallNotificationListener = (_ATXInternalUninstallNotification *)v29;

    v31 = v18->_uninstallNotificationListener;
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __131___ATXAppLaunchCategoricalHistogram_initWithHistogram_categoryToCategoryId_maxCategoryId_maxCategoryCount_lastDates_pruningMethod___block_invoke;
    v36[3] = &unk_1E68AB9D8;
    objc_copyWeak(&v37, &location);
    [(_ATXInternalUninstallNotification *)v31 registerForNotificationsWithUninstallBlock:v36];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __131___ATXAppLaunchCategoricalHistogram_initWithHistogram_categoryToCategoryId_maxCategoryId_maxCategoryCount_lastDates_pruningMethod___block_invoke_2;
    v33[3] = &unk_1E68ACD10;
    SEL v35 = a2;
    v34 = v18;
    if (initWithHistogram_categoryToCategoryId_maxCategoryId_maxCategoryCount_lastDates_pruningMethod__onceToken != -1) {
      dispatch_once(&initWithHistogram_categoryToCategoryId_maxCategoryId_maxCategoryCount_lastDates_pruningMethod__onceToken, v33);
    }

    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);
  }

  return v18;
}

- (void)_setMaxCategoryCount:(unsigned __int16)a3 pruningMethod:(int64_t)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v6 = __atxlog_handle_default();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v11 = 134218240;
      int64_t v12 = 0;
      __int16 v13 = 2048;
      uint64_t v14 = 30;
      _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_INFO, "maxCategoryCount of %lu -- using default of %lu", (uint8_t *)&v11, 0x16u);
    }

    a3 = 30;
  }
  self->_maxCategoryCount = a3;
  v7 = __atxlog_handle_default();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[_ATXAppLaunchCategoricalHistogram _setMaxCategoryCount:pruningMethod:](&self->_maxCategoryCount, v7);
  }

  if ((unint64_t)(a4 - 1) >= 2)
  {
    v8 = __atxlog_handle_default();
    v9 = v8;
    if (a4 < 1)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v11 = 134218240;
        int64_t v12 = a4;
        __int16 v13 = 2048;
        uint64_t v14 = 1;
        _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_INFO, "_pruningMethod of %lu -- using default of %lu", (uint8_t *)&v11, 0x16u);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[_ATXAppLaunchCategoricalHistogram _setMaxCategoryCount:pruningMethod:]();
    }

    a4 = 1;
  }
  self->_pruningMethod = a4;
  uint64_t v10 = __atxlog_handle_default();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[_ATXAppLaunchCategoricalHistogram _setMaxCategoryCount:pruningMethod:](&self->_pruningMethod, (uint64_t)self, v10);
  }
}

- (_ATXAppLaunchCategoricalHistogram)initWithType:(int64_t)a3 maxCategoryCount:(unsigned __int16)a4 pruningMethod:(int64_t)a5
{
  switch(a3)
  {
    case 0:
      v19 = __atxlog_handle_default();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:](v19, v20, v21, v22, v23, v24, v25, v26);
      }

      v27 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v28 = *MEMORY[0x1E4F1C3B8];
      uint64_t v29 = @"_ATXHistogramTypeAnyLaunch";
      goto LABEL_91;
    case 1:
      v30 = __atxlog_handle_default();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:].cold.4(v30, v31, v32, v33, v34, v35, v36, v37);
      }

      v27 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v28 = *MEMORY[0x1E4F1C3B8];
      uint64_t v29 = @"_ATXHistogramTypeSpotlightLaunch";
      goto LABEL_91;
    case 2:
      v38 = __atxlog_handle_default();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:](v38, v39, v40, v41, v42, v43, v44, v45);
      }

      v27 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v28 = *MEMORY[0x1E4F1C3B8];
      uint64_t v29 = @"_ATXHistogramTypeDayOfWeek";
      goto LABEL_91;
    case 3:
      v46 = __atxlog_handle_default();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:].cold.7(v46, v47, v48, v49, v50, v51, v52, v53);
      }

      v27 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v28 = *MEMORY[0x1E4F1C3B8];
      uint64_t v29 = @"_ATXHistogramTypeAirplaneModeLaunch";
      goto LABEL_91;
    case 4:
    case 29:
    case 31:
    case 32:
    case 33:
    case 34:
    case 37:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 52:
    case 53:
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
    case 60:
    case 61:
    case 62:
    case 63:
    case 64:
    case 65:
    case 66:
    case 67:
    case 68:
    case 69:
    case 70:
    case 71:
    case 72:
    case 73:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 79:
    case 80:
    case 81:
    case 82:
    case 83:
    case 84:
    case 85:
    case 86:
    case 87:
    case 88:
    case 89:
    case 94:
    case 95:
    case 96:
    case 97:
    case 98:
      uint64_t v8 = a4;
      v9 = objc_opt_new();
      self = [(_ATXAppLaunchCategoricalHistogram *)self initWithHistogram:v9 categoryToCategoryId:0 maxCategoryId:0 maxCategoryCount:v8 lastDates:0 pruningMethod:a5];

      uint64_t v10 = self;
      goto LABEL_94;
    case 5:
      v54 = __atxlog_handle_default();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:].cold.8(v54, v55, v56, v57, v58, v59, v60, v61);
      }

      v27 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v28 = *MEMORY[0x1E4F1C3B8];
      uint64_t v29 = @"_ATXHistogramTypeTrendingLaunch";
      goto LABEL_91;
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 12:
    case 13:
      int v11 = __atxlog_handle_default();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:]3(v11, v12, v13, v14, v15, v16, v17, v18);
      }

      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"%@ is deprecated.", @"Histogram type is deprecated." format];
      goto LABEL_92;
    case 11:
      v62 = __atxlog_handle_default();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:](v62, v63, v64, v65, v66, v67, v68, v69);
      }

      v27 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v28 = *MEMORY[0x1E4F1C3B8];
      uint64_t v29 = @"_ATXHistogramTypeUnlockTime";
      goto LABEL_91;
    case 14:
      v70 = __atxlog_handle_default();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:].cold.9(v70, v71, v72, v73, v74, v75, v76, v77);
      }

      v27 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v28 = *MEMORY[0x1E4F1C3B8];
      uint64_t v29 = @"_ATXHistogramTypeAppIntentLaunch";
      goto LABEL_91;
    case 15:
      v78 = __atxlog_handle_default();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:]4(v78, v79, v80, v81, v82, v83, v84, v85);
      }

      v86 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v87 = *MEMORY[0x1E4F1C3B8];
      v88 = @"_ATXHistogramTypeIntentForAllAppsLaunch";
      goto LABEL_72;
    case 16:
      v89 = __atxlog_handle_default();
      if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:]0(v89, v90, v91, v92, v93, v94, v95, v96);
      }

      v27 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v28 = *MEMORY[0x1E4F1C3B8];
      uint64_t v29 = @"_ATXHistogramTypeAppForAllIntentsLaunch";
      goto LABEL_91;
    case 17:
      v97 = __atxlog_handle_default();
      if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:]1(v97, v98, v99, v100, v101, v102, v103, v104);
      }

      v27 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v28 = *MEMORY[0x1E4F1C3B8];
      uint64_t v29 = @"_ATXHistogramTypeAppIntentDayOfWeek";
      goto LABEL_91;
    case 18:
      v105 = __atxlog_handle_default();
      if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:]5(v105, v106, v107, v108, v109, v110, v111, v112);
      }

      v86 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v87 = *MEMORY[0x1E4F1C3B8];
      v88 = @"_ATXHistogramTypeIntentForAllAppsDayOfWeek";
      goto LABEL_72;
    case 19:
      v113 = __atxlog_handle_default();
      if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:]2(v113, v114, v115, v116, v117, v118, v119, v120);
      }

      v27 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v28 = *MEMORY[0x1E4F1C3B8];
      uint64_t v29 = @"_ATXHistogramTypeAppForAllIntentsDayOfWeek";
      goto LABEL_91;
    case 20:
      v121 = __atxlog_handle_default();
      if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:]5(v121, v122, v123, v124, v125, v126, v127, v128);
      }

      v27 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v28 = *MEMORY[0x1E4F1C3B8];
      uint64_t v29 = @"_ATXHistogramTypeAppIntentTrendingLaunch";
      goto LABEL_91;
    case 21:
      v129 = __atxlog_handle_default();
      if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:]6(v129, v130, v131, v132, v133, v134, v135, v136);
      }

      v86 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v87 = *MEMORY[0x1E4F1C3B8];
      v88 = @"_ATXHistogramTypeIntentForAllAppsTrendingLaunch";
      goto LABEL_72;
    case 22:
      v137 = __atxlog_handle_default();
      if (os_log_type_enabled(v137, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:]6(v137, v138, v139, v140, v141, v142, v143, v144);
      }

      v27 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v28 = *MEMORY[0x1E4F1C3B8];
      uint64_t v29 = @"_ATXHistogramTypeAppForAllIntentsTrendingLaunch";
      goto LABEL_91;
    case 23:
      v145 = __atxlog_handle_default();
      if (os_log_type_enabled(v145, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:]7(v145, v146, v147, v148, v149, v150, v151, v152);
      }

      v27 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v28 = *MEMORY[0x1E4F1C3B8];
      uint64_t v29 = @"_ATXHistogramTypeAppIntentUnlockTime";
      goto LABEL_91;
    case 24:
      v153 = __atxlog_handle_default();
      if (os_log_type_enabled(v153, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:]7(v153, v154, v155, v156, v157, v158, v159, v160);
      }

      v86 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v87 = *MEMORY[0x1E4F1C3B8];
      v88 = @"_ATXHistogramTypeIntentForAllAppsUnlockTime";
      goto LABEL_72;
    case 25:
      v161 = __atxlog_handle_default();
      if (os_log_type_enabled(v161, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:]8(v161, v162, v163, v164, v165, v166, v167, v168);
      }

      v27 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v28 = *MEMORY[0x1E4F1C3B8];
      uint64_t v29 = @"_ATXHistogramTypeAppForAllIntentsUnlockTime";
      goto LABEL_91;
    case 26:
      v169 = __atxlog_handle_default();
      if (os_log_type_enabled(v169, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:]3(v169, v170, v171, v172, v173, v174, v175, v176);
      }

      v27 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v28 = *MEMORY[0x1E4F1C3B8];
      uint64_t v29 = @"_ATXHistogramTypeAppIntentAirplaneModeLaunch";
      goto LABEL_91;
    case 27:
      v177 = __atxlog_handle_default();
      if (os_log_type_enabled(v177, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:]8(v177, v178, v179, v180, v181, v182, v183, v184);
      }

      v86 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v87 = *MEMORY[0x1E4F1C3B8];
      v88 = @"_ATXHistogramTypeIntentForAllAppsAirplaneModeLaunch";
      goto LABEL_72;
    case 28:
      v185 = __atxlog_handle_default();
      if (os_log_type_enabled(v185, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:]4(v185, v186, v187, v188, v189, v190, v191, v192);
      }

      v27 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v28 = *MEMORY[0x1E4F1C3B8];
      uint64_t v29 = @"_ATXHistogramTypeAppForAllIntentsAirplaneModeLaunch";
      goto LABEL_91;
    case 30:
      v193 = __atxlog_handle_default();
      if (os_log_type_enabled(v193, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:]9(v193, v194, v195, v196, v197, v198, v199, v200);
      }

      v86 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v87 = *MEMORY[0x1E4F1C3B8];
      v88 = @"_ATXHistogramTypeIntentForAllAppsWifiLaunch";
LABEL_72:
      [v86 raise:v87, @"%@ is deprecated.", v88 format];
      goto LABEL_93;
    case 35:
      v201 = __atxlog_handle_default();
      if (os_log_type_enabled(v201, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:]9(v201, v202, v203, v204, v205, v206, v207, v208);
      }

      v27 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v28 = *MEMORY[0x1E4F1C3B8];
      uint64_t v29 = @"_ATXHistogramTypeActionsHeuristicConfirms";
      goto LABEL_91;
    case 36:
      v209 = __atxlog_handle_default();
      if (os_log_type_enabled(v209, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:]0(v209, v210, v211, v212, v213, v214, v215, v216);
      }

      v27 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v28 = *MEMORY[0x1E4F1C3B8];
      uint64_t v29 = @"_ATXHistogramTypeActionsHeuristicRejects";
      goto LABEL_91;
    case 90:
      v217 = __atxlog_handle_default();
      if (os_log_type_enabled(v217, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:]1(v217, v218, v219, v220, v221, v222, v223, v224);
      }

      v27 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v28 = *MEMORY[0x1E4F1C3B8];
      uint64_t v29 = @"_ATXHistogramTypeFallbackActionsConfirms";
      goto LABEL_91;
    case 91:
      v225 = __atxlog_handle_default();
      if (os_log_type_enabled(v225, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:]2(v225, v226, v227, v228, v229, v230, v231, v232);
      }

      v27 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v28 = *MEMORY[0x1E4F1C3B8];
      uint64_t v29 = @"_ATXHistogramTypeFallbackActionsRejects";
      goto LABEL_91;
    case 92:
      v233 = __atxlog_handle_default();
      if (os_log_type_enabled(v233, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:].cold.5(v233, v234, v235, v236, v237, v238, v239, v240);
      }

      v27 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v28 = *MEMORY[0x1E4F1C3B8];
      uint64_t v29 = @"_ATXHistogramTypeHomescreenAppLaunch";
      goto LABEL_91;
    case 93:
      v241 = __atxlog_handle_default();
      if (os_log_type_enabled(v241, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:].cold.6(v241, v242, v243, v244, v245, v246, v247, v248);
      }

      v27 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v28 = *MEMORY[0x1E4F1C3B8];
      uint64_t v29 = @"_ATXHistogramTypeAppDirectoryAppLaunch";
LABEL_91:
      [v27 raise:v28, @"%@ is not a valid type for _ATXAppLaunchCategoricalHistogram.  Use _ATXAppLaunchHistogram.", v29 format];
      goto LABEL_92;
    case 99:
      v251 = __atxlog_handle_default();
      if (os_log_type_enabled(v251, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:]0(v251, v252, v253, v254, v255, v256, v257, v258);
      }

      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"%@ is not a valid type for _ATXAppLaunchCategoricalHistogram.  Use _ATXAppLaunchHistogram.", @"_ATXHistogramTypeMax" format];
      goto LABEL_93;
    default:
LABEL_92:
      v249 = [MEMORY[0x1E4F28B00] currentHandler];
      [v249 handleFailureInMethod:a2 object:self file:@"_ATXAppLaunchCategoricalHistogram.m" lineNumber:324 description:@"Failed to initialize _ATXCategoricalHistogram due to invalid histogram type being specified"];

LABEL_93:
      uint64_t v10 = 0;
LABEL_94:

      return v10;
  }
}

- (_ATXAppLaunchCategoricalHistogram)initWithType:(int64_t)a3
{
  return [(_ATXAppLaunchCategoricalHistogram *)self initWithType:a3 maxCategoryCount:0 pruningMethod:0];
}

- (BOOL)_tryGetEventIdforBundleId:(id)a3 createIfMissing:(BOOL)a4 eventIdOut:(unsigned __int16 *)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  if (!a5)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"_ATXAppLaunchCategoricalHistogram.m", 342, @"Invalid parameter not satisfying: %@", @"eventId" object file lineNumber description];
  }
  uint64_t v10 = +[ATXHistogramBundleIdTable sharedInstance];
  int v11 = v10;
  if (v6)
  {
    *a5 = [v10 intern:v9];
  }
  else
  {
    int v12 = [v10 lookup:v9 into:a5];

    if ((v12 & 1) == 0)
    {
      BOOL v13 = 0;
      *a5 = -1;
      goto LABEL_8;
    }
  }
  BOOL v13 = 1;
LABEL_8:

  return v13;
}

- (BOOL)_tryGetCategoryIdforCategory:(id)a3 createIfMissing:(BOOL)a4 categoryIdOut:(unsigned __int16 *)a5
{
  BOOL v6 = a4;
  id v9 = (NSString *)a3;
  if (!a5)
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"_ATXAppLaunchCategoricalHistogram.m", 356, @"Invalid parameter not satisfying: %@", @"categoryId" object file lineNumber description];
  }
  uint64_t v10 = self;
  objc_sync_enter(v10);
  prevCategory = v10->_prevCategory;
  if (prevCategory == v9 || [(NSString *)prevCategory isEqualToString:v9])
  {
    *a5 = v10->_prevCategoryId;
  }
  else
  {
    int v12 = [(NSMutableDictionary *)v10->_categoryToCategoryId objectForKeyedSubscript:v9];

    if (v12)
    {
      BOOL v13 = [(NSMutableDictionary *)v10->_categoryToCategoryId objectForKeyedSubscript:v9];
      unsigned __int16 v14 = [v13 unsignedIntegerValue];
      v10->_prevCategoryId = v14;
      *a5 = v14;
    }
    else
    {
      if (!v6)
      {
        *a5 = -1;
        goto LABEL_11;
      }
      uint64_t maxCategoryId = v10->_maxCategoryId;
      v10->_uint64_t maxCategoryId = maxCategoryId + 1;
      uint64_t v16 = [NSNumber numberWithUnsignedInteger:maxCategoryId];
      [(NSMutableDictionary *)v10->_categoryToCategoryId setObject:v16 forKeyedSubscript:v9];

      v10->_prevCategoryId = maxCategoryId;
      *a5 = maxCategoryId;
    }
  }
  LOBYTE(v6) = 1;
LABEL_11:
  objc_sync_exit(v10);

  return v6;
}

- (void)addLaunchWithBundleId:(id)a3 date:(id)a4 category:(id)a5
{
  LODWORD(v5) = 1.0;
  [(_ATXAppLaunchCategoricalHistogram *)self addLaunchWithBundleId:a3 date:a4 category:a5 weight:v5];
}

- (void)addLaunchWithBundleId:(id)a3 date:(id)a4 category:(id)a5 weight:(float)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  unsigned __int16 v14 = v13;
  if (v11)
  {
    if (v13)
    {
      uint64_t v15 = self;
      objc_sync_enter(v15);
      unsigned __int16 v20 = 0;
      [(_ATXAppLaunchCategoricalHistogram *)v15 _tryGetEventIdforBundleId:v11 createIfMissing:1 eventIdOut:&v20];
      unsigned __int16 v19 = 0;
      [(_ATXAppLaunchCategoricalHistogram *)v15 _tryGetCategoryIdforCategory:v14 createIfMissing:1 categoryIdOut:&v19];
      *(float *)&double v16 = a6;
      [(ATXHistogramData *)v15->_histogramData add:v20 a:v19 b:v16];
      lastDates = v15->_lastDates;
      uint64_t v18 = [NSNumber numberWithUnsignedShort:v19];
      [(NSMutableDictionary *)lastDates setObject:v12 forKeyedSubscript:v18];

      [(_ATXAppLaunchCategoricalHistogram *)v15 _reduceCategoryCountTo:v15->_maxCategoryCount];
      objc_sync_exit(v15);
    }
    else
    {
      __atxlog_handle_default();
      uint64_t v15 = (_ATXAppLaunchCategoricalHistogram *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v15->super, OS_LOG_TYPE_DEBUG)) {
        -[_ATXAppLaunchCategoricalHistogram addLaunchWithBundleId:date:category:weight:](a2);
      }
    }
  }
  else
  {
    __atxlog_handle_default();
    uint64_t v15 = (_ATXAppLaunchCategoricalHistogram *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v15->super, OS_LOG_TYPE_DEBUG)) {
      -[_ATXAppLaunchHistogram _addLaunchWithBundleId:date:timeZone:arbitraryWeight:](a2);
    }
  }
}

- (void)resetHistogram:(id)a3
{
  v4 = (ATXHistogramData *)a3;
  obj = self;
  objc_sync_enter(obj);
  histogramData = obj->_histogramData;
  obj->_histogramData = v4;

  objc_sync_exit(obj);
}

- (void)_garbageCollectCategoryIds
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [(ATXHistogramData *)self->_histogramData bSet];
  v4 = objc_opt_new();
  categoryToCategoryId = self->_categoryToCategoryId;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __63___ATXAppLaunchCategoricalHistogram__garbageCollectCategoryIds__block_invoke;
  v17[3] = &unk_1E68B4FF0;
  id v6 = v3;
  id v18 = v6;
  id v7 = v4;
  id v19 = v7;
  [(NSMutableDictionary *)categoryToCategoryId enumerateKeysAndObjectsUsingBlock:v17];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        -[_ATXAppLaunchCategoricalHistogram _removeMappingForCategory:](self, "_removeMappingForCategory:", *(void *)(*((void *)&v13 + 1) + 8 * v12++), (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v20 count:16];
    }
    while (v10);
  }
}

- (BOOL)removeHistoryForBundleId:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = self;
    objc_sync_enter(v6);
    unsigned __int16 v9 = 0;
    BOOL v7 = [(_ATXAppLaunchCategoricalHistogram *)v6 _tryGetEventIdforBundleId:v5 createIfMissing:0 eventIdOut:&v9];
    if (v7)
    {
      [(ATXHistogramData *)v6->_histogramData deleteWhereA:v9 b:0xFFFFLL];
      [(_ATXAppLaunchCategoricalHistogram *)v6 _garbageCollectCategoryIds];
    }
    objc_sync_exit(v6);
  }
  else
  {
    __atxlog_handle_default();
    id v6 = (_ATXAppLaunchCategoricalHistogram *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_DEBUG)) {
      -[_ATXAppLaunchHistogram _addLaunchWithBundleId:date:timeZone:arbitraryWeight:](a2);
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)removeHistoryForCategory:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = self;
    objc_sync_enter(v6);
    unsigned __int16 v9 = 0;
    BOOL v7 = [(_ATXAppLaunchCategoricalHistogram *)v6 _tryGetCategoryIdforCategory:v5 createIfMissing:0 categoryIdOut:&v9];
    if (v7)
    {
      [(ATXHistogramData *)v6->_histogramData deleteWhereA:0xFFFFLL b:v9];
      [(_ATXAppLaunchCategoricalHistogram *)v6 _removeMappingForCategory:v5];
    }
    objc_sync_exit(v6);
  }
  else
  {
    __atxlog_handle_default();
    id v6 = (_ATXAppLaunchCategoricalHistogram *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_DEBUG)) {
      -[_ATXAppLaunchCategoricalHistogram addLaunchWithBundleId:date:category:weight:](a2);
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (int)removeHistoryForBundleIds:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  int v7 = 0;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        unsigned __int16 v13 = 0;
        if ([(_ATXAppLaunchCategoricalHistogram *)v5 _tryGetEventIdforBundleId:v11 createIfMissing:0 eventIdOut:&v13])
        {
          [(ATXHistogramData *)v5->_histogramData deleteWhereA:v13 b:0xFFFFLL];
          ++v7;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  [(_ATXAppLaunchCategoricalHistogram *)v5 _garbageCollectCategoryIds];
  objc_sync_exit(v5);

  return v7;
}

- (void)_removeMappingForCategory:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = self;
    objc_sync_enter(v6);
    int v7 = [(NSMutableDictionary *)v6->_categoryToCategoryId objectForKeyedSubscript:v5];
    uint64_t v8 = [v7 unsignedShortValue];

    int maxCategoryId = v6->_maxCategoryId;
    if (v8 + 1 == maxCategoryId) {
      v6->_int maxCategoryId = maxCategoryId - 1;
    }
    [(NSMutableDictionary *)v6->_categoryToCategoryId removeObjectForKey:v5];
    lastDates = v6->_lastDates;
    uint64_t v11 = [NSNumber numberWithUnsignedShort:v8];
    [(NSMutableDictionary *)lastDates removeObjectForKey:v11];

    if (v8 == v6->_prevCategoryId)
    {
      prevCategory = v6->_prevCategory;
      v6->_prevCategory = 0;
    }
    objc_sync_exit(v6);
  }
  else
  {
    unsigned __int16 v13 = __atxlog_handle_default();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[_ATXAppLaunchCategoricalHistogram addLaunchWithBundleId:date:category:weight:](a2);
    }
  }
}

- (void)_reduceCategoryCountTo:(unsigned __int16)a3
{
  LODWORD(v3) = a3;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableDictionary *)self->_categoryToCategoryId count] > (unint64_t)a3)
  {
    id v6 = [(NSMutableDictionary *)self->_categoryToCategoryId allKeys];
    int v7 = objc_opt_new();
    if ((unint64_t)(self->_pruningMethod - 1) > 1)
    {
      uint64_t v26 = __atxlog_handle_default();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchCategoricalHistogram _reduceCategoryCountTo:](v26);
      }

      [MEMORY[0x1E4F93AE8] simulateCrashWithDescription:@"Invalid value for _ATXAppLaunchCategoricalHistogramPruningMethod"];
    }
    else
    {
      long long v34 = 0u;
      long long v35 = 0u;
      SEL v29 = a2;
      long long v32 = 0u;
      long long v33 = 0u;
      v30 = v6;
      id obj = v6;
      uint64_t v8 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v33;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v33 != v10) {
              objc_enumerationMutation(obj);
            }
            uint64_t v12 = *(void **)(*((void *)&v32 + 1) + 8 * i);
            unsigned __int16 v13 = [(NSMutableDictionary *)self->_categoryToCategoryId objectForKeyedSubscript:v12];

            if (!v13)
            {
              unsigned __int16 v20 = [MEMORY[0x1E4F28B00] currentHandler];
              [v20 handleFailureInMethod:v29, self, @"_ATXAppLaunchCategoricalHistogram.m", 536, @"Trying to remove a category '%@' that has no categoryId -- inconsistent dictionary state", v12 object file lineNumber description];
            }
            uint64_t v14 = objc_opt_new();
            objc_storeStrong((id *)(v14 + 8), v12);
            lastDates = self->_lastDates;
            long long v16 = [(NSMutableDictionary *)self->_categoryToCategoryId objectForKeyedSubscript:v12];
            uint64_t v17 = [(NSMutableDictionary *)lastDates objectForKeyedSubscript:v16];
            id v18 = *(void **)(v14 + 16);
            *(void *)(v14 + 16) = v17;

            [(_ATXAppLaunchCategoricalHistogram *)self totalLaunchesForCategory:v12];
            *(void *)(v14 + 24) = v19;
            [v7 addObject:v14];
          }
          uint64_t v9 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
        }
        while (v9);
      }

      uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"lastDate" ascending:0];
      uint64_t v22 = [objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"launchCount" ascending:0];
      uint64_t v23 = (void *)v22;
      if (self->_pruningMethod == 1)
      {
        uint64_t v37 = v21;
        uint64_t v24 = (uint64_t *)&v37;
        uint64_t v25 = v22;
      }
      else
      {
        uint64_t v36 = v22;
        uint64_t v24 = &v36;
        uint64_t v25 = (uint64_t)v21;
      }
      unint64_t v3 = v3;
      v24[1] = v25;
      v27 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:");
      [v7 sortUsingDescriptors:v27];

      while ([v7 count] > v3)
      {
        uint64_t v28 = [v7 objectAtIndexedSubscript:v3];
        [(_ATXAppLaunchCategoricalHistogram *)self removeHistoryForCategory:v28[1]];

        ++v3;
      }

      id v6 = v30;
    }
  }
}

- (double)totalLaunchesForBundleId:(id)a3 category:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (v7)
  {
    if (v8)
    {
      uint64_t v10 = self;
      objc_sync_enter(v10);
      int v14 = 0;
      double v11 = 0.0;
      if ([(_ATXAppLaunchCategoricalHistogram *)v10 _tryGetEventIdforBundleId:v7 createIfMissing:0 eventIdOut:(char *)&v14 + 2]&& [(_ATXAppLaunchCategoricalHistogram *)v10 _tryGetCategoryIdforCategory:v9 createIfMissing:0 categoryIdOut:&v14])
      {
        [(ATXHistogramData *)v10->_histogramData lookupUnsmoothedA:HIWORD(v14) b:(unsigned __int16)v14];
        double v11 = v12;
      }
      objc_sync_exit(v10);
    }
    else
    {
      __atxlog_handle_default();
      uint64_t v10 = (_ATXAppLaunchCategoricalHistogram *)objc_claimAutoreleasedReturnValue();
      double v11 = 0.0;
      if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_DEBUG)) {
        -[_ATXAppLaunchCategoricalHistogram addLaunchWithBundleId:date:category:weight:](a2);
      }
    }
  }
  else
  {
    __atxlog_handle_default();
    uint64_t v10 = (_ATXAppLaunchCategoricalHistogram *)objc_claimAutoreleasedReturnValue();
    double v11 = 0.0;
    if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_DEBUG)) {
      -[_ATXAppLaunchHistogram _addLaunchWithBundleId:date:timeZone:arbitraryWeight:](a2);
    }
  }

  return v11;
}

- (double)ratio:(double)a3 over:(double)a4
{
  return a3 * a4 / ((*(double *)&kLaunchThreshold_0 + a4) * (*(double *)&kLaunchThreshold_0 + a4));
}

- (double)launchPopularityWithBundleId:(id)a3 category:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (v7)
  {
    if (v8)
    {
      uint64_t v10 = self;
      objc_sync_enter(v10);
      int v17 = 0;
      double v11 = 0.0;
      if ([(_ATXAppLaunchCategoricalHistogram *)v10 _tryGetEventIdforBundleId:v7 createIfMissing:0 eventIdOut:(char *)&v17 + 2]&& [(_ATXAppLaunchCategoricalHistogram *)v10 _tryGetCategoryIdforCategory:v9 createIfMissing:0 categoryIdOut:&v17])
      {
        [(ATXHistogramData *)v10->_histogramData lookupUnsmoothedA:HIWORD(v17) b:(unsigned __int16)v17];
        float v13 = v12;
        [(ATXHistogramData *)v10->_histogramData lookupUnsmoothedA:HIWORD(v17) b:0xFFFFLL];
        [(_ATXAppLaunchCategoricalHistogram *)v10 ratio:v13 over:v14];
        double v11 = v15;
      }
      objc_sync_exit(v10);
    }
    else
    {
      __atxlog_handle_default();
      uint64_t v10 = (_ATXAppLaunchCategoricalHistogram *)objc_claimAutoreleasedReturnValue();
      double v11 = 0.0;
      if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_DEBUG)) {
        -[_ATXAppLaunchCategoricalHistogram addLaunchWithBundleId:date:category:weight:](a2);
      }
    }
  }
  else
  {
    __atxlog_handle_default();
    uint64_t v10 = (_ATXAppLaunchCategoricalHistogram *)objc_claimAutoreleasedReturnValue();
    double v11 = 0.0;
    if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_DEBUG)) {
      -[_ATXAppLaunchHistogram _addLaunchWithBundleId:date:timeZone:arbitraryWeight:](a2);
    }
  }

  return v11;
}

- (double)relativeLaunchPopularityWithBundleId:(id)a3 category:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (v7)
  {
    if (v8)
    {
      uint64_t v10 = self;
      objc_sync_enter(v10);
      int v17 = 0;
      double v11 = 0.0;
      if ([(_ATXAppLaunchCategoricalHistogram *)v10 _tryGetEventIdforBundleId:v7 createIfMissing:0 eventIdOut:(char *)&v17 + 2]&& [(_ATXAppLaunchCategoricalHistogram *)v10 _tryGetCategoryIdforCategory:v9 createIfMissing:0 categoryIdOut:&v17])
      {
        [(ATXHistogramData *)v10->_histogramData lookupUnsmoothedA:HIWORD(v17) b:(unsigned __int16)v17];
        float v13 = v12;
        [(ATXHistogramData *)v10->_histogramData lookupUnsmoothedA:0xFFFFLL b:(unsigned __int16)v17];
        [(_ATXAppLaunchCategoricalHistogram *)v10 ratio:v13 over:v14];
        double v11 = v15;
      }
      objc_sync_exit(v10);
    }
    else
    {
      __atxlog_handle_default();
      uint64_t v10 = (_ATXAppLaunchCategoricalHistogram *)objc_claimAutoreleasedReturnValue();
      double v11 = 0.0;
      if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_DEBUG)) {
        -[_ATXAppLaunchCategoricalHistogram addLaunchWithBundleId:date:category:weight:](a2);
      }
    }
  }
  else
  {
    __atxlog_handle_default();
    uint64_t v10 = (_ATXAppLaunchCategoricalHistogram *)objc_claimAutoreleasedReturnValue();
    double v11 = 0.0;
    if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_DEBUG)) {
      -[_ATXAppLaunchHistogram _addLaunchWithBundleId:date:timeZone:arbitraryWeight:](a2);
    }
  }

  return v11;
}

- (double)totalLaunchesForCategory:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = self;
    objc_sync_enter(v6);
    unsigned __int16 v10 = 0;
    double v7 = 0.0;
    if ([(_ATXAppLaunchCategoricalHistogram *)v6 _tryGetCategoryIdforCategory:v5 createIfMissing:0 categoryIdOut:&v10])
    {
      [(ATXHistogramData *)v6->_histogramData lookupUnsmoothedA:0xFFFFLL b:v10];
      double v7 = v8;
    }
    objc_sync_exit(v6);
  }
  else
  {
    __atxlog_handle_default();
    id v6 = (_ATXAppLaunchCategoricalHistogram *)objc_claimAutoreleasedReturnValue();
    double v7 = 0.0;
    if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_DEBUG)) {
      -[_ATXAppLaunchCategoricalHistogram addLaunchWithBundleId:date:category:weight:](a2);
    }
  }

  return v7;
}

- (double)totalLaunchesForBundleId:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = self;
    objc_sync_enter(v6);
    unsigned __int16 v10 = 0;
    double v7 = 0.0;
    if ([(_ATXAppLaunchCategoricalHistogram *)v6 _tryGetEventIdforBundleId:v5 createIfMissing:0 eventIdOut:&v10])
    {
      [(ATXHistogramData *)v6->_histogramData lookupUnsmoothedA:v10 b:0xFFFFLL];
      double v7 = v8;
    }
    objc_sync_exit(v6);
  }
  else
  {
    __atxlog_handle_default();
    id v6 = (_ATXAppLaunchCategoricalHistogram *)objc_claimAutoreleasedReturnValue();
    double v7 = 0.0;
    if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_DEBUG)) {
      -[_ATXAppLaunchHistogram _addLaunchWithBundleId:date:timeZone:arbitraryWeight:](a2);
    }
  }

  return v7;
}

- (double)overallLaunchPopularityForBundleId:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = self;
    objc_sync_enter(v6);
    unsigned __int16 v13 = 0;
    double v7 = 0.0;
    if ([(_ATXAppLaunchCategoricalHistogram *)v6 _tryGetEventIdforBundleId:v5 createIfMissing:0 eventIdOut:&v13])
    {
      [(ATXHistogramData *)v6->_histogramData lookupUnsmoothedA:v13 b:0xFFFFLL];
      float v9 = v8;
      [(ATXHistogramData *)v6->_histogramData lookupUnsmoothedA:0xFFFFLL b:0xFFFFLL];
      [(_ATXAppLaunchCategoricalHistogram *)v6 ratio:v9 over:v10];
      double v7 = v11;
    }
    objc_sync_exit(v6);
  }
  else
  {
    __atxlog_handle_default();
    id v6 = (_ATXAppLaunchCategoricalHistogram *)objc_claimAutoreleasedReturnValue();
    double v7 = 0.0;
    if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_DEBUG)) {
      -[_ATXAppLaunchHistogram _addLaunchWithBundleId:date:timeZone:arbitraryWeight:](a2);
    }
  }

  return v7;
}

- (double)overallLaunchPopularityForCategory:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = self;
    objc_sync_enter(v6);
    unsigned __int16 v13 = 0;
    double v7 = 0.0;
    if ([(_ATXAppLaunchCategoricalHistogram *)v6 _tryGetCategoryIdforCategory:v5 createIfMissing:0 categoryIdOut:&v13])
    {
      [(ATXHistogramData *)v6->_histogramData lookupUnsmoothedA:0xFFFFLL b:v13];
      float v9 = v8;
      [(ATXHistogramData *)v6->_histogramData lookupUnsmoothedA:0xFFFFLL b:0xFFFFLL];
      [(_ATXAppLaunchCategoricalHistogram *)v6 ratio:v9 over:v10];
      double v7 = v11;
    }
    objc_sync_exit(v6);
  }
  else
  {
    __atxlog_handle_default();
    id v6 = (_ATXAppLaunchCategoricalHistogram *)objc_claimAutoreleasedReturnValue();
    double v7 = 0.0;
    if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_DEBUG)) {
      -[_ATXAppLaunchCategoricalHistogram addLaunchWithBundleId:date:category:weight:](a2);
    }
  }

  return v7;
}

- (double)overallLaunchPopularityForBundleId:(id)a3 category:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  float v9 = v8;
  if (v7)
  {
    if (v8)
    {
      float v10 = self;
      objc_sync_enter(v10);
      int v17 = 0;
      double v11 = 0.0;
      if ([(_ATXAppLaunchCategoricalHistogram *)v10 _tryGetEventIdforBundleId:v7 createIfMissing:0 eventIdOut:(char *)&v17 + 2]&& [(_ATXAppLaunchCategoricalHistogram *)v10 _tryGetCategoryIdforCategory:v9 createIfMissing:0 categoryIdOut:&v17])
      {
        [(ATXHistogramData *)v10->_histogramData lookupUnsmoothedA:HIWORD(v17) b:(unsigned __int16)v17];
        float v13 = v12;
        [(ATXHistogramData *)v10->_histogramData lookupUnsmoothedA:0xFFFFLL b:0xFFFFLL];
        [(_ATXAppLaunchCategoricalHistogram *)v10 ratio:v13 over:v14];
        double v11 = v15;
      }
      objc_sync_exit(v10);
    }
    else
    {
      __atxlog_handle_default();
      float v10 = (_ATXAppLaunchCategoricalHistogram *)objc_claimAutoreleasedReturnValue();
      double v11 = 0.0;
      if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_DEBUG)) {
        -[_ATXAppLaunchCategoricalHistogram addLaunchWithBundleId:date:category:weight:](a2);
      }
    }
  }
  else
  {
    __atxlog_handle_default();
    float v10 = (_ATXAppLaunchCategoricalHistogram *)objc_claimAutoreleasedReturnValue();
    double v11 = 0.0;
    if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_DEBUG)) {
      -[_ATXAppLaunchHistogram _addLaunchWithBundleId:date:timeZone:arbitraryWeight:](a2);
    }
  }

  return v11;
}

- (double)totalLaunches
{
  v2 = self;
  objc_sync_enter(v2);
  [(ATXHistogramData *)v2->_histogramData lookupUnsmoothedA:0xFFFFLL b:0xFFFFLL];
  double v4 = v3;
  objc_sync_exit(v2);

  return v4;
}

- (double)entropyForBundleId:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = self;
    objc_sync_enter(v6);
    unsigned __int16 v10 = 0;
    double v7 = 0.0;
    if ([(_ATXAppLaunchCategoricalHistogram *)v6 _tryGetEventIdforBundleId:v5 createIfMissing:0 eventIdOut:&v10])
    {
      [(ATXHistogramData *)v6->_histogramData entropyWhereA:v10 b:0xFFFFLL];
      double v7 = v8;
    }
    objc_sync_exit(v6);
  }
  else
  {
    __atxlog_handle_default();
    id v6 = (_ATXAppLaunchCategoricalHistogram *)objc_claimAutoreleasedReturnValue();
    double v7 = 0.0;
    if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_DEBUG)) {
      -[_ATXAppLaunchHistogram _addLaunchWithBundleId:date:timeZone:arbitraryWeight:](a2);
    }
  }

  return v7;
}

- (double)entropyForCategory:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = self;
    objc_sync_enter(v6);
    unsigned __int16 v10 = 0;
    double v7 = 0.0;
    if ([(_ATXAppLaunchCategoricalHistogram *)v6 _tryGetCategoryIdforCategory:v5 createIfMissing:0 categoryIdOut:&v10])
    {
      [(ATXHistogramData *)v6->_histogramData entropyWhereA:0xFFFFLL b:v10];
      double v7 = v8;
    }
    objc_sync_exit(v6);
  }
  else
  {
    __atxlog_handle_default();
    id v6 = (_ATXAppLaunchCategoricalHistogram *)objc_claimAutoreleasedReturnValue();
    double v7 = 0.0;
    if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_DEBUG)) {
      -[_ATXAppLaunchCategoricalHistogram addLaunchWithBundleId:date:category:weight:](a2);
    }
  }

  return v7;
}

- (double)entropy
{
  v2 = self;
  objc_sync_enter(v2);
  [(ATXHistogramData *)v2->_histogramData entropyWhereA:0xFFFFLL b:0xFFFFLL];
  double v4 = v3;
  objc_sync_exit(v2);

  return v4;
}

- (id)launchCountsForEachCategoryForBundleId:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  __int16 v13 = 0;
  id v6 = objc_opt_new();
  if ([(_ATXAppLaunchCategoricalHistogram *)v5 _tryGetEventIdforBundleId:v4 createIfMissing:0 eventIdOut:&v13])
  {
    histogramData = v5->_histogramData;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __76___ATXAppLaunchCategoricalHistogram_launchCountsForEachCategoryForBundleId___block_invoke;
    v10[3] = &unk_1E68B5018;
    __int16 v12 = v13;
    double v11 = v6;
    [(ATXHistogramData *)histogramData enumerate:v10];
    float v8 = v11;
  }
  else
  {
    float v8 = __atxlog_handle_default();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[_ATXAppLaunchCategoricalHistogram launchCountsForEachCategoryForBundleId:]();
    }
  }

  objc_sync_exit(v5);
  return v6;
}

- (id)lastDate
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  float v3 = [(NSMutableDictionary *)v2->_lastDates objectEnumerator];
  id v4 = 0;
  uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        float v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (!v4 || [v4 compare:*(void *)(*((void *)&v12 + 1) + 8 * i)] == -1)
        {
          id v9 = v8;

          id v4 = v9;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  unsigned __int16 v10 = (void *)[v4 copy];
  objc_sync_exit(v2);

  return v10;
}

- (BOOL)bundleHasBeenLaunched:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = self;
    objc_sync_enter(v6);
    unsigned __int16 v10 = 0;
    if ([(_ATXAppLaunchCategoricalHistogram *)v6 _tryGetEventIdforBundleId:v5 createIfMissing:0 eventIdOut:&v10])
    {
      [(ATXHistogramData *)v6->_histogramData lookupUnsmoothedA:v10 b:0xFFFFLL];
      BOOL v8 = v7 > 0.0;
    }
    else
    {
      BOOL v8 = 0;
    }
    objc_sync_exit(v6);
  }
  else
  {
    __atxlog_handle_default();
    uint64_t v6 = (_ATXAppLaunchCategoricalHistogram *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_DEBUG)) {
      -[_ATXAppLaunchHistogram _addLaunchWithBundleId:date:timeZone:arbitraryWeight:](a2);
    }
    BOOL v8 = 0;
  }

  return v8;
}

- (void)decayByFactor:(double)a3
{
  id obj = self;
  objc_sync_enter(obj);
  *(float *)&double v4 = a3;
  [(ATXHistogramData *)obj->_histogramData decayByFactor:v4];
  objc_sync_exit(obj);
}

- (void)decayWithHalfLifeInDays:(double)a3
{
  id obj = self;
  objc_sync_enter(obj);
  *(float *)&double v4 = a3;
  [(ATXHistogramData *)obj->_histogramData decayWithHalfLifeInDays:v4];
  objc_sync_exit(obj);
}

- (void)resetData
{
  id obj = self;
  objc_sync_enter(obj);
  obj->_int maxCategoryId = 0;
  uint64_t v2 = objc_opt_new();
  categoryToCategoryId = obj->_categoryToCategoryId;
  obj->_categoryToCategoryId = (NSMutableDictionary *)v2;

  prevCategory = obj->_prevCategory;
  obj->_prevCategory = 0;

  [(ATXHistogramData *)obj->_histogramData clear];
  objc_sync_exit(obj);
}

- (void)verifyDataIntegrity
{
  id obj = self;
  objc_sync_enter(obj);
  uint64_t v2 = [(NSMutableDictionary *)obj->_categoryToCategoryId allValues];
  unint64_t v3 = [v2 count];
  double v4 = [MEMORY[0x1E4F1CAD0] setWithArray:v2];
  unint64_t v5 = [v4 count];

  if (v3 > v5) {
    [(_ATXAppLaunchCategoricalHistogram *)obj resetData];
  }

  objc_sync_exit(obj);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_ATXAppLaunchCategoricalHistogram)initWithCoder:(id)a3
{
  id v3 = a3;
  double v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"histogram"];
  if (v4)
  {
    unint64_t v5 = [[ATXHistogramData alloc] initWithCategoricalHistogram:v4];
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    id v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    unsigned __int16 v10 = [v3 decodeObjectOfClasses:v9 forKey:@"bundleIdToEventId"];

    double v11 = +[ATXHistogramBundleIdTable sharedInstance];
    long long v12 = [v11 permutationFrom:v10];
    [(ATXHistogramData *)v5 applyPermutationToA:v12];

    long long v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    long long v16 = objc_msgSend(v13, "setWithObjects:", v14, v15, objc_opt_class(), 0);
    uint64_t v17 = [v3 decodeObjectOfClasses:v16 forKey:@"categoryToCategoryId"];
    unsigned __int16 v18 = [v3 decodeInt32ForKey:@"maxCategoryId"];
    unsigned __int16 v19 = [v3 decodeInt32ForKey:@"maxCategoryCount"];
    unsigned __int16 v20 = [v4 getLastDatesByCategoryId];
    uint64_t v21 = [v3 decodeIntegerForKey:@"pruningMethod"];
    uint64_t v22 = v18;
    uint64_t v23 = v19;
    uint64_t v24 = self;
    uint64_t v25 = v5;
    uint64_t v26 = v17;
  }
  else
  {
    unint64_t v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"histogramData"];
    v27 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v28 = objc_opt_class();
    uint64_t v29 = objc_opt_class();
    unsigned __int16 v10 = objc_msgSend(v27, "setWithObjects:", v28, v29, objc_opt_class(), 0);
    long long v16 = [v3 decodeObjectOfClasses:v10 forKey:@"categoryToCategoryId"];
    unsigned __int16 v30 = [v3 decodeInt32ForKey:@"maxCategoryId"];
    unsigned __int16 v31 = [v3 decodeInt32ForKey:@"maxCategoryCount"];
    long long v32 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v33 = objc_opt_class();
    uint64_t v34 = objc_opt_class();
    uint64_t v17 = objc_msgSend(v32, "setWithObjects:", v33, v34, objc_opt_class(), 0);
    unsigned __int16 v20 = [v3 decodeObjectOfClasses:v17 forKey:@"lastDates"];
    uint64_t v21 = [v3 decodeIntegerForKey:@"pruningMethod"];
    uint64_t v22 = v30;
    uint64_t v23 = v31;
    uint64_t v24 = self;
    uint64_t v25 = v5;
    uint64_t v26 = v16;
  }
  long long v35 = [(_ATXAppLaunchCategoricalHistogram *)v24 initWithHistogram:v25 categoryToCategoryId:v26 maxCategoryId:v22 maxCategoryCount:v23 lastDates:v20 pruningMethod:v21];

  return v35;
}

- (id)description
{
  id v3 = objc_opt_new();
  double v4 = self;
  objc_sync_enter(v4);
  unint64_t v5 = NSString;
  uint64_t v6 = [(NSMutableDictionary *)v4->_categoryToCategoryId description];
  uint64_t v7 = [v5 stringWithFormat:@"categoryToCategoryId=%@\n", v6];
  [v3 appendString:v7];

  uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"maxCategorycount=%u\n", v4->_maxCategoryCount);
  [v3 appendString:v8];

  id v9 = NSString;
  unsigned __int16 v10 = [(id)objc_opt_class() stringForPruningMethod:v4->_pruningMethod];
  double v11 = [v9 stringWithFormat:@"pruningMethod=%@\n", v10];
  [v3 appendString:v11];

  long long v12 = NSString;
  long long v13 = [(ATXHistogramData *)v4->_histogramData description];
  uint64_t v14 = [v12 stringWithFormat:@"categoricalHistogram=%@\n", v13];
  [v3 appendString:v14];

  objc_sync_exit(v4);
  return v3;
}

- (unsigned)categoryCount
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  unsigned __int16 v3 = [(NSMutableDictionary *)v2->_categoryToCategoryId count];
  objc_sync_exit(v2);

  return v3;
}

- (unsigned)_eventIdforBundleId:(id)a3
{
  id v4 = a3;
  unint64_t v5 = self;
  objc_sync_enter(v5);
  unsigned __int16 v8 = 0;
  [(_ATXAppLaunchCategoricalHistogram *)v5 _tryGetEventIdforBundleId:v4 createIfMissing:0 eventIdOut:&v8];
  unsigned __int16 v6 = v8;
  objc_sync_exit(v5);

  return v6;
}

- (unsigned)_categoryIdforCategory:(id)a3
{
  id v4 = a3;
  unint64_t v5 = self;
  objc_sync_enter(v5);
  unsigned __int16 v8 = 0;
  [(_ATXAppLaunchCategoricalHistogram *)v5 _tryGetCategoryIdforCategory:v4 createIfMissing:0 categoryIdOut:&v8];
  unsigned __int16 v6 = v8;
  objc_sync_exit(v5);

  return v6;
}

- (int64_t)pruningMethod
{
  return self->_pruningMethod;
}

- (unsigned)maxCategoryCount
{
  return self->_maxCategoryCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prevCategory, 0);
  objc_storeStrong((id *)&self->_lastDates, 0);
  objc_storeStrong((id *)&self->_categoryToCategoryId, 0);
  objc_storeStrong((id *)&self->_uninstallNotificationListener, 0);
  objc_storeStrong((id *)&self->_histogramData, 0);
}

+ (void)stringForPruningMethod:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "stringForPruningMethod called with invalid _ATXAppLaunchCategoricalHistogramPruningMethod value of %lu", v2, v3, v4, v5, v6);
}

- (void)_setMaxCategoryCount:(NSObject *)a3 pruningMethod:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *a1;
  uint64_t v5 = [(id)objc_opt_class() stringForPruningMethod:*a1];
  int v6 = 134218242;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_debug_impl(&dword_1D0FA3000, a3, OS_LOG_TYPE_DEBUG, "set _pruningMethod to %lu (%@)", (uint8_t *)&v6, 0x16u);
}

- (void)_setMaxCategoryCount:pruningMethod:.cold.2()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v2 = 2048;
  uint64_t v3 = 1;
  _os_log_error_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_ERROR, "invalid _pruningMethod of %lu -- using default of %lu", v1, 0x16u);
}

- (void)_setMaxCategoryCount:(unsigned __int16 *)a1 pruningMethod:(NSObject *)a2 .cold.3(unsigned __int16 *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_DEBUG, "set _maxCategoryCount to %lu", (uint8_t *)&v3, 0xCu);
}

- (void)initWithType:(uint64_t)a3 maxCategoryCount:(uint64_t)a4 pruningMethod:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 maxCategoryCount:(uint64_t)a4 pruningMethod:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 maxCategoryCount:(uint64_t)a4 pruningMethod:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 maxCategoryCount:(uint64_t)a4 pruningMethod:(uint64_t)a5 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 maxCategoryCount:(uint64_t)a4 pruningMethod:(uint64_t)a5 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 maxCategoryCount:(uint64_t)a4 pruningMethod:(uint64_t)a5 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 maxCategoryCount:(uint64_t)a4 pruningMethod:(uint64_t)a5 .cold.7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 maxCategoryCount:(uint64_t)a4 pruningMethod:(uint64_t)a5 .cold.8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 maxCategoryCount:(uint64_t)a4 pruningMethod:(uint64_t)a5 .cold.9(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 maxCategoryCount:(uint64_t)a4 pruningMethod:(uint64_t)a5 .cold.10(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 maxCategoryCount:(uint64_t)a4 pruningMethod:(uint64_t)a5 .cold.11(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 maxCategoryCount:(uint64_t)a4 pruningMethod:(uint64_t)a5 .cold.12(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 maxCategoryCount:(uint64_t)a4 pruningMethod:(uint64_t)a5 .cold.13(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 maxCategoryCount:(uint64_t)a4 pruningMethod:(uint64_t)a5 .cold.14(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 maxCategoryCount:(uint64_t)a4 pruningMethod:(uint64_t)a5 .cold.15(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 maxCategoryCount:(uint64_t)a4 pruningMethod:(uint64_t)a5 .cold.16(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 maxCategoryCount:(uint64_t)a4 pruningMethod:(uint64_t)a5 .cold.17(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 maxCategoryCount:(uint64_t)a4 pruningMethod:(uint64_t)a5 .cold.18(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 maxCategoryCount:(uint64_t)a4 pruningMethod:(uint64_t)a5 .cold.19(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 maxCategoryCount:(uint64_t)a4 pruningMethod:(uint64_t)a5 .cold.20(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 maxCategoryCount:(uint64_t)a4 pruningMethod:(uint64_t)a5 .cold.21(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 maxCategoryCount:(uint64_t)a4 pruningMethod:(uint64_t)a5 .cold.22(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 maxCategoryCount:(uint64_t)a4 pruningMethod:(uint64_t)a5 .cold.23(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 maxCategoryCount:(uint64_t)a4 pruningMethod:(uint64_t)a5 .cold.24(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 maxCategoryCount:(uint64_t)a4 pruningMethod:(uint64_t)a5 .cold.25(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 maxCategoryCount:(uint64_t)a4 pruningMethod:(uint64_t)a5 .cold.26(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 maxCategoryCount:(uint64_t)a4 pruningMethod:(uint64_t)a5 .cold.27(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 maxCategoryCount:(uint64_t)a4 pruningMethod:(uint64_t)a5 .cold.28(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 maxCategoryCount:(uint64_t)a4 pruningMethod:(uint64_t)a5 .cold.29(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithType:(uint64_t)a3 maxCategoryCount:(uint64_t)a4 pruningMethod:(uint64_t)a5 .cold.30(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)addLaunchWithBundleId:(const char *)a1 date:category:weight:.cold.2(const char *a1)
{
  sel_getName(a1);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_1D0FA3000, v1, v2, "Category can not be nil in %s", v3, v4, v5, v6, v7);
}

- (void)_reduceCategoryCountTo:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "Invalid value for _ATXAppLaunchCategoricalHistogramPruningMethod", v1, 2u);
}

- (void)launchCountsForEachCategoryForBundleId:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Unable to get EventId for BundleId for %@", v2, v3, v4, v5, v6);
}

@end
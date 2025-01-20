@interface AAUIAchievementsDataProvider
- (AAUIAchievementsDataProvider)initWithHealthStore:(id)a3 layoutMode:(unint64_t)a4;
- (ACHQuery)query;
- (ACHVisibilityEvaluator)visibilityEvaluator;
- (BOOL)_achievementBelongsInRecents:(id)a3 replacingRecent:(id *)a4;
- (BOOL)_achievementBelongsInRelevants:(id)a3 replacingRelevant:(id *)a4;
- (BOOL)_builtInBelongsInRelevants:(id)a3;
- (BOOL)_monthlyChallengeBelongsInRelevants:(id)a3;
- (BOOL)_remoteAchievementBelongsInRelevants:(id)a3;
- (BOOL)_shouldShowAchievement:(id)a3 activityMoveMode:(int64_t)a4 experienceType:(unint64_t)a5;
- (BOOL)didFinishInitialLoad;
- (HKHealthStore)healthStore;
- (NSArray)clientAllAchievementsSortedByEarnedDate;
- (NSArray)clientRecentAchievements;
- (NSArray)clientRelevantAchievements;
- (NSArray)orderedMainSectionHeaderStrings;
- (NSArray)orderedRecentAndRelevantHeaderStrings;
- (NSArray)orderedSections;
- (NSDictionary)clientAchievementsByEarnedDateComponents;
- (NSDictionary)clientAchievementsBySection;
- (NSDictionary)clientAchievementsByTemplateUniqueName;
- (NSDictionary)clientFilteredAchievementsByTemplateUniqueName;
- (NSHashTable)initialLoadObservers;
- (NSHashTable)mainSectionObservers;
- (NSHashTable)recentAndRelevantSectionObservers;
- (NSMutableArray)allAchievementsSortedByEarnedDate;
- (NSMutableArray)recentAchievements;
- (NSMutableArray)relevantAchievements;
- (NSMutableDictionary)achievementsByEarnedDateComponents;
- (NSMutableDictionary)achievementsBySection;
- (NSMutableDictionary)achievementsByTemplateUniqueName;
- (NSMutableDictionary)filteredAchievementsByTemplateUniqueName;
- (OS_dispatch_queue)achievementsDataQueue;
- (OS_dispatch_queue)observerQueue;
- (_TtC22ActivityAchievementsUI15AAUIAwardsQuery)awardsQuery;
- (double)queryRetryDelay;
- (id)_achievementsRespectingOverrideDisplayState:(id)a3;
- (id)_mainSectionIndexPathForAchievement:(id)a3;
- (id)_oldestRecentAchievement;
- (id)_recentAndRelevantSectionIndexPathForAchievement:(id)a3;
- (id)achievementAtIndexPath:(id)a3;
- (id)achievementForTemplateUniqueName:(id)a3;
- (id)achievementsForDateComponents:(id)a3;
- (id)headerStringForSection:(int64_t)a3 isRecentAndRelevant:(BOOL)a4;
- (id)recentAndRelevantAchievementAtIndexPath:(id)a3;
- (id)trophyCaseAchievementForTemplateUniqueName:(id)a3;
- (int64_t)_deleteAchievement:(id)a3 fromUnfiltered:(BOOL)a4;
- (int64_t)_updateAchievement:(id)a3 activityMoveMode:(int64_t)a4 experienceType:(unint64_t)a5;
- (int64_t)numberOfItemsInRecentAndRelevantSection:(int64_t)a3;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfRecentAndRelevantSections;
- (int64_t)numberOfSections;
- (int64_t)overrideDisplayState;
- (int64_t)queryRetryCount;
- (os_unfair_lock_s)modelLock;
- (void)_deepCopyClientFacingModel;
- (void)_deleteAchievementsByEarnedDateWithAchievement:(id)a3 earnedInstance:(id)a4;
- (void)_handleDeletedAchievements:(id)a3;
- (void)_handleUpdatedAchievements:(id)a3;
- (void)_reload;
- (void)_updateAchievementsByEarnedDateComponentsWithAchievement:(id)a3 earnedInstance:(id)a4;
- (void)addInitialLoadObserver:(id)a3;
- (void)addMainSectionObserver:(id)a3;
- (void)addRecentAndRelevantSectionObserver:(id)a3;
- (void)cycleQuery;
- (void)removeInitialLoadObserver:(id)a3;
- (void)removeMainSectionObserver:(id)a3;
- (void)removeRecentAndRelevantSectionObserver:(id)a3;
- (void)setAchievementsByEarnedDateComponents:(id)a3;
- (void)setAchievementsBySection:(id)a3;
- (void)setAchievementsByTemplateUniqueName:(id)a3;
- (void)setAchievementsDataQueue:(id)a3;
- (void)setAllAchievementsSortedByEarnedDate:(id)a3;
- (void)setAwardsQuery:(id)a3;
- (void)setClientAchievementsByEarnedDateComponents:(id)a3;
- (void)setClientAchievementsBySection:(id)a3;
- (void)setClientAchievementsByTemplateUniqueName:(id)a3;
- (void)setClientAllAchievementsSortedByEarnedDate:(id)a3;
- (void)setClientFilteredAchievementsByTemplateUniqueName:(id)a3;
- (void)setClientRecentAchievements:(id)a3;
- (void)setClientRelevantAchievements:(id)a3;
- (void)setDidFinishInitialLoad:(BOOL)a3;
- (void)setFilteredAchievementsByTemplateUniqueName:(id)a3;
- (void)setHealthStore:(id)a3;
- (void)setInitialLoadObservers:(id)a3;
- (void)setMainSectionObservers:(id)a3;
- (void)setModelLock:(os_unfair_lock_s)a3;
- (void)setObserverQueue:(id)a3;
- (void)setOrderedMainSectionHeaderStrings:(id)a3;
- (void)setOrderedRecentAndRelevantHeaderStrings:(id)a3;
- (void)setOrderedSections:(id)a3;
- (void)setOverrideDisplayState:(int64_t)a3;
- (void)setQuery:(id)a3;
- (void)setQueryRetryCount:(int64_t)a3;
- (void)setQueryRetryDelay:(double)a3;
- (void)setRecentAchievements:(id)a3;
- (void)setRecentAndRelevantSectionObservers:(id)a3;
- (void)setRelevantAchievements:(id)a3;
- (void)setVisibilityEvaluator:(id)a3;
- (void)startFetching;
- (void)stopFetching;
@end

@implementation AAUIAchievementsDataProvider

- (void)startFetching
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_229290000, v0, OS_LOG_TYPE_ERROR, "Error starting awards query: %@", v1, 0xCu);
}

- (AAUIAchievementsDataProvider)initWithHealthStore:(id)a3 layoutMode:(unint64_t)a4
{
  uint64_t v115 = *MEMORY[0x263EF8340];
  id v7 = a3;
  v96.receiver = self;
  v96.super_class = (Class)AAUIAchievementsDataProvider;
  v8 = [(AAUIAchievementsDataProvider *)&v96 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_healthStore, a3);
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    achievementsBySection = v9->_achievementsBySection;
    v9->_achievementsBySection = v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    recentAchievements = v9->_recentAchievements;
    v9->_recentAchievements = v12;

    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    relevantAchievements = v9->_relevantAchievements;
    v9->_relevantAchievements = v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    filteredAchievementsByTemplateUniqueName = v9->_filteredAchievementsByTemplateUniqueName;
    v9->_filteredAchievementsByTemplateUniqueName = v16;

    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    achievementsByTemplateUniqueName = v9->_achievementsByTemplateUniqueName;
    v9->_achievementsByTemplateUniqueName = v18;

    v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    achievementsByEarnedDateComponents = v9->_achievementsByEarnedDateComponents;
    v9->_achievementsByEarnedDateComponents = v20;

    [(NSMutableDictionary *)v9->_achievementsBySection setObject:v9->_relevantAchievements forKeyedSubscript:@"GO_FOR_IT"];
    if (a4 == 1)
    {
      id v95 = v7;
      v99[0] = @"RECENT";
      v99[1] = @"CURRENT_MONTHLY_CHALLENGE";
      uint64_t v43 = *MEMORY[0x263F23428];
      uint64_t v100 = *MEMORY[0x263F23418];
      uint64_t v42 = v100;
      uint64_t v101 = v43;
      uint64_t v44 = *MEMORY[0x263F23438];
      uint64_t v102 = *MEMORY[0x263F23430];
      uint64_t v103 = v44;
      uint64_t v78 = *MEMORY[0x263F23420];
      uint64_t v104 = *MEMORY[0x263F23440];
      uint64_t v45 = v104;
      uint64_t v105 = v78;
      uint64_t v46 = [MEMORY[0x263EFF8C0] arrayWithObjects:v99 count:8];
      orderedSections = v9->_orderedSections;
      v9->_orderedSections = (NSArray *)v46;

      v98[0] = &stru_26DD6AF88;
      v98[1] = &stru_26DD6AF88;
      v94 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v92 = objc_msgSend(v94, "localizedStringForKey:value:table:", v42, &stru_26DD6AF88);
      v90 = [v92 localizedUppercaseString];
      v98[2] = v90;
      v88 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v86 = [v88 localizedStringForKey:v43 value:&stru_26DD6AF88 table:@"Localizable"];
      v84 = [v86 localizedUppercaseString];
      v98[3] = v84;
      v82 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v80 = [v82 localizedStringForKey:@"LIMITED_EDITION_WATCH" value:&stru_26DD6AF88 table:@"Localizable"];
      v76 = [v80 localizedUppercaseString];
      v98[4] = v76;
      v75 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v48 = [v75 localizedStringForKey:v44 value:&stru_26DD6AF88 table:@"Localizable"];
      v49 = [v48 localizedUppercaseString];
      v98[5] = v49;
      v50 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v51 = [v50 localizedStringForKey:v45 value:&stru_26DD6AF88 table:@"Localizable"];
      v52 = [v51 localizedUppercaseString];
      v98[6] = v52;
      v53 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v54 = [v53 localizedStringForKey:v78 value:&stru_26DD6AF88 table:@"Localizable"];
      v55 = [v54 localizedUppercaseString];
      v98[7] = v55;
      uint64_t v56 = [MEMORY[0x263EFF8C0] arrayWithObjects:v98 count:8];
      orderedMainSectionHeaderStrings = v9->_orderedMainSectionHeaderStrings;
      v9->_orderedMainSectionHeaderStrings = (NSArray *)v56;

      v38 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v39 = [v38 localizedStringForKey:@"RECENT" value:&stru_26DD6AF88 table:@"Localizable"];
      v41 = [v39 localizedUppercaseString];
      v97 = v41;
      uint64_t v58 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v97 count:1];
      orderedRecentAndRelevantHeaderStrings = v9->_orderedRecentAndRelevantHeaderStrings;
      v9->_orderedRecentAndRelevantHeaderStrings = (NSArray *)v58;
    }
    else
    {
      if (a4)
      {
LABEL_7:
        v60 = (ACHVisibilityEvaluator *)objc_alloc_init(MEMORY[0x263F236E0]);
        visibilityEvaluator = v9->_visibilityEvaluator;
        v9->_visibilityEvaluator = v60;

        uint64_t v62 = HKCreateSerialDispatchQueueWithQOSClass();
        achievementsDataQueue = v9->_achievementsDataQueue;
        v9->_achievementsDataQueue = (OS_dispatch_queue *)v62;

        uint64_t v64 = HKCreateSerialDispatchQueueWithQOSClass();
        observerQueue = v9->_observerQueue;
        v9->_observerQueue = (OS_dispatch_queue *)v64;

        v66 = [MEMORY[0x263F086E0] mainBundle];
        CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"ACHAchievementDisplayOverrideState", (CFStringRef)[v66 bundleIdentifier], 0);

        v9->_overrideDisplayState = AppIntegerValue;
        v9->_queryRetryDelay = 0.1;
        v9->_modelLock._os_unfair_lock_opaque = 0;
        uint64_t v68 = [MEMORY[0x263F088B0] weakObjectsHashTable];
        initialLoadObservers = v9->_initialLoadObservers;
        v9->_initialLoadObservers = (NSHashTable *)v68;

        uint64_t v70 = [MEMORY[0x263F088B0] weakObjectsHashTable];
        recentAndRelevantSectionObservers = v9->_recentAndRelevantSectionObservers;
        v9->_recentAndRelevantSectionObservers = (NSHashTable *)v70;

        uint64_t v72 = [MEMORY[0x263F088B0] weakObjectsHashTable];
        mainSectionObservers = v9->_mainSectionObservers;
        v9->_mainSectionObservers = (NSHashTable *)v72;

        goto LABEL_8;
      }
      id v95 = v7;
      v108[0] = @"RECENT";
      v108[1] = @"GO_FOR_IT";
      uint64_t v23 = *MEMORY[0x263F23428];
      uint64_t v109 = *MEMORY[0x263F23418];
      uint64_t v22 = v109;
      uint64_t v110 = v23;
      uint64_t v25 = *MEMORY[0x263F23438];
      uint64_t v111 = *MEMORY[0x263F23430];
      uint64_t v24 = v111;
      uint64_t v112 = v25;
      uint64_t v87 = *MEMORY[0x263F23420];
      uint64_t v26 = *MEMORY[0x263F23420];
      uint64_t v113 = *MEMORY[0x263F23440];
      uint64_t v81 = v113;
      uint64_t v114 = v26;
      uint64_t v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v108 count:8];
      v28 = v9->_orderedSections;
      v9->_orderedSections = (NSArray *)v27;

      v107[0] = &stru_26DD6AF88;
      v93 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v91 = objc_msgSend(v93, "localizedStringForKey:value:table:", @"GO_FOR_IT", &stru_26DD6AF88);
      v107[1] = v91;
      v89 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v85 = [v89 localizedStringForKey:v22 value:&stru_26DD6AF88 table:@"Localizable"];
      v107[2] = v85;
      v83 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v79 = [v83 localizedStringForKey:v23 value:&stru_26DD6AF88 table:@"Localizable"];
      v107[3] = v79;
      v77 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v29 = [v77 localizedStringForKey:v24 value:&stru_26DD6AF88 table:@"Localizable"];
      v107[4] = v29;
      v30 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v31 = [v30 localizedStringForKey:v25 value:&stru_26DD6AF88 table:@"Localizable"];
      v107[5] = v31;
      v32 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v33 = [v32 localizedStringForKey:v81 value:&stru_26DD6AF88 table:@"Localizable"];
      v107[6] = v33;
      v34 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v35 = [v34 localizedStringForKey:v87 value:&stru_26DD6AF88 table:@"Localizable"];
      v107[7] = v35;
      uint64_t v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:v107 count:8];
      v37 = v9->_orderedMainSectionHeaderStrings;
      v9->_orderedMainSectionHeaderStrings = (NSArray *)v36;

      v38 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v39 = [v38 localizedStringForKey:@"RECENT" value:&stru_26DD6AF88 table:@"Localizable"];
      v106 = v39;
      uint64_t v40 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v106 count:1];
      v41 = v9->_orderedRecentAndRelevantHeaderStrings;
      v9->_orderedRecentAndRelevantHeaderStrings = (NSArray *)v40;
    }

    id v7 = v95;
    goto LABEL_7;
  }
LABEL_8:

  return v9;
}

- (void)_reload
{
  uint64_t v2 = self;
  uint64_t v101 = *MEMORY[0x263EF8340];
  locuint64_t k = &self->_modelLock;
  os_unfair_lock_lock(&self->_modelLock);
  v3 = [(AAUIAchievementsDataProvider *)v2 recentAchievements];
  uint64_t v96 = MEMORY[0x263EF8330];
  uint64_t v97 = 3221225472;
  v98 = __AAUISortAchievementsByMostRecentEarnedDate_block_invoke;
  v99 = &__block_descriptor_33_e43_q24__0__ACHAchievement_8__ACHAchievement_16l;
  char v100 = 0;
  [v3 sortUsingComparator:&v96];

  v4 = [(AAUIAchievementsDataProvider *)v2 relevantAchievements];
  [v4 sortUsingComparator:&__block_literal_global_731];

  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  v5 = [(AAUIAchievementsDataProvider *)v2 achievementsBySection];
  v6 = [v5 allKeys];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v81 objects:v94 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v82;
    uint64_t v71 = *MEMORY[0x263F23440];
    uint64_t v70 = *MEMORY[0x263F23428];
    v65 = v6;
    v66 = v2;
    uint64_t v64 = *(void *)v82;
    do
    {
      uint64_t v10 = 0;
      uint64_t v67 = v8;
      do
      {
        if (*(void *)v82 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v81 + 1) + 8 * v10);
        v12 = [(AAUIAchievementsDataProvider *)v2 achievementsBySection];
        v13 = [v12 objectForKeyedSubscript:v11];

        if ([v11 isEqualToString:v71])
        {
          id v14 = v13;
          objc_msgSend(v14, "hk_filter:", &__block_literal_global_734);
          uint64_t v72 = v13;
          v15 = uint64_t v74 = v10;
          v16 = objc_msgSend(v14, "hk_filter:", &__block_literal_global_736);

          v17 = AAUISortSubAchievementsByActivityType(v15);
          AAUISortSubAchievementsByActivityType(v16);
          uint64_t v18 = v8;
          v20 = v19 = v6;
          [v17 arrayByAddingObjectsFromArray:v20];
          uint64_t v22 = v21 = v2;

          v6 = v19;
          uint64_t v8 = v18;

          uint64_t v23 = [MEMORY[0x263EFF980] arrayWithArray:v22];

          uint64_t v2 = v21;
          uint64_t v24 = [(AAUIAchievementsDataProvider *)v21 achievementsBySection];
          [v24 setObject:v23 forKeyedSubscript:v11];

          v13 = v72;
          uint64_t v10 = v74;
        }
        else if ([v11 isEqualToString:v70])
        {
          v69 = v11;
          v73 = v13;
          uint64_t v75 = v10;
          id v25 = v13;
          id v68 = objc_alloc_init(MEMORY[0x263EFF980]);
          id v26 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          long long v89 = 0u;
          long long v90 = 0u;
          long long v91 = 0u;
          long long v92 = 0u;
          id v27 = v25;
          uint64_t v28 = [v27 countByEnumeratingWithState:&v89 objects:&v96 count:16];
          if (v28)
          {
            uint64_t v29 = v28;
            uint64_t v30 = *(void *)v90;
            do
            {
              for (uint64_t i = 0; i != v29; ++i)
              {
                if (*(void *)v90 != v30) {
                  objc_enumerationMutation(v27);
                }
                v32 = *(void **)(*((void *)&v89 + 1) + 8 * i);
                v33 = NSNumber;
                v34 = [v32 template];
                v35 = objc_msgSend(v33, "numberWithUnsignedInteger:", objc_msgSend(v34, "displayOrder"));
                uint64_t v36 = [v26 objectForKeyedSubscript:v35];

                if (!v36)
                {
                  id v37 = objc_alloc_init(MEMORY[0x263EFF980]);
                  v38 = NSNumber;
                  v39 = [v32 template];
                  uint64_t v40 = objc_msgSend(v38, "numberWithUnsignedInteger:", objc_msgSend(v39, "displayOrder"));
                  [v26 setObject:v37 forKeyedSubscript:v40];
                }
                v41 = NSNumber;
                uint64_t v42 = [v32 template];
                uint64_t v43 = objc_msgSend(v41, "numberWithUnsignedInteger:", objc_msgSend(v42, "displayOrder"));
                uint64_t v44 = [v26 objectForKeyedSubscript:v43];
                [v44 addObject:v32];
              }
              uint64_t v29 = [v27 countByEnumeratingWithState:&v89 objects:&v96 count:16];
            }
            while (v29);
          }

          uint64_t v45 = [v26 allKeys];
          uint64_t v46 = [v45 sortedArrayUsingSelector:sel_compare_];

          long long v87 = 0u;
          long long v88 = 0u;
          long long v85 = 0u;
          long long v86 = 0u;
          id v47 = v46;
          uint64_t v48 = [v47 countByEnumeratingWithState:&v85 objects:v95 count:16];
          if (v48)
          {
            uint64_t v49 = v48;
            uint64_t v50 = *(void *)v86;
            do
            {
              for (uint64_t j = 0; j != v49; ++j)
              {
                if (*(void *)v86 != v50) {
                  objc_enumerationMutation(v47);
                }
                v52 = [v26 objectForKeyedSubscript:*(void *)(*((void *)&v85 + 1) + 8 * j)];
                if ((unint64_t)[v27 count] < 2)
                {
                  [v68 addObjectsFromArray:v52];
                }
                else
                {
                  v53 = [v52 sortedArrayUsingComparator:&__block_literal_global_740];
                  [v68 addObjectsFromArray:v53];
                }
              }
              uint64_t v49 = [v47 countByEnumeratingWithState:&v85 objects:v95 count:16];
            }
            while (v49);
          }

          uint64_t v2 = v66;
          v54 = [(AAUIAchievementsDataProvider *)v66 achievementsBySection];
          [v54 setObject:v68 forKeyedSubscript:v69];

          uint64_t v9 = v64;
          v6 = v65;
          uint64_t v8 = v67;
          v13 = v73;
          uint64_t v10 = v75;
        }
        else
        {
          [v13 sortUsingComparator:&__block_literal_global_731];
        }

        ++v10;
      }
      while (v10 != v8);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v81 objects:v94 count:16];
    }
    while (v8);
  }

  id v55 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  uint64_t v56 = [(AAUIAchievementsDataProvider *)v2 achievementsByEarnedDateComponents];
  v57 = [v56 allValues];

  uint64_t v58 = [v57 countByEnumeratingWithState:&v77 objects:v93 count:16];
  if (v58)
  {
    uint64_t v59 = v58;
    uint64_t v60 = *(void *)v78;
    do
    {
      for (uint64_t k = 0; k != v59; ++k)
      {
        if (*(void *)v78 != v60) {
          objc_enumerationMutation(v57);
        }
        uint64_t v62 = [*(id *)(*((void *)&v77 + 1) + 8 * k) allObjects];
        [v55 addObjectsFromArray:v62];
      }
      uint64_t v59 = [v57 countByEnumeratingWithState:&v77 objects:v93 count:16];
    }
    while (v59);
  }

  uint64_t v96 = MEMORY[0x263EF8330];
  uint64_t v97 = 3221225472;
  v98 = __AAUISortAchievementsByMostRecentEarnedDate_block_invoke;
  v99 = &__block_descriptor_33_e43_q24__0__ACHAchievement_8__ACHAchievement_16l;
  char v100 = 0;
  [v55 sortUsingComparator:&v96];
  [(AAUIAchievementsDataProvider *)v2 setAllAchievementsSortedByEarnedDate:v55];
  os_unfair_lock_unlock(lock);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__AAUIAchievementsDataProvider__reload__block_invoke;
  block[3] = &unk_264860DC0;
  block[4] = v2;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

- (void)setAllAchievementsSortedByEarnedDate:(id)a3
{
}

- (void)_deepCopyClientFacingModel
{
  p_modelLocuint64_t k = &self->_modelLock;
  os_unfair_lock_lock(&self->_modelLock);
  v4 = [(AAUIAchievementsDataProvider *)self recentAchievements];
  v5 = (void *)[v4 copy];
  [(AAUIAchievementsDataProvider *)self setClientRecentAchievements:v5];

  v6 = [(AAUIAchievementsDataProvider *)self relevantAchievements];
  uint64_t v7 = (void *)[v6 copy];
  [(AAUIAchievementsDataProvider *)self setClientRelevantAchievements:v7];

  uint64_t v8 = [(AAUIAchievementsDataProvider *)self filteredAchievementsByTemplateUniqueName];
  uint64_t v9 = (void *)[v8 copy];
  [(AAUIAchievementsDataProvider *)self setClientFilteredAchievementsByTemplateUniqueName:v9];

  uint64_t v10 = [(AAUIAchievementsDataProvider *)self achievementsByTemplateUniqueName];
  v11 = (void *)[v10 copy];
  [(AAUIAchievementsDataProvider *)self setClientAchievementsByTemplateUniqueName:v11];

  id v12 = objc_alloc(NSDictionary);
  v13 = [(AAUIAchievementsDataProvider *)self achievementsBySection];
  id v14 = (void *)[v12 initWithDictionary:v13 copyItems:1];
  [(AAUIAchievementsDataProvider *)self setClientAchievementsBySection:v14];

  id v15 = objc_alloc(NSDictionary);
  v16 = [(AAUIAchievementsDataProvider *)self achievementsByEarnedDateComponents];
  v17 = (void *)[v15 initWithDictionary:v16 copyItems:1];
  [(AAUIAchievementsDataProvider *)self setClientAchievementsByEarnedDateComponents:v17];

  uint64_t v18 = (void *)[(NSMutableArray *)self->_allAchievementsSortedByEarnedDate copy];
  [(AAUIAchievementsDataProvider *)self setClientAllAchievementsSortedByEarnedDate:v18];

  os_unfair_lock_unlock(p_modelLock);
}

- (NSMutableDictionary)achievementsByEarnedDateComponents
{
  return self->_achievementsByEarnedDateComponents;
}

- (void)setClientRelevantAchievements:(id)a3
{
}

- (void)setClientRecentAchievements:(id)a3
{
}

- (void)setClientFilteredAchievementsByTemplateUniqueName:(id)a3
{
}

- (void)setClientAllAchievementsSortedByEarnedDate:(id)a3
{
}

- (void)setClientAchievementsByTemplateUniqueName:(id)a3
{
}

- (void)setClientAchievementsBySection:(id)a3
{
}

- (void)setClientAchievementsByEarnedDateComponents:(id)a3
{
}

- (_TtC22ActivityAchievementsUI15AAUIAwardsQuery)awardsQuery
{
  awardsQuery = self->_awardsQuery;
  if (!awardsQuery)
  {
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __43__AAUIAchievementsDataProvider_awardsQuery__block_invoke;
    aBlock[3] = &unk_264860CD0;
    objc_copyWeak(&v12, &location);
    v4 = _Block_copy(aBlock);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __43__AAUIAchievementsDataProvider_awardsQuery__block_invoke_2;
    v9[3] = &unk_264860CD0;
    objc_copyWeak(&v10, &location);
    v5 = _Block_copy(v9);
    v6 = [[_TtC22ActivityAchievementsUI15AAUIAwardsQuery alloc] initWithInitialAwardsHandler:v4 addedAwardsHandler:v4 removedAwardsHandler:v5 updatedAwardsHandler:v4];
    uint64_t v7 = self->_awardsQuery;
    self->_awardsQuery = v6;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
    awardsQuery = self->_awardsQuery;
  }
  return awardsQuery;
}

void __43__AAUIAchievementsDataProvider_awardsQuery__block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [MEMORY[0x263EFFA08] setWithArray:a2];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleUpdatedAchievements:v4];
}

- (void)_handleUpdatedAchievements:(id)a3
{
  id v4 = a3;
  if ([v4 count]) {
    [(AAUIAchievementsDataProvider *)self setDidFinishInitialLoad:1];
  }
  v5 = [(AAUIAchievementsDataProvider *)self _achievementsRespectingOverrideDisplayState:v4];

  v6 = [(AAUIAchievementsDataProvider *)self achievementsDataQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __59__AAUIAchievementsDataProvider__handleUpdatedAchievements___block_invoke;
  v8[3] = &unk_264860D70;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)setDidFinishInitialLoad:(BOOL)a3
{
  observerQueue = self->_observerQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __56__AAUIAchievementsDataProvider_setDidFinishInitialLoad___block_invoke;
  v4[3] = &unk_264860D98;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(observerQueue, v4);
}

- (OS_dispatch_queue)achievementsDataQueue
{
  return self->_achievementsDataQueue;
}

- (id)_achievementsRespectingOverrideDisplayState:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = ACHShouldUseNewAwardsSystem();
  int64_t v6 = [(AAUIAchievementsDataProvider *)self overrideDisplayState];
  if (v6 == 2)
  {
    id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v26 = v4;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      id v29 = v4;
      uint64_t v30 = *(void *)v40;
      uint64_t v31 = MEMORY[0x263EFFA68];
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v40 != v30) {
            objc_enumerationMutation(v26);
          }
          v33 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          if (v5) {
            [v33 shallowCopyWithRelevantEarnedInstance:0];
          }
          else {
          v34 = [v33 shallowCopyReplacingEarnedInstances:v31];
          }
          [v7 addObject:v34];
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v39 objects:v47 count:16];
      }
      while (v28);
      id v4 = v29;
    }
  }
  else
  {
    if (v6 != 1) {
      goto LABEL_28;
    }
    id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    obuint64_t j = v4;
    uint64_t v8 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      id v37 = v4;
      uint64_t v10 = *(void *)v44;
      do
      {
        for (uint64_t j = 0; j != v9; ++j)
        {
          if (*(void *)v44 != v10) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v43 + 1) + 8 * j);
          id v13 = objc_alloc_init(MEMORY[0x263F236B8]);
          id v14 = [v12 template];
          id v15 = [v14 canonicalUnit];

          if (v15)
          {
            v16 = (void *)MEMORY[0x263F0A630];
            v17 = [v12 template];
            uint64_t v18 = [v17 canonicalUnit];
            v19 = [v16 quantityWithUnit:v18 doubleValue:20.0];

            [v13 setValue:v19];
          }
          v20 = ACHDateComponentsForYearMonthDay();
          [v13 setEarnedDateComponents:v20];

          v21 = [MEMORY[0x263EFF910] date];
          [v13 setCreatedDate:v21];

          [v13 setCreatorDevice:2];
          uint64_t v22 = [v12 template];
          uint64_t v23 = [v22 uniqueName];
          [v13 setTemplateUniqueName:v23];

          if (v5)
          {
            uint64_t v24 = [v12 shallowCopyWithRelevantEarnedInstance:v13];
          }
          else
          {
            id v48 = v13;
            id v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v48 count:1];
            uint64_t v24 = [v12 shallowCopyReplacingEarnedInstances:v25];
          }
          objc_msgSend(v7, "addObject:", v24, v37);
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
      }
      while (v9);
      id v4 = v37;
    }
  }

  uint64_t v35 = [MEMORY[0x263EFFA08] setWithArray:v7];

  id v4 = (id)v35;
LABEL_28:
  return v4;
}

- (int64_t)overrideDisplayState
{
  return self->_overrideDisplayState;
}

void __59__AAUIAchievementsDataProvider__handleUpdatedAchievements___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  id v28 = 0;
  v3 = [v2 activityMoveModeWithError:&v28];
  id v4 = v28;
  if (v4)
  {
    char v5 = ACHLogUI();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __59__AAUIAchievementsDataProvider__handleUpdatedAchievements___block_invoke_cold_1();
    }
  }
  if (v3) {
    uint64_t v6 = [v3 activityMoveMode];
  }
  else {
    uint64_t v6 = 1;
  }
  uint64_t v7 = FIExperienceTypeWithHealthStore();
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 3;
  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = *(id *)(a1 + 40);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v22 = v3;
    obuint64_t j = v9;
    id v21 = v4;
    uint64_t v12 = a1;
    char v13 = 0;
    char v14 = 0;
    uint64_t v15 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v18 = (void *)MEMORY[0x22A6B4B30]();
        char v19 = [*(id *)(v12 + 32) _updateAchievement:v17 activityMoveMode:v6 experienceType:v8];
        v14 |= (v19 & 0x15) != 0;
        v13 |= (v19 & 0x2A) != 0;
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v11);
    char v20 = v14 | v13;

    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(v12 + 32) + 12));
    id v4 = v21;
    v3 = v22;
    if (v20) {
      [*(id *)(v12 + 32) _reload];
    }
  }
  else
  {

    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
  }
}

- (int64_t)_updateAchievement:(id)a3 activityMoveMode:(int64_t)a4 experienceType:(unint64_t)a5
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = [(AAUIAchievementsDataProvider *)self achievementsByTemplateUniqueName];
  uint64_t v10 = [v8 template];
  uint64_t v11 = [v10 uniqueName];
  [v9 setObject:v8 forKeyedSubscript:v11];

  if ([(AAUIAchievementsDataProvider *)self _shouldShowAchievement:v8 activityMoveMode:a4 experienceType:a5])
  {
    if (ACHShouldUseNewAwardsSystem())
    {
      uint64_t v12 = [v8 relevantEarnedInstance];
      if (v12) {
        [(AAUIAchievementsDataProvider *)self _updateAchievementsByEarnedDateComponentsWithAchievement:v8 earnedInstance:v12];
      }
    }
    else
    {
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      uint64_t v12 = [v8 earnedInstances];
      uint64_t v14 = [v12 countByEnumeratingWithState:&v54 objects:v60 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v55;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v55 != v16) {
              objc_enumerationMutation(v12);
            }
            uint64_t v18 = *(void *)(*((void *)&v54 + 1) + 8 * i);
            char v19 = (void *)MEMORY[0x22A6B4B30]();
            [(AAUIAchievementsDataProvider *)self _updateAchievementsByEarnedDateComponentsWithAchievement:v8 earnedInstance:v18];
          }
          uint64_t v15 = [v12 countByEnumeratingWithState:&v54 objects:v60 count:16];
        }
        while (v15);
      }
    }

    char v20 = [(AAUIAchievementsDataProvider *)self filteredAchievementsByTemplateUniqueName];
    id v21 = [v8 template];
    uint64_t v22 = [v21 uniqueName];
    [v20 setObject:v8 forKeyedSubscript:v22];

    uint64_t v23 = [v8 section];
    if (!v23)
    {
      long long v24 = ACHLogDefault();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        long long v25 = [v8 template];
        long long v26 = [v25 uniqueName];
        *(_DWORD *)buf = 138412290;
        uint64_t v59 = v26;
        _os_log_impl(&dword_229290000, v24, OS_LOG_TYPE_DEFAULT, "SECTION NOT FOUND FOR ACHIEVEMENT %@", buf, 0xCu);
      }
      uint64_t v23 = @"NOT_FOUND";
    }
    long long v27 = [(AAUIAchievementsDataProvider *)self achievementsBySection];
    id v28 = [v27 objectForKeyedSubscript:v23];

    if (!v28)
    {
      id v28 = objc_alloc_init(MEMORY[0x263EFF980]);
      id v29 = [(AAUIAchievementsDataProvider *)self achievementsBySection];
      [v29 setObject:v28 forKeyedSubscript:v23];
    }
    uint64_t v30 = [v8 template];
    uint64_t v31 = [v30 uniqueName];
    v32 = AAUIAchievementInArrayWithUniqueName(v28, v31);

    if (v32)
    {
      if (AAUICompareAchievements(v32, v8) == 1)
      {
        int64_t v13 = 0;
        goto LABEL_25;
      }
      [v28 removeObject:v32];
      int64_t v13 = 1;
    }
    else
    {
      int64_t v13 = 16;
    }
    [v28 addObject:v8];
LABEL_25:

    id v53 = 0;
    BOOL v33 = [(AAUIAchievementsDataProvider *)self _achievementBelongsInRecents:v8 replacingRecent:&v53];
    id v34 = v53;
    if (v33)
    {
      uint64_t v35 = [(AAUIAchievementsDataProvider *)self recentAchievements];
      uint64_t v36 = v35;
      if (v34)
      {
        v13 |= 2uLL;
        [v35 removeObject:v34];

        uint64_t v36 = [(AAUIAchievementsDataProvider *)self recentAchievements];
      }
      else
      {
        v13 |= 0x20uLL;
      }
      [v36 addObject:v8];
    }
    if (ACHShouldUseNewAwardsSystem()) {
      [v8 shallowCopyWithRelevantEarnedInstance:0];
    }
    else {
    id v37 = [v8 shallowCopyReplacingEarnedInstances:MEMORY[0x263EFFA68]];
    }
    id v52 = 0;
    BOOL v38 = [(AAUIAchievementsDataProvider *)self _achievementBelongsInRelevants:v8 replacingRelevant:&v52];
    id v39 = v52;
    if (v38)
    {
      long long v40 = [(AAUIAchievementsDataProvider *)self relevantAchievements];
      long long v41 = v40;
      if (v39)
      {
        v13 |= 2uLL;
        [v40 removeObject:v39];

        long long v40 = [(AAUIAchievementsDataProvider *)self relevantAchievements];
        long long v41 = v40;
      }
      else
      {
        v13 |= 0x20uLL;
      }
      [v40 addObject:v37];
    }
    else
    {
      v51 = v37;
      long long v42 = v23;
      long long v43 = [(AAUIAchievementsDataProvider *)self relevantAchievements];
      long long v44 = [v8 template];
      long long v45 = [v44 uniqueName];
      long long v41 = AAUIAchievementInArrayWithUniqueName(v43, v45);

      if (v41)
      {
        long long v46 = [(AAUIAchievementsDataProvider *)self relevantAchievements];
        [v46 removeObject:v41];

        v13 |= 8uLL;
      }
      uint64_t v23 = v42;
      id v37 = v51;
    }

    id v47 = [v8 template];
    id v48 = [v47 sourceName];
    if ([v48 isEqualToString:*MEMORY[0x263F23618]])
    {
      BOOL v49 = [(AAUIAchievementsDataProvider *)self _monthlyChallengeBelongsInRelevants:v8];

      if (!v49)
      {
LABEL_45:

        goto LABEL_46;
      }
      id v47 = [MEMORY[0x263EFF980] arrayWithObject:v8];
      id v48 = [(AAUIAchievementsDataProvider *)self achievementsBySection];
      [v48 setObject:v47 forKeyedSubscript:@"CURRENT_MONTHLY_CHALLENGE"];
    }

    goto LABEL_45;
  }
  int64_t v13 = [(AAUIAchievementsDataProvider *)self _deleteAchievement:v8 fromUnfiltered:0];
LABEL_46:

  return v13;
}

- (NSMutableDictionary)achievementsByTemplateUniqueName
{
  return self->_achievementsByTemplateUniqueName;
}

- (BOOL)_shouldShowAchievement:(id)a3 activityMoveMode:(int64_t)a4 experienceType:(unint64_t)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  if ([v8 hasClientRequiredURLs])
  {
    id v9 = [v8 template];
    uint64_t v10 = [v9 uniqueName];
    if ([v10 containsString:@"MonthlyChallenge"])
    {
      int v11 = [v8 unearned];

      if (!v11)
      {
        int IsEarnable = 1;
        goto LABEL_11;
      }
      id v9 = [MEMORY[0x263EFF910] date];
      int IsEarnable = AAUIMonthlyChallengeIsEarnable(v8, v9);
    }
    else
    {

      int IsEarnable = 1;
    }

LABEL_11:
    int v17 = [v8 unearned] ^ 1;
    char v16 = v17 & IsEarnable;
    if ((v17 & 1) == 0 && IsEarnable)
    {
      uint64_t v18 = [(AAUIAchievementsDataProvider *)self visibilityEvaluator];
      char v16 = [v18 unearnedAchievementIsVisibleNow:v8 activityMoveMode:a4 experienceType:a5];
    }
    goto LABEL_14;
  }
  int64_t v13 = ACHLogAssets();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = [v8 template];
    uint64_t v15 = [v14 uniqueName];
    int v20 = 138543362;
    id v21 = v15;
    _os_log_impl(&dword_229290000, v13, OS_LOG_TYPE_DEFAULT, "AAUIAchievmentsProvider Filtering achievement from UI due to missing URLS: %{public}@", (uint8_t *)&v20, 0xCu);
  }
  char v16 = 0;
LABEL_14:

  return v16;
}

- (ACHVisibilityEvaluator)visibilityEvaluator
{
  return self->_visibilityEvaluator;
}

- (int64_t)_deleteAchievement:(id)a3 fromUnfiltered:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [(AAUIAchievementsDataProvider *)self filteredAchievementsByTemplateUniqueName];
  id v8 = [v6 template];
  id v9 = [v8 uniqueName];
  [v7 setObject:0 forKeyedSubscript:v9];

  if (v4)
  {
    uint64_t v10 = [(AAUIAchievementsDataProvider *)self achievementsByTemplateUniqueName];
    int v11 = [v6 template];
    uint64_t v12 = [v11 uniqueName];
    [v10 setObject:0 forKeyedSubscript:v12];
  }
  if (ACHShouldUseNewAwardsSystem())
  {
    int64_t v13 = [v6 relevantEarnedInstance];
    if (v13) {
      [(AAUIAchievementsDataProvider *)self _deleteAchievementsByEarnedDateWithAchievement:v6 earnedInstance:v13];
    }
  }
  else
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    int64_t v13 = objc_msgSend(v6, "earnedInstances", 0);
    uint64_t v14 = [v13 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v38 != v16) {
            objc_enumerationMutation(v13);
          }
          [(AAUIAchievementsDataProvider *)self _deleteAchievementsByEarnedDateWithAchievement:v6 earnedInstance:*(void *)(*((void *)&v37 + 1) + 8 * i)];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v15);
    }
  }

  uint64_t v18 = [v6 section];
  char v19 = [(AAUIAchievementsDataProvider *)self achievementsBySection];
  int v20 = [v19 objectForKeyedSubscript:v18];

  if (v20)
  {
    id v21 = [v6 template];
    uint64_t v22 = [v21 uniqueName];
    uint64_t v23 = AAUIAchievementInArrayWithUniqueName(v20, v22);

    if (v23)
    {
      [v20 removeObject:v23];
      uint64_t v24 = 4;
    }
    else
    {
      uint64_t v24 = 0;
    }
  }
  else
  {
    uint64_t v24 = 0;
  }
  long long v25 = [(AAUIAchievementsDataProvider *)self recentAchievements];
  long long v26 = [v6 template];
  long long v27 = [v26 uniqueName];
  uint64_t v28 = AAUIAchievementInArrayWithUniqueName(v25, v27);

  if (v28)
  {
    id v29 = [(AAUIAchievementsDataProvider *)self recentAchievements];
    [v29 removeObject:v28];
  }
  uint64_t v30 = [(AAUIAchievementsDataProvider *)self relevantAchievements];
  uint64_t v31 = [v6 template];
  v32 = [v31 uniqueName];
  uint64_t v33 = AAUIAchievementInArrayWithUniqueName(v30, v32);

  if (v33)
  {
    id v34 = [(AAUIAchievementsDataProvider *)self relevantAchievements];
    [v34 removeObject:v33];
  }
  if (v28 | v33) {
    int64_t v35 = v24 | 8;
  }
  else {
    int64_t v35 = v24;
  }

  return v35;
}

- (NSMutableDictionary)achievementsBySection
{
  return self->_achievementsBySection;
}

- (NSMutableArray)relevantAchievements
{
  return self->_relevantAchievements;
}

- (NSMutableDictionary)filteredAchievementsByTemplateUniqueName
{
  return self->_filteredAchievementsByTemplateUniqueName;
}

- (NSMutableArray)recentAchievements
{
  return self->_recentAchievements;
}

- (BOOL)_achievementBelongsInRelevants:(id)a3 replacingRelevant:(id *)a4
{
  id v6 = a3;
  if (ACHShouldUseNewAwardsSystem())
  {
    uint64_t v7 = [v6 relevantEarnedInstance];
  }
  else
  {
    id v8 = [v6 earnedInstances];
    uint64_t v7 = [v8 lastObject];
  }
  id v9 = [v7 earnedDateComponents];
  uint64_t v10 = [MEMORY[0x263EFF8F0] currentCalendar];
  int v11 = [MEMORY[0x263EFF910] date];
  uint64_t v12 = [v10 components:28 fromDate:v11];

  if (v9)
  {
    int64_t v13 = (void *)ACHCompareYearMonthDayDateComponents();
    BOOL v14 = v13 != 0;
    if ([v6 unearned])
    {
      if (!v13) {
        goto LABEL_29;
      }
LABEL_12:
      int v17 = [v6 template];
      uint64_t v18 = [v17 sourceName];
      int v19 = [v18 isEqualToString:*MEMORY[0x263F23628]];

      if (v19)
      {
        if (![(AAUIAchievementsDataProvider *)self _remoteAchievementBelongsInRelevants:v6])
        {
LABEL_25:
          LOBYTE(v13) = 0;
          goto LABEL_29;
        }
      }
      else
      {
        int v20 = [v6 template];
        id v21 = [v20 sourceName];
        int v22 = [v21 isEqualToString:*MEMORY[0x263F23618]];

        if (v22)
        {
          if (![(AAUIAchievementsDataProvider *)self _monthlyChallengeBelongsInRelevants:v6])goto LABEL_25; {
        }
          }
        else
        {
          uint64_t v23 = [v6 template];
          uint64_t v24 = [v23 sourceName];
          int v25 = [v24 isEqualToString:*MEMORY[0x263F23610]];

          if (!v25
            || ![(AAUIAchievementsDataProvider *)self _builtInBelongsInRelevants:v6])
          {
            goto LABEL_25;
          }
        }
      }
      long long v26 = [(AAUIAchievementsDataProvider *)self relevantAchievements];
      long long v27 = [v6 template];
      uint64_t v28 = [v27 uniqueName];
      id v29 = AAUIAchievementInArrayWithUniqueName(v26, v28);

      if (v29)
      {
        if ((![v29 unearned] || (objc_msgSend(v6, "unearned") & 1) == 0)
          && AAUICompareAchievements(v29, v6) != -1)
        {
          LOBYTE(v13) = 0;
LABEL_28:

          goto LABEL_29;
        }
        *a4 = v29;
      }
      LOBYTE(v13) = 1;
      goto LABEL_28;
    }
  }
  else
  {
    if ([v6 unearned]) {
      goto LABEL_12;
    }
    BOOL v14 = 1;
  }
  int64_t v13 = [v6 template];
  int v15 = [v13 earnLimit];
  uint64_t v16 = *MEMORY[0x263F235F0];

  LOBYTE(v13) = 0;
  if (v16 == v15 && v14) {
    goto LABEL_12;
  }
LABEL_29:

  return (char)v13;
}

- (BOOL)_achievementBelongsInRecents:(id)a3 replacingRecent:(id *)a4
{
  id v6 = a3;
  if (([v6 unearned] & 1) == 0)
  {
    char v8 = ACHShouldUseNewAwardsSystem();
    id v9 = [MEMORY[0x263EFF8F0] currentCalendar];
    if (v8)
    {
      uint64_t v10 = [v6 relevantEarnedInstance];
    }
    else
    {
      int v11 = [v6 earnedInstances];
      uint64_t v10 = [v11 lastObject];
    }
    uint64_t v12 = [v10 earnedDateComponents];
    int64_t v13 = [v9 dateFromComponents:v12];

    BOOL v14 = [MEMORY[0x263EFF910] date];
    int v15 = [v9 dateByAddingUnit:16 value:-7 toDate:v14 options:0];

    if ([v13 compare:v15] == -1)
    {
      BOOL v7 = 0;
LABEL_24:

      goto LABEL_25;
    }
    uint64_t v33 = a4;
    id v34 = v10;
    uint64_t v16 = [(AAUIAchievementsDataProvider *)self recentAchievements];
    int v17 = [v6 template];
    uint64_t v18 = [v17 uniqueName];
    int v19 = AAUIAchievementInArrayWithUniqueName(v16, v18);

    if (v19)
    {
      if (AAUICompareAchievements(v19, v6) != -1)
      {
        BOOL v7 = 0;
LABEL_23:
        uint64_t v10 = v34;

        goto LABEL_24;
      }
      id *v33 = v19;
    }
    else
    {
      int v20 = [(AAUIAchievementsDataProvider *)self recentAchievements];
      unint64_t v21 = [v20 count];

      if (v21 >= 5)
      {
        int v22 = [(AAUIAchievementsDataProvider *)self _oldestRecentAchievement];
        uint64_t v23 = v22;
        if (v8)
        {
          uint64_t v24 = [v22 relevantEarnedInstance];
        }
        else
        {
          int v25 = [v22 earnedInstances];
          uint64_t v24 = [v25 lastObject];
        }
        long long v26 = [v24 earnedDateComponents];
        long long v27 = [v9 dateFromComponents:v26];

        if ([v27 compare:v13] == -1) {
          goto LABEL_20;
        }
        if ([v27 compare:v13]) {
          goto LABEL_21;
        }
        uint64_t v28 = [v6 template];
        unint64_t v32 = [v28 displayOrder];
        id v29 = [v23 template];
        unint64_t v31 = [v29 displayOrder];

        if (v32 <= v31)
        {
LABEL_21:
          BOOL v7 = 0;
        }
        else
        {
LABEL_20:
          id *v33 = v23;
          BOOL v7 = 1;
        }

        goto LABEL_23;
      }
    }
    BOOL v7 = 1;
    goto LABEL_23;
  }
  BOOL v7 = 0;
LABEL_25:

  return v7;
}

- (BOOL)_builtInBelongsInRelevants:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 template];
  char v5 = [v4 canonicalUnit];

  if (v5)
  {
    id v6 = [v3 template];
    BOOL v7 = [v6 canonicalUnit];

    char v8 = [v3 progress];
    [v8 doubleValueForUnit:v7];
    double v10 = v9;

    int v11 = [v3 goal];
    [v11 doubleValueForUnit:v7];
    double v13 = v12;

    BOOL v14 = [v3 template];
    int v15 = [v14 uniqueName];

    if (([v15 isEqualToString:@"NewMoveRecord"] & 1) != 0
      || ([v15 isEqualToString:@"NewMoveTimeRecord"] & 1) != 0
      || ([v15 isEqualToString:@"NewExerciseRecord"] & 1) != 0
      || ([v15 isEqualToString:@"MoveGoal200Percent"] & 1) != 0
      || ([v15 isEqualToString:@"MoveGoal300Percent"] & 1) != 0
      || [v15 isEqualToString:@"MoveGoal400Percent"])
    {
      BOOL v16 = v13 > 2.22044605e-16 && (v13 - v10) / v13 < 0.1;
      int v18 = v13 > v10 && v16;
    }
    else
    {
      int v18 = 0;
    }
    if (([v15 isEqualToString:@"PerfectWeekMove"] & 1) != 0
      || ([v15 isEqualToString:@"PerfectWeekExercise"] & 1) != 0
      || ([v15 isEqualToString:@"PerfectWeekStand"] & 1) != 0
      || [v15 isEqualToString:@"PerfectWeekAll"])
    {
      int v19 = [MEMORY[0x263EFF8F0] currentCalendar];
      int v20 = [MEMORY[0x263EFF910] date];
      if (AAUITrophyCaseShouldShowPerfectWeekAchievement(v19, v20, v10)) {
        int v18 = 1;
      }
    }
    unint64_t v21 = llround(v10);
    if ([v15 isEqualToString:@"LongestMoveStreak"])
    {
      if (ACHShouldUseNewAwardsSystem())
      {
        int v22 = [v3 relevantEarnedInstance];
      }
      else
      {
        uint64_t v23 = [v3 earnedInstances];
        int v22 = [v23 lastObject];
      }
      uint64_t v24 = [v22 value];
      int v25 = [v3 template];
      long long v26 = [v25 canonicalUnit];
      [v24 doubleValueForUnit:v26];
      unint64_t v28 = llround(v27);

      if (v28 + ~v21 < 2) {
        int v18 = 1;
      }
    }
    if ((([v15 isEqualToString:@"100MoveGoals"] & 1) != 0
       || ([v15 isEqualToString:@"365MoveGoals"] & 1) != 0
       || ([v15 isEqualToString:@"500MoveGoals"] & 1) != 0
       || ([v15 isEqualToString:@"1000MoveGoals"] & 1) != 0
       || ([v15 isEqualToString:@"1250MoveGoals"] & 1) != 0
       || ([v15 isEqualToString:@"1500MoveGoals"] & 1) != 0
       || ([v15 isEqualToString:@"1750MoveGoals"] & 1) != 0
       || [v15 isEqualToString:@"2000MoveGoals"])
      && llround(v13) + ~v21 < 9)
    {
      int v18 = 1;
    }

    BOOL v17 = v18 != 0;
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

void __56__AAUIAchievementsDataProvider_setDidFinishInitialLoad___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 8))
  {
    *(unsigned char *)(v1 + 8) = *(unsigned char *)(a1 + 40);
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v3 = *(id *)(*(void *)(a1 + 32) + 224);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "achievementsDataProviderDidFinishInitialLoad:", *(void *)(a1 + 32), (void)v8);
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }

    dispatch_async(MEMORY[0x263EF83A0], &__block_literal_global_1);
  }
}

void __39__AAUIAchievementsDataProvider__reload__block_invoke_2(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 232);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v17;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * v6++) achievementsDataProviderDidUpdate:*(void *)(a1 + 32)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v4);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *(id *)(*(void *)(a1 + 32) + 240);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "achievementsDataProviderDidUpdate:", *(void *)(a1 + 32), (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v20 count:16];
    }
    while (v9);
  }
}

void __56__AAUIAchievementsDataProvider_setDidFinishInitialLoad___block_invoke_2()
{
  id v0 = [MEMORY[0x263F08A00] defaultCenter];
  [v0 postNotificationName:@"AAUIAchievementsDataProviderDidFinishInitialLoad" object:0];
}

void __39__AAUIAchievementsDataProvider__reload__block_invoke_3()
{
  id v0 = [MEMORY[0x263F08A00] defaultCenter];
  [v0 postNotificationName:@"AAUIAchievementsDataProviderDidUpdateAchievement" object:0];
}

void __39__AAUIAchievementsDataProvider__reload__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _deepCopyClientFacingModel];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 192);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__AAUIAchievementsDataProvider__reload__block_invoke_2;
  block[3] = &unk_264860DC0;
  block[4] = v2;
  dispatch_sync(v3, block);
  dispatch_async(MEMORY[0x263EF83A0], &__block_literal_global_430);
}

- (double)queryRetryDelay
{
  double result = fmin(self->_queryRetryDelay + 0.2, 5.0);
  self->_queryRetryDelay = result;
  return result;
}

void __43__AAUIAchievementsDataProvider_awardsQuery__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = [MEMORY[0x263EFFA08] setWithArray:a2];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleDeletedAchievements:v4];
}

- (ACHQuery)query
{
  query = self->_query;
  if (!query)
  {
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __37__AAUIAchievementsDataProvider_query__block_invoke;
    aBlock[3] = &unk_264860CF8;
    objc_copyWeak(&v14, &location);
    id v4 = _Block_copy(aBlock);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __37__AAUIAchievementsDataProvider_query__block_invoke_2;
    v11[3] = &unk_264860CF8;
    objc_copyWeak(&v12, &location);
    uint64_t v5 = _Block_copy(v11);
    uint64_t v6 = (ACHQuery *)[objc_alloc(MEMORY[0x263F236C8]) initWithInitialAchievementsHandler:v4 newAchievementsHandler:v4 updatedAchievementsHandler:v4 removedAchievementsHandler:v5];
    id v7 = self->_query;
    self->_query = v6;

    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __37__AAUIAchievementsDataProvider_query__block_invoke_3;
    v9[3] = &unk_264860D48;
    objc_copyWeak(&v10, &location);
    [(ACHQuery *)self->_query setErrorHandler:v9];
    objc_destroyWeak(&v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
    query = self->_query;
  }
  return query;
}

void __37__AAUIAchievementsDataProvider_query__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleUpdatedAchievements:v3];
}

void __37__AAUIAchievementsDataProvider_query__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleDeletedAchievements:v3];
}

void __37__AAUIAchievementsDataProvider_query__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = ACHLogDefault();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v3;
    _os_log_impl(&dword_229290000, v4, OS_LOG_TYPE_DEFAULT, "Restarting query due to error... : %@", buf, 0xCu);
  }

  uint64_t v5 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v5);
  double v7 = (double)[WeakRetained queryRetryCount];

  dispatch_time_t v8 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__AAUIAchievementsDataProvider_query__block_invoke_421;
  block[3] = &unk_264860D20;
  objc_copyWeak(&v10, v5);
  dispatch_after(v8, MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v10);
}

void __37__AAUIAchievementsDataProvider_query__block_invoke_421(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained cycleQuery];
}

- (void)cycleQuery
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_229290000, log, OS_LOG_TYPE_ERROR, "Max query retry count reached. This is fatal. We're giving up now.", v1, 2u);
}

- (void)addInitialLoadObserver:(id)a3
{
  id v4 = a3;
  observerQueue = self->_observerQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__AAUIAchievementsDataProvider_addInitialLoadObserver___block_invoke;
  v7[3] = &unk_264860D70;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(observerQueue, v7);
}

uint64_t __55__AAUIAchievementsDataProvider_addInitialLoadObserver___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) didFinishInitialLoad]) {
    [*(id *)(a1 + 40) achievementsDataProviderDidFinishInitialLoad:*(void *)(a1 + 32)];
  }
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 224);
  return [v3 addObject:v2];
}

- (void)removeInitialLoadObserver:(id)a3
{
  id v4 = a3;
  observerQueue = self->_observerQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__AAUIAchievementsDataProvider_removeInitialLoadObserver___block_invoke;
  v7[3] = &unk_264860D70;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(observerQueue, v7);
}

uint64_t __58__AAUIAchievementsDataProvider_removeInitialLoadObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 224) removeObject:*(void *)(a1 + 40)];
}

- (void)addRecentAndRelevantSectionObserver:(id)a3
{
  id v4 = a3;
  observerQueue = self->_observerQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __68__AAUIAchievementsDataProvider_addRecentAndRelevantSectionObserver___block_invoke;
  v7[3] = &unk_264860D70;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(observerQueue, v7);
}

uint64_t __68__AAUIAchievementsDataProvider_addRecentAndRelevantSectionObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 232) addObject:*(void *)(a1 + 40)];
}

- (void)removeRecentAndRelevantSectionObserver:(id)a3
{
  id v4 = a3;
  observerQueue = self->_observerQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __71__AAUIAchievementsDataProvider_removeRecentAndRelevantSectionObserver___block_invoke;
  v7[3] = &unk_264860D70;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(observerQueue, v7);
}

uint64_t __71__AAUIAchievementsDataProvider_removeRecentAndRelevantSectionObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 232) removeObject:*(void *)(a1 + 40)];
}

- (void)addMainSectionObserver:(id)a3
{
  id v4 = a3;
  observerQueue = self->_observerQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__AAUIAchievementsDataProvider_addMainSectionObserver___block_invoke;
  v7[3] = &unk_264860D70;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(observerQueue, v7);
}

uint64_t __55__AAUIAchievementsDataProvider_addMainSectionObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 240) addObject:*(void *)(a1 + 40)];
}

- (void)removeMainSectionObserver:(id)a3
{
  id v4 = a3;
  observerQueue = self->_observerQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__AAUIAchievementsDataProvider_removeMainSectionObserver___block_invoke;
  v7[3] = &unk_264860D70;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(observerQueue, v7);
}

uint64_t __58__AAUIAchievementsDataProvider_removeMainSectionObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 240) removeObject:*(void *)(a1 + 40)];
}

- (void)stopFetching
{
  if (ACHShouldUseNewAwardsSystem())
  {
    id v3 = [(AAUIAchievementsDataProvider *)self awardsQuery];
    [v3 deactivate];
    uint64_t v4 = 32;
  }
  else
  {
    id v3 = [(AAUIAchievementsDataProvider *)self healthStore];
    uint64_t v5 = [(AAUIAchievementsDataProvider *)self query];
    [v3 stopQuery:v5];

    uint64_t v4 = 24;
  }

  id v6 = *(Class *)((char *)&self->super.isa + v4);
  *(Class *)((char *)&self->super.isa + v4) = 0;
}

- (id)headerStringForSection:(int64_t)a3 isRecentAndRelevant:(BOOL)a4
{
  if (a4) {
    [(AAUIAchievementsDataProvider *)self orderedRecentAndRelevantHeaderStrings];
  }
  else {
  uint64_t v5 = [(AAUIAchievementsDataProvider *)self orderedMainSectionHeaderStrings];
  }
  id v6 = [v5 objectAtIndexedSubscript:a3];

  return v6;
}

- (int64_t)numberOfRecentAndRelevantSections
{
  return 1;
}

- (int64_t)numberOfItemsInRecentAndRelevantSection:(int64_t)a3
{
  id v3 = [(AAUIAchievementsDataProvider *)self clientRecentAchievements];
  int64_t v4 = [v3 count];

  return v4;
}

- (id)recentAndRelevantAchievementAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AAUIAchievementsDataProvider *)self clientRecentAchievements];
  uint64_t v6 = [v4 item];

  double v7 = [v5 objectAtIndexedSubscript:v6];

  return v7;
}

- (int64_t)numberOfSections
{
  uint64_t v2 = [(AAUIAchievementsDataProvider *)self orderedSections];
  int64_t v3 = [v2 count];

  return v3;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  if (a3)
  {
    uint64_t v5 = [(AAUIAchievementsDataProvider *)self orderedSections];
    uint64_t v6 = [v5 objectAtIndexedSubscript:a3];

    double v7 = [(AAUIAchievementsDataProvider *)self clientAchievementsBySection];
    id v8 = [v7 objectForKeyedSubscript:v6];

    int64_t v9 = [v8 count];
    return v9;
  }
  else
  {
    uint64_t v11 = [(AAUIAchievementsDataProvider *)self clientRecentAchievements];
    int64_t v12 = [v11 count] != 0;

    return v12;
  }
}

- (id)achievementAtIndexPath:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  uint64_t v5 = [(AAUIAchievementsDataProvider *)self orderedSections];
  uint64_t v6 = objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v4, "section"));

  double v7 = [(AAUIAchievementsDataProvider *)self clientAchievementsBySection];
  id v8 = [v7 objectForKeyedSubscript:v6];

  uint64_t v9 = [v4 item];
  id v10 = [v8 objectAtIndexedSubscript:v9];

  return v10;
}

- (id)trophyCaseAchievementForTemplateUniqueName:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  uint64_t v5 = [(AAUIAchievementsDataProvider *)self clientFilteredAchievementsByTemplateUniqueName];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)achievementForTemplateUniqueName:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  uint64_t v5 = [(AAUIAchievementsDataProvider *)self clientAchievementsByTemplateUniqueName];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)achievementsForDateComponents:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  uint64_t v5 = [(AAUIAchievementsDataProvider *)self clientAchievementsByEarnedDateComponents];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  if (v6) {
    id v7 = v6;
  }
  else {
    id v7 = objc_alloc_init(MEMORY[0x263EFFA08]);
  }
  id v8 = v7;

  return v8;
}

- (NSMutableArray)allAchievementsSortedByEarnedDate
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  int64_t v3 = [(AAUIAchievementsDataProvider *)self clientAllAchievementsSortedByEarnedDate];
  id v4 = v3;
  if (!v3) {
    int64_t v3 = (void *)MEMORY[0x263EFFA68];
  }
  uint64_t v5 = v3;

  return v5;
}

- (void)_handleDeletedAchievements:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AAUIAchievementsDataProvider *)self achievementsDataQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__AAUIAchievementsDataProvider__handleDeletedAchievements___block_invoke;
  v7[3] = &unk_264860D70;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __59__AAUIAchievementsDataProvider__handleDeletedAchievements___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int v5 = 0;
    int v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v2);
        }
        unint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "_deleteAchievement:fromUnfiltered:", *(void *)(*((void *)&v10 + 1) + 8 * v8), 1, (void)v10);
        v6 |= (v9 >> 3) & 1;
        v5 |= (v9 >> 2) & 1;
        ++v8;
      }
      while (v4 != v8);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);

    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
    if ((v5 | v6)) {
      [*(id *)(a1 + 32) _reload];
    }
  }
  else
  {

    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
  }
}

- (id)_oldestRecentAchievement
{
  uint64_t v3 = [MEMORY[0x263EFF8F0] currentCalendar];
  char v4 = ACHShouldUseNewAwardsSystem();
  int v5 = [(AAUIAchievementsDataProvider *)self recentAchievements];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  long long v12 = __56__AAUIAchievementsDataProvider__oldestRecentAchievement__block_invoke;
  long long v13 = &unk_264860DE8;
  char v15 = v4;
  id v14 = v3;
  id v6 = v3;
  uint64_t v7 = [v5 sortedArrayUsingComparator:&v10];

  uint64_t v8 = objc_msgSend(v7, "firstObject", v10, v11, v12, v13);

  return v8;
}

uint64_t __56__AAUIAchievementsDataProvider__oldestRecentAchievement__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v7 = [v5 relevantEarnedInstance];
  }
  else
  {
    uint64_t v8 = [v5 earnedInstances];
    uint64_t v7 = [v8 lastObject];
  }
  if (*(unsigned char *)(a1 + 40))
  {
    unint64_t v9 = [v6 relevantEarnedInstance];
  }
  else
  {
    uint64_t v10 = [v6 earnedInstances];
    unint64_t v9 = [v10 lastObject];
  }
  uint64_t v11 = *(void **)(a1 + 32);
  long long v12 = [v7 earnedDateComponents];
  long long v13 = [v11 dateFromComponents:v12];

  id v14 = *(void **)(a1 + 32);
  char v15 = [v9 earnedDateComponents];
  long long v16 = [v14 dateFromComponents:v15];

  uint64_t v17 = [v13 compare:v16];
  return v17;
}

- (BOOL)_remoteAchievementBelongsInRelevants:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263EFF8F0];
  id v4 = a3;
  id v5 = [v3 currentCalendar];
  id v6 = [v4 template];
  uint64_t v7 = [v6 availabilityStart];
  uint64_t v8 = [v5 dateFromComponents:v7];
  unint64_t v9 = [v5 startOfDayForDate:v8];

  uint64_t v10 = [v4 template];

  uint64_t v11 = [v10 availabilityEnd];
  long long v12 = [v5 dateFromComponents:v11];
  long long v13 = [v5 dateByAddingUnit:16 value:1 toDate:v12 options:0];
  id v14 = [v5 startOfDayForDate:v13];

  char v15 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v9 endDate:v14];
  long long v16 = [MEMORY[0x263EFF910] date];
  LOBYTE(v12) = [v15 containsDate:v16];

  return (char)v12;
}

- (BOOL)_monthlyChallengeBelongsInRelevants:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263EFF910];
  id v4 = a3;
  id v5 = [v3 date];
  char IsEarnable = AAUIMonthlyChallengeIsEarnable(v4, v5);

  return IsEarnable;
}

- (void)_updateAchievementsByEarnedDateComponentsWithAchievement:(id)a3 earnedInstance:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  uint64_t v7 = [(AAUIAchievementsDataProvider *)self achievementsByEarnedDateComponents];
  uint64_t v8 = [v6 earnedDateComponents];
  id v9 = [v7 objectForKeyedSubscript:v8];

  if (!v9) {
    id v9 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  }
  uint64_t v10 = [v9 allObjects];
  uint64_t v11 = [v16 template];
  long long v12 = [v11 uniqueName];
  long long v13 = AAUIAchievementInArrayWithUniqueName(v10, v12);

  if (v13)
  {
    if (AAUICompareAchievementsByMostRecentEarnedDate(v13, v16) == 1) {
      goto LABEL_7;
    }
    [v9 removeObject:v13];
  }
  [v9 addObject:v16];
LABEL_7:
  id v14 = [(AAUIAchievementsDataProvider *)self achievementsByEarnedDateComponents];
  char v15 = [v6 earnedDateComponents];
  [v14 setObject:v9 forKeyedSubscript:v15];
}

- (void)_deleteAchievementsByEarnedDateWithAchievement:(id)a3 earnedInstance:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  uint64_t v7 = [(AAUIAchievementsDataProvider *)self achievementsByEarnedDateComponents];
  uint64_t v8 = [v6 earnedDateComponents];

  id v9 = [v7 objectForKeyedSubscript:v8];

  if (v9) {
    [v9 removeObject:v10];
  }
}

- (id)_recentAndRelevantSectionIndexPathForAchievement:(id)a3
{
  id v4 = a3;
  id v5 = [(AAUIAchievementsDataProvider *)self recentAchievements];
  uint64_t v6 = [v5 indexOfObject:v4];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = [MEMORY[0x263F088C8] indexPathForItem:v6 inSection:0];
  }
  return v7;
}

- (id)_mainSectionIndexPathForAchievement:(id)a3
{
  id v4 = a3;
  id v5 = [v4 section];
  uint64_t v6 = [(AAUIAchievementsDataProvider *)self orderedSections];
  uint64_t v7 = [v6 indexOfObject:v5];

  uint64_t v8 = [(AAUIAchievementsDataProvider *)self achievementsBySection];
  id v9 = [v8 objectForKeyedSubscript:v5];

  uint64_t v10 = [v9 indexOfObject:v4];
  uint64_t v11 = 0;
  if (v7 != 0x7FFFFFFFFFFFFFFFLL && v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v11 = [MEMORY[0x263F088C8] indexPathForItem:v10 inSection:v7];
  }

  return v11;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

- (void)setQuery:(id)a3
{
}

- (void)setAwardsQuery:(id)a3
{
}

- (void)setVisibilityEvaluator:(id)a3
{
}

- (void)setAchievementsBySection:(id)a3
{
}

- (void)setRecentAchievements:(id)a3
{
}

- (void)setRelevantAchievements:(id)a3
{
}

- (void)setFilteredAchievementsByTemplateUniqueName:(id)a3
{
}

- (void)setAchievementsByTemplateUniqueName:(id)a3
{
}

- (void)setAchievementsByEarnedDateComponents:(id)a3
{
}

- (NSArray)orderedSections
{
  return self->_orderedSections;
}

- (void)setOrderedSections:(id)a3
{
}

- (NSArray)orderedMainSectionHeaderStrings
{
  return self->_orderedMainSectionHeaderStrings;
}

- (void)setOrderedMainSectionHeaderStrings:(id)a3
{
}

- (NSArray)orderedRecentAndRelevantHeaderStrings
{
  return self->_orderedRecentAndRelevantHeaderStrings;
}

- (void)setOrderedRecentAndRelevantHeaderStrings:(id)a3
{
}

- (NSDictionary)clientAchievementsBySection
{
  return self->_clientAchievementsBySection;
}

- (NSArray)clientAllAchievementsSortedByEarnedDate
{
  return self->_clientAllAchievementsSortedByEarnedDate;
}

- (NSArray)clientRecentAchievements
{
  return self->_clientRecentAchievements;
}

- (NSArray)clientRelevantAchievements
{
  return self->_clientRelevantAchievements;
}

- (NSDictionary)clientFilteredAchievementsByTemplateUniqueName
{
  return self->_clientFilteredAchievementsByTemplateUniqueName;
}

- (NSDictionary)clientAchievementsByTemplateUniqueName
{
  return self->_clientAchievementsByTemplateUniqueName;
}

- (NSDictionary)clientAchievementsByEarnedDateComponents
{
  return self->_clientAchievementsByEarnedDateComponents;
}

- (BOOL)didFinishInitialLoad
{
  return self->_didFinishInitialLoad;
}

- (void)setAchievementsDataQueue:(id)a3
{
}

- (OS_dispatch_queue)observerQueue
{
  return self->_observerQueue;
}

- (void)setObserverQueue:(id)a3
{
}

- (void)setOverrideDisplayState:(int64_t)a3
{
  self->_overrideDisplayState = a3;
}

- (void)setQueryRetryDelay:(double)a3
{
  self->_queryRetryDelay = a3;
}

- (int64_t)queryRetryCount
{
  return self->_queryRetryCount;
}

- (void)setQueryRetryCount:(int64_t)a3
{
  self->_queryRetryCount = a3;
}

- (os_unfair_lock_s)modelLock
{
  return self->_modelLock;
}

- (void)setModelLock:(os_unfair_lock_s)a3
{
  self->_modelLocuint64_t k = a3;
}

- (NSHashTable)initialLoadObservers
{
  return self->_initialLoadObservers;
}

- (void)setInitialLoadObservers:(id)a3
{
}

- (NSHashTable)recentAndRelevantSectionObservers
{
  return self->_recentAndRelevantSectionObservers;
}

- (void)setRecentAndRelevantSectionObservers:(id)a3
{
}

- (NSHashTable)mainSectionObservers
{
  return self->_mainSectionObservers;
}

- (void)setMainSectionObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainSectionObservers, 0);
  objc_storeStrong((id *)&self->_recentAndRelevantSectionObservers, 0);
  objc_storeStrong((id *)&self->_initialLoadObservers, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_achievementsDataQueue, 0);
  objc_storeStrong((id *)&self->_clientAchievementsByEarnedDateComponents, 0);
  objc_storeStrong((id *)&self->_clientAchievementsByTemplateUniqueName, 0);
  objc_storeStrong((id *)&self->_clientFilteredAchievementsByTemplateUniqueName, 0);
  objc_storeStrong((id *)&self->_clientRelevantAchievements, 0);
  objc_storeStrong((id *)&self->_clientRecentAchievements, 0);
  objc_storeStrong((id *)&self->_clientAllAchievementsSortedByEarnedDate, 0);
  objc_storeStrong((id *)&self->_clientAchievementsBySection, 0);
  objc_storeStrong((id *)&self->_orderedRecentAndRelevantHeaderStrings, 0);
  objc_storeStrong((id *)&self->_orderedMainSectionHeaderStrings, 0);
  objc_storeStrong((id *)&self->_orderedSections, 0);
  objc_storeStrong((id *)&self->_allAchievementsSortedByEarnedDate, 0);
  objc_storeStrong((id *)&self->_achievementsByEarnedDateComponents, 0);
  objc_storeStrong((id *)&self->_achievementsByTemplateUniqueName, 0);
  objc_storeStrong((id *)&self->_filteredAchievementsByTemplateUniqueName, 0);
  objc_storeStrong((id *)&self->_relevantAchievements, 0);
  objc_storeStrong((id *)&self->_recentAchievements, 0);
  objc_storeStrong((id *)&self->_achievementsBySection, 0);
  objc_storeStrong((id *)&self->_visibilityEvaluator, 0);
  objc_storeStrong((id *)&self->_awardsQuery, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

void __59__AAUIAchievementsDataProvider__handleUpdatedAchievements___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_229290000, v0, OS_LOG_TYPE_ERROR, "Error reading activity move mode characteristic while updating achievements. error=%@", v1, 0xCu);
}

@end
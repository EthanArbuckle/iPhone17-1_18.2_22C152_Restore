@interface ACHMonthlyChallengeTemplateSource
- (ACHMonthlyChallengeDataSource)dataSource;
- (ACHMonthlyChallengeTemplateDataProvider)templateDataProvider;
- (ACHMonthlyChallengeTemplateSource)initWithDataSource:(id)a3 dataProvider:(id)a4 templateCache:(id)a5;
- (ACHSyncingMonthlyChallengeTemplateCache)templateCache;
- (BOOL)_createMonthlyChallengeWithMonthDateInterval:(id)a3 monthlyChallengeTemplates:(id *)a4 error:(id *)a5;
- (BOOL)_isInFirstWeekOfCurrentMonth:(id)a3;
- (BOOL)_shouldOverrideMonthlyChallengeCadence;
- (BOOL)isAppleWatch;
- (BOOL)isGoalValueForMonthlyChallengeTypeValid:(unint64_t)a3 error:(id *)a4;
- (BOOL)isMonthlyChallengeOfTypeAvailable:(unint64_t)a3 error:(id *)a4;
- (BOOL)isStandalonePhoneFitnessMode;
- (BOOL)sourceShouldRunForDate:(id)a3;
- (BOOL)subObjectsHaveDatabaseAssertions;
- (NSCalendar)currentCalendar;
- (NSDate)currentDate;
- (NSString)identifier;
- (double)_capGoalValueForChallengeType:(unint64_t)a3 goalValue:(double)a4;
- (double)_goalValueForCurrentMonthForType:(unint64_t)a3 error:(id *)a4;
- (double)_roundedGoalValue:(double)a3 monthlyChallengeType:(unint64_t)a4;
- (double)_targetGoalValueForCurrentMonthForType:(unint64_t)a3 error:(id *)a4;
- (id)_availableMonthlyChallengeTypes;
- (id)_createMonthlyChallengeTemplateWithType:(unint64_t)a3 dateCompoonentInterval:(id)a4 goalValue:(double)a5;
- (id)_dateComponentIntervalForCurrentMonth;
- (id)_dateComponentIntervalForLastMonth;
- (id)_dateComponentIntervalForTwoMonthsAgo;
- (id)_maximumValueForMonthlyChallengeType:(unint64_t)a3;
- (id)_minimumValueForMonthlyChallengeType:(unint64_t)a3;
- (id)_modelsDirectoryBasePathForTemplate:(id)a3;
- (id)_monthlyAchievementsAssetsDirectoryBasePath;
- (id)_pairedWatchDeviceCapabilities;
- (id)_suffixForCurrentMonthForType:(unint64_t)a3 template:(id)a4 goal:(double)a5 error:(id *)a6;
- (id)customPlaceholderValuesForTemplate:(id)a3 error:(id *)a4;
- (id)localizationBundleURLForTemplate:(id)a3;
- (id)pairedDeviceRegistrySharedInstance;
- (id)possibleLocalizationSuffixesForTemplate:(id)a3;
- (id)propertyListBundleURLForTemplate:(id)a3;
- (id)resourceBundleURLForTemplate:(id)a3;
- (id)stickerBundleURLForTemplate:(id)a3;
- (int64_t)_monthlyChallengeTemplateSourceActionForDate:(id)a3 existingTemplate:(id)a4;
- (int64_t)runCadence;
- (unint64_t)_getRandomMonthlyChallengeType;
- (unint64_t)_numberOfDaysInMonthForDate:(id)a3;
- (void)_didOverrideMonthlyChallengeCadence;
- (void)_removeMonthlyChallengeTemplate:(id)a3 monthlyChallengeTemplates:(id *)a4 templatesToRemove:(id *)a5;
- (void)setCurrentCalendar:(id)a3;
- (void)setCurrentCalendarOverride:(id)a3;
- (void)setCurrentDate:(id)a3;
- (void)setCurrentDateOverride:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setIsAppleWatch:(BOOL)a3;
- (void)setIsStandalonePhoneFitnessMode:(BOOL)a3;
- (void)setIsStandalonePhoneFitnessModeOverride:(BOOL)a3;
- (void)setPairedDeviceRegistrySharedInstanceOverride:(id)a3;
- (void)setTemplateCache:(id)a3;
- (void)setTemplateDataProvider:(id)a3;
- (void)templatesForDate:(id)a3 completion:(id)a4;
- (void)templatesForDate:(id)a3 databaseContext:(id)a4 completion:(id)a5;
@end

@implementation ACHMonthlyChallengeTemplateSource

- (ACHMonthlyChallengeTemplateSource)initWithDataSource:(id)a3 dataProvider:(id)a4 templateCache:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ACHMonthlyChallengeTemplateSource;
  v12 = [(ACHMonthlyChallengeTemplateSource *)&v19 init];
  if (v12)
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendarWithLocalTimeZone");
    currentCalendar = v12->_currentCalendar;
    v12->_currentCalendar = (NSCalendar *)v13;

    objc_storeStrong((id *)&v12->_dataSource, a3);
    objc_storeStrong((id *)&v12->_templateDataProvider, a4);
    objc_storeStrong((id *)&v12->_templateCache, a5);
    uint64_t v15 = [MEMORY[0x263EFF910] date];
    currentDate = v12->_currentDate;
    v12->_currentDate = (NSDate *)v15;

    v17 = [MEMORY[0x263F0A980] sharedBehavior];
    v12->_isAppleWatch = [v17 isAppleWatch];
  }
  return v12;
}

- (NSString)identifier
{
  return (NSString *)(id)*MEMORY[0x263F23618];
}

- (int64_t)runCadence
{
  return 2;
}

- (BOOL)sourceShouldRunForDate:(id)a3
{
  return ![(ACHMonthlyChallengeTemplateSource *)self isAppleWatch];
}

- (int64_t)_monthlyChallengeTemplateSourceActionForDate:(id)a3 existingTemplate:(id)a4
{
  id v6 = a3;
  id v7 = objc_alloc(MEMORY[0x263EFFA40]);
  v8 = (void *)[v7 initWithSuiteName:*MEMORY[0x263F23588]];
  int v9 = [v8 BOOLForKey:*MEMORY[0x263F23458]];
  char v10 = [v8 BOOLForKey:*MEMORY[0x263F23450]];
  int64_t v11 = v9 ^ 1u;
  if ((v9 & 1) == 0 && (v10 & 1) == 0)
  {
    if ([(ACHMonthlyChallengeTemplateSource *)self _shouldOverrideMonthlyChallengeCadence])
    {
      int64_t v11 = 2;
    }
    else if ([(ACHMonthlyChallengeTemplateSource *)self _isInFirstWeekOfCurrentMonth:v6])
    {
      v12 = [(ACHMonthlyChallengeTemplateSource *)self templateDataProvider];
      id v18 = 0;
      char v13 = [v12 hasMinimumActiveDaysWithError:&v18];
      id v14 = v18;

      uint64_t v15 = 5;
      if (!a4) {
        uint64_t v15 = 6;
      }
      uint64_t v16 = 7;
      if (!v14) {
        uint64_t v16 = 4;
      }
      if (v13) {
        int64_t v11 = v15;
      }
      else {
        int64_t v11 = v16;
      }
    }
    else
    {
      int64_t v11 = 3;
    }
  }

  return v11;
}

- (void)templatesForDate:(id)a3 completion:(id)a4
{
}

- (void)templatesForDate:(id)a3 databaseContext:(id)a4 completion:(id)a5
{
  uint64_t v93 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v54 = a4;
  v52 = v8;
  v53 = (void (**)(id, id, id, id))a5;
  if ([(ACHMonthlyChallengeTemplateSource *)self sourceShouldRunForDate:v8])
  {
    v55 = self;
    int v9 = [(ACHMonthlyChallengeTemplateSource *)self dataSource];
    [v9 setDatabaseContext:v54];

    char v10 = [(ACHMonthlyChallengeTemplateSource *)self templateCache];
    [v10 setDatabaseContext:v54];

    int64_t v11 = [(ACHMonthlyChallengeTemplateSource *)self templateDataProvider];
    v12 = [v11 existingMonthlyChallengeTemplates];

    char v13 = [(ACHMonthlyChallengeTemplateSource *)self _dateComponentIntervalForCurrentMonth];
    uint64_t v82 = 0;
    v83 = &v82;
    uint64_t v84 = 0x3032000000;
    v85 = __Block_byref_object_copy__20;
    v86 = __Block_byref_object_dispose__20;
    id v87 = 0;
    v79[0] = MEMORY[0x263EF8330];
    v79[1] = 3221225472;
    v79[2] = __81__ACHMonthlyChallengeTemplateSource_templatesForDate_databaseContext_completion___block_invoke;
    v79[3] = &unk_264517428;
    id v50 = v13;
    id v80 = v50;
    v81 = &v82;
    objc_msgSend(v12, "hk_map:", v79);
    id v14 = (id)objc_claimAutoreleasedReturnValue();

    v77[0] = MEMORY[0x263EF8330];
    v77[1] = 3221225472;
    v77[2] = __81__ACHMonthlyChallengeTemplateSource_templatesForDate_databaseContext_completion___block_invoke_3;
    v77[3] = &unk_264517470;
    id v78 = &__block_literal_global_19;
    v47 = objc_msgSend(v14, "hk_map:", v77);
    uint64_t v15 = [(ACHMonthlyChallengeTemplateSource *)self templateCache];
    id v76 = 0;
    v51 = [v15 allCachedTemplatesWithError:&v76];
    id v49 = v76;

    if (v49)
    {
      uint64_t v16 = ACHLogMonthlyChallenges();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[ACHMonthlyChallengeTemplateSource templatesForDate:databaseContext:completion:]((uint64_t)v49, v16);
      }
    }
    if ([v51 count])
    {
      id v17 = objc_alloc_init(MEMORY[0x263EFF918]);
      id v18 = [v50 startDateComponents];
      objc_msgSend(v17, "setYear:", objc_msgSend(v18, "year"));

      objc_super v19 = [v50 startDateComponents];
      objc_msgSend(v17, "setMonth:", objc_msgSend(v19, "month"));

      v71[0] = MEMORY[0x263EF8330];
      v71[1] = 3221225472;
      v71[2] = __81__ACHMonthlyChallengeTemplateSource_templatesForDate_databaseContext_completion___block_invoke_291;
      v71[3] = &unk_264517498;
      id v74 = &__block_literal_global_19;
      id v72 = v47;
      id v20 = v17;
      id v73 = v20;
      v75 = &v82;
      v21 = objc_msgSend(v51, "hk_map:", v71);
      if ([v21 count])
      {
        uint64_t v22 = [v14 setByAddingObjectsFromArray:v21];

        id v14 = (id)v22;
      }
    }
    switch([(ACHMonthlyChallengeTemplateSource *)self _monthlyChallengeTemplateSourceActionForDate:v8 existingTemplate:v83[5]])
    {
      case 0:
        v23 = ACHLogMonthlyChallenges();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21F5DA000, v23, OS_LOG_TYPE_DEFAULT, "User has tapped the Monthly Challenge generation button.", buf, 2u);
        }

        v69 = 0;
        id v70 = v14;
        [(ACHMonthlyChallengeTemplateSource *)self _createMonthlyChallengeWithMonthDateInterval:v50 monthlyChallengeTemplates:&v70 error:&v69];
        id v24 = v70;

        v25 = v69;
        goto LABEL_39;
      case 1:
        v28 = ACHLogMonthlyChallenges();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21F5DA000, v28, OS_LOG_TYPE_DEFAULT, "User has tapped the Monthly Challenge delete button.", buf, 2u);
        }

        uint64_t v29 = v83[5];
        id v67 = 0;
        id v68 = v14;
        [(ACHMonthlyChallengeTemplateSource *)self _removeMonthlyChallengeTemplate:v29 monthlyChallengeTemplates:&v68 templatesToRemove:&v67];
        id v24 = v68;

        id v46 = v67;
        id v48 = 0;
        goto LABEL_40;
      case 2:
        v30 = ACHLogMonthlyChallenges();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21F5DA000, v30, OS_LOG_TYPE_DEFAULT, "Overriding monthly challenge cadence; deleting old monthly challenge and generating a new one.",
            buf,
            2u);
        }

        uint64_t v31 = v83[5];
        id v65 = 0;
        id v66 = v14;
        [(ACHMonthlyChallengeTemplateSource *)self _removeMonthlyChallengeTemplate:v31 monthlyChallengeTemplates:&v66 templatesToRemove:&v65];
        id v32 = v66;

        id v46 = v65;
        id v63 = 0;
        id v64 = v32;
        [(ACHMonthlyChallengeTemplateSource *)self _createMonthlyChallengeWithMonthDateInterval:v50 monthlyChallengeTemplates:&v64 error:&v63];
        id v14 = v64;

        id v48 = v63;
        if (v48) {
          goto LABEL_41;
        }
        [(ACHMonthlyChallengeTemplateSource *)self _didOverrideMonthlyChallengeCadence];
        goto LABEL_35;
      case 3:
        v33 = ACHLogMonthlyChallenges();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21F5DA000, v33, OS_LOG_TYPE_DEFAULT, "Not generating monthly challenge template for current month because not the first week of the month.", buf, 2u);
        }
        goto LABEL_33;
      case 4:
        v33 = ACHLogMonthlyChallenges();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21F5DA000, v33, OS_LOG_TYPE_DEFAULT, "Not generating monthly challenge template for current month because user does not have minimum active days.", buf, 2u);
        }
        goto LABEL_33;
      case 5:
        v33 = ACHLogMonthlyChallenges();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          v34 = [(id)v83[5] uniqueName];
          *(_DWORD *)buf = 138543362;
          v89 = v34;
          _os_log_impl(&dword_21F5DA000, v33, OS_LOG_TYPE_DEFAULT, "Not generating monthly challenge template for current month because one already exists for the month: %{public}@", buf, 0xCu);
        }
        goto LABEL_33;
      case 6:
        v35 = ACHLogMonthlyChallenges();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21F5DA000, v35, OS_LOG_TYPE_DEFAULT, "Attempting to generate a monthly challenge for the current month.", buf, 2u);
        }

        v61 = 0;
        id v62 = v14;
        [(ACHMonthlyChallengeTemplateSource *)self _createMonthlyChallengeWithMonthDateInterval:v50 monthlyChallengeTemplates:&v62 error:&v61];
        id v24 = v62;

        v25 = v61;
LABEL_39:
        id v48 = v25;
        id v46 = 0;
LABEL_40:
        id v14 = v24;
        goto LABEL_41;
      case 7:
        v33 = ACHLogMonthlyChallenges();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21F5DA000, v33, OS_LOG_TYPE_DEFAULT, "Not generating monthly challenge template for current month because we encountered an error condition.", buf, 2u);
        }
LABEL_33:

        goto LABEL_34;
      default:
LABEL_34:
        id v46 = 0;
LABEL_35:
        id v48 = 0;
LABEL_41:
        long long v59 = 0u;
        long long v60 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        id v36 = v14;
        uint64_t v37 = [v36 countByEnumeratingWithState:&v57 objects:v92 count:16];
        if (v37)
        {
          uint64_t v38 = *(void *)v58;
          do
          {
            for (uint64_t i = 0; i != v37; ++i)
            {
              if (*(void *)v58 != v38) {
                objc_enumerationMutation(v36);
              }
              v40 = *(void **)(*((void *)&v57 + 1) + 8 * i);
              v41 = [(ACHMonthlyChallengeTemplateSource *)v55 templateCache];
              id v56 = 0;
              [v41 cacheTemplate:v40 error:&v56];
              id v42 = v56;

              if (v42)
              {
                v43 = ACHLogMonthlyChallenges();
                if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  v89 = v40;
                  __int16 v90 = 2112;
                  id v91 = v42;
                  _os_log_impl(&dword_21F5DA000, v43, OS_LOG_TYPE_DEFAULT, "[#mc] Error caching template %@: %@", buf, 0x16u);
                }
              }
            }
            uint64_t v37 = [v36 countByEnumeratingWithState:&v57 objects:v92 count:16];
          }
          while (v37);
        }

        if (v53) {
          v53[2](v53, v36, v46, v48);
        }
        v44 = [(ACHMonthlyChallengeTemplateSource *)v55 dataSource];
        [v44 setDatabaseContext:0];

        v45 = [(ACHMonthlyChallengeTemplateSource *)v55 templateCache];
        [v45 setDatabaseContext:0];

        _Block_object_dispose(&v82, 8);
        v27 = v53;
        break;
    }
  }
  else
  {
    v26 = [MEMORY[0x263EFFA08] set];
    v27 = v53;
    v53[2](v53, v26, 0, 0);
  }
}

id __81__ACHMonthlyChallengeTemplateSource_templatesForDate_databaseContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = ACHMonthlyChallengeTemplateFromTemplate();
  id v5 = v3;
  uint64_t v6 = [v5 version];
  id v7 = v5;
  if (v6 != [v4 version])
  {
    id v7 = v4;
  }
  id v8 = [v7 availabilityStart];
  int v9 = [*(id *)(a1 + 32) startDateComponents];
  int v10 = [v8 isEqual:v9];

  if (v10) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v7);
  }

  return v7;
}

id __81__ACHMonthlyChallengeTemplateSource_templatesForDate_databaseContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 componentsSeparatedByString:@"_"];
  if ([v2 count] == 3)
  {
    id v3 = [v2 objectAtIndexedSubscript:1];
    uint64_t v4 = [v3 integerValue];

    id v5 = [v2 objectAtIndexedSubscript:2];
    uint64_t v6 = [v5 integerValue];

    id v7 = objc_alloc_init(MEMORY[0x263EFF918]);
    [v7 setYear:v4];
    [v7 setMonth:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

id __81__ACHMonthlyChallengeTemplateSource_templatesForDate_databaseContext_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 uniqueName];
  uint64_t v4 = (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  return v4;
}

id __81__ACHMonthlyChallengeTemplateSource_templatesForDate_databaseContext_completion___block_invoke_291(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = [v4 uniqueName];
  id v7 = (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  if ([*(id *)(a1 + 32) containsObject:v7])
  {
    id v8 = 0;
  }
  else
  {
    if ([v7 isEqual:*(void *)(a1 + 40)])
    {
      uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v11 = *(void *)(v9 + 40);
      int v10 = (id *)(v9 + 40);
      if (!v11) {
        objc_storeStrong(v10, a2);
      }
    }
    id v8 = v4;
  }

  return v8;
}

- (BOOL)_createMonthlyChallengeWithMonthDateInterval:(id)a3 monthlyChallengeTemplates:(id *)a4 error:(id *)a5
{
  v69[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  unint64_t v9 = [(ACHMonthlyChallengeTemplateSource *)self _getRandomMonthlyChallengeType];
  if (v9)
  {
    unint64_t v10 = v9;
    [(ACHMonthlyChallengeTemplateSource *)self _goalValueForCurrentMonthForType:v9 error:a5];
    -[ACHMonthlyChallengeTemplateSource _capGoalValueForChallengeType:goalValue:](self, "_capGoalValueForChallengeType:goalValue:", v10);
    if (*a5)
    {
      v12 = ACHLogMonthlyChallenges();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
LABEL_25:
        int v36 = 1;
        goto LABEL_26;
      }
      id v13 = *a5;
      *(_DWORD *)buf = 138412290;
      unint64_t v61 = (unint64_t)v13;
      id v14 = "Error in creating goal for new monthly challenge: %@";
      uint64_t v15 = v12;
      uint32_t v16 = 12;
    }
    else
    {
      double v22 = v11;
      if (v11 <= 2.22044605e-16)
      {
        id v32 = ACHLogMonthlyChallenges();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218498;
          unint64_t v61 = v10;
          __int16 v62 = 2112;
          unint64_t v63 = (unint64_t)v8;
          __int16 v64 = 2048;
          double v65 = v22;
          _os_log_impl(&dword_21F5DA000, v32, OS_LOG_TYPE_DEFAULT, "[#mc] Monthly challenge template for current month wasn't generated for type (%ld), date interval (%@), and goal (%f)", buf, 0x20u);
        }

        v12 = [NSString stringWithFormat:@"[#mc] Monthly challenge template for current month wasn't generated for type (%ld), date interval (%@), and goal (%f)", v10, v8, *(void *)&v22];
        v33 = (void *)MEMORY[0x263F087E8];
        uint64_t v55 = *MEMORY[0x263F08320];
        id v56 = v12;
        v34 = [NSDictionary dictionaryWithObjects:&v56 forKeys:&v55 count:1];
        v35 = [v33 errorWithDomain:@"com.apple.ActivityAchievements" code:-1 userInfo:v34];

        if (v35) {
          *a5 = v35;
        }

        goto LABEL_25;
      }
      uint64_t v23 = [(ACHMonthlyChallengeTemplateSource *)self _createMonthlyChallengeTemplateWithType:v10 dateCompoonentInterval:v8 goalValue:v11];
      if (v23)
      {
        v12 = v23;
        id v24 = ACHLogMonthlyChallenges();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          v25 = [v12 uniqueName];
          *(_DWORD *)buf = 138412290;
          unint64_t v61 = (unint64_t)v25;
          _os_log_impl(&dword_21F5DA000, v24, OS_LOG_TYPE_DEFAULT, "[#mc] Template generated: %@", buf, 0xCu);
        }
        v26 = ACHLogMonthlyChallenges();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          v27 = [v12 uniqueName];
          *(_DWORD *)buf = 138544130;
          unint64_t v61 = (unint64_t)v27;
          __int16 v62 = 2048;
          unint64_t v63 = v10;
          __int16 v64 = 2112;
          double v65 = *(double *)&v8;
          __int16 v66 = 2048;
          double v67 = v22;
          _os_log_impl(&dword_21F5DA000, v26, OS_LOG_TYPE_DEFAULT, "[#mc] Monthly challenge %{public}@ for current month was generated for type (%ld), date interval (%@), and goal (%f)", buf, 0x2Au);
        }
        v28 = [(ACHMonthlyChallengeTemplateSource *)self _suffixForCurrentMonthForType:v10 template:v12 goal:a5 error:v22];
        if (v28)
        {
          uint64_t v29 = [v12 availableSuffixes];
          v30 = v29;
          if (v29)
          {
            uint64_t v31 = [v29 arrayByAddingObject:v28];
          }
          else
          {
            long long v59 = v28;
            uint64_t v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v59 count:1];
          }
          v41 = (void *)v31;
          [v12 setAvailableSuffixes:v31];
        }
        id v42 = objc_msgSend(*a4, "hk_map:", &__block_literal_global_302_0);
        v43 = [v12 uniqueName];
        int v44 = [v42 containsObject:v43];

        if (v44)
        {
          v45 = ACHLogMonthlyChallenges();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            id v46 = [v12 uniqueName];
            *(_DWORD *)buf = 138543362;
            unint64_t v61 = (unint64_t)v46;
            _os_log_impl(&dword_21F5DA000, v45, OS_LOG_TYPE_DEFAULT, "[#mc] The monthly challenge just created already exists: %{public}@. Skipping it.", buf, 0xCu);
          }
          v47 = NSString;
          id v48 = [v12 uniqueName];
          id v49 = [v47 stringWithFormat:@"The monthly challenge just created already exists: %@. Skipping it.", v48];

          id v50 = (void *)MEMORY[0x263F087E8];
          uint64_t v57 = *MEMORY[0x263F08320];
          long long v58 = v49;
          v51 = [NSDictionary dictionaryWithObjects:&v58 forKeys:&v57 count:1];
          v52 = [v50 errorWithDomain:@"com.apple.ActivityAchievements" code:-1 userInfo:v51];

          if (v52) {
            *a5 = v52;
          }

          int v36 = 1;
        }
        else
        {
          [*a4 setByAddingObject:v12];
          int v36 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }

        goto LABEL_26;
      }
      v39 = (void *)MEMORY[0x263F087E8];
      uint64_t v68 = *MEMORY[0x263F08320];
      v69[0] = @"Tried to generate a challenge with a valid goal, but failed.";
      int v36 = 1;
      v40 = [NSDictionary dictionaryWithObjects:v69 forKeys:&v68 count:1];
      *a5 = [v39 errorWithDomain:@"com.apple.ActivityAchievements" code:-1 userInfo:v40];

      v12 = ACHLogMonthlyChallenges();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
LABEL_26:

        BOOL v37 = v36 == 0;
        goto LABEL_29;
      }
      *(_WORD *)buf = 0;
      id v14 = "[#mc] Tried to generate a challenge with a valid goal, but failed.";
      uint64_t v15 = v12;
      uint32_t v16 = 2;
    }
    _os_log_impl(&dword_21F5DA000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
    goto LABEL_25;
  }
  id v17 = ACHLogMonthlyChallenges();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F5DA000, v17, OS_LOG_TYPE_DEFAULT, "[#mc] Not generating monthly challenge template for current month because type returned was undefined.", buf, 2u);
  }

  id v18 = (void *)MEMORY[0x263F087E8];
  uint64_t v53 = *MEMORY[0x263F08320];
  id v54 = @"Not generating monthly challenge template for current month because type returned was undefined.";
  objc_super v19 = [NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
  id v20 = [v18 errorWithDomain:@"com.apple.ActivityAchievements" code:-1 userInfo:v19];

  id v21 = v20;
  if (v21)
  {
    if (a5) {
      *a5 = v21;
    }
    else {
      _HKLogDroppedError();
    }
  }

  BOOL v37 = 0;
LABEL_29:

  return v37;
}

uint64_t __114__ACHMonthlyChallengeTemplateSource__createMonthlyChallengeWithMonthDateInterval_monthlyChallengeTemplates_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 uniqueName];
}

- (void)_removeMonthlyChallengeTemplate:(id)a3 monthlyChallengeTemplates:(id *)a4 templatesToRemove:(id *)a5
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = ACHLogMonthlyChallenges();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      int v10 = 138412290;
      id v11 = v7;
      _os_log_impl(&dword_21F5DA000, v8, OS_LOG_TYPE_DEFAULT, "[#mc] Removing existing template: %@", (uint8_t *)&v10, 0xCu);
    }

    id v8 = [*a4 mutableCopy];
    [v8 removeObject:v7];
    *a4 = [v8 copy];
    *a5 = [MEMORY[0x263EFFA08] setWithObject:v7];
  }
  else if (v9)
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_21F5DA000, v8, OS_LOG_TYPE_DEFAULT, "[#mc] Existing template not found.", (uint8_t *)&v10, 2u);
  }
}

- (id)possibleLocalizationSuffixesForTemplate:(id)a3
{
  v7[5] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F23580];
  v7[0] = *MEMORY[0x263F23568];
  v7[1] = v3;
  uint64_t v4 = *MEMORY[0x263F23570];
  v7[2] = *MEMORY[0x263F23578];
  v7[3] = v4;
  v7[4] = *MEMORY[0x263F23560];
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:5];
  return v5;
}

- (id)_createMonthlyChallengeTemplateWithType:(unint64_t)a3 dateCompoonentInterval:(id)a4 goalValue:(double)a5
{
  return (id)ACHMonthlyChallengeTemplate();
}

- (id)localizationBundleURLForTemplate:(id)a3
{
  uint64_t v4 = [a3 uniqueName];
  unint64_t v5 = ACHMonthlyChallengeTypeFromTemplateUniqueName();

  if (v5 > 0x1D) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = off_2645174E0[v5];
  }
  id v7 = [(ACHMonthlyChallengeTemplateSource *)self _monthlyAchievementsAssetsDirectoryBasePath];
  id v8 = [v7 stringByAppendingPathComponent:@"localization"];
  BOOL v9 = [v8 stringByAppendingPathComponent:@"challenge"];
  int v10 = [v9 stringByAppendingPathComponent:v6];

  id v11 = [NSURL fileURLWithPath:v10];

  return v11;
}

- (id)resourceBundleURLForTemplate:(id)a3
{
  uint64_t v3 = [(ACHMonthlyChallengeTemplateSource *)self _modelsDirectoryBasePathForTemplate:a3];
  uint64_t v4 = [v3 stringByAppendingPathComponent:@"badgemodel"];

  unint64_t v5 = [NSURL fileURLWithPath:v4];

  return v5;
}

- (id)propertyListBundleURLForTemplate:(id)a3
{
  uint64_t v3 = [(ACHMonthlyChallengeTemplateSource *)self _modelsDirectoryBasePathForTemplate:a3];
  uint64_t v4 = [v3 stringByAppendingPathComponent:@"badgeproperties"];
  unint64_t v5 = [v4 stringByAppendingPathComponent:@"challenge"];

  uint64_t v6 = [NSURL fileURLWithPath:v5];

  return v6;
}

- (id)stickerBundleURLForTemplate:(id)a3
{
  return 0;
}

- (id)_monthlyAchievementsAssetsDirectoryBasePath
{
  if (_monthlyAchievementsAssetsDirectoryBasePath_onceToken_0 != -1) {
    dispatch_once(&_monthlyAchievementsAssetsDirectoryBasePath_onceToken_0, &__block_literal_global_328);
  }
  uint64_t v2 = (void *)_monthlyAchievementsAssetsDirectoryBasePath_monthlyAchievementsAssetsDirectoryBasePath_0;
  return v2;
}

uint64_t __80__ACHMonthlyChallengeTemplateSource__monthlyAchievementsAssetsDirectoryBasePath__block_invoke()
{
  uint64_t v0 = [(id)*MEMORY[0x263F235E8] stringByAppendingPathComponent:@"MonthlyAchievements"];
  uint64_t v1 = _monthlyAchievementsAssetsDirectoryBasePath_monthlyAchievementsAssetsDirectoryBasePath_0;
  _monthlyAchievementsAssetsDirectoryBasePath_monthlyAchievementsAssetsDirectoryBasePath_0 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (id)_modelsDirectoryBasePathForTemplate:(id)a3
{
  if (_modelsDirectoryBasePathForTemplate__onceToken_0 != -1) {
    dispatch_once(&_modelsDirectoryBasePathForTemplate__onceToken_0, &__block_literal_global_333);
  }
  uint64_t v3 = (void *)_modelsDirectoryBasePathForTemplate__modelsDirectoryBasePath;
  return v3;
}

void __73__ACHMonthlyChallengeTemplateSource__modelsDirectoryBasePathForTemplate___block_invoke()
{
  id v2 = [(id)*MEMORY[0x263F235E8] stringByAppendingPathComponent:@"MonthlyAchievements"];
  uint64_t v0 = [v2 stringByAppendingPathComponent:@"models"];
  uint64_t v1 = (void *)_modelsDirectoryBasePathForTemplate__modelsDirectoryBasePath;
  _modelsDirectoryBasePathForTemplate__modelsDirectoryBasePath = v0;
}

- (id)customPlaceholderValuesForTemplate:(id)a3 error:(id *)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (ACHTemplateIsMonthlyChallenge())
  {
    id v7 = [(ACHMonthlyChallengeTemplateSource *)self _dateComponentIntervalForCurrentMonth];
    id v8 = ACHLogMonthlyChallenges();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v39 = 138543362;
      id v40 = v6;
      _os_log_impl(&dword_21F5DA000, v8, OS_LOG_TYPE_DEFAULT, "Progress: selected template: %{public}@.", (uint8_t *)&v39, 0xCu);
    }

    BOOL v9 = ACHLogMonthlyChallenges();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = [v7 startDateComponents];
      id v11 = [v7 endDateComponents];
      int v39 = 138543618;
      id v40 = v10;
      __int16 v41 = 2114;
      uint64_t v42 = (uint64_t)v11;
      _os_log_impl(&dword_21F5DA000, v9, OS_LOG_TYPE_DEFAULT, "Progress: using start date (%{public}@) and end date (%{public}@).", (uint8_t *)&v39, 0x16u);
    }
    uint64_t v12 = [v6 uniqueName];
    uint64_t v13 = ACHMonthlyChallengeTypeFromTemplateUniqueName();

    id v14 = [v6 availabilityStart];
    uint64_t v15 = [v7 startDateComponents];
    uint64_t v16 = ACHCompareYearMonthDayDateComponents();

    id v17 = ACHLogMonthlyChallenges();
    id v18 = v17;
    if (v16)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[ACHMonthlyChallengeTemplateSource customPlaceholderValuesForTemplate:error:](v6, v7, v18);
      }
      objc_super v19 = 0;
    }
    else
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        double v22 = ACHMonthlyChallengeNameFromChallengeType();
        int v39 = 138543618;
        id v40 = v22;
        __int16 v41 = 2048;
        uint64_t v42 = v13;
        _os_log_impl(&dword_21F5DA000, v18, OS_LOG_TYPE_DEFAULT, "Progress: Monthly Challenge type: %{public}@ (%lu).", (uint8_t *)&v39, 0x16u);
      }
      id v18 = [(ACHMonthlyChallengeTemplateSource *)self _dateComponentIntervalForLastMonth];
      uint64_t v23 = ACHLogMonthlyChallenges();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        id v24 = [v18 startDateComponents];
        v25 = [v18 endDateComponents];
        int v39 = 138543618;
        id v40 = v24;
        __int16 v41 = 2114;
        uint64_t v42 = (uint64_t)v25;
        _os_log_impl(&dword_21F5DA000, v23, OS_LOG_TYPE_DEFAULT, "Progress: retrieving last month value using date component interval: start (%{public}@) vs end date (%{public}@).", (uint8_t *)&v39, 0x16u);
      }
      v26 = [(ACHMonthlyChallengeTemplateSource *)self dataSource];
      v27 = [(ACHMonthlyChallengeTemplateSource *)self currentCalendar];
      [v26 valueForMonthlyChallengeType:v13 forDateComponentInterval:v18 calendar:v27 error:a4];
      double v29 = v28;

      id v30 = objc_alloc_init(MEMORY[0x263F08A30]);
      [v30 setNumberStyle:1];
      uint64_t v31 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en_US"];
      [v30 setLocale:v31];

      id v32 = [NSNumber numberWithDouble:v29];
      objc_super v19 = [v30 stringFromNumber:v32];

      v33 = ACHLogMonthlyChallenges();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        int v39 = 138543362;
        id v40 = v19;
        _os_log_impl(&dword_21F5DA000, v33, OS_LOG_TYPE_DEFAULT, "Progress: last month value: %{public}@.", (uint8_t *)&v39, 0xCu);
      }
    }
    id v34 = v19;
    id v35 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    int v36 = v35;
    if (v34) {
      [v35 setObject:v34 forKey:*MEMORY[0x263F23460]];
    }
    if ((unint64_t)(v13 - 8) <= 0xB)
    {
      BOOL v37 = [MEMORY[0x263F0A8F8] _stringFromWorkoutActivityType:ACHWorkoutActivityTypeForMonthlyChallengeType()];
      [v36 setObject:v37 forKey:*MEMORY[0x263F235C8]];
    }
    id v21 = (void *)[v36 copy];
  }
  else
  {
    id v7 = ACHLogMonthlyChallenges();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = [v6 uniqueName];
      int v39 = 138543362;
      id v40 = v20;
      _os_log_impl(&dword_21F5DA000, v7, OS_LOG_TYPE_DEFAULT, "Progress: %{public}@ is not a Monthly Challenge.", (uint8_t *)&v39, 0xCu);
    }
    id v21 = 0;
  }

  return v21;
}

- (BOOL)isGoalValueForMonthlyChallengeTypeValid:(unint64_t)a3 error:(id *)a4
{
  [(ACHMonthlyChallengeTemplateSource *)self _targetGoalValueForCurrentMonthForType:a3 error:a4];
  double v7 = v6;
  id v8 = [(ACHMonthlyChallengeTemplateSource *)self _maximumValueForMonthlyChallengeType:a3];
  BOOL v9 = [(ACHMonthlyChallengeTemplateSource *)self _minimumValueForMonthlyChallengeType:a3];
  [v8 doubleValue];
  double v11 = v10;
  [v9 doubleValue];
  BOOL v13 = 1;
  if (v8 && v7 >= v11) {
    BOOL v13 = vabdd_f64(v11, v7) < 2.22044605e-16;
  }
  BOOL v14 = 1;
  if (v9 && v7 <= v12) {
    BOOL v14 = vabdd_f64(v12, v7) < 2.22044605e-16;
  }
  BOOL v15 = v13 && v14;
  BOOL v16 = v7 > 0.0 && v15;

  return v16;
}

- (id)_pairedWatchDeviceCapabilities
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if ([(ACHMonthlyChallengeTemplateSource *)self isStandalonePhoneFitnessMode])
  {
    uint64_t v3 = ACHLogMonthlyChallenges();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F5DA000, v3, OS_LOG_TYPE_DEFAULT, "Companion is in standalone mode, not checking paired watch device capabilities", buf, 2u);
    }

    uint64_t v4 = (void *)MEMORY[0x263EFFA78];
  }
  else
  {
    *(void *)buf = 0;
    double v22 = buf;
    uint64_t v23 = 0x3032000000;
    id v24 = __Block_byref_object_copy__20;
    v25 = __Block_byref_object_dispose__20;
    id v26 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    unint64_t v5 = ACHDeviceCapabilitiesForMonthlyChallenges();
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v29 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v18;
      uint64_t v8 = MEMORY[0x263EFFA80];
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v5);
          }
          [*((id *)v22 + 5) setObject:v8 forKeyedSubscript:*(void *)(*((void *)&v17 + 1) + 8 * i)];
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v29 count:16];
      }
      while (v6);
    }

    double v10 = ACHLogMonthlyChallenges();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v27 = 0;
      _os_log_impl(&dword_21F5DA000, v10, OS_LOG_TYPE_DEFAULT, "Companion is not in standalone mode, checking paired watches for Monthly Challenge Compatibility", v27, 2u);
    }

    double v11 = [(ACHMonthlyChallengeTemplateSource *)self pairedDeviceRegistrySharedInstance];
    double v12 = [v11 getPairedDevices];
    BOOL v13 = ACHLogMonthlyChallenges();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [v12 count];
      *(_DWORD *)v27 = 134217984;
      uint64_t v28 = v14;
      _os_log_impl(&dword_21F5DA000, v13, OS_LOG_TYPE_DEFAULT, "Companion is paired with %lu watches", v27, 0xCu);
    }

    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __67__ACHMonthlyChallengeTemplateSource__pairedWatchDeviceCapabilities__block_invoke;
    v16[3] = &unk_2645174C0;
    v16[4] = buf;
    [v12 enumerateObjectsUsingBlock:v16];
    uint64_t v4 = (void *)[*((id *)v22 + 5) copy];

    _Block_object_dispose(buf, 8);
  }
  return v4;
}

void __67__ACHMonthlyChallengeTemplateSource__pairedWatchDeviceCapabilities__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v4 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) allKeys];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v16;
    *(void *)&long long v6 = 138412290;
    long long v14 = v6;
    uint64_t v9 = MEMORY[0x263EFFA88];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v4);
        }
        double v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v3, "supportsCapability:", v11, v14))
        {
          double v12 = ACHLogMonthlyChallenges();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            BOOL v13 = [v11 UUIDString];
            *(_DWORD *)buf = v14;
            long long v20 = v13;
            _os_log_impl(&dword_21F5DA000, v12, OS_LOG_TYPE_DEFAULT, "Companion has one paired device that is eligibile for %@", buf, 0xCu);
          }
          [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v9 forKeyedSubscript:v11];
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v7);
  }
}

- (BOOL)isMonthlyChallengeOfTypeAvailable:(unint64_t)a3 error:(id *)a4
{
  uint64_t v154 = *MEMORY[0x263EF8340];
  uint64_t v7 = ACHLogMonthlyChallenges();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = ACHMonthlyChallengeNameFromChallengeType();
    *(_DWORD *)buf = 138543618;
    id v141 = v8;
    __int16 v142 = 2048;
    unint64_t v143 = a3;
    _os_log_impl(&dword_21F5DA000, v7, OS_LOG_TYPE_DEFAULT, "Checking validity of monthly challenge type %{public}@ (%lu)", buf, 0x16u);
  }
  uint64_t v9 = [(ACHMonthlyChallengeTemplateSource *)self templateDataProvider];
  double v10 = [(ACHMonthlyChallengeTemplateSource *)self _dateComponentIntervalForLastMonth];
  double v11 = [v10 startDateComponents];
  uint64_t v12 = [v9 monthlyChallengeTypeForMonth:v11];

  if (v12 == a3)
  {
    BOOL v13 = ACHLogMonthlyChallenges();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      long long v14 = ACHMonthlyChallengeNameFromChallengeType();
      *(_DWORD *)buf = 138543618;
      id v141 = v14;
      __int16 v142 = 2048;
      unint64_t v143 = a3;
      _os_log_impl(&dword_21F5DA000, v13, OS_LOG_TYPE_DEFAULT, "Type %{public}@ (%lu) is not available because it was suggested last month", buf, 0x16u);
    }
    BOOL v15 = 0;
    goto LABEL_38;
  }
  long long v16 = [(ACHMonthlyChallengeTemplateSource *)self _dateComponentIntervalForLastMonth];
  long long v17 = [v16 startDateComponents];

  long long v18 = [ACHMonthlyChallengeEvaluationEnvironment alloc];
  long long v19 = [(ACHMonthlyChallengeTemplateSource *)self dataSource];
  long long v20 = [(ACHMonthlyChallengeTemplateSource *)self _dateComponentIntervalForLastMonth];
  id v21 = [(ACHMonthlyChallengeTemplateSource *)self currentCalendar];
  uint64_t v22 = [(ACHMonthlyChallengeEvaluationEnvironment *)v18 initWithMonthlyChallengeDataSource:v19 dateComponentInterval:v20 calendar:v21];

  v120 = v22;
  v121 = v17;
  switch(a3)
  {
    case 0uLL:
    case 0x1DuLL:
      id v25 = 0;
      int v27 = 0;
      uint64_t v28 = @"Invalid monthly challenge type";
      goto LABEL_24;
    case 1uLL:
      id v46 = a4;
      v47 = objc_msgSend(NSString, "stringWithFormat:", @"PerfectMonth-%04ld-%02ld", -[NSObject year](v17, "year"), -[NSObject month](v17, "month"));
      id v48 = [(ACHMonthlyChallengeTemplateSource *)self templateDataProvider];
      id v49 = [(ACHMonthlyChallengeTemplateSource *)self _dateComponentIntervalForLastMonth];
      id v50 = [(ACHMonthlyChallengeTemplateSource *)self currentCalendar];
      id v139 = 0;
      uint64_t v51 = [v48 numberOfEarnedInstancesOfTemplateWithUniqueName:v47 inDateComponentInterval:v49 withCalendar:v50 error:&v139];
      id v25 = v139;

      int v27 = 0;
      a4 = v46;
      if (!v25 && !v51) {
        int v27 = ![(ACHMonthlyChallengeTemplateSource *)self isStandalonePhoneFitnessMode];
      }

      uint64_t v28 = @"Received Perfect Month achievement last month or is standalone phone Fitness mode";
      goto LABEL_24;
    case 2uLL:
      v52 = a4;
      uint64_t v53 = objc_msgSend(NSString, "stringWithFormat:", @"PerfectMonth-%04ld-%02ld", -[NSObject year](v17, "year"), -[NSObject month](v17, "month"));
      id v54 = [(ACHMonthlyChallengeTemplateSource *)self templateDataProvider];
      uint64_t v55 = [(ACHMonthlyChallengeTemplateSource *)self _dateComponentIntervalForLastMonth];
      id v56 = [(ACHMonthlyChallengeTemplateSource *)self currentCalendar];
      id v138 = 0;
      uint64_t v57 = [v54 numberOfEarnedInstancesOfTemplateWithUniqueName:v53 inDateComponentInterval:v55 withCalendar:v56 error:&v138];
      id v25 = v138;

      if (v25) {
        goto LABEL_46;
      }
      long long v58 = [(ACHMonthlyChallengeTemplateSource *)self templateDataProvider];
      long long v59 = [(ACHMonthlyChallengeTemplateSource *)self _dateComponentIntervalForLastMonth];
      long long v60 = [(ACHMonthlyChallengeTemplateSource *)self currentCalendar];
      id v137 = 0;
      uint64_t v61 = [v58 numberOfEarnedInstancesOfTemplateWithUniqueName:@"PerfectWeekMove" inDateComponentInterval:v59 withCalendar:v60 error:&v137];
      id v25 = v137;

      if (v25)
      {
LABEL_46:
        int v27 = 0;
      }
      else
      {
        if (v57) {
          BOOL v115 = 0;
        }
        else {
          BOOL v115 = v61 < 3;
        }
        int v27 = v115;
      }
      a4 = v52;

      uint64_t v28 = @"Received Perfect Month achievement last month or Perfect Week (Move) Achievement 3 times during the previous month";
      goto LABEL_24;
    case 3uLL:
      double v29 = a4;
      __int16 v62 = [(ACHMonthlyChallengeTemplateSource *)self templateDataProvider];
      unint64_t v63 = [(ACHMonthlyChallengeTemplateSource *)self _dateComponentIntervalForLastMonth];
      __int16 v64 = [(ACHMonthlyChallengeTemplateSource *)self currentCalendar];
      id v136 = 0;
      uint64_t v65 = [v62 numberOfEarnedInstancesOfTemplateWithUniqueName:@"PerfectWeekExercise" inDateComponentInterval:v63 withCalendar:v64 error:&v136];
      id v25 = v136;

      int v27 = 0;
      uint64_t v28 = @"Received Perfect Week (Exercise) Achievement 3 times during the previous month or is standalone phone Fitness mode";
      if (v25) {
        goto LABEL_23;
      }
      a4 = v29;
      if (v65 <= 2)
      {
        id v25 = 0;
        int v27 = ![(ACHMonthlyChallengeTemplateSource *)self isStandalonePhoneFitnessMode];
        uint64_t v28 = @"Received Perfect Week (Exercise) Achievement 3 times during the previous month or is standalone phone Fitness mode";
      }
      goto LABEL_24;
    case 4uLL:
      double v29 = a4;
      __int16 v66 = [(ACHMonthlyChallengeTemplateSource *)self templateDataProvider];
      double v67 = [(ACHMonthlyChallengeTemplateSource *)self _dateComponentIntervalForLastMonth];
      uint64_t v68 = [(ACHMonthlyChallengeTemplateSource *)self currentCalendar];
      id v135 = 0;
      uint64_t v69 = [v66 numberOfEarnedInstancesOfTemplateWithUniqueName:@"PerfectWeekStand" inDateComponentInterval:v67 withCalendar:v68 error:&v135];
      id v25 = v135;

      int v27 = 0;
      uint64_t v28 = @"Received Perfect Week (Stand) Achievement 3 times during the previous month or is standalone phone Fitness mode";
      if (v25) {
        goto LABEL_23;
      }
      a4 = v29;
      if (v69 <= 2)
      {
        id v25 = 0;
        int v27 = ![(ACHMonthlyChallengeTemplateSource *)self isStandalonePhoneFitnessMode];
        uint64_t v28 = @"Received Perfect Week (Stand) Achievement 3 times during the previous month or is standalone phone Fitness mode";
      }
      goto LABEL_24;
    case 5uLL:
    case 6uLL:
    case 0x14uLL:
    case 0x16uLL:
      id v25 = 0;
      int v27 = 0;
      uint64_t v28 = @"Monthly Challenge type is deprecated";
      goto LABEL_24;
    case 7uLL:
      [(ACHMonthlyChallengeEvaluationEnvironment *)v22 numberOfWorkoutsCompletedInCurrentMonth];
      double v71 = v70;
      id v72 = [(ACHMonthlyChallengeTemplateSource *)self templateDataProvider];
      id v131 = 0;
      uint64_t v73 = [v72 currentExperienceTypeWithError:&v131];
      id v25 = v131;

      if (v25)
      {
        id v74 = ACHLogMonthlyChallenges();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v141 = v25;
          _os_log_impl(&dword_21F5DA000, v74, OS_LOG_TYPE_DEFAULT, "Error getting experience type: %@", buf, 0xCu);
        }

        int v27 = 0;
      }
      else
      {
        int v27 = v71 >= 2.0 && v73 == 1;
      }
      uint64_t v28 = @"Required at least 1 workout last monthand and is in standard Fitness experience";
      goto LABEL_24;
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
      uint64_t v23 = [(ACHMonthlyChallengeTemplateSource *)self templateDataProvider];
      id v133 = 0;
      int v24 = [v23 isWheelchairUserWithError:&v133];
      id v25 = v133;

      if (!v25)
      {
        double v29 = a4;
        uint64_t v30 = [(ACHMonthlyChallengeTemplateSource *)self templateDataProvider];
        id v132 = 0;
        uint64_t v31 = [v30 currentExperienceTypeWithError:&v132];
        id v25 = v132;

        if (v25)
        {
          id v32 = ACHLogMonthlyChallenges();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v141 = v25;
            _os_log_impl(&dword_21F5DA000, v32, OS_LOG_TYPE_DEFAULT, "Error getting experience type: %@", buf, 0xCu);
          }

          int v27 = 0;
        }
        else
        {
          v33 = [(ACHMonthlyChallengeEvaluationEnvironment *)v22 eligibleSpecificWorkoutChallengeType];
          id v34 = [NSNumber numberWithUnsignedInteger:a3];
          int v35 = [v33 isEqual:v34];
          if (v31 == 1) {
            int v36 = v35;
          }
          else {
            int v36 = 0;
          }
          int v27 = v36 & (v24 ^ 1);

          id v25 = 0;
        }
        uint64_t v28 = @"Required at least 3 workouts of the same type in the last month, is in standard Fitness experience, and cannot be wheelchair user";
        goto LABEL_23;
      }
      id v26 = ACHLogMonthlyChallenges();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v141 = v25;
        _os_log_impl(&dword_21F5DA000, v26, OS_LOG_TYPE_DEFAULT, "Error fetching wheelchair use: %@", buf, 0xCu);
      }

      int v27 = 0;
      uint64_t v28 = @"Required at least 3 workouts of the same type in the last month, is in standard Fitness experience, and cannot be wheelchair user";
      goto LABEL_24;
    case 0x15uLL:
      [(ACHMonthlyChallengeEvaluationEnvironment *)v22 numberOfDaysDoublingMoveGoalInCurrentMonth];
      double v76 = v75;
      v77 = [(ACHMonthlyChallengeTemplateSource *)self templateDataProvider];
      id v130 = 0;
      uint64_t v78 = [v77 currentExperienceTypeWithError:&v130];
      id v25 = v130;

      if (v25)
      {
        v79 = ACHLogMonthlyChallenges();
        if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v141 = v25;
          _os_log_impl(&dword_21F5DA000, v79, OS_LOG_TYPE_DEFAULT, "Error getting experience type: %@", buf, 0xCu);
        }

        int v27 = 0;
      }
      else
      {
        int v27 = v76 >= 2.0 && v78 == 1;
      }
      uint64_t v28 = @"Required at least 1 day doubling move goal last month and cannot be Fitness jr user";
      goto LABEL_24;
    case 0x17uLL:
      [(ACHMonthlyChallengeEvaluationEnvironment *)v22 numberOfDaysDoublingExerciseGoalInCurrentMonth];
      double v81 = v80;
      uint64_t v82 = [(ACHMonthlyChallengeTemplateSource *)self templateDataProvider];
      id v129 = 0;
      uint64_t v83 = [v82 currentExperienceTypeWithError:&v129];
      id v25 = v129;

      if (v25)
      {
        uint64_t v84 = ACHLogMonthlyChallenges();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v141 = v25;
          _os_log_impl(&dword_21F5DA000, v84, OS_LOG_TYPE_DEFAULT, "Error getting experience type: %@", buf, 0xCu);
        }

        int v27 = 0;
        goto LABEL_100;
      }
      int v27 = 0;
      uint64_t v28 = @"Required at least 3 days doubling exericise goal last month, cannot be Fitness Jr user, and cannot be standalone phone Fitness mode";
      if (v81 >= 2.0 && v83 == 1)
      {
        id v25 = 0;
        int v27 = ![(ACHMonthlyChallengeTemplateSource *)self isStandalonePhoneFitnessMode];
LABEL_100:
        uint64_t v28 = @"Required at least 3 days doubling exericise goal last month, cannot be Fitness Jr user, and cannot be standalone phone Fitness mode";
        goto LABEL_24;
      }
      goto LABEL_24;
    case 0x18uLL:
      v85 = [(ACHMonthlyChallengeTemplateSource *)self currentCalendar];
      v86 = [(ACHMonthlyChallengeTemplateSource *)self currentDate];
      id v87 = objc_msgSend(v85, "hk_startOfMonthForDate:addingMonths:", v86, -1);

      int64_t v88 = [(ACHMonthlyChallengeTemplateSource *)self _numberOfDaysInMonthForDate:v87]
          - 3;
      [(ACHMonthlyChallengeEvaluationEnvironment *)v22 longestMoveStreakInCurrentMonth];
      int v27 = v89 < (double)v88 && v89 >= 5.0;

      id v25 = 0;
      uint64_t v28 = @"Move streak > 5 during last month, and move streak < number of days in last month - 3";
      goto LABEL_24;
    case 0x19uLL:
      __int16 v90 = [(ACHMonthlyChallengeTemplateSource *)self templateDataProvider];
      id v126 = 0;
      uint64_t v91 = [v90 currentActivityMoveModeWithError:&v126];
      id v25 = v126;

      if (v25)
      {
        v92 = ACHLogMonthlyChallenges();
        if (!os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_105;
        }
        *(_DWORD *)buf = 138412290;
        id v141 = v25;
        uint64_t v93 = "Unable to fetch activity move mode: %@";
        goto LABEL_104;
      }
      double v29 = a4;
      v109 = [(ACHMonthlyChallengeTemplateSource *)self templateDataProvider];
      id v125 = 0;
      uint64_t v110 = [v109 currentExperienceTypeWithError:&v125];
      id v25 = v125;

      if (!v25)
      {
        int v27 = v91 != 2 && v110 == 1;
        uint64_t v28 = @"Cannot be Apple Move Time user, and cannot be Fitness jr user";
        goto LABEL_23;
      }
      v92 = ACHLogMonthlyChallenges();
      a4 = v29;
      if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v141 = v25;
        uint64_t v93 = "Error getting experience type: %@";
LABEL_104:
        _os_log_impl(&dword_21F5DA000, v92, OS_LOG_TYPE_DEFAULT, v93, buf, 0xCu);
      }
LABEL_105:

      int v27 = 0;
      uint64_t v28 = @"Cannot be Apple Move Time user, and cannot be Fitness jr user";
      goto LABEL_24;
    case 0x1AuLL:
      [(ACHMonthlyChallengeEvaluationEnvironment *)v22 totalExerciseMinutesInCurrentMonth];
      double v95 = v94;
      v96 = [(ACHMonthlyChallengeTemplateSource *)self templateDataProvider];
      id v134 = 0;
      uint64_t v97 = [v96 currentExperienceTypeWithError:&v134];
      id v25 = v134;

      if (v25)
      {
        v98 = ACHLogMonthlyChallenges();
        if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v141 = v25;
          _os_log_impl(&dword_21F5DA000, v98, OS_LOG_TYPE_DEFAULT, "Error getting experience type: %@", buf, 0xCu);
        }

        int v27 = 0;
        goto LABEL_109;
      }
      int v27 = 0;
      uint64_t v28 = @"Required at least 30 Exercise minutes last month, cannot be Fitness jr user, and cannot be standalone phone Fitness mode";
      if (v95 >= 30.0 && v97 == 1)
      {
        id v25 = 0;
        int v27 = ![(ACHMonthlyChallengeTemplateSource *)self isStandalonePhoneFitnessMode];
LABEL_109:
        uint64_t v28 = @"Required at least 30 Exercise minutes last month, cannot be Fitness jr user, and cannot be standalone phone Fitness mode";
        goto LABEL_24;
      }
      goto LABEL_24;
    case 0x1BuLL:
      v99 = [(ACHMonthlyChallengeTemplateSource *)self templateDataProvider];
      id v128 = 0;
      int v100 = [v99 isWheelchairUserWithError:&v128];
      id v25 = v128;

      if (v25)
      {
        v101 = ACHLogMonthlyChallenges();
        if (!os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_114;
        }
        *(_DWORD *)buf = 138412290;
        id v141 = v25;
        v102 = "Error fetching wheelchair use: %@";
        goto LABEL_113;
      }
      double v29 = a4;
      v111 = [(ACHMonthlyChallengeTemplateSource *)self templateDataProvider];
      id v127 = 0;
      uint64_t v112 = [v111 currentExperienceTypeWithError:&v127];
      id v25 = v127;

      if (!v25)
      {
        int v27 = (v112 == 1) & ~v100;
        uint64_t v28 = @"Cannot be wheelchair user and is in the standard fitness experience";
        goto LABEL_23;
      }
      v101 = ACHLogMonthlyChallenges();
      a4 = v29;
      if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v141 = v25;
        v102 = "Error getting experience type: %@";
LABEL_113:
        _os_log_impl(&dword_21F5DA000, v101, OS_LOG_TYPE_DEFAULT, v102, buf, 0xCu);
      }
LABEL_114:

      int v27 = 0;
      uint64_t v28 = @"Cannot be wheelchair user and is in the standard fitness experience";
      goto LABEL_24;
    case 0x1CuLL:
      v103 = [(ACHMonthlyChallengeTemplateSource *)self templateDataProvider];
      id v124 = 0;
      uint64_t v104 = [v103 currentActivityMoveModeWithError:&v124];
      id v25 = v124;

      if (v25)
      {
        v105 = ACHLogMonthlyChallenges();
        if (!os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_119;
        }
        *(_DWORD *)buf = 138412290;
        id v141 = v25;
        v106 = "Error getting move mode: %@";
        goto LABEL_118;
      }
      double v29 = a4;
      v113 = [(ACHMonthlyChallengeTemplateSource *)self templateDataProvider];
      id v123 = 0;
      uint64_t v114 = [v113 currentExperienceTypeWithError:&v123];
      id v25 = v123;

      if (!v25)
      {
        int v27 = v104 == 2 && v114 != 3;
        uint64_t v28 = @"Must be Apple Move Time user, and cannot be Simplified Fitness jr user";
LABEL_23:
        a4 = v29;
        goto LABEL_24;
      }
      v105 = ACHLogMonthlyChallenges();
      a4 = v29;
      if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v141 = v25;
        v106 = "Error getting experience type: %@";
LABEL_118:
        _os_log_impl(&dword_21F5DA000, v105, OS_LOG_TYPE_DEFAULT, v106, buf, 0xCu);
      }
LABEL_119:

      int v27 = 0;
      uint64_t v28 = @"Must be Apple Move Time user, and cannot be Simplified Fitness jr user";
LABEL_24:
      v118 = v28;
      BOOL v37 = [(ACHMonthlyChallengeTemplateSource *)self _pairedWatchDeviceCapabilities];
      if ([(ACHMonthlyChallengeTemplateSource *)self isStandalonePhoneFitnessMode]) {
        int HasRequiredDeviceCapability = 1;
      }
      else {
        int HasRequiredDeviceCapability = ACHMonthlyChallengeHasRequiredDeviceCapability();
      }
      if (a4 && v25) {
        *a4 = v25;
      }
      v119 = v25;
      int v39 = v27 & HasRequiredDeviceCapability;
      id v122 = 0;
      BOOL v40 = [(ACHMonthlyChallengeTemplateSource *)self isGoalValueForMonthlyChallengeTypeValid:a3 error:&v122];
      id v41 = v122;
      if (v41)
      {
        uint64_t v42 = ACHLogMonthlyChallenges();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v141 = v41;
          _os_log_impl(&dword_21F5DA000, v42, OS_LOG_TYPE_DEFAULT, "Error validating goal: %@", buf, 0xCu);
        }

        if (a4) {
          *a4 = v41;
        }
      }
      BOOL v15 = v40 & v39;
      uint64_t v43 = ACHLogMonthlyChallenges();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        int v44 = ACHMonthlyChallengeNameFromChallengeType();
        *(_DWORD *)buf = 138544898;
        id v141 = v44;
        __int16 v142 = 2048;
        unint64_t v143 = a3;
        __int16 v144 = 1024;
        int v145 = v40 & v39;
        __int16 v146 = 1024;
        int v147 = v39;
        __int16 v148 = 2112;
        v149 = v118;
        __int16 v150 = 1024;
        BOOL v151 = v40;
        __int16 v152 = 1024;
        int v153 = HasRequiredDeviceCapability;
        _os_log_impl(&dword_21F5DA000, v43, OS_LOG_TYPE_DEFAULT, "Monthly Challenge Type: %{public}@ (%ld), Overall Available: %{BOOL}d, Type Is Available: %{BOOL}d, Type Explanation: %@, Goal is Valid: %{BOOL}d, deviceCapabilityRequirementMet: %{BOOL}d", buf, 0x38u);
      }
      BOOL v13 = v121;
LABEL_38:

      return v15;
    default:
      id v25 = 0;
      int v27 = 0;
      uint64_t v28 = @"Type is available";
      goto LABEL_24;
  }
}

- (id)_availableMonthlyChallengeTypes
{
  char v4 = 0;
  uint64_t v5 = 0;
  uint64_t v24 = *MEMORY[0x263EF8340];
  long long v6 = (void *)MEMORY[0x263EFFA68];
  *(void *)&long long v2 = 138543618;
  long long v18 = v2;
  do
  {
    id v19 = 0;
    BOOL v7 = -[ACHMonthlyChallengeTemplateSource isMonthlyChallengeOfTypeAvailable:error:](self, "isMonthlyChallengeOfTypeAvailable:error:", v5, &v19, v18);
    uint64_t v8 = (char *)v19;
    if (v7)
    {
      uint64_t v9 = [NSNumber numberWithUnsignedInteger:v5];
      uint64_t v10 = [v6 arrayByAddingObject:v9];

      long long v6 = (void *)v10;
    }
    else
    {
      uint64_t v9 = ACHLogMonthlyChallenges();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        double v11 = ACHMonthlyChallengeNameFromChallengeType();
        *(_DWORD *)buf = v18;
        uint64_t v21 = (uint64_t)v11;
        __int16 v22 = 2048;
        uint64_t v23 = v5;
        _os_log_impl(&dword_21F5DA000, v9, OS_LOG_TYPE_DEFAULT, "Monthly challenge of type %{public}@ (%lu) is unavailable.", buf, 0x16u);
      }
    }

    if (v8)
    {
      uint64_t v12 = ACHLogMonthlyChallenges();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        uint64_t v21 = (uint64_t)v5;
        __int16 v22 = 2112;
        uint64_t v23 = v8;
        _os_log_impl(&dword_21F5DA000, v12, OS_LOG_TYPE_DEFAULT, "Unable to check availability of monthly challenge type %ld: %@", buf, 0x16u);
      }

      char v4 = objc_msgSend(v8, "hk_isDatabaseAccessibilityError");
    }

    ++v5;
  }
  while (v5 != (char *)29);
  if (!(([v6 count] != 0) | v4 & 1))
  {
    if ([(ACHMonthlyChallengeTemplateSource *)self isStandalonePhoneFitnessMode]) {
      uint64_t v13 = 2;
    }
    else {
      uint64_t v13 = 1;
    }
    long long v14 = ACHLogMonthlyChallenges();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v21 = v13;
      _os_log_impl(&dword_21F5DA000, v14, OS_LOG_TYPE_DEFAULT, "No valid monthly challenge types; adding type of %lu",
        buf,
        0xCu);
    }

    BOOL v15 = [NSNumber numberWithUnsignedInteger:v13];
    uint64_t v16 = [v6 arrayByAddingObject:v15];

    long long v6 = (void *)v16;
  }
  return v6;
}

- (unint64_t)_getRandomMonthlyChallengeType
{
  long long v2 = [(ACHMonthlyChallengeTemplateSource *)self _availableMonthlyChallengeTypes];
  uint32_t v3 = [v2 count];
  if (v3)
  {
    char v4 = [v2 objectAtIndexedSubscript:arc4random_uniform(v3)];
    unint64_t v5 = [v4 integerValue];
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)_isInFirstWeekOfCurrentMonth:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(ACHMonthlyChallengeTemplateSource *)self currentCalendar];
  long long v6 = [v5 components:16 fromDate:v4];

  LOBYTE(v4) = [v6 day] < 8;
  return (char)v4;
}

- (id)_dateComponentIntervalForCurrentMonth
{
  uint32_t v3 = [(ACHMonthlyChallengeTemplateSource *)self currentCalendar];
  id v4 = [(ACHMonthlyChallengeTemplateSource *)self currentDate];
  unint64_t v5 = objc_msgSend(v3, "hk_startOfMonthForDate:", v4);

  long long v6 = [(ACHMonthlyChallengeTemplateSource *)self currentCalendar];
  BOOL v7 = [(ACHMonthlyChallengeTemplateSource *)self currentDate];
  uint64_t v8 = objc_msgSend(v6, "hk_startOfMonthForDate:addingMonths:", v7, 1);

  uint64_t v9 = [(ACHMonthlyChallengeTemplateSource *)self currentCalendar];
  uint64_t v10 = objc_msgSend(v9, "hk_startOfDateBySubtractingDays:fromDate:", 1, v8);

  double v11 = [(ACHMonthlyChallengeTemplateSource *)self currentCalendar];
  uint64_t v12 = *MEMORY[0x263F234C0];
  uint64_t v13 = [v11 components:*MEMORY[0x263F234C0] fromDate:v5];

  long long v14 = [(ACHMonthlyChallengeTemplateSource *)self currentCalendar];
  BOOL v15 = [v14 components:v12 fromDate:v10];

  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x263F236B0]) initWithStartDateComponents:v13 endDateComponents:v15];
  return v16;
}

- (id)_dateComponentIntervalForLastMonth
{
  uint32_t v3 = [(ACHMonthlyChallengeTemplateSource *)self currentCalendar];
  id v4 = [(ACHMonthlyChallengeTemplateSource *)self currentDate];
  unint64_t v5 = objc_msgSend(v3, "hk_startOfMonthForDate:addingMonths:", v4, -1);

  long long v6 = [(ACHMonthlyChallengeTemplateSource *)self currentCalendar];
  BOOL v7 = [(ACHMonthlyChallengeTemplateSource *)self currentDate];
  uint64_t v8 = objc_msgSend(v6, "hk_startOfMonthForDate:", v7);

  uint64_t v9 = [(ACHMonthlyChallengeTemplateSource *)self currentCalendar];
  uint64_t v10 = objc_msgSend(v9, "hk_startOfDateBySubtractingDays:fromDate:", 1, v8);

  double v11 = [(ACHMonthlyChallengeTemplateSource *)self currentCalendar];
  uint64_t v12 = *MEMORY[0x263F234C0];
  uint64_t v13 = [v11 components:*MEMORY[0x263F234C0] fromDate:v5];

  long long v14 = [(ACHMonthlyChallengeTemplateSource *)self currentCalendar];
  BOOL v15 = [v14 components:v12 fromDate:v10];

  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x263F236B0]) initWithStartDateComponents:v13 endDateComponents:v15];
  return v16;
}

- (id)_dateComponentIntervalForTwoMonthsAgo
{
  uint32_t v3 = [(ACHMonthlyChallengeTemplateSource *)self currentCalendar];
  id v4 = [(ACHMonthlyChallengeTemplateSource *)self currentDate];
  unint64_t v5 = objc_msgSend(v3, "hk_startOfMonthForDate:addingMonths:", v4, -2);

  long long v6 = [(ACHMonthlyChallengeTemplateSource *)self currentCalendar];
  BOOL v7 = [(ACHMonthlyChallengeTemplateSource *)self currentDate];
  uint64_t v8 = objc_msgSend(v6, "hk_startOfMonthForDate:addingMonths:", v7, -1);

  uint64_t v9 = [(ACHMonthlyChallengeTemplateSource *)self currentCalendar];
  uint64_t v10 = objc_msgSend(v9, "hk_startOfDateBySubtractingDays:fromDate:", 1, v8);

  double v11 = [(ACHMonthlyChallengeTemplateSource *)self currentCalendar];
  uint64_t v12 = *MEMORY[0x263F234C0];
  uint64_t v13 = [v11 components:*MEMORY[0x263F234C0] fromDate:v5];

  long long v14 = [(ACHMonthlyChallengeTemplateSource *)self currentCalendar];
  BOOL v15 = [v14 components:v12 fromDate:v10];

  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x263F236B0]) initWithStartDateComponents:v13 endDateComponents:v15];
  return v16;
}

- (unint64_t)_numberOfDaysInMonthForDate:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(ACHMonthlyChallengeTemplateSource *)self currentCalendar];
  [v5 rangeOfUnit:16 inUnit:8 forDate:v4];
  unint64_t v7 = v6;

  return v7;
}

- (BOOL)_shouldOverrideMonthlyChallengeCadence
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263EFFA40]);
  uint32_t v3 = (void *)[v2 initWithSuiteName:*MEMORY[0x263F23588]];
  int v4 = [v3 BOOLForKey:*MEMORY[0x263F23590]];
  unint64_t v5 = ACHLogMonthlyChallenges();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 67109120;
    LODWORD(v14) = v4;
    _os_log_impl(&dword_21F5DA000, v5, OS_LOG_TYPE_DEFAULT, "Internal override monthly challenge cadence setting is: %d.", (uint8_t *)&v13, 8u);
  }

  if (v4)
  {
    unint64_t v6 = [v3 valueForKey:@"AppleInternalMonthlyChallengeCadenceLastOverrideDateKey"];
    unint64_t v7 = ACHLogMonthlyChallenges();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      long long v14 = v6;
      _os_log_impl(&dword_21F5DA000, v7, OS_LOG_TYPE_DEFAULT, "Internal override monthly challenge cadence last override date was: %@.", (uint8_t *)&v13, 0xCu);
    }

    if (v6
      && ([MEMORY[0x263EFF8F0] currentCalendar],
          uint64_t v8 = objc_claimAutoreleasedReturnValue(),
          int v9 = [v8 isDateInToday:v6],
          v8,
          v9))
    {
      uint64_t v10 = ACHLogMonthlyChallenges();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_21F5DA000, v10, OS_LOG_TYPE_DEFAULT, "Internal override monthly challenge cadence last override date was today; not forcing another.",
          (uint8_t *)&v13,
          2u);
      }

      BOOL v11 = 0;
    }
    else
    {
      BOOL v11 = 1;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)_didOverrideMonthlyChallengeCadence
{
  id v2 = objc_alloc(MEMORY[0x263EFFA40]);
  id v4 = (id)[v2 initWithSuiteName:*MEMORY[0x263F23588]];
  uint32_t v3 = [MEMORY[0x263EFF910] date];
  [v4 setValue:v3 forKey:@"AppleInternalMonthlyChallengeCadenceLastOverrideDateKey"];
  [v4 synchronize];
}

- (double)_targetGoalValueForCurrentMonthForType:(unint64_t)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  unint64_t v7 = [(ACHMonthlyChallengeTemplateSource *)self dataSource];
  uint64_t v8 = [(ACHMonthlyChallengeTemplateSource *)self _dateComponentIntervalForLastMonth];
  int v9 = [(ACHMonthlyChallengeTemplateSource *)self currentCalendar];
  [v7 valueForMonthlyChallengeType:a3 forDateComponentInterval:v8 calendar:v9 error:a4];
  double v11 = v10;

  uint64_t v12 = [(ACHMonthlyChallengeTemplateSource *)self dataSource];
  int v13 = [(ACHMonthlyChallengeTemplateSource *)self _dateComponentIntervalForTwoMonthsAgo];
  long long v14 = [(ACHMonthlyChallengeTemplateSource *)self currentCalendar];
  [v12 valueForMonthlyChallengeType:a3 forDateComponentInterval:v13 calendar:v14 error:a4];
  double v16 = v15;

  long long v17 = ACHLogMonthlyChallenges();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 134218240;
    double v28 = v11;
    __int16 v29 = 2048;
    double v30 = v16;
    _os_log_impl(&dword_21F5DA000, v17, OS_LOG_TYPE_DEFAULT, "Creating goal value for this month with last month value: %f, two months ago value: %f", (uint8_t *)&v27, 0x16u);
  }

  if (a3 != 29 && a3)
  {
    uint64_t v23 = ACHLogMonthlyChallenges();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
    if (v16 >= 1.0)
    {
      if (v24)
      {
        LOWORD(v27) = 0;
        _os_log_impl(&dword_21F5DA000, v23, OS_LOG_TYPE_DEFAULT, "Target goal = lowest month of the last 2 months", (uint8_t *)&v27, 2u);
      }

      if (v11 >= v16) {
        double v11 = v16;
      }
    }
    else
    {
      if (v24)
      {
        LOWORD(v27) = 0;
        _os_log_impl(&dword_21F5DA000, v23, OS_LOG_TYPE_DEFAULT, "If there is no data two months ago, match last month's value", (uint8_t *)&v27, 2u);
      }
    }
    [(ACHMonthlyChallengeTemplateSource *)self _roundedGoalValue:a3 monthlyChallengeType:v11];
    double v19 = v25;
    long long v18 = ACHLogMonthlyChallenges();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 134217984;
      double v28 = v19;
      long long v20 = "Target value (%f) created";
      uint64_t v21 = v18;
      uint32_t v22 = 12;
      goto LABEL_17;
    }
  }
  else
  {
    long long v18 = ACHLogMonthlyChallenges();
    double v19 = -1.0;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v27) = 0;
      long long v20 = "Trying to create goal value for ACHMonthlyChallengeTypeUndefined or ACHMonthlyChallengeTypeMaxValue, returning";
      uint64_t v21 = v18;
      uint32_t v22 = 2;
LABEL_17:
      _os_log_impl(&dword_21F5DA000, v21, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v27, v22);
    }
  }

  return v19;
}

- (double)_goalValueForCurrentMonthForType:(unint64_t)a3 error:(id *)a4
{
  -[ACHMonthlyChallengeTemplateSource _targetGoalValueForCurrentMonthForType:error:](self, "_targetGoalValueForCurrentMonthForType:error:");
  double v7 = v6;
  double result = 0.0;
  if (!*a4)
  {
    double result = v7;
    if (v7 < 2.22044605e-16)
    {
      int v9 = ACHLogMonthlyChallenges();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[ACHMonthlyChallengeTemplateSource _goalValueForCurrentMonthForType:error:](a3, v9);
      }

      return 0.0;
    }
  }
  return result;
}

- (double)_capGoalValueForChallengeType:(unint64_t)a3 goalValue:(double)a4
{
  double v7 = -[ACHMonthlyChallengeTemplateSource _maximumValueForMonthlyChallengeType:](self, "_maximumValueForMonthlyChallengeType:");
  uint64_t v8 = [(ACHMonthlyChallengeTemplateSource *)self _minimumValueForMonthlyChallengeType:a3];
  [v7 doubleValue];
  double v10 = v9;
  [v8 doubleValue];
  if (v10 >= a4) {
    double v12 = a4;
  }
  else {
    double v12 = v10;
  }
  if (!v7) {
    double v12 = a4;
  }
  if (v11 < v12 || v8 == 0) {
    double v14 = v12;
  }
  else {
    double v14 = v11;
  }

  return v14;
}

- (id)_suffixForCurrentMonthForType:(unint64_t)a3 template:(id)a4 goal:(double)a5 error:(id *)a6
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v10 = a4;
  double v11 = [(ACHMonthlyChallengeTemplateSource *)self dataSource];
  double v12 = [(ACHMonthlyChallengeTemplateSource *)self _dateComponentIntervalForLastMonth];
  int v13 = [(ACHMonthlyChallengeTemplateSource *)self currentCalendar];
  [v11 valueForMonthlyChallengeType:a3 forDateComponentInterval:v12 calendar:v13 error:a6];
  double v15 = v14;

  double v16 = [(ACHMonthlyChallengeTemplateSource *)self dataSource];
  long long v17 = [(ACHMonthlyChallengeTemplateSource *)self _dateComponentIntervalForTwoMonthsAgo];
  long long v18 = [(ACHMonthlyChallengeTemplateSource *)self currentCalendar];
  [v16 valueForMonthlyChallengeType:a3 forDateComponentInterval:v17 calendar:v18 error:a6];
  double v20 = v19;

  uint64_t v21 = ACHLogMonthlyChallenges();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    int v46 = 134218240;
    double v47 = v15;
    __int16 v48 = 2048;
    double v49 = v20;
    _os_log_impl(&dword_21F5DA000, v21, OS_LOG_TYPE_DEFAULT, "Obtaining suffix for this month with last month value: %f, two months ago value: %f", (uint8_t *)&v46, 0x16u);
  }

  if (a3 != 29 && a3)
  {
    [(ACHMonthlyChallengeTemplateSource *)self _targetGoalValueForCurrentMonthForType:a3 error:a6];
    double v25 = v24;
    uint32_t v22 = [(ACHMonthlyChallengeTemplateSource *)self _maximumValueForMonthlyChallengeType:a3];
    [v22 doubleValue];
    if (v22 && v25 > v26)
    {
      int v27 = ACHLogMonthlyChallenges();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v46) = 0;
        _os_log_impl(&dword_21F5DA000, v27, OS_LOG_TYPE_DEFAULT, "Target goal is over challenge type's maximum. Suffix is nil.", (uint8_t *)&v46, 2u);
      }
      uint64_t v23 = 0;
      goto LABEL_41;
    }
    double v28 = [(ACHMonthlyChallengeTemplateSource *)self possibleLocalizationSuffixesForTemplate:v10];
    ACHLowRuleThresholdForChallenge();
    if (v29 >= a5)
    {
      id v32 = ACHLogMonthlyChallenges();
      BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
      id v34 = (void *)*MEMORY[0x263F23568];
      if (!v33) {
        goto LABEL_21;
      }
      int v46 = 138543362;
      double v47 = *(double *)&v34;
      int v35 = "If goal is lower than Low Rule Threshold, suffix is %{public}@.";
      goto LABEL_20;
    }
    if (v20 < 1.0)
    {
      double v30 = ACHLogMonthlyChallenges();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v46) = 0;
        _os_log_impl(&dword_21F5DA000, v30, OS_LOG_TYPE_DEFAULT, "If there is no data two months ago, suffix is nil.", (uint8_t *)&v46, 2u);
      }
      uint64_t v31 = 0;
      goto LABEL_26;
    }
    double v38 = v15 / v20 * 100.0 + -100.0;
    if (v38 <= -25.0)
    {
      id v32 = ACHLogMonthlyChallenges();
      BOOL v40 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
      id v34 = (void *)*MEMORY[0x263F23560];
      if (v40)
      {
        int v46 = 138543362;
        double v47 = *(double *)&v34;
        int v35 = "Decrease from Month A to Month B = 25%%+, suffix is %{public}@.";
        goto LABEL_20;
      }
    }
    else if (v38 >= -10.0)
    {
      if (v38 >= 0.0)
      {
        if (v38 >= 25.0)
        {
          id v32 = ACHLogMonthlyChallenges();
          BOOL v43 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
          id v34 = (void *)*MEMORY[0x263F23560];
          if (v43)
          {
            int v46 = 138543362;
            double v47 = *(double *)&v34;
            int v35 = "Increase from Month A to Month B = 25%%+, suffix is %{public}@.";
            goto LABEL_20;
          }
        }
        else if (v38 >= 10.0)
        {
          id v32 = ACHLogMonthlyChallenges();
          BOOL v44 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
          id v34 = (void *)*MEMORY[0x263F23570];
          if (v44)
          {
            int v46 = 138543362;
            double v47 = *(double *)&v34;
            int v35 = "Increase from Month A to Month B = 10 - 24%%, suffix is %{public}@.";
            goto LABEL_20;
          }
        }
        else
        {
          if (v38 < 0.0) {
            goto LABEL_39;
          }
          id v32 = ACHLogMonthlyChallenges();
          BOOL v45 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
          id v34 = (void *)*MEMORY[0x263F23580];
          if (v45)
          {
            int v46 = 138543362;
            double v47 = *(double *)&v34;
            int v35 = "Increase from Month A to Month B = 0 - 9%%, suffix is %{public}@.";
            goto LABEL_20;
          }
        }
      }
      else
      {
        id v32 = ACHLogMonthlyChallenges();
        BOOL v41 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
        id v34 = (void *)*MEMORY[0x263F23578];
        if (v41)
        {
          int v46 = 138543362;
          double v47 = *(double *)&v34;
          int v35 = "Decrease from Month A to Month B = 0-9%%, suffix is %{public}@.";
          goto LABEL_20;
        }
      }
    }
    else
    {
      id v32 = ACHLogMonthlyChallenges();
      BOOL v39 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
      id v34 = (void *)*MEMORY[0x263F23570];
      if (v39)
      {
        int v46 = 138543362;
        double v47 = *(double *)&v34;
        int v35 = "Decrease from Month A to Month B = 10-24%%, suffix is %{public}@.";
LABEL_20:
        _os_log_impl(&dword_21F5DA000, v32, OS_LOG_TYPE_DEFAULT, v35, (uint8_t *)&v46, 0xCu);
      }
    }
LABEL_21:

    int v36 = v34;
    if (v36)
    {
      double v30 = v36;
      if ([v28 containsObject:v36]) {
        BOOL v37 = v30;
      }
      else {
        BOOL v37 = 0;
      }
      uint64_t v31 = v37;
LABEL_26:

LABEL_40:
      int v27 = v31;

      uint64_t v23 = v27;
LABEL_41:

      goto LABEL_42;
    }
LABEL_39:
    uint64_t v31 = 0;
    goto LABEL_40;
  }
  uint32_t v22 = ACHLogMonthlyChallenges();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v46) = 0;
    _os_log_impl(&dword_21F5DA000, v22, OS_LOG_TYPE_DEFAULT, "Trying to obtain suffix for ACHMonthlyChallengeTypeUndefined or ACHMonthlyChallengeTypeMaxValue, returning", (uint8_t *)&v46, 2u);
  }
  uint64_t v23 = 0;
LABEL_42:

  return v23;
}

- (double)_roundedGoalValue:(double)a3 monthlyChallengeType:(unint64_t)a4
{
  double v4 = a3;
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (a3 >= 2.22044605e-16)
  {
    if (a4 == 20 || a4 == 6)
    {
      double v4 = ceil(a3 / 10.0) * 10.0;
    }
    else
    {
      double v5 = ceil(a3);
      double v6 = ceil(v4 / 100.0);
      if (a4 == 5) {
        double v4 = v6 * 100.0;
      }
      else {
        double v4 = v5;
      }
    }
    double v7 = ACHLogMonthlyChallenges();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = ACHMonthlyChallengeNameFromChallengeType();
      int v10 = 134218242;
      double v11 = v4;
      __int16 v12 = 2114;
      int v13 = v8;
      _os_log_impl(&dword_21F5DA000, v7, OS_LOG_TYPE_DEFAULT, "Rounded goal value (%f) set for Monthly Challenge: %{public}@", (uint8_t *)&v10, 0x16u);
    }
  }
  return v4;
}

- (id)_maximumValueForMonthlyChallengeType:(unint64_t)a3
{
  if (a3 > 0x18)
  {
    double v6 = 0;
  }
  else if (((1 << a3) & 0x10FFF9E) != 0)
  {
    double v4 = NSNumber;
    double v5 = [(ACHMonthlyChallengeTemplateSource *)self currentDate];
    double v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", -[ACHMonthlyChallengeTemplateSource _numberOfDaysInMonthForDate:](self, "_numberOfDaysInMonthForDate:", v5) - 3);
  }
  else if (((1 << a3) & 0xA00000) != 0)
  {
    double v6 = &unk_26D116268;
  }
  else
  {
    double v6 = 0;
  }
  return v6;
}

- (id)_minimumValueForMonthlyChallengeType:(unint64_t)a3
{
  if (a3 - 1 > 0x1B) {
    return 0;
  }
  else {
    return (id)qword_2645175D0[a3 - 1];
  }
}

- (void)setCurrentDateOverride:(id)a3
{
}

- (void)setCurrentCalendarOverride:(id)a3
{
}

- (void)setIsStandalonePhoneFitnessModeOverride:(BOOL)a3
{
  double v4 = [NSNumber numberWithBool:a3];
  isStandalonePhoneFitnessModeOverride = self->_isStandalonePhoneFitnessModeOverride;
  self->_isStandalonePhoneFitnessModeOverride = v4;
  MEMORY[0x270F9A758](v4, isStandalonePhoneFitnessModeOverride);
}

- (void)setPairedDeviceRegistrySharedInstanceOverride:(id)a3
{
}

- (NSDate)currentDate
{
  currentDateOverride = self->_currentDateOverride;
  if (currentDateOverride)
  {
    uint32_t v3 = currentDateOverride;
  }
  else
  {
    uint32_t v3 = [MEMORY[0x263EFF910] date];
  }
  return v3;
}

- (NSCalendar)currentCalendar
{
  currentCalendarOverride = self->_currentCalendarOverride;
  if (currentCalendarOverride)
  {
    uint32_t v3 = currentCalendarOverride;
  }
  else
  {
    objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendarWithLocalTimeZone");
    uint32_t v3 = (NSCalendar *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (BOOL)isStandalonePhoneFitnessMode
{
  isStandalonePhoneFitnessModeOverride = self->_isStandalonePhoneFitnessModeOverride;
  if (isStandalonePhoneFitnessModeOverride)
  {
    return [(NSNumber *)isStandalonePhoneFitnessModeOverride BOOLValue];
  }
  else
  {
    double v4 = [MEMORY[0x263F0A980] sharedBehavior];
    char v5 = [v4 isStandalonePhoneFitnessMode];

    return v5;
  }
}

- (BOOL)subObjectsHaveDatabaseAssertions
{
  uint32_t v3 = [(ACHMonthlyChallengeTemplateSource *)self dataSource];
  double v4 = [v3 databaseContext];
  if (v4)
  {
    char v5 = [(ACHMonthlyChallengeTemplateSource *)self templateCache];
    double v6 = [v5 databaseContext];
    BOOL v7 = v6 != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)pairedDeviceRegistrySharedInstance
{
  pairedDeviceRegistrySharedInstanceOverride = self->_pairedDeviceRegistrySharedInstanceOverride;
  if (pairedDeviceRegistrySharedInstanceOverride)
  {
    uint32_t v3 = pairedDeviceRegistrySharedInstanceOverride;
  }
  else
  {
    uint32_t v3 = [MEMORY[0x263F57730] sharedInstance];
  }
  return v3;
}

- (void)setCurrentCalendar:(id)a3
{
}

- (void)setCurrentDate:(id)a3
{
}

- (void)setIsStandalonePhoneFitnessMode:(BOOL)a3
{
  self->_isStandalonePhoneFitnessMode = a3;
}

- (ACHMonthlyChallengeDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (ACHMonthlyChallengeTemplateDataProvider)templateDataProvider
{
  return self->_templateDataProvider;
}

- (void)setTemplateDataProvider:(id)a3
{
}

- (ACHSyncingMonthlyChallengeTemplateCache)templateCache
{
  return self->_templateCache;
}

- (void)setTemplateCache:(id)a3
{
}

- (BOOL)isAppleWatch
{
  return self->_isAppleWatch;
}

- (void)setIsAppleWatch:(BOOL)a3
{
  self->_isAppleWatch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateCache, 0);
  objc_storeStrong((id *)&self->_templateDataProvider, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_currentDate, 0);
  objc_storeStrong((id *)&self->_currentCalendar, 0);
  objc_storeStrong((id *)&self->_pairedDeviceRegistrySharedInstanceOverride, 0);
  objc_storeStrong((id *)&self->_isStandalonePhoneFitnessModeOverride, 0);
  objc_storeStrong((id *)&self->_currentCalendarOverride, 0);
  objc_storeStrong((id *)&self->_currentDateOverride, 0);
}

- (void)templatesForDate:(uint64_t)a1 databaseContext:(NSObject *)a2 completion:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21F5DA000, a2, OS_LOG_TYPE_ERROR, "Error loading cached templates: %@", (uint8_t *)&v2, 0xCu);
}

- (void)customPlaceholderValuesForTemplate:(NSObject *)a3 error:.cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  char v5 = [a1 availabilityStart];
  double v6 = [a2 startDateComponents];
  int v7 = 138543618;
  uint64_t v8 = v5;
  __int16 v9 = 2114;
  int v10 = v6;
  _os_log_debug_impl(&dword_21F5DA000, a3, OS_LOG_TYPE_DEBUG, "Progress: not adding progress as challenge not for current month: availability start (%{public}@) vs current month start date (%{public}@).", (uint8_t *)&v7, 0x16u);
}

- (void)_goalValueForCurrentMonthForType:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [NSNumber numberWithUnsignedInteger:a1];
  int v4 = 138543362;
  char v5 = v3;
  _os_log_error_impl(&dword_21F5DA000, a2, OS_LOG_TYPE_ERROR, "Calculated a zero target value for type %{public}@", (uint8_t *)&v4, 0xCu);
}

@end
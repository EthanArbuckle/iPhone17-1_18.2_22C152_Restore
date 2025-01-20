@interface ACHAchievementsProfileExtension
- (ACHAWDSubmissionManager)submissionManager;
- (ACHAchievementProgressEngine)progressProvider;
- (ACHAchievementStoring)achievementStore;
- (ACHAchievementsProfileExtension)initWithProfile:(id)a3 mobileAssetProvider:(id)a4;
- (ACHAchievementsProfileExtension)initWithProfile:(id)a3 mobileAssetProvider:(id)a4 unitTesting:(BOOL)a5;
- (ACHActivityAwardingSource)activityAwardingSource;
- (ACHActivitySummaryUtility)activitySummaryUtility;
- (ACHAwardingScheduler)awardingScheduler;
- (ACHBackCompatMonthlyChallengeListener)backCompatMonthlyChallengeListener;
- (ACHBuiltinTemplateSource)builtInTemplateSource;
- (ACHDataStore)dataStore;
- (ACHEarnedInstanceAwardingEngine)awardingEngine;
- (ACHEarnedInstanceEntityWrapper)earnedInstanceEntityWrapper;
- (ACHEarnedInstanceStore)earnedInstanceStore;
- (ACHMobileAssetProvider)mobileAssetProvider;
- (ACHMonthlyChallengeAwardingSource)monthlyChallengeAwardingSource;
- (ACHMonthlyChallengeTemplateSource)monthlyChallengeTemplateSource;
- (ACHPerfectMonthTemplateSource)perfectMonthTemplateSource;
- (ACHRemoteTemplateAvailabilityKeyProvider)remoteTemplateAvailabilityKeyProvider;
- (ACHRemoteTemplateAvailabilityListener)remoteTemplateAvailabilityListener;
- (ACHRemoteTemplateSource)remoteTemplateSource;
- (ACHTemplateAssetRegistry)templateAssetRegistry;
- (ACHTemplateEntityWrapper)templateEntityWrapper;
- (ACHTemplateSourceScheduler)templateSourceScheduler;
- (ACHTemplateStore)templateStore;
- (ACHWorkoutAwardingSource)workoutAwardingSource;
- (ACHWorkoutUtility)workoutUtility;
- (BOOL)_shouldPerformFitnessMigration;
- (BOOL)_updateActivityChallengeAssetsURL;
- (BOOL)fitnessAppIsInstalled;
- (BOOL)initialMoveGoalFetchCompleted;
- (BOOL)initialMoveGoalHasBeenSet;
- (BOOL)isWatch;
- (BOOL)krakenUnleashed;
- (BOOL)performMigration;
- (BOOL)storesHaveBeenSet;
- (BOOL)unitTesting;
- (HDProfile)profile;
- (HDXPCListener)listener;
- (NSMutableSet)awardingSourcesToRegister;
- (NSMutableSet)templatesSourcesToRegister;
- (NSSet)blocksWaitingOnInitialization;
- (NSString)currentBuildVersion;
- (id)_currentBuildVersion;
- (id)exportObjectForListener:(id)a3 client:(id)a4 error:(id *)a5;
- (id)listenerEndpointForClient:(id)a3 error:(id *)a4;
- (void)_activateActivityAchievements;
- (void)_applicationsInstalled:(id)a3;
- (void)_applicationsUninstalled:(id)a3;
- (void)_checkForMoveGoal;
- (void)_deactivateActivityAchievements;
- (void)_deregisterAwardingSource:(id)a3;
- (void)_deregisterTemplateSource:(id)a3;
- (void)_finishingUnleashingTheKrakenForDevice:(unsigned __int8)a3;
- (void)_handleFitnessAppsRestricted:(id)a3;
- (void)_loadInitialMoveGoal;
- (void)_registerApplicationNotifications;
- (void)_registerAwardingSource:(id)a3;
- (void)_registerFitnessAppsNotifications;
- (void)_registerTemplateSource:(id)a3;
- (void)_removeAllAchievementsIfNeeded;
- (void)_restrainTheKraken;
- (void)_saveFitnessMigrationBuildVersion;
- (void)_setupStoresForDeviceIfNecesseary:(unsigned __int8)a3;
- (void)_unleashTheKraken;
- (void)_unleashTheKrakenUnderProperConditions;
- (void)daemonReady:(id)a3;
- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4;
- (void)deregisterTemplateSource:(id)a3 awardingSource:(id)a4;
- (void)endPhaseRegistration;
- (void)performBlockAfterInitialization:(id)a3;
- (void)registerTemplateSource:(id)a3 awardingSource:(id)a4;
- (void)requestImmediateUpdateForTemplateSource:(id)a3;
- (void)requestIncrementalEvaluationForAwardingSource:(id)a3 evaluationBlock:(id)a4;
- (void)samplesAdded:(id)a3 anchor:(id)a4;
- (void)setAchievementStore:(id)a3;
- (void)setActivityAwardingSource:(id)a3;
- (void)setActivitySummaryUtility:(id)a3;
- (void)setAwardingEngine:(id)a3;
- (void)setAwardingScheduler:(id)a3;
- (void)setAwardingSourcesToRegister:(id)a3;
- (void)setBackCompatMonthlyChallengeListener:(id)a3;
- (void)setBlocksWaitingOnInitialization:(id)a3;
- (void)setBuiltInTemplateSource:(id)a3;
- (void)setCurrentBuildVersion:(id)a3;
- (void)setDataStore:(id)a3;
- (void)setEarnedInstanceEntityWrapper:(id)a3;
- (void)setEarnedInstanceStore:(id)a3;
- (void)setFitnessAppIsInstalled:(BOOL)a3;
- (void)setInitialMoveGoalFetchCompleted:(BOOL)a3;
- (void)setInitialMoveGoalHasBeenSet:(BOOL)a3;
- (void)setIsWatch:(BOOL)a3;
- (void)setKrakenUnleashed:(BOOL)a3;
- (void)setListener:(id)a3;
- (void)setMobileAssetProvider:(id)a3;
- (void)setMonthlyChallengeAwardingSource:(id)a3;
- (void)setMonthlyChallengeTemplateSource:(id)a3;
- (void)setPerfectMonthTemplateSource:(id)a3;
- (void)setProfile:(id)a3;
- (void)setProgressProvider:(id)a3;
- (void)setRemoteTemplateAvailabilityKeyProvider:(id)a3;
- (void)setRemoteTemplateAvailabilityListener:(id)a3;
- (void)setRemoteTemplateSource:(id)a3;
- (void)setStoresHaveBeenSet:(BOOL)a3;
- (void)setSubmissionManager:(id)a3;
- (void)setTemplateAssetRegistry:(id)a3;
- (void)setTemplateEntityWrapper:(id)a3;
- (void)setTemplateSourceScheduler:(id)a3;
- (void)setTemplateStore:(id)a3;
- (void)setTemplatesSourcesToRegister:(id)a3;
- (void)setUnitTesting:(BOOL)a3;
- (void)setWorkoutAwardingSource:(id)a3;
- (void)setWorkoutUtility:(id)a3;
- (void)tryInitialAchievementLoadWithCompletionHandler:(id)a3;
@end

@implementation ACHAchievementsProfileExtension

- (ACHAchievementsProfileExtension)initWithProfile:(id)a3 mobileAssetProvider:(id)a4
{
  return [(ACHAchievementsProfileExtension *)self initWithProfile:a3 mobileAssetProvider:a4 unitTesting:0];
}

- (ACHAchievementsProfileExtension)initWithProfile:(id)a3 mobileAssetProvider:(id)a4 unitTesting:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v32.receiver = self;
  v32.super_class = (Class)ACHAchievementsProfileExtension;
  v10 = [(ACHAchievementsProfileExtension *)&v32 init];
  if (v10)
  {
    v11 = ACHLogDefault();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v31[0] = 0;
      _os_log_impl(&dword_241DC5000, v11, OS_LOG_TYPE_DEFAULT, "Loading ActivityAchievements plugin...", (uint8_t *)v31, 2u);
    }

    v10->_accessLock._os_unfair_lock_opaque = 0;
    uint64_t v12 = HKCreateSerialDispatchQueue();
    clientQueue = v10->_clientQueue;
    v10->_clientQueue = (OS_dispatch_queue *)v12;

    objc_storeWeak((id *)&v10->_profile, v8);
    v14 = [v8 daemon];
    v15 = [v14 behavior];
    int v16 = [v15 isAppleWatch];

    id v17 = objc_alloc(MEMORY[0x263F23838]);
    id WeakRetained = objc_loadWeakRetained((id *)&v10->_profile);
    if (v16) {
      uint64_t v19 = 1;
    }
    else {
      uint64_t v19 = 2;
    }
    uint64_t v20 = [v17 initWithProfile:WeakRetained creatorDevice:v19];
    remoteTemplateAvailabilityKeyProvider = v10->_remoteTemplateAvailabilityKeyProvider;
    v10->_remoteTemplateAvailabilityKeyProvider = (ACHRemoteTemplateAvailabilityKeyProvider *)v20;

    v10->_unitTesting = a5;
    uint64_t v22 = [MEMORY[0x263EFFA08] set];
    blocksWaitingOnInitialization = v10->_blocksWaitingOnInitialization;
    v10->_blocksWaitingOnInitialization = (NSSet *)v22;

    *(_WORD *)&v10->_initialMoveGoalFetchCompleted = 0;
    id v24 = objc_loadWeakRetained((id *)&v10->_profile);
    v25 = [v24 healthDaemon];
    v26 = [v25 behavior];
    v10->_isWatch = [v26 isAppleWatch];

    objc_storeStrong((id *)&v10->_mobileAssetProvider, a4);
    if (v10->_unitTesting)
    {
      v10->_fitnessAppIsInstalled = 1;
      [(ACHAchievementsProfileExtension *)v10 _unleashTheKrakenUnderProperConditions];
    }
    else
    {
      v27 = [MEMORY[0x263F01880] defaultWorkspace];
      v10->_fitnessAppIsInstalled = [v27 applicationIsInstalled:@"com.apple.Fitness"];
    }
    [(ACHAchievementsProfileExtension *)v10 _registerApplicationNotifications];
    [(ACHAchievementsProfileExtension *)v10 _registerFitnessAppsNotifications];
    if ([(ACHAchievementsProfileExtension *)v10 _shouldPerformFitnessMigration])
    {
      if (![(ACHAchievementsProfileExtension *)v10 performMigration])
      {
        _HKInitializeLogging();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_ERROR)) {
          sub_241DC9BB0();
        }
      }
    }
    id v28 = objc_loadWeakRetained((id *)&v10->_profile);
    v29 = [v28 daemon];
    [v29 registerForDaemonReady:v10];
  }
  return v10;
}

- (void)daemonReady:(id)a3
{
  v4 = ACHLogDefault();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_241DC5000, v4, OS_LOG_TYPE_DEFAULT, "Plugin received daemonReady", v5, 2u);
  }

  if ((FIAreFitnessAppsRestricted() & 1) == 0) {
    [(ACHAchievementsProfileExtension *)self _activateActivityAchievements];
  }
}

- (void)_activateActivityAchievements
{
  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  if (self->_templateStore)
  {
    os_unfair_lock_unlock(p_accessLock);
    v4 = ACHLogDefault();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_241DC5000, v4, OS_LOG_TYPE_DEFAULT, "Not activating Fitness submanagers because they're already running.", buf, 2u);
    }
  }
  else
  {
    v5 = ACHLogDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_241DC5000, v5, OS_LOG_TYPE_DEFAULT, "Activating Fitness called...", v8, 2u);
    }

    v6 = [(ACHAchievementsProfileExtension *)self profile];
    v7 = [v6 database];
    [v7 addProtectedDataObserver:self];

    os_unfair_lock_unlock(p_accessLock);
    [(ACHAchievementsProfileExtension *)self _removeAllAchievementsIfNeeded];
    [(ACHAchievementsProfileExtension *)self _loadInitialMoveGoal];
  }
}

- (void)_deactivateActivityAchievements
{
  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  if (self->_templateStore)
  {
    v4 = ACHLogDefault();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_241DC5000, v4, OS_LOG_TYPE_DEFAULT, "Deactivating Fitness submanagers...", v8, 2u);
    }

    v5 = [(ACHAchievementsProfileExtension *)self profile];
    v6 = [v5 database];
    [v6 removeProtectedDataObserver:self];

    os_unfair_lock_unlock(p_accessLock);
    [(ACHAchievementsProfileExtension *)self _restrainTheKraken];
  }
  else
  {
    os_unfair_lock_unlock(p_accessLock);
    v7 = ACHLogDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_241DC5000, v7, OS_LOG_TYPE_DEFAULT, "Achievements already deactivated.", buf, 2u);
    }
  }
}

- (void)_handleFitnessAppsRestricted:(id)a3
{
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  if (a4)
  {
    v5 = ACHLogDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_241DC5000, v5, OS_LOG_TYPE_DEFAULT, "Plugin received protected data available", v6, 2u);
    }

    [(ACHAchievementsProfileExtension *)self _loadInitialMoveGoal];
  }
}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  v5 = ACHLogDefault();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_241DC5000, v5, OS_LOG_TYPE_DEFAULT, "Plugin received move goal samples", buf, 2u);
  }

  [(ACHAchievementsProfileExtension *)self _checkForMoveGoal];
  if (self->_unitTesting || self->_initialMoveGoalHasBeenSet)
  {
    v6 = ACHLogDefault();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_241DC5000, v6, OS_LOG_TYPE_DEFAULT, "User has added a goal, stopping observing samples, and unleashing the Kraken!", v13, 2u);
    }

    v7 = [(ACHAchievementsProfileExtension *)self profile];
    id v8 = [v7 dataManager];
    id v9 = [MEMORY[0x263F0A598] calorieGoal];
    [v8 removeObserver:self forDataType:v9];

    v10 = [(ACHAchievementsProfileExtension *)self profile];
    v11 = [v10 dataManager];
    uint64_t v12 = [MEMORY[0x263F0A598] moveMinuteGoal];
    [v11 removeObserver:self forDataType:v12];

    os_unfair_lock_lock(&self->_accessLock);
    [(ACHAchievementsProfileExtension *)self _unleashTheKrakenUnderProperConditions];
    os_unfair_lock_unlock(&self->_accessLock);
  }
}

- (void)_checkForMoveGoal
{
  v3 = HDQuantitySampleEntityPredicateForQuantity();
  v4 = (void *)MEMORY[0x263F432E8];
  v5 = [MEMORY[0x263F0A598] calorieGoal];
  v6 = [(ACHAchievementsProfileExtension *)self profile];
  id v30 = 0;
  uint64_t v7 = [v4 countOfSamplesWithType:v5 profile:v6 matchingPredicate:v3 withError:&v30];
  id v8 = v30;

  id v9 = (void *)MEMORY[0x263F432E8];
  v10 = [MEMORY[0x263F0A598] moveMinuteGoal];
  v11 = [(ACHAchievementsProfileExtension *)self profile];
  id v29 = 0;
  uint64_t v12 = [v9 countOfSamplesWithType:v10 profile:v11 matchingPredicate:v3 withError:&v29];
  id v13 = v29;

  if (v8)
  {
    v14 = ACHLogDefault();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_241DC9C5C((uint64_t)v8, v14, v15, v16, v17, v18, v19, v20);
    }
LABEL_7:

    goto LABEL_8;
  }
  if (v13)
  {
    v14 = ACHLogDefault();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_241DC9BF0((uint64_t)v13, v14, v21, v22, v23, v24, v25, v26);
    }
    goto LABEL_7;
  }
  [(ACHAchievementsProfileExtension *)self setInitialMoveGoalFetchCompleted:1];
  v27 = ACHLogDefault();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v28 = 0;
    _os_log_impl(&dword_241DC5000, v27, OS_LOG_TYPE_DEFAULT, "Plugin move goal query completed", v28, 2u);
  }

  if (v7 + v12) {
    [(ACHAchievementsProfileExtension *)self setInitialMoveGoalHasBeenSet:1];
  }
LABEL_8:
}

- (void)_loadInitialMoveGoal
{
  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  if (![(ACHAchievementsProfileExtension *)self initialMoveGoalFetchCompleted])
  {
    [(ACHAchievementsProfileExtension *)self _checkForMoveGoal];
    if (![(ACHAchievementsProfileExtension *)self initialMoveGoalHasBeenSet])
    {
      v4 = ACHLogDefault();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v12 = 0;
        _os_log_impl(&dword_241DC5000, v4, OS_LOG_TYPE_DEFAULT, "User does *not* have a goal set, starting to observe for one", v12, 2u);
      }

      v5 = [(ACHAchievementsProfileExtension *)self profile];
      v6 = [v5 dataManager];
      uint64_t v7 = [MEMORY[0x263F0A598] calorieGoal];
      [v6 addObserver:self forDataType:v7];

      id v8 = [(ACHAchievementsProfileExtension *)self profile];
      id v9 = [v8 dataManager];
      v10 = [MEMORY[0x263F0A598] moveMinuteGoal];
      [v9 addObserver:self forDataType:v10];
    }
  }
  if ([(ACHAchievementsProfileExtension *)self krakenUnleashed])
  {
    v11 = ACHLogDefault();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_241DC9CC8();
    }
  }
  else
  {
    [(ACHAchievementsProfileExtension *)self _unleashTheKrakenUnderProperConditions];
  }
  os_unfair_lock_unlock(p_accessLock);
}

- (void)_registerFitnessAppsNotifications
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__handleFitnessAppsAllowed_ name:*MEMORY[0x263F43020] object:0];

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel__handleFitnessAppsRestricted_ name:*MEMORY[0x263F43028] object:0];
}

- (void)_registerApplicationNotifications
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__applicationsInstalled_ name:*MEMORY[0x263F43008] object:0];

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel__applicationsUninstalled_ name:*MEMORY[0x263F43018] object:0];
}

- (void)_applicationsInstalled:(id)a3
{
  id v4 = [a3 userInfo];
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F43000]];
  int v6 = [v5 containsObject:@"com.apple.Fitness"];

  if (v6)
  {
    uint64_t v7 = ACHLogDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_241DC5000, v7, OS_LOG_TYPE_DEFAULT, "The Activity app has been installed.", v8, 2u);
    }

    os_unfair_lock_lock(&self->_accessLock);
    [(ACHAchievementsProfileExtension *)self setFitnessAppIsInstalled:1];
    [(ACHAchievementsProfileExtension *)self _unleashTheKrakenUnderProperConditions];
    os_unfair_lock_unlock(&self->_accessLock);
  }
}

- (void)_applicationsUninstalled:(id)a3
{
  id v4 = [a3 userInfo];
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F43010]];
  int v6 = [v5 containsObject:@"com.apple.Fitness"];

  if (v6)
  {
    uint64_t v7 = ACHLogDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_241DC5000, v7, OS_LOG_TYPE_DEFAULT, "The Activity app has been uninstalled", v8, 2u);
    }

    os_unfair_lock_lock(&self->_accessLock);
    [(ACHAchievementsProfileExtension *)self setFitnessAppIsInstalled:0];
    os_unfair_lock_unlock(&self->_accessLock);
    [(ACHAchievementsProfileExtension *)self _removeAllAchievementsIfNeeded];
  }
}

- (void)_removeAllAchievementsIfNeeded
{
  if (![(ACHAchievementsProfileExtension *)self fitnessAppIsInstalled]
    && ![(ACHAchievementsProfileExtension *)self isWatch])
  {
    v3 = (void *)MEMORY[0x263F237D8];
    id v4 = [(ACHAchievementsProfileExtension *)self profile];
    id v13 = 0;
    LOBYTE(v3) = [v3 removeAllEarnedInstancesWithProfile:v4 error:&v13];
    id v5 = v13;

    if ((v3 & 1) == 0)
    {
      int v6 = ACHLogDefault();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_241DC9CFC((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
}

- (void)_unleashTheKrakenUnderProperConditions
{
  if ([(ACHAchievementsProfileExtension *)self unitTesting]) {
    goto LABEL_13;
  }
  if (![(ACHAchievementsProfileExtension *)self isWatch]
    && [(ACHAchievementsProfileExtension *)self fitnessAppIsInstalled]
    && [(ACHAchievementsProfileExtension *)self initialMoveGoalHasBeenSet])
  {
    v3 = ACHLogDefault();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v7 = 0;
      id v4 = "iPhone: user has goal set and app is installed";
      id v5 = (uint8_t *)&v7;
LABEL_11:
      _os_log_impl(&dword_241DC5000, v3, OS_LOG_TYPE_DEFAULT, v4, v5, 2u);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  if ([(ACHAchievementsProfileExtension *)self isWatch]
    && [(ACHAchievementsProfileExtension *)self initialMoveGoalHasBeenSet])
  {
    v3 = ACHLogDefault();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v6) = 0;
      id v4 = "Watch: user has goal set";
      id v5 = (uint8_t *)&v6;
      goto LABEL_11;
    }
LABEL_12:

LABEL_13:
    [(ACHAchievementsProfileExtension *)self _unleashTheKraken];
  }
}

- (void)_unleashTheKraken
{
  if (![(ACHAchievementsProfileExtension *)self krakenUnleashed])
  {
    v3 = ACHLogDefault();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_241DC5000, v3, OS_LOG_TYPE_DEFAULT, "Plugin unleashing the Kraken!", buf, 2u);
    }

    if ([(ACHAchievementsProfileExtension *)self isWatch]) {
      uint64_t v4 = 1;
    }
    else {
      uint64_t v4 = 2;
    }
    [(ACHAchievementsProfileExtension *)self _setupStoresForDeviceIfNecesseary:v4];
    if ([(ACHAchievementsProfileExtension *)self unitTesting])
    {
      [(ACHAchievementsProfileExtension *)self endPhaseRegistration];
    }
    else
    {
      v5[0] = MEMORY[0x263EF8330];
      v5[1] = 3221225472;
      v5[2] = sub_241DC7848;
      v5[3] = &unk_2650F8460;
      v5[4] = self;
      char v6 = v4;
      [(ACHAchievementsProfileExtension *)self tryInitialAchievementLoadWithCompletionHandler:v5];
    }
  }
}

- (void)_setupStoresForDeviceIfNecesseary:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  BOOL storesHaveBeenSet = self->_storesHaveBeenSet;
  char v6 = ACHLogDefault();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (storesHaveBeenSet)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_241DC5000, v6, OS_LOG_TYPE_DEFAULT, "Plugin stores are already set up, skipping", buf, 2u);
    }
  }
  else
  {
    if (v7)
    {
      *(_WORD *)objc_super v32 = 0;
      _os_log_impl(&dword_241DC5000, v6, OS_LOG_TYPE_DEFAULT, "Plugin setting up stores!", v32, 2u);
    }

    id v8 = objc_alloc(MEMORY[0x263F23870]);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    uint64_t v10 = (ACHTemplateEntityWrapper *)[v8 initWithProfile:WeakRetained];
    templateEntityWrapper = self->_templateEntityWrapper;
    self->_templateEntityWrapper = v10;

    id v12 = objc_alloc(MEMORY[0x263F23880]);
    id v13 = objc_loadWeakRetained((id *)&self->_profile);
    v14 = (ACHTemplateStore *)[v12 initWithProfile:v13 entityWrapper:self->_templateEntityWrapper device:v3];
    templateStore = self->_templateStore;
    self->_templateStore = v14;

    id v16 = objc_alloc(MEMORY[0x263F237E0]);
    id v17 = objc_loadWeakRetained((id *)&self->_profile);
    uint64_t v18 = (ACHEarnedInstanceEntityWrapper *)[v16 initWithProfile:v17];
    earnedInstanceEntityWrapper = self->_earnedInstanceEntityWrapper;
    self->_earnedInstanceEntityWrapper = v18;

    char v6 = [objc_alloc(MEMORY[0x263F237D0]) initWithTemplateStore:self->_templateStore];
    id v20 = objc_alloc(MEMORY[0x263F237E8]);
    id v21 = objc_loadWeakRetained((id *)&self->_profile);
    uint64_t v22 = (ACHEarnedInstanceStore *)[v20 initWithProfile:v21 earnedInstanceEntityWrapper:self->_earnedInstanceEntityWrapper earnedInstanceDuplicateUtility:v6 device:v3];
    earnedInstanceStore = self->_earnedInstanceStore;
    self->_earnedInstanceStore = v22;

    [MEMORY[0x263F23778] setEarnedInstanceStore:self->_earnedInstanceStore];
    uint64_t v24 = (ACHTemplateAssetRegistry *)[objc_alloc(MEMORY[0x263F23860]) initWithRemoteTemplateAvailabilityKeyProvider:self->_remoteTemplateAvailabilityKeyProvider];
    templateAssetRegistry = self->_templateAssetRegistry;
    self->_templateAssetRegistry = v24;

    uint64_t v26 = (ACHAchievementProgressEngine *)objc_alloc_init(MEMORY[0x263F23730]);
    progressProvider = self->_progressProvider;
    self->_progressProvider = v26;

    id v28 = (ACHAchievementStoring *)[objc_alloc(MEMORY[0x263F237F8]) initWithTemplateStore:self->_templateStore earnedInstanceStore:self->_earnedInstanceStore templateAssetRegistry:self->_templateAssetRegistry progressProvider:self->_progressProvider];
    achievementStore = self->_achievementStore;
    self->_achievementStore = v28;

    self->_BOOL storesHaveBeenSet = 1;
    id v30 = ACHLogDefault();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v31 = 0;
      _os_log_impl(&dword_241DC5000, v30, OS_LOG_TYPE_DEFAULT, "Plugin stores set", v31, 2u);
    }
  }
}

- (void)_finishingUnleashingTheKrakenForDevice:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  char v6 = ACHLogDefault();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_241DC5000, v6, OS_LOG_TYPE_DEFAULT, "Finish unleashing the Kraken", buf, 2u);
  }

  if (![(ACHAchievementsProfileExtension *)self krakenUnleashed])
  {
    id v8 = objc_alloc(MEMORY[0x263F23878]);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    uint64_t v10 = (ACHTemplateSourceScheduler *)[v8 initWithProfile:WeakRetained templateStore:self->_templateStore achievementStore:self->_achievementStore];
    templateSourceScheduler = self->_templateSourceScheduler;
    self->_templateSourceScheduler = v10;

    id v12 = (ACHBuiltinTemplateSource *)objc_alloc_init(MEMORY[0x263F23790]);
    builtInTemplateSource = self->_builtInTemplateSource;
    self->_builtInTemplateSource = v12;

    [(ACHAchievementsProfileExtension *)self _registerTemplateSource:self->_builtInTemplateSource];
    v14 = (ACHPerfectMonthTemplateSource *)objc_alloc_init(MEMORY[0x263F23828]);
    perfectMonthTemplateSource = self->_perfectMonthTemplateSource;
    self->_perfectMonthTemplateSource = v14;

    [(ACHAchievementsProfileExtension *)self _registerTemplateSource:self->_perfectMonthTemplateSource];
    id v16 = objc_alloc(MEMORY[0x263F23750]);
    id v17 = objc_loadWeakRetained((id *)&self->_profile);
    uint64_t v18 = (ACHActivitySummaryUtility *)[v16 initWithProfile:v17 shouldIncludePrivateProperties:1];
    activitySummaryUtility = self->_activitySummaryUtility;
    self->_activitySummaryUtility = v18;

    id v20 = objc_alloc(MEMORY[0x263F23898]);
    id v21 = objc_loadWeakRetained((id *)&self->_profile);
    uint64_t v22 = (ACHWorkoutUtility *)[v20 initWithProfile:v21];
    workoutUtility = self->_workoutUtility;
    self->_workoutUtility = v22;

    id v24 = objc_alloc(MEMORY[0x263F23810]);
    id v25 = objc_loadWeakRetained((id *)&self->_profile);
    uint64_t v26 = (void *)[v24 initWithProfile:v25 activitySummaryUtility:self->_activitySummaryUtility workoutUtility:self->_workoutUtility];

    id v27 = objc_alloc(MEMORY[0x263F23818]);
    id v28 = objc_loadWeakRetained((id *)&self->_profile);
    uint64_t v29 = [v27 initWithProfile:v28 achievementStore:self->_achievementStore activitySummaryUtility:self->_activitySummaryUtility];

    id v30 = objc_alloc(MEMORY[0x263F23858]);
    id v31 = objc_loadWeakRetained((id *)&self->_profile);
    objc_super v32 = (void *)[v30 initWithProfile:v31];

    v87 = (void *)v29;
    v33 = (ACHMonthlyChallengeTemplateSource *)[objc_alloc(MEMORY[0x263F23820]) initWithDataSource:v26 dataProvider:v29 templateCache:v32];
    monthlyChallengeTemplateSource = self->_monthlyChallengeTemplateSource;
    self->_monthlyChallengeTemplateSource = v33;

    [(ACHAchievementsProfileExtension *)self _registerTemplateSource:self->_monthlyChallengeTemplateSource];
    id v35 = objc_loadWeakRetained((id *)&self->_profile);
    v36 = [v35 daemon];
    v37 = [v36 behavior];
    LODWORD(v29) = [v37 isAppleWatch];

    id v38 = objc_alloc(MEMORY[0x263F23788]);
    id v39 = objc_loadWeakRetained((id *)&self->_profile);
    if (v29) {
      uint64_t v40 = 1;
    }
    else {
      uint64_t v40 = 2;
    }
    v41 = (void *)[v38 initWithProfile:v39 creatorDevice:v40];

    v42 = (ACHRemoteTemplateAvailabilityListener *)objc_alloc_init(MEMORY[0x263F23840]);
    remoteTemplateAvailabilityListener = self->_remoteTemplateAvailabilityListener;
    self->_remoteTemplateAvailabilityListener = v42;

    v44 = (ACHRemoteTemplateSource *)[objc_alloc(MEMORY[0x263F23848]) initWithMobileAssetProvider:self->_mobileAssetProvider backCompatWriter:v41 remoteTemplateAvailabilityKeyProvider:self->_remoteTemplateAvailabilityKeyProvider];
    remoteTemplateSource = self->_remoteTemplateSource;
    self->_remoteTemplateSource = v44;

    [(ACHAchievementsProfileExtension *)self _registerTemplateSource:self->_remoteTemplateSource];
    v46 = ACHLogDefault();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_241DC5000, v46, OS_LOG_TYPE_DEFAULT, "Plugin registered template sources", buf, 2u);
    }

    id v47 = objc_alloc(MEMORY[0x263F23780]);
    id v48 = objc_loadWeakRetained((id *)&self->_profile);
    v49 = (ACHBackCompatMonthlyChallengeListener *)[v47 initWithProfile:v48 templateStore:self->_templateStore];
    backCompatMonthlyChallengeListener = self->_backCompatMonthlyChallengeListener;
    self->_backCompatMonthlyChallengeListener = v49;

    id v51 = objc_alloc(MEMORY[0x263F237A8]);
    id v52 = objc_loadWeakRetained((id *)&self->_profile);
    v53 = (ACHDataStore *)[v51 initWithProfile:v52];
    dataStore = self->_dataStore;
    self->_dataStore = v53;

    *(_OWORD *)buf = 0u;
    long long v91 = 0u;
    ACHCompanionHistoricalEvaluationPolicy();
    if ([(ACHAchievementsProfileExtension *)self isWatch]
      && FIIsActivePairedDeviceSatellitePaired())
    {
      ACHTinkerHistoricalEvaluationPolicy();
      *(_OWORD *)buf = v88;
      long long v91 = v89;
      int v55 = 1;
    }
    else if ([(ACHAchievementsProfileExtension *)self isWatch])
    {
      ACHGizmoHistoricalEvaluationPolicy();
      int v55 = 0;
      *(_OWORD *)buf = v88;
      long long v91 = v89;
    }
    else
    {
      int v55 = 0;
    }
    id v56 = objc_alloc(MEMORY[0x263F237C8]);
    id v57 = objc_loadWeakRetained((id *)&self->_profile);
    v58 = self->_dataStore;
    earnedInstanceStore = self->_earnedInstanceStore;
    long long v88 = *(_OWORD *)buf;
    long long v89 = v91;
    v60 = (ACHEarnedInstanceAwardingEngine *)[v56 initWithProfile:v57 dataStore:v58 earnedInstanceStore:earnedInstanceStore historicalEvaluationPolicy:&v88];
    awardingEngine = self->_awardingEngine;
    self->_awardingEngine = v60;

    id v62 = objc_alloc(MEMORY[0x263F23740]);
    id v63 = objc_loadWeakRetained((id *)&self->_profile);
    v64 = (ACHActivityAwardingSource *)[v62 initWithProfile:v63 dataStore:self->_dataStore templateStore:self->_templateStore awardingEngine:self->_awardingEngine progressEngine:self->_progressProvider];
    activityAwardingSource = self->_activityAwardingSource;
    self->_activityAwardingSource = v64;

    [(ACHAchievementsProfileExtension *)self _registerAwardingSource:self->_activityAwardingSource];
    id v66 = objc_alloc(MEMORY[0x263F23890]);
    id v67 = objc_loadWeakRetained((id *)&self->_profile);
    v68 = (ACHWorkoutAwardingSource *)[v66 initWithProfile:v67 awardingEngine:self->_awardingEngine dataStore:self->_dataStore templateStore:self->_templateStore creatorDevice:v3 progressEngine:self->_progressProvider workoutUtility:self->_workoutUtility];
    workoutAwardingSource = self->_workoutAwardingSource;
    self->_workoutAwardingSource = v68;

    [(ACHAchievementsProfileExtension *)self _registerAwardingSource:self->_workoutAwardingSource];
    id v70 = objc_alloc(MEMORY[0x263F23808]);
    id v71 = objc_loadWeakRetained((id *)&self->_profile);
    v72 = (ACHMonthlyChallengeAwardingSource *)[v70 initWithProfile:v71 awardingEngine:self->_awardingEngine templateStore:self->_templateStore earnedInstanceStore:self->_earnedInstanceStore monthlyDataSource:v26 creatorDevice:v3 progressEngine:self->_progressProvider];
    monthlyChallengeAwardingSource = self->_monthlyChallengeAwardingSource;
    self->_monthlyChallengeAwardingSource = v72;

    [(ACHAchievementsProfileExtension *)self _registerAwardingSource:self->_monthlyChallengeAwardingSource];
    if (v55)
    {
      id v74 = objc_alloc(MEMORY[0x263F23888]);
      id v75 = objc_loadWeakRetained((id *)&self->_profile);
      v76 = (ACHAwardingScheduler *)[v74 initWithProfile:v75 dataStore:self->_dataStore earnedInstanceStore:self->_earnedInstanceStore templateStore:self->_templateStore awardingEngine:self->_awardingEngine];
      awardingScheduler = self->_awardingScheduler;
      self->_awardingScheduler = v76;

      [(ACHAchievementsProfileExtension *)self isWatch];
    }
    else
    {
      if ([(ACHAchievementsProfileExtension *)self isWatch])
      {
        id v78 = objc_alloc(MEMORY[0x263F237F0]);
        id v79 = objc_loadWeakRetained((id *)&self->_profile);
        v80 = (ACHAwardingScheduler *)[v78 initWithProfile:v79 dataStore:self->_dataStore awardingEngine:self->_awardingEngine];
      }
      else
      {
        id v81 = objc_alloc(MEMORY[0x263F23798]);
        id v79 = objc_loadWeakRetained((id *)&self->_profile);
        v80 = (ACHAwardingScheduler *)[v81 initWithProfile:v79 dataStore:self->_dataStore earnedInstanceStore:self->_earnedInstanceStore templateStore:self->_templateStore awardingEngine:self->_awardingEngine];
      }
      v82 = self->_awardingScheduler;
      self->_awardingScheduler = v80;

      if ([(ACHAchievementsProfileExtension *)self isWatch]) {
        goto LABEL_25;
      }
    }
    id v83 = objc_alloc(MEMORY[0x263F23728]);
    id v84 = objc_loadWeakRetained((id *)&self->_profile);
    v85 = (ACHAWDSubmissionManager *)[v83 initWithProfile:v84 earnedInstanceStore:self->_earnedInstanceStore];
    submissionManager = self->_submissionManager;
    self->_submissionManager = v85;

LABEL_25:
    [(ACHAchievementsProfileExtension *)self endPhaseRegistration];
    os_unfair_lock_unlock(p_accessLock);

    return;
  }
  BOOL v7 = ACHLogDefault();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_241DC5000, v7, OS_LOG_TYPE_DEFAULT, "Kraken already fully unleahsed, skipping", buf, 2u);
  }

  os_unfair_lock_unlock(p_accessLock);
}

- (void)_restrainTheKraken
{
  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  if ([(ACHAchievementsProfileExtension *)self krakenUnleashed])
  {
    uint64_t v4 = ACHLogDefault();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v29 = 0;
      _os_log_impl(&dword_241DC5000, v4, OS_LOG_TYPE_DEFAULT, "Plugin restrain the Kraken!", v29, 2u);
    }

    templateEntityWrapper = self->_templateEntityWrapper;
    self->_templateEntityWrapper = 0;

    templateStore = self->_templateStore;
    self->_templateStore = 0;

    earnedInstanceEntityWrapper = self->_earnedInstanceEntityWrapper;
    self->_earnedInstanceEntityWrapper = 0;

    earnedInstanceStore = self->_earnedInstanceStore;
    self->_earnedInstanceStore = 0;

    templateAssetRegistry = self->_templateAssetRegistry;
    self->_templateAssetRegistry = 0;

    progressProvider = self->_progressProvider;
    self->_progressProvider = 0;

    achievementStore = self->_achievementStore;
    self->_achievementStore = 0;

    self->_BOOL storesHaveBeenSet = 0;
    mobileAssetProvider = self->_mobileAssetProvider;
    self->_mobileAssetProvider = 0;

    templateSourceScheduler = self->_templateSourceScheduler;
    self->_templateSourceScheduler = 0;

    builtInTemplateSource = self->_builtInTemplateSource;
    self->_builtInTemplateSource = 0;

    perfectMonthTemplateSource = self->_perfectMonthTemplateSource;
    self->_perfectMonthTemplateSource = 0;

    activitySummaryUtility = self->_activitySummaryUtility;
    self->_activitySummaryUtility = 0;

    workoutUtility = self->_workoutUtility;
    self->_workoutUtility = 0;

    monthlyChallengeTemplateSource = self->_monthlyChallengeTemplateSource;
    self->_monthlyChallengeTemplateSource = 0;

    [(ACHAchievementsProfileExtension *)self _deregisterTemplateSource:self->_remoteTemplateSource];
    remoteTemplateSource = self->_remoteTemplateSource;
    self->_remoteTemplateSource = 0;

    backCompatMonthlyChallengeListener = self->_backCompatMonthlyChallengeListener;
    self->_backCompatMonthlyChallengeListener = 0;

    dataStore = self->_dataStore;
    self->_dataStore = 0;

    awardingEngine = self->_awardingEngine;
    self->_awardingEngine = 0;

    activityAwardingSource = self->_activityAwardingSource;
    self->_activityAwardingSource = 0;

    workoutAwardingSource = self->_workoutAwardingSource;
    self->_workoutAwardingSource = 0;

    [(ACHAchievementsProfileExtension *)self _deregisterAwardingSource:self->_monthlyChallengeAwardingSource];
    monthlyChallengeAwardingSource = self->_monthlyChallengeAwardingSource;
    self->_monthlyChallengeAwardingSource = 0;

    awardingScheduler = self->_awardingScheduler;
    self->_awardingScheduler = 0;

    submissionManager = self->_submissionManager;
    self->_submissionManager = 0;

    listener = self->_listener;
    self->_listener = 0;

    self->_krakenUnleashed = 0;
    os_unfair_lock_unlock(p_accessLock);
  }
  else
  {
    os_unfair_lock_unlock(p_accessLock);
  }
}

- (void)tryInitialAchievementLoadWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_get_global_queue(9, 0);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_241DC85CC;
  v7[3] = &unk_2650F8488;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)endPhaseRegistration
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F434E0]);
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = (HDXPCListener *)[v3 initWithLabel:v5];
  listener = self->_listener;
  self->_listener = v6;

  [(HDXPCListener *)self->_listener setDelegate:self];
  [(HDXPCListener *)self->_listener resume];
  id v8 = ACHLogDefault();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [(ACHAchievementsProfileExtension *)self templatesSourcesToRegister];
    *(_DWORD *)buf = 134217984;
    uint64_t v50 = [v9 count];
    _os_log_impl(&dword_241DC5000, v8, OS_LOG_TYPE_DEFAULT, "Registering %lu pending template sources", buf, 0xCu);
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v10 = [(ACHAchievementsProfileExtension *)self templatesSourcesToRegister];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v43;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v43 != v13) {
          objc_enumerationMutation(v10);
        }
        [(ACHAchievementsProfileExtension *)self _registerTemplateSource:*(void *)(*((void *)&v42 + 1) + 8 * v14++)];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v42 objects:v48 count:16];
    }
    while (v12);
  }

  [(ACHAchievementsProfileExtension *)self setTemplatesSourcesToRegister:0];
  uint64_t v15 = ACHLogDefault();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = [(ACHAchievementsProfileExtension *)self awardingSourcesToRegister];
    uint64_t v17 = [v16 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v50 = v17;
    _os_log_impl(&dword_241DC5000, v15, OS_LOG_TYPE_DEFAULT, "Registering %lu pending awarding sources", buf, 0xCu);
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v18 = [(ACHAchievementsProfileExtension *)self awardingSourcesToRegister];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v38 objects:v47 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v39;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v39 != v21) {
          objc_enumerationMutation(v18);
        }
        [(ACHAchievementsProfileExtension *)self _registerAwardingSource:*(void *)(*((void *)&v38 + 1) + 8 * v22++)];
      }
      while (v20 != v22);
      uint64_t v20 = [v18 countByEnumeratingWithState:&v38 objects:v47 count:16];
    }
    while (v20);
  }

  [(ACHAchievementsProfileExtension *)self setAwardingSourcesToRegister:0];
  [(ACHAchievementsProfileExtension *)self setKrakenUnleashed:1];
  uint64_t v23 = ACHLogDefault();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_241DC5000, v23, OS_LOG_TYPE_DEFAULT, "Kraken was unleashed!", buf, 2u);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v24 = self->_blocksWaitingOnInitialization;
  uint64_t v25 = [(NSSet *)v24 countByEnumeratingWithState:&v34 objects:v46 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v35;
    do
    {
      uint64_t v28 = 0;
      do
      {
        if (*(void *)v35 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = *(void *)(*((void *)&v34 + 1) + 8 * v28);
        clientQueue = self->_clientQueue;
        v33[0] = MEMORY[0x263EF8330];
        v33[1] = 3221225472;
        v33[2] = sub_241DC8A7C;
        v33[3] = &unk_2650F84B0;
        v33[4] = self;
        v33[5] = v29;
        dispatch_async(clientQueue, v33);
        ++v28;
      }
      while (v26 != v28);
      uint64_t v26 = [(NSSet *)v24 countByEnumeratingWithState:&v34 objects:v46 count:16];
    }
    while (v26);
  }

  id v31 = [MEMORY[0x263EFFA08] set];
  blocksWaitingOnInitialization = self->_blocksWaitingOnInitialization;
  self->_blocksWaitingOnInitialization = v31;
}

- (id)listenerEndpointForClient:(id)a3 error:(id *)a4
{
  id v4 = [(ACHAchievementsProfileExtension *)self listener];
  id v5 = [v4 endpoint];

  return v5;
}

- (id)exportObjectForListener:(id)a3 client:(id)a4 error:(id *)a5
{
  BOOL v7 = (void *)MEMORY[0x263F23850];
  id v8 = a4;
  uint64_t v9 = [(ACHAchievementsProfileExtension *)self templateStore];
  uint64_t v10 = [(ACHAchievementsProfileExtension *)self earnedInstanceStore];
  uint64_t v11 = [(ACHAchievementsProfileExtension *)self awardingScheduler];
  uint64_t v12 = [(ACHAchievementsProfileExtension *)self achievementStore];
  uint64_t v13 = [(ACHAchievementsProfileExtension *)self mobileAssetProvider];
  uint64_t v14 = [(ACHAchievementsProfileExtension *)self templateSourceScheduler];
  uint64_t v15 = [(ACHAchievementsProfileExtension *)self monthlyChallengeTemplateSource];
  id v16 = [v7 serverWithClient:v8 templateStore:v9 earnedInstanceStore:v10 awardingScheduler:v11 achievementStore:v12 mobileAssetProvider:v13 templateSourceScheduler:v14 monthlyChallengeTemplateSource:v15 error:a5];

  return v16;
}

- (void)registerTemplateSource:(id)a3 awardingSource:(id)a4
{
  p_accessLock = &self->_accessLock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_accessLock);
  if ([(ACHAchievementsProfileExtension *)self krakenUnleashed])
  {
    uint64_t v9 = ACHLogDefault();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_241DC5000, v9, OS_LOG_TYPE_DEFAULT, "Client registered and the Kraken is unleashed, do it now!", buf, 2u);
    }

    [(ACHAchievementsProfileExtension *)self _registerTemplateSource:v8];
    [(ACHAchievementsProfileExtension *)self _registerAwardingSource:v7];
  }
  else
  {
    uint64_t v10 = [(ACHAchievementsProfileExtension *)self templatesSourcesToRegister];

    if (!v10)
    {
      uint64_t v11 = [MEMORY[0x263EFF9C0] set];
      [(ACHAchievementsProfileExtension *)self setTemplatesSourcesToRegister:v11];
    }
    uint64_t v12 = [(ACHAchievementsProfileExtension *)self awardingSourcesToRegister];

    if (!v12)
    {
      uint64_t v13 = [MEMORY[0x263EFF9C0] set];
      [(ACHAchievementsProfileExtension *)self setAwardingSourcesToRegister:v13];
    }
    uint64_t v14 = ACHLogDefault();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_241DC5000, v14, OS_LOG_TYPE_DEFAULT, "Client tried to register, but the Kraken isn't unleashed. Saving to register.", v17, 2u);
    }

    uint64_t v15 = [(ACHAchievementsProfileExtension *)self templatesSourcesToRegister];
    [v15 addObject:v8];

    id v16 = [(ACHAchievementsProfileExtension *)self awardingSourcesToRegister];
    [v16 addObject:v7];

    id v7 = v16;
  }

  os_unfair_lock_unlock(p_accessLock);
}

- (void)deregisterTemplateSource:(id)a3 awardingSource:(id)a4
{
  id v10 = a3;
  p_accessLock = &self->_accessLock;
  id v7 = a4;
  os_unfair_lock_lock(&self->_accessLock);
  if ([(ACHAchievementsProfileExtension *)self krakenUnleashed])
  {
    [(ACHAchievementsProfileExtension *)self _deregisterTemplateSource:v10];
    [(ACHAchievementsProfileExtension *)self _deregisterAwardingSource:v7];
  }
  else
  {
    id v8 = [(ACHAchievementsProfileExtension *)self templatesSourcesToRegister];
    [v8 removeObject:v10];

    uint64_t v9 = [(ACHAchievementsProfileExtension *)self awardingSourcesToRegister];
    [v9 removeObject:v7];

    id v7 = v9;
  }

  os_unfair_lock_unlock(p_accessLock);
}

- (void)requestImmediateUpdateForTemplateSource:(id)a3
{
  p_accessLock = &self->_accessLock;
  id v5 = a3;
  os_unfair_lock_lock(p_accessLock);
  id v6 = [(ACHAchievementsProfileExtension *)self templateSourceScheduler];
  [v6 runImmediatelyForTemplateSource:v5];

  os_unfair_lock_unlock(p_accessLock);
}

- (void)requestIncrementalEvaluationForAwardingSource:(id)a3 evaluationBlock:(id)a4
{
  p_accessLock = &self->_accessLock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_accessLock);
  uint64_t v9 = [(ACHAchievementsProfileExtension *)self awardingEngine];
  [v9 requestIncrementalEvaluationForSource:v8 evaluationBlock:v7];

  os_unfair_lock_unlock(p_accessLock);
}

- (void)performBlockAfterInitialization:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_accessLock);
  BOOL v5 = [(ACHAchievementsProfileExtension *)self krakenUnleashed];
  id v6 = ACHLogDefault();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_241DC5000, v6, OS_LOG_TYPE_DEFAULT, "ProfileExtending Initialization: Kraken unleashed, performing block", buf, 2u);
    }

    clientQueue = self->_clientQueue;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = sub_241DC9114;
    v13[3] = &unk_2650F84B0;
    v13[4] = self;
    id v14 = v4;
    dispatch_async(clientQueue, v13);
    uint64_t v9 = v14;
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_241DC5000, v6, OS_LOG_TYPE_DEFAULT, "ProfileExtending Initialization: Kraken not unleashed, adding block", buf, 2u);
    }

    blocksWaitingOnInitialization = self->_blocksWaitingOnInitialization;
    uint64_t v9 = (void *)MEMORY[0x24563A940](v4);
    uint64_t v11 = [(NSSet *)blocksWaitingOnInitialization setByAddingObject:v9];
    uint64_t v12 = self->_blocksWaitingOnInitialization;
    self->_blocksWaitingOnInitialization = v11;
  }
  os_unfair_lock_unlock(&self->_accessLock);
}

- (void)_registerTemplateSource:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ACHAchievementsProfileExtension *)self templateSourceScheduler];
  [v5 registerTemplateSource:v4];

  id v6 = [(ACHAchievementsProfileExtension *)self templateAssetRegistry];
  [v6 registerTemplateSource:v4];
}

- (void)_deregisterTemplateSource:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ACHAchievementsProfileExtension *)self templateSourceScheduler];
  [v5 deregisterTemplateSource:v4];

  id v6 = [(ACHAchievementsProfileExtension *)self templateAssetRegistry];
  [v6 deregisterTemplateSource:v4];
}

- (void)_registerAwardingSource:(id)a3
{
  id v6 = a3;
  id v4 = [(ACHAchievementsProfileExtension *)self awardingEngine];
  [v4 registerSource:v6];

  if ([v6 conformsToProtocol:&unk_26F5DB110])
  {
    BOOL v5 = [(ACHAchievementsProfileExtension *)self progressProvider];
    [v5 registerProgressProvider:v6];
  }
}

- (void)_deregisterAwardingSource:(id)a3
{
  id v6 = a3;
  id v4 = [(ACHAchievementsProfileExtension *)self awardingEngine];
  [v4 deregisterSource:v6];

  if ([v6 conformsToProtocol:&unk_26F5DB110])
  {
    BOOL v5 = [(ACHAchievementsProfileExtension *)self progressProvider];
    [v5 deregisterProgressProvider:v6];
  }
}

- (BOOL)performMigration
{
  _HKInitializeLogging();
  id v3 = *MEMORY[0x263F098C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_241DC5000, v3, OS_LOG_TYPE_DEFAULT, "AchievementsPlugin: Performing Fitness migration", v6, 2u);
  }
  BOOL v4 = [(ACHAchievementsProfileExtension *)self _updateActivityChallengeAssetsURL];
  if (v4) {
    [(ACHAchievementsProfileExtension *)self _saveFitnessMigrationBuildVersion];
  }
  return v4;
}

- (BOOL)_updateActivityChallengeAssetsURL
{
  if ([MEMORY[0x263F0A980] isAppleInternalInstall])
  {
    if ([MEMORY[0x263F0A980] isDeviceSupported])
    {
      if (ACHIsActivityAchievementsAssetServerURLExplicitlySet())
      {
        _HKInitializeLogging();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_DEBUG)) {
          sub_241DC9D68();
        }
      }
      else
      {
        id v3 = [NSURL URLWithString:@"https://mesu.apple.com/assets/"];
        BOOL v4 = dispatch_get_global_queue(21, 0);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = sub_241DC9568;
        block[3] = &unk_2650F84D8;
        id v8 = v3;
        id v5 = v3;
        dispatch_async(v4, block);
      }
    }
    else
    {
      _HKInitializeLogging();
      v2 = *MEMORY[0x263F098C8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_241DC5000, v2, OS_LOG_TYPE_DEFAULT, "Device is not supported for Health data, skipping Activity Challenge Assets URL setting", buf, 2u);
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_DEBUG)) {
      sub_241DC9D9C();
    }
  }
  return 1;
}

- (void)_saveFitnessMigrationBuildVersion
{
  id v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v3 = [(ACHAchievementsProfileExtension *)self _currentBuildVersion];
  [v4 setObject:v3 forKey:@"kACHAchievementsPluginLastMigrationBuild"];
}

- (BOOL)_shouldPerformFitnessMigration
{
  v2 = [(ACHAchievementsProfileExtension *)self _currentBuildVersion];
  id v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v4 = [v3 stringForKey:@"kACHAchievementsPluginLastMigrationBuild"];

  LOBYTE(v3) = [v4 isEqualToString:v2] ^ 1;
  return (char)v3;
}

- (id)_currentBuildVersion
{
  currentBuildVersion = self->_currentBuildVersion;
  if (!currentBuildVersion)
  {
    id v4 = [MEMORY[0x263F0A980] currentOSBuild];
    [(ACHAchievementsProfileExtension *)self setCurrentBuildVersion:v4];

    currentBuildVersion = self->_currentBuildVersion;
  }
  id v5 = currentBuildVersion;

  return v5;
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);

  return (HDProfile *)WeakRetained;
}

- (void)setProfile:(id)a3
{
}

- (HDXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (BOOL)initialMoveGoalFetchCompleted
{
  return self->_initialMoveGoalFetchCompleted;
}

- (void)setInitialMoveGoalFetchCompleted:(BOOL)a3
{
  self->_initialMoveGoalFetchCompleted = a3;
}

- (BOOL)initialMoveGoalHasBeenSet
{
  return self->_initialMoveGoalHasBeenSet;
}

- (void)setInitialMoveGoalHasBeenSet:(BOOL)a3
{
  self->_initialMoveGoalHasBeenSet = a3;
}

- (BOOL)storesHaveBeenSet
{
  return self->_storesHaveBeenSet;
}

- (void)setStoresHaveBeenSet:(BOOL)a3
{
  self->_BOOL storesHaveBeenSet = a3;
}

- (BOOL)isWatch
{
  return self->_isWatch;
}

- (void)setIsWatch:(BOOL)a3
{
  self->_isWatch = a3;
}

- (BOOL)krakenUnleashed
{
  return self->_krakenUnleashed;
}

- (void)setKrakenUnleashed:(BOOL)a3
{
  self->_krakenUnleashed = a3;
}

- (BOOL)fitnessAppIsInstalled
{
  return self->_fitnessAppIsInstalled;
}

- (void)setFitnessAppIsInstalled:(BOOL)a3
{
  self->_fitnessAppIsInstalled = a3;
}

- (BOOL)unitTesting
{
  return self->_unitTesting;
}

- (void)setUnitTesting:(BOOL)a3
{
  self->_unitTesting = a3;
}

- (NSMutableSet)templatesSourcesToRegister
{
  return self->_templatesSourcesToRegister;
}

- (void)setTemplatesSourcesToRegister:(id)a3
{
}

- (NSMutableSet)awardingSourcesToRegister
{
  return self->_awardingSourcesToRegister;
}

- (void)setAwardingSourcesToRegister:(id)a3
{
}

- (NSSet)blocksWaitingOnInitialization
{
  return self->_blocksWaitingOnInitialization;
}

- (void)setBlocksWaitingOnInitialization:(id)a3
{
}

- (ACHAchievementStoring)achievementStore
{
  return self->_achievementStore;
}

- (void)setAchievementStore:(id)a3
{
}

- (ACHTemplateAssetRegistry)templateAssetRegistry
{
  return self->_templateAssetRegistry;
}

- (void)setTemplateAssetRegistry:(id)a3
{
}

- (ACHAchievementProgressEngine)progressProvider
{
  return self->_progressProvider;
}

- (void)setProgressProvider:(id)a3
{
}

- (ACHEarnedInstanceStore)earnedInstanceStore
{
  return self->_earnedInstanceStore;
}

- (void)setEarnedInstanceStore:(id)a3
{
}

- (ACHEarnedInstanceEntityWrapper)earnedInstanceEntityWrapper
{
  return self->_earnedInstanceEntityWrapper;
}

- (void)setEarnedInstanceEntityWrapper:(id)a3
{
}

- (ACHEarnedInstanceAwardingEngine)awardingEngine
{
  return self->_awardingEngine;
}

- (void)setAwardingEngine:(id)a3
{
}

- (ACHTemplateStore)templateStore
{
  return self->_templateStore;
}

- (void)setTemplateStore:(id)a3
{
}

- (ACHTemplateEntityWrapper)templateEntityWrapper
{
  return self->_templateEntityWrapper;
}

- (void)setTemplateEntityWrapper:(id)a3
{
}

- (ACHAWDSubmissionManager)submissionManager
{
  return self->_submissionManager;
}

- (void)setSubmissionManager:(id)a3
{
}

- (ACHMobileAssetProvider)mobileAssetProvider
{
  return self->_mobileAssetProvider;
}

- (void)setMobileAssetProvider:(id)a3
{
}

- (ACHDataStore)dataStore
{
  return self->_dataStore;
}

- (void)setDataStore:(id)a3
{
}

- (ACHActivityAwardingSource)activityAwardingSource
{
  return self->_activityAwardingSource;
}

- (void)setActivityAwardingSource:(id)a3
{
}

- (ACHWorkoutUtility)workoutUtility
{
  return self->_workoutUtility;
}

- (void)setWorkoutUtility:(id)a3
{
}

- (ACHWorkoutAwardingSource)workoutAwardingSource
{
  return self->_workoutAwardingSource;
}

- (void)setWorkoutAwardingSource:(id)a3
{
}

- (ACHMonthlyChallengeAwardingSource)monthlyChallengeAwardingSource
{
  return self->_monthlyChallengeAwardingSource;
}

- (void)setMonthlyChallengeAwardingSource:(id)a3
{
}

- (ACHActivitySummaryUtility)activitySummaryUtility
{
  return self->_activitySummaryUtility;
}

- (void)setActivitySummaryUtility:(id)a3
{
}

- (ACHAwardingScheduler)awardingScheduler
{
  return self->_awardingScheduler;
}

- (void)setAwardingScheduler:(id)a3
{
}

- (ACHBuiltinTemplateSource)builtInTemplateSource
{
  return self->_builtInTemplateSource;
}

- (void)setBuiltInTemplateSource:(id)a3
{
}

- (ACHPerfectMonthTemplateSource)perfectMonthTemplateSource
{
  return self->_perfectMonthTemplateSource;
}

- (void)setPerfectMonthTemplateSource:(id)a3
{
}

- (ACHMonthlyChallengeTemplateSource)monthlyChallengeTemplateSource
{
  return self->_monthlyChallengeTemplateSource;
}

- (void)setMonthlyChallengeTemplateSource:(id)a3
{
}

- (ACHRemoteTemplateSource)remoteTemplateSource
{
  return self->_remoteTemplateSource;
}

- (void)setRemoteTemplateSource:(id)a3
{
}

- (ACHTemplateSourceScheduler)templateSourceScheduler
{
  return self->_templateSourceScheduler;
}

- (void)setTemplateSourceScheduler:(id)a3
{
}

- (ACHBackCompatMonthlyChallengeListener)backCompatMonthlyChallengeListener
{
  return self->_backCompatMonthlyChallengeListener;
}

- (void)setBackCompatMonthlyChallengeListener:(id)a3
{
}

- (ACHRemoteTemplateAvailabilityKeyProvider)remoteTemplateAvailabilityKeyProvider
{
  return self->_remoteTemplateAvailabilityKeyProvider;
}

- (void)setRemoteTemplateAvailabilityKeyProvider:(id)a3
{
}

- (ACHRemoteTemplateAvailabilityListener)remoteTemplateAvailabilityListener
{
  return self->_remoteTemplateAvailabilityListener;
}

- (void)setRemoteTemplateAvailabilityListener:(id)a3
{
}

- (NSString)currentBuildVersion
{
  return self->_currentBuildVersion;
}

- (void)setCurrentBuildVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentBuildVersion, 0);
  objc_storeStrong((id *)&self->_remoteTemplateAvailabilityListener, 0);
  objc_storeStrong((id *)&self->_remoteTemplateAvailabilityKeyProvider, 0);
  objc_storeStrong((id *)&self->_backCompatMonthlyChallengeListener, 0);
  objc_storeStrong((id *)&self->_templateSourceScheduler, 0);
  objc_storeStrong((id *)&self->_remoteTemplateSource, 0);
  objc_storeStrong((id *)&self->_monthlyChallengeTemplateSource, 0);
  objc_storeStrong((id *)&self->_perfectMonthTemplateSource, 0);
  objc_storeStrong((id *)&self->_builtInTemplateSource, 0);
  objc_storeStrong((id *)&self->_awardingScheduler, 0);
  objc_storeStrong((id *)&self->_activitySummaryUtility, 0);
  objc_storeStrong((id *)&self->_monthlyChallengeAwardingSource, 0);
  objc_storeStrong((id *)&self->_workoutAwardingSource, 0);
  objc_storeStrong((id *)&self->_workoutUtility, 0);
  objc_storeStrong((id *)&self->_activityAwardingSource, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_mobileAssetProvider, 0);
  objc_storeStrong((id *)&self->_submissionManager, 0);
  objc_storeStrong((id *)&self->_templateEntityWrapper, 0);
  objc_storeStrong((id *)&self->_templateStore, 0);
  objc_storeStrong((id *)&self->_awardingEngine, 0);
  objc_storeStrong((id *)&self->_earnedInstanceEntityWrapper, 0);
  objc_storeStrong((id *)&self->_earnedInstanceStore, 0);
  objc_storeStrong((id *)&self->_progressProvider, 0);
  objc_storeStrong((id *)&self->_templateAssetRegistry, 0);
  objc_storeStrong((id *)&self->_achievementStore, 0);
  objc_storeStrong((id *)&self->_blocksWaitingOnInitialization, 0);
  objc_storeStrong((id *)&self->_awardingSourcesToRegister, 0);
  objc_storeStrong((id *)&self->_templatesSourcesToRegister, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_destroyWeak((id *)&self->_profile);

  objc_storeStrong((id *)&self->_clientQueue, 0);
}

@end
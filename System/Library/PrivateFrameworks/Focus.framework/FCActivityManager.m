@interface FCActivityManager
+ (NSURL)activitiesSettingsURL;
+ (id)newActivityManager;
+ (id)newActivityManagerWithIdentifier:(id)a3;
+ (id)sharedActivityManager;
+ (void)initialize;
- (BOOL)_doesActivity:(id)a3 identifySameModeAsActivity:(id)a4;
- (BOOL)_isSyncedAssertion:(id)a3;
- (BOOL)isActivityLocalUserInitiated:(id)a3;
- (BOOL)isDefaultConfiguration;
- (BOOL)isLifetimeDescriptionsUpdatingEnabled;
- (BOOL)shouldActivityShowStatusPill:(id)a3;
- (FCActivityDescribing)activeActivity;
- (FCActivityDescribing)defaultActivity;
- (NSArray)availableActivities;
- (NSString)description;
- (NSString)identifier;
- (NSString)localizedTerminationDescriptionForActiveActivity;
- (id)_activeActivity;
- (id)_activityForATXActivityOrSuggestion:(id)a3;
- (id)_activityForModeIdentifier:(id)a3;
- (id)_activityForUniqueIdentifier:(id)a3;
- (id)_activitySuggestionClient;
- (id)_availableActivities;
- (id)_carDNDStatus;
- (id)_initWithIdentifier:(id)a3;
- (id)_lifetimeDetailsProvider;
- (id)_lifetimeForActiveActivity;
- (id)_lifetimeForLifetimeDetailsIdentifier:(id)a3 ofActivity:(id)a4;
- (id)_localizedAutomaticDrivingTriggerDescriptionForPreference:(unint64_t)a3;
- (id)_modeSelectionService;
- (id)_stateService;
- (id)activityWithIdentifier:(id)a3;
- (id)lifetimeOfActivity:(id)a3;
- (id)promotedPlaceholderActivity:(id)a3;
- (id)suggestedActivityForLocation:(int64_t)a3;
- (unint64_t)maximumActivityCountForUserInterface;
- (void)_availableActivities;
- (void)_deactivateActivity:(id)a3 reason:(id)a4;
- (void)_drivingTriggerDidChange;
- (void)_enumerateObserversRespondingToSelector:(SEL)a3 usingBlock:(id)a4;
- (void)_invalidateActiveModeAssertion;
- (void)_notifyObserversOfAvailableActivitiesChange;
- (void)_notifyObserversOfLifetimeChangeForActivity:(id)a3;
- (void)_setActiveActivity:(id)a3 withLifetime:(id)a4 reason:(id)a5;
- (void)_setAvailableActivities:(id)a3;
- (void)_setDefaultActivity:(id)a3;
- (void)_setLifetimeForActiveActivity:(id)a3;
- (void)_updateActiveActivity:(id)a3;
- (void)_updateActiveModeAssertionIfNecessary;
- (void)_updateActivitiesWithModes:(id)a3;
- (void)_updateActivity:(id)a3 withLifetimeDescriptions:(id)a4;
- (void)_updateActivity:(id)a3 withLifetimeDetails:(id)a4;
- (void)_updateActivity:(id)a3 withLifetimeDetailsCollection:(id)a4;
- (void)_updateActivitySuggestion:(id)a3;
- (void)_updateCreationDateOfActivity:(id)a3;
- (void)_updateLifetimeForActiveActivity;
- (void)_updateLifetimeForActiveActivityIfNecessary;
- (void)_updateLifetimesAlternativeDescription:(id)a3 forActivity:(id)a4;
- (void)_updateLifetimesAlternativeDescriptionForActivity:(id)a3;
- (void)_updateLifetimesAlternativeDescriptionsForAvailableActivities;
- (void)_updateSuggestedActivity:(id)a3 forLocation:(int64_t)a4;
- (void)_updateSuggestedActivity:(id)a3 forLocations:(unint64_t)a4;
- (void)_updateWithActiveModeAssertionIfNecessary:(id)a3 stateUpdate:(id)a4;
- (void)activitySuggestionClient:(id)a3 didSuggestConfiguredActivity:(id)a4;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)didShowSuggestedActivity:(id)a3 location:(int64_t)a4;
- (void)lifetimeDetailsProvider:(id)a3 didUpdateAvailableLifetimeDetails:(id)a4;
- (void)modeSelectionService:(id)a3 didReceiveModesUpdate:(id)a4;
- (void)modeSelectionService:(id)a3 didReceiveUpdatedActiveModeAssertion:(id)a4 stateUpdate:(id)a5;
- (void)promotePlaceholderActivity:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setActiveActivity:(id)a3;
- (void)setActiveActivity:(id)a3 reason:(id)a4;
- (void)setActiveActivity:(id)a3 withLifetime:(id)a4 reason:(id)a5;
- (void)setActivity:(id)a3 active:(BOOL)a4 reason:(id)a5;
- (void)setActivity:(id)a3 active:(BOOL)a4 withLifetime:(id)a5 reason:(id)a6;
- (void)setLifetimeDescriptionsUpdatingEnabled:(BOOL)a3;
- (void)userDidAcceptSuggestedActivity:(id)a3 location:(int64_t)a4;
- (void)userDidRejectSuggestedActivity:(id)a3 location:(int64_t)a4;
- (void)userDidSeeSuggestedActivity:(id)a3 location:(int64_t)a4;
@end

@implementation FCActivityManager

+ (id)sharedActivityManager
{
  if (sharedActivityManager_onceToken != -1) {
    dispatch_once(&sharedActivityManager_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)sharedActivityManager___sharedActivityManager;

  return v2;
}

- (NSArray)availableActivities
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = objc_alloc(MEMORY[0x263EFF8C0]);
  v4 = [(FCActivityManager *)v2 _availableActivities];
  v5 = (void *)[v3 initWithArray:v4 copyItems:1];

  objc_sync_exit(v2);
  if (v5) {
    id v6 = v5;
  }
  else {
    id v6 = objc_alloc_init(MEMORY[0x263EFF8C0]);
  }
  v7 = v6;

  return (NSArray *)v7;
}

- (id)_availableActivities
{
  v9[4] = *(id *)MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_availableActivities)
  {
    id v3 = [(FCActivityManager *)v2 _modeSelectionService];
    v9[0] = 0;
    v4 = [v3 allModesWithError:v9];
    id v5 = v9[0];
    if (v5)
    {
      id v6 = (id)FCLogActivities;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        [(FCActivityManager *)v2 description];
        objc_claimAutoreleasedReturnValue();
        -[FCActivityManager _availableActivities]();
      }
    }
    else
    {
      id v6 = [v4 allObjects];
      [(FCActivityManager *)v2 _updateActivitiesWithModes:v6];
    }
  }
  objc_sync_exit(v2);

  availableActivities = v2->_availableActivities;

  return availableActivities;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FCRegisterLogging();
  }
}

- (id)_initWithIdentifier:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FCActivityManager;
  id v5 = [(FCActivityManager *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [MEMORY[0x263F088B0] hashTableWithOptions:517];
    observers = v5->_observers;
    v5->_observers = (NSHashTable *)v8;

    v10 = [(FCActivityManager *)v5 _modeSelectionService];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __41__FCActivityManager__initWithIdentifier___block_invoke;
    v12[3] = &unk_264504080;
    v13 = v5;
    [v10 addListener:v13 withCompletionHandler:v12];
  }
  return v5;
}

void __41__FCActivityManager__initWithIdentifier___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = (void *)FCLogActivities;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)FCLogActivities, OS_LOG_TYPE_DEBUG)) {
      __41__FCActivityManager__initWithIdentifier___block_invoke_cold_1(a1, v6);
    }
  }
  else if (os_log_type_enabled((os_log_t)FCLogActivities, OS_LOG_TYPE_ERROR))
  {
    __41__FCActivityManager__initWithIdentifier___block_invoke_cold_2(a1, v6);
  }
}

- (void)dealloc
{
  [(FCActivityManager *)self setLifetimeDescriptionsUpdatingEnabled:0];
  v3.receiver = self;
  v3.super_class = (Class)FCActivityManager;
  [(FCActivityManager *)&v3 dealloc];
}

- (NSString)description
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; _identifier: %@>",
                       objc_opt_class(),
                       self,
                       self->_identifier);
}

void __42__FCActivityManager_sharedActivityManager__block_invoke()
{
  v0 = [FCActivityManager alloc];
  id v4 = [MEMORY[0x263F086E0] mainBundle];
  v1 = [v4 bundleIdentifier];
  uint64_t v2 = [(FCActivityManager *)v0 _initWithIdentifier:v1];
  objc_super v3 = (void *)sharedActivityManager___sharedActivityManager;
  sharedActivityManager___sharedActivityManager = v2;
}

+ (NSURL)activitiesSettingsURL
{
  return (NSURL *)objc_msgSend(NSURL, "dnd_defaultSettingsURL");
}

- (unint64_t)maximumActivityCountForUserInterface
{
  return [MEMORY[0x263F3A6E0] maxUIAddableModes];
}

- (FCActivityDescribing)activeActivity
{
  uint64_t v2 = [(FCActivityManager *)self _activeActivity];
  objc_super v3 = (void *)[v2 copyWithZone:0];

  return (FCActivityDescribing *)v3;
}

- (FCActivityDescribing)defaultActivity
{
  defaultActivity = self->_defaultActivity;
  if (!defaultActivity)
  {
    id v4 = [(FCActivityManager *)self _activityForModeIdentifier:*MEMORY[0x263F3A670]];
    id v5 = self->_defaultActivity;
    self->_defaultActivity = v4;

    defaultActivity = self->_defaultActivity;
  }
  uint64_t v6 = (void *)[(FCActivityDescribing *)defaultActivity copyWithZone:0];

  return (FCActivityDescribing *)v6;
}

- (BOOL)isDefaultConfiguration
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  objc_super v3 = [(FCActivityManager *)v2 _availableActivities];
  uint64_t v4 = [v3 indexOfObjectPassingTest:&__block_literal_global_34];

  objc_sync_exit(v2);
  return v4 == 0x7FFFFFFFFFFFFFFFLL;
}

BOOL __43__FCActivityManager_isDefaultConfiguration__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v5 = a2;
  if (([v5 isPlaceholder] & 1) != 0
    || ([v5 activityIdentifier],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = BSEqualStrings(),
        v6,
        (v7 & 1) != 0))
  {
    BOOL v8 = 0;
  }
  else
  {
    if (objc_opt_respondsToSelector())
    {
      v9 = [v5 _dndMode];
      unint64_t v10 = [v9 semanticType] - 3;

      BOOL v8 = v10 < 0xFFFFFFFFFFFFFFFELL;
    }
    else
    {
      BOOL v8 = 1;
    }
    *a4 = v8;
  }

  return v8;
}

- (NSString)localizedTerminationDescriptionForActiveActivity
{
  if (self->_activeModeAssertion)
  {
    activeStateUpdate = self->_activeStateUpdate;
    if (activeStateUpdate)
    {
      uint64_t v4 = [(DNDStateUpdate *)activeStateUpdate state];
    }
    else
    {
      uint64_t v6 = [(FCActivityManager *)self _stateService];
      uint64_t v4 = [v6 queryCurrentStateWithError:0];
    }
    char v7 = [v4 userVisibleTransitionDate];
    if ([v4 userVisibleTransitionLifetimeType] == 3)
    {
      BOOL v8 = 0;
      v9 = @"FOCUS_STATUS_DND_ON_UNTIL_LOCATION";
    }
    else if (v7 {
           && ([MEMORY[0x263EFF910] distantFuture],
    }
               unint64_t v10 = objc_claimAutoreleasedReturnValue(),
               char v11 = [v7 isEqualToDate:v10],
               v10,
               (v11 & 1) == 0))
    {
      v12 = [MEMORY[0x263EFF8F0] currentCalendar];
      int v13 = [v12 isDateInToday:v7];

      if (v13)
      {
        objc_super v14 = [MEMORY[0x263F29C30] sharedInstance];
        BOOL v8 = [v14 formatDateAsTimeStyle:v7];
        v9 = @"FOCUS_STATUS_DND_ON_UNTIL_TODAY_TIME";
      }
      else
      {
        v15 = [MEMORY[0x263EFF8F0] currentCalendar];
        int v16 = [v15 isDateInTomorrow:v7];

        v17 = [MEMORY[0x263F29C30] sharedInstance];
        objc_super v14 = v17;
        if (v16)
        {
          BOOL v8 = [v17 formatDateAsTimeStyle:v7];
          v9 = @"FOCUS_STATUS_DND_ON_UNTIL_TOMORROW_TIME";
        }
        else
        {
          BOOL v8 = [v17 formatDateAsAbbreviatedDayMonthWithTimeStyle:v7];
          v9 = @"FOCUS_STATUS_DND_ON_UNTIL_DATE_TIME";
        }
      }
    }
    else
    {
      BOOL v8 = 0;
      v9 = @"FOCUS_STATUS_DND_ON";
    }
    v18 = NSString;
    v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v20 = [v19 localizedStringForKey:v9 value:&stru_26D0B5698 table:@"Focus"];
    id v5 = objc_msgSend(v18, "stringWithFormat:", v20, v8);
  }
  else
  {
    id v5 = 0;
  }

  return (NSString *)v5;
}

- (void)setLifetimeDescriptionsUpdatingEnabled:(BOOL)a3
{
  if (self->_lifetimeDescriptionsUpdatingEnabled != a3)
  {
    self->_lifetimeDescriptionsUpdatingEnabled = a3;
    id v6 = [(FCActivityManager *)self _lifetimeDetailsProvider];
    if (self->_lifetimeDescriptionsUpdatingEnabled)
    {
      [v6 startUpdatingLifetimeDetails];
      [v6 startUpdatingLifetimeDetailMetadata];
      [(FCActivityManager *)self _updateLifetimesAlternativeDescriptionsForAvailableActivities];
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)FCDrivingTriggerObserverCallback, (CFStringRef)*MEMORY[0x263F30D78], 0, CFNotificationSuspensionBehaviorCoalesce);
    }
    else
    {
      [v6 stopUpdatingLifetimeDetails];
      [v6 stopUpdatingLifetimeDetailMetadata];
      [v6 resetLifetimeDetails];
      id v5 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterRemoveObserver(v5, self, (CFNotificationName)*MEMORY[0x263F30D78], 0);
    }
  }
}

- (id)lifetimeOfActivity:(id)a3
{
  uint64_t v4 = [a3 activityUniqueIdentifier];
  id v5 = [(FCActivityManager *)self _activityForUniqueIdentifier:v4];

  if (v5
    && ([(FCActivityManager *)self _activeActivity],
        id v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = BSEqualObjects(),
        v6,
        v7))
  {
    BOOL v8 = [(FCActivityManager *)self _lifetimeForActiveActivity];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)setActivity:(id)a3 active:(BOOL)a4 reason:(id)a5
{
}

- (void)setActivity:(id)a3 active:(BOOL)a4 withLifetime:(id)a5 reason:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (v10 || !v8)
  {
    objc_super v14 = [v10 activityUniqueIdentifier];
    v15 = [(FCActivityManager *)self _activityForUniqueIdentifier:v14];

    if (!v15 || v8)
    {
      int v16 = [v11 lifetimeIdentifier];
      v17 = [(FCActivityManager *)self _lifetimeForLifetimeDetailsIdentifier:v16 ofActivity:v15];

      [(FCActivityManager *)self _setActiveActivity:v15 withLifetime:v17 reason:v12];
    }
    else
    {
      [(FCActivityManager *)self _deactivateActivity:v15 reason:v12];
    }
  }
  else
  {
    int v13 = (void *)FCLogActivities;
    if (os_log_type_enabled((os_log_t)FCLogActivities, OS_LOG_TYPE_ERROR)) {
      -[FCActivityManager setActivity:active:withLifetime:reason:](v13, self);
    }
  }
}

- (BOOL)isActivityLocalUserInitiated:(id)a3
{
  id v4 = a3;
  id v5 = [v4 activityUniqueIdentifier];
  uint64_t v6 = [(FCActivityManager *)self _activityForUniqueIdentifier:v5];

  uint64_t v7 = [(FCActivityManager *)self _activeActivity];
  if (v6 | v7 && !BSEqualObjects())
  {
    BOOL v10 = 0;
    goto LABEL_11;
  }
  BOOL v8 = self;
  objc_sync_enter(v8);
  activeStateUpdate = v8->_activeStateUpdate;
  if (!activeStateUpdate)
  {
    if (v8->_activeModeAssertion && !-[FCActivityManager _isSyncedAssertion:](v8, "_isSyncedAssertion:"))
    {
      id v12 = [(DNDModeAssertion *)v8->_activeModeAssertion details];
      BOOL v10 = [v12 reason] == 1;

      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if ([(DNDStateUpdate *)activeStateUpdate source] != 1)
  {
LABEL_8:
    BOOL v10 = 0;
    goto LABEL_9;
  }
  BOOL v10 = [(DNDStateUpdate *)v8->_activeStateUpdate reason] == 1;
LABEL_9:
  objc_sync_exit(v8);

LABEL_11:
  return v10;
}

- (BOOL)shouldActivityShowStatusPill:(id)a3
{
  id v4 = a3;
  id v5 = [v4 activityUniqueIdentifier];
  uint64_t v6 = [(FCActivityManager *)self _activityForUniqueIdentifier:v5];

  uint64_t v7 = [(FCActivityManager *)self _activeActivity];
  if (v6 | v7 && !BSEqualObjects())
  {
    LOBYTE(v11) = 0;
    BOOL v10 = 0;
  }
  else
  {
    BOOL v8 = self;
    objc_sync_enter(v8);
    activeStateUpdate = v8->_activeStateUpdate;
    if (activeStateUpdate)
    {
      BOOL v10 = [(DNDStateUpdate *)activeStateUpdate source] == 1
         && [(DNDStateUpdate *)v8->_activeStateUpdate reason] == 1;
      unint64_t v11 = ((unint64_t)[(DNDStateUpdate *)v8->_activeStateUpdate options] >> 1) & 1;
    }
    else if (v8->_activeModeAssertion && !-[FCActivityManager _isSyncedAssertion:](v8, "_isSyncedAssertion:"))
    {
      unint64_t v11 = [(DNDModeAssertion *)v8->_activeModeAssertion details];
      BOOL v10 = [(id)v11 reason] == 1;

      LOBYTE(v11) = 0;
    }
    else
    {
      LOBYTE(v11) = 0;
      BOOL v10 = 0;
    }
    objc_sync_exit(v8);
  }
  return !v10 | v11;
}

- (id)promotedPlaceholderActivity:(id)a3
{
  modeSelectionService = self->_modeSelectionService;
  id v4 = [a3 activityIdentifier];
  uint64_t v9 = 0;
  id v5 = [(DNDModeSelectionService *)modeSelectionService promotedPlaceholderWithModeIdentifier:v4 error:&v9];
  uint64_t v6 = [v5 mode];

  if (v6) {
    uint64_t v7 = [[_FCActivity alloc] initWithMode:v6];
  }
  else {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)suggestedActivityForLocation:(int64_t)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  locationsToSuggestedActivitiesOrNull = v4->_locationsToSuggestedActivitiesOrNull;
  uint64_t v6 = [NSNumber numberWithInteger:a3];
  uint64_t v7 = [(NSMapTable *)locationsToSuggestedActivitiesOrNull objectForKey:v6];

  if (!v7)
  {
    BOOL v8 = [(FCActivityManager *)v4 _activitySuggestionClient];
    uint64_t v9 = [v8 currentSuggestion];

    [(FCActivityManager *)v4 _updateActivitySuggestion:v9];
    BOOL v10 = v4->_locationsToSuggestedActivitiesOrNull;
    unint64_t v11 = [NSNumber numberWithInteger:a3];
    uint64_t v7 = [(NSMapTable *)v10 objectForKey:v11];
  }
  id v12 = [MEMORY[0x263EFF9D0] null];
  if (BSEqualObjects()) {
    int v13 = 0;
  }
  else {
    int v13 = (void *)[v7 copyWithZone:0];
  }

  objc_sync_exit(v4);

  return v13;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    id v5 = self->_observers;
    objc_sync_enter(v5);
    [(NSHashTable *)self->_observers addObject:v6];
    objc_sync_exit(v5);

    id v4 = v6;
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    id v5 = self->_observers;
    objc_sync_enter(v5);
    [(NSHashTable *)self->_observers removeObject:v6];
    objc_sync_exit(v5);

    id v4 = v6;
  }
}

- (void)modeSelectionService:(id)a3 didReceiveUpdatedActiveModeAssertion:(id)a4 stateUpdate:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = (void *)FCLogActivities;
  if (os_log_type_enabled((os_log_t)FCLogActivities, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v11;
    int v13 = [(FCActivityManager *)self description];
    int v15 = 138543618;
    int v16 = v13;
    __int16 v17 = 2114;
    id v18 = v9;
    _os_log_impl(&dword_21F173000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Did receive updated active mode assertion: %{public}@", (uint8_t *)&v15, 0x16u);
  }
  objc_super v14 = self;
  objc_sync_enter(v14);
  if ((BSEqualObjects() & 1) == 0) {
    [(FCActivityManager *)v14 _invalidateActiveModeAssertion];
  }
  [(FCActivityManager *)v14 _updateWithActiveModeAssertionIfNecessary:v9 stateUpdate:v10];
  objc_sync_exit(v14);
}

- (void)modeSelectionService:(id)a3 didReceiveModesUpdate:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)FCLogActivities;
  if (os_log_type_enabled((os_log_t)FCLogActivities, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    id v10 = [(FCActivityManager *)self description];
    int v13 = 138543874;
    objc_super v14 = v10;
    __int16 v15 = 2050;
    uint64_t v16 = [v7 count];
    __int16 v17 = 2114;
    id v18 = v7;
    _os_log_impl(&dword_21F173000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Did receive all modes [%{public}lu] update: %{public}@", (uint8_t *)&v13, 0x20u);
  }
  unint64_t v11 = self;
  objc_sync_enter(v11);
  [(FCActivityManager *)v11 _invalidateActiveModeAssertion];
  defaultActivity = v11->_defaultActivity;
  v11->_defaultActivity = 0;

  [(FCActivityManager *)v11 _updateActivitiesWithModes:v7];
  objc_sync_exit(v11);
}

- (void)lifetimeDetailsProvider:(id)a3 didUpdateAvailableLifetimeDetails:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)FCLogActivities;
  if (os_log_type_enabled((os_log_t)FCLogActivities, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    id v10 = [(FCActivityManager *)self description];
    *(_DWORD *)buf = 138543618;
    v23 = v10;
    __int16 v24 = 2114;
    id v25 = v7;
    _os_log_impl(&dword_21F173000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Did receive updated available lifetime details: %{public}@", buf, 0x16u);
  }
  unint64_t v11 = self;
  objc_sync_enter(v11);
  objc_storeStrong((id *)&v11->_activeLifetimeDetailsCollection, a4);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = [(FCActivityManager *)v11 _availableActivities];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v18;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = *(void **)(*((void *)&v17 + 1) + 8 * v15);
        if ((objc_opt_respondsToSelector() & 1) != 0 && [v16 supportsDiscreteLifetimes]) {
          [(FCActivityManager *)v11 _updateActivity:v16 withLifetimeDetailsCollection:v11->_activeLifetimeDetailsCollection];
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v13);
  }

  objc_sync_exit(v11);
}

- (void)activitySuggestionClient:(id)a3 didSuggestConfiguredActivity:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = (void *)FCLogActivities;
  if (os_log_type_enabled((os_log_t)FCLogActivities, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    id v8 = [(FCActivityManager *)self description];
    int v9 = 138543618;
    id v10 = v8;
    __int16 v11 = 2114;
    id v12 = v5;
    _os_log_impl(&dword_21F173000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Did receive updated activity suggestion: %{public}@", (uint8_t *)&v9, 0x16u);
  }
  [(FCActivityManager *)self _updateActivitySuggestion:v5];
}

- (void)didShowSuggestedActivity:(id)a3 location:(int64_t)a4
{
  id v6 = [a3 activityUniqueIdentifier];
  id v10 = [(FCActivityManager *)self _activityForUniqueIdentifier:v6];

  if (v10)
  {
    id v7 = [(FCActivityManager *)self _activitySuggestionClient];
    id v8 = [v10 activityUniqueIdentifier];
    int v9 = [v8 UUIDString];
    [v7 didShowConfiguredActivitySuggestionWithSuggestionUUID:v9 location:a4 == 1];
  }
}

- (void)userDidSeeSuggestedActivity:(id)a3 location:(int64_t)a4
{
  id v6 = [a3 activityUniqueIdentifier];
  id v10 = [(FCActivityManager *)self _activityForUniqueIdentifier:v6];

  if (v10)
  {
    id v7 = [(FCActivityManager *)self _activitySuggestionClient];
    id v8 = [v10 activityUniqueIdentifier];
    int v9 = [v8 UUIDString];
    [v7 userDidSeeConfiguredActivitySuggestionWithSuggestionUUID:v9 location:a4 == 1];
  }
}

- (void)userDidAcceptSuggestedActivity:(id)a3 location:(int64_t)a4
{
  id v6 = [a3 activityUniqueIdentifier];
  id v10 = [(FCActivityManager *)self _activityForUniqueIdentifier:v6];

  if (v10)
  {
    id v7 = [(FCActivityManager *)self _activitySuggestionClient];
    id v8 = [v10 activityUniqueIdentifier];
    int v9 = [v8 UUIDString];
    [v7 userDidAcceptConfiguredActivitySuggestionWithSuggestionUUID:v9 location:a4 == 1];
  }
}

- (void)userDidRejectSuggestedActivity:(id)a3 location:(int64_t)a4
{
  id v6 = [a3 activityUniqueIdentifier];
  id v10 = [(FCActivityManager *)self _activityForUniqueIdentifier:v6];

  if (v10)
  {
    id v7 = [(FCActivityManager *)self _activitySuggestionClient];
    id v8 = [v10 activityUniqueIdentifier];
    int v9 = [v8 UUIDString];
    [v7 userDidRejectConfiguredActivitySuggestionWithSuggestionUUID:v9 location:a4 == 1];
  }
}

- (id)_modeSelectionService
{
  modeSelectionService = self->_modeSelectionService;
  if (!modeSelectionService)
  {
    id v4 = [MEMORY[0x263F3A748] serviceForClientIdentifier:@"com.apple.focus.activity-manager"];
    id v5 = self->_modeSelectionService;
    self->_modeSelectionService = v4;

    modeSelectionService = self->_modeSelectionService;
  }

  return modeSelectionService;
}

- (id)_lifetimeDetailsProvider
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (v2->_lifetimeDescriptionsUpdatingEnabled && !v2->_lifetimeDetailsProvider)
  {
    objc_super v3 = (DNDLifetimeDetailsProvider *)objc_alloc_init(MEMORY[0x263F3A7C8]);
    lifetimeDetailsProvider = v2->_lifetimeDetailsProvider;
    v2->_lifetimeDetailsProvider = v3;

    [(DNDLifetimeDetailsProvider *)v2->_lifetimeDetailsProvider setDelegate:v2];
  }
  objc_sync_exit(v2);

  id v5 = v2->_lifetimeDetailsProvider;

  return v5;
}

- (id)_stateService
{
  stateService = self->_stateService;
  if (!stateService)
  {
    id v4 = [MEMORY[0x263F3A7B0] serviceForClientIdentifier:@"com.apple.focus.activity-manager"];
    id v5 = self->_stateService;
    self->_stateService = v4;

    stateService = self->_stateService;
  }

  return stateService;
}

- (void)_enumerateObserversRespondingToSelector:(SEL)a3 usingBlock:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = (void (**)(id, void))a4;
  if (v5)
  {
    id v6 = self->_observers;
    objc_sync_enter(v6);
    id v7 = (void *)[(NSHashTable *)self->_observers copy];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v14;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void *)(*((void *)&v13 + 1) + 8 * v11);
          if (objc_opt_respondsToSelector()) {
            v5[2](v5, v12);
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }

    objc_sync_exit(v6);
  }
}

- (void)_updateCreationDateOfActivity:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    if (objc_opt_respondsToSelector())
    {
      id v5 = [v4 activityIdentifier];
      char v6 = BSEqualStrings();

      if ((v6 & 1) == 0)
      {
        id v7 = [(FCActivityManager *)self _modeSelectionService];
        id v8 = [v4 activityIdentifier];
        id v15 = 0;
        uint64_t v9 = [v7 modeConfigurationForModeIdentifier:v8 error:&v15];
        id v10 = v15;

        if (v9)
        {
          uint64_t v11 = [v9 created];
          [v4 _setActivityCreationDate:v11];
        }
        else
        {
          uint64_t v12 = (void *)FCLogActivities;
          if (v10)
          {
            if (os_log_type_enabled((os_log_t)FCLogActivities, OS_LOG_TYPE_ERROR))
            {
              long long v13 = v12;
              long long v14 = [(FCActivityManager *)self description];
              *(_DWORD *)buf = 138543874;
              long long v17 = v14;
              __int16 v18 = 2114;
              id v19 = v4;
              __int16 v20 = 2114;
              id v21 = v10;
              _os_log_error_impl(&dword_21F173000, v13, OS_LOG_TYPE_ERROR, "[%{public}@] Encountered error requesting mode configuration: activity: %{public}@; error: %{public}@",
                buf,
                0x20u);
            }
          }
          else if (os_log_type_enabled((os_log_t)FCLogActivities, OS_LOG_TYPE_DEBUG))
          {
            -[FCActivityManager _updateCreationDateOfActivity:]();
          }
        }
      }
    }
  }
}

- (void)_notifyObserversOfAvailableActivitiesChange
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __64__FCActivityManager__notifyObserversOfAvailableActivitiesChange__block_invoke;
  v2[3] = &unk_2645040C8;
  v2[4] = self;
  [(FCActivityManager *)self _enumerateObserversRespondingToSelector:sel_availableActivitiesDidChangeForManager_ usingBlock:v2];
}

void __64__FCActivityManager__notifyObserversOfAvailableActivitiesChange__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)FCLogActivities;
  if (os_log_type_enabled((os_log_t)FCLogActivities, OS_LOG_TYPE_DEBUG)) {
    __64__FCActivityManager__notifyObserversOfAvailableActivitiesChange__block_invoke_cold_1(a1, v4, (uint64_t)v3);
  }
  [v3 availableActivitiesDidChangeForManager:*(void *)(a1 + 32)];
}

- (void)_updateActivitiesWithModes:(id)a3
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v36 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v34 = objc_alloc_init(MEMORY[0x263EFF980]);
  v37 = [(NSMutableDictionary *)v5->_allActivitiesByIdentifier allValues];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  obuint64_t j = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v44 objects:v53 count:16];
  if (!v6)
  {

    goto LABEL_32;
  }
  int v7 = 0;
  uint64_t v8 = *(void *)v45;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v45 != v8) {
        objc_enumerationMutation(obj);
      }
      id v10 = *(void **)(*((void *)&v44 + 1) + 8 * i);
      uint64_t v11 = [v10 visibility];
      v43[0] = MEMORY[0x263EF8330];
      v43[1] = 3221225472;
      v43[2] = __48__FCActivityManager__updateActivitiesWithModes___block_invoke;
      v43[3] = &unk_2645040F0;
      v43[4] = v10;
      uint64_t v12 = objc_msgSend(v37, "bs_firstObjectPassingTest:", v43);
      long long v13 = v12;
      if (v12)
      {
        long long v14 = v12;
        BOOL v15 = (objc_opt_respondsToSelector() & 1) != 0 && [(_FCActivity *)v14 _updateMode:v10];
        BOOL v16 = v11 != 1 && v15;
        v7 |= v16;
        goto LABEL_21;
      }
      long long v14 = [[_FCActivity alloc] initWithMode:v10];
      [(FCActivityManager *)v5 _updateCreationDateOfActivity:v14];
      if (objc_opt_respondsToSelector())
      {
        if ([(_FCActivity *)v14 supportsDiscreteLifetimes])
        {
          if (v5->_activeLifetimeDetailsCollection) {
            -[FCActivityManager _updateActivity:withLifetimeDetailsCollection:](v5, "_updateActivity:withLifetimeDetailsCollection:", v14);
          }
        }
        else
        {
          [(FCActivityManager *)v5 _updateLifetimesAlternativeDescriptionForActivity:v14];
        }
      }
      v7 |= v11 != 1;
      if (v14)
      {
        LOBYTE(v15) = 1;
LABEL_21:
        if (v11 != 1) {
          [v34 addObject:v14];
        }
        long long v17 = [(_FCActivity *)v14 activityIdentifier];
        [v36 setObject:v14 forKey:v17];

        if (!v15)
        {
          __int16 v18 = (id)FCLogActivities;
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            id v19 = [(FCActivityManager *)v5 description];
            *(_DWORD *)buf = 138543618;
            v50 = v19;
            __int16 v51 = 2114;
            v52 = v13;
            _os_log_debug_impl(&dword_21F173000, v18, OS_LOG_TYPE_DEBUG, "[%{public}@] Activity didn't change from cached value: %{public}@", buf, 0x16u);
          }
        }
      }
    }
    uint64_t v6 = [obj countByEnumeratingWithState:&v44 objects:v53 count:16];
  }
  while (v6);

  if (v7)
  {
    BOOL v20 = 1;
    goto LABEL_33;
  }
LABEL_32:
  uint64_t v21 = [(NSArray *)v5->_availableActivities count];
  BOOL v20 = v21 != [v34 count];
LABEL_33:
  objc_storeStrong((id *)&v5->_allActivitiesByIdentifier, v36);
  [v34 sortUsingFunction:_FCSortRealizedAndPlaceholderActivities context:0];
  [(FCActivityManager *)v5 _setAvailableActivities:v34];
  uint64_t v22 = [(FCActivityDescribing *)v5->_activeActivity activityUniqueIdentifier];
  v23 = [(FCActivityManager *)v5 _activityForUniqueIdentifier:v22];
  [(FCActivityManager *)v5 _updateActiveActivity:v23];

  if (v20)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48__FCActivityManager__updateActivitiesWithModes___block_invoke_85;
    block[3] = &unk_264504118;
    block[4] = v5;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    __int16 v24 = (id)FCLogActivities;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      id v25 = [(FCActivityManager *)v5 description];
      [(FCActivityManager *)v25 _updateActivitiesWithModes:v24];
    }
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v26 = (void *)[(NSMapTable *)v5->_locationsToSuggestedActivitiesOrNull copy];
  uint64_t v27 = [v26 countByEnumeratingWithState:&v38 objects:v48 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v39;
    do
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v39 != v28) {
          objc_enumerationMutation(v26);
        }
        v30 = *(void **)(*((void *)&v38 + 1) + 8 * j);
        v31 = [(NSMapTable *)v5->_locationsToSuggestedActivitiesOrNull objectForKey:v30];
        if (objc_opt_respondsToSelector())
        {
          v32 = [v31 activityUniqueIdentifier];
          v33 = [(FCActivityManager *)v5 _activityForUniqueIdentifier:v32];

          -[FCActivityManager _updateSuggestedActivity:forLocation:](v5, "_updateSuggestedActivity:forLocation:", v33, [v30 integerValue]);
        }
      }
      uint64_t v27 = [v26 countByEnumeratingWithState:&v38 objects:v48 count:16];
    }
    while (v27);
  }

  objc_sync_exit(v5);
}

uint64_t __48__FCActivityManager__updateActivitiesWithModes___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 activityUniqueIdentifier];
  id v4 = [*(id *)(a1 + 32) identifier];
  uint64_t v5 = BSEqualObjects();

  return v5;
}

uint64_t __48__FCActivityManager__updateActivitiesWithModes___block_invoke_85(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyObserversOfAvailableActivitiesChange];
}

- (void)_setAvailableActivities:(id)a3
{
  uint64_t v6 = (NSArray *)a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  if (v5->_availableActivities != v6) {
    objc_storeStrong((id *)&v5->_availableActivities, a3);
  }
  objc_sync_exit(v5);
}

- (void)_invalidateActiveModeAssertion
{
  obuint64_t j = self;
  objc_sync_enter(obj);
  activeModeAssertion = obj->_activeModeAssertion;
  obj->_activeModeAssertion = 0;

  obj->_activeModeAssertionIsValid = 0;
  objc_sync_exit(obj);
}

- (BOOL)_doesActivity:(id)a3 identifySameModeAsActivity:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5 == v6)
  {
    char v9 = 1;
  }
  else if (v5)
  {
    int v7 = [v5 activityIdentifier];
    uint64_t v8 = [v6 activityIdentifier];
    char v9 = [v7 isEqual:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (void)_updateWithActiveModeAssertionIfNecessary:(id)a3 stateUpdate:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  char v9 = self;
  objc_sync_enter(v9);
  if (!v9->_activeModeAssertionIsValid)
  {
    v9->_activeModeAssertionIsValid = 1;
    id v10 = (id)FCLogActivities;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [(FCActivityManager *)v9 description];
      int v15 = 138543618;
      BOOL v16 = v11;
      __int16 v17 = 2114;
      id v18 = v7;
      _os_log_impl(&dword_21F173000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating active mode assertion: %{public}@", (uint8_t *)&v15, 0x16u);
    }
    objc_storeStrong((id *)&v9->_activeModeAssertion, a3);
    objc_storeStrong((id *)&v9->_activeStateUpdate, a4);
    if (v7)
    {
      uint64_t v12 = [v7 details];
      long long v13 = [v12 modeIdentifier];
      long long v14 = [(FCActivityManager *)v9 _activityForModeIdentifier:v13];
    }
    else
    {
      long long v14 = 0;
    }
    [(FCActivityManager *)v9 _updateActiveActivity:v14];
    [(FCActivityManager *)v9 _updateLifetimeForActiveActivity];
  }
  objc_sync_exit(v9);
}

- (void)_updateActiveModeAssertionIfNecessary
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_3(&dword_21F173000, v6, v4, "[%{public}@] Encountered error requesting active activity: %{public}@", v5);
}

- (void)_updateLifetimeForActiveActivity
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (v2->_activeModeAssertion)
  {
    uint64_t v3 = [(FCActivityManager *)v2 _lifetimeDetailsProvider];
    uint64_t v4 = [(DNDModeAssertion *)v2->_activeModeAssertion details];
    id v12 = 0;
    id v5 = [v3 lifetimeDetailsForAssertionDetails:v4 error:&v12];
    id v6 = v12;

    if (v5)
    {
      id v7 = [v5 identifier];
      id v8 = [(FCActivityManager *)v2 _lifetimeForLifetimeDetailsIdentifier:v7 ofActivity:v2->_activeActivity];
    }
    else
    {
      if (!v6)
      {
        id v8 = 0;
        goto LABEL_10;
      }
      id v7 = (id)FCLogActivities;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        id v10 = [(FCActivityManager *)v2 description];
        activeModeAssertion = v2->_activeModeAssertion;
        *(_DWORD *)buf = 138543874;
        long long v14 = v10;
        __int16 v15 = 2114;
        BOOL v16 = activeModeAssertion;
        __int16 v17 = 2114;
        id v18 = v6;
        _os_log_error_impl(&dword_21F173000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] Encountered error requesting lifetime details for active mode assertion: activeModeAssertion: %{public}@; error: %{public}@",
          buf,
          0x20u);
      }
      id v8 = 0;
    }

LABEL_10:
    goto LABEL_11;
  }
  id v5 = 0;
  id v8 = 0;
LABEL_11:
  [(FCActivityManager *)v2 _setLifetimeForActiveActivity:v8];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [(FCActivityDescribing *)v2->_activeActivity supportsDiscreteLifetimes])
  {
    activeActivity = v2->_activeActivity;
    if (v2->_activeLifetimeDetailsCollection) {
      -[FCActivityManager _updateActivity:withLifetimeDetailsCollection:](v2, "_updateActivity:withLifetimeDetailsCollection:", activeActivity);
    }
    else {
      [(FCActivityManager *)v2 _updateActivity:activeActivity withLifetimeDetails:v5];
    }
  }
  objc_sync_exit(v2);
}

- (void)_updateLifetimeForActiveActivityIfNecessary
{
  obuint64_t j = self;
  objc_sync_enter(obj);
  if (!obj->_lifetimeOfActiveActivity) {
    [(FCActivityManager *)obj _updateLifetimeForActiveActivity];
  }
  objc_sync_exit(obj);
}

- (id)_lifetimeForActiveActivity
{
  [(FCActivityManager *)self _updateActiveModeAssertionIfNecessary];
  [(FCActivityManager *)self _updateLifetimeForActiveActivityIfNecessary];
  lifetimeOfActiveActivity = self->_lifetimeOfActiveActivity;

  return lifetimeOfActiveActivity;
}

- (id)_activityForATXActivityOrSuggestion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  id v8 = v7;

  char v9 = [v8 modeUUID];
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    uint64_t v12 = objc_opt_class();
    id v13 = v6;
    if (v12)
    {
      if (objc_opt_isKindOfClass()) {
        long long v14 = v13;
      }
      else {
        long long v14 = 0;
      }
    }
    else
    {
      long long v14 = 0;
    }
    id v15 = v14;

    id v11 = [v15 uuidString];
  }
  if ([v11 length])
  {
    BOOL v16 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v11];
    if (v16)
    {
      __int16 v17 = [(FCActivityManager *)self _activityForUniqueIdentifier:v16];
    }
    else
    {
      __int16 v17 = 0;
    }
  }
  else
  {
    __int16 v17 = 0;
  }

  return v17;
}

- (id)_activityForModeIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v5 = self;
    objc_sync_enter(v5);
    id v6 = [(FCActivityManager *)v5 _availableActivities];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __48__FCActivityManager__activityForModeIdentifier___block_invoke;
    v9[3] = &unk_2645040F0;
    id v10 = v4;
    id v7 = objc_msgSend(v6, "bs_firstObjectPassingTest:", v9);

    objc_sync_exit(v5);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

uint64_t __48__FCActivityManager__activityForModeIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 activityIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)_activityForUniqueIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = self;
    objc_sync_enter(v5);
    id v6 = [(FCActivityManager *)v5 _availableActivities];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __50__FCActivityManager__activityForUniqueIdentifier___block_invoke;
    v9[3] = &unk_2645040F0;
    id v10 = v4;
    id v7 = objc_msgSend(v6, "bs_firstObjectPassingTest:", v9);

    objc_sync_exit(v5);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

uint64_t __50__FCActivityManager__activityForUniqueIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 activityUniqueIdentifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (id)_lifetimeForLifetimeDetailsIdentifier:(id)a3 ofActivity:(id)a4
{
  id v5 = a3;
  id v6 = 0;
  if (v5 && a4)
  {
    id v7 = [a4 activityLifetimeDescriptions];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __70__FCActivityManager__lifetimeForLifetimeDetailsIdentifier_ofActivity___block_invoke;
    v9[3] = &unk_264504140;
    id v10 = v5;
    id v6 = objc_msgSend(v7, "bs_firstObjectPassingTest:", v9);
  }

  return v6;
}

uint64_t __70__FCActivityManager__lifetimeForLifetimeDetailsIdentifier_ofActivity___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 lifetimeIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)_updateActiveActivity:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = (FCActivityDescribing *)a3;
  id v6 = self;
  objc_sync_enter(v6);
  if (v6->_activeActivity != v5)
  {
    id v7 = (id)FCLogActivities;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(FCActivityManager *)v6 description];
      *(_DWORD *)buf = 138543618;
      uint64_t v12 = v8;
      __int16 v13 = 2114;
      long long v14 = v5;
      _os_log_impl(&dword_21F173000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating active activity: %{public}@", buf, 0x16u);
    }
    char v9 = v6->_activeActivity;
    objc_storeStrong((id *)&v6->_activeActivity, a3);
    if (![(FCActivityManager *)v6 _doesActivity:v6->_activeActivity identifySameModeAsActivity:v9])
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __43__FCActivityManager__updateActiveActivity___block_invoke;
      block[3] = &unk_264504118;
      block[4] = v6;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
  objc_sync_exit(v6);
}

uint64_t __43__FCActivityManager__updateActiveActivity___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __43__FCActivityManager__updateActiveActivity___block_invoke_2;
  v6[3] = &unk_2645040C8;
  v6[4] = v2;
  [v2 _enumerateObserversRespondingToSelector:sel_activeActivityDidChangeForManager_ usingBlock:v6];
  uint64_t v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __43__FCActivityManager__updateActiveActivity___block_invoke_96;
  v5[3] = &unk_2645040C8;
  v5[4] = v3;
  return [v3 _enumerateObserversRespondingToSelector:sel_activeModeDidChangeForManager_ usingBlock:v5];
}

void __43__FCActivityManager__updateActiveActivity___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)FCLogActivities;
  if (os_log_type_enabled((os_log_t)FCLogActivities, OS_LOG_TYPE_DEBUG)) {
    __43__FCActivityManager__updateActiveActivity___block_invoke_2_cold_1(a1, v4, (uint64_t)v3);
  }
  [v3 activeActivityDidChangeForManager:*(void *)(a1 + 32)];
}

void __43__FCActivityManager__updateActiveActivity___block_invoke_96(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)FCLogActivities;
  if (os_log_type_enabled((os_log_t)FCLogActivities, OS_LOG_TYPE_DEBUG)) {
    __43__FCActivityManager__updateActiveActivity___block_invoke_96_cold_1(a1, v4, (uint64_t)v3);
  }
  [v3 activeModeDidChangeForManager:*(void *)(a1 + 32)];
}

- (id)_activeActivity
{
  [(FCActivityManager *)self _updateActiveModeAssertionIfNecessary];
  activeActivity = self->_activeActivity;

  return activeActivity;
}

- (void)_setLifetimeForActiveActivity:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = self;
  objc_sync_enter(v6);
  if ((BSEqualObjects() & 1) == 0)
  {
    id v7 = (id)FCLogActivities;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(FCActivityManager *)v6 description];
      *(_DWORD *)buf = 138543618;
      id v11 = v8;
      __int16 v12 = 2114;
      id v13 = v5;
      _os_log_impl(&dword_21F173000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating lifetime of active activity: %{public}@", buf, 0x16u);
    }
    objc_storeStrong((id *)&v6->_lifetimeOfActiveActivity, a3);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__FCActivityManager__setLifetimeForActiveActivity___block_invoke;
    block[3] = &unk_264504118;
    block[4] = v6;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  objc_sync_exit(v6);
}

uint64_t __51__FCActivityManager__setLifetimeForActiveActivity___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __51__FCActivityManager__setLifetimeForActiveActivity___block_invoke_2;
  v3[3] = &unk_2645040C8;
  v3[4] = v1;
  return [v1 _enumerateObserversRespondingToSelector:sel_activeActivityLifetimeDidChangeForManager_ usingBlock:v3];
}

void __51__FCActivityManager__setLifetimeForActiveActivity___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)FCLogActivities;
  if (os_log_type_enabled((os_log_t)FCLogActivities, OS_LOG_TYPE_DEBUG)) {
    __51__FCActivityManager__setLifetimeForActiveActivity___block_invoke_2_cold_1(a1, v4, (uint64_t)v3);
  }
  [v3 activeActivityLifetimeDidChangeForManager:*(void *)(a1 + 32)];
}

- (void)_setActiveActivity:(id)a3 withLifetime:(id)a4 reason:(id)a5
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(FCActivityManager *)self _activeActivity];
  if (v11 == v8)
  {
    id v12 = [(FCActivityManager *)self lifetimeOfActivity:v8];

    if (v12 == v9) {
      goto LABEL_21;
    }
  }
  else
  {
  }
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __60__FCActivityManager__setActiveActivity_withLifetime_reason___block_invoke;
  v33[3] = &unk_264504168;
  v33[4] = self;
  id v13 = (NSArray *)v9;
  id v34 = v13;
  uint64_t v14 = (uint64_t (**)(void, void, void, void))MEMORY[0x223C45530](v33);
  if (v8)
  {
    uint64_t v15 = self;
    objc_sync_enter(v15);
    BOOL v16 = [(FCActivityManager *)v15 _availableActivities];
    int v17 = [v16 containsObject:v8];

    id v18 = (id)FCLogActivities;
    uint64_t v19 = v18;
    if (v17)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v20 = [(FCActivityManager *)v15 description];
        *(_DWORD *)buf = 138544130;
        id v36 = v20;
        __int16 v37 = 2114;
        long long v38 = v8;
        __int16 v39 = 2114;
        long long v40 = v13;
        __int16 v41 = 2114;
        v42 = v10;
        _os_log_impl(&dword_21F173000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] Activating activity: activity: %{public}@; lifetime: %{public}@; reason: %{public}@",
          buf,
          0x2Au);
      }
      id v32 = 0;
      char v21 = ((uint64_t (**)(void, NSObject *, NSArray *, id *))v14)[2](v14, v8, v13, &v32);
      uint64_t v19 = v32;
      if ((v21 & 1) == 0)
      {
        uint64_t v22 = (id)FCLogActivities;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v30 = [(FCActivityManager *)v15 description];
          *(_DWORD *)buf = 138544130;
          id v36 = v30;
          __int16 v37 = 2114;
          long long v38 = v8;
          __int16 v39 = 2114;
          long long v40 = v13;
          __int16 v41 = 2114;
          v42 = v19;
          _os_log_error_impl(&dword_21F173000, v22, OS_LOG_TYPE_ERROR, "[%{public}@] Encountered error activating activity: activity: %{public}@; lifetime: %{public}@; error: %{public}@",
            buf,
            0x2Au);
        }
      }
    }
    else if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v28 = [(FCActivityManager *)v15 description];
      availableActivities = v15->_availableActivities;
      *(_DWORD *)buf = 138543874;
      id v36 = v28;
      __int16 v37 = 2114;
      long long v38 = v8;
      __int16 v39 = 2114;
      long long v40 = availableActivities;
      _os_log_error_impl(&dword_21F173000, v19, OS_LOG_TYPE_ERROR, "[%{public}@] Attempt to activate activity not in collection: activity: %{public}@; availableActivities: %{public}@",
        buf,
        0x20u);
    }
    objc_sync_exit(v15);
  }
  else
  {
    v23 = (void *)FCLogActivities;
    if (os_log_type_enabled((os_log_t)FCLogActivities, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v24 = v23;
      id v25 = [(FCActivityManager *)self description];
      *(_DWORD *)buf = 138543618;
      id v36 = v25;
      __int16 v37 = 2114;
      long long v38 = v10;
      _os_log_impl(&dword_21F173000, v24, OS_LOG_TYPE_DEFAULT, "[%{public}@] Deactivating all activities: reason: %{public}@", buf, 0x16u);
    }
    id v31 = 0;
    char v26 = ((uint64_t (**)(void, void, NSArray *, id *))v14)[2](v14, 0, v13, &v31);
    uint64_t v15 = (FCActivityManager *)v31;
    if ((v26 & 1) == 0)
    {
      uint64_t v27 = (void *)FCLogActivities;
      if (os_log_type_enabled((os_log_t)FCLogActivities, OS_LOG_TYPE_ERROR)) {
        -[FCActivityManager _setActiveActivity:withLifetime:reason:](v27, self, (uint64_t)v15);
      }
    }
  }

LABEL_21:
}

BOOL __60__FCActivityManager__setActiveActivity_withLifetime_reason___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = [*(id *)(a1 + 32) _modeSelectionService];
  if (!v7)
  {
    id v11 = 0;
LABEL_15:
    id v22 = 0;
    [v9 activateModeWithDetails:v11 error:&v22];
    id v18 = v22;
    goto LABEL_16;
  }
  id v10 = objc_alloc_init(MEMORY[0x263F3A778]);
  id v11 = v10;
  if (!v8)
  {
    [v10 setIdentifier:@"com.apple.focus.activity-manager"];
    BOOL v20 = [v7 activityIdentifier];
    [v11 setModeIdentifier:v20];

    [v11 setReason:1];
    int v17 = [MEMORY[0x263F3A6E8] lifetimeUntilEndOfScheduleWithIdentifier:*MEMORY[0x263F3A678]];
    goto LABEL_12;
  }
  id v12 = [v8 lifetimeIdentifier];
  [v11 setIdentifier:v12];

  id v13 = [v7 activityIdentifier];
  [v11 setModeIdentifier:v13];

  [v11 setReason:1];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([v8 _dndLifetimeDetails], (uint64_t v14 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v19 = (void *)FCLogActivities;
    if (os_log_type_enabled((os_log_t)FCLogActivities, OS_LOG_TYPE_ERROR)) {
      __60__FCActivityManager__setActiveActivity_withLifetime_reason___block_invoke_cold_1(a1 + 32, v19);
    }
    int v17 = 0;
LABEL_12:
    id v18 = 0;
    if (!v17) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  uint64_t v15 = (void *)v14;
  BOOL v16 = [*(id *)(a1 + 32) _lifetimeDetailsProvider];
  id v23 = 0;
  int v17 = [v16 lifetimeForLifetimeDetails:v15 error:&v23];
  id v18 = v23;

  if (v17) {
LABEL_13:
  }
    [v11 setLifetime:v17];
LABEL_14:

  if (!v18) {
    goto LABEL_15;
  }
LABEL_16:
  if (a4 && v18) {
    *a4 = v18;
  }

  return v18 == 0;
}

- (void)_deactivateActivity:(id)a3 reason:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FCActivityManager *)self _activeActivity];
  if (v8 != v6)
  {

    goto LABEL_3;
  }
  activeModeAssertion = self->_activeModeAssertion;

  if (!activeModeAssertion)
  {
LABEL_3:
    id v9 = [(FCActivityManager *)self _activeActivity];

    id v10 = (void *)FCLogActivities;
    BOOL v11 = os_log_type_enabled((os_log_t)FCLogActivities, OS_LOG_TYPE_ERROR);
    if (v9 == v6)
    {
      if (v11) {
        -[FCActivityManager _deactivateActivity:reason:](v10, self);
      }
    }
    else if (v11)
    {
      -[FCActivityManager _deactivateActivity:reason:]();
    }
    goto LABEL_15;
  }
  id v13 = [(FCActivityManager *)self _modeSelectionService];
  uint64_t v14 = (void *)FCLogActivities;
  if (os_log_type_enabled((os_log_t)FCLogActivities, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = v14;
    BOOL v16 = [(FCActivityManager *)self description];
    *(_DWORD *)buf = 138543618;
    id v22 = v16;
    __int16 v23 = 2114;
    id v24 = v7;
    _os_log_impl(&dword_21F173000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Deactivating active activity: reason: %{public}@", buf, 0x16u);
  }
  int v17 = [(DNDModeAssertion *)self->_activeModeAssertion UUID];
  id v20 = 0;
  char v18 = [v13 invalidateModeAssertionWithUUID:v17 error:&v20];
  id v19 = v20;

  if ((v18 & 1) == 0 && os_log_type_enabled((os_log_t)FCLogActivities, OS_LOG_TYPE_ERROR)) {
    -[FCActivityManager _deactivateActivity:reason:]();
  }

LABEL_15:
}

- (void)_notifyObserversOfLifetimeChangeForActivity:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __65__FCActivityManager__notifyObserversOfLifetimeChangeForActivity___block_invoke;
    v6[3] = &unk_264504190;
    v6[4] = self;
    id v7 = v4;
    [(FCActivityManager *)self _enumerateObserversRespondingToSelector:sel_activityManager_lifetimeDescriptionsDidChangeForActivity_ usingBlock:v6];
  }
}

void __65__FCActivityManager__notifyObserversOfLifetimeChangeForActivity___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)FCLogActivities;
  if (os_log_type_enabled((os_log_t)FCLogActivities, OS_LOG_TYPE_DEBUG)) {
    __65__FCActivityManager__notifyObserversOfLifetimeChangeForActivity___block_invoke_cold_1(a1, v4, (uint64_t)v3);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = (void *)[*(id *)(a1 + 40) copyWithZone:0];
  [v3 activityManager:v5 lifetimeDescriptionsDidChangeForActivity:v6];
}

- (void)_updateActivity:(id)a3 withLifetimeDescriptions:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (objc_opt_respondsToSelector())
  {
    id v8 = [v6 activityLifetimeDescriptions];
    char v9 = BSEqualArrays();

    if ((v9 & 1) == 0)
    {
      id v10 = (void *)FCLogActivities;
      if (os_log_type_enabled((os_log_t)FCLogActivities, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v11 = v10;
        id v12 = [(FCActivityManager *)self description];
        *(_DWORD *)buf = 138543874;
        BOOL v16 = v12;
        __int16 v17 = 2114;
        id v18 = v6;
        __int16 v19 = 2114;
        id v20 = v7;
        _os_log_impl(&dword_21F173000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating lifetime descriptions for activity: activity: %{public}@; lifetime descriptions: %{public}@",
          buf,
          0x20u);
      }
      [v6 _setActivityLifetimeDescriptions:v7];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __62__FCActivityManager__updateActivity_withLifetimeDescriptions___block_invoke;
      v13[3] = &unk_2645041B8;
      v13[4] = self;
      id v14 = v6;
      dispatch_async(MEMORY[0x263EF83A0], v13);
    }
  }
  else if (os_log_type_enabled((os_log_t)FCLogActivities, OS_LOG_TYPE_ERROR))
  {
    -[FCActivityManager _updateActivity:withLifetimeDescriptions:]();
  }
}

uint64_t __62__FCActivityManager__updateActivity_withLifetimeDescriptions___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyObserversOfLifetimeChangeForActivity:*(void *)(a1 + 40)];
}

- (void)_updateActivity:(id)a3 withLifetimeDetails:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    if (objc_opt_respondsToSelector())
    {
      char v9 = [v6 activityLifetimeDescriptions];
      id v10 = (void *)[v9 mutableCopy];
      BOOL v11 = v10;
      id v20 = self;
      if (v10) {
        id v12 = v10;
      }
      else {
        id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
      }
      id v13 = v12;

      id v14 = [[_FCActivityLifetime alloc] initWithLifetimeDetails:v8];
      if ([v9 count])
      {
        uint64_t v15 = 0;
        while (1)
        {
          BOOL v16 = [v9 objectAtIndexedSubscript:v15];
          __int16 v17 = [v16 lifetimeIdentifier];
          id v18 = [v8 identifier];
          int v19 = [v17 isEqualToString:v18];

          if (v19) {
            break;
          }

          if (++v15 >= (unint64_t)[v9 count]) {
            goto LABEL_13;
          }
        }
        [v13 setObject:v14 atIndexedSubscript:v15];
      }
      else
      {
LABEL_13:
        [v13 addObject:v14];
      }
      [(FCActivityManager *)v20 _updateActivity:v6 withLifetimeDescriptions:v13];
    }
    else if (os_log_type_enabled((os_log_t)FCLogActivities, OS_LOG_TYPE_ERROR))
    {
      -[FCActivityManager _updateActivity:withLifetimeDescriptions:]();
    }
  }
}

- (void)_updateActivity:(id)a3 withLifetimeDetailsCollection:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (objc_opt_respondsToSelector())
  {
    id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * v13);
          uint64_t v15 = [_FCActivityLifetime alloc];
          BOOL v16 = -[_FCActivityLifetime initWithLifetimeDetails:](v15, "initWithLifetimeDetails:", v14, (void)v17);
          [v8 addObject:v16];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
    }

    [(FCActivityManager *)self _updateActivity:v6 withLifetimeDescriptions:v8];
  }
  else if (os_log_type_enabled((os_log_t)FCLogActivities, OS_LOG_TYPE_ERROR))
  {
    -[FCActivityManager _updateActivity:withLifetimeDescriptions:]();
  }
}

- (void)_updateLifetimesAlternativeDescription:(id)a3 forActivity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_opt_respondsToSelector())
  {
    id v8 = self;
    objc_sync_enter(v8);
    uint64_t v9 = objc_opt_class();
    id v10 = v7;
    if (v9)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v11 = v10;
      }
      else {
        uint64_t v11 = 0;
      }
    }
    else
    {
      uint64_t v11 = 0;
    }
    id v12 = v11;

    uint64_t v13 = [v12 activityLifetimesAlternativeDescription];
    char v14 = BSEqualStrings();

    if ((v14 & 1) == 0)
    {
      [v10 _setActivityLifetimesAlternativeDescription:v6];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __72__FCActivityManager__updateLifetimesAlternativeDescription_forActivity___block_invoke;
      v15[3] = &unk_2645041B8;
      v15[4] = v8;
      id v16 = v10;
      dispatch_async(MEMORY[0x263EF83A0], v15);
    }
    objc_sync_exit(v8);
  }
}

uint64_t __72__FCActivityManager__updateLifetimesAlternativeDescription_forActivity___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyObserversOfLifetimeChangeForActivity:*(void *)(a1 + 40)];
}

- (void)_updateLifetimesAlternativeDescriptionForActivity:(id)a3
{
  id v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v4 isSleepActivity])
  {
    uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v6 = [v5 localizedStringForKey:@"SLEEP_ACTIVATE_ON_SCHEDULE" value:&stru_26D0B5698 table:@"Focus"];
    [(FCActivityManager *)self _updateLifetimesAlternativeDescription:v6 forActivity:v4];
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0 && [v4 isDrivingActivity])
  {
    id v7 = [(FCActivityManager *)self _carDNDStatus];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __71__FCActivityManager__updateLifetimesAlternativeDescriptionForActivity___block_invoke;
    v8[3] = &unk_2645041E0;
    v8[4] = self;
    id v9 = v4;
    [v7 fetchAutomaticDNDTriggerPreferenceWithReply:v8];
  }
}

void __71__FCActivityManager__updateLifetimesAlternativeDescriptionForActivity___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = (void *)FCLogActivities;
    if (os_log_type_enabled((os_log_t)FCLogActivities, OS_LOG_TYPE_ERROR)) {
      __71__FCActivityManager__updateLifetimesAlternativeDescriptionForActivity___block_invoke_cold_1(a1, v6, (uint64_t)v5);
    }
  }
  else
  {
    id v7 = *(void **)(a1 + 32);
    id v8 = [v7 _localizedAutomaticDrivingTriggerDescriptionForPreference:a2];
    [v7 _updateLifetimesAlternativeDescription:v8 forActivity:*(void *)(a1 + 40)];
  }
}

- (void)_updateLifetimesAlternativeDescriptionsForAvailableActivities
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = [(FCActivityManager *)v2 _availableActivities];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        [(FCActivityManager *)v2 _updateLifetimesAlternativeDescriptionForActivity:*(void *)(*((void *)&v7 + 1) + 8 * v6++)];
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

- (BOOL)_isSyncedAssertion:(id)a3
{
  id v3 = [a3 source];
  uint64_t v4 = [v3 deviceIdentifier];
  BOOL v5 = v4 != 0;

  return v5;
}

- (id)_activitySuggestionClient
{
  activitySuggestionClient = self->_activitySuggestionClient;
  if (!activitySuggestionClient)
  {
    uint64_t v4 = [MEMORY[0x263F24FE0] sharedInstance];
    BOOL v5 = self->_activitySuggestionClient;
    self->_activitySuggestionClient = v4;

    [(ATXActivitySuggestionClient *)self->_activitySuggestionClient registerObserver:self sendingInitialChangeNotification:1];
    activitySuggestionClient = self->_activitySuggestionClient;
  }

  return activitySuggestionClient;
}

- (void)_updateSuggestedActivity:(id)a3 forLocation:(int64_t)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  long long v7 = self;
  objc_sync_enter(v7);
  locationsToSuggestedActivitiesOrNull = v7->_locationsToSuggestedActivitiesOrNull;
  long long v9 = [NSNumber numberWithInteger:a4];
  long long v10 = [(NSMapTable *)locationsToSuggestedActivitiesOrNull objectForKey:v9];

  uint64_t v11 = [MEMORY[0x263EFF9D0] null];
  if (BSEqualObjects()) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = v10;
  }
  id v13 = v12;

  if ((BSEqualObjects() & 1) == 0)
  {
    if (v6 && !v7->_locationsToSuggestedActivitiesOrNull)
    {
      uint64_t v14 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
      uint64_t v15 = v7->_locationsToSuggestedActivitiesOrNull;
      v7->_locationsToSuggestedActivitiesOrNull = (NSMapTable *)v14;
    }
    id v16 = (id)FCLogActivities;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      long long v17 = [(FCActivityManager *)v7 description];
      long long v18 = @"[unknown]";
      if (a4 == 1) {
        long long v18 = @"prominent";
      }
      if (!a4) {
        long long v18 = @"unobtrusive";
      }
      long long v19 = v18;
      *(_DWORD *)buf = 138543874;
      char v26 = v17;
      __int16 v27 = 2114;
      id v28 = v6;
      __int16 v29 = 2114;
      v30 = v19;
      _os_log_impl(&dword_21F173000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating suggested activity: %{public}@ (%{public}@)", buf, 0x20u);
    }
    if (v6)
    {
      id v20 = v6;
    }
    else
    {
      id v20 = [MEMORY[0x263EFF9D0] null];
    }
    uint64_t v21 = v20;
    uint64_t v22 = v7->_locationsToSuggestedActivitiesOrNull;
    __int16 v23 = [NSNumber numberWithInteger:a4];
    [(NSMapTable *)v22 setObject:v21 forKey:v23];

    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __58__FCActivityManager__updateSuggestedActivity_forLocation___block_invoke;
    v24[3] = &unk_264504230;
    v24[4] = v7;
    v24[5] = a4;
    dispatch_async(MEMORY[0x263EF83A0], v24);
  }
  objc_sync_exit(v7);
}

uint64_t __58__FCActivityManager__updateSuggestedActivity_forLocation___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __58__FCActivityManager__updateSuggestedActivity_forLocation___block_invoke_2;
  v3[3] = &unk_264504208;
  uint64_t v1 = *(void *)(a1 + 40);
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = v1;
  return [v4 _enumerateObserversRespondingToSelector:sel_activityManager_suggestedActivityDidChangeForLocation_ usingBlock:v3];
}

void __58__FCActivityManager__updateSuggestedActivity_forLocation___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)FCLogActivities;
  if (os_log_type_enabled((os_log_t)FCLogActivities, OS_LOG_TYPE_DEBUG)) {
    __58__FCActivityManager__updateSuggestedActivity_forLocation___block_invoke_2_cold_1(a1, v4);
  }
  [v3 activityManager:*(void *)(a1 + 32) suggestedActivityDidChangeForLocation:*(void *)(a1 + 40)];
}

- (void)_updateSuggestedActivity:(id)a3 forLocations:(unint64_t)a4
{
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  char v9 = 1;
  do
  {
    char v10 = v9;
    if (v9) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = v7;
    }
    if ((v11 & a4) != 0) {
      [(FCActivityManager *)self _updateSuggestedActivity:a3 forLocation:v8];
    }
    char v9 = 0;
    uint64_t v7 = 2;
    uint64_t v8 = 1;
  }
  while ((v10 & 1) != 0);
}

- (void)_updateActivitySuggestion:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_7:
    id v6 = 0;
    goto LABEL_8;
  }
  uint64_t v5 = [(FCActivityManager *)self _activityForATXActivityOrSuggestion:v4];
  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)FCLogActivities, OS_LOG_TYPE_ERROR)) {
      -[FCActivityManager _updateActivitySuggestion:]();
    }
    goto LABEL_7;
  }
  id v6 = (void *)v5;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_8:
    uint64_t v7 = 3;
    goto LABEL_9;
  }
  uint64_t v7 = [v4 location];
LABEL_9:
  [(FCActivityManager *)self _updateSuggestedActivity:v6 forLocations:v7];
}

- (id)_localizedAutomaticDrivingTriggerDescriptionForPreference:(unint64_t)a3
{
  if (a3 > 2) {
    id v3 = 0;
  }
  else {
    id v3 = off_264504270[a3];
  }
  if ([(__CFString *)v3 length])
  {
    id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v5 = [v4 localizedStringForKey:v3 value:&stru_26D0B5698 table:@"Focus"];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)_drivingTriggerDidChange
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = (void *)FCLogActivities;
  if (os_log_type_enabled((os_log_t)FCLogActivities, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    uint64_t v5 = [(FCActivityManager *)self description];
    int v9 = 138543362;
    char v10 = v5;
    _os_log_impl(&dword_21F173000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Driving trigger did change", (uint8_t *)&v9, 0xCu);
  }
  id v6 = self;
  objc_sync_enter(v6);
  uint64_t v7 = [(FCActivityManager *)v6 _availableActivities];
  uint64_t v8 = objc_msgSend(v7, "bs_firstObjectPassingTest:", &__block_literal_global_135);
  [(FCActivityManager *)v6 _updateLifetimesAlternativeDescriptionForActivity:v8];

  objc_sync_exit(v6);
}

uint64_t __45__FCActivityManager__drivingTriggerDidChange__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector()) {
    uint64_t v3 = [v2 isDrivingActivity];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)_carDNDStatus
{
  if (self->_lifetimeDescriptionsUpdatingEnabled && !self->_carDNDStatus)
  {
    uint64_t v3 = (CARAutomaticDNDStatus *)objc_alloc_init(MEMORY[0x263F30DF8]);
    carDNDStatus = self->_carDNDStatus;
    self->_carDNDStatus = v3;
  }
  uint64_t v5 = self->_carDNDStatus;

  return v5;
}

- (void)_setDefaultActivity:(id)a3
{
}

- (BOOL)isLifetimeDescriptionsUpdatingEnabled
{
  return self->_lifetimeDescriptionsUpdatingEnabled;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_defaultActivity, 0);
  objc_storeStrong((id *)&self->_activeActivity, 0);
  objc_storeStrong((id *)&self->_availableActivities, 0);
  objc_storeStrong((id *)&self->_carDNDStatus, 0);
  objc_storeStrong((id *)&self->_locationsToSuggestedActivitiesOrNull, 0);
  objc_storeStrong((id *)&self->_activitySuggestionClient, 0);
  objc_storeStrong((id *)&self->_lifetimeOfActiveActivity, 0);
  objc_storeStrong((id *)&self->_activeLifetimeDetailsCollection, 0);
  objc_storeStrong((id *)&self->_allActivitiesByIdentifier, 0);
  objc_storeStrong((id *)&self->_activeStateUpdate, 0);
  objc_storeStrong((id *)&self->_activeModeAssertion, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_stateService, 0);
  objc_storeStrong((id *)&self->_lifetimeDetailsProvider, 0);

  objc_storeStrong((id *)&self->_modeSelectionService, 0);
}

- (id)activityWithIdentifier:(id)a3
{
  v13[4] = *(id *)MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v5 = self;
    objc_sync_enter(v5);
    allActivitiesByIdentifier = v5->_allActivitiesByIdentifier;
    if (!allActivitiesByIdentifier)
    {
      uint64_t v7 = [(FCActivityManager *)v5 _modeSelectionService];
      v13[0] = 0;
      uint64_t v8 = [v7 allModesWithError:v13];
      id v9 = v13[0];
      if (v9)
      {
        char v10 = (id)FCLogActivities;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          [(FCActivityManager *)v5 description];
          objc_claimAutoreleasedReturnValue();
          -[FCActivityManager _availableActivities]();
        }
      }
      else
      {
        char v10 = [v8 allObjects];
        [(FCActivityManager *)v5 _updateActivitiesWithModes:v10];
      }

      allActivitiesByIdentifier = v5->_allActivitiesByIdentifier;
    }
    uint64_t v11 = [(NSMutableDictionary *)allActivitiesByIdentifier objectForKey:v4];
    objc_sync_exit(v5);
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

+ (id)newActivityManagerWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc((Class)a1) _initWithIdentifier:v4];

  return v5;
}

+ (id)newActivityManager
{
  return (id)[a1 newActivityManagerWithIdentifier:@"DEFAULT"];
}

- (void)setActiveActivity:(id)a3
{
}

- (void)setActiveActivity:(id)a3 reason:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 activityUniqueIdentifier];
  id v8 = [(FCActivityManager *)self _activityForUniqueIdentifier:v7];

  [(FCActivityManager *)self _setActiveActivity:v8 withLifetime:0 reason:v6];
}

- (void)setActiveActivity:(id)a3 withLifetime:(id)a4 reason:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  char v10 = [a3 activityUniqueIdentifier];
  id v13 = [(FCActivityManager *)self _activityForUniqueIdentifier:v10];

  uint64_t v11 = [v9 lifetimeIdentifier];

  uint64_t v12 = [(FCActivityManager *)self _lifetimeForLifetimeDetailsIdentifier:v11 ofActivity:v13];

  [(FCActivityManager *)self _setActiveActivity:v13 withLifetime:v12 reason:v8];
}

- (void)promotePlaceholderActivity:(id)a3
{
  modeSelectionService = self->_modeSelectionService;
  id v4 = [a3 activityIdentifier];
  uint64_t v5 = 0;
  [(DNDModeSelectionService *)modeSelectionService promotePlaceholderWithModeIdentifier:v4 error:&v5];
}

void __41__FCActivityManager__initWithIdentifier___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = a2;
  id v4 = [v2 description];
  int v5 = 138543362;
  id v6 = v4;
  _os_log_debug_impl(&dword_21F173000, v3, OS_LOG_TYPE_DEBUG, "[%{public}@] Added selection update listener", (uint8_t *)&v5, 0xCu);
}

void __41__FCActivityManager__initWithIdentifier___block_invoke_cold_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [(id)OUTLINED_FUNCTION_4() description];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21F173000, v5, v6, "[%{public}@] Error adding selection update listener: %{public}@", v7, v8, v9, v10, v11);
}

- (void)setActivity:(void *)a1 active:(void *)a2 withLifetime:reason:.cold.1(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 description];
  OUTLINED_FUNCTION_12(&dword_21F173000, v5, v6, "[%{public}@] Activating a nil activity isn't permitted – ignoring", v7, v8, v9, v10, 2u);
}

- (void)_updateCreationDateOfActivity:.cold.1()
{
  OUTLINED_FUNCTION_7();
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = v1;
  id v3 = [(id)OUTLINED_FUNCTION_4() description];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_11(&dword_21F173000, v0, v4, "[%{public}@] Failed to obtain mode configuration for activity: %{public}@", v5);
}

void __64__FCActivityManager__notifyObserversOfAvailableActivitiesChange__block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = a2;
  uint64_t v6 = [v4 description];
  uint64_t v7 = [NSString stringWithFormat:@"%@: %p", objc_opt_class(), a3];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_11(&dword_21F173000, v5, v8, "[%{public}@] Notifying observer of available activities change: %{public}@", v9);
}

- (void)_updateActivitiesWithModes:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_21F173000, log, OS_LOG_TYPE_DEBUG, "[%{public}@] Available activities didn't change from cached value", buf, 0xCu);
}

- (void)_availableActivities
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_3(&dword_21F173000, v6, v4, "[%{public}@] Encountered error requesting available activities: %{public}@", v5);
}

void __43__FCActivityManager__updateActiveActivity___block_invoke_2_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a2;
  uint64_t v6 = [v4 description];
  uint64_t v7 = NSString;
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = a3;
  uint64_t v8 = [v7 stringWithFormat:@"%@: %p"];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_21F173000, v9, v10, "[%{public}@] Notifying observer of active activity change: observer: %{public}@; active activity: %{public}@",
    v11,
    v12,
    v13,
    v14,
    v15,
    v16,
    v17);
}

void __43__FCActivityManager__updateActiveActivity___block_invoke_96_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a2;
  uint64_t v6 = [v4 description];
  uint64_t v7 = [NSString stringWithFormat:@"%@: %p", objc_opt_class(), a3];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_11(&dword_21F173000, v5, v8, "[%{public}@] [Deprecated] Notifying observer of active mode change: %{public}@", v9);
}

void __51__FCActivityManager__setLifetimeForActiveActivity___block_invoke_2_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a2;
  uint64_t v6 = [v4 description];
  uint64_t v7 = NSString;
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = a3;
  uint64_t v8 = [v7 stringWithFormat:@"%@: %p"];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_21F173000, v9, v10, "[%{public}@] Notifying observer of active lifetime change: observer: %{public}@; lifetime: %{public}@",
    v11,
    v12,
    v13,
    v14,
    v15,
    v16,
    v17);
}

- (void)_setActiveActivity:(void *)a1 withLifetime:(void *)a2 reason:(uint64_t)a3 .cold.1(void *a1, void *a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a1;
  uint64_t v6 = [a2 description];
  int v8 = 138543618;
  int v9 = v6;
  __int16 v10 = 2114;
  uint64_t v11 = a3;
  OUTLINED_FUNCTION_3(&dword_21F173000, v5, v7, "[%{public}@] Encountered error deactivating all activites: %{public}@", (uint8_t *)&v8);
}

void __60__FCActivityManager__setActiveActivity_withLifetime_reason___block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)OUTLINED_FUNCTION_4() description];
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_1(&dword_21F173000, v5, v6, "[%{public}@] Failed to retrieve dndLifetimeDetails from provided lifetime: %{public}@", v7, v8, v9, v10, v11);
}

- (void)_deactivateActivity:(void *)a1 reason:(void *)a2 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 description];
  OUTLINED_FUNCTION_12(&dword_21F173000, v5, v6, "[%{public}@] Encountered error deactivating activity: no active mode assertion", v7, v8, v9, v10, 2u);
}

- (void)_deactivateActivity:reason:.cold.2()
{
  OUTLINED_FUNCTION_7();
  id v2 = v1;
  id v3 = [(id)OUTLINED_FUNCTION_4() description];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21F173000, v4, v5, "[%{public}@] Encountered error deactivating activity: '%{public}@' isn't the active activity", v6, v7, v8, v9, v10);
}

- (void)_deactivateActivity:reason:.cold.3()
{
  OUTLINED_FUNCTION_7();
  id v2 = v1;
  id v3 = [(id)OUTLINED_FUNCTION_4() description];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21F173000, v4, v5, "[%{public}@] Encountered error deactivating activity: %{public}@", v6, v7, v8, v9, v10);
}

void __65__FCActivityManager__notifyObserversOfLifetimeChangeForActivity___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a2;
  uint64_t v6 = [v4 description];
  uint64_t v7 = NSString;
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = a3;
  uint64_t v8 = [v7 stringWithFormat:@"%@: %p"];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_21F173000, v9, v10, "[%{public}@] Notifying observer of lifetime descriptions change for activity: observer: %{public}@; activity: %{public}@",
    v11,
    v12,
    v13,
    v14,
    v15,
    v16,
    v17);
}

- (void)_updateActivity:withLifetimeDescriptions:.cold.1()
{
  OUTLINED_FUNCTION_7();
  id v2 = v1;
  id v3 = [(id)OUTLINED_FUNCTION_4() description];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21F173000, v4, v5, "[%{public}@] Lifetime descriptions can't be updated for activity: %{public}@", v6, v7, v8, v9, v10);
}

void __71__FCActivityManager__updateLifetimesAlternativeDescriptionForActivity___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = a2;
  uint64_t v6 = [v4 description];
  OUTLINED_FUNCTION_9();
  __int16 v9 = v7;
  uint64_t v10 = a3;
  _os_log_error_impl(&dword_21F173000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] Encountered error fetching car automatic DND preference: activity: %{public}@; error: %{public}@",
    v8,
    0x20u);
}

void __58__FCActivityManager__updateSuggestedActivity_forLocation___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [(id)OUTLINED_FUNCTION_4() description];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_11(&dword_21F173000, v2, v5, "[%{public}@] Notifying observer of suggested activity change: %{public}@", v6);
}

- (void)_updateActivitySuggestion:.cold.1()
{
  OUTLINED_FUNCTION_7();
  id v2 = v1;
  id v3 = [(id)OUTLINED_FUNCTION_4() description];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21F173000, v4, v5, "[%{public}@] Failed to find activity for suggestion: %{public}@", v6, v7, v8, v9, v10);
}

@end
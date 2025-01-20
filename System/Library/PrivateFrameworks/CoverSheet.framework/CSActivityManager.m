@interface CSActivityManager
+ (id)sharedInstance;
- (ACActivityCenter)activityCenter;
- (BOOL)_itemIsNowPlaying:(id)a3;
- (BOOL)_shouldHandleActivityWithContentUpdate:(id)a3;
- (BOOL)_shouldSetDefaultBackgroundForViewController:(id)a3;
- (CSActivityManager)init;
- (CSListItemManaging)itemManager;
- (CSListItemSection)section;
- (DMFApplicationPolicyMonitor)applicationPolicyMonitor;
- (NSMutableArray)hiddenItems;
- (NSMutableDictionary)activityHostViewControllersByActivityIdentifier;
- (NSMutableDictionary)activityIdentifiersToSupplemantaryItems;
- (NSMutableDictionary)activityItemsByBundleId;
- (NSMutableDictionary)bundleIdentifiersToItems;
- (NSMutableDictionary)descriptorByActivityIdentifier;
- (double)_relevanceScoreForItemWithViewController:(id)a3;
- (id)_appNameForBundleIdentifier:(id)a3;
- (id)_authorizationActionsForOptionsType:(int64_t)a3 item:(id)a4 configuration:(id)a5;
- (id)_backgroundTintColorForUserInterfaceStyle:(int64_t)a3;
- (id)_buildConfigurationFromViewController:(id)a3;
- (id)_createdDateForItemWithViewController:(id)a3;
- (id)_latestActivityCreationDateForGroupingIdentifier:(id)a3;
- (id)_primaryActionTitleForAuthorizationOptionsType:(int64_t)a3;
- (id)_secondaryActionTitleForAuthorizationOptionsType:(int64_t)a3;
- (id)_summaryTextForAuthorizationOptionsType:(int64_t)a3 appName:(id)a4;
- (id)_textColorForUserInterfaceStyle:(int64_t)a3;
- (id)itemsGroupSortComparator;
- (id)itemsViewControllerSortComparator;
- (unint64_t)itemCount;
- (void)_addActivityListItemForContentUpdate:(id)a3;
- (void)_addAppActivitiesRecordForBundleId:(id)a3 activityItem:(id)a4;
- (void)_clearAuthorizationOptionsIfNecessaryForGroupingIdentifier:(id)a3;
- (void)_endAllActivitiesForBundleId:(id)a3;
- (void)_handleActivityExceedingReducedPushBudgetWithIdentifier:(id)a3;
- (void)_hostShouldCancelTouchesWithIdentifier:(id)a3;
- (void)_removeActivityWithContentUpdate:(id)a3;
- (void)_removeAppActivitiesRecordForBundleId:(id)a3 activityItem:(id)a4;
- (void)_sendAnalyticsEventWithName:(id)a3 payloadBuilder:(id)a4;
- (void)_setActivitiesEnabled:(BOOL)a3 forBundleId:(id)a4;
- (void)_setFrequentUpdatesEnabled:(BOOL)a3 forBundleId:(id)a4;
- (void)_setHidden:(BOOL)a3 forItem:(id)a4;
- (void)_significantUserInteractionBeganForIdentifier:(id)a3;
- (void)_significantUserInteractionEndedForIdentifier:(id)a3;
- (void)_unlockAndLaunchAppIfPossible:(id)a3 withAction:(id)a4;
- (void)_updateActivityIfNeededWithContentUpdate:(id)a3;
- (void)_updateAllApplicationMonitoringPolicies;
- (void)_updateForScreenTimeLimitForBundleId:(id)a3 policy:(id)a4;
- (void)activityHostViewController:(id)a3 requestsLaunchWithAction:(id)a4;
- (void)activityHostViewControllerAudioCategoriesDisablingVolumeHUDDidChange:(id)a3;
- (void)activityHostViewControllerBackgroundTintColorDidChange:(id)a3;
- (void)activityHostViewControllerHostShouldCancelTouches:(id)a3;
- (void)activityHostViewControllerSignificantUserInteractionBegan:(id)a3;
- (void)activityHostViewControllerSignificantUserInteractionEnded:(id)a3;
- (void)activityHostViewControllerTextColorDidChange:(id)a3;
- (void)addActivityWithContentUpdate:(id)a3;
- (void)dealloc;
- (void)didAddNewSceneHostEnvironment;
- (void)handleActivityExceedingReducedPushBudgetForIdentifier:(id)a3;
- (void)handleRemovedItems:(id)a3;
- (void)removeActivityWithContentUpdate:(id)a3;
- (void)restrictsTouches:(BOOL)a3 onHostedSceneInViewController:(id)a4;
- (void)restrictsTouchesOnAllHostedScenes:(BOOL)a3;
- (void)setActivityCenter:(id)a3;
- (void)setActivityHidden:(BOOL)a3 forIdentifier:(id)a4;
- (void)setActivityHostViewControllersByActivityIdentifier:(id)a3;
- (void)setActivityIdentifiersToSupplemantaryItems:(id)a3;
- (void)setActivityItemsByBundleId:(id)a3;
- (void)setBundleIdentifiersToItems:(id)a3;
- (void)setDescriptorByActivityIdentifier:(id)a3;
- (void)setHiddenItems:(id)a3;
- (void)setItemManager:(id)a3;
- (void)updateActivityWithContentUpdate:(id)a3;
@end

@implementation CSActivityManager

- (CSActivityManager)init
{
  v16.receiver = self;
  v16.super_class = (Class)CSActivityManager;
  v2 = [(CSActivityManager *)&v16 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    activityIdentifiersToSupplemantaryItems = v2->_activityIdentifiersToSupplemantaryItems;
    v2->_activityIdentifiersToSupplemantaryItems = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    activityItemsByBundleId = v2->_activityItemsByBundleId;
    v2->_activityItemsByBundleId = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    hiddenItems = v2->_hiddenItems;
    v2->_hiddenItems = v7;

    uint64_t v9 = objc_opt_new();
    descriptorByActivityIdentifier = v2->_descriptorByActivityIdentifier;
    v2->_descriptorByActivityIdentifier = (NSMutableDictionary *)v9;

    uint64_t v11 = objc_opt_new();
    activityHostViewControllersByActivityIdentifier = v2->_activityHostViewControllersByActivityIdentifier;
    v2->_activityHostViewControllersByActivityIdentifier = (NSMutableDictionary *)v11;

    uint64_t v13 = objc_opt_new();
    activityCenter = v2->_activityCenter;
    v2->_activityCenter = (ACActivityCenter *)v13;
  }
  return v2;
}

- (void)dealloc
{
  [(NSMutableDictionary *)self->_descriptorByActivityIdentifier removeAllObjects];
  descriptorByActivityIdentifier = self->_descriptorByActivityIdentifier;
  self->_descriptorByActivityIdentifier = 0;

  [(NSMutableDictionary *)self->_activityHostViewControllersByActivityIdentifier removeAllObjects];
  activityHostViewControllersByActivityIdentifier = self->_activityHostViewControllersByActivityIdentifier;
  self->_activityHostViewControllersByActivityIdentifier = 0;

  v5.receiver = self;
  v5.super_class = (Class)CSActivityManager;
  [(CSActivityManager *)&v5 dealloc];
}

+ (id)sharedInstance
{
  if (sharedInstance_once != -1) {
    dispatch_once(&sharedInstance_once, &__block_literal_global_23);
  }
  v2 = (void *)sharedInstance___instance;

  return v2;
}

uint64_t __35__CSActivityManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(CSActivityManager);
  uint64_t v1 = sharedInstance___instance;
  sharedInstance___instance = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)addActivityWithContentUpdate:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = SBLogCoverSheetActivities();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [v4 identifier];
    int v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1D839D000, v5, OS_LOG_TYPE_DEFAULT, "Activity started: %@", (uint8_t *)&v7, 0xCu);
  }
  if ([(CSActivityManager *)self _shouldHandleActivityWithContentUpdate:v4]) {
    [(CSActivityManager *)self _addActivityWithContentUpdate:v4];
  }
}

- (void)updateActivityWithContentUpdate:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = SBLogCoverSheetActivities();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [v4 identifier];
    int v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1D839D000, v5, OS_LOG_TYPE_DEFAULT, "Activity updated: %@", (uint8_t *)&v7, 0xCu);
  }
  if ([(CSActivityManager *)self _shouldHandleActivityWithContentUpdate:v4]) {
    [(CSActivityManager *)self _updateActivityIfNeededWithContentUpdate:v4];
  }
}

- (void)removeActivityWithContentUpdate:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = SBLogCoverSheetActivities();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [v4 identifier];
    int v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1D839D000, v5, OS_LOG_TYPE_DEFAULT, "Activity dismissed: %@", (uint8_t *)&v7, 0xCu);
  }
  if ([(CSActivityManager *)self _shouldHandleActivityWithContentUpdate:v4]) {
    [(CSActivityManager *)self _removeActivityWithContentUpdate:v4];
  }
}

- (void)setActivityHidden:(BOOL)a3 forIdentifier:(id)a4
{
  BOOL v4 = a3;
  id v6 = [(NSMutableDictionary *)self->_activityIdentifiersToSupplemantaryItems objectForKey:a4];
  [(CSActivityManager *)self _setHidden:v4 forItem:v6];
}

- (void)handleActivityExceedingReducedPushBudgetForIdentifier:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = SBLogCoverSheetActivities();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1D839D000, v5, OS_LOG_TYPE_DEFAULT, "Activity exceeded reduced push budget: %@", (uint8_t *)&v6, 0xCu);
  }

  [(CSActivityManager *)self _handleActivityExceedingReducedPushBudgetWithIdentifier:v4];
}

- (CSListItemSection)section
{
  v2 = [[CSListItemSection alloc] initWithIdentifier:@"LiveActivities"];

  return v2;
}

- (unint64_t)itemCount
{
  return [(NSMutableDictionary *)self->_activityIdentifiersToSupplemantaryItems count];
}

- (void)handleRemovedItems:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * v8) identifier];
        v10 = [(NSMutableDictionary *)self->_activityIdentifiersToSupplemantaryItems objectForKey:v9];

        if (v10) {
          [(ACActivityCenter *)self->_activityCenter endActivity:v9];
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (id)itemsGroupSortComparator
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__CSActivityManager_itemsGroupSortComparator__block_invoke;
  v4[3] = &unk_1E6ADAAD0;
  objc_copyWeak(&v5, &location);
  v2 = (void *)MEMORY[0x1D9487300](v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

  return v2;
}

uint64_t __45__CSActivityManager_itemsGroupSortComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && ([v5 isEqualToString:v6] & 1) == 0)
  {
    unint64_t v10 = [&unk_1F306BB30 indexOfObject:v5];
    unint64_t v11 = [&unk_1F306BB30 indexOfObject:v6];
    if (v11 == 0x7FFFFFFFFFFFFFFFLL || v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v11 == 0x7FFFFFFFFFFFFFFFLL || v10 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v10 == 0x7FFFFFFFFFFFFFFFLL)
        {
          long long v12 = [WeakRetained _latestActivityCreationDateForGroupingIdentifier:v5];
          long long v13 = [WeakRetained _latestActivityCreationDateForGroupingIdentifier:v6];
          uint64_t v8 = [v12 compare:v13];
        }
        else
        {
          uint64_t v8 = -1;
        }
      }
      else if (v11 < v10)
      {
        uint64_t v8 = 1;
      }
      else
      {
        uint64_t v8 = -1;
      }
    }
    else
    {
      uint64_t v8 = 1;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)itemsViewControllerSortComparator
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__CSActivityManager_itemsViewControllerSortComparator__block_invoke;
  v4[3] = &unk_1E6ADAAF8;
  objc_copyWeak(&v5, &location);
  v2 = (void *)MEMORY[0x1D9487300](v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

  return v2;
}

uint64_t __54__CSActivityManager_itemsViewControllerSortComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _relevanceScoreForItemWithViewController:v5];
    double v10 = v9;
    [v8 _relevanceScoreForItemWithViewController:v6];
    if (v10 >= v11)
    {
      if (v10 == v11)
      {
        long long v13 = [v8 _createdDateForItemWithViewController:v5];
        uint64_t v14 = [v8 _createdDateForItemWithViewController:v6];
        v15 = (void *)v14;
        uint64_t v12 = 0;
        if (v13 && v14) {
          uint64_t v12 = [v13 compare:v14];
        }
      }
      else
      {
        uint64_t v12 = -1;
      }
    }
    else
    {
      uint64_t v12 = 1;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (void)restrictsTouches:(BOOL)a3 onHostedSceneInViewController:(id)a4
{
  BOOL v4 = a3;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = [(NSMutableDictionary *)self->_activityItemsByBundleId allValues];
  uint64_t v20 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v20)
  {
    uint64_t v19 = *(void *)v27;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v27 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = v7;
        uint64_t v8 = *(void **)(*((void *)&v26 + 1) + 8 * v7);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v9 = v8;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v23;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v23 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
              id v15 = [v14 contentHost];
              if (v15 == v6)
              {
                uint64_t v16 = [v14 contentHost];
                char v17 = objc_opt_respondsToSelector();

                if ((v17 & 1) == 0) {
                  continue;
                }
                id v15 = [v14 contentHost];
                [v15 restrictsTouchesOnHostedScene:v4];
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
          }
          while (v11);
        }

        uint64_t v7 = v21 + 1;
      }
      while (v21 + 1 != v20);
      uint64_t v20 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v20);
  }
}

- (void)restrictsTouchesOnAllHostedScenes:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  BOOL v4 = [(CSActivityManager *)self activityIdentifiersToSupplemantaryItems];
  id v5 = [v4 allValues];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = [v10 contentHost];
        char v12 = objc_opt_respondsToSelector();

        if (v12)
        {
          long long v13 = [v10 contentHost];
          [v13 restrictsTouchesOnHostedScene:v3];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (void)activityHostViewController:(id)a3 requestsLaunchWithAction:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 activitySceneDescriptor];
  id v9 = [v8 activityDescriptor];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__CSActivityManager_activityHostViewController_requestsLaunchWithAction___block_invoke;
  v11[3] = &unk_1E6ADAB20;
  id v12 = v9;
  id v10 = v9;
  [(CSActivityManager *)self _sendAnalyticsEventWithName:@"com.apple.activitykit.activity" payloadBuilder:v11];
  [(CSActivityManager *)self _unlockAndLaunchAppIfPossible:v7 withAction:v6];
}

id __73__CSActivityManager_activityHostViewController_requestsLaunchWithAction___block_invoke(uint64_t a1)
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v6[0] = @"activityId";
  v2 = [*(id *)(a1 + 32) activityIdentifier];
  v7[0] = v2;
  v6[1] = @"bundleId";
  BOOL v3 = [*(id *)(a1 + 32) platterTargetBundleIdentifier];
  v6[2] = @"eventType";
  v7[1] = v3;
  v7[2] = @"appLaunch-platter";
  BOOL v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:3];

  return v4;
}

- (void)activityHostViewControllerBackgroundTintColorDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [v4 activitySceneDescriptor];
  id v6 = [v5 activityIdentifier];

  id v7 = [(NSMutableDictionary *)self->_activityIdentifiersToSupplemantaryItems objectForKeyedSubscript:v6];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = [v7 configuration];
    uint64_t v10 = objc_opt_class();
    id v11 = v9;
    if (v10)
    {
      if (objc_opt_isKindOfClass()) {
        id v12 = v11;
      }
      else {
        id v12 = 0;
      }
    }
    else
    {
      id v12 = 0;
    }
    id v13 = v12;

    long long v14 = [v4 backgroundTintColor];
    long long v15 = [v4 textColor];
    if ([(CSActivityManager *)self _shouldSetDefaultBackgroundForViewController:v4])
    {
      long long v16 = [v4 traitCollection];
      uint64_t v17 = [v16 userInterfaceStyle];

      uint64_t v18 = [(CSActivityManager *)self _backgroundTintColorForUserInterfaceStyle:v17];

      uint64_t v19 = [(CSActivityManager *)self _textColorForUserInterfaceStyle:v17];

      long long v15 = (void *)v19;
      long long v14 = (void *)v18;
    }
    [v13 setTintColor:v14];
    [v13 setTextColor:v15];
    [v8 setConfiguration:v13];
    uint64_t v20 = SBLogCoverSheetActivities();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      -[CSActivityManager activityHostViewControllerBackgroundTintColorDidChange:]();
    }

    [(CSListItemManaging *)self->_itemManager updateItem:v8];
  }
}

- (void)activityHostViewControllerTextColorDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [v4 activitySceneDescriptor];
  id v6 = [v5 activityIdentifier];

  id v7 = [(NSMutableDictionary *)self->_activityIdentifiersToSupplemantaryItems objectForKeyedSubscript:v6];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = [v7 configuration];
    uint64_t v10 = objc_opt_class();
    id v11 = v9;
    if (v10)
    {
      if (objc_opt_isKindOfClass()) {
        id v12 = v11;
      }
      else {
        id v12 = 0;
      }
    }
    else
    {
      id v12 = 0;
    }
    id v13 = v12;

    long long v14 = [v4 textColor];
    if (!v14)
    {
      if ([(CSActivityManager *)self _shouldSetDefaultBackgroundForViewController:v4])
      {
        long long v15 = [v4 traitCollection];
        uint64_t v16 = [v15 userInterfaceStyle];

        long long v14 = [(CSActivityManager *)self _textColorForUserInterfaceStyle:v16];
      }
      else
      {
        long long v14 = 0;
      }
    }
    [v13 setTextColor:v14];
    [v8 setConfiguration:v13];
    uint64_t v17 = SBLogCoverSheetActivities();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[CSActivityManager activityHostViewControllerTextColorDidChange:]();
    }

    [(CSListItemManaging *)self->_itemManager updateItem:v8];
  }
}

- (void)activityHostViewControllerHostShouldCancelTouches:(id)a3
{
  id v4 = [a3 activitySceneDescriptor];
  id v5 = [v4 activityIdentifier];

  [(CSActivityManager *)self _hostShouldCancelTouchesWithIdentifier:v5];
}

- (void)activityHostViewControllerSignificantUserInteractionBegan:(id)a3
{
  id v4 = [a3 activitySceneDescriptor];
  id v5 = [v4 activityIdentifier];

  [(CSActivityManager *)self _significantUserInteractionBeganForIdentifier:v5];
}

- (void)activityHostViewControllerSignificantUserInteractionEnded:(id)a3
{
  id v4 = [a3 activitySceneDescriptor];
  id v5 = [v4 activityIdentifier];

  [(CSActivityManager *)self _significantUserInteractionEndedForIdentifier:v5];
}

- (void)activityHostViewControllerAudioCategoriesDisablingVolumeHUDDidChange:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 activitySceneDescriptor];
  id v5 = [v4 activityIdentifier];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = [(CSActivityManager *)self activityIdentifiersToSupplemantaryItems];
  id v7 = [v6 allValues];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v13 = [v12 identifier];
        int v14 = [v13 isEqualToString:v5];

        if (v14)
        {
          long long v15 = [v12 contentHost];
          uint64_t v16 = self;
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass) {
            [v15 reevaluateAudioCategoriesDisablingVolumeHUD];
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }
}

- (void)_hostShouldCancelTouchesWithIdentifier:(id)a3
{
  id v4 = [(NSMutableDictionary *)self->_activityIdentifiersToSupplemantaryItems objectForKeyedSubscript:a3];
  [(CSListItemManaging *)self->_itemManager cancelTouchesForItem:v4];
}

- (void)_significantUserInteractionBeganForIdentifier:(id)a3
{
  id v4 = [(NSMutableDictionary *)self->_activityIdentifiersToSupplemantaryItems objectForKeyedSubscript:a3];
  [(CSListItemManaging *)self->_itemManager significantUserInteractionBeganForItem:v4];
}

- (void)_significantUserInteractionEndedForIdentifier:(id)a3
{
  id v4 = [(NSMutableDictionary *)self->_activityIdentifiersToSupplemantaryItems objectForKeyedSubscript:a3];
  [(CSListItemManaging *)self->_itemManager significantUserInteractionEndedForItem:v4];
}

- (void)_unlockAndLaunchAppIfPossible:(id)a3 withAction:(id)a4
{
  v27[3] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 activityIdentifier];
  uint64_t v8 = [v6 activitySceneDescriptor];

  uint64_t v9 = [v8 activityDescriptor];
  uint64_t v10 = [v9 platterTargetBundleIdentifier];

  if (v10)
  {
    id v11 = (void *)MEMORY[0x1E4F62460];
    v26[0] = *MEMORY[0x1E4F62388];
    if (v5)
    {
      id v25 = v5;
      id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
    }
    else
    {
      id v12 = (void *)MEMORY[0x1E4F1CBF0];
    }
    uint64_t v14 = *MEMORY[0x1E4F62398];
    v27[0] = v12;
    v27[1] = MEMORY[0x1E4F1CC38];
    uint64_t v15 = *MEMORY[0x1E4F623A0];
    v26[1] = v14;
    v26[2] = v15;
    v27[2] = MEMORY[0x1E4F1CC38];
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:3];
    id v13 = [v11 optionsWithDictionary:v16];

    if (v5) {
    uint64_t v17 = SBLogCoverSheetActivities();
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543619;
      long long v22 = v7;
      __int16 v23 = 2113;
      id v24 = v5;
      _os_log_impl(&dword_1D839D000, v17, OS_LOG_TYPE_DEFAULT, "Activity[%{public}@] Sending open application request for %{private}@", buf, 0x16u);
    }

    long long v18 = [MEMORY[0x1E4F62468] serviceWithDefaultShellEndpoint];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __62__CSActivityManager__unlockAndLaunchAppIfPossible_withAction___block_invoke;
    v19[3] = &unk_1E6AD96B0;
    id v20 = v7;
    [v18 openApplication:v10 withOptions:v13 completion:v19];
  }
  else
  {
    id v13 = SBLogCoverSheetActivities();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[CSActivityManager _unlockAndLaunchAppIfPossible:withAction:]((uint64_t)v7, v13);
    }
  }
}

void __62__CSActivityManager__unlockAndLaunchAppIfPossible_withAction___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = SBLogCoverSheetActivities();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __62__CSActivityManager__unlockAndLaunchAppIfPossible_withAction___block_invoke_cold_1(a1, (uint64_t)v4, v6);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138543362;
    uint64_t v9 = v7;
    _os_log_impl(&dword_1D839D000, v6, OS_LOG_TYPE_DEFAULT, "Activity[%{public}@] Open application succeeded.", (uint8_t *)&v8, 0xCu);
  }
}

- (void)_removeActivityWithContentUpdate:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 identifier];
  id v5 = [(NSMutableDictionary *)self->_activityHostViewControllersByActivityIdentifier objectForKey:v4];
  if (v5)
  {
    id v6 = *MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543362;
      id v13 = v4;
      _os_log_impl(&dword_1D839D000, v6, OS_LOG_TYPE_DEFAULT, "Activity[%{public}@] finished, removing from the list...", (uint8_t *)&v12, 0xCu);
    }
    uint64_t v7 = SBLogCoverSheetActivities();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543362;
      id v13 = v4;
      _os_log_impl(&dword_1D839D000, v7, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] removes activity view controller from CoverSheet", (uint8_t *)&v12, 0xCu);
    }

    int v8 = [(NSMutableDictionary *)self->_activityIdentifiersToSupplemantaryItems objectForKey:v4];
    uint64_t v9 = [(NSMutableDictionary *)self->_activityIdentifiersToSupplemantaryItems objectForKey:v4];

    if (v9)
    {
      [(CSListItemManaging *)self->_itemManager removeItem:v8];
      [(NSMutableDictionary *)self->_activityIdentifiersToSupplemantaryItems removeObjectForKey:v4];
      [v5 invalidate];
      if ([(CSActivityManager *)self _itemIsNowPlaying:v8]) {
        [(CSListItemManaging *)self->_itemManager setNowPlayingItem:0];
      }
      uint64_t v10 = [(NSMutableDictionary *)self->_descriptorByActivityIdentifier objectForKey:v4];
      id v11 = [v10 platterTargetBundleIdentifier];
      [(CSActivityManager *)self _removeAppActivitiesRecordForBundleId:v11 activityItem:v8];
    }
    [(NSMutableDictionary *)self->_descriptorByActivityIdentifier removeObjectForKey:v4];
    [(NSMutableDictionary *)self->_activityHostViewControllersByActivityIdentifier removeObjectForKey:v4];
  }
  else
  {
    int v8 = SBLogCoverSheetActivities();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543362;
      id v13 = v4;
      _os_log_impl(&dword_1D839D000, v8, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] found no activity view controller to remove in CoverSheet", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (void)_updateActivityIfNeededWithContentUpdate:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 identifier];
  id v6 = [(NSMutableDictionary *)self->_activityIdentifiersToSupplemantaryItems objectForKeyedSubscript:v5];
  uint64_t v7 = [v4 content];

  [v7 relevanceScore];
  double v9 = v8;

  [v6 relevanceScore];
  if (v10 != v9)
  {
    id v11 = SBLogCoverSheetActivities();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543874;
      id v13 = v5;
      __int16 v14 = 2114;
      uint64_t v15 = v6;
      __int16 v16 = 2050;
      double v17 = v9;
      _os_log_impl(&dword_1D839D000, v11, OS_LOG_TYPE_DEFAULT, "Activity[%{public}@] Relevance score did change: %{public}@ to %{public}f", (uint8_t *)&v12, 0x20u);
    }

    [v6 setRelevanceScore:v9];
    [(CSListItemManaging *)self->_itemManager updateItem:v6];
  }
}

- (void)_addActivityListItemForContentUpdate:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 identifier];
  id v6 = [(NSMutableDictionary *)self->_activityHostViewControllersByActivityIdentifier objectForKey:v5];
  uint64_t v7 = SBLogCoverSheetActivities();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138543362;
      v31 = v5;
      _os_log_impl(&dword_1D839D000, v7, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] has already a host view controller in CoverSheet, updating activity if needed", buf, 0xCu);
    }

    [(CSActivityManager *)self _updateActivityIfNeededWithContentUpdate:v4];
  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 138543362;
      v31 = v5;
      _os_log_impl(&dword_1D839D000, v7, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] creating activity view controller", buf, 0xCu);
    }

    double v9 = [v4 descriptor];
    [(NSMutableDictionary *)self->_descriptorByActivityIdentifier setObject:v9 forKey:v5];
    double v10 = [v9 platterTargetBundleIdentifier];
    id v20 = [MEMORY[0x1E4FA7CB0] defaultMetrics];
    id v11 = [MEMORY[0x1E4F49758] activityHostViewControllerWithDescriptor:v9 sceneType:0 metricsRequest:v20];
    [v11 setShouldShareTouchesWithHost:1];
    [v11 setDelegate:self];
    objc_initWeak((id *)buf, self);
    uint64_t v29 = objc_opt_class();
    int v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __58__CSActivityManager__addActivityListItemForContentUpdate___block_invoke;
    v27[3] = &unk_1E6ADAB48;
    objc_copyWeak(&v28, (id *)buf);
    id v13 = (id)[v11 registerForTraitChanges:v12 withHandler:v27];

    uint64_t v14 = MEMORY[0x1E4F14428];
    id v15 = MEMORY[0x1E4F14428];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __58__CSActivityManager__addActivityListItemForContentUpdate___block_invoke_2;
    v21[3] = &unk_1E6ADAB70;
    v21[4] = self;
    id v16 = v5;
    id v22 = v16;
    id v17 = v10;
    id v23 = v17;
    id v18 = v11;
    id v24 = v18;
    id v25 = v4;
    id v19 = v9;
    id v26 = v19;
    [v18 ensureContent:v14 queue:v21 completion:1.79769313e308];

    [(NSMutableDictionary *)self->_activityHostViewControllersByActivityIdentifier setObject:v18 forKey:v16];
    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);
  }
}

void __58__CSActivityManager__addActivityListItemForContentUpdate___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained activityHostViewControllerBackgroundTintColorDidChange:v3];
}

void __58__CSActivityManager__addActivityListItemForContentUpdate___block_invoke_2(uint64_t a1, uint64_t a2)
{
  BSDispatchQueueAssertMain();
  if (!a2
    && [*(id *)(*(void *)(a1 + 32) + 72) isActivityActive:*(void *)(a1 + 40)])
  {
    id v20 = [[CSListItem alloc] initWithIdentifier:*(void *)(a1 + 40) groupingIdentifier:*(void *)(a1 + 48) sectionIdentifier:@"LiveActivities"];
    id v4 = [*(id *)(a1 + 56) activitySceneDescriptor];
    id v5 = [v4 activityDescriptor];
    id v6 = [v5 createdDate];
    [(CSListItem *)v20 setContentCreatedDate:v6];

    uint64_t v7 = [*(id *)(a1 + 64) content];
    [v7 relevanceScore];
    -[CSListItem setRelevanceScore:](v20, "setRelevanceScore:");

    BOOL v8 = [*(id *)(a1 + 32) _buildConfigurationFromViewController:*(void *)(a1 + 56)];
    double v9 = [*(id *)(a1 + 56) activitySceneDescriptor];
    double v10 = [v9 activityDescriptor];
    id v11 = [v10 presentationOptions];
    uint64_t v12 = [v11 authorizationOptionsType];

    if (v12 != 3)
    {
      [*(id *)(a1 + 32) _clearAuthorizationOptionsIfNecessaryForGroupingIdentifier:*(void *)(a1 + 48)];
      id v13 = [*(id *)(a1 + 32) _authorizationActionsForOptionsType:v12 item:v20 configuration:v8];
      [v8 setAuxiliaryOptionActions:v13];

      uint64_t v14 = *(void **)(a1 + 32);
      id v15 = [v14 _appNameForBundleIdentifier:*(void *)(a1 + 48)];
      id v16 = [v14 _summaryTextForAuthorizationOptionsType:v12 appName:v15];
      [v8 setAuxiliaryOptionsSummaryText:v16];
    }
    [(CSListItem *)v20 setConfiguration:v8];
    id v17 = [[CSActivityItemViewController alloc] initWithActivityHostViewController:*(void *)(a1 + 56)];
    [(CSActivityItemViewController *)v17 setSceneHostEnvironmentObserver:*(void *)(a1 + 32)];
    [(CSListItem *)v20 setContentHost:v17];
    id v18 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:*(void *)(a1 + 40)];

    if (!v18)
    {
      [*(id *)(*(void *)(a1 + 32) + 16) setObject:v20 forKey:*(void *)(a1 + 40)];
      [*(id *)(*(void *)(a1 + 32) + 8) addItem:v20];
      if ([*(id *)(a1 + 32) _itemIsNowPlaying:v20]) {
        [*(id *)(*(void *)(a1 + 32) + 8) setNowPlayingItem:v20];
      }
    }
    id v19 = [*(id *)(a1 + 72) platterTargetBundleIdentifier];
    [*(id *)(a1 + 32) _addAppActivitiesRecordForBundleId:v19 activityItem:v20];
  }
}

- (void)_handleActivityExceedingReducedPushBudgetWithIdentifier:(id)a3
{
  id v13 = [(NSMutableDictionary *)self->_activityIdentifiersToSupplemantaryItems objectForKey:a3];
  id v4 = [v13 groupingIdentifier];
  id v5 = [v13 configuration];
  uint64_t v6 = objc_opt_class();
  id v7 = v5;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      BOOL v8 = v7;
    }
    else {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }
  id v9 = v8;

  double v10 = [(CSActivityManager *)self _authorizationActionsForOptionsType:2 item:v13 configuration:v9];
  [v9 setAuxiliaryOptionActions:v10];

  id v11 = [(CSActivityManager *)self _appNameForBundleIdentifier:v4];
  uint64_t v12 = [(CSActivityManager *)self _summaryTextForAuthorizationOptionsType:2 appName:v11];
  [v9 setAuxiliaryOptionsSummaryText:v12];

  [v13 setConfiguration:v9];
  [(CSListItemManaging *)self->_itemManager updateItem:v13];
}

- (id)_appNameForBundleIdentifier:(id)a3
{
  id v3 = a3;
  id v9 = 0;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v3 allowPlaceholder:1 error:&v9];
  id v5 = v9;
  if (v4)
  {
    uint64_t v6 = [v4 localizedName];
  }
  else
  {
    id v7 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_ERROR)) {
      [(CSActivityManager *)(uint64_t)v3 _appNameForBundleIdentifier:v5];
    }
    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)_shouldSetDefaultBackgroundForViewController:(id)a3
{
  id v3 = a3;
  id v4 = [v3 activitySceneDescriptor];
  id v5 = [v4 activityDescriptor];
  uint64_t v6 = [v5 contentType];

  uint64_t v7 = [v3 backgroundTintColor];

  return (v7 | v6) == 0;
}

- (id)_buildConfigurationFromViewController:(id)a3
{
  id v4 = a3;
  id v5 = [v4 activitySceneDescriptor];
  uint64_t v6 = [v5 activityDescriptor];
  uint64_t v7 = [v6 platterTargetBundleIdentifier];

  BOOL v8 = [v4 backgroundTintColor];
  id v9 = [v4 textColor];
  if ([(CSActivityManager *)self _shouldSetDefaultBackgroundForViewController:v4])
  {
    double v10 = [v4 traitCollection];
    uint64_t v11 = [v10 userInterfaceStyle];

    uint64_t v12 = [(CSActivityManager *)self _backgroundTintColorForUserInterfaceStyle:v11];

    uint64_t v13 = [(CSActivityManager *)self _textColorForUserInterfaceStyle:v11];

    id v9 = (void *)v13;
    BOOL v8 = (void *)v12;
  }
  id v14 = objc_alloc_init(MEMORY[0x1E4FB38E8]);
  id v15 = [v4 activitySceneDescriptor];
  id v16 = [v15 activityDescriptor];

  id v17 = [v16 presentationOptions];
  char v18 = [v17 isUserDismissalAllowedOnLockScreen];

  if ((v18 & 1) == 0) {
    [v14 setPreventsUserDismissal:1];
  }
  if (v8) {
    uint64_t v19 = 22;
  }
  else {
    uint64_t v19 = 1;
  }
  [v14 setGroupingIdentifier:v7];
  [v14 setMaterialRecipe:v19];
  [v14 setTintColor:v8];
  [v14 setTextColor:v9];
  id v20 = [(CSActivityManager *)self _appNameForBundleIdentifier:v7];
  [v14 setGroupName:v20];

  [v14 setContainsUnmanagedContent:1];

  return v14;
}

- (id)_backgroundTintColorForUserInterfaceStyle:(int64_t)a3
{
  if (!a3 || a3 == 2)
  {
    self = [MEMORY[0x1E4F428B8] systemBlackColor];
  }
  else if (a3 == 1)
  {
    self = [MEMORY[0x1E4F428B8] systemWhiteColor];
  }

  return self;
}

- (id)_textColorForUserInterfaceStyle:(int64_t)a3
{
  if (!a3 || a3 == 2)
  {
    self = [MEMORY[0x1E4F428B8] systemWhiteColor];
  }
  else if (a3 == 1)
  {
    self = [MEMORY[0x1E4F428B8] systemBlackColor];
  }

  return self;
}

- (void)_setActivitiesEnabled:(BOOL)a3 forBundleId:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __55__CSActivityManager__setActivitiesEnabled_forBundleId___block_invoke;
  uint64_t v12 = &unk_1E6ADAB98;
  id v13 = v6;
  BOOL v14 = v4;
  id v7 = v6;
  [(CSActivityManager *)self _sendAnalyticsEventWithName:@"com.apple.springboard.activityAuthorizationChange" payloadBuilder:&v9];
  id v8 = objc_alloc_init(MEMORY[0x1E4F18128]);
  objc_msgSend(v8, "setActivitiesEnabled:forBundleId:source:", v4, v7, 0, v9, v10, v11, v12);
}

id __55__CSActivityManager__setActivitiesEnabled_forBundleId___block_invoke(uint64_t a1)
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v5[0] = *(void *)(a1 + 32);
  v4[0] = @"bundleId";
  v4[1] = @"enabled";
  uint64_t v1 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  v4[2] = @"source";
  v5[1] = v1;
  v5[2] = @"platter chin";
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];

  return v2;
}

- (void)_setFrequentUpdatesEnabled:(BOOL)a3 forBundleId:(id)a4
{
  BOOL v4 = a3;
  id v5 = (objc_class *)MEMORY[0x1E4F18128];
  id v6 = a4;
  id v7 = objc_alloc_init(v5);
  [v7 setFrequentPushesEnabled:v4 forBundleId:v6];
}

- (id)_authorizationActionsForOptionsType:(int64_t)a3 item:(id)a4 configuration:(id)a5
{
  v34[2] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id val = a5;
  uint64_t v9 = [v8 groupingIdentifier];
  objc_initWeak(&location, self);
  objc_initWeak(&from, v8);
  objc_initWeak(&v31, val);
  uint64_t v10 = (void *)MEMORY[0x1E4F426E8];
  uint64_t v11 = [(CSActivityManager *)self _primaryActionTitleForAuthorizationOptionsType:a3];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __76__CSActivityManager__authorizationActionsForOptionsType_item_configuration___block_invoke;
  void v26[3] = &unk_1E6ADABC0;
  objc_copyWeak(&v28, &location);
  objc_copyWeak(&v29, &from);
  objc_copyWeak(v30, &v31);
  v30[1] = (id)a3;
  id v12 = v9;
  id v27 = v12;
  id v13 = [v10 actionWithTitle:v11 image:0 identifier:0 handler:v26];

  BOOL v14 = (void *)MEMORY[0x1E4F426E8];
  id v15 = [(CSActivityManager *)self _secondaryActionTitleForAuthorizationOptionsType:a3];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __76__CSActivityManager__authorizationActionsForOptionsType_item_configuration___block_invoke_2;
  v21[3] = &unk_1E6ADABC0;
  objc_copyWeak(&v23, &location);
  objc_copyWeak(&v24, &from);
  objc_copyWeak(v25, &v31);
  v25[1] = (id)a3;
  id v16 = v12;
  id v22 = v16;
  id v17 = [v14 actionWithTitle:v15 image:0 identifier:0 handler:v21];

  v34[0] = v17;
  v34[1] = v13;
  char v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];

  objc_destroyWeak(v25);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&v23);

  objc_destroyWeak(v30);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&v31);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v18;
}

void __76__CSActivityManager__authorizationActionsForOptionsType_item_configuration___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained && v2 && v3)
  {
    unint64_t v4 = *(void *)(a1 + 64);
    if (v4 >= 2)
    {
      if (v4 == 2) {
        [WeakRetained _setFrequentUpdatesEnabled:1 forBundleId:*(void *)(a1 + 32)];
      }
    }
    else
    {
      [WeakRetained _setActivitiesEnabled:1 forBundleId:*(void *)(a1 + 32)];
    }
    [v3 setAuxiliaryOptionActions:0];
    [v3 setAuxiliaryOptionsSummaryText:0];
    [v2 setConfiguration:v3];
    id v5 = [WeakRetained itemManager];
    [v5 updateItem:v2];
  }
}

void __76__CSActivityManager__authorizationActionsForOptionsType_item_configuration___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained && v2 && v3)
  {
    unint64_t v4 = *(void *)(a1 + 64);
    if (v4 >= 2)
    {
      if (v4 != 2)
      {
LABEL_9:
        [v3 setAuxiliaryOptionActions:0];
        [v3 setAuxiliaryOptionsSummaryText:0];
        [v2 setConfiguration:v3];
        id v8 = [WeakRetained itemManager];
        [v8 updateItem:v2];

        goto LABEL_10;
      }
      uint64_t v7 = *(void *)(a1 + 32);
      id v5 = (void *)(a1 + 32);
      [WeakRetained _setFrequentUpdatesEnabled:0 forBundleId:v7];
    }
    else
    {
      uint64_t v6 = *(void *)(a1 + 32);
      id v5 = (void *)(a1 + 32);
      [WeakRetained _setActivitiesEnabled:0 forBundleId:v6];
    }
    [WeakRetained _endAllActivitiesForBundleId:*v5];
    goto LABEL_9;
  }
LABEL_10:
}

- (id)_primaryActionTitleForAuthorizationOptionsType:(int64_t)a3
{
  switch(a3)
  {
    case 2:
      id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      unint64_t v4 = v3;
      id v5 = @"ACTIVITY_LIST_ITEM_FREQUENT_UPDATES_PROMPT_ALLOW_ACTION_TITLE";
      goto LABEL_7;
    case 1:
      id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      unint64_t v4 = v3;
      id v5 = @"ACTIVITY_LIST_ITEM_SECOND_PROMPT_ALLOW_ACTION_TITLE";
      goto LABEL_7;
    case 0:
      id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      unint64_t v4 = v3;
      id v5 = @"ACTIVITY_LIST_ITEM_FIRST_PROMPT_ALLOW_ACTION_TITLE";
LABEL_7:
      uint64_t v6 = [v3 localizedStringForKey:v5 value:&stru_1F3020248 table:@"CoverSheet"];

      goto LABEL_9;
  }
  uint64_t v6 = 0;
LABEL_9:

  return v6;
}

- (id)_secondaryActionTitleForAuthorizationOptionsType:(int64_t)a3
{
  if ((unint64_t)a3 >= 2)
  {
    if (a3 != 2)
    {
      uint64_t v6 = 0;
      goto LABEL_7;
    }
    id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    unint64_t v4 = v3;
    id v5 = @"ACTIVITY_LIST_ITEM_FREQUENT_UPDATES_PROMPT_DISABLE_ACTION_TITLE";
  }
  else
  {
    id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    unint64_t v4 = v3;
    id v5 = @"ACTIVITY_LIST_ITEM_DISABLE_ACTION_TITLE";
  }
  uint64_t v6 = [v3 localizedStringForKey:v5 value:&stru_1F3020248 table:@"CoverSheet"];

LABEL_7:

  return v6;
}

- (id)_summaryTextForAuthorizationOptionsType:(int64_t)a3 appName:(id)a4
{
  id v5 = a4;
  switch(a3)
  {
    case 2:
      uint64_t v6 = NSString;
      uint64_t v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v8 = v7;
      uint64_t v9 = @"ACTIVITY_LIST_ITEM_FREQUENT_UPDATES_SUBTITLE";
      goto LABEL_7;
    case 1:
      uint64_t v6 = NSString;
      uint64_t v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v8 = v7;
      uint64_t v9 = @"ACTIVITY_LIST_ITEM_SECOND_PROMPT_SUBTITLE";
      goto LABEL_7;
    case 0:
      uint64_t v6 = NSString;
      uint64_t v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v8 = v7;
      uint64_t v9 = @"ACTIVITY_LIST_ITEM_FIRST_PROMPT_SUBTITLE";
LABEL_7:
      uint64_t v10 = [v7 localizedStringForKey:v9 value:&stru_1F3020248 table:@"CoverSheet"];
      uint64_t v11 = objc_msgSend(v6, "stringWithFormat:", v10, v5);

      goto LABEL_9;
  }
  uint64_t v11 = 0;
LABEL_9:

  return v11;
}

- (id)_latestActivityCreationDateForGroupingIdentifier:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_activityItemsByBundleId objectForKey:a3];
  unint64_t v4 = [v3 sortedArrayUsingComparator:&__block_literal_global_99];
  id v5 = [v4 firstObject];
  uint64_t v6 = [v5 contentCreatedDate];

  return v6;
}

BOOL __70__CSActivityManager__latestActivityCreationDateForGroupingIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 contentCreatedDate];
  uint64_t v6 = [v4 contentCreatedDate];

  return v5 > v6;
}

- (double)_relevanceScoreForItemWithViewController:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = [(CSActivityManager *)self activityIdentifiersToSupplemantaryItems];
  uint64_t v6 = [v5 allValues];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  double v8 = 0.0;
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v13 = [v12 contentHost];

        if (v13 == v4)
        {
          [v12 relevanceScore];
          double v8 = v14;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (id)_createdDateForItemWithViewController:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(CSActivityManager *)self activityIdentifiersToSupplemantaryItems];
  uint64_t v6 = [v5 allValues];

  uint64_t v7 = (void *)[v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v11 = [v10 contentHost];

        if (v11 == v4)
        {
          uint64_t v7 = [v10 contentCreatedDate];
          goto LABEL_11;
        }
      }
      uint64_t v7 = (void *)[v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (void)_sendAnalyticsEventWithName:(id)a3 payloadBuilder:(id)a4
{
}

- (void)_clearAuthorizationOptionsIfNecessaryForGroupingIdentifier:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = [(NSMutableDictionary *)self->_activityItemsByBundleId objectForKey:a3];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v10 = [v9 configuration];
        uint64_t v11 = objc_opt_class();
        id v12 = v10;
        if (v11)
        {
          if (objc_opt_isKindOfClass()) {
            long long v13 = v12;
          }
          else {
            long long v13 = 0;
          }
        }
        else
        {
          long long v13 = 0;
        }
        id v14 = v13;

        [v14 setAuxiliaryOptionActions:0];
        long long v15 = [(CSActivityManager *)self itemManager];
        [v15 updateItem:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
}

- (void)_endAllActivitiesForBundleId:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = [(NSMutableDictionary *)self->_activityItemsByBundleId objectForKey:a3];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        activityCenter = self->_activityCenter;
        uint64_t v10 = [*(id *)(*((void *)&v11 + 1) + 8 * v8) identifier];
        [(ACActivityCenter *)activityCenter endActivity:v10];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)_updateAllApplicationMonitoringPolicies
{
  BSDispatchQueueAssertMain();
  id v3 = [(CSActivityManager *)self applicationPolicyMonitor];
  id v4 = [(NSMutableDictionary *)self->_activityItemsByBundleId allKeys];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__CSActivityManager__updateAllApplicationMonitoringPolicies__block_invoke;
  v5[3] = &unk_1E6ADAC30;
  void v5[4] = self;
  [v3 requestPoliciesForBundleIdentifiers:v4 completionHandler:v5];
}

void __60__CSActivityManager__updateAllApplicationMonitoringPolicies__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_copyWeak(&v8, &location);
  id v7 = v5;
  BSDispatchMain();

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __60__CSActivityManager__updateAllApplicationMonitoringPolicies__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = *(void **)(a1 + 32);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __60__CSActivityManager__updateAllApplicationMonitoringPolicies__block_invoke_3;
    void v4[3] = &unk_1E6ADAC08;
    void v4[4] = WeakRetained;
    [v3 enumerateKeysAndObjectsUsingBlock:v4];
  }
}

uint64_t __60__CSActivityManager__updateAllApplicationMonitoringPolicies__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _updateForScreenTimeLimitForBundleId:a2 policy:a3];
}

- (void)_updateForScreenTimeLimitForBundleId:(id)a3 policy:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(NSMutableDictionary *)self->_activityItemsByBundleId objectForKey:a3];
  uint64_t v8 = [v6 integerValue];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        descriptorByActivityIdentifier = self->_descriptorByActivityIdentifier;
        uint64_t v16 = objc_msgSend(v14, "identifier", (void)v18);
        long long v17 = [(NSMutableDictionary *)descriptorByActivityIdentifier objectForKey:v16];

        if ([v17 contentType] != 1) {
          [(CSActivityManager *)self _setHidden:v8 != 0 forItem:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }
}

- (void)_addAppActivitiesRecordForBundleId:(id)a3 activityItem:(id)a4
{
  id v12 = a3;
  activityItemsByBundleId = self->_activityItemsByBundleId;
  id v7 = a4;
  uint64_t v8 = [(NSMutableDictionary *)activityItemsByBundleId allKeys];
  char v9 = [v8 containsObject:v12];

  if (v9)
  {
    id v10 = [(NSMutableDictionary *)self->_activityItemsByBundleId objectForKey:v12];
  }
  else
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  uint64_t v11 = v10;
  [v10 addObject:v7];

  [(NSMutableDictionary *)self->_activityItemsByBundleId setObject:v11 forKey:v12];
}

- (void)_removeAppActivitiesRecordForBundleId:(id)a3 activityItem:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(NSMutableDictionary *)self->_activityItemsByBundleId objectForKey:v9];

  if (v7)
  {
    uint64_t v8 = [(NSMutableDictionary *)self->_activityItemsByBundleId objectForKey:v9];
    if ([v8 containsObject:v6])
    {
      [v8 removeObject:v6];
      [(NSMutableDictionary *)self->_activityItemsByBundleId setObject:v8 forKey:v9];
    }
  }
}

- (BOOL)_itemIsNowPlaying:(id)a3
{
  id v3 = [a3 groupingIdentifier];
  char v4 = [v3 isEqualToString:@"com.apple.MediaRemoteUI"];

  return v4;
}

- (void)_setHidden:(BOOL)a3 forItem:(id)a4
{
  BOOL v4 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    if (v4)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __40__CSActivityManager__setHidden_forItem___block_invoke;
      v10[3] = &unk_1E6ADAB20;
      id v8 = v6;
      id v11 = v8;
      [(CSActivityManager *)self _sendAnalyticsEventWithName:@"com.apple.activitykit.activity" payloadBuilder:v10];
      [(CSListItemManaging *)self->_itemManager removeItem:v8];
      if (([(NSMutableArray *)self->_hiddenItems containsObject:v8] & 1) == 0) {
        [(NSMutableArray *)self->_hiddenItems addObject:v8];
      }
    }
    else
    {
      [(CSListItemManaging *)self->_itemManager addItem:v6];
      [(NSMutableArray *)self->_hiddenItems removeObject:v7];
    }
  }
  else
  {
    id v9 = SBLogCoverSheetActivities();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      BOOL v13 = v4;
      _os_log_impl(&dword_1D839D000, v9, OS_LOG_TYPE_DEFAULT, "No item found, _setHidden: %{BOOL}u", buf, 8u);
    }
  }
}

id __40__CSActivityManager__setHidden_forItem___block_invoke(uint64_t a1)
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v6[0] = @"activityId";
  id v2 = [*(id *)(a1 + 32) identifier];
  v7[0] = v2;
  v6[1] = @"bundleId";
  id v3 = [*(id *)(a1 + 32) groupingIdentifier];
  v6[2] = @"eventType";
  v7[1] = v3;
  v7[2] = @"hidden";
  BOOL v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:3];

  return v4;
}

- (BOOL)_shouldHandleActivityWithContentUpdate:(id)a3
{
  id v3 = [a3 descriptor];
  BOOL v4 = [v3 presentationOptions];

  id v5 = [v4 destinations];
  char v6 = objc_msgSend(v5, "bs_containsObjectPassingTest:", &__block_literal_global_107);

  return v6;
}

BOOL __60__CSActivityManager__shouldHandleActivityWithContentUpdate___block_invoke(uint64_t a1, void *a2)
{
  return [a2 destination] == 0;
}

- (void)didAddNewSceneHostEnvironment
{
}

- (CSListItemManaging)itemManager
{
  return self->_itemManager;
}

- (void)setItemManager:(id)a3
{
}

- (NSMutableDictionary)activityIdentifiersToSupplemantaryItems
{
  return self->_activityIdentifiersToSupplemantaryItems;
}

- (void)setActivityIdentifiersToSupplemantaryItems:(id)a3
{
}

- (NSMutableDictionary)bundleIdentifiersToItems
{
  return self->_bundleIdentifiersToItems;
}

- (void)setBundleIdentifiersToItems:(id)a3
{
}

- (NSMutableDictionary)activityItemsByBundleId
{
  return self->_activityItemsByBundleId;
}

- (void)setActivityItemsByBundleId:(id)a3
{
}

- (NSMutableDictionary)descriptorByActivityIdentifier
{
  return self->_descriptorByActivityIdentifier;
}

- (void)setDescriptorByActivityIdentifier:(id)a3
{
}

- (NSMutableDictionary)activityHostViewControllersByActivityIdentifier
{
  return self->_activityHostViewControllersByActivityIdentifier;
}

- (void)setActivityHostViewControllersByActivityIdentifier:(id)a3
{
}

- (NSMutableArray)hiddenItems
{
  return self->_hiddenItems;
}

- (void)setHiddenItems:(id)a3
{
}

- (DMFApplicationPolicyMonitor)applicationPolicyMonitor
{
  return self->_applicationPolicyMonitor;
}

- (ACActivityCenter)activityCenter
{
  return self->_activityCenter;
}

- (void)setActivityCenter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityCenter, 0);
  objc_storeStrong((id *)&self->_applicationPolicyMonitor, 0);
  objc_storeStrong((id *)&self->_hiddenItems, 0);
  objc_storeStrong((id *)&self->_activityHostViewControllersByActivityIdentifier, 0);
  objc_storeStrong((id *)&self->_descriptorByActivityIdentifier, 0);
  objc_storeStrong((id *)&self->_activityItemsByBundleId, 0);
  objc_storeStrong((id *)&self->_bundleIdentifiersToItems, 0);
  objc_storeStrong((id *)&self->_activityIdentifiersToSupplemantaryItems, 0);

  objc_storeStrong((id *)&self->_itemManager, 0);
}

- (void)activityHostViewControllerBackgroundTintColorDidChange:.cold.1()
{
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_1_3(&dword_1D839D000, v0, v1, "Activity[%{public}@] Background tint color did change: %{public}@");
}

- (void)activityHostViewControllerTextColorDidChange:.cold.1()
{
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_1_3(&dword_1D839D000, v0, v1, "Activity[%{public}@] Text color did change: %{public}@");
}

- (void)_unlockAndLaunchAppIfPossible:(uint64_t)a1 withAction:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D839D000, a2, OS_LOG_TYPE_FAULT, "Activity[%{public}@] Unable to resolve container bundle identifier", (uint8_t *)&v2, 0xCu);
}

void __62__CSActivityManager__unlockAndLaunchAppIfPossible_withAction___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1D839D000, log, OS_LOG_TYPE_ERROR, "Activity[%{public}@] Open application failed: %{public}@", (uint8_t *)&v4, 0x16u);
}

- (void)_appNameForBundleIdentifier:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a2;
  __int16 v6 = [a3 localizedDescription];
  int v7 = 138543618;
  uint64_t v8 = a1;
  __int16 v9 = 2114;
  id v10 = v6;
  _os_log_error_impl(&dword_1D839D000, v5, OS_LOG_TYPE_ERROR, "Encountered error obtaining application name for bundle identifier %{public}@: %{public}@", (uint8_t *)&v7, 0x16u);
}

@end
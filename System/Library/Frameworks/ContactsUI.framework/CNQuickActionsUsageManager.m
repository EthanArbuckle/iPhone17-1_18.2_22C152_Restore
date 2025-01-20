@interface CNQuickActionsUsageManager
+ (BOOL)sortUsingCoreDuetAvailable;
+ (id)managerForContact:(id)a3;
- (BOOL)sortsWithDuet;
- (CNContact)contact;
- (CNQuickActionsUsageManager)init;
- (NSArray)cachedInteractions;
- (NSCountedSet)actionsUsageSet;
- (NSDate)cachedInteractionsDate;
- (NSMutableSet)enabledActionIdentifiers;
- (double)scoreForAction:(id)a3;
- (id)sortedActions:(id)a3;
- (void)_updateDuetInteractionsIfNeeded;
- (void)actionPerformed:(id)a3;
- (void)cacheEnabledStateForAction:(id)a3;
- (void)setActionsUsageSet:(id)a3;
- (void)setCachedInteractions:(id)a3;
- (void)setCachedInteractionsDate:(id)a3;
- (void)setContact:(id)a3;
- (void)setEnabledActionIdentifiers:(id)a3;
- (void)setSortsWithDuet:(BOOL)a3;
- (void)updateCachedEnabledStateForAction:(id)a3;
@end

@implementation CNQuickActionsUsageManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedInteractionsDate, 0);
  objc_storeStrong((id *)&self->_cachedInteractions, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_enabledActionIdentifiers, 0);

  objc_storeStrong((id *)&self->_actionsUsageSet, 0);
}

- (void)setCachedInteractionsDate:(id)a3
{
}

- (NSDate)cachedInteractionsDate
{
  return self->_cachedInteractionsDate;
}

- (void)setCachedInteractions:(id)a3
{
}

- (NSArray)cachedInteractions
{
  return self->_cachedInteractions;
}

- (void)setContact:(id)a3
{
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setEnabledActionIdentifiers:(id)a3
{
}

- (void)setActionsUsageSet:(id)a3
{
}

- (void)setSortsWithDuet:(BOOL)a3
{
  self->_sortsWithDuet = a3;
}

- (BOOL)sortsWithDuet
{
  return self->_sortsWithDuet;
}

- (id)sortedActions:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)[v4 mutableCopy];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ((objc_msgSend(v11, "enabled", (void)v13) & 1) == 0) {
          [v5 removeObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  if ([v5 count])
  {
    if ([(CNQuickActionsUsageManager *)self sortsWithDuet]) {
      [(CNQuickActionsUsageManager *)self _updateDuetInteractionsIfNeeded];
    }
    objc_msgSend(v5, "sortUsingComparator:", &__block_literal_global_26_56536, (void)v13);
  }

  return v5;
}

uint64_t __44__CNQuickActionsUsageManager_sortedActions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = v4;
  id v7 = v5;
  unint64_t v8 = [v6 score];
  if (v8 <= [v7 score])
  {
    unint64_t v10 = [v6 score];
    if (v10 >= [v7 score])
    {
      v11 = [v6 titleForContext:2];
      v12 = [v7 titleForContext:2];
      uint64_t v9 = [v11 compare:v12];
    }
    else
    {
      uint64_t v9 = 1;
    }
  }
  else
  {
    uint64_t v9 = -1;
  }

  return v9;
}

- (void)_updateDuetInteractionsIfNeeded
{
  v27[2] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1C9C8] date];
  id v4 = [(CNQuickActionsUsageManager *)self cachedInteractions];
  if (!v4
    || ([(CNQuickActionsUsageManager *)self cachedInteractionsDate],
        id v5 = objc_claimAutoreleasedReturnValue(),
        [v3 timeIntervalSinceDate:v5],
        double v7 = v6,
        v5,
        v4,
        v7 >= 5.0))
  {
    if (_updateDuetInteractionsIfNeeded_cn_once_token_1 != -1) {
      dispatch_once(&_updateDuetInteractionsIfNeeded_cn_once_token_1, &__block_literal_global_14_56540);
    }
    id v8 = (id)_updateDuetInteractionsIfNeeded_cn_once_object_1;
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x2050000000;
    uint64_t v9 = (void *)get_CDInteractionAdvisorSettingsClass_softClass;
    uint64_t v26 = get_CDInteractionAdvisorSettingsClass_softClass;
    if (!get_CDInteractionAdvisorSettingsClass_softClass)
    {
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __get_CDInteractionAdvisorSettingsClass_block_invoke;
      v22[3] = &unk_1E549AD00;
      v22[4] = &v23;
      __get_CDInteractionAdvisorSettingsClass_block_invoke((uint64_t)v22);
      uint64_t v9 = (void *)v24[3];
    }
    id v10 = v9;
    _Block_object_dispose(&v23, 8);
    v11 = [v10 interactionAdvisorSettingsDefault];
    v12 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1ED915BF0];
    [v11 setConstrainPersonIdType:v12];

    long long v13 = (void *)MEMORY[0x1E4F1CAD0];
    long long v14 = [(CNQuickActionsUsageManager *)self contact];
    long long v15 = [v14 identifier];
    v27[0] = v15;
    long long v16 = NSString;
    v17 = [(CNQuickActionsUsageManager *)self contact];
    uint64_t v18 = objc_msgSend(v16, "stringWithFormat:", @"%d", objc_msgSend(v17, "iOSLegacyIdentifier"));
    v27[1] = v18;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
    v20 = [v13 setWithArray:v19];
    [v11 setConstrainPersonIds:v20];

    v21 = [v8 adviseInteractionsUsingSettings:v11];
    [(CNQuickActionsUsageManager *)self setCachedInteractions:v21];
    [(CNQuickActionsUsageManager *)self setCachedInteractionsDate:v3];
  }
}

void __61__CNQuickActionsUsageManager__updateDuetInteractionsIfNeeded__block_invoke()
{
  uint64_t v5 = 0;
  double v6 = &v5;
  uint64_t v7 = 0x2050000000;
  v0 = (void *)get_CDInteractionAdvisorClass_softClass;
  uint64_t v8 = get_CDInteractionAdvisorClass_softClass;
  if (!get_CDInteractionAdvisorClass_softClass)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __get_CDInteractionAdvisorClass_block_invoke;
    v4[3] = &unk_1E549AD00;
    v4[4] = &v5;
    __get_CDInteractionAdvisorClass_block_invoke((uint64_t)v4);
    v0 = (void *)v6[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v5, 8);
  uint64_t v2 = [v1 interactionAdvisor];
  v3 = (void *)_updateDuetInteractionsIfNeeded_cn_once_object_1;
  _updateDuetInteractionsIfNeeded_cn_once_object_1 = v2;
}

- (void)updateCachedEnabledStateForAction:(id)a3
{
  id v4 = a3;
  [v4 setCached:1];
  id v6 = [(CNQuickActionsUsageManager *)self enabledActionIdentifiers];
  uint64_t v5 = [v4 globalIdentifier];
  objc_msgSend(v4, "setEnabled:", objc_msgSend(v6, "containsObject:", v5));
}

- (void)cacheEnabledStateForAction:(id)a3
{
  id v4 = a3;
  int v5 = [v4 enabled];
  id v7 = [(CNQuickActionsUsageManager *)self enabledActionIdentifiers];
  id v6 = [v4 globalIdentifier];

  if (v5) {
    [v7 addObject:v6];
  }
  else {
    [v7 removeObject:v6];
  }
}

- (double)scoreForAction:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(CNQuickActionsUsageManager *)self sortsWithDuet])
  {
    int v5 = [(CNQuickActionsUsageManager *)self cachedInteractions];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      double v9 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if ([v4 matchesDuetInteraction:v11])
          {
            [v11 score];
            double v9 = v9 + v12;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }
    else
    {
      double v9 = 0.0;
    }
  }
  else
  {
    int v5 = [(CNQuickActionsUsageManager *)self actionsUsageSet];
    long long v13 = [v4 globalIdentifier];
    double v9 = (double)(unint64_t)[v5 countForObject:v13];
  }
  return v9;
}

- (void)actionPerformed:(id)a3
{
  id v4 = a3;
  id v6 = [(CNQuickActionsUsageManager *)self actionsUsageSet];
  int v5 = [v4 globalIdentifier];

  [v6 addObject:v5];
  [(CNQuickActionsUsageManager *)self setCachedInteractions:0];
}

- (NSMutableSet)enabledActionIdentifiers
{
  enabledActionIdentifiers = self->_enabledActionIdentifiers;
  if (!enabledActionIdentifiers)
  {
    id v4 = [MEMORY[0x1E4F1CA80] set];
    int v5 = self->_enabledActionIdentifiers;
    self->_enabledActionIdentifiers = v4;

    enabledActionIdentifiers = self->_enabledActionIdentifiers;
  }

  return enabledActionIdentifiers;
}

- (NSCountedSet)actionsUsageSet
{
  actionsUsageSet = self->_actionsUsageSet;
  if (!actionsUsageSet)
  {
    id v4 = [MEMORY[0x1E4F28BD0] set];
    int v5 = self->_actionsUsageSet;
    self->_actionsUsageSet = v4;

    actionsUsageSet = self->_actionsUsageSet;
  }

  return actionsUsageSet;
}

- (CNQuickActionsUsageManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)CNQuickActionsUsageManager;
  uint64_t v2 = [(CNQuickActionsUsageManager *)&v4 init];
  -[CNQuickActionsUsageManager setSortsWithDuet:](v2, "setSortsWithDuet:", [(id)objc_opt_class() sortUsingCoreDuetAvailable]);
  return v2;
}

+ (BOOL)sortUsingCoreDuetAvailable
{
  if (sortUsingCoreDuetAvailable_onceToken != -1) {
    dispatch_once(&sortUsingCoreDuetAvailable_onceToken, &__block_literal_global_3_56575);
  }
  return sortUsingCoreDuetAvailable_enabled;
}

void __56__CNQuickActionsUsageManager_sortUsingCoreDuetAvailable__block_invoke()
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"CNQuickActionsSortedWithCoreDuet", (CFStringRef)*MEMORY[0x1E4F1D3B8], &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v5 = AppBooleanValue == 0;
  }
  else {
    BOOL v5 = 0;
  }
  char v6 = !v5;
  sortUsingCoreDuetAvailable_enabled = v6;
  if (v5)
  {
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNQuickActionsUsageManager.m", 67, 4, @"Missing entitlement for CoreDuet. Please add com.apple.coreduetd.allow to the entitlements of the app.", v1, v2, v3, v4, v9);
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
    uint64_t v8 = [v7 entitlementVerifier];
    sortUsingCoreDuetAvailable_enabled = [v8 currentProcessHasBooleanEntitlement:*MEMORY[0x1E4F5A228] error:0];
  }
}

+ (id)managerForContact:(id)a3
{
  id v3 = a3;
  if (managerForContact__onceToken != -1) {
    dispatch_once(&managerForContact__onceToken, &__block_literal_global_56585);
  }
  uint64_t v4 = [v3 identifier];
  BOOL v5 = [(id)managerForContact__mapTable objectForKey:v4];
  if (!v5)
  {
    BOOL v5 = objc_alloc_init(CNQuickActionsUsageManager);
    [(CNQuickActionsUsageManager *)v5 setContact:v3];
    [(id)managerForContact__mapTable setObject:v5 forKey:v4];
  }

  return v5;
}

void __48__CNQuickActionsUsageManager_managerForContact___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  uint64_t v1 = (void *)managerForContact__mapTable;
  managerForContact__mapTable = v0;
}

@end
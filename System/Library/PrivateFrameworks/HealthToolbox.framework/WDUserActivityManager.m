@interface WDUserActivityManager
- (BOOL)_restoreActivityFromPolicies:(id)a3;
- (BOOL)recordActivities;
- (NSMutableArray)policies;
- (WDUserActivityManager)init;
- (id)_userActivityWithType:(id)a3;
- (void)_resetActivities;
- (void)_restoreFromActivityChain:(id)a3;
- (void)_setCurrentNodeToResponder:(id)a3;
- (void)_userActivityWithTitle:(id)a3 keywords:(id)a4 activityType:(id)a5;
- (void)addPolicy:(id)a3;
- (void)changeActivityForResponder:(id)a3 activityDictionary:(id)a4 title:(id)a5 keywords:(id)a6;
- (void)decodeRestorableStateWithCoder:(id)a3;
- (void)encodeRestorableStateWithCoder:(id)a3;
- (void)restoreFromUserActivity:(id)a3;
- (void)setRecordActivities:(BOOL)a3;
- (void)setRootViewController:(id)a3;
- (void)transitionActivityForResponder:(id)a3 newResponder:(id)a4 transitionDictionary:(id)a5;
@end

@implementation WDUserActivityManager

- (WDUserActivityManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)WDUserActivityManager;
  v2 = [(WDUserActivityManager *)&v12 init];
  v3 = v2;
  if (v2)
  {
    rootViewController = v2->_rootViewController;
    v2->_rootViewController = 0;

    topNode = v3->_topNode;
    v3->_topNode = 0;

    currentNode = v3->_currentNode;
    v3->_currentNode = 0;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    indexedActivities = v3->_indexedActivities;
    v3->_indexedActivities = v7;

    v3->_recordActivities = 1;
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    policies = v3->_policies;
    v3->_policies = v9;
  }
  return v3;
}

- (void)setRootViewController:(id)a3
{
  id v9 = a3;
  objc_storeStrong((id *)&self->_rootViewController, a3);
  if ([(id)objc_opt_class() conformsToProtocol:&unk_26D30B610])
  {
    v5 = [[_WDActivityNode alloc] initWithResponder:self->_rootViewController];
    topNode = self->_topNode;
    self->_topNode = v5;

    v7 = self->_topNode;
    currentNode = self->_currentNode;
    self->_currentNode = v7;
  }
  else
  {
    currentNode = [MEMORY[0x263EFF940] exceptionWithName:@"_RootControllerNotResponderName" reason:@"The root view controller must implement the WDUserActivityResponder protocol" userInfo:0];
    [currentNode raise];
  }
}

- (void)changeActivityForResponder:(id)a3 activityDictionary:(id)a4 title:(id)a5 keywords:(id)a6
{
  id v16 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (self->_recordActivities)
  {
    v13 = [(_WDActivityNode *)self->_topNode changeActivityForResponder:v16 activityDictionary:v10];
    currentNode = self->_currentNode;
    self->_currentNode = v13;

    if (v11)
    {
      if (objc_opt_respondsToSelector())
      {
        v15 = [v16 uniqueUserActivityType];
        [(WDUserActivityManager *)self _userActivityWithTitle:v11 keywords:v12 activityType:v15];
      }
      else
      {
        [(WDUserActivityManager *)self _userActivityWithTitle:v11 keywords:v12 activityType:*MEMORY[0x263F09868]];
      }
    }
  }
}

- (void)transitionActivityForResponder:(id)a3 newResponder:(id)a4 transitionDictionary:(id)a5
{
  if (self->_recordActivities)
  {
    self->_currentNode = [(_WDActivityNode *)self->_topNode transitionActivityForResponder:a3 newResponder:a4 transitionDictionary:a5];
    MEMORY[0x270F9A758]();
  }
}

- (void)restoreFromUserActivity:(id)a3
{
  id v6 = a3;
  if (![(WDUserActivityManager *)self _restoreActivityFromPolicies:v6])
  {
    v4 = [v6 userInfo];
    v5 = [v4 objectForKey:@"_ActivityBreadcrumbKey"];
    if (v5) {
      [(WDUserActivityManager *)self _restoreFromActivityChain:v5];
    }
  }

  MEMORY[0x270F9A758]();
}

- (void)_resetActivities
{
  v3 = [[_WDActivityNode alloc] initWithResponder:self->_rootViewController];
  topNode = self->_topNode;
  self->_topNode = v3;

  objc_storeStrong((id *)&self->_currentNode, self->_topNode);
  indexedActivities = self->_indexedActivities;

  [(NSMutableDictionary *)indexedActivities removeAllObjects];
}

- (id)_userActivityWithType:(id)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  v4 = (objc_class *)MEMORY[0x263F018D0];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithActivityType:v5];

  [v6 setEligibleForHandoff:0];
  [v6 setEligibleForSearch:0];
  [v6 setEligibleForPublicIndexing:0];
  v7 = (void *)MEMORY[0x263EFFA08];
  v15[0] = @"_ActivityBreadcrumbKey";
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  id v9 = [v7 setWithArray:v8];

  [v6 setRequiredUserInfoKeys:v9];
  id v10 = [MEMORY[0x263EFF980] arrayWithCapacity:10];
  [(_WDActivityNode *)self->_topNode addActivitiesToArray:v10 currentNode:self->_currentNode];
  v13 = @"_ActivityBreadcrumbKey";
  v14 = v10;
  id v11 = [NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  [v6 setUserInfo:v11];

  return v6;
}

- (void)_userActivityWithTitle:(id)a3 keywords:(id)a4 activityType:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(NSMutableDictionary *)self->_indexedActivities objectForKey:v13];
  if (!v10)
  {
    id v11 = [(WDUserActivityManager *)self _userActivityWithType:v9];
    if (v11)
    {
      id v12 = v11;
      [v11 setEligibleForSearch:1];
      [v12 setTitle:v13];
      [v12 _setEligibleForPrediction:0];
      if (v8) {
        [v12 setKeywords:v8];
      }
      [v12 becomeCurrent];
      [(NSMutableDictionary *)self->_indexedActivities setObject:v12 forKey:v13];
    }
  }
}

- (void)_restoreFromActivityChain:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(WDUserActivityManager *)self _resetActivities];
  id v5 = [(_WDActivityNode *)self->_topNode responder];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    int v10 = 1;
    while (2)
    {
      uint64_t v11 = 0;
      char v12 = v10;
      v10 ^= v8;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * v11);
        if (v12)
        {
          [v5 applyChangeActivity:*(void *)(*((void *)&v17 + 1) + 8 * v11)];
          [(WDUserActivityManager *)self _setCurrentNodeToResponder:v5];
        }
        else
        {
          uint64_t v14 = [v5 applyTransitionActivity:*(void *)(*((void *)&v17 + 1) + 8 * v11)];

          id v5 = (void *)v14;
          if (!v14)
          {
            v15 = [NSString stringWithFormat:@"Transition failed for breadcrumb: %@ in chain %@", v13, v6, (void)v17];
            _HKInitializeLogging();
            id v16 = *MEMORY[0x263F09968];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_ERROR)) {
              -[WDUserActivityManager _restoreFromActivityChain:]((uint64_t)v15, v16);
            }

            id v5 = 0;
            goto LABEL_15;
          }
        }
        v12 ^= 1u;
        ++v11;
      }
      while (v8 != v11);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_15:
}

- (void)_setCurrentNodeToResponder:(id)a3
{
  id v4 = a3;
  currentNode = self->_currentNode;
  id v9 = v4;
  if (!currentNode
    || ([(_WDActivityNode *)currentNode responder],
        id v6 = (id)objc_claimAutoreleasedReturnValue(),
        v6,
        v6 != v9))
  {
    uint64_t v7 = [(_WDActivityNode *)self->_topNode changeActivityForResponder:v9 activityDictionary:0];
    uint64_t v8 = self->_currentNode;
    self->_currentNode = v7;
  }

  MEMORY[0x270F9A758]();
}

- (void)encodeRestorableStateWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInteger:801 forKey:@"_UserActivityVersionKey"];
  id v5 = [MEMORY[0x263EFF980] arrayWithCapacity:10];
  [(_WDActivityNode *)self->_topNode addActivitiesToArray:v5 currentNode:self->_currentNode];
  [v4 encodeObject:v5 forKey:@"_UserActivityBreadcrumbArrayKey"];
}

- (void)decodeRestorableStateWithCoder:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"_UserActivityVersionKey"];
  if (v5 == 801)
  {
    id v6 = [v4 decodeObjectForKey:@"_UserActivityBreadcrumbArrayKey"];
    [(WDUserActivityManager *)self _restoreFromActivityChain:v6];
    [(WDUserActivityManager *)self setRecordActivities:0];
  }
  else
  {
    uint64_t v7 = v5;
    _HKInitializeLogging();
    uint64_t v8 = *MEMORY[0x263F09968];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134218240;
      uint64_t v10 = v7;
      __int16 v11 = 2048;
      uint64_t v12 = 801;
      _os_log_impl(&dword_2210D2000, v8, OS_LOG_TYPE_DEFAULT, "User Activity Manager version mismatch: %ld != %ld", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (void)addPolicy:(id)a3
{
  id v5 = a3;
  id v4 = [(WDUserActivityManager *)self policies];
  if (([v4 containsObject:v5] & 1) == 0) {
    [v4 addObject:v5];
  }
}

- (BOOL)_restoreActivityFromPolicies:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = [(WDUserActivityManager *)self policies];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v10 decidesActivity:v4])
        {
          uint64_t v11 = [v10 activityChainForActivity:v4];
          if (v11)
          {
            uint64_t v13 = (void *)v11;
            [(WDUserActivityManager *)self _restoreFromActivityChain:v11];

            BOOL v12 = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 0;
LABEL_12:

  return v12;
}

- (BOOL)recordActivities
{
  return self->_recordActivities;
}

- (void)setRecordActivities:(BOOL)a3
{
  self->_recordActivities = a3;
}

- (NSMutableArray)policies
{
  return self->_policies;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policies, 0);
  objc_storeStrong((id *)&self->_indexedActivities, 0);
  objc_storeStrong((id *)&self->_currentNode, 0);
  objc_storeStrong((id *)&self->_topNode, 0);

  objc_storeStrong((id *)&self->_rootViewController, 0);
}

- (void)_restoreFromActivityChain:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2210D2000, a2, OS_LOG_TYPE_ERROR, "Restoration transition problem: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
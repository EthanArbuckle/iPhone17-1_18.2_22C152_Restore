@interface _DASSubmissionManager
+ (id)groupNameForActivity:(id)a3;
+ (id)pluginGroupNameForGroupName:(id)a3;
- (BOOL)shouldDelayGroupSubmissionOfActivity:(id)a3;
- (BOOL)shouldQueueActivity:(id)a3;
- (NSMutableDictionary)activityGroupQueue;
- (NSMutableDictionary)activityGroups;
- (NSMutableDictionary)submittedActivities;
- (OS_os_log)log;
- (_DASSubmissionManager)init;
- (_DASSubmissionRateLimiter)rateLimiter;
- (int)dastoolToken;
- (unint64_t)capacityForGroupName:(id)a3;
- (void)activityCanceled:(id)a3 withScheduler:(id)a4;
- (void)admitNextActivityAfterCompletionOf:(id)a3 withScheduler:(id)a4;
- (void)createActivityGroup:(id)a3;
- (void)dealloc;
- (void)handleCanceledActivity:(id)a3 withGroupName:(id)a4;
- (void)removeAllObjects;
- (void)setActivityGroupQueue:(id)a3;
- (void)setActivityGroups:(id)a3;
- (void)setDastoolToken:(int)a3;
- (void)setLog:(id)a3;
- (void)setRateLimiter:(id)a3;
- (void)setSubmittedActivities:(id)a3;
- (void)submitActivities:(id)a3 withScheduler:(id)a4;
- (void)submitActivity:(id)a3 inGroup:(id)a4 withScheduler:(id)a5;
- (void)submitActivity:(id)a3 withScheduler:(id)a4;
- (void)updateCapacity:(unint64_t)a3 forGroupName:(id)a4;
@end

@implementation _DASSubmissionManager

- (void)admitNextActivityAfterCompletionOf:(id)a3 withScheduler:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(id)objc_opt_class() groupNameForActivity:v6];
  if (v8)
  {
    v9 = self->_activityGroupQueue;
    objc_sync_enter(v9);
    v10 = [(NSMutableDictionary *)self->_submittedActivities objectForKeyedSubscript:v8];
    [v10 removeObject:v6];

    v11 = [(NSMutableDictionary *)self->_activityGroupQueue objectForKeyedSubscript:v8];
    v12 = [v11 popFirst];
    if (v12)
    {
      v13 = [(NSMutableDictionary *)self->_submittedActivities objectForKeyedSubscript:v8];
      [v13 addObject:v12];

      objc_sync_exit(v9);
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
      {
        int v15 = 138412290;
        v16 = v12;
        _os_log_impl(&dword_1B578B000, log, OS_LOG_TYPE_INFO, "ADMITTING delayed activity %@", (uint8_t *)&v15, 0xCu);
      }
      [v7 submitActivity:v12 inGroupWithName:v8];
    }
    else
    {

      objc_sync_exit(v9);
    }
  }
}

+ (id)groupNameForActivity:(id)a3
{
  id v3 = a3;
  v4 = [v3 groupName];
  if (v4)
  {
    if ([v3 requiresPlugin])
    {
      id v5 = [(id)objc_opt_class() pluginGroupNameForGroupName:v4];
    }
    else
    {
      id v5 = v4;
    }
    id v6 = v5;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (_DASSubmissionManager)init
{
  v17.receiver = self;
  v17.super_class = (Class)_DASSubmissionManager;
  v2 = [(_DASSubmissionManager *)&v17 init];
  if (v2)
  {
    uint64_t v3 = +[_DASSubmissionRateLimiter sharedLimiter];
    rateLimiter = v2->_rateLimiter;
    v2->_rateLimiter = (_DASSubmissionRateLimiter *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    submittedActivities = v2->_submittedActivities;
    v2->_submittedActivities = (NSMutableDictionary *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    activityGroupQueue = v2->_activityGroupQueue;
    v2->_activityGroupQueue = (NSMutableDictionary *)v7;

    uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
    activityGroups = v2->_activityGroups;
    v2->_activityGroups = (NSMutableDictionary *)v9;

    os_log_t v11 = os_log_create("com.apple.duetactivityscheduler", "submissionManager");
    log = v2->_log;
    v2->_log = (OS_os_log *)v11;

    v13 = dispatch_get_global_queue(-32768, 0);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __29___DASSubmissionManager_init__block_invoke;
    handler[3] = &unk_1E6112A98;
    v16 = v2;
    notify_register_dispatch("com.apple.dasd.dastool.list", &v2->_dastoolToken, v13, handler);
  }
  return v2;
}

- (void)submitActivity:(id)a3 withScheduler:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(_DASSubmissionRateLimiter *)self->_rateLimiter trackActivity:v6]
    || ![(_DASSubmissionManager *)self shouldDelayGroupSubmissionOfActivity:v6])
  {
    [v7 submitActivity:v6];
  }
  else
  {
    v8 = [(id)objc_opt_class() groupNameForActivity:v6];
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v10 = log;
      os_log_t v11 = [v6 shortDescription];
      int v12 = 138543874;
      id v13 = v6;
      __int16 v14 = 2112;
      int v15 = v11;
      __int16 v16 = 2114;
      objc_super v17 = v8;
      _os_log_impl(&dword_1B578B000, v10, OS_LOG_TYPE_DEFAULT, "Delaying submission of %{public}@ %@, group %{public}@ full", (uint8_t *)&v12, 0x20u);
    }
  }
}

- (void)activityCanceled:(id)a3 withScheduler:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [v9 groupName];

  if (v7)
  {
    v8 = [(id)objc_opt_class() groupNameForActivity:v9];
    [(_DASSubmissionManager *)self handleCanceledActivity:v9 withGroupName:v8];

    [(_DASSubmissionManager *)self admitNextActivityAfterCompletionOf:v9 withScheduler:v6];
  }
}

- (void)handleCanceledActivity:(id)a3 withGroupName:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = self->_activityGroupQueue;
  objc_sync_enter(v7);
  v8 = [(NSMutableDictionary *)self->_activityGroupQueue objectForKeyedSubscript:v6];
  objc_msgSend(v8, "removeObject:atPriority:", v9, objc_msgSend(v9, "schedulingPriority"));

  objc_sync_exit(v7);
}

- (BOOL)shouldDelayGroupSubmissionOfActivity:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 rateLimitConfigurationName];

  if (!v5)
  {
    id v7 = [(id)objc_opt_class() groupNameForActivity:v4];
    v8 = v7;
    if (!v7
      || ([v7 isEqualToString:_DASDefaultGroupName] & 1) != 0
      || ([v8 isEqualToString:_DASDefaultNetworkGroupName] & 1) != 0
      || ([v8 isEqualToString:_DASDefaultRemoteGroupName] & 1) != 0)
    {
      goto LABEL_11;
    }
    id v9 = [(id)objc_opt_class() pluginGroupNameForGroupName:_DASDefaultGroupName];
    if (![v8 isEqualToString:v9])
    {
      v10 = [(id)objc_opt_class() pluginGroupNameForGroupName:_DASDefaultNetworkGroupName];
      if (![v8 isEqualToString:v10])
      {
        int v12 = [(id)objc_opt_class() pluginGroupNameForGroupName:_DASDefaultRemoteGroupName];
        char v13 = [v8 isEqualToString:v12];

        if ((v13 & 1) == 0)
        {
          unint64_t v14 = [(_DASSubmissionManager *)self capacityForGroupName:v8];
          int v15 = self->_activityGroupQueue;
          objc_sync_enter(v15);
          __int16 v16 = [(NSMutableDictionary *)self->_submittedActivities objectForKeyedSubscript:v8];
          objc_super v17 = v16;
          if (v16)
          {
            unint64_t v18 = [v16 count];
            if ([(_DASSubmissionManager *)self shouldQueueActivity:v4]
              && v18 >= v14
              && v18 >= 0xF)
            {
              v19 = [(NSMutableDictionary *)self->_activityGroupQueue objectForKeyedSubscript:v8];
              if (!v19)
              {
                v19 = +[_DASPriorityQueue priorityQueue];
                [(NSMutableDictionary *)self->_activityGroupQueue setObject:v19 forKeyedSubscript:v8];
              }
              -[NSObject addObject:withPriority:](v19, "addObject:withPriority:", v4, [v4 schedulingPriority]);
              v20 = self->_log;
              if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSObject count](v19, "count"));
                int v25 = 138412546;
                v26 = v8;
                v28 = __int16 v27 = 2112;
                v21 = (void *)v28;
                _os_log_impl(&dword_1B578B000, (os_log_t)v20, OS_LOG_TYPE_DEFAULT, "Group %@ has %@ activities queued in framework", (uint8_t *)&v25, 0x16u);
              }
              char v22 = 1;
            }
            else
            {
              [v17 addObject:v4];
              v19 = self->_log;
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                v23 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v17, "count"));
                int v25 = 138412546;
                v26 = v23;
                __int16 v27 = 2112;
                uint64_t v28 = (uint64_t)v8;
                _os_log_impl(&dword_1B578B000, v19, OS_LOG_TYPE_DEFAULT, "Have submitted to daemon %@ activities in group %@", (uint8_t *)&v25, 0x16u);
              }
              char v22 = 0;
            }

            v24 = v17;
          }
          else
          {
            v24 = [MEMORY[0x1E4F1CA80] setWithObject:v4];
            [(NSMutableDictionary *)self->_submittedActivities setObject:v24 forKeyedSubscript:v8];
            char v22 = 0;
          }

          objc_sync_exit(v15);
          BOOL v6 = (v17 != 0) & v22;
          goto LABEL_12;
        }
LABEL_11:
        BOOL v6 = 0;
LABEL_12:

        goto LABEL_13;
      }
    }
    goto LABEL_11;
  }
  BOOL v6 = 0;
LABEL_13:

  return v6;
}

+ (id)pluginGroupNameForGroupName:(id)a3
{
  return (id)[a3 stringByAppendingString:@"-plugin"];
}

- (BOOL)shouldQueueActivity:(id)a3
{
  unint64_t v3 = [a3 schedulingPriority];
  return v3 < _DASSchedulingPriorityUserInitiated;
}

- (unint64_t)capacityForGroupName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self->_activityGroups;
  objc_sync_enter(v5);
  BOOL v6 = [(NSMutableDictionary *)self->_activityGroups objectForKeyedSubscript:v4];
  id v7 = v6;
  if (v6)
  {
    unint64_t v8 = [v6 unsignedIntegerValue];
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
      -[_DASSubmissionManager capacityForGroupName:]((uint64_t)v4, log);
    }
    unint64_t v8 = 15;
  }

  objc_sync_exit(v5);
  return v8;
}

- (void)dealloc
{
  int dastoolToken = self->_dastoolToken;
  if (dastoolToken) {
    notify_cancel(dastoolToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)_DASSubmissionManager;
  [(_DASSubmissionManager *)&v4 dealloc];
}

- (void)removeAllObjects
{
  [(_DASSubmissionRateLimiter *)self->_rateLimiter removeAll];
  obj = self->_activityGroupQueue;
  objc_sync_enter(obj);
  [(NSMutableDictionary *)self->_submittedActivities removeAllObjects];
  [(NSMutableDictionary *)self->_activityGroupQueue removeAllObjects];
  objc_sync_exit(obj);
}

- (void)updateCapacity:(unint64_t)a3 forGroupName:(id)a4
{
  id v11 = a4;
  if (v11)
  {
    BOOL v6 = self->_activityGroups;
    objc_sync_enter(v6);
    id v7 = [NSNumber numberWithUnsignedInteger:a3];
    [(NSMutableDictionary *)self->_activityGroups setObject:v7 forKeyedSubscript:v11];

    unint64_t v8 = [NSNumber numberWithUnsignedInteger:a3];
    activityGroups = self->_activityGroups;
    v10 = [(id)objc_opt_class() pluginGroupNameForGroupName:v11];
    [(NSMutableDictionary *)activityGroups setObject:v8 forKeyedSubscript:v10];

    objc_sync_exit(v6);
  }
}

- (void)createActivityGroup:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 maxConcurrent];
  id v6 = [v4 name];

  [(_DASSubmissionManager *)self updateCapacity:v5 forGroupName:v6];
}

- (void)submitActivities:(id)a3 withScheduler:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v17 = a4;
  id v7 = [v6 sortedArrayUsingComparator:&__block_literal_global_2];
  unint64_t v18 = v6;
  unint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        if ([(_DASSubmissionManager *)self shouldDelayGroupSubmissionOfActivity:v14])
        {
          int v15 = [(id)objc_opt_class() groupNameForActivity:v14];
          log = self->_log;
          if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543618;
            uint64_t v24 = v14;
            __int16 v25 = 2114;
            v26 = v15;
            _os_log_impl(&dword_1B578B000, log, OS_LOG_TYPE_INFO, "Delaying submission of %{public}@, group %{public}@ full", buf, 0x16u);
          }
        }
        else
        {
          [v8 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v11);
  }

  [v17 submitActivities:v8];
}

- (void)submitActivity:(id)a3 inGroup:(id)a4 withScheduler:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v9 maxConcurrent];
  uint64_t v12 = [v9 name];
  [(_DASSubmissionManager *)self updateCapacity:v11 forGroupName:v12];

  if ([(_DASSubmissionManager *)self shouldDelayGroupSubmissionOfActivity:v8])
  {
    char v13 = [(id)objc_opt_class() groupNameForActivity:v8];
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138543618;
      id v16 = v8;
      __int16 v17 = 2114;
      unint64_t v18 = v13;
      _os_log_impl(&dword_1B578B000, log, OS_LOG_TYPE_DEFAULT, "Delaying submission of %{public}@, group %{public}@ full", (uint8_t *)&v15, 0x16u);
    }
  }
  else
  {
    [v10 submitActivity:v8 inGroup:v9];
  }
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (NSMutableDictionary)activityGroupQueue
{
  return self->_activityGroupQueue;
}

- (void)setActivityGroupQueue:(id)a3
{
}

- (NSMutableDictionary)submittedActivities
{
  return self->_submittedActivities;
}

- (void)setSubmittedActivities:(id)a3
{
}

- (NSMutableDictionary)activityGroups
{
  return self->_activityGroups;
}

- (void)setActivityGroups:(id)a3
{
}

- (int)dastoolToken
{
  return self->_dastoolToken;
}

- (void)setDastoolToken:(int)a3
{
  self->_int dastoolToken = a3;
}

- (_DASSubmissionRateLimiter)rateLimiter
{
  return self->_rateLimiter;
}

- (void)setRateLimiter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rateLimiter, 0);
  objc_storeStrong((id *)&self->_activityGroups, 0);
  objc_storeStrong((id *)&self->_submittedActivities, 0);
  objc_storeStrong((id *)&self->_activityGroupQueue, 0);

  objc_storeStrong((id *)&self->_log, 0);
}

- (void)capacityForGroupName:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2112;
  uint64_t v5 = &unk_1F0E6ED28;
  _os_log_debug_impl(&dword_1B578B000, a2, OS_LOG_TYPE_DEBUG, "Could not find group with name %@, using capacity %@", (uint8_t *)&v2, 0x16u);
}

@end
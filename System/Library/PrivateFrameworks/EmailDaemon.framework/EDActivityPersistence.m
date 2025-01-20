@interface EDActivityPersistence
- (EDActivityHookResponder)activityHookResponder;
- (EDActivityPersistence)initWithHookResponder:(id)a3;
- (id)currentActivities;
- (id)startActivityOfType:(int64_t)a3 userInfo:(id)a4;
- (void)activityWithID:(id)a3 finishedWithError:(id)a4;
- (void)activityWithID:(id)a3 setCompletedCount:(int64_t)a4 totalCount:(int64_t)a5;
- (void)activityWithID:(id)a3 setUserInfoObject:(id)a4 forKey:(id)a5;
- (void)setActivityHookResponder:(id)a3;
@end

@implementation EDActivityPersistence

- (id)currentActivities
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = [(NSMutableDictionary *)self->_currentActivities allValues];
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (EDActivityPersistence)initWithHookResponder:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EDActivityPersistence;
  v6 = [(EDActivityPersistence *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_activityHookResponder, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    currentActivities = v7->_currentActivities;
    v7->_currentActivities = v8;
  }
  return v7;
}

- (id)startActivityOfType:(int64_t)a3 userInfo:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  os_unfair_lock_lock(&self->_lock);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v7 = [(NSMutableDictionary *)self->_currentActivities allValues];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v7);
        }
        objc_super v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ([v11 isEqualToActivityWithType:a3 userInfo:v6])
        {
          id v12 = v11;
          currentActivities = self->_currentActivities;
          v14 = [v12 objectID];
          [(NSMutableDictionary *)currentActivities setObject:0 forKeyedSubscript:v14];

          goto LABEL_11;
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  id v12 = 0;
LABEL_11:

  v15 = (void *)[objc_alloc(MEMORY[0x1E4F601E8]) initWithActivityType:a3 userInfo:v6];
  v16 = self->_currentActivities;
  v17 = [v15 objectID];
  [(NSMutableDictionary *)v16 setObject:v15 forKeyedSubscript:v17];

  os_unfair_lock_unlock(&self->_lock);
  if (v12)
  {
    activityHookResponder = self->_activityHookResponder;
    v19 = [v12 objectID];
    [(EDActivityHookResponder *)activityHookResponder removedActivityWithID:v19];
  }
  [(EDActivityHookResponder *)self->_activityHookResponder startedActivity:v15];

  return v15;
}

- (void)activityWithID:(id)a3 finishedWithError:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  os_unfair_lock_lock(&self->_lock);
  v7 = [(NSMutableDictionary *)self->_currentActivities objectForKeyedSubscript:v10];
  uint64_t v8 = v7;
  if (v7 && ([v7 finished], uint64_t v9 = objc_claimAutoreleasedReturnValue(), v9, !v9))
  {
    [v8 finishWithError:v6];
    if (([v8 needsPersistentHistory] & 1) == 0) {
      [(NSMutableDictionary *)self->_currentActivities setObject:0 forKeyedSubscript:v10];
    }

    os_unfair_lock_unlock(&self->_lock);
    [(EDActivityHookResponder *)self->_activityHookResponder activityWithID:v10 finishedWithError:v6];
  }
  else
  {

    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)activityWithID:(id)a3 setUserInfoObject:(id)a4 forKey:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  os_unfair_lock_lock(&self->_lock);
  id v10 = [(NSMutableDictionary *)self->_currentActivities objectForKeyedSubscript:v11];
  [v10 setUserInfoObject:v8 forKey:v9];

  os_unfair_lock_unlock(&self->_lock);
  [(EDActivityHookResponder *)self->_activityHookResponder activityWithID:v11 setUserInfoObject:v8 forKey:v9];
}

- (void)activityWithID:(id)a3 setCompletedCount:(int64_t)a4 totalCount:(int64_t)a5
{
  id v9 = a3;
  os_unfair_lock_lock(&self->_lock);
  id v8 = [(NSMutableDictionary *)self->_currentActivities objectForKeyedSubscript:v9];
  [v8 setCompletedCount:a4 totalCount:a5];

  os_unfair_lock_unlock(&self->_lock);
  [(EDActivityHookResponder *)self->_activityHookResponder activityWithID:v9 setCompletedCount:a4 totalCount:a5];
}

- (EDActivityHookResponder)activityHookResponder
{
  return self->_activityHookResponder;
}

- (void)setActivityHookResponder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityHookResponder, 0);

  objc_storeStrong((id *)&self->_currentActivities, 0);
}

@end
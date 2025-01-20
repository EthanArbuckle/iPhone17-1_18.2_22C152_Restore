@interface FCGoalCompletionStore
- (BOOL)isDailyGoalTypeMet:(int64_t)a3 activitySummaryIndex:(int64_t)a4;
- (FCGoalCompletionStore)initWithProfile:(id)a3;
- (id)_goalCompletionByActivitySummaryIndex;
- (id)_trimOldGoalCompletions:(id)a3 index:(int64_t)a4;
- (id)_userDefaultsDomain;
- (id)allGoalTypesMetForActivitySummaryIndex:(int64_t)a3;
- (id)goalTypesToNotifyByActivitySummaryIndex;
- (id)goalTypesToNotifyForActivitySummaryIndex:(int64_t)a3;
- (int64_t)_activitySummaryIndexForDate:(id)a3;
- (unint64_t)_goalTypesMetForActivitySummaryIndex:(int64_t)a3;
- (void)_setGoalCompletionByActivitySummaryIndex:(id)a3;
- (void)_setGoalTypesMet:(unint64_t)a3 forActivitySummaryIndex:(int64_t)a4;
- (void)_setGoalTypesToNotifyByActivitySummaryIndex:(id)a3;
- (void)addDailyGoalTypePreviouslyMet:(int64_t)a3 activitySummaryIndex:(int64_t)a4;
- (void)addGoalTypeToDailyGoalTypesMet:(int64_t)a3 activitySummaryIndex:(int64_t)a4;
- (void)addGoalTypeToNotify:(int64_t)a3 activitySummaryIndex:(int64_t)a4;
- (void)removeGoalTypesToNotify:(id)a3 activitySummaryIndex:(int64_t)a4;
@end

@implementation FCGoalCompletionStore

- (FCGoalCompletionStore)initWithProfile:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FCGoalCompletionStore;
  v5 = [(FCGoalCompletionStore *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    v6->_unfairLock._os_unfair_lock_opaque = 0;
  }

  return v6;
}

- (int64_t)_activitySummaryIndexForDate:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1C9A8];
  id v4 = a3;
  v5 = objc_msgSend(v3, "hk_gregorianCalendar");
  v6 = [v5 components:*MEMORY[0x1E4F2BC40] fromDate:v4];

  int64_t v7 = _HKCacheIndexFromDateComponents();
  return v7;
}

- (id)allGoalTypesMetForActivitySummaryIndex:(int64_t)a3
{
  v5 = [MEMORY[0x1E4F1CA80] set];
  char v6 = [(FCGoalCompletionStore *)self _goalTypesMetForActivitySummaryIndex:a3];
  char v7 = v6;
  if (v6)
  {
    [v5 addObject:&unk_1F2B47A10];
    if ((v7 & 2) == 0)
    {
LABEL_3:
      if ((v7 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_3;
  }
  [v5 addObject:&unk_1F2B47A28];
  if ((v7 & 4) != 0) {
LABEL_4:
  }
    [v5 addObject:&unk_1F2B47A40];
LABEL_5:
  objc_super v8 = (void *)[v5 copy];

  return v8;
}

- (void)addGoalTypeToDailyGoalTypesMet:(int64_t)a3 activitySummaryIndex:(int64_t)a4
{
  unint64_t v7 = [(FCGoalCompletionStore *)self _goalTypesMetForActivitySummaryIndex:a4];
  uint64_t v8 = v7 | 2;
  uint64_t v9 = v7 | 1;
  if (a3 != 1) {
    uint64_t v9 = v7;
  }
  if (a3 != 2) {
    uint64_t v8 = v9;
  }
  if (a3 == 3) {
    uint64_t v10 = v7 | 4;
  }
  else {
    uint64_t v10 = v8;
  }
  [(FCGoalCompletionStore *)self _setGoalTypesMet:v10 forActivitySummaryIndex:a4];
}

- (BOOL)isDailyGoalTypeMet:(int64_t)a3 activitySummaryIndex:(int64_t)a4
{
  unint64_t v5 = [(FCGoalCompletionStore *)self _goalTypesMetForActivitySummaryIndex:a4];
  BOOL v6 = (v5 >> 1) & 1;
  char v7 = v5 & 1;
  if (a3 != 1) {
    char v7 = 0;
  }
  if (a3 != 2) {
    LOBYTE(v6) = v7;
  }
  if (a3 == 3) {
    return (v5 & 4) != 0;
  }
  else {
    return v6;
  }
}

- (void)addDailyGoalTypePreviouslyMet:(int64_t)a3 activitySummaryIndex:(int64_t)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (!-[FCGoalCompletionStore isDailyGoalTypeMet:activitySummaryIndex:](self, "isDailyGoalTypeMet:activitySummaryIndex:"))
  {
    _HKInitializeLogging();
    char v7 = *MEMORY[0x1E4F29F08];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134218240;
      int64_t v9 = a3;
      __int16 v10 = 2048;
      int64_t v11 = a4;
      _os_log_impl(&dword_1D3B3E000, v7, OS_LOG_TYPE_DEFAULT, "Goal type %ld was previously met for activitySummaryIndex: %lld", (uint8_t *)&v8, 0x16u);
    }
    [(FCGoalCompletionStore *)self addGoalTypeToDailyGoalTypesMet:a3 activitySummaryIndex:a4];
  }
}

- (void)addGoalTypeToNotify:(int64_t)a3 activitySummaryIndex:(int64_t)a4
{
  v29[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [(FCGoalCompletionStore *)self goalTypesToNotifyByActivitySummaryIndex];
  int v8 = (void *)v7;
  int64_t v9 = (void *)MEMORY[0x1E4F1CC08];
  if (v7) {
    int64_t v9 = (void *)v7;
  }
  id v10 = v9;

  int64_t v11 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a4];
  uint64_t v12 = [v10 objectForKeyedSubscript:v11];
  uint64_t v13 = [v12 allObjects];
  v14 = (void *)v13;
  v15 = (void *)MEMORY[0x1E4F1CBF0];
  if (v13) {
    v15 = (void *)v13;
  }
  id v16 = v15;

  v17 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  v18 = [v16 arrayByAddingObject:v17];

  v19 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a4];
  v28 = v19;
  v20 = [MEMORY[0x1E4F1CAD0] setWithArray:v18];
  v29[0] = v20;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];

  v22 = objc_msgSend(v10, "hk_dictionaryByAddingEntriesFromDictionary:", v21);

  [(FCGoalCompletionStore *)self _setGoalTypesToNotifyByActivitySummaryIndex:v22];
  _HKInitializeLogging();
  v23 = *MEMORY[0x1E4F29F08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 134218242;
    int64_t v25 = a3;
    __int16 v26 = 2112;
    v27 = v22;
    _os_log_impl(&dword_1D3B3E000, v23, OS_LOG_TYPE_DEFAULT, "Added goal type to be notified: %ld, %@", (uint8_t *)&v24, 0x16u);
  }
}

- (void)removeGoalTypesToNotify:(id)a3 activitySummaryIndex:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(FCGoalCompletionStore *)self goalTypesToNotifyByActivitySummaryIndex];
  id v15 = (id)[v7 mutableCopy];

  int v8 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a4];
  int64_t v9 = [v15 objectForKeyedSubscript:v8];
  id v10 = [v9 allObjects];
  int64_t v11 = (void *)[v10 mutableCopy];

  uint64_t v12 = [v6 allObjects];

  [v11 removeObjectsInArray:v12];
  uint64_t v13 = [MEMORY[0x1E4F1CAD0] setWithArray:v11];
  v14 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a4];
  [v15 setObject:v13 forKeyedSubscript:v14];

  [(FCGoalCompletionStore *)self _setGoalTypesToNotifyByActivitySummaryIndex:v15];
}

- (id)goalTypesToNotifyForActivitySummaryIndex:(int64_t)a3
{
  id v4 = [(FCGoalCompletionStore *)self goalTypesToNotifyByActivitySummaryIndex];
  unint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a3];
  id v6 = [v4 objectForKeyedSubscript:v5];
  uint64_t v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  }
  int64_t v9 = v8;

  return v9;
}

- (void)_setGoalTypesMet:(unint64_t)a3 forActivitySummaryIndex:(int64_t)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a4];
  id v16 = v7;
  id v8 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
  v17[0] = v8;
  int64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];

  uint64_t v10 = [(FCGoalCompletionStore *)self _goalCompletionByActivitySummaryIndex];
  int64_t v11 = (void *)v10;
  uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  if (v10) {
    uint64_t v12 = (void *)v10;
  }
  id v13 = v12;

  v14 = objc_msgSend(v13, "hk_dictionaryByAddingEntriesFromDictionary:", v9);

  id v15 = [(FCGoalCompletionStore *)self _trimOldGoalCompletions:v14 index:a4];
  [(FCGoalCompletionStore *)self _setGoalCompletionByActivitySummaryIndex:v15];
}

- (unint64_t)_goalTypesMetForActivitySummaryIndex:(int64_t)a3
{
  id v4 = [(FCGoalCompletionStore *)self _goalCompletionByActivitySummaryIndex];
  if (v4)
  {
    unint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a3];
    id v6 = [v4 objectForKeyedSubscript:v5];

    unint64_t v7 = [v6 unsignedIntegerValue];
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (id)_trimOldGoalCompletions:(id)a3 index:(int64_t)a4
{
  id v5 = a3;
  id v6 = [v5 allKeys];
  if ((unint64_t)[v6 count] >= 8)
  {
    unint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    id v8 = [v6 sortedArrayUsingSelector:sel_compare_];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __55__FCGoalCompletionStore__trimOldGoalCompletions_index___block_invoke;
    v13[3] = &unk_1E69B8598;
    int64_t v16 = a4;
    id v9 = v7;
    id v14 = v9;
    id v15 = v5;
    id v10 = v5;
    [v8 enumerateObjectsWithOptions:2 usingBlock:v13];
    int64_t v11 = v15;
    id v5 = v9;
  }
  return v5;
}

void __55__FCGoalCompletionStore__trimOldGoalCompletions_index___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  if ((unint64_t)[v9 unsignedLongLongValue] <= *(void *)(a1 + 48))
  {
    id v6 = [*(id *)(a1 + 40) objectForKeyedSubscript:v9];
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v9];

    unint64_t v7 = [*(id *)(a1 + 32) allKeys];
    uint64_t v8 = [v7 count];

    if (v8 == 7) {
      *a4 = 1;
    }
  }
}

- (id)goalTypesToNotifyByActivitySummaryIndex
{
  p_unfairLock = &self->_unfairLock;
  os_unfair_lock_lock(&self->_unfairLock);
  id v4 = self->_goalTypesToNotifyByActivitySummaryIndex;
  os_unfair_lock_unlock(p_unfairLock);
  return v4;
}

- (void)_setGoalTypesToNotifyByActivitySummaryIndex:(id)a3
{
  id v4 = (NSDictionary *)a3;
  os_unfair_lock_lock(&self->_unfairLock);
  goalTypesToNotifyByActivitySummaryIndex = self->_goalTypesToNotifyByActivitySummaryIndex;
  self->_goalTypesToNotifyByActivitySummaryIndex = v4;

  os_unfair_lock_unlock(&self->_unfairLock);
}

- (id)_goalCompletionByActivitySummaryIndex
{
  void v17[2] = *MEMORY[0x1E4F143B8];
  p_unfairLock = &self->_unfairLock;
  os_unfair_lock_lock(&self->_unfairLock);
  id v4 = [(FCGoalCompletionStore *)self _userDefaultsDomain];
  id v5 = [v4 dataForKey:@"dailyGoalCompletionData" error:0];
  os_unfair_lock_unlock(p_unfairLock);
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  v17[0] = objc_opt_class();
  v17[1] = objc_opt_class();
  unint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  uint64_t v8 = [v6 setWithArray:v7];

  id v14 = 0;
  id v9 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v8 fromData:v5 error:&v14];
  id v10 = v14;
  if (v10)
  {
    _HKInitializeLogging();
    int64_t v11 = *MEMORY[0x1E4F29F08];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v10;
      _os_log_impl(&dword_1D3B3E000, v11, OS_LOG_TYPE_DEFAULT, "Unable to obtain the goal types met for activity summary index: %@", buf, 0xCu);
    }
    id v12 = 0;
  }
  else
  {
    id v12 = v9;
  }

  return v12;
}

- (void)_setGoalCompletionByActivitySummaryIndex:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v12 = 0;
  id v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v12];
  id v5 = v12;
  if (v5)
  {
    id v6 = v5;
    _HKInitializeLogging();
    unint64_t v7 = *MEMORY[0x1E4F29F08];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v6;
      _os_log_impl(&dword_1D3B3E000, v7, OS_LOG_TYPE_DEFAULT, "Unable to set the goals type met: %@", buf, 0xCu);
    }
  }
  else
  {
    p_unfairLock = &self->_unfairLock;
    os_unfair_lock_lock(&self->_unfairLock);
    id v9 = [(FCGoalCompletionStore *)self _userDefaultsDomain];
    id v11 = 0;
    [v9 setData:v4 forKey:@"dailyGoalCompletionData" error:&v11];
    id v6 = v11;
    if (v6)
    {
      _HKInitializeLogging();
      id v10 = *MEMORY[0x1E4F29F08];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v14 = v6;
        _os_log_impl(&dword_1D3B3E000, v10, OS_LOG_TYPE_DEFAULT, "Unable to store the goal types met for activity summary index: %@", buf, 0xCu);
      }
    }
    os_unfair_lock_unlock(p_unfairLock);
  }
}

- (id)_userDefaultsDomain
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__FCGoalCompletionStore__userDefaultsDomain__block_invoke;
  block[3] = &unk_1E69B8500;
  block[4] = self;
  if (_userDefaultsDomain_onceToken != -1) {
    dispatch_once(&_userDefaultsDomain_onceToken, block);
  }
  return (id)_userDefaultsDomain_defaultsDomain;
}

void __44__FCGoalCompletionStore__userDefaultsDomain__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F65B28]);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  uint64_t v3 = [v2 initWithCategory:1 domainName:@"com.apple.nanolifestyle.coaching.goalCompletion" profile:WeakRetained];
  id v4 = (void *)_userDefaultsDomain_defaultsDomain;
  _userDefaultsDomain_defaultsDomain = v3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_goalTypesToNotifyByActivitySummaryIndex, 0);
}

@end
@interface MKTransitItemReferenceDateUpdater
+ (BOOL)_needsUpdateReferenceDate;
+ (NSDate)referenceDate;
+ (double)referenceDateAsTimeInterval;
+ (id)_currentTimeWithRoundedSeconds;
+ (unint64_t)_updaterCount;
+ (void)_addUpdater:(id)a3;
+ (void)_cancelReferenceDateUpdate;
+ (void)_referenceDateUpdateTimerFired;
+ (void)_removeUpdater:(id)a3;
+ (void)_scheduleReferenceDateUpdate;
+ (void)_updateReferenceDate;
+ (void)initialize;
- (BOOL)isActive;
- (MKTransitItemReferenceDateUpdater)initWithDelegate:(id)a3;
- (MKTransitItemReferenceDateUpdaterDelegate)delegate;
- (void)setActive:(BOOL)a3;
- (void)setDelegate:(id)a3;
@end

@implementation MKTransitItemReferenceDateUpdater

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    _MergedGlobals_171 = 0;
  }
}

- (MKTransitItemReferenceDateUpdater)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MKTransitItemReferenceDateUpdater;
  v5 = [(MKTransitItemReferenceDateUpdater *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_lock._os_unfair_lock_opaque = 0;
  }

  return v6;
}

- (void)setActive:(BOOL)a3
{
  BOOL v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_active == v3)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_active = v3;
    os_unfair_lock_unlock(p_lock);
    v6 = objc_opt_class();
    if (v3)
    {
      [v6 _addUpdater:self];
    }
    else
    {
      [v6 _removeUpdater:self];
    }
  }
}

+ (id)_currentTimeWithRoundedSeconds
{
  v2 = [MEMORY[0x1E4F1C9C8] date];
  BOOL v3 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v4 = [v3 components:224 fromDate:v2];
  v5 = objc_msgSend(v3, "dateBySettingHour:minute:second:ofDate:options:", objc_msgSend(v4, "hour"), objc_msgSend(v4, "minute"), 30 * (objc_msgSend(v4, "second") / 30), v2, 2);

  return v5;
}

+ (NSDate)referenceDate
{
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_171);
  if ([a1 _needsUpdateReferenceDate]) {
    [a1 _updateReferenceDate];
  }
  id v3 = (id)qword_1EB3161B0;
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_171);

  return (NSDate *)v3;
}

+ (double)referenceDateAsTimeInterval
{
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_171);
  if ([a1 _needsUpdateReferenceDate]) {
    [a1 _updateReferenceDate];
  }
  double v3 = *(double *)&qword_1EB3161B8;
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_171);
  return v3;
}

+ (BOOL)_needsUpdateReferenceDate
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)&_MergedGlobals_171);
  if (!qword_1EB3161B0) {
    return 1;
  }
  if ([(id)qword_1EB3161C0 isValid]) {
    return 0;
  }
  double v3 = (void *)qword_1EB3161B0;
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;
  v7 = (void *)qword_1EB3161B0;
  objc_super v8 = [MEMORY[0x1E4F1C9C8] date];
  [v7 timeIntervalSinceDate:v8];
  if (v6 >= 0.0) {
    double v10 = v9;
  }
  else {
    double v10 = -v9;
  }

  BOOL v2 = v10 >= 30.0;
  return v2;
}

+ (void)_updateReferenceDate
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner((const os_unfair_lock *)&_MergedGlobals_171);
  double v3 = [a1 _currentTimeWithRoundedSeconds];
  if (([(id)qword_1EB3161B0 isEqualToDate:v3] & 1) == 0)
  {
    id v4 = MKGetTransitItemUpdaterLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v14 = qword_1EB3161B0;
      __int16 v15 = 2112;
      v16 = v3;
      _os_log_impl(&dword_18BAEC000, v4, OS_LOG_TYPE_INFO, "Updating current reference date %@ to date: %@", buf, 0x16u);
    }

    objc_storeStrong((id *)&qword_1EB3161B0, v3);
    [v3 timeIntervalSinceReferenceDate];
    qword_1EB3161B8 = v5;
    double v6 = [(id)qword_1EB3161C8 allObjects];
    id v7 = (id)qword_1EB3161B0;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __57__MKTransitItemReferenceDateUpdater__updateReferenceDate__block_invoke;
    v10[3] = &unk_1E54B8248;
    id v11 = v6;
    id v12 = v7;
    id v8 = v7;
    id v9 = v6;
    dispatch_async(MEMORY[0x1E4F14428], v10);
  }
}

void __57__MKTransitItemReferenceDateUpdater__updateReferenceDate__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v15;
    *(void *)&long long v4 = 138412546;
    long long v13 = v4;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v9 = objc_msgSend(v8, "delegate", v13, (void)v14);
        double v10 = MKGetTransitItemUpdaterLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          id v11 = (objc_class *)objc_opt_class();
          id v12 = NSStringFromClass(v11);
          *(_DWORD *)buf = v13;
          v19 = v12;
          __int16 v20 = 2048;
          v21 = v9;
          _os_log_impl(&dword_18BAEC000, v10, OS_LOG_TYPE_DEBUG, "Notifying %@<%p> of reference date update", buf, 0x16u);
        }
        [v9 transitItemReferenceDateUpdater:v8 didUpdateToReferenceDate:*(void *)(a1 + 40)];
      }
      uint64_t v5 = [v2 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v5);
  }
}

+ (void)_scheduleReferenceDateUpdate
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (GEOConfigGetBOOL())
  {
    uint64_t v3 = MKGetTransitItemUpdaterLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_18BAEC000, v3, OS_LOG_TYPE_INFO, "Suppressing update timer due to debug setting", (uint8_t *)&v16, 2u);
    }
  }
  else
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)&_MergedGlobals_171);
    if ([a1 _updaterCount])
    {
      [(id)qword_1EB3161C0 invalidate];
      long long v4 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      uint64_t v6 = [v5 components:224 fromDate:v4];
      uint64_t v7 = [v6 second];
      if (30 * (v7 / 30) + 30 <= 59) {
        uint64_t v8 = 30 * (v7 / 30) + 30;
      }
      else {
        uint64_t v8 = 0;
      }
      id v9 = [v5 nextDateAfterDate:v4 matchingUnit:128 value:v8 options:2];
      [v9 timeIntervalSinceDate:v4];
      double v11 = ceil(v10);
      id v12 = MKGetTransitItemUpdaterLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        int v16 = 134217984;
        double v17 = v11;
        _os_log_impl(&dword_18BAEC000, v12, OS_LOG_TYPE_DEBUG, "Scheduling reference date update in %#.1lfs", (uint8_t *)&v16, 0xCu);
      }

      uint64_t v13 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:a1 target:sel__referenceDateUpdateTimerFired selector:0 userInfo:0 repeats:v11];
      long long v14 = (void *)qword_1EB3161C0;
      qword_1EB3161C0 = v13;
    }
    else
    {
      long long v15 = MKGetTransitItemUpdaterLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_18BAEC000, v15, OS_LOG_TYPE_DEBUG, "Reference date was scheduled but there are no subscribers. Abandoning scheduling the update (cancel if needed)", (uint8_t *)&v16, 2u);
      }

      [a1 _cancelReferenceDateUpdate];
    }
  }
}

+ (void)_cancelReferenceDateUpdate
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)&_MergedGlobals_171);
  if (qword_1EB3161C0)
  {
    id v2 = MKGetTransitItemUpdaterLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long v4 = 0;
      _os_log_impl(&dword_18BAEC000, v2, OS_LOG_TYPE_DEBUG, "Cancelling scheduled reference date update", v4, 2u);
    }

    [(id)qword_1EB3161C0 invalidate];
    uint64_t v3 = (void *)qword_1EB3161C0;
    qword_1EB3161C0 = 0;
  }
}

+ (void)_referenceDateUpdateTimerFired
{
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_171);
  uint64_t v3 = MKGetTransitItemUpdaterLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long v4 = 0;
    _os_log_impl(&dword_18BAEC000, v3, OS_LOG_TYPE_DEBUG, "Reference date timer fired", v4, 2u);
  }

  [(id)qword_1EB3161C0 invalidate];
  [a1 _updateReferenceDate];
  [a1 _scheduleReferenceDateUpdate];
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_171);
}

+ (void)_addUpdater:(id)a3
{
  id v7 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_171);
  long long v4 = (void *)qword_1EB3161C8;
  if (!qword_1EB3161C8)
  {
    uint64_t v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    uint64_t v6 = (void *)qword_1EB3161C8;
    qword_1EB3161C8 = v5;

    long long v4 = (void *)qword_1EB3161C8;
  }
  [v4 addObject:v7];
  if ([a1 _updaterCount])
  {
    if ([a1 _needsUpdateReferenceDate]) {
      [a1 _updateReferenceDate];
    }
    [a1 _scheduleReferenceDateUpdate];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_171);
}

+ (void)_removeUpdater:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_171);
  if (qword_1EB3161C8)
  {
    [(id)qword_1EB3161C8 removeObject:v4];
    if (![a1 _updaterCount]) {
      [a1 _cancelReferenceDateUpdate];
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_171);
}

+ (unint64_t)_updaterCount
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)&_MergedGlobals_171);
  id v2 = [(id)qword_1EB3161C8 allObjects];
  unint64_t v3 = [v2 count];

  return v3;
}

- (MKTransitItemReferenceDateUpdaterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MKTransitItemReferenceDateUpdaterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isActive
{
  return self->_active;
}

- (void).cxx_destruct
{
}

@end
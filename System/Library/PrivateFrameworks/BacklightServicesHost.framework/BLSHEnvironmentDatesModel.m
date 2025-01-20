@interface BLSHEnvironmentDatesModel
- (BLSHBacklightSceneHostEnvironment)environment;
- (BLSHEnvironmentDatesModel)initWithEnvironment:(id)a3;
- (NSArray)specifiers;
- (NSDateInterval)dateInterval;
- (id)missingIntervalForDateInterval:(id)a3;
- (id)specifierForDate:(id)a3;
- (int64_t)count;
- (void)clearAllSpecifiers;
- (void)purgeSpecifiersBefore:(id)a3;
- (void)registerSpecifiers:(id)a3 forDateInterval:(id)a4;
@end

@implementation BLSHEnvironmentDatesModel

- (BLSHEnvironmentDatesModel)initWithEnvironment:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BLSHEnvironmentDatesModel;
  v5 = [(BLSHEnvironmentDatesModel *)&v10 init];
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v5->_environment, v4);
    uint64_t v7 = [MEMORY[0x263EFF980] array];
    specifiers = v6->_specifiers;
    v6->_specifiers = (NSMutableArray *)v7;
  }
  return v6;
}

- (NSDateInterval)dateInterval
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_dateInterval;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (NSArray)specifiers
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (void *)[(NSMutableArray *)self->_specifiers copy];
  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v4;
}

- (int64_t)count
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t v4 = [(NSMutableArray *)self->_specifiers count];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)specifierForDate:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  specifiers = self->_specifiers;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __46__BLSHEnvironmentDatesModel_specifierForDate___block_invoke;
  v17[3] = &unk_264533C38;
  id v7 = v4;
  id v18 = v7;
  uint64_t v8 = [(NSMutableArray *)specifiers indexOfObjectWithOptions:2 passingTest:v17];
  v9 = self->_specifiers;
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_super v10 = [(NSMutableArray *)v9 firstObject];
    v11 = v10;
    if (v10
      && ([v10 date],
          v12 = objc_claimAutoreleasedReturnValue(),
          [v12 timeIntervalSinceDate:v7],
          double v14 = v13,
          v12,
          v14 < 1.0))
    {
      id v15 = v11;
    }
    else
    {
      id v15 = 0;
    }
  }
  else
  {
    -[NSMutableArray objectAtIndex:](v9, "objectAtIndex:");
    id v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  os_unfair_lock_unlock(p_lock);

  return v15;
}

BOOL __46__BLSHEnvironmentDatesModel_specifierForDate___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 date];
  BOOL v4 = [v3 compare:*(void *)(a1 + 32)] != 1;

  return v4;
}

- (id)missingIntervalForDateInterval:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = self->_dateInterval;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  os_unfair_lock_unlock(&self->_lock);
  if (!v5) {
    goto LABEL_18;
  }
  if (![v4 isEqual:v5])
  {
    v11 = [(NSDateInterval *)v5 endDate];
    v12 = [v4 startDate];
    char v13 = [v11 isEqualToDate:v12];

    if (v13)
    {
      uint64_t v8 = 0;
      goto LABEL_8;
    }
    v17 = [v4 startDate];
    BOOL v18 = [(NSDateInterval *)v5 containsDate:v17];

    if (v18)
    {
      v19 = [v4 endDate];
      v20 = [(NSDateInterval *)v5 endDate];
      if ([v20 compare:v19] != 1)
      {
        uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v20 endDate:v19];
        v28 = bls_flipbook_log();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          v37 = [WeakRetained identifier];
          v36 = objc_msgSend(v4, "bls_shortLoggingString");
          v34 = [(NSDateInterval *)v5 bls_shortLoggingString];
          objc_msgSend(v8, "bls_shortLoggingString");
          *(_DWORD *)buf = 134219010;
          v39 = self;
          __int16 v40 = 2114;
          v41 = v37;
          __int16 v42 = 2114;
          v43 = v36;
          __int16 v44 = 2114;
          v45 = v34;
          v47 = __int16 v46 = 2114;
          v35 = (void *)v47;
          _os_log_debug_impl(&dword_21FCFC000, v28, OS_LOG_TYPE_DEBUG, "%p:%{public}@ truncating interval:%{public}@ due to current interval:%{public}@ - to new interval:%{public}@", buf, 0x34u);
        }
LABEL_8:
        double v14 = [v8 startDate];
        id v15 = [(BLSHEnvironmentDatesModel *)self specifierForDate:v14];
        v9 = [v15 date];

        uint64_t v16 = 0;
        if (v8) {
          goto LABEL_20;
        }
        goto LABEL_19;
      }
      v21 = bls_flipbook_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        v31 = [WeakRetained identifier];
        v32 = objc_msgSend(v4, "bls_shortLoggingString");
        v33 = [(NSDateInterval *)v5 bls_shortLoggingString];
        *(_DWORD *)buf = 134219010;
        v39 = self;
        __int16 v40 = 2114;
        v41 = v31;
        __int16 v42 = 2114;
        v43 = v32;
        __int16 v44 = 2114;
        v45 = v33;
        __int16 v46 = 1024;
        LODWORD(v47) = [(BLSHEnvironmentDatesModel *)self count];
        _os_log_fault_impl(&dword_21FCFC000, v21, OS_LOG_TYPE_FAULT, "%p:%{public}@ interval:%{public}@ ends before or same as current interval:%{public}@ - will invalidate %d old dates", buf, 0x30u);
      }
      [(BLSHEnvironmentDatesModel *)self clearAllSpecifiers];
    }
    else
    {
      v22 = bls_flipbook_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v23 = [WeakRetained identifier];
        v24 = objc_msgSend(v4, "bls_shortLoggingString");
        v25 = [(NSDateInterval *)v5 bls_shortLoggingString];
        *(_DWORD *)buf = 134219010;
        v39 = self;
        __int16 v40 = 2114;
        v41 = v23;
        __int16 v42 = 2114;
        v43 = v24;
        __int16 v44 = 2114;
        v45 = v25;
        __int16 v46 = 1024;
        LODWORD(v47) = [(BLSHEnvironmentDatesModel *)self count];
        _os_log_impl(&dword_21FCFC000, v22, OS_LOG_TYPE_INFO, "%p:%{public}@ new interval:%{public}@ does not intersect current interval:%{public}@ - will invalidate %d old dates", buf, 0x30u);
      }
      [(BLSHEnvironmentDatesModel *)self clearAllSpecifiers];
    }
LABEL_18:
    v9 = 0;
    uint64_t v16 = 1;
LABEL_19:
    id v10 = v4;
    uint64_t v8 = v10;
    if (!v10) {
      goto LABEL_21;
    }
LABEL_20:
    id v10 = +[BLSHEnvironmentDateInterval intervalWithPresentationInterval:v8 previousPresentationDate:v9 shouldReset:v16 environment:WeakRetained];
    goto LABEL_21;
  }
  id v7 = bls_flipbook_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v29 = [WeakRetained identifier];
    v30 = objc_msgSend(v4, "bls_shortLoggingString");
    *(_DWORD *)buf = 134218498;
    v39 = self;
    __int16 v40 = 2114;
    v41 = v29;
    __int16 v42 = 2114;
    v43 = v30;
    _os_log_debug_impl(&dword_21FCFC000, v7, OS_LOG_TYPE_DEBUG, "%p:%{public}@ already have all specifiers in interval:%{public}@, will skip", buf, 0x20u);
  }
  uint64_t v8 = 0;
  v9 = 0;
  id v10 = 0;
LABEL_21:
  id v26 = v10;

  return v26;
}

- (void)registerSpecifiers:(id)a3 forDateInterval:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  os_unfair_lock_lock(&self->_lock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  v9 = self->_dateInterval;
  id v10 = v9;
  if (!v9) {
    goto LABEL_8;
  }
  v11 = [(NSDateInterval *)v9 endDate];
  v12 = [v6 startDate];
  char v13 = [v11 isEqualToDate:v12];

  if ((v13 & 1) == 0)
  {
    BOOL v18 = bls_flipbook_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      v21 = [WeakRetained identifier];
      v22 = objc_msgSend(v6, "bls_shortLoggingString");
      v23 = [(NSDateInterval *)v10 bls_shortLoggingString];
      int v24 = [(NSMutableArray *)self->_specifiers count];
      int v25 = 134219010;
      id v26 = self;
      __int16 v27 = 2114;
      v28 = v21;
      __int16 v29 = 2114;
      v30 = v22;
      __int16 v31 = 2114;
      v32 = v23;
      __int16 v33 = 1024;
      int v34 = v24;
      _os_log_fault_impl(&dword_21FCFC000, v18, OS_LOG_TYPE_FAULT, "%p:%{public}@ new interval:%{public}@ does not follow current interval:%{public}@ - will invalidate %d old specifiers", (uint8_t *)&v25, 0x30u);
    }
    [(NSMutableArray *)self->_specifiers removeAllObjects];
    goto LABEL_8;
  }
  id v14 = objc_alloc(MEMORY[0x263F08798]);
  id v15 = [(NSDateInterval *)v10 startDate];
  uint64_t v16 = [v6 endDate];
  v17 = (NSDateInterval *)[v14 initWithStartDate:v15 endDate:v16];

  if (!v17) {
LABEL_8:
  }
    v17 = (NSDateInterval *)v6;
  dateInterval = self->_dateInterval;
  self->_dateInterval = v17;
  v20 = v17;

  [(NSMutableArray *)self->_specifiers addObjectsFromArray:v7];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)clearAllSpecifiers
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v5 = [a2 identifier];
  int v6 = [*(id *)(a1 + 8) count];
  id v7 = objc_msgSend(*(id *)(a1 + 16), "bls_shortLoggingString");
  int v8 = 134218754;
  uint64_t v9 = a1;
  __int16 v10 = 2114;
  v11 = v5;
  __int16 v12 = 1024;
  int v13 = v6;
  __int16 v14 = 2114;
  id v15 = v7;
  _os_log_debug_impl(&dword_21FCFC000, a3, OS_LOG_TYPE_DEBUG, "%p:%{public}@ will clear %d specifiers from interval:%{public}@", (uint8_t *)&v8, 0x26u);
}

- (void)purgeSpecifiersBefore:(id)a3
{
  *(void *)&v26[13] = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  unint64_t v6 = [(NSMutableArray *)self->_specifiers count];
  specifiers = self->_specifiers;
  int v8 = (void *)[objc_alloc(MEMORY[0x263F29940]) initWithDate:v4 fidelity:0];
  unint64_t v9 = -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](specifiers, "indexOfObject:inSortedRange:options:usingComparator:", v8, 0, v6, 1024, &__block_literal_global_17);

  if (v9)
  {
    if (v9 < v6)
    {
      __int16 v10 = [(NSMutableArray *)self->_specifiers objectAtIndex:v9];
      v11 = [v10 date];
      char v12 = [v4 isEqualToDate:v11];

      if (v12)
      {
        ++v9;
        goto LABEL_6;
      }
    }
    if (v9 >= 2)
    {
LABEL_6:
      if (v9 - 1 >= v6) {
        unint64_t v13 = v6 - 1;
      }
      else {
        unint64_t v13 = v9 - 1;
      }
      -[NSMutableArray removeObjectsInRange:](self->_specifiers, "removeObjectsInRange:", 0, v13);
      __int16 v14 = bls_flipbook_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        id v15 = [WeakRetained identifier];
        int v16 = [(NSMutableArray *)self->_specifiers count];
        v17 = objc_msgSend(v4, "bls_shortLoggingString");
        int v19 = 134219010;
        v20 = self;
        __int16 v21 = 2114;
        v22 = v15;
        __int16 v23 = 1024;
        int v24 = v13;
        __int16 v25 = 1024;
        *(_DWORD *)id v26 = v16;
        v26[2] = 2114;
        *(void *)&v26[3] = v17;
        _os_log_debug_impl(&dword_21FCFC000, v14, OS_LOG_TYPE_DEBUG, "%p:%{public}@ did purge:%d dates (remaining:%d) before:%{public}@", (uint8_t *)&v19, 0x2Cu);

LABEL_14:
        goto LABEL_12;
      }
      goto LABEL_12;
    }
  }
  __int16 v14 = bls_flipbook_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    id v15 = [WeakRetained identifier];
    BOOL v18 = objc_msgSend(v4, "bls_shortLoggingString");
    int v19 = 134218754;
    v20 = self;
    __int16 v21 = 2114;
    v22 = v15;
    __int16 v23 = 1024;
    int v24 = v6;
    __int16 v25 = 2114;
    *(void *)id v26 = v18;
    _os_log_debug_impl(&dword_21FCFC000, v14, OS_LOG_TYPE_DEBUG, "%p:%{public}@ no dates to purge (remaining:%d) before:%{public}@", (uint8_t *)&v19, 0x26u);

    goto LABEL_14;
  }
LABEL_12:

  os_unfair_lock_unlock(&self->_lock);
}

uint64_t __51__BLSHEnvironmentDatesModel_purgeSpecifiersBefore___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 date];
  unint64_t v6 = [v4 date];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (BLSHBacklightSceneHostEnvironment)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);

  return (BLSHBacklightSceneHostEnvironment *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_environment);
  objc_storeStrong((id *)&self->_dateInterval, 0);

  objc_storeStrong((id *)&self->_specifiers, 0);
}

@end
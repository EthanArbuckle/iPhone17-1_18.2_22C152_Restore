@interface BLSFrameSpecifierModel
- (BLSFrameSpecifierModel)init;
- (NSArray)specifiers;
- (id)debugDescription;
- (id)description;
- (id)specifierAtPresentationDate:(id)a3;
- (os_unfair_lock_s)hasSpecifiers;
- (unint64_t)specifierCount;
- (void)addSpecifiers:(id)a3;
- (void)dealloc;
- (void)purgeAllButOneSpecifiersBeforeDate:(id)a3;
- (void)purgeAllSpecifiersOnOrAfterDate:(id)a3;
- (void)withLock_purgeAllSpecifiersOnOrAfterDate:(uint64_t)a1;
@end

@implementation BLSFrameSpecifierModel

- (BLSFrameSpecifierModel)init
{
  v9.receiver = self;
  v9.super_class = (Class)BLSFrameSpecifierModel;
  v2 = [(BLSFrameSpecifierModel *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    specifiers = v3->_specifiers;
    v3->_specifiers = (NSMutableArray *)v4;

    objc_initWeak(&location, v3);
    objc_copyWeak(&v7, &location);
    v3->_stateHandler = os_state_add_handler();
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  return v3;
}

_DWORD *__30__BLSFrameSpecifierModel_init__block_invoke(uint64_t a1)
{
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (-[BLSFrameSpecifierModel hasSpecifiers](WeakRetained))
  {
    v2 = [(os_unfair_lock_s *)WeakRetained debugDescription];
    v3 = BLSStateDataWithTitleDescriptionAndHints(@"BLSFrameSpecifierModel", v2);
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (os_unfair_lock_s)hasSpecifiers
{
  v1 = a1;
  if (a1)
  {
    v2 = a1 + 4;
    os_unfair_lock_lock(a1 + 4);
    v1 = (os_unfair_lock_s *)([*(id *)&v1[2]._os_unfair_lock_opaque count] != 0);
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (void)dealloc
{
  if (self->_stateHandler) {
    os_state_remove_handler();
  }
  v3.receiver = self;
  v3.super_class = (Class)BLSFrameSpecifierModel;
  [(BLSFrameSpecifierModel *)&v3 dealloc];
}

- (id)description
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  uint64_t v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v5 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:", -[NSMutableArray count](self->_specifiers, "count"), @"count");
  v6 = [(NSMutableArray *)self->_specifiers firstObject];
  id v7 = (id)[v4 appendObject:v6 withName:@"first"];

  v8 = [(NSMutableArray *)self->_specifiers lastObject];
  id v9 = (id)[v4 appendObject:v8 withName:@"last"];

  v10 = [v4 build];
  os_unfair_lock_unlock(p_lock);

  return v10;
}

- (id)debugDescription
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  uint64_t v4 = [(NSMutableArray *)self->_specifiers count];
  id v5 = objc_opt_new();
  [v5 appendProem:self block:&__block_literal_global_14];
  v6 = objc_msgSend(NSString, "stringWithFormat:", @"specifiers (%u)", v4);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42__BLSFrameSpecifierModel_debugDescription__block_invoke_2;
  v10[3] = &unk_1E6107A28;
  id v11 = v5;
  uint64_t v12 = v4;
  v10[4] = self;
  id v7 = v5;
  [v7 appendBodySectionWithName:v6 openDelimiter:@" {" closeDelimiter:@"} " block:v10];

  os_unfair_lock_unlock(p_lock);
  v8 = [v7 description];

  return v8;
}

void __42__BLSFrameSpecifierModel_debugDescription__block_invoke_2(void *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = a1[6];
  if (v2 <= 0x5A) {
    unint64_t v3 = a1[6];
  }
  else {
    unint64_t v3 = 85;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = *(id *)(a1[4] + 8);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v4);
        }
        if (v7 + i < v3 || v7 + i >= v2 - 6)
        {
          id v11 = *(__CFString **)(*((void *)&v13 + 1) + 8 * i);
          v10 = (void *)a1[5];
        }
        else
        {
          if (v7 - v3 + i) {
            continue;
          }
          v10 = (void *)a1[5];
          id v11 = @"...";
        }
        id v12 = (id)[v10 appendObject:v11 withName:0];
      }
      v7 += v6;
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (NSArray)specifiers
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (void *)[(NSMutableArray *)self->_specifiers copy];
  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v4;
}

- (unint64_t)specifierCount
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t v4 = [(NSMutableArray *)self->_specifiers count];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)addSpecifiers:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    os_unfair_lock_lock(&self->_lock);
    uint64_t v5 = [v4 firstObject];
    uint64_t v6 = [v5 presentationInterval];
    uint64_t v7 = [v6 startDate];

    -[BLSFrameSpecifierModel withLock_purgeAllSpecifiersOnOrAfterDate:]((uint64_t)self, v7);
    uint64_t v8 = [(NSMutableArray *)self->_specifiers lastObject];
    id v9 = v8;
    if (v5 && v8)
    {
      v10 = [v8 correctedSpecifierWithNextSpecifier:v5];
      if (v10)
      {
        [(NSMutableArray *)self->_specifiers removeLastObject];
        [(NSMutableArray *)self->_specifiers addObject:v10];
      }
    }
    [(NSMutableArray *)self->_specifiers addObjectsFromArray:v4];
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    uint64_t v5 = bls_environment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(BLSFrameSpecifierModel *)(uint64_t)self addSpecifiers:v5];
    }
  }
}

- (void)withLock_purgeAllSpecifiersOnOrAfterDate:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if (v3)
    {
      uint64_t v5 = *(void **)(a1 + 8);
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __67__BLSFrameSpecifierModel_withLock_purgeAllSpecifiersOnOrAfterDate___block_invoke;
      v8[3] = &unk_1E6107A50;
      id v9 = v3;
      uint64_t v6 = [v5 indexOfObjectPassingTest:v8];
      if (v6 != 0x7FFFFFFFFFFFFFFFLL) {
        objc_msgSend(*(id *)(a1 + 8), "removeObjectsInRange:", v6, objc_msgSend(*(id *)(a1 + 8), "count") - v6);
      }
      uint64_t v7 = v9;
    }
    else
    {
      uint64_t v7 = bls_environment_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[BLSFrameSpecifierModel withLock_purgeAllSpecifiersOnOrAfterDate:](a1, v7);
      }
    }
  }
}

- (void)purgeAllButOneSpecifiersBeforeDate:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lock);
    unint64_t v5 = [(NSMutableArray *)self->_specifiers count];
    if (v5 >= 2)
    {
      specifiers = self->_specifiers;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __61__BLSFrameSpecifierModel_purgeAllButOneSpecifiersBeforeDate___block_invoke;
      v11[3] = &unk_1E6107A50;
      id v12 = v4;
      uint64_t v7 = [(NSMutableArray *)specifiers indexOfObjectPassingTest:v11];
      if (v7)
      {
        if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
          uint64_t v8 = v5 - 1;
        }
        else {
          uint64_t v8 = v7;
        }
        -[NSMutableArray removeObjectsInRange:](self->_specifiers, "removeObjectsInRange:", 0, v8);
      }
    }
    uint64_t v9 = [(NSMutableArray *)self->_specifiers count];
    os_unfair_lock_unlock(&self->_lock);
    v10 = bls_environment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      long long v14 = self;
      __int16 v15 = 2048;
      unint64_t v16 = v5 - v9;
      __int16 v17 = 2114;
      uint64_t v18 = self;
      _os_log_debug_impl(&dword_1B55DE000, v10, OS_LOG_TYPE_DEBUG, "<BLSFrameSpecifierModel %p> purged %lu specifiers — %{public}@", buf, 0x20u);
    }
  }
  else
  {
    v10 = bls_environment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[BLSFrameSpecifierModel purgeAllButOneSpecifiersBeforeDate:]((uint64_t)self, v10);
    }
  }
}

BOOL __61__BLSFrameSpecifierModel_purgeAllButOneSpecifiersBeforeDate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 presentationInterval];
  id v4 = [v3 endDate];
  BOOL v5 = [v4 compare:*(void *)(a1 + 32)] != -1;

  return v5;
}

- (void)purgeAllSpecifiersOnOrAfterDate:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[BLSFrameSpecifierModel withLock_purgeAllSpecifiersOnOrAfterDate:]((uint64_t)self, v5);

  os_unfair_lock_unlock(p_lock);
}

BOOL __67__BLSFrameSpecifierModel_withLock_purgeAllSpecifiersOnOrAfterDate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 presentationInterval];
  id v4 = [v3 startDate];
  BOOL v5 = [v4 compare:*(void *)(a1 + 32)] != -1;

  return v5;
}

- (id)specifierAtPresentationDate:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    specifiers = self->_specifiers;
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __54__BLSFrameSpecifierModel_specifierAtPresentationDate___block_invoke;
    v34[3] = &unk_1E6107A50;
    id v7 = v4;
    id v35 = v7;
    uint64_t v8 = [(NSMutableArray *)specifiers indexOfObjectWithOptions:1 passingTest:v34];
    uint64_t v9 = self->_specifiers;
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = [(NSMutableArray *)v9 lastObject];
      id v11 = v10;
      if (v10
        && ([v10 presentationInterval],
            id v12 = objc_claimAutoreleasedReturnValue(),
            [v12 startDate],
            long long v13 = objc_claimAutoreleasedReturnValue(),
            uint64_t v14 = objc_msgSend(v13, "bls_compare:withEpsilon:", v7, 0.0001),
            v13,
            v12,
            v14 != 1))
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
    unint64_t v16 = bls_environment_log();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);

    if (v17 && !v15 && [(NSMutableArray *)self->_specifiers count])
    {
      uint64_t v18 = [(NSMutableArray *)self->_specifiers firstObject];
      uint64_t v19 = [v18 presentationInterval];
      v20 = [v19 startDate];
      uint64_t v21 = [v20 compare:v7];

      v22 = [v19 endDate];
      uint64_t v23 = [v22 compare:v7];

      [v7 timeIntervalSinceReferenceDate];
      uint64_t v25 = v24;
      v26 = [v19 startDate];
      [v26 timeIntervalSinceReferenceDate];
      uint64_t v28 = v27;

      v29 = bls_environment_log();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        v31 = objc_msgSend(v7, "bls_shortLoggingString");
        uint64_t v32 = [(NSMutableArray *)self->_specifiers bls_boundedDescriptionWithTransformer:&__block_literal_global_32];
        *(_DWORD *)buf = 134219778;
        v37 = self;
        __int16 v38 = 2114;
        v39 = v31;
        __int16 v40 = 2114;
        uint64_t v41 = v32;
        v33 = (void *)v32;
        __int16 v42 = 2114;
        v43 = v18;
        __int16 v44 = 2048;
        uint64_t v45 = v21;
        __int16 v46 = 2048;
        uint64_t v47 = v23;
        __int16 v48 = 2048;
        uint64_t v49 = v25;
        __int16 v50 = 2048;
        uint64_t v51 = v28;
        _os_log_debug_impl(&dword_1B55DE000, v29, OS_LOG_TYPE_DEBUG, "%p:specifier:nil presentationDate:%{public}@ specifiers:%{public}@ firstSpecifier:%{public}@ startCompare:%ld, endCompare:%ld, presentationDateTimeInterval:%lf firstPresentationIntervalStartDateTimeInterval:%lf", buf, 0x52u);
      }
    }
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

BOOL __54__BLSFrameSpecifierModel_specifierAtPresentationDate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 presentationInterval];
  id v4 = [v3 startDate];
  if (objc_msgSend(v4, "bls_compare:withEpsilon:", *(void *)(a1 + 32), 0.0001) == 1)
  {
    BOOL v5 = 0;
  }
  else
  {
    uint64_t v6 = [v3 endDate];
    BOOL v5 = objc_msgSend(v6, "bls_compare:withEpsilon:", *(void *)(a1 + 32), 0.0001) == 1;
  }
  return v5;
}

id __54__BLSFrameSpecifierModel_specifierAtPresentationDate___block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 presentationInterval];
  id v3 = objc_msgSend(v2, "bls_loggingString");

  return v3;
}

- (void).cxx_destruct
{
}

- (void)addSpecifiers:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218242;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1B55DE000, log, OS_LOG_TYPE_ERROR, "<BLSFrameSpecifierModel %p> tried to add empty specifiers %{public}@", (uint8_t *)&v3, 0x16u);
}

- (void)withLock_purgeAllSpecifiersOnOrAfterDate:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B55DE000, a2, OS_LOG_TYPE_ERROR, "<BLSFrameSpecifierModel %p> tried to purge specifiers on or after a nil date", (uint8_t *)&v2, 0xCu);
}

- (void)purgeAllButOneSpecifiersBeforeDate:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B55DE000, a2, OS_LOG_TYPE_ERROR, "<BLSFrameSpecifierModel %p> tried to purge specifiers before a nil date", (uint8_t *)&v2, 0xCu);
}

@end
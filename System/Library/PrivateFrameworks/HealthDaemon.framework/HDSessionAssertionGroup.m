@interface HDSessionAssertionGroup
- (HDSessionAssertionGroup)init;
- (int64_t)state;
- (void)_transitionToNewAssertions:(uint64_t)a1;
- (void)invalidate;
- (void)setupState:(int64_t)a3 withAssertions:(id)a4;
- (void)transitionToState:(int64_t)a3;
@end

@implementation HDSessionAssertionGroup

- (HDSessionAssertionGroup)init
{
  v8.receiver = self;
  v8.super_class = (Class)HDSessionAssertionGroup;
  v2 = [(HDSessionAssertionGroup *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    allAssertions = v2->_allAssertions;
    v2->_allAssertions = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    assertionsForState = v2->_assertionsForState;
    v2->_assertionsForState = v5;
  }
  return v2;
}

- (void)setupState:(int64_t)a3 withAssertions:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  assertionsForState = self->_assertionsForState;
  objc_super v8 = [NSNumber numberWithInteger:a3];
  [(NSMutableDictionary *)assertionsForState setObject:v6 forKeyedSubscript:v8];

  [(NSMutableSet *)self->_allAssertions addObjectsFromArray:v6];
  if (self->_state == a3)
  {
    _HKInitializeLogging();
    v9 = HKLogAssertions();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);

    if (v10)
    {
      v11 = HKLogAssertions();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = [NSNumber numberWithInteger:a3];
        int v13 = 138412290;
        v14 = v12;
        _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_INFO, "Assertion group: Updating assertions for current state %@", (uint8_t *)&v13, 0xCu);
      }
    }
    -[HDSessionAssertionGroup _transitionToNewAssertions:]((uint64_t)self, v6);
  }
}

- (void)_transitionToNewAssertions:(uint64_t)a1
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v4 = *(id *)(a1 + 8);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (!v5) {
      goto LABEL_21;
    }
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v20;
    *(void *)&long long v6 = 138412290;
    long long v18 = v6;
    while (1)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v19 + 1) + 8 * v9);
        if (!objc_msgSend(v3, "containsObject:", v10, v18, (void)v19))
        {
          if (!v10) {
            goto LABEL_17;
          }
          [*(id *)(v10 + 8) invalidate];
          v14 = *(NSObject **)(v10 + 8);
          *(void *)(v10 + 8) = 0;
          goto LABEL_16;
        }
        char v11 = [(id)v10 taken];
        if (v10 && (v11 & 1) == 0)
        {
          if ([(id)v10 taken])
          {
            _HKInitializeLogging();
            v12 = HKLogAssertions();
            BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);

            if (!v13) {
              goto LABEL_17;
            }
            v14 = HKLogAssertions();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              uint64_t v15 = [*(id *)(v10 + 8) assertionIdentifier];
              *(_DWORD *)buf = v18;
              v25 = v15;
              _os_log_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_INFO, "Attempting to take assertion already taken: %@", buf, 0xCu);
            }
          }
          else
          {
            [*(id *)(v10 + 8) invalidate];
            uint64_t v16 = (*(void (**)(void))(*(void *)(v10 + 16) + 16))();
            v14 = *(NSObject **)(v10 + 8);
            *(void *)(v10 + 8) = v16;
          }
LABEL_16:
        }
LABEL_17:
        ++v9;
      }
      while (v7 != v9);
      uint64_t v17 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
      uint64_t v7 = v17;
      if (!v17)
      {
LABEL_21:

        break;
      }
    }
  }
}

- (void)transitionToState:(int64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (self->_state == a3)
  {
    _HKInitializeLogging();
    id v4 = HKLogAssertions();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);

    if (!v5) {
      return;
    }
    long long v6 = HKLogAssertions();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = [NSNumber numberWithInteger:self->_state];
      int v19 = 138412290;
      long long v20 = v7;
      _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_INFO, "Assertion group: Already in state %@", (uint8_t *)&v19, 0xCu);
    }
  }
  else
  {
    self->_state = a3;
    _HKInitializeLogging();
    uint64_t v9 = HKLogAssertions();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);

    if (v10)
    {
      char v11 = HKLogAssertions();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = [NSNumber numberWithInteger:a3];
        int v19 = 138412290;
        long long v20 = v12;
        _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_INFO, "Assertion group: Transitioning to state %@", (uint8_t *)&v19, 0xCu);
      }
    }
    assertionsForState = self->_assertionsForState;
    v14 = [NSNumber numberWithInteger:a3];
    long long v6 = [(NSMutableDictionary *)assertionsForState objectForKeyedSubscript:v14];

    if (v6)
    {
      -[HDSessionAssertionGroup _transitionToNewAssertions:]((uint64_t)self, v6);
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v15 = HKLogAssertions();
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);

      if (v16)
      {
        uint64_t v17 = HKLogAssertions();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          long long v18 = [NSNumber numberWithInteger:a3];
          int v19 = 138412290;
          long long v20 = v18;
          _os_log_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_INFO, "Assertion group: No assertions for state %@", (uint8_t *)&v19, 0xCu);
        }
      }
      long long v6 = 0;
    }
  }
}

- (void)invalidate
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = self->_allAssertions;
  uint64_t v3 = [(NSMutableSet *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(id **)(*((void *)&v11 + 1) + 8 * i);
        int v8 = objc_msgSend(v7, "taken", (void)v11);
        if (v7) {
          BOOL v9 = v8 == 0;
        }
        else {
          BOOL v9 = 1;
        }
        if (!v9)
        {
          [v7[1] invalidate];
          id v10 = v7[1];
          v7[1] = 0;
        }
      }
      uint64_t v4 = [(NSMutableSet *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

- (int64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertionsForState, 0);

  objc_storeStrong((id *)&self->_allAssertions, 0);
}

@end
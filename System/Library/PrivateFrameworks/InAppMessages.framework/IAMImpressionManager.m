@interface IAMImpressionManager
- (BOOL)_endImpressionForMessageWithIdentifier:(id)a3 fromTargetWithIdentifier:(id)a4 displayEndTime:(id)a5;
- (BOOL)_startImpressionForMessageEntry:(id)a3 fromTargetWithIdentifier:(id)a4 displayStartTime:(id)a5;
- (IAMImpressionManager)init;
- (IAMImpressionManagerDelegate)delegate;
- (void)_reportImpression:(id)a3;
- (void)_reportImpressionEventWithDictionary:(id)a3;
- (void)_transitionToActiveState;
- (void)_transitionToInactiveState;
- (void)dealloc;
- (void)messageEntry:(id)a3 didAppearFromTargetWithIdentifier:(id)a4 atTime:(id)a5;
- (void)messageWithIdentifier:(id)a3 didDisappearFromTargetWithIdentifier:(id)a4 atTime:(id)a5;
- (void)setDelegate:(id)a3;
@end

@implementation IAMImpressionManager

- (void)setDelegate:(id)a3
{
}

- (IAMImpressionManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)IAMImpressionManager;
  v2 = [(IAMImpressionManager *)&v11 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = objc_opt_new();
    activeImpressionForMessageIdentifierFromTargetIdentifier = v3->_activeImpressionForMessageIdentifierFromTargetIdentifier;
    v3->_activeImpressionForMessageIdentifierFromTargetIdentifier = (NSMutableDictionary *)v4;

    uint64_t v6 = objc_opt_new();
    inactiveImpressionForMessageIdentifierFromTargetIdentifier = v3->_inactiveImpressionForMessageIdentifierFromTargetIdentifier;
    v3->_inactiveImpressionForMessageIdentifierFromTargetIdentifier = (NSMutableDictionary *)v6;

    os_unfair_lock_lock(&v3->_lock);
    v8 = [MEMORY[0x263F1C408] sharedApplication];
    v3->_isApplicationActive = [v8 applicationState] == 0;

    os_unfair_lock_unlock(&v3->_lock);
    v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 addObserver:v3 selector:sel__handleApplicationDidBecomeActive name:*MEMORY[0x263F1D038] object:0];
    [v9 addObserver:v3 selector:sel__handleApplicationWillResignActive name:*MEMORY[0x263F1D0D8] object:0];
  }
  return v3;
}

- (void)_transitionToActiveState
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF910] date];
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_isApplicationActive = 1;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obj = self->_inactiveImpressionForMessageIdentifierFromTargetIdentifier;
  uint64_t v4 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v23;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = -[NSMutableDictionary objectForKeyedSubscript:](self->_inactiveImpressionForMessageIdentifierFromTargetIdentifier, "objectForKeyedSubscript:", *(void *)(*((void *)&v22 + 1) + 8 * v7), lock);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v19;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v19 != v11) {
                objc_enumerationMutation(v8);
              }
              v13 = [v8 objectForKeyedSubscript:*(void *)(*((void *)&v18 + 1) + 8 * v12)];
              [v13 setDisplayStartTime:v3];
              [v13 setDisplayEndTime:0];

              ++v12;
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }
          while (v10);
        }

        ++v7;
      }
      while (v7 != v5);
      uint64_t v5 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v5);
  }

  objc_storeStrong((id *)&self->_activeImpressionForMessageIdentifierFromTargetIdentifier, self->_inactiveImpressionForMessageIdentifierFromTargetIdentifier);
  v14 = (NSMutableDictionary *)objc_opt_new();
  inactiveImpressionForMessageIdentifierFromTargetIdentifier = self->_inactiveImpressionForMessageIdentifierFromTargetIdentifier;
  self->_inactiveImpressionForMessageIdentifierFromTargetIdentifier = v14;

  os_unfair_lock_unlock(lock);
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F1D038] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F1D0D8] object:0];

  v4.receiver = self;
  v4.super_class = (Class)IAMImpressionManager;
  [(IAMImpressionManager *)&v4 dealloc];
}

- (void)messageEntry:(id)a3 didAppearFromTargetWithIdentifier:(id)a4 atTime:(id)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if (![(IAMImpressionManager *)self _startImpressionForMessageEntry:v8 fromTargetWithIdentifier:v9 displayStartTime:a5])
  {
    uint64_t v10 = IAMLogCategoryDefault();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [v8 applicationMessage];
      uint64_t v12 = [v11 identifier];
      int v13 = 138543618;
      v14 = v12;
      __int16 v15 = 2114;
      id v16 = v9;
      _os_log_impl(&dword_2188AF000, v10, OS_LOG_TYPE_DEFAULT, "Appearance has already been reported for message with identifier = %{public}@ from target with identifier = %{public}@", (uint8_t *)&v13, 0x16u);
    }
  }
}

- (void)messageWithIdentifier:(id)a3 didDisappearFromTargetWithIdentifier:(id)a4 atTime:(id)a5
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if (![(IAMImpressionManager *)self _endImpressionForMessageWithIdentifier:v8 fromTargetWithIdentifier:v9 displayEndTime:a5])
  {
    uint64_t v10 = IAMLogCategoryDefault();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543618;
      id v12 = v8;
      __int16 v13 = 2114;
      id v14 = v9;
      _os_log_impl(&dword_2188AF000, v10, OS_LOG_TYPE_DEFAULT, "Appearance of message with identifier = %{public}@ has not previously been reported from target with identifier = %{public}@", (uint8_t *)&v11, 0x16u);
    }
  }
}

- (BOOL)_startImpressionForMessageEntry:(id)a3 fromTargetWithIdentifier:(id)a4 displayStartTime:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v11 = 8;
  if (!self->_isApplicationActive) {
    uint64_t v11 = 16;
  }
  id v12 = *(id *)((char *)&self->super.isa + v11);
  __int16 v13 = [v8 applicationMessage];
  id v14 = [v13 identifier];

  uint64_t v15 = [v12 objectForKeyedSubscript:v14];
  if (!v15)
  {
    uint64_t v15 = objc_opt_new();
    [v12 setObject:v15 forKeyedSubscript:v14];
  }
  id v16 = [v15 objectForKeyedSubscript:v9];

  if (!v16)
  {
    uint64_t v17 = (void *)[objc_alloc(MEMORY[0x263F4B608]) initWithMessageEntry:v8 targetIdentifier:v9];
    long long v18 = v17;
    if (self->_isApplicationActive) {
      [v17 setDisplayStartTime:v10];
    }
    [v15 setObject:v18 forKeyedSubscript:v9];
  }
  os_unfair_lock_unlock(&self->_lock);

  return v16 == 0;
}

- (BOOL)_endImpressionForMessageWithIdentifier:(id)a3 fromTargetWithIdentifier:(id)a4 displayEndTime:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v11 = 8;
  if (!self->_isApplicationActive) {
    uint64_t v11 = 16;
  }
  id v12 = *(id *)((char *)&self->super.isa + v11);
  __int16 v13 = [v12 objectForKeyedSubscript:v8];
  id v14 = v13;
  if (v13)
  {
    uint64_t v15 = [v13 objectForKeyedSubscript:v9];
    BOOL v16 = v15 != 0;
    if (v15)
    {
      [v14 removeObjectForKey:v9];
      if (![v14 count]) {
        [v12 removeObjectForKey:v8];
      }
      if (self->_isApplicationActive)
      {
        [v15 setDisplayEndTime:v10];
        [(IAMImpressionManager *)self _reportImpression:v15];
      }
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  os_unfair_lock_unlock(&self->_lock);
  return v16;
}

- (void)_transitionToInactiveState
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF910] date];
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_isApplicationActive = 0;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obj = self->_activeImpressionForMessageIdentifierFromTargetIdentifier;
  uint64_t v4 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v23;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = -[NSMutableDictionary objectForKeyedSubscript:](self->_activeImpressionForMessageIdentifierFromTargetIdentifier, "objectForKeyedSubscript:", *(void *)(*((void *)&v22 + 1) + 8 * v7), lock);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v19;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v19 != v11) {
                objc_enumerationMutation(v8);
              }
              __int16 v13 = [v8 objectForKeyedSubscript:*(void *)(*((void *)&v18 + 1) + 8 * v12)];
              [v13 setDisplayEndTime:v3];
              [(IAMImpressionManager *)self _reportImpression:v13];

              ++v12;
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }
          while (v10);
        }

        ++v7;
      }
      while (v7 != v5);
      uint64_t v5 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v5);
  }

  objc_storeStrong((id *)&self->_inactiveImpressionForMessageIdentifierFromTargetIdentifier, self->_activeImpressionForMessageIdentifierFromTargetIdentifier);
  id v14 = (NSMutableDictionary *)objc_opt_new();
  activeImpressionForMessageIdentifierFromTargetIdentifier = self->_activeImpressionForMessageIdentifierFromTargetIdentifier;
  self->_activeImpressionForMessageIdentifierFromTargetIdentifier = v14;

  os_unfair_lock_unlock(lock);
}

- (void)_reportImpression:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 displayStartTime];

  if (!v5)
  {
    uint64_t v12 = IAMLogCategoryDefault();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      __int16 v13 = [v4 messageIdentifier];
      id v14 = [v4 targetIdentifier];
      int v16 = 138543618;
      uint64_t v17 = v13;
      __int16 v18 = 2114;
      long long v19 = v14;
      uint64_t v15 = "Impression for message with identifier = %{public}@ from target with identifier = %{public}@ could not be re"
            "ported without a display start time";
LABEL_12:
      _os_log_impl(&dword_2188AF000, v12, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v16, 0x16u);
    }
LABEL_13:

    goto LABEL_14;
  }
  uint64_t v6 = [v4 displayEndTime];

  if (!v6)
  {
    uint64_t v12 = IAMLogCategoryDefault();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      __int16 v13 = [v4 messageIdentifier];
      id v14 = [v4 targetIdentifier];
      int v16 = 138543618;
      uint64_t v17 = v13;
      __int16 v18 = 2114;
      long long v19 = v14;
      uint64_t v15 = "Impression for message with identifier = %{public}@ from target with identifier = %{public}@ could not be re"
            "ported without a display end time";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  uint64_t v7 = [(IAMImpressionManager *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    uint64_t v9 = [(IAMImpressionManager *)self delegate];
    uint64_t v10 = [v4 messageEntry];
    [v9 impressionManager:self impressionDidEndForMessageEntry:v10];
  }
  uint64_t v11 = [v4 reportableMetricsEventDictionary];
  if (v11) {
    [(IAMImpressionManager *)self _reportImpressionEventWithDictionary:v11];
  }

LABEL_14:
}

- (void)_reportImpressionEventWithDictionary:(id)a3
{
  id v7 = a3;
  id v4 = [(IAMImpressionManager *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    uint64_t v6 = [(IAMImpressionManager *)self delegate];
    [v6 impressionManager:self shouldReportImpressionEventWithDictionary:v7];
  }
}

- (IAMImpressionManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IAMImpressionManagerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_inactiveImpressionForMessageIdentifierFromTargetIdentifier, 0);

  objc_storeStrong((id *)&self->_activeImpressionForMessageIdentifierFromTargetIdentifier, 0);
}

@end
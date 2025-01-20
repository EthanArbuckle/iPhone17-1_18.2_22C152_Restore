@interface BLSHFlipbookPowerSavingProvider
- (BLSHFlipbook)flipbook;
- (BLSHFlipbookPowerSavingProvider)init;
- (BOOL)isFlipbookPowerSavingEnabled;
- (NSString)description;
- (id)lock_description;
- (void)decrementDisablePowerSavingUsageCountForReason:(unint64_t)a3;
- (void)incrementDisablePowerSavingUsageCountForReason:(unint64_t)a3;
- (void)setFlipbook:(id)a3;
@end

@implementation BLSHFlipbookPowerSavingProvider

- (BLSHFlipbookPowerSavingProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)BLSHFlipbookPowerSavingProvider;
  result = [(BLSHFlipbookPowerSavingProvider *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (BLSHFlipbook)flipbook
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lock_flipbook);
  os_unfair_lock_unlock(p_lock);

  return (BLSHFlipbook *)WeakRetained;
}

- (void)setFlipbook:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  BOOL v6 = self->_lock_count == 0;
  objc_storeWeak((id *)&self->_lock_flipbook, v5);
  [v5 setPowerSavingEnabled:v6];

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isFlipbookPowerSavingEnabled
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  char v4 = self->_lock_count == 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lock_flipbook);
  BOOL v6 = WeakRetained;
  if (WeakRetained) {
    char v4 = [WeakRetained isPowerSavingEnabled];
  }
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)incrementDisablePowerSavingUsageCountForReason:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (a3 >= 8) {
    -[BLSHFlipbookPowerSavingProvider incrementDisablePowerSavingUsageCountForReason:]();
  }
  unint64_t lock_count = self->_lock_count;
  self->_unint64_t lock_count = lock_count + 1;
  ++self->_lock_reasonsCount[a3];
  v7 = bls_assertions_log();
  id WeakRetained = v7;
  if (lock_count)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[BLSHFlipbookPowerSavingProvider incrementDisablePowerSavingUsageCountForReason:](self, WeakRetained);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v9 = [(BLSHFlipbookPowerSavingProvider *)self lock_description];
      int v10 = 134218242;
      v11 = self;
      __int16 v12 = 2114;
      v13 = v9;
      _os_log_impl(&dword_21FCFC000, WeakRetained, OS_LOG_TYPE_INFO, "%p did disable power savings: %{public}@", (uint8_t *)&v10, 0x16u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_lock_flipbook);
    [WeakRetained setPowerSavingEnabled:0];
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)decrementDisablePowerSavingUsageCountForReason:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t lock_count = self->_lock_count;
  if (!lock_count) {
    -[BLSHFlipbookPowerSavingProvider decrementDisablePowerSavingUsageCountForReason:]();
  }
  if (a3 >= 8) {
    -[BLSHFlipbookPowerSavingProvider decrementDisablePowerSavingUsageCountForReason:]();
  }
  unint64_t v7 = lock_count - 1;
  self->_unint64_t lock_count = lock_count - 1;
  --self->_lock_reasonsCount[a3];
  v8 = bls_assertions_log();
  id WeakRetained = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      [(BLSHFlipbookPowerSavingProvider *)self decrementDisablePowerSavingUsageCountForReason:WeakRetained];
    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v10 = [(BLSHFlipbookPowerSavingProvider *)self lock_description];
      int v11 = 134218498;
      __int16 v12 = self;
      __int16 v13 = 2048;
      unint64_t v14 = a3;
      __int16 v15 = 2114;
      v16 = v10;
      _os_log_impl(&dword_21FCFC000, WeakRetained, OS_LOG_TYPE_INFO, "%p did enable power savings after removing reason:%ld – %{public}@", (uint8_t *)&v11, 0x20u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_lock_flipbook);
    [WeakRetained setPowerSavingEnabled:1];
  }

  os_unfair_lock_unlock(p_lock);
}

- (NSString)description
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  char v4 = [(BLSHFlipbookPowerSavingProvider *)self lock_description];
  os_unfair_lock_unlock(p_lock);

  return (NSString *)v4;
}

- (id)lock_description
{
  if (self->_lock_count)
  {
    objc_super v3 = objc_opt_new();
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __51__BLSHFlipbookPowerSavingProvider_lock_description__block_invoke;
    v6[3] = &unk_264532C18;
    v6[4] = self;
    [v3 appendCustomFormatWithName:0 block:v6];
    char v4 = [v3 description];
  }
  else
  {
    char v4 = @"powerSavingsEnabled";
  }

  return v4;
}

void __51__BLSHFlipbookPowerSavingProvider_lock_description__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  objc_msgSend(v6, "appendFormat:", @"powerSavingsDisabled(%llu):", *(void *)(*(void *)(a1 + 32) + 24));
  objc_super v3 = *(void **)(a1 + 32);
  if (v3[5])
  {
    [v6 appendFormat:@"event(%llu), ", v3[5]];
    objc_super v3 = *(void **)(a1 + 32);
  }
  if (v3[6])
  {
    [v6 appendFormat:@"transitionStep(%llu), ", v3[6]];
    objc_super v3 = *(void **)(a1 + 32);
  }
  char v4 = v6;
  if (v3[7])
  {
    [v6 appendFormat:@"session(%llu), ", v3[7]];
    char v4 = v6;
    objc_super v3 = *(void **)(a1 + 32);
  }
  if (v3[8])
  {
    [v6 appendFormat:@"engineStep(%llu), ", v3[8]];
    char v4 = v6;
    objc_super v3 = *(void **)(a1 + 32);
  }
  if (v3[9])
  {
    [v6 appendFormat:@"dates(%llu), ", v3[9]];
    char v4 = v6;
    objc_super v3 = *(void **)(a1 + 32);
  }
  if (v3[10])
  {
    [v6 appendFormat:@"invalidate(%llu), ", v3[10]];
    char v4 = v6;
    objc_super v3 = *(void **)(a1 + 32);
  }
  if (v3[11])
  {
    [v6 appendFormat:@"misc(%llu), ", v3[11]];
    char v4 = v6;
    objc_super v3 = *(void **)(a1 + 32);
  }
  uint64_t v5 = v3[4];
  if (v5)
  {
    [v6 appendFormat:@"unknown(%llu), ", v5];
    char v4 = v6;
  }
}

- (void).cxx_destruct
{
}

- (void)incrementDisablePowerSavingUsageCountForReason:.cold.1()
{
}

- (void)incrementDisablePowerSavingUsageCountForReason:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  objc_super v3 = objc_msgSend(a1, "lock_description");
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_10(&dword_21FCFC000, a2, v4, "%p did increment power savings: %{public}@", v5);
}

- (void)decrementDisablePowerSavingUsageCountForReason:.cold.1()
{
}

- (void)decrementDisablePowerSavingUsageCountForReason:.cold.2()
{
}

- (void)decrementDisablePowerSavingUsageCountForReason:(NSObject *)a3 .cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v6 = objc_msgSend(a1, "lock_description");
  int v7 = 134218498;
  v8 = a1;
  __int16 v9 = 2048;
  uint64_t v10 = a2;
  __int16 v11 = 2114;
  __int16 v12 = v6;
  _os_log_debug_impl(&dword_21FCFC000, a3, OS_LOG_TYPE_DEBUG, "%p did decrement power savings after removing reason:%ld remaining: %{public}@", (uint8_t *)&v7, 0x20u);
}

@end
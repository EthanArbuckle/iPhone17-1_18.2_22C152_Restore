@interface _LTLanguageStatus
- (BOOL)useDedicatedMachPort;
- (NSArray)cachedStatus;
- (NSUUID)identifier;
- (_LTLanguageStatus)initWithObservationType:(unint64_t)a3 useDedicatedMachPort:(BOOL)a4 observations:(id)a5;
- (id)description;
- (id)observations;
- (unint64_t)observationType;
- (void)_start;
- (void)cancel;
- (void)dealloc;
@end

@implementation _LTLanguageStatus

- (_LTLanguageStatus)initWithObservationType:(unint64_t)a3 useDedicatedMachPort:(BOOL)a4 observations:(id)a5
{
  id v8 = a5;
  v22.receiver = self;
  v22.super_class = (Class)_LTLanguageStatus;
  v9 = [(_LTLanguageStatus *)&v22 init];
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    uint64_t v11 = [MEMORY[0x263F08C38] UUID];
    identifier = v10->_identifier;
    v10->_identifier = (NSUUID *)v11;

    v10->_observationType = a3;
    v10->_useDedicatedMachPort = a4;
    objc_initWeak(&location, v10);
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __79___LTLanguageStatus_initWithObservationType_useDedicatedMachPort_observations___block_invoke;
    aBlock[3] = &unk_2651DBAE8;
    objc_copyWeak(&v20, &location);
    id v19 = v8;
    v13 = _Block_copy(aBlock);
    id observations = v10->_observations;
    v10->_id observations = v13;

    [(_LTLanguageStatus *)v10 _start];
    v15 = _LTOSLogAssets();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[_LTLanguageStatus initWithObservationType:useDedicatedMachPort:observations:]((uint64_t)v10, v15);
    }
    v16 = v10;

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_24639B000, a2, OS_LOG_TYPE_DEBUG, "LTLanguageStatus dealloc %@", (uint8_t *)&v2, 0xCu);
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<LTLanguageStatus %p> %@ retainCount: %ld", self, self->_identifier, CFGetRetainCount(self)];
}

- (void)_start
{
  id v3 = +[_LTLanguageStatusMulticaster shared];
  [v3 addObserver:self];
}

- (void)cancel
{
  p_lock = &self->_lock;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __27___LTLanguageStatus_cancel__block_invoke;
  v5[3] = &unk_2651DBC00;
  v5[4] = self;
  os_unfair_lock_lock(&self->_lock);
  __27___LTLanguageStatus_cancel__block_invoke((uint64_t)v5);
  os_unfair_lock_unlock(p_lock);
  uint64_t v4 = +[_LTLanguageStatusMulticaster shared];
  [v4 removeObserver:self];
}

- (NSArray)cachedStatus
{
  return self->_cachedStatus;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (unint64_t)observationType
{
  return self->_observationType;
}

- (BOOL)useDedicatedMachPort
{
  return self->_useDedicatedMachPort;
}

- (id)observations
{
  return self->_observations;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_observations, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_cachedStatus, 0);
}

- (void)initWithObservationType:(uint64_t)a1 useDedicatedMachPort:(NSObject *)a2 observations:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_24639B000, a2, OS_LOG_TYPE_DEBUG, "LTLanguageStatus alloc %@", (uint8_t *)&v2, 0xCu);
}

@end
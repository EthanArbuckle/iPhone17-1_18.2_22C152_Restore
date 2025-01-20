@interface ENLoggingPrefs
+ (id)sharedENLoggingPrefs;
- (BOOL)isRPILoggingAllowed;
- (BOOL)isSensitiveLoggingAllowed;
- (ENLoggingPrefs)init;
- (void)loadLoggingPrefs;
- (void)setLoggingEntitledApp:(BOOL)a3;
@end

@implementation ENLoggingPrefs

- (BOOL)isSensitiveLoggingAllowed
{
  return self->_sensitiveLoggingEnabled;
}

+ (id)sharedENLoggingPrefs
{
  if (sharedENLoggingPrefs_sOnce != -1) {
    dispatch_once(&sharedENLoggingPrefs_sOnce, &__block_literal_global);
  }
  v2 = (void *)sharedENLoggingPrefs_sSelf;

  return v2;
}

uint64_t __38__ENLoggingPrefs_sharedENLoggingPrefs__block_invoke()
{
  v0 = objc_alloc_init(ENLoggingPrefs);
  uint64_t v1 = sharedENLoggingPrefs_sSelf;
  sharedENLoggingPrefs_sSelf = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (ENLoggingPrefs)init
{
  v6.receiver = self;
  v6.super_class = (Class)ENLoggingPrefs;
  v2 = [(ENLoggingPrefs *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(ENLoggingPrefs *)v2 loadLoggingPrefs];
    v4 = v3;
  }

  return v3;
}

- (void)setLoggingEntitledApp:(BOOL)a3
{
  CFPrefs_SetValue();

  [(ENLoggingPrefs *)self loadLoggingPrefs];
}

- (void)loadLoggingPrefs
{
  uint64_t Int64 = CFPrefs_GetInt64();
  uint64_t v4 = CFPrefs_GetInt64();
  uint64_t v5 = CFPrefs_GetInt64();
  uint64_t v6 = CFPrefs_GetInt64();
  self->_sensitiveLoggingEnabled = Int64 != 0;
  if (IsAppleInternalBuild()) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  BOOL v9 = v7 || v6 != 0;
  if (!Int64) {
    BOOL v9 = 0;
  }
  if (!v4) {
    BOOL v9 = 0;
  }
  self->_rpiLoggingEnabled = v9;
  if (gLogCategory__ENLoggingPrefs <= 50
    && (gLogCategory__ENLoggingPrefs != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

- (BOOL)isRPILoggingAllowed
{
  return self->_rpiLoggingEnabled;
}

@end
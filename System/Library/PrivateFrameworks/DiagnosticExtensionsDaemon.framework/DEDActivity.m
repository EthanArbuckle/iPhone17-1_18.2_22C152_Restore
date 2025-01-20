@interface DEDActivity
+ (id)sharedInstance;
- (OS_os_activity)cleanup;
- (id)currentCleanupActivity;
- (id)newCleanupActivity;
- (void)setCleanup:(id)a3;
@end

@implementation DEDActivity

+ (id)sharedInstance
{
  if (sharedInstance_once != -1) {
    dispatch_once(&sharedInstance_once, &__block_literal_global_2);
  }
  v2 = (void *)sharedInstance_shared;
  return v2;
}

uint64_t __29__DEDActivity_sharedInstance__block_invoke()
{
  sharedInstance_shared = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (id)newCleanupActivity
{
  os_activity_t v3 = _os_activity_create(&dword_21FE04000, "Old Sessions Cleanup", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  [(DEDActivity *)self setCleanup:v3];

  [(DEDActivity *)self cleanup];
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)currentCleanupActivity
{
  os_activity_t v3 = [(DEDActivity *)self cleanup];
  if (v3)
  {
    id v4 = [(DEDActivity *)self cleanup];
  }
  else
  {
    id v4 = [(DEDActivity *)self newCleanupActivity];
  }
  v5 = v4;

  return v5;
}

- (OS_os_activity)cleanup
{
  return (OS_os_activity *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCleanup:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
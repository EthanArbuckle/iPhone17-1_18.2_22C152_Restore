@interface LockdownModeManager
+ (id)shared;
- (BOOL)enabled;
- (BOOL)enabledInAccount;
- (LockdownModeManager)init;
- (LockdownModeManagerInternal)underlyingObject;
- (void)enableIfNeeded:(BOOL)a3 completion:(id)a4;
- (void)getEnabledInAccount:(BOOL)a3 completion:(id)a4;
- (void)migrateIfNeededWithCompletion:(id)a3;
- (void)notifyRestrictionChanged:(id)a3;
- (void)rebootIfNeeded;
- (void)setEnabled:(BOOL)a3 options:(id)a4 completion:(id)a5;
@end

@implementation LockdownModeManager

uint64_t __29__LockdownModeManager_shared__block_invoke()
{
  shared_lockdownModeManager = objc_alloc_init(LockdownModeManager);

  return MEMORY[0x270F9A758]();
}

- (LockdownModeManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)LockdownModeManager;
  v2 = [(LockdownModeManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    underlyingObject = v2->_underlyingObject;
    v2->_underlyingObject = (LockdownModeManagerInternal *)v3;
  }
  return v2;
}

+ (id)shared
{
  if (shared_onceToken != -1) {
    dispatch_once(&shared_onceToken, &__block_literal_global);
  }
  v2 = (void *)shared_lockdownModeManager;

  return v2;
}

- (BOOL)enabled
{
  v2 = [(LockdownModeManager *)self underlyingObject];
  char v3 = [v2 enabled];

  return v3;
}

- (LockdownModeManagerInternal)underlyingObject
{
  return (LockdownModeManagerInternal *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)enabledInAccount
{
  v2 = [(LockdownModeManager *)self underlyingObject];
  char v3 = [v2 enabledInAccount];

  return v3;
}

- (void)setEnabled:(BOOL)a3 options:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = [(LockdownModeManager *)self underlyingObject];
  [v10 setEnabled:v6 options:v9 completion:v8];
}

- (void)getEnabledInAccount:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(LockdownModeManager *)self underlyingObject];
  [v7 getEnabledInAccount:v4 completion:v6];
}

- (void)notifyRestrictionChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(LockdownModeManager *)self underlyingObject];
  [v5 notifyRestrictionChanged:v4];
}

- (void)enableIfNeeded:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(LockdownModeManager *)self underlyingObject];
  [v7 enableIfNeeded:v4 completion:v6];
}

- (void)migrateIfNeededWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(LockdownModeManager *)self underlyingObject];
  [v5 migrateIfNeededWithCompletion:v4];
}

- (void)rebootIfNeeded
{
  id v2 = [(LockdownModeManager *)self underlyingObject];
  [v2 rebootIfNeeded];
}

- (void).cxx_destruct
{
}

@end
@interface LACPasscodeHelper
+ (id)sharedInstance;
- (BOOL)isPasscodeSetForUser:(unsigned int)a3 error:(id *)a4;
- (LACPasscodeHelper)init;
- (double)passcodeSuccessAge;
- (void)_notifyObserversAboutUpdate;
- (void)_updatePasscodeSuccessAgeWithUptime:(id)a3;
- (void)addObserver:(id)a3;
- (void)keybagStateDidChange:(id)a3;
- (void)removeObserver:(id)a3;
- (void)updatePasscodeSuccessAgeWithCurrentSystemUptime;
@end

@implementation LACPasscodeHelper

- (BOOL)isPasscodeSetForUser:(unsigned int)a3 error:(id *)a4
{
  v5 = objc_msgSend(MEMORY[0x263F53C58], "sharedConnection", *(void *)&a3);
  int v6 = [v5 isPasscodeSet];

  if (a4)
  {
    if (v6)
    {
      *a4 = 0;
    }
    else
    {
      id v7 = +[LACError errorWithCode:-5 debugDescription:@"Passcode not set."];
      *a4 = v7;
    }
  }
  return v6;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_7);
  }
  v2 = (void *)sharedInstance_sharedInstance_2;
  return v2;
}

uint64_t __35__LACPasscodeHelper_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_2 = objc_alloc_init(LACPasscodeHelper);
  return MEMORY[0x270F9A758]();
}

- (LACPasscodeHelper)init
{
  v8.receiver = self;
  v8.super_class = (Class)LACPasscodeHelper;
  v2 = [(LACPasscodeHelper *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    v5 = [[LACKeyBagMKBAdapter alloc] initWithUserId:geteuid()];
    keyBagAdapter = v2->_keyBagAdapter;
    v2->_keyBagAdapter = v5;

    [(LACKeyBagMKBAdapter *)v2->_keyBagAdapter addObserver:v2];
  }
  return v2;
}

- (void)updatePasscodeSuccessAgeWithCurrentSystemUptime
{
}

- (void)_updatePasscodeSuccessAgeWithUptime:(id)a3
{
  if (a3)
  {
    [a3 doubleValue];
    self->_lastPasscodeSuccessUptime = v4;
  }
  else
  {
    id v6 = [MEMORY[0x263F08AB0] processInfo];
    [v6 systemUptime];
    self->_lastPasscodeSuccessUptime = v5;
  }
}

- (double)passcodeSuccessAge
{
  double result = 0.0;
  if (self->_lastPasscodeSuccessUptime > 0.0)
  {
    double v4 = objc_msgSend(MEMORY[0x263F08AB0], "processInfo", 0.0);
    [v4 systemUptime];
    double v6 = v5;

    return v6 - self->_lastPasscodeSuccessUptime;
  }
  return result;
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)_notifyObserversAboutUpdate
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = (void *)MEMORY[0x263EFF8C0];
  double v4 = [(NSHashTable *)self->_observers allObjects];
  double v5 = [v3 arrayWithArray:v4];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 passcodeSetDidChangeForHelper:self];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)keybagStateDidChange:(id)a3
{
  uint64_t v4 = [a3 state];
  keyBagDisabled = self->_keyBagDisabled;
  if (!keyBagDisabled || (v4 == 1) != [(NSNumber *)keyBagDisabled BOOLValue])
  {
    [NSNumber numberWithBool:v4 == 1];
    uint64_t v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = self->_keyBagDisabled;
    self->_keyBagDisabled = v6;

    [(LACPasscodeHelper *)self _notifyObserversAboutUpdate];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyBagDisabled, 0);
  objc_storeStrong((id *)&self->_keyBagAdapter, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
@interface VSRestrictionsCenter
+ (id)defaultRestrictionsCenter;
- (BOOL)_canInstallAppsAtAll;
- (BOOL)canInstallAppWithRating:(int64_t)a3;
- (BOOL)isAcountModificationAllowed;
- (VSManagedProfileConnection)profileConnection;
- (VSRestrictionsCenter)init;
- (void)_updateAccountModificationAllowed;
- (void)dealloc;
- (void)profileConnectionSettingsChanged:(id)a3;
- (void)setAccountModificationAllowed:(BOOL)a3;
- (void)setProfileConnection:(id)a3;
@end

@implementation VSRestrictionsCenter

+ (id)defaultRestrictionsCenter
{
  if (defaultRestrictionsCenter___vs_lazy_init_predicate != -1) {
    dispatch_once(&defaultRestrictionsCenter___vs_lazy_init_predicate, &__block_literal_global_8);
  }
  v2 = (void *)defaultRestrictionsCenter___vs_lazy_init_variable;

  return v2;
}

uint64_t __49__VSRestrictionsCenter_defaultRestrictionsCenter__block_invoke()
{
  defaultRestrictionsCenter___vs_lazy_init_variable = objc_alloc_init(VSRestrictionsCenter);

  return MEMORY[0x1F41817F8]();
}

- (VSRestrictionsCenter)init
{
  v7.receiver = self;
  v7.super_class = (Class)VSRestrictionsCenter;
  v2 = [(VSRestrictionsCenter *)&v7 init];
  if (v2)
  {
    v3 = +[VSManagedProfileConnection sharedConnection];
    profileConnection = v2->_profileConnection;
    v2->_profileConnection = v3;
    v5 = v3;

    [(VSManagedProfileConnection *)v5 registerObserver:v2];
    [(VSRestrictionsCenter *)v2 _updateAccountModificationAllowed];
  }
  return v2;
}

- (void)dealloc
{
  [(VSManagedProfileConnection *)self->_profileConnection unregisterObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)VSRestrictionsCenter;
  [(VSRestrictionsCenter *)&v3 dealloc];
}

- (void)_updateAccountModificationAllowed
{
  id v4 = [(VSRestrictionsCenter *)self profileConnection];
  BOOL v3 = [v4 accountModificationAllowed] != 2 && objc_msgSend(v4, "TVProviderModificationAllowed") != 2;
  [(VSRestrictionsCenter *)self setAccountModificationAllowed:v3];
}

- (BOOL)_canInstallAppsAtAll
{
  v2 = [(VSRestrictionsCenter *)self profileConnection];
  BOOL v3 = [v2 appInstallationAllowed] != 2 && objc_msgSend(v2, "UIAppInstallationAllowed") != 2;

  return v3;
}

- (BOOL)canInstallAppWithRating:(int64_t)a3
{
  BOOL v5 = [(VSRestrictionsCenter *)self _canInstallAppsAtAll];
  v6 = [(VSRestrictionsCenter *)self profileConnection];
  int64_t v7 = [v6 maximumAppsRating];
  BOOL v8 = v7 >= a3 && v5;
  if (a3 < 0) {
    BOOL v8 = 0;
  }
  if (v7 == 1000) {
    BOOL v8 = v5;
  }
  if (v7) {
    BOOL v9 = v8;
  }
  else {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)profileConnectionSettingsChanged:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __57__VSRestrictionsCenter_profileConnectionSettingsChanged___block_invoke;
  v3[3] = &unk_1E6BD29A8;
  v3[4] = self;
  VSPerformBlockOnMainThread(v3);
}

uint64_t __57__VSRestrictionsCenter_profileConnectionSettingsChanged___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAccountModificationAllowed];
}

- (BOOL)isAcountModificationAllowed
{
  return self->_accountModificationAllowed;
}

- (void)setAccountModificationAllowed:(BOOL)a3
{
  self->_accountModificationAllowed = a3;
}

- (VSManagedProfileConnection)profileConnection
{
  return self->_profileConnection;
}

- (void)setProfileConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
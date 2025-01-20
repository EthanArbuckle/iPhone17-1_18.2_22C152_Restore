@interface CRKClassKitAccountStateProvider
- (ACAccountStore)accountStore;
- (CRKClassKitAccountStateProvider)init;
- (int64_t)accountState;
- (int64_t)currentAccountState;
- (void)accountStoreDidChange:(id)a3;
- (void)beginObservingAccountChanges;
- (void)dealloc;
- (void)endObservingAccountChanges;
- (void)setAccountState:(int64_t)a3;
- (void)updateAccountState;
@end

@implementation CRKClassKitAccountStateProvider

- (void)dealloc
{
  [(CRKClassKitAccountStateProvider *)self endObservingAccountChanges];
  v3.receiver = self;
  v3.super_class = (Class)CRKClassKitAccountStateProvider;
  [(CRKClassKitAccountStateProvider *)&v3 dealloc];
}

- (CRKClassKitAccountStateProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)CRKClassKitAccountStateProvider;
  v2 = [(CRKClassKitAccountStateProvider *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFB210] defaultStore];
    accountStore = v2->_accountStore;
    v2->_accountStore = (ACAccountStore *)v3;

    [(CRKClassKitAccountStateProvider *)v2 beginObservingAccountChanges];
    [(CRKClassKitAccountStateProvider *)v2 updateAccountState];
  }
  return v2;
}

- (void)beginObservingAccountChanges
{
  id v3 = [MEMORY[0x263F087C8] defaultCenter];
  [v3 addObserver:self selector:sel_accountStoreDidChange_ name:*MEMORY[0x263EFB060] object:0];
}

- (void)endObservingAccountChanges
{
  id v3 = [MEMORY[0x263F087C8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263EFB060] object:0];
}

- (void)accountStoreDidChange:(id)a3
{
  if ((objc_msgSend(MEMORY[0x263F08B88], "isMainThread", a3) & 1) == 0)
  {
    v5 = [MEMORY[0x263F08690] currentHandler];
    objc_super v6 = NSStringFromSelector(a2);
    [v5 handleFailureInMethod:a2, self, @"CRKClassKitAccountStateProvider.m", 65, @"%@ must be called from the main thread", v6 object file lineNumber description];
  }

  [(CRKClassKitAccountStateProvider *)self updateAccountState];
}

- (void)updateAccountState
{
  int64_t v3 = [(CRKClassKitAccountStateProvider *)self accountState];
  if (v3 != [(CRKClassKitAccountStateProvider *)self currentAccountState])
  {
    int64_t v4 = [(CRKClassKitAccountStateProvider *)self currentAccountState];
    [(CRKClassKitAccountStateProvider *)self setAccountState:v4];
  }
}

- (int64_t)currentAccountState
{
  v2 = [MEMORY[0x263F841B0] sharedManager];
  int64_t v3 = [v2 currentUser];
  char v4 = [v3 isLoginUser];

  if (v4) {
    return 1;
  }
  if ([MEMORY[0x263EFCEE0] isAvailable]) {
    return 2;
  }
  return 0;
}

- (int64_t)accountState
{
  return self->_accountState;
}

- (void)setAccountState:(int64_t)a3
{
  self->_accountState = a3;
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void).cxx_destruct
{
}

@end
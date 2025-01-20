@interface MULockScreenCoordinator
- (MULockScreenCoordinator)initWithPasscodeProvider:(id)a3;
- (void)performActionIfSuccessfullyAuthenticated:(id)a3;
@end

@implementation MULockScreenCoordinator

- (MULockScreenCoordinator)initWithPasscodeProvider:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MULockScreenCoordinator;
  v5 = [(MULockScreenCoordinator *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id passcodeProvider = v5->_passcodeProvider;
    v5->_id passcodeProvider = (id)v6;
  }
  return v5;
}

- (void)performActionIfSuccessfullyAuthenticated:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __68__MULockScreenCoordinator_performActionIfSuccessfullyAuthenticated___block_invoke;
    v5[3] = &unk_1E57501A8;
    id v6 = v4;
    objc_copyWeak(&v7, &location);
    +[MapsUIUtilities checkDeviceLockStatusWithCompletion:v5];
    objc_destroyWeak(&v7);

    objc_destroyWeak(&location);
  }
}

void __68__MULockScreenCoordinator_performActionIfSuccessfullyAuthenticated___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v4 = WeakRetained;
    if (WeakRetained)
    {
      uint64_t v5 = *((void *)WeakRetained + 1);
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __68__MULockScreenCoordinator_performActionIfSuccessfullyAuthenticated___block_invoke_2;
      v7[3] = &unk_1E5750180;
      id v8 = *(id *)(a1 + 32);
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v7);
    }
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v6();
  }
}

uint64_t __68__MULockScreenCoordinator_performActionIfSuccessfullyAuthenticated___block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (void).cxx_destruct
{
}

@end
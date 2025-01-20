@interface LACPreboardLauncher
- (LACPreboardLauncher)init;
- (id)_alternateSystemApp;
- (void)_alternateSystemApp;
- (void)_finishLaunchingWithError:(id)a3;
- (void)alternateSystemApp:(id)a3 didExitWithStatus:(int)a4;
- (void)alternateSystemApp:(id)a3 didFailToLaunchWithError:(id)a4;
- (void)alternateSystemApp:(id)a3 didTerminateWithSignal:(int)a4;
- (void)alternateSystemAppDidLaunch:(id)a3;
- (void)launchPreboardWithCompletion:(id)a3;
@end

@implementation LACPreboardLauncher

- (LACPreboardLauncher)init
{
  v10.receiver = self;
  v10.super_class = (Class)LACPreboardLauncher;
  v2 = [(LACPreboardLauncher *)&v10 init];
  v3 = v2;
  if (v2)
  {
    id launchCompletion = v2->_launchCompletion;
    v2->_id launchCompletion = 0;

    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    uint64_t v7 = +[LACConcurrencyUtilities createUserInitiatedSerialQueueWithIdentifier:v6];
    workQueue = v3->_workQueue;
    v3->_workQueue = (OS_dispatch_queue *)v7;
  }
  return v3;
}

- (void)launchPreboardWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__LACPreboardLauncher_launchPreboardWithCompletion___block_invoke;
  v7[3] = &unk_2653B55B0;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __52__LACPreboardLauncher_launchPreboardWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained _alternateSystemApp];
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 40);
      if (*(void *)(*(void *)(a1 + 32) + 8))
      {
        id v6 = +[LACPreboardErrorBuilder genericErrorWithMessage:@"Preboard is already launched"];
        (*(void (**)(uint64_t, NSObject *))(v5 + 16))(v5, v6);
      }
      else
      {
        id v9 = _Block_copy(*(const void **)(a1 + 40));
        uint64_t v10 = *(void *)(a1 + 32);
        v11 = *(void **)(v10 + 8);
        *(void *)(v10 + 8) = v9;

        [v4 setDelegate:v3];
        [v4 activate];
        id v6 = LACLogPreboard();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v12 = 0;
          _os_log_impl(&dword_254F14000, v6, OS_LOG_TYPE_DEFAULT, "Preboard activated", v12, 2u);
        }
      }
    }
    else
    {
      uint64_t v7 = *(void *)(a1 + 40);
      id v8 = +[LACPreboardErrorBuilder genericErrorWithMessage:@"Unable to load BKSAlternateSystemApp"];
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
    }
  }
}

- (void)alternateSystemAppDidLaunch:(id)a3
{
  id v4 = LACLogPreboard();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_254F14000, v4, OS_LOG_TYPE_DEFAULT, "Preboard launched", v5, 2u);
  }

  [(LACPreboardLauncher *)self _finishLaunchingWithError:0];
}

- (void)alternateSystemApp:(id)a3 didFailToLaunchWithError:(id)a4
{
  id v5 = a4;
  id v6 = LACLogPreboard();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[LACPreboardLauncher alternateSystemApp:didFailToLaunchWithError:]((uint64_t)v5, v6);
  }

  [(LACPreboardLauncher *)self _finishLaunchingWithError:v5];
}

- (void)alternateSystemApp:(id)a3 didTerminateWithSignal:(int)a4
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v5 = LACLogPreboard();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = a4;
    _os_log_impl(&dword_254F14000, v5, OS_LOG_TYPE_DEFAULT, "Preboard terminated with signal: %d", (uint8_t *)v6, 8u);
  }
}

- (void)alternateSystemApp:(id)a3 didExitWithStatus:(int)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = LACLogPreboard();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v13 = a4;
    _os_log_impl(&dword_254F14000, v7, OS_LOG_TYPE_DEFAULT, "Preboard exited with code: %d", buf, 8u);
  }

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__LACPreboardLauncher_alternateSystemApp_didExitWithStatus___block_invoke;
  block[3] = &unk_2653B55D8;
  id v11 = v6;
  id v9 = v6;
  dispatch_async(workQueue, block);
}

uint64_t __60__LACPreboardLauncher_alternateSystemApp_didExitWithStatus___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) terminate];
}

- (id)_alternateSystemApp
{
  if (getBKSAlternateSystemAppClass())
  {
    v2 = (void *)[objc_alloc((Class)getBKSAlternateSystemAppClass()) initWithBundleId:@"com.apple.PreBoard"];
  }
  else
  {
    v3 = LACLogPreboard();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[LACPreboardLauncher _alternateSystemApp](v3);
    }

    v2 = 0;
  }
  return v2;
}

- (void)_finishLaunchingWithError:(id)a3
{
  id v4 = a3;
  id launchCompletion = self->_launchCompletion;
  if (launchCompletion)
  {
    id v9 = v4;
    id v6 = (void (**)(void *, void *))_Block_copy(launchCompletion);
    id v7 = self->_launchCompletion;
    self->_id launchCompletion = 0;

    if (v9)
    {
      id v8 = +[LACPreboardErrorBuilder genericErrorWithUnderlyingError:](_TtC23LocalAuthenticationCore23LACPreboardErrorBuilder, "genericErrorWithUnderlyingError:");
    }
    else
    {
      id v8 = 0;
    }
    v6[2](v6, v8);
  }
  MEMORY[0x270F9A758]();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong(&self->_launchCompletion, 0);
}

- (void)alternateSystemApp:(uint64_t)a1 didFailToLaunchWithError:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_254F14000, a2, OS_LOG_TYPE_ERROR, "Preboard did not launch with error: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_alternateSystemApp
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_254F14000, log, OS_LOG_TYPE_ERROR, "BKSAlternateSystemApp not available", v1, 2u);
}

@end
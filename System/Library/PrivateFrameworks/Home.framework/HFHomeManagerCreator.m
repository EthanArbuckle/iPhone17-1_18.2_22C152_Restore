@interface HFHomeManagerCreator
+ (BOOL)allowCreationInTest;
+ (void)setAllowCreationInTest:(BOOL)a3;
- (BOOL)_shouldCreateHomeManager;
- (HFHomeConfigurationStatus)homeStatus;
- (HFHomeManagerCreator)init;
- (HFHomeManagerCreator)initWithHostProcess:(int64_t)a3 configuration:(id)a4 homeStatus:(id)a5 delegate:(id)a6;
- (HFHomeManagerCreatorDelegate)delegate;
- (HMHomeManagerConfiguration)configuration;
- (id)_createHomeManager;
- (id)createHomeManagerIfNeeded;
- (int64_t)hostProcessType;
- (unint64_t)_homeManagerCreationPolicy;
- (unint64_t)creationPolicy;
- (void)_createHomeManagerOnQueue;
- (void)setConfiguration:(id)a3;
- (void)setCreationPolicy:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setHomeStatus:(id)a3;
- (void)setHostProcessType:(int64_t)a3;
@end

@implementation HFHomeManagerCreator

- (HFHomeManagerCreator)initWithHostProcess:(int64_t)a3 configuration:(id)a4 homeStatus:(id)a5 delegate:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HFHomeManagerCreator;
  v13 = [(HFHomeManagerCreator *)&v18 init];
  v14 = v13;
  if (v13)
  {
    v13->_hostProcessType = a3;
    objc_storeStrong((id *)&v13->_homeStatus, a5);
    objc_storeWeak((id *)&v14->_delegate, v12);
    v14->_creationPolicy = [(HFHomeManagerCreator *)v14 _homeManagerCreationPolicy];
    if (v10)
    {
      v15 = (HMHomeManagerConfiguration *)v10;
    }
    else
    {
      v15 = [MEMORY[0x263F0E3C8] defaultPrivateConfiguration];
    }
    configuration = v14->_configuration;
    v14->_configuration = v15;
  }
  return v14;
}

- (unint64_t)_homeManagerCreationPolicy
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  unint64_t v2 = [(HFHomeManagerCreator *)self hostProcessType] - 100;
  if (v2 > 2) {
    unint64_t v3 = 0;
  }
  else {
    unint64_t v3 = qword_20BD13878[v2];
  }
  v4 = HFLogForCategory(0x25uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    unint64_t v7 = v3;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "HMHomeManager creation policy: %lu", (uint8_t *)&v6, 0xCu);
  }

  return v3;
}

- (id)_createHomeManager
{
  if ([(HFHomeManagerCreator *)self hostProcessType] == 100
    || [(HFHomeManagerCreator *)self hostProcessType] == 101)
  {
    [(HFHomeManagerCreator *)self _createHomeManagerOnQueue];
    unint64_t v3 = 0;
  }
  else
  {
    id v4 = objc_alloc(MEMORY[0x263F0E3C0]);
    v5 = [(HFHomeManagerCreator *)self configuration];
    unint64_t v3 = (void *)[v4 initWithHomeMangerConfiguration:v5];
  }
  return v3;
}

- (int64_t)hostProcessType
{
  return self->_hostProcessType;
}

- (HMHomeManagerConfiguration)configuration
{
  return self->_configuration;
}

- (id)createHomeManagerIfNeeded
{
  if ([(HFHomeManagerCreator *)self _shouldCreateHomeManager])
  {
    unint64_t v3 = [(HFHomeManagerCreator *)self _createHomeManager];
  }
  else
  {
    unint64_t v3 = 0;
  }
  return v3;
}

- (BOOL)_shouldCreateHomeManager
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (!+[HFUtilities isInternalTest]
    || [(id)objc_opt_class() allowCreationInTest])
  {
    unint64_t v3 = [(HFHomeManagerCreator *)self creationPolicy];
    if (v3 == 1)
    {
      uint64_t v8 = [(HFHomeManagerCreator *)self homeStatus];
      int v5 = [v8 areAnyAccessoriesConfigured];

      int v6 = HFLogForCategory(0x25uLL);
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
LABEL_11:

        return v5;
      }
      int v10 = 67109120;
      int v11 = v5;
      unint64_t v7 = "areAnyAccessoriesConfigured: %d";
    }
    else
    {
      if (v3 != 2)
      {
        LOBYTE(v5) = 1;
        return v5;
      }
      id v4 = [(HFHomeManagerCreator *)self homeStatus];
      int v5 = [v4 areHomesConfigured];

      int v6 = HFLogForCategory(0x25uLL);
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_11;
      }
      int v10 = 67109120;
      int v11 = v5;
      unint64_t v7 = "areAnyHomesConfigured: %d";
    }
    _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, 8u);
    goto LABEL_11;
  }
  LOBYTE(v5) = 0;
  return v5;
}

- (unint64_t)creationPolicy
{
  return self->_creationPolicy;
}

+ (BOOL)allowCreationInTest
{
  return __allowCreationInTest;
}

+ (void)setAllowCreationInTest:(BOOL)a3
{
  __allowCreationInTest = a3;
}

- (HFHomeManagerCreator)init
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  int v5 = NSStringFromSelector(sel_initWithHostProcess_configuration_homeStatus_delegate_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFHomeManagerCreator.m", 59, @"%s is unavailable; use %@ instead",
    "-[HFHomeManagerCreator init]",
    v5);

  return 0;
}

- (void)_createHomeManagerOnQueue
{
  objc_initWeak(&location, self);
  unint64_t v2 = dispatch_get_global_queue(0, 0);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __49__HFHomeManagerCreator__createHomeManagerOnQueue__block_invoke;
  v3[3] = &unk_26408E550;
  objc_copyWeak(&v4, &location);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __49__HFHomeManagerCreator__createHomeManagerOnQueue__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = objc_alloc(MEMORY[0x263F0E3C0]);
  unint64_t v2 = [WeakRetained configuration];
  unint64_t v3 = (void *)[v1 initWithHomeMangerConfiguration:v2];

  id v4 = [WeakRetained delegate];
  [v4 homeManagerWasCreated:v3];
}

- (void)setConfiguration:(id)a3
{
}

- (void)setHostProcessType:(int64_t)a3
{
  self->_hostProcessType = a3;
}

- (void)setCreationPolicy:(unint64_t)a3
{
  self->_creationPolicy = a3;
}

- (HFHomeConfigurationStatus)homeStatus
{
  return self->_homeStatus;
}

- (void)setHomeStatus:(id)a3
{
}

- (HFHomeManagerCreatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HFHomeManagerCreatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_homeStatus, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
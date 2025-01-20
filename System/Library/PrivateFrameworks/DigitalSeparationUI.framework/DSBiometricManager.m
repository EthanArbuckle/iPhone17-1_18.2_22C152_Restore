@interface DSBiometricManager
+ (id)pearlIdentities;
+ (unint64_t)pearlIdentityCount;
+ (unint64_t)touchIDCount;
+ (void)deleteAllTouchIDs;
+ (void)pearlIdentities;
- (CIDVUIBiometricBindingFlowManager)_biometricBindingFlowManager;
- (DSBiometricManager)initWithContext:(id)a3;
- (LAContext)authContext;
- (void)configurePeriocularEnabled:(BOOL)a3;
- (void)deleteAllPearlIdentities;
- (void)deleteGlobalAuthACL;
- (void)setAuthContext:(id)a3;
- (void)set_biometricBindingFlowManager:(id)a3;
@end

@implementation DSBiometricManager

- (DSBiometricManager)initWithContext:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DSBiometricManager;
  v5 = [(DSBiometricManager *)&v9 init];
  if (v5)
  {
    os_log_t v6 = os_log_create("com.apple.DigitalSeparation", "DSBiometricManager");
    v7 = (void *)DSLogBiometrics_0;
    DSLogBiometrics_0 = (uint64_t)v6;

    [(DSBiometricManager *)v5 setAuthContext:v4];
  }

  return v5;
}

+ (id)pearlIdentities
{
  if ([a1 supportsPearl])
  {
    v2 = (void *)MEMORY[0x263F2AA18];
    v3 = [MEMORY[0x263F2AA20] deviceDescriptorForType:2];
    id v11 = 0;
    id v4 = [v2 deviceWithDescriptor:v3 error:&v11];
    id v5 = v11;

    if (v4) {
      BOOL v6 = v5 == 0;
    }
    else {
      BOOL v6 = 0;
    }
    if (v6)
    {
      id v10 = 0;
      v8 = [v4 identitiesForUser:getuid() error:&v10];
      id v5 = v10;
    }
    else
    {
      v7 = DSLogBiometrics_0;
      if (os_log_type_enabled((os_log_t)DSLogBiometrics_0, OS_LOG_TYPE_ERROR)) {
        +[DSBiometricManager pearlIdentities];
      }
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

+ (unint64_t)pearlIdentityCount
{
  v2 = [a1 pearlIdentities];
  unint64_t v3 = [v2 count];

  return v3;
}

- (void)deleteAllPearlIdentities
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  [(DSBiometricManager *)self deleteGlobalAuthACL];
  unint64_t v3 = [MEMORY[0x263F5FAA8] sharedInstance];
  id v4 = [v3 identitiesForIdentityType:2];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
        id v11 = objc_msgSend(MEMORY[0x263F5FAA8], "sharedInstance", (void)v12);
        [v11 removeIdentity:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  if (_os_feature_enabled_impl()) {
    [(DSBiometricManager *)self configurePeriocularEnabled:0];
  }
}

- (void)configurePeriocularEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v20[1] = *MEMORY[0x263EF8340];
  id v5 = [MEMORY[0x263F5FAA8] sharedInstance];
  uint64_t v6 = [v5 deviceForType:2];

  uint64_t v7 = [(DSBiometricManager *)self authContext];
  v19 = &unk_26E91FB00;
  v20[0] = &unk_26E91FB18;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
  id v9 = (id)[v7 evaluatePolicy:1007 options:v8 error:0];

  uint64_t v10 = [(DSBiometricManager *)self authContext];
  id v11 = [v10 externalizedContext];

  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2050000000;
  long long v12 = (void *)getBKUIPeriocularEnableSplashViewControllerClass_softClass;
  uint64_t v18 = getBKUIPeriocularEnableSplashViewControllerClass_softClass;
  if (!getBKUIPeriocularEnableSplashViewControllerClass_softClass)
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __getBKUIPeriocularEnableSplashViewControllerClass_block_invoke;
    v14[3] = &unk_264C6F0A8;
    v14[4] = &v15;
    __getBKUIPeriocularEnableSplashViewControllerClass_block_invoke((uint64_t)v14);
    long long v12 = (void *)v16[3];
  }
  id v13 = v12;
  _Block_object_dispose(&v15, 8);
  [v13 setPeriocularFaceIDMatchEnabledForUserConfigurationWithDevice:v6 credentialSet:v11 enabled:v3];
}

- (void)deleteGlobalAuthACL
{
  objc_initWeak(&location, self);
  v2 = dispatch_get_global_queue(0, 0);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __41__DSBiometricManager_deleteGlobalAuthACL__block_invoke;
  v3[3] = &unk_264C6EA20;
  objc_copyWeak(&v4, &location);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __41__DSBiometricManager_deleteGlobalAuthACL__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained _biometricBindingFlowManager];
  [v1 deleteBoundACLWithCompletion:&__block_literal_global_13];
}

void __41__DSBiometricManager_deleteGlobalAuthACL__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    BOOL v3 = DSLogBiometrics_0;
    if (os_log_type_enabled((os_log_t)DSLogBiometrics_0, OS_LOG_TYPE_ERROR)) {
      __41__DSBiometricManager_deleteGlobalAuthACL__block_invoke_2_cold_1((uint64_t)v2, v3);
    }
  }
}

- (CIDVUIBiometricBindingFlowManager)_biometricBindingFlowManager
{
  biometricBindingFlowManager = self->__biometricBindingFlowManager;
  if (!biometricBindingFlowManager)
  {
    uint64_t v10 = 0;
    id v11 = &v10;
    uint64_t v12 = 0x2050000000;
    id v4 = (void *)getCIDVUIBiometricBindingFlowManagerClass_softClass;
    uint64_t v13 = getCIDVUIBiometricBindingFlowManagerClass_softClass;
    if (!getCIDVUIBiometricBindingFlowManagerClass_softClass)
    {
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __getCIDVUIBiometricBindingFlowManagerClass_block_invoke;
      v9[3] = &unk_264C6F0A8;
      v9[4] = &v10;
      __getCIDVUIBiometricBindingFlowManagerClass_block_invoke((uint64_t)v9);
      id v4 = (void *)v11[3];
    }
    id v5 = v4;
    _Block_object_dispose(&v10, 8);
    uint64_t v6 = (CIDVUIBiometricBindingFlowManager *)objc_alloc_init(v5);
    uint64_t v7 = self->__biometricBindingFlowManager;
    self->__biometricBindingFlowManager = v6;

    biometricBindingFlowManager = self->__biometricBindingFlowManager;
  }
  return biometricBindingFlowManager;
}

+ (unint64_t)touchIDCount
{
  id v2 = [MEMORY[0x263F5FAF0] identities];
  unint64_t v3 = [v2 count];

  return v3;
}

+ (void)deleteAllTouchIDs
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F5FAF0] identities];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [MEMORY[0x263F5FAF0] removeIdentity:*(void *)(*((void *)&v7 + 1) + 8 * v6++)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)set_biometricBindingFlowManager:(id)a3
{
}

- (LAContext)authContext
{
  return self->_authContext;
}

- (void)setAuthContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authContext, 0);
  objc_storeStrong((id *)&self->__biometricBindingFlowManager, 0);
}

+ (void)pearlIdentities
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_235BFC000, a2, OS_LOG_TYPE_ERROR, "DS Face ID: Failed to fetch BKDevice: %@", (uint8_t *)&v2, 0xCu);
}

void __41__DSBiometricManager_deleteGlobalAuthACL__block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "-[DSBiometricManager deleteGlobalAuthACL]_block_invoke_2";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_235BFC000, a2, OS_LOG_TYPE_ERROR, "%s: Encountered error '%{public}@'", (uint8_t *)&v2, 0x16u);
}

@end
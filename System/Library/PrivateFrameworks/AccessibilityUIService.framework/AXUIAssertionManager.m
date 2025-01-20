@interface AXUIAssertionManager
+ (id)sharedInstance;
- (AXDispatchTimer)timerBackground;
- (AXDispatchTimer)timerUI;
- (AXUIAssertionManager)init;
- (NSMutableSet)clientsWithUIAssertion;
- (RBSAssertion)assertionBackground;
- (RBSAssertion)assertionUI;
- (id)_serviceClientIDForService:(id)a3 clientIdentifier:(id)a4;
- (void)_invalidateAssertion;
- (void)_invalidateAssertionUI;
- (void)acquireAssertionIfNeeded;
- (void)acquireAssertionUIIfNeeded;
- (void)acquireAssertionUIIfNeededForService:(id)a3 clientIdentifier:(id)a4;
- (void)dealloc;
- (void)invalidateAssertionIfNeeded;
- (void)invalidateAssertionUIIfNeeded;
- (void)invalidateAssertionUIIfNeededForService:(id)a3 clientIdentifier:(id)a4;
- (void)setAssertionBackground:(id)a3;
- (void)setAssertionUI:(id)a3;
- (void)setClientsWithUIAssertion:(id)a3;
- (void)setTimerBackground:(id)a3;
- (void)setTimerUI:(id)a3;
@end

@implementation AXUIAssertionManager

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__AXUIAssertionManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)_AXUIAssertionManager;

  return v2;
}

uint64_t __38__AXUIAssertionManager_sharedInstance__block_invoke()
{
  _AXUIAssertionManager = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (AXUIAssertionManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)AXUIAssertionManager;
  v2 = [(AXUIAssertionManager *)&v12 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    clientsWithUIAssertion = v2->_clientsWithUIAssertion;
    v2->_clientsWithUIAssertion = (NSMutableSet *)v3;

    id v5 = objc_alloc(MEMORY[0x263F21398]);
    v6 = (void *)MEMORY[0x263EF83A0];
    uint64_t v7 = [v5 initWithTargetSerialQueue:MEMORY[0x263EF83A0]];
    timerUI = v2->_timerUI;
    v2->_timerUI = (AXDispatchTimer *)v7;

    [(AXDispatchTimer *)v2->_timerUI setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
    uint64_t v9 = [objc_alloc(MEMORY[0x263F21398]) initWithTargetSerialQueue:v6];
    timerBackground = v2->_timerBackground;
    v2->_timerBackground = (AXDispatchTimer *)v9;

    [(AXDispatchTimer *)v2->_timerBackground setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
  }
  return v2;
}

- (void)dealloc
{
  [(AXUIAssertionManager *)self _invalidateAssertionUI];
  [(AXUIAssertionManager *)self _invalidateAssertion];
  v3.receiver = self;
  v3.super_class = (Class)AXUIAssertionManager;
  [(AXUIAssertionManager *)&v3 dealloc];
}

- (void)acquireAssertionIfNeeded
{
  v16[1] = *MEMORY[0x263EF8340];
  objc_super v3 = [(AXUIAssertionManager *)self timerBackground];
  [v3 cancel];

  assertionBackground = self->_assertionBackground;
  id v5 = AXLogAssertions();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (assertionBackground)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_221750000, v5, OS_LOG_TYPE_DEFAULT, "Background Assertion was already requested, skip", buf, 2u);
    }
  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_221750000, v5, OS_LOG_TYPE_DEFAULT, "Acquiring Background assertion", buf, 2u);
    }

    id v5 = [MEMORY[0x263F64630] currentProcess];
    uint64_t v7 = [MEMORY[0x263F64480] attributeWithDomain:@"com.apple.AccessibilityUIServer" name:@"AXUIServerBackground"];
    id v8 = objc_alloc(MEMORY[0x263F64408]);
    v16[0] = v7;
    uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
    v10 = (RBSAssertion *)[v8 initWithExplanation:@"AXUIServer Running Background Tasks" target:v5 attributes:v9];
    v11 = self->_assertionBackground;
    self->_assertionBackground = v10;

    objc_super v12 = AXLogAssertions();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_221750000, v12, OS_LOG_TYPE_DEFAULT, "About to acquire AXUIServer RB assertion com.apple.AccessibilityUIServer::AXUIServerBackground", buf, 2u);
    }

    v13 = self->_assertionBackground;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __48__AXUIAssertionManager_acquireAssertionIfNeeded__block_invoke;
    v14[3] = &unk_2645C5940;
    v14[4] = self;
    [(RBSAssertion *)v13 acquireWithInvalidationHandler:v14];
  }
}

void __48__AXUIAssertionManager_acquireAssertionIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  switch([v6 code])
  {
    case 0:
      uint64_t v7 = AXLogAssertions();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
      id v8 = [v6 userInfo];
      int v12 = 138412546;
      id v13 = v5;
      __int16 v14 = 2112;
      id v15 = v8;
      uint64_t v9 = "RB assertion invalidated - Unknown Error: %@. %@";
      goto LABEL_14;
    case 1:
      uint64_t v7 = AXLogAssertions();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
      id v8 = [v6 userInfo];
      int v12 = 138412546;
      id v13 = v5;
      __int16 v14 = 2112;
      id v15 = v8;
      uint64_t v9 = "RB assertion invalidated: %@. %@";
      goto LABEL_14;
    case 2:
      uint64_t v7 = AXLogAssertions();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
      id v8 = [v6 userInfo];
      v10 = [v5 attributes];
      int v12 = 138412802;
      id v13 = v8;
      __int16 v14 = 2112;
      id v15 = v5;
      __int16 v16 = 2112;
      v17 = v10;
      _os_log_impl(&dword_221750000, v7, OS_LOG_TYPE_DEFAULT, "RB assertion invalidated - Invalid Parameters: %@. %@. %@", (uint8_t *)&v12, 0x20u);

      goto LABEL_15;
    case 3:
      uint64_t v7 = AXLogAssertions();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
      id v8 = [v6 userInfo];
      int v12 = 138412546;
      id v13 = v5;
      __int16 v14 = 2112;
      id v15 = v8;
      uint64_t v9 = "RB assertion invalidated - Permission Denied: %@. %@";
      goto LABEL_14;
    case 4:
      uint64_t v7 = AXLogAssertions();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
      id v8 = [v6 userInfo];
      int v12 = 138412546;
      id v13 = v5;
      __int16 v14 = 2112;
      id v15 = v8;
      uint64_t v9 = "RB assertion invalidated - Constraint Unmet: %@. %@";
      goto LABEL_14;
    case 5:
      uint64_t v7 = AXLogAssertions();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
      id v8 = [v6 userInfo];
      int v12 = 138412546;
      id v13 = v5;
      __int16 v14 = 2112;
      id v15 = v8;
      uint64_t v9 = "RB assertion invalidated - Conditions Denied: %@. %@";
LABEL_14:
      _os_log_impl(&dword_221750000, v7, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v12, 0x16u);
LABEL_15:

LABEL_16:
LABEL_17:
      uint64_t v11 = *(void *)(a1 + 32);
      if (*(id *)(v11 + 16) == v5)
      {
        *(void *)(v11 + 16) = 0;
      }
      return;
    default:
      goto LABEL_17;
  }
}

- (void)invalidateAssertionIfNeeded
{
  objc_super v3 = [(AXUIAssertionManager *)self timerBackground];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __51__AXUIAssertionManager_invalidateAssertionIfNeeded__block_invoke;
  v4[3] = &unk_2645C5968;
  v4[4] = self;
  [v3 afterDelay:v4 processBlock:30.0];
}

void __51__AXUIAssertionManager_invalidateAssertionIfNeeded__block_invoke(uint64_t a1)
{
  v2 = AXLogAssertions();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221750000, v2, OS_LOG_TYPE_DEFAULT, "invalidateAssertionIfNeeded timer", buf, 2u);
  }

  objc_super v3 = [*(id *)(a1 + 32) assertionBackground];

  if (v3)
  {
    v4 = +[AXUIServiceManager sharedServiceManager];
    uint64_t v5 = [v4 _servicesCount];

    if (v5)
    {
      id v6 = AXLogAssertions();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v7 = 0;
        _os_log_impl(&dword_221750000, v6, OS_LOG_TYPE_DEFAULT, "Can't invalidate Background Assertion, still services are registered", v7, 2u);
      }
    }
    else
    {
      [*(id *)(a1 + 32) _invalidateAssertion];
    }
  }
}

- (void)acquireAssertionUIIfNeeded
{
  void v16[2] = *MEMORY[0x263EF8340];
  objc_super v3 = [(AXUIAssertionManager *)self timerUI];
  [v3 cancel];

  assertionUI = self->_assertionUI;
  uint64_t v5 = AXLogAssertions();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (assertionUI)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_221750000, v5, OS_LOG_TYPE_DEFAULT, "UI Assertion was already requested, skip", buf, 2u);
    }
  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_221750000, v5, OS_LOG_TYPE_DEFAULT, "Acquiring UI assertion", buf, 2u);
    }

    uint64_t v5 = [MEMORY[0x263F64630] currentProcess];
    uint64_t v7 = [MEMORY[0x263F64480] attributeWithDomain:@"com.apple.AccessibilityUIServer" name:@"LegacyUIOverlay"];
    id v8 = [MEMORY[0x263F64490] grantWithNamespace:@"com.apple.frontboard.visibility" endowment:MEMORY[0x263EFFA88]];
    id v9 = objc_alloc(MEMORY[0x263F64408]);
    v16[0] = v7;
    v16[1] = v8;
    v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
    uint64_t v11 = (RBSAssertion *)[v9 initWithExplanation:@"AXUIServer Showing UI" target:v5 attributes:v10];
    int v12 = self->_assertionUI;
    self->_assertionUI = v11;

    id v13 = self->_assertionUI;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __50__AXUIAssertionManager_acquireAssertionUIIfNeeded__block_invoke;
    v14[3] = &unk_2645C5940;
    v14[4] = self;
    [(RBSAssertion *)v13 acquireWithInvalidationHandler:v14];
  }
}

void __50__AXUIAssertionManager_acquireAssertionUIIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  switch([v6 code])
  {
    case 0:
      uint64_t v7 = AXLogAssertions();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
      id v8 = [v6 userInfo];
      int v12 = 138412546;
      id v13 = v5;
      __int16 v14 = 2112;
      id v15 = v8;
      id v9 = "RB assertion invalidated - Unknown Error: %@. %@";
      goto LABEL_14;
    case 1:
      uint64_t v7 = AXLogAssertions();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
      id v8 = [v6 userInfo];
      int v12 = 138412546;
      id v13 = v5;
      __int16 v14 = 2112;
      id v15 = v8;
      id v9 = "RB assertion invalidated: %@. %@";
      goto LABEL_14;
    case 2:
      uint64_t v7 = AXLogAssertions();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
      id v8 = [v6 userInfo];
      v10 = [v5 attributes];
      int v12 = 138412802;
      id v13 = v8;
      __int16 v14 = 2112;
      id v15 = v5;
      __int16 v16 = 2112;
      v17 = v10;
      _os_log_impl(&dword_221750000, v7, OS_LOG_TYPE_DEFAULT, "RB assertion invalidated - Invalid Parameters: %@. %@. %@", (uint8_t *)&v12, 0x20u);

      goto LABEL_15;
    case 3:
      uint64_t v7 = AXLogAssertions();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
      id v8 = [v6 userInfo];
      int v12 = 138412546;
      id v13 = v5;
      __int16 v14 = 2112;
      id v15 = v8;
      id v9 = "RB assertion invalidated - Permission Denied: %@. %@";
      goto LABEL_14;
    case 4:
      uint64_t v7 = AXLogAssertions();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
      id v8 = [v6 userInfo];
      int v12 = 138412546;
      id v13 = v5;
      __int16 v14 = 2112;
      id v15 = v8;
      id v9 = "RB assertion invalidated - Constraint Unmet: %@. %@";
      goto LABEL_14;
    case 5:
      uint64_t v7 = AXLogAssertions();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
      id v8 = [v6 userInfo];
      int v12 = 138412546;
      id v13 = v5;
      __int16 v14 = 2112;
      id v15 = v8;
      id v9 = "RB assertion invalidated - Conditions Denied: %@. %@";
LABEL_14:
      _os_log_impl(&dword_221750000, v7, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v12, 0x16u);
LABEL_15:

LABEL_16:
LABEL_17:
      uint64_t v11 = *(void *)(a1 + 32);
      if (*(id *)(v11 + 8) == v5)
      {
        *(void *)(v11 + 8) = 0;
      }
      return;
    default:
      goto LABEL_17;
  }
}

- (void)invalidateAssertionUIIfNeeded
{
  objc_super v3 = [(AXUIAssertionManager *)self timerUI];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __53__AXUIAssertionManager_invalidateAssertionUIIfNeeded__block_invoke;
  v4[3] = &unk_2645C5968;
  v4[4] = self;
  [v3 afterDelay:v4 processBlock:30.0];
}

void __53__AXUIAssertionManager_invalidateAssertionUIIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = AXLogAssertions();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_221750000, v2, OS_LOG_TYPE_DEFAULT, "invalidateAssertionUIIfNeeded timer", (uint8_t *)&v11, 2u);
  }

  objc_super v3 = [*(id *)(a1 + 32) assertionUI];

  if (v3)
  {
    v4 = [*(id *)(a1 + 32) clientsWithUIAssertion];
    uint64_t v5 = [v4 count];

    if (v5)
    {
      id v6 = AXLogAssertions();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = [*(id *)(a1 + 32) clientsWithUIAssertion];
        int v11 = 138412290;
        int v12 = v7;
        _os_log_impl(&dword_221750000, v6, OS_LOG_TYPE_DEFAULT, "Can't invalidate UI Assertion, still clients with UI assertion %@", (uint8_t *)&v11, 0xCu);
      }
    }
    else
    {
      id v8 = +[AXUIDisplayManager sharedDisplayManager];
      uint64_t v9 = [v8 allWindowsHidden];

      if (v9)
      {
        [*(id *)(a1 + 32) _invalidateAssertionUI];
      }
      else
      {
        v10 = AXLogAssertions();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v11) = 0;
          _os_log_impl(&dword_221750000, v10, OS_LOG_TYPE_DEFAULT, "Can't invalidate UI Assertion, still UI is presented", (uint8_t *)&v11, 2u);
        }
      }
    }
  }
}

- (void)acquireAssertionUIIfNeededForService:(id)a3 clientIdentifier:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (objc_opt_respondsToSelector()) {
    int v8 = [v6 serviceTypeForClientWithIdentifier:v7];
  }
  else {
    int v8 = 0;
  }
  uint64_t v9 = AXLogAssertions();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109634;
    v11[1] = v8;
    __int16 v12 = 2112;
    id v13 = v7;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl(&dword_221750000, v9, OS_LOG_TYPE_DEFAULT, "serviceType: %d, client: %@, service: %@", (uint8_t *)v11, 0x1Cu);
  }

  if (v8)
  {
    v10 = [(AXUIAssertionManager *)self _serviceClientIDForService:v6 clientIdentifier:v7];
    if (v10) {
      [(NSMutableSet *)self->_clientsWithUIAssertion addObject:v10];
    }
    [(AXUIAssertionManager *)self acquireAssertionUIIfNeeded];
  }
}

- (void)invalidateAssertionUIIfNeededForService:(id)a3 clientIdentifier:(id)a4
{
  id v5 = [(AXUIAssertionManager *)self _serviceClientIDForService:a3 clientIdentifier:a4];
  if (-[NSMutableSet containsObject:](self->_clientsWithUIAssertion, "containsObject:"))
  {
    [(NSMutableSet *)self->_clientsWithUIAssertion removeObject:v5];
    [(AXUIAssertionManager *)self invalidateAssertionUIIfNeeded];
  }
}

- (void)_invalidateAssertion
{
  v2 = [a2 userInfo];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_221750000, v3, v4, "RB assertion invalidation error: %@. %@", v5, v6, v7, v8, v9);
}

- (void)_invalidateAssertionUI
{
  p_assertionUI = &self->_assertionUI;
  assertionUI = self->_assertionUI;
  id v9 = 0;
  [(RBSAssertion *)assertionUI invalidateWithError:&v9];
  id v4 = v9;
  if (v4)
  {
    uint64_t v5 = AXLogAssertions();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(AXUIAssertionManager *)(uint64_t)p_assertionUI _invalidateAssertion];
    }
  }
  uint64_t v6 = *p_assertionUI;
  *p_assertionUI = 0;

  uint64_t v7 = AXLogAssertions();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_221750000, v7, OS_LOG_TYPE_DEFAULT, "Invalidated UI assertion", v8, 2u);
  }
}

- (id)_serviceClientIDForService:(id)a3 clientIdentifier:(id)a4
{
  id v4 = NSString;
  id v5 = a4;
  uint64_t v6 = [v4 stringWithFormat:@"%@_%@", objc_opt_class(), v5];

  return v6;
}

- (RBSAssertion)assertionUI
{
  return self->_assertionUI;
}

- (void)setAssertionUI:(id)a3
{
}

- (RBSAssertion)assertionBackground
{
  return self->_assertionBackground;
}

- (void)setAssertionBackground:(id)a3
{
}

- (AXDispatchTimer)timerUI
{
  return self->_timerUI;
}

- (void)setTimerUI:(id)a3
{
}

- (AXDispatchTimer)timerBackground
{
  return self->_timerBackground;
}

- (void)setTimerBackground:(id)a3
{
}

- (NSMutableSet)clientsWithUIAssertion
{
  return self->_clientsWithUIAssertion;
}

- (void)setClientsWithUIAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientsWithUIAssertion, 0);
  objc_storeStrong((id *)&self->_timerBackground, 0);
  objc_storeStrong((id *)&self->_timerUI, 0);
  objc_storeStrong((id *)&self->_assertionBackground, 0);

  objc_storeStrong((id *)&self->_assertionUI, 0);
}

@end
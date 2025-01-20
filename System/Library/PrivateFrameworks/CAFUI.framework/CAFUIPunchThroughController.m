@interface CAFUIPunchThroughController
- (BOOL)displayIdentifier:(id)a3 hasPunchThroughWithIdentifier:(id)a4;
- (BOOL)displayIdentifier:(id)a3 isDisplayingPunchThroughWithIdentifier:(id)a4;
- (BOOL)hasPunchThroughWithIdentifier:(id)a3;
- (CAFUIPunchThroughController)initWithSession:(id)a3;
- (CARObserverHashTable)observers;
- (CARSession)session;
- (NSDictionary)availablePunchThroughIdentifiers;
- (NSMutableDictionary)activePunchThroughs;
- (id)punchThroughIdentifierOnDisplay:(id)a3;
- (void)addObserver:(id)a3;
- (void)punchThroughControllerDidDismiss:(id)a3;
- (void)removeControllersWithIdentifier:(id)a3;
- (void)removeObserver:(id)a3;
- (void)requestActivationOfPunchThroughWithIdentifier:(id)a3 displayIdentifier:(id)a4 completion:(id)a5;
- (void)requestDismissalOfPunchThroughWithIdentifier:(id)a3 displayIdentifier:(id)a4 completion:(id)a5;
- (void)setActivePunchThroughs:(id)a3;
- (void)setObservers:(id)a3;
@end

@implementation CAFUIPunchThroughController

- (CAFUIPunchThroughController)initWithSession:(id)a3
{
  id v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CAFUIPunchThroughController;
  v6 = [(CAFUIPunchThroughController *)&v22 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_session, a3);
    uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
    activePunchThroughs = v7->_activePunchThroughs;
    v7->_activePunchThroughs = (NSMutableDictionary *)v8;

    id v10 = objc_alloc(MEMORY[0x263F30E18]);
    uint64_t v11 = [v10 initWithProtocol:&unk_26FD5FE18 callbackQueue:MEMORY[0x263EF83A0]];
    observers = v7->_observers;
    v7->_observers = (CARObserverHashTable *)v11;

    v13 = [MEMORY[0x263EFF9A0] dictionary];
    v14 = [v5 configuration];
    v15 = [v14 displays];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __47__CAFUIPunchThroughController_initWithSession___block_invoke;
    v20[3] = &unk_26525C5F8;
    id v21 = v13;
    id v16 = v13;
    objc_msgSend(v15, "bs_each:", v20);

    uint64_t v17 = [v16 copy];
    availablePunchThroughIdentifiers = v7->_availablePunchThroughIdentifiers;
    v7->_availablePunchThroughIdentifiers = (NSDictionary *)v17;
  }
  return v7;
}

void __47__CAFUIPunchThroughController_initWithSession___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 punchThroughIdentifiers];
  id v8 = [v4 allObjects];

  if (v8) {
    id v5 = v8;
  }
  else {
    id v5 = (id)MEMORY[0x263EFFA68];
  }
  v6 = *(void **)(a1 + 32);
  v7 = [v3 identifier];

  [v6 setObject:v5 forKeyedSubscript:v7];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFUIPunchThroughController *)self observers];
  [v5 addObserver:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFUIPunchThroughController *)self observers];
  [v5 removeObserver:v4];
}

- (void)requestActivationOfPunchThroughWithIdentifier:(id)a3 displayIdentifier:(id)a4 completion:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if ([(CAFUIPunchThroughController *)self displayIdentifier:v9 hasPunchThroughWithIdentifier:v8])
  {
    id v11 = (id)[objc_alloc(MEMORY[0x263F31560]) initWithPunchThroughIdentifier:v8];
    [v11 setDelegate:self];
    v12 = [(CAFUIPunchThroughController *)self activePunchThroughs];
    [v12 setObject:v11 forKeyedSubscript:v9];

    v13 = CAFUIStatusLogForCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v25 = v8;
      __int16 v26 = 2114;
      id v27 = v9;
      _os_log_impl(&dword_2494AC000, v13, OS_LOG_TYPE_DEFAULT, "Requesting presentation of punch-through %{public}@ on display %{public}@", buf, 0x16u);
    }

    v14 = +[CAFUIStatusViewController sharedInstance];
    objc_msgSend(v14, "appendStringWithFormat:", @"Requesting presentation of punch-through %{public}@ on display %{public}@", v8, v9);

    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __106__CAFUIPunchThroughController_requestActivationOfPunchThroughWithIdentifier_displayIdentifier_completion___block_invoke_119;
    v19[3] = &unk_26525C670;
    id v20 = v8;
    id v21 = v10;
    id v15 = v10;
    [v11 requestPresentationWithCompletion:v19];
  }
  else
  {
    id v16 = CAFUIStatusLogForCategory(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v25 = v8;
      __int16 v26 = 2114;
      id v27 = v9;
      _os_log_impl(&dword_2494AC000, v16, OS_LOG_TYPE_DEFAULT, "Requested presentation of punch-through %{public}@, which does not exist on display %{public}@.", buf, 0x16u);
    }

    uint64_t v17 = +[CAFUIStatusViewController sharedInstance];
    [v17 appendStringWithFormat:@"Requested presentation of punch-through %{public}@, which does not exist on display %{public}@.", v8, v9];

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __106__CAFUIPunchThroughController_requestActivationOfPunchThroughWithIdentifier_displayIdentifier_completion___block_invoke;
    block[3] = &unk_26525C620;
    id v23 = v10;
    id v11 = v10;
    v18 = (void *)MEMORY[0x263EF83A0];
    dispatch_async(MEMORY[0x263EF83A0], block);

    id v15 = v23;
  }
}

uint64_t __106__CAFUIPunchThroughController_requestActivationOfPunchThroughWithIdentifier_displayIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __106__CAFUIPunchThroughController_requestActivationOfPunchThroughWithIdentifier_displayIdentifier_completion___block_invoke_119(uint64_t a1, char a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = CAFUIStatusLogForCategory(0);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v13 = v6;
      _os_log_impl(&dword_2494AC000, v4, OS_LOG_TYPE_DEFAULT, "Presentation of punch-through %{public}@ was requested successfully.", buf, 0xCu);
    }

    v7 = +[CAFUIStatusViewController sharedInstance];
    objc_msgSend(v7, "appendStringWithFormat:", @"Presentation of punch-through %{public}@ was requested successfully.", *(void *)(a1 + 32));
  }
  else
  {
    if (v5)
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v13 = v8;
      _os_log_impl(&dword_2494AC000, v4, OS_LOG_TYPE_DEFAULT, "Presentation of punch-through %{public}@ was unsuccessful!", buf, 0xCu);
    }

    v7 = +[CAFUIStatusViewController sharedInstance];
    objc_msgSend(v7, "appendStringWithFormat:", @"Presentation of punch-through %{public}@ was unsuccessful!", *(void *)(a1 + 32));
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __106__CAFUIPunchThroughController_requestActivationOfPunchThroughWithIdentifier_displayIdentifier_completion___block_invoke_126;
  block[3] = &unk_26525C648;
  id v10 = *(id *)(a1 + 40);
  char v11 = a2;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __106__CAFUIPunchThroughController_requestActivationOfPunchThroughWithIdentifier_displayIdentifier_completion___block_invoke_126(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)requestDismissalOfPunchThroughWithIdentifier:(id)a3 displayIdentifier:(id)a4 completion:(id)a5
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  char v11 = [(CAFUIPunchThroughController *)self activePunchThroughs];
  v12 = [v11 objectForKeyedSubscript:v9];

  if (!v12)
  {
    id v21 = CAFUIStatusLogForCategory(0);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v38 = v8;
      _os_log_impl(&dword_2494AC000, v21, OS_LOG_TYPE_DEFAULT, "Requested dismissal of punch-through %{public}@, but it isn't visible.", buf, 0xCu);
    }

    objc_super v22 = +[CAFUIStatusViewController sharedInstance];
    [v22 appendStringWithFormat:@"Requested dismissal of punch-through %{public}@, but it isn't visible.", v8];

    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __105__CAFUIPunchThroughController_requestDismissalOfPunchThroughWithIdentifier_displayIdentifier_completion___block_invoke;
    v35[3] = &unk_26525C620;
    v18 = &v36;
    id v36 = v10;
    id v20 = MEMORY[0x263EF83A0];
    id v23 = v35;
    goto LABEL_12;
  }
  uint64_t v13 = [v12 punchThroughIdentifier];
  char v14 = [v13 isEqualToString:v8];

  id v15 = CAFUIStatusLogForCategory(0);
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if ((v14 & 1) == 0)
  {
    if (v16)
    {
      v24 = [v12 punchThroughIdentifier];
      *(_DWORD *)buf = 138543874;
      id v38 = v8;
      __int16 v39 = 2114;
      id v40 = v9;
      __int16 v41 = 2114;
      v42 = v24;
      _os_log_impl(&dword_2494AC000, v15, OS_LOG_TYPE_DEFAULT, "Requested dismissal of punch-through %{public}@ on display %{public}@, but that display is showing a different punch-through: %{public}@", buf, 0x20u);
    }
    id v25 = +[CAFUIStatusViewController sharedInstance];
    __int16 v26 = [v12 punchThroughIdentifier];
    [v25 appendStringWithFormat:@"Requested dismissal of punch-through %{public}@ on display %{public}@, but that display is showing a different punch-through: %{public}@", v8, v9, v26];

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __105__CAFUIPunchThroughController_requestDismissalOfPunchThroughWithIdentifier_displayIdentifier_completion___block_invoke_134;
    block[3] = &unk_26525C620;
    v18 = &v34;
    id v34 = v10;
    id v20 = MEMORY[0x263EF83A0];
    id v23 = block;
LABEL_12:
    dispatch_async(v20, v23);
    goto LABEL_13;
  }
  if (v16)
  {
    *(_DWORD *)buf = 138543618;
    id v38 = v8;
    __int16 v39 = 2114;
    id v40 = v9;
    _os_log_impl(&dword_2494AC000, v15, OS_LOG_TYPE_DEFAULT, "Requesting dismissal of punch-through %{public}@ on display %{public}@", buf, 0x16u);
  }

  uint64_t v17 = +[CAFUIStatusViewController sharedInstance];
  objc_msgSend(v17, "appendStringWithFormat:", @"Requesting dismissal of punch-through %{public}@ on display %{public}@", v8, v9);

  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __105__CAFUIPunchThroughController_requestDismissalOfPunchThroughWithIdentifier_displayIdentifier_completion___block_invoke_138;
  v27[3] = &unk_26525C6C0;
  v18 = &v28;
  id v28 = v8;
  v19 = v12;
  v29 = v19;
  v30 = self;
  id v31 = v9;
  id v32 = v10;
  [v19 requestDismissalWithCompletion:v27];

  id v20 = v29;
LABEL_13:
}

uint64_t __105__CAFUIPunchThroughController_requestDismissalOfPunchThroughWithIdentifier_displayIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __105__CAFUIPunchThroughController_requestDismissalOfPunchThroughWithIdentifier_displayIdentifier_completion___block_invoke_134(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __105__CAFUIPunchThroughController_requestDismissalOfPunchThroughWithIdentifier_displayIdentifier_completion___block_invoke_138(uint64_t a1, char a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = CAFUIStatusLogForCategory(0);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v20 = v6;
      _os_log_impl(&dword_2494AC000, v4, OS_LOG_TYPE_DEFAULT, "Dismissal of punch-through %{public}@ was requested successfully.", buf, 0xCu);
    }

    v7 = +[CAFUIStatusViewController sharedInstance];
    objc_msgSend(v7, "appendStringWithFormat:", @"Dismissal of punch-through %{public}@ was requested successfully.", *(void *)(a1 + 32));
  }
  else
  {
    if (v5)
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v20 = v8;
      _os_log_impl(&dword_2494AC000, v4, OS_LOG_TYPE_DEFAULT, "Dismissal of punch-through %{public}@ was unsuccessful!", buf, 0xCu);
    }

    v7 = +[CAFUIStatusViewController sharedInstance];
    objc_msgSend(v7, "appendStringWithFormat:", @"Dismissal of punch-through %{public}@ was unsuccessful!", *(void *)(a1 + 32));
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __105__CAFUIPunchThroughController_requestDismissalOfPunchThroughWithIdentifier_displayIdentifier_completion___block_invoke_145;
  block[3] = &unk_26525C698;
  id v9 = *(id *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  char v11 = *(void **)(a1 + 56);
  id v13 = v9;
  uint64_t v14 = v10;
  id v15 = v11;
  id v16 = *(id *)(a1 + 32);
  id v17 = *(id *)(a1 + 64);
  char v18 = a2;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __105__CAFUIPunchThroughController_requestDismissalOfPunchThroughWithIdentifier_displayIdentifier_completion___block_invoke_145(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidate];
  v2 = [*(id *)(a1 + 40) activePunchThroughs];
  [v2 removeObjectForKey:*(void *)(a1 + 48)];

  id v3 = [*(id *)(a1 + 40) observers];
  [v3 punchThroughController:*(void *)(a1 + 40) didDismissPunchThroughWithIdentifier:*(void *)(a1 + 56)];

  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 64) + 16);

  return v4();
}

- (BOOL)hasPunchThroughWithIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CAFUIPunchThroughController *)self session];
  uint64_t v6 = [v5 configuration];
  v7 = [v6 displays];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __61__CAFUIPunchThroughController_hasPunchThroughWithIdentifier___block_invoke;
  v12[3] = &unk_26525C6E8;
  id v13 = v4;
  id v8 = v4;
  id v9 = objc_msgSend(v7, "bs_firstObjectPassingTest:", v12);
  BOOL v10 = v9 != 0;

  return v10;
}

uint64_t __61__CAFUIPunchThroughController_hasPunchThroughWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 hasPunchThroughWithIdentifier:*(void *)(a1 + 32)];
}

- (BOOL)displayIdentifier:(id)a3 hasPunchThroughWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CAFUIPunchThroughController *)self session];
  id v9 = [v8 configuration];
  BOOL v10 = [v9 displays];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __79__CAFUIPunchThroughController_displayIdentifier_hasPunchThroughWithIdentifier___block_invoke;
  v14[3] = &unk_26525C6E8;
  id v15 = v6;
  id v11 = v6;
  v12 = objc_msgSend(v10, "bs_firstObjectPassingTest:", v14);

  LOBYTE(v8) = [v12 hasPunchThroughWithIdentifier:v7];
  return (char)v8;
}

uint64_t __79__CAFUIPunchThroughController_displayIdentifier_hasPunchThroughWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (BOOL)displayIdentifier:(id)a3 isDisplayingPunchThroughWithIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CAFUIPunchThroughController *)self activePunchThroughs];
  id v9 = [v8 objectForKeyedSubscript:v7];

  BOOL v10 = [v9 punchThroughIdentifier];
  LOBYTE(v8) = [v10 isEqualToString:v6];

  return (char)v8;
}

- (id)punchThroughIdentifierOnDisplay:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CAFUIPunchThroughController *)self activePunchThroughs];
  id v6 = [v5 objectForKeyedSubscript:v4];

  id v7 = [v6 punchThroughIdentifier];

  return v7;
}

- (void)removeControllersWithIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CAFUIPunchThroughController *)self activePunchThroughs];
  id v6 = [v5 allKeys];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __63__CAFUIPunchThroughController_removeControllersWithIdentifier___block_invoke;
  v8[3] = &unk_26525C710;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  objc_msgSend(v6, "bs_each:", v8);
}

void __63__CAFUIPunchThroughController_removeControllersWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) activePunchThroughs];
  BOOL v5 = [v4 objectForKeyedSubscript:v3];

  id v6 = [v5 punchThroughIdentifier];
  int v7 = [v6 isEqualToString:*(void *)(a1 + 40)];

  if (v7)
  {
    id v8 = CAFUIStatusLogForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v14 = v9;
      __int16 v15 = 2114;
      id v16 = v3;
      _os_log_impl(&dword_2494AC000, v8, OS_LOG_TYPE_DEFAULT, "Invalidating punch-through %{public}@ on display %{public}@", buf, 0x16u);
    }

    BOOL v10 = +[CAFUIStatusViewController sharedInstance];
    objc_msgSend(v10, "appendStringWithFormat:", @"Invalidating punch-through %{public}@ on display %{public}@", *(void *)(a1 + 40), v3);

    [v5 invalidate];
    id v11 = [*(id *)(a1 + 32) activePunchThroughs];
    [v11 removeObjectForKey:v3];

    v12 = [*(id *)(a1 + 32) observers];
    [v12 punchThroughController:*(void *)(a1 + 32) didDismissPunchThroughWithIdentifier:*(void *)(a1 + 40)];
  }
}

- (void)punchThroughControllerDidDismiss:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = CAFUIStatusLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 punchThroughIdentifier];
    *(_DWORD *)buf = 138543362;
    id v13 = v6;
    _os_log_impl(&dword_2494AC000, v5, OS_LOG_TYPE_DEFAULT, "Punch-through with identifier %{public}@ did dismiss.", buf, 0xCu);
  }
  int v7 = +[CAFUIStatusViewController sharedInstance];
  id v8 = [v4 punchThroughIdentifier];
  objc_msgSend(v7, "appendStringWithFormat:", @"Punch-through with identifier %{public}@ did dismiss.", v8);

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__CAFUIPunchThroughController_punchThroughControllerDidDismiss___block_invoke;
  block[3] = &unk_26525C738;
  void block[4] = self;
  id v11 = v4;
  id v9 = v4;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __64__CAFUIPunchThroughController_punchThroughControllerDidDismiss___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) punchThroughIdentifier];
  [v1 removeControllersWithIdentifier:v2];
}

- (NSDictionary)availablePunchThroughIdentifiers
{
  return self->_availablePunchThroughIdentifiers;
}

- (CARSession)session
{
  return self->_session;
}

- (NSMutableDictionary)activePunchThroughs
{
  return self->_activePunchThroughs;
}

- (void)setActivePunchThroughs:(id)a3
{
}

- (CARObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_activePunchThroughs, 0);
  objc_storeStrong((id *)&self->_session, 0);

  objc_storeStrong((id *)&self->_availablePunchThroughIdentifiers, 0);
}

@end
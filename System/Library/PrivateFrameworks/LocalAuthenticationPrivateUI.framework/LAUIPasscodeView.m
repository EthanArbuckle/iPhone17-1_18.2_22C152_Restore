@interface LAUIPasscodeView
- (BOOL)becomeFirstResponder;
- (BOOL)resignFirstResponder;
- (LAUIPasscodeView)initWithContext:(id)a3;
- (LAUIPasscodeView)initWithContext:(id)a3 shouldPresentUI:(BOOL)a4;
- (void)_appDidBecomeActive:(id)a3;
- (void)_appDidBecomeInactive:(id)a3;
- (void)_prepareRemoteView;
- (void)_presentRemoteView;
- (void)dealloc;
- (void)event:(int64_t)a3 params:(id)a4 reply:(id)a5;
- (void)loadView;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation LAUIPasscodeView

- (LAUIPasscodeView)initWithContext:(id)a3
{
  return [(LAUIPasscodeView *)self initWithContext:a3 shouldPresentUI:0];
}

- (LAUIPasscodeView)initWithContext:(id)a3 shouldPresentUI:(BOOL)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)LAUIPasscodeView;
  v7 = [(LAUIPasscodeView *)&v13 initWithNibName:0 bundle:0];
  v8 = v7;
  if (v7)
  {
    id v9 = objc_storeWeak((id *)&v7->_context, v6);
    v10 = [v6 uiDelegate];
    objc_storeWeak((id *)&v8->_originalDelegate, v10);

    id WeakRetained = objc_loadWeakRetained((id *)&v8->_context);
    [WeakRetained setUiDelegate:v8];

    v8->_shouldBecomeFirstResponder = 1;
    v8->_shouldPresentUI = a4;
    [(LAUIPasscodeView *)v8 _prepareRemoteView];
  }

  return v8;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_originalDelegate);
  id v5 = objc_loadWeakRetained((id *)&self->_context);
  [v5 setUiDelegate:WeakRetained];

  v6.receiver = self;
  v6.super_class = (Class)LAUIPasscodeView;
  [(LAUIPasscodeView *)&v6 dealloc];
}

- (void)loadView
{
  id v3 = objc_alloc_init(MEMORY[0x263F1CB60]);
  [(LAUIPasscodeView *)self setView:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)LAUIPasscodeView;
  [(LAUIPasscodeView *)&v5 viewDidAppear:a3];
  if (self->_shouldBecomeFirstResponder)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteVC);
    [WeakRetained startEditing];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)LAUIPasscodeView;
  [(LAUIPasscodeView *)&v5 viewWillDisappear:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteVC);
  [WeakRetained endEditing];
}

- (BOOL)becomeFirstResponder
{
  v2 = self;
  v8.receiver = self;
  v8.super_class = (Class)LAUIPasscodeView;
  unsigned __int8 v3 = [(LAUIPasscodeView *)&v8 becomeFirstResponder];
  v2->_shouldBecomeFirstResponder = 1;
  v2 = (LAUIPasscodeView *)((char *)v2 + 992);
  id WeakRetained = objc_loadWeakRetained((id *)&v2->super.super.super.isa);
  [WeakRetained startEditing];

  id v5 = objc_loadWeakRetained((id *)&v2->super.super.super.isa);
  if (v5) {
    BOOL v6 = v3;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)resignFirstResponder
{
  v2 = self;
  v8.receiver = self;
  v8.super_class = (Class)LAUIPasscodeView;
  unsigned __int8 v3 = [(LAUIPasscodeView *)&v8 resignFirstResponder];
  v2->_shouldBecomeFirstResponder = 0;
  v2 = (LAUIPasscodeView *)((char *)v2 + 992);
  id WeakRetained = objc_loadWeakRetained((id *)&v2->super.super.super.isa);
  [WeakRetained endEditing];

  id v5 = objc_loadWeakRetained((id *)&v2->super.super.super.isa);
  if (v5) {
    BOOL v6 = v3;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)event:(int64_t)a3 params:(id)a4 reply:(id)a5
{
  id v15 = a4;
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_originalDelegate);

  if (WeakRetained)
  {
    id v10 = objc_loadWeakRetained((id *)&self->_originalDelegate);
    [v10 event:a3 params:v15 reply:v8];
  }
  if (a3 == 2)
  {
    uint64_t v11 = [v15 objectForKeyedSubscript:&unk_26C534160];
    if (v11)
    {
      v12 = (void *)v11;
      objc_super v13 = [v15 objectForKeyedSubscript:&unk_26C534160];
      int v14 = [v13 BOOLValue];

      if (v14)
      {
        self->_shouldPresentUI = 1;
        [(LAUIPasscodeView *)self _presentRemoteView];
      }
    }
  }
}

- (void)_prepareRemoteView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteVC);

  if (!WeakRetained)
  {
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __38__LAUIPasscodeView__prepareRemoteView__block_invoke;
    v5[3] = &unk_26420C758;
    objc_copyWeak(&v6, &location);
    v5[4] = self;
    id v4 = +[_UIRemoteViewController requestViewController:@"PasscodeEmbeddedRemoteViewController" fromServiceWithBundleIdentifier:@"com.apple.CoreAuthUI" connectionHandler:v5];
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __38__LAUIPasscodeView__prepareRemoteView__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v6)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        __38__LAUIPasscodeView__prepareRemoteView__block_invoke_cold_2();
      }
    }
    else if ([v5 conformsToProtocol:&unk_26C547218])
    {
      id v8 = objc_storeWeak(WeakRetained + 124, v5);
      id v9 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 976));
      id v10 = [v9 externalizedContext];
      [v5 setContext:v10];

      [*(id *)(a1 + 32) _presentRemoteView];
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      __38__LAUIPasscodeView__prepareRemoteView__block_invoke_cold_1();
    }
  }
}

- (void)_presentRemoteView
{
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
    if (self->_shouldPresentUI)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteVC);
      if (WeakRetained)
      {
        id v4 = WeakRetained;
        id v5 = [(LAUIPasscodeView *)self view];
        id v6 = [v5 subviews];
        id v7 = objc_loadWeakRetained((id *)&self->_remoteVC);
        id v8 = [v7 view];
        char v9 = [v6 containsObject:v8];

        if ((v9 & 1) == 0)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
          {
            LOWORD(buf[0]) = 0;
            _os_log_impl(&dword_214463000, &_os_log_internal, OS_LOG_TYPE_INFO, "Presenting remote UI", (uint8_t *)buf, 2u);
          }
          id v10 = [(LAUIPasscodeView *)self view];
          id v11 = objc_loadWeakRetained((id *)&self->_remoteVC);
          v12 = [v11 view];
          [v10 addSubview:v12];

          id v13 = objc_loadWeakRetained((id *)&self->_remoteVC);
          int v14 = [v13 view];
          [v14 setTranslatesAutoresizingMaskIntoConstraints:0];

          id v15 = objc_loadWeakRetained((id *)&self->_remoteVC);
          v16 = [v15 view];
          v17 = [v16 topAnchor];
          v18 = [(LAUIPasscodeView *)self view];
          v19 = [v18 topAnchor];
          v20 = [v17 constraintEqualToAnchor:v19];
          [v20 setActive:1];

          id v21 = objc_loadWeakRetained((id *)&self->_remoteVC);
          v22 = [v21 view];
          v23 = [v22 bottomAnchor];
          v24 = [(LAUIPasscodeView *)self view];
          v25 = [v24 bottomAnchor];
          v26 = [v23 constraintEqualToAnchor:v25];
          [v26 setActive:1];

          id v27 = objc_loadWeakRetained((id *)&self->_remoteVC);
          v28 = [v27 view];
          v29 = [v28 leadingAnchor];
          v30 = [(LAUIPasscodeView *)self view];
          v31 = [v30 leadingAnchor];
          v32 = [v29 constraintEqualToAnchor:v31];
          [v32 setActive:1];

          id v33 = objc_loadWeakRetained((id *)&self->_remoteVC);
          v34 = [v33 view];
          v35 = [v34 trailingAnchor];
          v36 = [(LAUIPasscodeView *)self view];
          v37 = [v36 trailingAnchor];
          v38 = [v35 constraintEqualToAnchor:v37];
          [v38 setActive:1];

          id v39 = objc_loadWeakRetained((id *)&self->_remoteVC);
          [(LAUIPasscodeView *)self addChildViewController:v39];

          id v40 = objc_loadWeakRetained((id *)&self->_remoteVC);
          [v40 didMoveToParentViewController:self];

          LODWORD(v40) = self->_shouldBecomeFirstResponder;
          id v41 = objc_loadWeakRetained((id *)&self->_remoteVC);
          v42 = v41;
          if (v40) {
            [v41 startEditing];
          }
          else {
            [v41 endEditing];
          }

          v43 = [MEMORY[0x263F08A00] defaultCenter];
          [v43 addObserver:self selector:sel__appDidBecomeActive_ name:*MEMORY[0x263F1D038] object:0];

          v44 = [MEMORY[0x263F08A00] defaultCenter];
          [v44 addObserver:self selector:sel__appDidBecomeInactive_ name:*MEMORY[0x263F1D0D8] object:0];
        }
      }
    }
  }
  else
  {
    objc_initWeak(buf, self);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __38__LAUIPasscodeView__presentRemoteView__block_invoke;
    block[3] = &unk_26420C780;
    objc_copyWeak(&v46, buf);
    dispatch_async(MEMORY[0x263EF83A0], block);
    objc_destroyWeak(&v46);
    objc_destroyWeak(buf);
  }
}

void __38__LAUIPasscodeView__presentRemoteView__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _presentRemoteView];
    id WeakRetained = v2;
  }
}

- (void)_appDidBecomeActive:(id)a3
{
  if (self->_shouldBecomeFirstResponder)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteVC);
    [WeakRetained startEditing];
  }
}

- (void)_appDidBecomeInactive:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteVC);
  [WeakRetained endEditing];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_remoteVC);
  objc_destroyWeak((id *)&self->_originalDelegate);
  objc_destroyWeak((id *)&self->_context);
}

void __38__LAUIPasscodeView__prepareRemoteView__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214463000, &_os_log_internal, v0, "Received remote VC has unexpected type %@", v1, v2, v3, v4, v5);
}

void __38__LAUIPasscodeView__prepareRemoteView__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214463000, &_os_log_internal, v0, "Could not obtain remote VC %@", v1, v2, v3, v4, v5);
}

@end
@interface AFUIPanel
- (AFUIAutoFillPopoverController)popoverController;
- (AFUIClientSession)clientSession;
- (AFUIExplicitAutoFillController)explicitAutoFillController;
- (AFUIModalUIDelegate)delegate;
- (AFUIPanel)initWithDocumentPid:(int)a3 sessionUUID:(id)a4;
- (AFUIPanelState)panelState;
- (NSUUID)sessionUUID;
- (RBSProcessMonitor)processMonitor;
- (id)_presentingWindow;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (void)_applyPanelState;
- (void)_hide;
- (void)_monitorDocumentProcessVisibility:(int)a3;
- (void)authenticationDidEndForSessionUUID:(id)a3 completion:(id)a4;
- (void)authenticationWillBeginForSessionUUID:(id)a3 completion:(id)a4;
- (void)contactsUIDidEndForSessionUUID:(id)a3 completion:(id)a4;
- (void)contactsUIWillBeginForSessionUUID:(id)a3 completion:(id)a4;
- (void)creditCardsUIDidEndForSessionUUID:(id)a3 completion:(id)a4;
- (void)creditCardsUIWillBeginForSessionUUID:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)dismissMenu;
- (void)displayForDocumentTraits:(id)a3 documentState:(id)a4 textOperationsHandler:(id)a5;
- (void)documentStateChanged:(id)a3;
- (void)hide;
- (void)passwordsUIDidEndForSessionUUID:(id)a3 completion:(id)a4;
- (void)passwordsUIWillBeginForSessionUUID:(id)a3 completion:(id)a4;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)setClientSession:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExplicitAutoFillController:(id)a3;
- (void)setIsMenuPresented:(BOOL)a3 forSessionUUID:(id)a4;
- (void)setPanelState:(id)a3;
- (void)setPopoverController:(id)a3;
- (void)setProcessMonitor:(id)a3;
- (void)setSessionUUID:(id)a3;
- (void)transientHide;
- (void)transientUnhide;
@end

@implementation AFUIPanel

- (AFUIPanel)initWithDocumentPid:(int)a3 sessionUUID:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AFUIPanel;
  v8 = [(AFUIPanel *)&v13 init];
  if (v8)
  {
    v9 = [[AFUIPanelState alloc] initNotDisplayed];
    panelState = v8->_panelState;
    v8->_panelState = v9;

    v11 = [MEMORY[0x263F08A00] defaultCenter];
    [v11 addObserver:v8 selector:sel__sceneWillEnterForeground_ name:*MEMORY[0x263F83958] object:0];

    [(AFUIPanel *)v8 _monitorDocumentProcessVisibility:v5];
    objc_storeStrong((id *)&v8->_sessionUUID, a4);
  }

  return v8;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F83958] object:0];

  [(RBSProcessMonitor *)self->_processMonitor invalidate];
  v4.receiver = self;
  v4.super_class = (Class)AFUIPanel;
  [(AFUIPanel *)&v4 dealloc];
}

- (void)_monitorDocumentProcessVisibility:(int)a3
{
  objc_initWeak(&location, self);
  uint64_t v5 = (void *)MEMORY[0x263F645C0];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __47__AFUIPanel__monitorDocumentProcessVisibility___block_invoke;
  v8[3] = &unk_265249838;
  int v10 = a3;
  objc_copyWeak(&v9, &location);
  v6 = [v5 monitorWithConfiguration:v8];
  processMonitor = self->_processMonitor;
  self->_processMonitor = v6;

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __47__AFUIPanel__monitorDocumentProcessVisibility___block_invoke(uint64_t a1, void *a2)
{
  v13[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  objc_super v4 = [MEMORY[0x263F645E8] descriptor];
  [v4 setValues:5];
  v13[0] = *MEMORY[0x263F3F620];
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  [v4 setEndowmentNamespaces:v5];

  [v3 setStateDescriptor:v4];
  [v3 setServiceClass:33];
  v6 = (void *)MEMORY[0x263F645D8];
  id v7 = [MEMORY[0x263F64580] identifierWithPid:*(unsigned int *)(a1 + 40)];
  v8 = [v6 predicateMatchingIdentifier:v7];

  v12 = v8;
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v12 count:1];
  [v3 setPredicates:v9];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __47__AFUIPanel__monitorDocumentProcessVisibility___block_invoke_2;
  v10[3] = &unk_265249810;
  objc_copyWeak(&v11, (id *)(a1 + 32));
  [v3 setUpdateHandler:v10];
  objc_destroyWeak(&v11);
}

void __47__AFUIPanel__monitorDocumentProcessVisibility___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = [a4 state];
  v6 = [v5 endowmentNamespaces];
  char v7 = [v6 containsObject:*MEMORY[0x263F3F620]];

  if ((v7 & 1) == 0)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __47__AFUIPanel__monitorDocumentProcessVisibility___block_invoke_3;
    block[3] = &unk_265249410;
    objc_copyWeak(&v9, (id *)(a1 + 32));
    dispatch_async(MEMORY[0x263EF83A0], block);
    objc_destroyWeak(&v9);
  }
}

void __47__AFUIPanel__monitorDocumentProcessVisibility___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained hide];
}

- (void)_applyPanelState
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__AFUIPanel__applyPanelState__block_invoke;
  block[3] = &unk_265249280;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __29__AFUIPanel__applyPanelState__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) panelState];
  id v3 = v2;
  if (v2)
  {
    int v4 = [v2 isDisplayed];
    uint64_t v5 = AFUIPanelOSLogFacility();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
    if (v4)
    {
      if (v6) {
        __29__AFUIPanel__applyPanelState__block_invoke_cold_1(v3);
      }

      char v7 = *(void **)(a1 + 32);
      v8 = [v3 documentTraits];
      id v9 = [v3 documentState];
      int v10 = [v3 textOperationsHandler];
      [v7 displayForDocumentTraits:v8 documentState:v9 textOperationsHandler:v10];
    }
    else
    {
      if (v6) {
        __29__AFUIPanel__applyPanelState__block_invoke_cold_2(v3);
      }

      [*(id *)(a1 + 32) hide];
    }
  }
}

- (void)displayForDocumentTraits:(id)a3 documentState:(id)a4 textOperationsHandler:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = AFUIPanelOSLogFacility();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = NSString;
    objc_super v13 = [v8 appId];
    v14 = [v12 stringWithFormat:@"%s appId:%@", "-[AFUIPanel displayForDocumentTraits:documentState:textOperationsHandler:]", v13];
    *(_DWORD *)buf = 138412290;
    v30 = v14;
    _os_log_impl(&dword_248A91000, v11, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }
  id v15 = [[AFUIPanelState alloc] initDisplayed:1 documentTraits:v8 documentState:v9 textOperationsHandler:v10];
  [(AFUIPanel *)self setPanelState:v15];

  if ((objc_opt_respondsToSelector() & 1) != 0
    && [(id)objc_opt_class() usesInputSystemUIForAutoFillOnly])
  {
    v16 = [(AFUIPanel *)self clientSession];
    BOOL v17 = v16 == 0;

    if (v17)
    {
      v18 = objc_alloc_init(AFUIClientSession);
      [(AFUIPanel *)self setClientSession:v18];
    }
    v19 = [(AFUIPanel *)self clientSession];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __74__AFUIPanel_displayForDocumentTraits_documentState_textOperationsHandler___block_invoke;
    v27[3] = &unk_265249888;
    id v28 = v10;
    [v19 displayForDocumentTraits:v8 documentState:v9 textOperationsHandler:v27];

    v20 = v28;
  }
  else
  {
    v20 = [(AFUIPanel *)self _presentingWindow];
    if (v20)
    {
      [(AFUIPanel *)self _hide];
      if ([v8 _isExplicitAutoFillInvocation])
      {
        v21 = [[AFUIExplicitAutoFillController alloc] initWithDocumentTraits:v8 documentState:v9 textOperationsHandler:v10];
        explicitAutoFillController = self->_explicitAutoFillController;
        self->_explicitAutoFillController = v21;

        [(AFUIExplicitAutoFillController *)self->_explicitAutoFillController setDelegate:self];
        v23 = self->_explicitAutoFillController;
        v24 = [v20 rootViewController];
        [(AFUIExplicitAutoFillController *)v23 presentFromViewController:v24];
      }
      else
      {
        objc_initWeak((id *)buf, self);
        v25 = +[AFUIAutoFillPopoverController presentAsPopoverFromWindow:v20 documentTraits:v8 documentState:v9 modalUIDelegate:self textOperationsHandler:v10];
        id WeakRetained = objc_loadWeakRetained((id *)buf);
        [WeakRetained setPopoverController:v25];

        objc_destroyWeak((id *)buf);
      }
    }
  }
}

void __74__AFUIPanel_displayForDocumentTraits_documentState_textOperationsHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __74__AFUIPanel_displayForDocumentTraits_documentState_textOperationsHandler___block_invoke_2;
  v6[3] = &unk_265249860;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __74__AFUIPanel_displayForDocumentTraits_documentState_textOperationsHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)documentStateChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(AFUIPanel *)self panelState];
  BOOL v6 = AFUIPanelOSLogFacility();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[AFUIPanel documentStateChanged:](v5);
  }

  if (v5)
  {
    id v7 = [AFUIPanelState alloc];
    uint64_t v8 = [v5 isDisplayed];
    id v9 = [v5 documentTraits];
    id v10 = [v5 documentState];
    id v11 = [v5 textOperationsHandler];
    id v12 = [(AFUIPanelState *)v7 initDisplayed:v8 documentTraits:v9 documentState:v10 textOperationsHandler:v11];
    [(AFUIPanel *)self setPanelState:v12];
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [(id)objc_opt_class() usesInputSystemUIForAutoFillOnly])
  {
    objc_super v13 = [(AFUIPanel *)self clientSession];
  }
  else
  {
    objc_super v13 = [(AFUIPanel *)self popoverController];
  }
  v14 = v13;
  [v13 documentStateChanged:v4];
}

- (void)transientHide
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = AFUIPanelOSLogFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = NSString;
    id v5 = [(AFUIPanel *)self panelState];
    BOOL v6 = [v5 documentTraits];
    id v7 = [v6 appId];
    uint64_t v8 = [v4 stringWithFormat:@"%s appId:%@", "-[AFUIPanel transientHide]", v7];
    *(_DWORD *)buf = 138412290;
    v14 = v8;
    _os_log_impl(&dword_248A91000, v3, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }
  if (!self->_explicitAutoFillController) {
    goto LABEL_7;
  }
  id v9 = [(AFUIPanel *)self _presentingWindow];
  id v10 = [v9 rootViewController];
  id v11 = [v10 presentedViewController];

  if (+[AFUIPasswordsController isPasswordPickerViewControllerAuthenticating:v11])
  {

    return;
  }
  BOOL v12 = +[AFUIExplicitAutoFillController isCreditCardViewControllerAuthenticating];

  if (!v12) {
LABEL_7:
  }
    [(AFUIPanel *)self hide];
}

- (void)transientUnhide
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = AFUIPanelOSLogFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = NSString;
    id v5 = [(AFUIPanel *)self panelState];
    BOOL v6 = [v5 documentTraits];
    id v7 = [v6 appId];
    uint64_t v8 = [v4 stringWithFormat:@"%s appId:%@", "-[AFUIPanel transientUnhide]", v7];
    *(_DWORD *)buf = 138412290;
    id v10 = v8;
    _os_log_impl(&dword_248A91000, v3, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }
}

- (void)hide
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = [[AFUIPanelState alloc] initNotDisplayed];
  [(AFUIPanel *)self setPanelState:v3];

  id v4 = AFUIPanelOSLogFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSString;
    BOOL v6 = [(AFUIPanel *)self panelState];
    id v7 = [v6 documentTraits];
    uint64_t v8 = [v7 appId];
    id v9 = [v5 stringWithFormat:@"%s appId:%@", "-[AFUIPanel hide]", v8];
    *(_DWORD *)buf = 138412290;
    BOOL v12 = v9;
    _os_log_impl(&dword_248A91000, v4, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [(id)objc_opt_class() usesInputSystemUIForAutoFillOnly])
  {
    id v10 = [(AFUIPanel *)self clientSession];
    [v10 hide];

    [(AFUIPanel *)self setClientSession:0];
  }
  else
  {
    [(AFUIPanel *)self _hide];
  }
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4 = a3;
  id v5 = [(AFUIPanel *)self popoverController];
  id v6 = [v5 presentationController];

  if (v6 == v4)
  {
    [(AFUIPanel *)self setPopoverController:0];
  }
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  if (objc_msgSend(a4, "userInterfaceIdiom", a3) == 1) {
    return -1;
  }
  else {
    return 0;
  }
}

- (id)_presentingWindow
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__3;
  uint64_t v11 = __Block_byref_object_dispose__3;
  id v12 = 0;
  v2 = [MEMORY[0x263F82438] sharedApplication];
  id v3 = [v2 connectedScenes];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __30__AFUIPanel__presentingWindow__block_invoke;
  v6[3] = &unk_2652498B0;
  void v6[4] = &v7;
  [v3 enumerateObjectsUsingBlock:v6];

  id v4 = [MEMORY[0x263F82CE8] sharedTextEffectsWindowForWindowScene:v8[5]];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __30__AFUIPanel__presentingWindow__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ![v6 activationState])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (void)_hide
{
  if (self->_explicitAutoFillController)
  {
    id v3 = [(AFUIPanel *)self _presentingWindow];
    id v4 = [v3 rootViewController];
    [v4 dismissViewControllerAnimated:1 completion:0];

    explicitAutoFillController = self->_explicitAutoFillController;
    self->_explicitAutoFillController = 0;
  }
  else
  {
    id v6 = [(AFUIPanel *)self popoverController];
    [v6 dismissMenu];

    uint64_t v7 = [(AFUIPanel *)self popoverController];
    [v7 dismissViewControllerAnimated:1 completion:0];

    uint64_t v8 = [(AFUIPanel *)self popoverController];
    uint64_t v9 = [v8 view];
    [v9 removeFromSuperview];

    id v10 = [(AFUIPanel *)self popoverController];
    [v10 removeFromParentViewController];

    [(AFUIPanel *)self setPopoverController:0];
  }
}

- (void)dismissMenu
{
  id v2 = [(AFUIPanel *)self popoverController];
  [v2 dismissMenu];
}

- (void)authenticationWillBeginForSessionUUID:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v7 = [(AFUIPanel *)self delegate];
  id v6 = [(AFUIPanel *)self sessionUUID];
  [v7 authenticationWillBeginForSessionUUID:v6 completion:v5];
}

- (void)authenticationDidEndForSessionUUID:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v7 = [(AFUIPanel *)self delegate];
  id v6 = [(AFUIPanel *)self sessionUUID];
  [v7 authenticationDidEndForSessionUUID:v6 completion:v5];
}

- (void)contactsUIWillBeginForSessionUUID:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v7 = [(AFUIPanel *)self delegate];
  id v6 = [(AFUIPanel *)self sessionUUID];
  [v7 contactsUIWillBeginForSessionUUID:v6 completion:v5];
}

- (void)contactsUIDidEndForSessionUUID:(id)a3 completion:(id)a4
{
  id v5 = a4;
  [(AFUIPanel *)self hide];
  id v7 = [(AFUIPanel *)self delegate];
  id v6 = [(AFUIPanel *)self sessionUUID];
  [v7 contactsUIDidEndForSessionUUID:v6 completion:v5];
}

- (void)passwordsUIWillBeginForSessionUUID:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v7 = [(AFUIPanel *)self delegate];
  id v6 = [(AFUIPanel *)self sessionUUID];
  [v7 passwordsUIWillBeginForSessionUUID:v6 completion:v5];
}

- (void)passwordsUIDidEndForSessionUUID:(id)a3 completion:(id)a4
{
  id v5 = a4;
  [(AFUIPanel *)self hide];
  id v7 = [(AFUIPanel *)self delegate];
  id v6 = [(AFUIPanel *)self sessionUUID];
  [v7 passwordsUIDidEndForSessionUUID:v6 completion:v5];
}

- (void)creditCardsUIWillBeginForSessionUUID:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v7 = [(AFUIPanel *)self delegate];
  id v6 = [(AFUIPanel *)self sessionUUID];
  [v7 creditCardsUIWillBeginForSessionUUID:v6 completion:v5];
}

- (void)creditCardsUIDidEndForSessionUUID:(id)a3 completion:(id)a4
{
  id v5 = a4;
  [(AFUIPanel *)self hide];
  id v7 = [(AFUIPanel *)self delegate];
  id v6 = [(AFUIPanel *)self sessionUUID];
  [v7 creditCardsUIWillBeginForSessionUUID:v6 completion:v5];
}

- (void)setIsMenuPresented:(BOOL)a3 forSessionUUID:(id)a4
{
  BOOL v4 = a3;
  id v7 = [(AFUIPanel *)self delegate];
  id v6 = [(AFUIPanel *)self sessionUUID];
  [v7 setIsMenuPresented:v4 forSessionUUID:v6];
}

- (AFUIModalUIDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AFUIModalUIDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AFUIAutoFillPopoverController)popoverController
{
  return self->_popoverController;
}

- (void)setPopoverController:(id)a3
{
}

- (AFUIClientSession)clientSession
{
  return self->_clientSession;
}

- (void)setClientSession:(id)a3
{
}

- (AFUIExplicitAutoFillController)explicitAutoFillController
{
  return self->_explicitAutoFillController;
}

- (void)setExplicitAutoFillController:(id)a3
{
}

- (AFUIPanelState)panelState
{
  return self->_panelState;
}

- (void)setPanelState:(id)a3
{
}

- (RBSProcessMonitor)processMonitor
{
  return (RBSProcessMonitor *)objc_getProperty(self, a2, 48, 1);
}

- (void)setProcessMonitor:(id)a3
{
}

- (NSUUID)sessionUUID
{
  return self->_sessionUUID;
}

- (void)setSessionUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_storeStrong((id *)&self->_processMonitor, 0);
  objc_storeStrong((id *)&self->_panelState, 0);
  objc_storeStrong((id *)&self->_explicitAutoFillController, 0);
  objc_storeStrong((id *)&self->_clientSession, 0);
  objc_storeStrong((id *)&self->_popoverController, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

void __29__AFUIPanel__applyPanelState__block_invoke_cold_1(void *a1)
{
  v1 = NSString;
  id v2 = [a1 documentTraits];
  id v3 = [v2 appId];
  BOOL v4 = [v1 stringWithFormat:@"%s action:DisplayPanel appId:%@"];
  OUTLINED_FUNCTION_0_0(&dword_248A91000, v5, v6, "%@", v7, v8, v9, v10, (uint64_t)"-[AFUIPanel _applyPanelState]_block_invoke", (uint64_t)v3, 2u);
}

void __29__AFUIPanel__applyPanelState__block_invoke_cold_2(void *a1)
{
  v1 = NSString;
  id v2 = [a1 documentTraits];
  id v3 = [v2 appId];
  BOOL v4 = [v1 stringWithFormat:@"%s action:HidePanel appId:%@"];
  OUTLINED_FUNCTION_0_0(&dword_248A91000, v5, v6, "%@", v7, v8, v9, v10, (uint64_t)"-[AFUIPanel _applyPanelState]_block_invoke", (uint64_t)v3, 2u);
}

- (void)documentStateChanged:(void *)a1 .cold.1(void *a1)
{
  v1 = NSString;
  id v2 = [a1 documentTraits];
  id v3 = [v2 appId];
  BOOL v4 = [v1 stringWithFormat:@"%s appId:%@"];
  OUTLINED_FUNCTION_0_0(&dword_248A91000, v5, v6, "%@", v7, v8, v9, v10, (uint64_t)"-[AFUIPanel documentStateChanged:]", (uint64_t)v3, 2u);
}

@end
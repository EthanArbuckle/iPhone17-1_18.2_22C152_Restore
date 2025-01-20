@interface AKBiometricRatchetiOSUIProvider
- (AKBiometricRatchetiOSUIProvider)initWithContext:(id)a3;
- (LARatchet)ratchet;
- (LARatchetViewController)ratchetViewController;
- (id)_makeRatchetOptions:(id)a3;
- (id)ratchetArmCompletion;
- (void)_disableFindMyIfRequiredWithContext:(id)a3 completion:(id)a4;
- (void)_dismissRatchetUIForContext:(id)a3 viewController:(id)a4;
- (void)_displayFindMyDisablementFailedErrorWithContext:(id)a3;
- (void)_presentEmbeddedRatchetUIWithOptions:(id)a3;
- (void)_presentRatchetUIWithContext:(id)a3 options:(id)a4 completion:(id)a5;
- (void)_rightNavButtonTapped;
- (void)dealloc;
- (void)presentRatchetUIWithCompletion:(id)a3;
- (void)ratchetViewController:(id)a3 didFinishWithResult:(id)a4 error:(id)a5;
- (void)setRatchet:(id)a3;
- (void)setRatchetArmCompletion:(id)a3;
- (void)setRatchetViewController:(id)a3;
@end

@implementation AKBiometricRatchetiOSUIProvider

- (AKBiometricRatchetiOSUIProvider)initWithContext:(id)a3
{
  id v4 = a3;
  v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[AKBiometricRatchetiOSUIProvider initWithContext:](v4);
  }

  v11.receiver = self;
  v11.super_class = (Class)AKBiometricRatchetiOSUIProvider;
  v6 = [(AKBiometricRatchetiOSUIProvider *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_context, v4);
    uint64_t v8 = [MEMORY[0x1E4F61A48] sharedInstance];
    findMyManager = v7->_findMyManager;
    v7->_findMyManager = (FMDFMIPManager *)v8;
  }
  return v7;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C38C1000, v0, v1, "AKBiometricRatchetiOSUIProvider deallocated", v2, v3, v4, v5, v6);
}

- (void)_presentEmbeddedRatchetUIWithOptions:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[AKBiometricRatchetiOSUIProvider _presentEmbeddedRatchetUIWithOptions:](v4);
  }

  dispatch_group_enter((dispatch_group_t)self->_dispatchGroup);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  if (LocalAuthenticationEmbeddedUILibraryCore())
  {
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2050000000;
    v7 = (void *)getLARatchetViewControllerClass_softClass;
    uint64_t v23 = getLARatchetViewControllerClass_softClass;
    if (!getLARatchetViewControllerClass_softClass)
    {
      LocalAuthenticationEmbeddedUILibraryCore();
      v21[3] = (uint64_t)objc_getClass("LARatchetViewController");
      getLARatchetViewControllerClass_softClass = v21[3];
      v7 = (void *)v21[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v20, 8);
  }
  else
  {
    id v8 = 0;
  }
  v9 = [v8 makeViewControllerWithOptions:v4];
  [(AKBiometricRatchetiOSUIProvider *)self setRatchetViewController:v9];

  v10 = [(AKBiometricRatchetiOSUIProvider *)self ratchetViewController];
  objc_super v11 = [v10 navigationItem];
  id v12 = objc_alloc(MEMORY[0x1E4F427C0]);
  v13 = [WeakRetained embeddedUIRightNavButtonTitle];
  v14 = (void *)[v12 initWithTitle:v13 style:0 target:self action:sel__rightNavButtonTapped];
  [v11 setRightBarButtonItem:v14];

  v15 = [(AKBiometricRatchetiOSUIProvider *)self ratchetViewController];
  [v15 setDelegate:self];

  v16 = [WeakRetained embeddedUIPresentationMode];
  LODWORD(v11) = [v16 isEqualToString:@"Modal"];

  v17 = _AKLogSystem();
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
  if (v11)
  {
    if (v18) {
      -[AKBiometricRatchetiOSUIProvider _presentEmbeddedRatchetUIWithOptions:]();
    }

    v19 = [(AKBiometricRatchetiOSUIProvider *)self ratchetViewController];
    [v19 evaluateAndPresentViewController];
  }
  else
  {
    if (v18) {
      -[AKBiometricRatchetiOSUIProvider _presentEmbeddedRatchetUIWithOptions:](WeakRetained);
    }

    v19 = [(AKBiometricRatchetiOSUIProvider *)self ratchetViewController];
    [v19 evaluateAndShowViewController];
  }
}

- (void)_presentRatchetUIWithContext:(id)a3 options:(id)a4 completion:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_group_enter((dispatch_group_t)self->_dispatchGroup);
  objc_super v11 = +[AKBiometricRatchetUtility ratchetIdentifier];
  id v12 = _AKLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[AKBiometricRatchetiOSUIProvider _presentRatchetUIWithContext:options:completion:]();
  }

  v13 = (void *)[objc_alloc(MEMORY[0x1E4F30B70]) initWithIdentifier:v11];
  [(AKBiometricRatchetiOSUIProvider *)self setRatchet:v13];

  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy_;
  v24[4] = __Block_byref_object_dispose_;
  id v25 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy_;
  v22[4] = __Block_byref_object_dispose_;
  id v23 = 0;
  v14 = _AKLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v15 = [v8 debugDescription];
    -[AKBiometricRatchetiOSUIProvider _presentRatchetUIWithContext:options:completion:](v15, buf, v14);
  }

  v16 = [(AKBiometricRatchetiOSUIProvider *)self ratchet];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __83__AKBiometricRatchetiOSUIProvider__presentRatchetUIWithContext_options_completion___block_invoke;
  v18[3] = &unk_1E648EE60;
  uint64_t v20 = v24;
  v21 = v22;
  id v17 = v10;
  v18[4] = self;
  id v19 = v17;
  [v16 armWithOptions:v9 completion:v18];

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);
}

void __83__AKBiometricRatchetiOSUIProvider__presentRatchetUIWithContext_options_completion___block_invoke(void *a1, void *a2, void *a3)
{
  unint64_t v5 = a2;
  unint64_t v6 = a3;
  if (!(v5 | v6)) {
    __83__AKBiometricRatchetiOSUIProvider__presentRatchetUIWithContext_options_completion___block_invoke_cold_1();
  }
  v7 = (void *)v6;
  id v8 = [(id)v5 objectForKeyedSubscript:&unk_1F1F03588];

  id v9 = a1 + 6;
  if (v8)
  {
    uint64_t v10 = +[AKBiometricRatchetUtility resultForSuccessfulArmingFromResponse:v5];
    uint64_t v11 = *(void *)(*v9 + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  else
  {
    uint64_t v13 = +[AKBiometricRatchetUtility resultForNonArmingFromError:v7];
    uint64_t v14 = *(void *)(*v9 + 8);
    v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    if (!*(void *)(*(void *)(*v9 + 8) + 40))
    {
      v16 = [v7 userInfo];
      id v17 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

      BOOL v18 = _AKLogSystem();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        __83__AKBiometricRatchetiOSUIProvider__presentRatchetUIWithContext_options_completion___block_invoke_cold_3();
      }

      uint64_t v19 = *(void *)(a1[7] + 8);
      if (v17) {
        uint64_t v20 = v17;
      }
      else {
        uint64_t v20 = v7;
      }
      id v21 = v20;
      uint64_t v22 = *(void **)(v19 + 40);
      *(void *)(v19 + 40) = v21;
    }
  }
  id v23 = _AKLogSystem();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
    __83__AKBiometricRatchetiOSUIProvider__presentRatchetUIWithContext_options_completion___block_invoke_cold_2();
  }

  uint64_t v24 = a1[5];
  if (v24) {
    (*(void (**)(uint64_t, void, void))(v24 + 16))(v24, *(void *)(*(void *)(a1[6] + 8) + 40), *(void *)(*(void *)(a1[7] + 8) + 40));
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1[4] + 24));
}

- (void)presentRatchetUIWithCompletion:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  unint64_t v6 = [(AKBiometricRatchetiOSUIProvider *)self _makeRatchetOptions:WeakRetained];
  v7 = (OS_dispatch_group *)dispatch_group_create();
  dispatchGroup = self->_dispatchGroup;
  self->_dispatchGroup = v7;

  dispatch_group_enter((dispatch_group_t)self->_dispatchGroup);
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy_;
  v15[4] = __Block_byref_object_dispose_;
  id v16 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66__AKBiometricRatchetiOSUIProvider_presentRatchetUIWithCompletion___block_invoke;
  v14[3] = &unk_1E648EE88;
  v14[4] = self;
  v14[5] = v15;
  [(AKBiometricRatchetiOSUIProvider *)self _disableFindMyIfRequiredWithContext:WeakRetained completion:v14];
  id v9 = [WeakRetained metaContext];

  if (v9)
  {
    [(AKBiometricRatchetiOSUIProvider *)self setRatchetArmCompletion:v4];
    [(AKBiometricRatchetiOSUIProvider *)self _presentEmbeddedRatchetUIWithOptions:v6];
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __66__AKBiometricRatchetiOSUIProvider_presentRatchetUIWithCompletion___block_invoke_40;
    v10[3] = &unk_1E648EED8;
    v10[4] = self;
    uint64_t v13 = v15;
    id v11 = WeakRetained;
    id v12 = v4;
    [(AKBiometricRatchetiOSUIProvider *)self _presentRatchetUIWithContext:v11 options:v6 completion:v10];
  }
  _Block_object_dispose(v15, 8);
}

void __66__AKBiometricRatchetiOSUIProvider_presentRatchetUIWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    unint64_t v5 = _AKLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __66__AKBiometricRatchetiOSUIProvider_presentRatchetUIWithCompletion___block_invoke_cold_1();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 24));
}

void __66__AKBiometricRatchetiOSUIProvider_presentRatchetUIWithCompletion___block_invoke_40(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_initWeak(&location, *(id *)(a1 + 32));
  v7 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__AKBiometricRatchetiOSUIProvider_presentRatchetUIWithCompletion___block_invoke_2;
  block[3] = &unk_1E648EEB0;
  objc_copyWeak(&v16, &location);
  uint64_t v15 = *(void *)(a1 + 56);
  id v11 = v6;
  id v12 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = *(id *)(a1 + 48);
  id v8 = v5;
  id v9 = v6;
  dispatch_group_notify(v7, MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __66__AKBiometricRatchetiOSUIProvider_presentRatchetUIWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  uint64_t v3 = WeakRetained;
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) && !*(void *)(a1 + 32)) {
    [WeakRetained _displayFindMyDisablementFailedErrorWithContext:*(void *)(a1 + 40)];
  }
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __66__AKBiometricRatchetiOSUIProvider_presentRatchetUIWithCompletion___block_invoke_2_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 56);
  if (v5) {
    (*(void (**)(uint64_t, void, void))(v5 + 16))(v5, *(void *)(a1 + 48), *(void *)(a1 + 32));
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;
}

- (id)_makeRatchetOptions:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 presentingViewController];
  contextViewController = self->_contextViewController;
  self->_contextViewController = v5;

  v7 = [v4 beginRatchetTitle];
  if (v7)
  {
    id v8 = [v4 beginRatchetTitle];
  }
  else
  {
    id v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v8 = [v9 localizedStringForKey:@"BIOMETRIC_RATCHET_BEGIN_RATCHET_TITLE" value:&stru_1F1EE8138 table:@"Localizable-DTO"];
  }
  uint64_t v10 = [v4 beginRatchetBody];
  if (v10)
  {
    id v11 = [v4 beginRatchetBody];
  }
  else
  {
    id v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v11 = [v12 localizedStringForKey:@"BIOMETRIC_RATCHET_BEGIN_RATCHET_BODY" value:&stru_1F1EE8138 table:@"Localizable-DTO"];
  }
  id v13 = [v4 countdownText];
  if (v13)
  {
    id v14 = [v4 countdownText];
  }
  else
  {
    uint64_t v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v14 = [v15 localizedStringForKey:@"BIOMETRIC_RATCHET_COUNTDOWN_TEXT" value:&stru_1F1EE8138 table:@"Localizable-DTO"];
  }
  id v16 = [v4 reason];
  if (v16)
  {
    id v17 = [v4 reason];
  }
  else
  {
    BOOL v18 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v17 = [v18 localizedStringForKey:@"BIOMETRIC_RATCHET_FALLBACK_ALERT_SUBTITLE" value:&stru_1F1EE8138 table:@"Localizable-DTO"];
  }
  uint64_t v19 = [v4 calloutReason];
  if (v19)
  {
    uint64_t v20 = [v4 calloutReason];
  }
  else
  {
    id v21 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v20 = [v21 localizedStringForKey:@"BIOMETRIC_RATCHET_CALLOUT_REASON_TEXT" value:&stru_1F1EE8138 table:@"Localizable-DTO"];
  }
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v22 setObject:v17 forKeyedSubscript:&unk_1F1F035A0];
  [v22 setObject:v20 forKeyedSubscript:&unk_1F1F03588];
  [v22 setObject:self->_contextViewController forKeyedSubscript:&unk_1F1F035B8];
  id v23 = [v4 deeplinkURL];
  [v22 setObject:v23 forKeyedSubscript:&unk_1F1F035D0];

  uint64_t v24 = objc_msgSend(objc_alloc(NSNumber), "initWithBool:", objc_msgSend(v4, "fallbackToNoAuth"));
  [v22 setObject:v24 forKeyedSubscript:&unk_1F1F035E8];

  [v22 setObject:v8 forKeyedSubscript:&unk_1F1F03600];
  [v22 setObject:v11 forKeyedSubscript:&unk_1F1F03618];
  id v25 = objc_msgSend(objc_alloc(NSNumber), "initWithBool:", objc_msgSend(v4, "showsLocationWarning"));
  [v22 setObject:v25 forKeyedSubscript:&unk_1F1F03630];

  [v22 setObject:v14 forKeyedSubscript:&unk_1F1F03648];
  v26 = (void *)[v22 copy];

  return v26;
}

- (void)_rightNavButtonTapped
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  uint64_t v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F30B38] code:-2 userInfo:0];
  id v4 = [(AKBiometricRatchetiOSUIProvider *)self ratchetArmCompletion];
  ((void (**)(void, void, void *))v4)[2](v4, 0, v3);

  if (objc_opt_respondsToSelector()) {
    [(UIViewController *)self->_contextViewController rightNavButtonTapped];
  }
  uint64_t v5 = [(AKBiometricRatchetiOSUIProvider *)self ratchetViewController];
  [(AKBiometricRatchetiOSUIProvider *)self _dismissRatchetUIForContext:WeakRetained viewController:v5];
}

- (void)ratchetViewController:(id)a3 didFinishWithResult:(id)a4 error:(id)a5
{
  id v8 = a3;
  unint64_t v9 = (unint64_t)a4;
  unint64_t v10 = (unint64_t)a5;
  id v11 = _AKLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[AKBiometricRatchetiOSUIProvider ratchetViewController:didFinishWithResult:error:]();
  }

  if (!(v9 | v10)) {
    -[AKBiometricRatchetiOSUIProvider ratchetViewController:didFinishWithResult:error:]();
  }
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy_;
  v34[4] = __Block_byref_object_dispose_;
  id v35 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  id v13 = [(id)v9 objectForKeyedSubscript:&unk_1F1F03588];

  if (v13)
  {
    id v14 = +[AKBiometricRatchetUtility resultForSuccessfulArmingFromResponse:v9];
LABEL_6:
    id v15 = 0;
    goto LABEL_14;
  }
  id v14 = +[AKBiometricRatchetUtility resultForNonArmingFromError:v10];
  if (!v10) {
    goto LABEL_6;
  }
  id v16 = [(id)v10 userInfo];
  id v17 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

  BOOL v18 = _AKLogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    __83__AKBiometricRatchetiOSUIProvider__presentRatchetUIWithContext_options_completion___block_invoke_cold_3();
  }

  if (v17) {
    uint64_t v19 = v17;
  }
  else {
    uint64_t v19 = (void *)v10;
  }
  id v15 = v19;

LABEL_14:
  dispatch_group_leave((dispatch_group_t)self->_dispatchGroup);
  objc_initWeak(&location, self);
  dispatchGroup = self->_dispatchGroup;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __83__AKBiometricRatchetiOSUIProvider_ratchetViewController_didFinishWithResult_error___block_invoke;
  v25[3] = &unk_1E648EF00;
  objc_copyWeak(&v32, &location);
  id v26 = v15;
  id v27 = WeakRetained;
  v28 = self;
  id v29 = v14;
  id v30 = v8;
  v31 = v34;
  id v21 = v8;
  id v22 = v14;
  id v23 = WeakRetained;
  id v24 = v15;
  dispatch_group_notify(dispatchGroup, MEMORY[0x1E4F14428], v25);

  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);
  _Block_object_dispose(v34, 8);
}

void __83__AKBiometricRatchetiOSUIProvider_ratchetViewController_didFinishWithResult_error___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) && !*(void *)(a1 + 32)) {
    [WeakRetained _displayFindMyDisablementFailedErrorWithContext:*(void *)(a1 + 40)];
  }
  uint64_t v2 = [*(id *)(a1 + 48) ratchetArmCompletion];

  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 48) ratchetArmCompletion];
    v3[2](v3, *(void *)(a1 + 56), *(void *)(a1 + 32));
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 72) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  [*(id *)(a1 + 48) _dismissRatchetUIForContext:*(void *)(a1 + 40) viewController:*(void *)(a1 + 64)];
}

- (void)_dismissRatchetUIForContext:(id)a3 viewController:(id)a4
{
  id v6 = a4;
  v7 = [a3 embeddedUIPresentationMode];
  int v8 = [v7 isEqualToString:@"Modal"];

  unint64_t v9 = _AKLogSystem();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  if (v8)
  {
    if (v10) {
      -[AKBiometricRatchetiOSUIProvider _dismissRatchetUIForContext:viewController:]();
    }

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __78__AKBiometricRatchetiOSUIProvider__dismissRatchetUIForContext_viewController___block_invoke;
    v13[3] = &unk_1E648EF28;
    v13[4] = self;
    [v6 dismissViewControllerAnimated:1 completion:v13];
  }
  else
  {
    if (v10) {
      -[AKBiometricRatchetiOSUIProvider _dismissRatchetUIForContext:viewController:]();
    }

    id v11 = [v6 navigationController];

    id v12 = (id)[v11 popViewControllerAnimated:1];
    [(AKBiometricRatchetiOSUIProvider *)self setRatchetViewController:0];
  }
}

uint64_t __78__AKBiometricRatchetiOSUIProvider__dismissRatchetUIForContext_viewController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setRatchetViewController:0];
}

- (void)_disableFindMyIfRequiredWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 showsLocationWarning])
  {
    objc_initWeak(&location, self);
    if (objc_opt_respondsToSelector())
    {
      findMyManager = self->_findMyManager;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __82__AKBiometricRatchetiOSUIProvider__disableFindMyIfRequiredWithContext_completion___block_invoke;
      v11[3] = &unk_1E648EF78;
      objc_copyWeak(&v13, &location);
      id v12 = v7;
      [(FMDFMIPManager *)findMyManager requireDisableLocationWithCompletion:v11];

      objc_destroyWeak(&v13);
    }
    else
    {
      BOOL v10 = _AKLogSystem();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[AKBiometricRatchetiOSUIProvider _disableFindMyIfRequiredWithContext:completion:]();
      }

      if (v7) {
        (*((void (**)(id, void))v7 + 2))(v7, 0);
      }
    }
    objc_destroyWeak(&location);
  }
  else
  {
    unint64_t v9 = _AKLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[AKBiometricRatchetiOSUIProvider _disableFindMyIfRequiredWithContext:completion:]();
    }

    if (v7) {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
  }
}

void __82__AKBiometricRatchetiOSUIProvider__disableFindMyIfRequiredWithContext_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v5)
  {
    id v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __82__AKBiometricRatchetiOSUIProvider__disableFindMyIfRequiredWithContext_completion___block_invoke_cold_4();
    }
  }
  else if (a2)
  {
    if (a2 == 1)
    {
      if (objc_opt_respondsToSelector())
      {
        unint64_t v9 = (void *)WeakRetained[2];
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __82__AKBiometricRatchetiOSUIProvider__disableFindMyIfRequiredWithContext_completion___block_invoke_87;
        v10[3] = &unk_1E648EF50;
        id v11 = *(id *)(a1 + 32);
        [v9 disableLocationDisplayWithCompletion:v10];

        goto LABEL_6;
      }
      id v7 = _AKLogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __82__AKBiometricRatchetiOSUIProvider__disableFindMyIfRequiredWithContext_completion___block_invoke_cold_2();
      }
    }
    else
    {
      id v7 = _AKLogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __82__AKBiometricRatchetiOSUIProvider__disableFindMyIfRequiredWithContext_completion___block_invoke_cold_1();
      }
    }
  }
  else
  {
    id v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __82__AKBiometricRatchetiOSUIProvider__disableFindMyIfRequiredWithContext_completion___block_invoke_cold_3();
    }
  }

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, void))(v8 + 16))(v8, 0);
  }
LABEL_6:
}

void __82__AKBiometricRatchetiOSUIProvider__disableFindMyIfRequiredWithContext_completion___block_invoke_87(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AKLogSystem();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __82__AKBiometricRatchetiOSUIProvider__disableFindMyIfRequiredWithContext_completion___block_invoke_87_cold_2();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __82__AKBiometricRatchetiOSUIProvider__disableFindMyIfRequiredWithContext_completion___block_invoke_87_cold_1();
  }

  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
}

- (void)_displayFindMyDisablementFailedErrorWithContext:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 presentingViewController];
  id v5 = (void *)MEMORY[0x1E4F42728];
  uint64_t v6 = [v3 findMyErrorTitle];
  id v7 = [v3 findMyErrorMessage];

  uint64_t v8 = [v5 alertControllerWithTitle:v6 message:v7 preferredStyle:1];

  unint64_t v9 = (void *)MEMORY[0x1E4F42720];
  BOOL v10 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
  id v11 = [v10 localizedStringForKey:@"ALERT_DEFAULT_BUTTON" value:&stru_1F1EE8138 table:@"Localizable"];
  id v12 = [v9 actionWithTitle:v11 style:0 handler:&__block_literal_global];
  [v8 addAction:v12];

  id v13 = _AKLogSystem();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v14) {
      -[AKBiometricRatchetiOSUIProvider _displayFindMyDisablementFailedErrorWithContext:]();
    }
  }
  else if (v14)
  {
    -[AKBiometricRatchetiOSUIProvider _displayFindMyDisablementFailedErrorWithContext:]();
  }

  [v4 presentViewController:v8 animated:1 completion:0];
}

void __83__AKBiometricRatchetiOSUIProvider__displayFindMyDisablementFailedErrorWithContext___block_invoke()
{
  v0 = _AKLogSystem();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __83__AKBiometricRatchetiOSUIProvider__displayFindMyDisablementFailedErrorWithContext___block_invoke_cold_1();
  }
}

- (id)ratchetArmCompletion
{
  return self->_ratchetArmCompletion;
}

- (void)setRatchetArmCompletion:(id)a3
{
}

- (LARatchet)ratchet
{
  return self->_ratchet;
}

- (void)setRatchet:(id)a3
{
}

- (LARatchetViewController)ratchetViewController
{
  return self->_ratchetViewController;
}

- (void)setRatchetViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ratchetViewController, 0);
  objc_storeStrong((id *)&self->_ratchet, 0);
  objc_storeStrong(&self->_ratchetArmCompletion, 0);
  objc_storeStrong((id *)&self->_contextViewController, 0);
  objc_storeStrong((id *)&self->_dispatchGroup, 0);
  objc_storeStrong((id *)&self->_findMyManager, 0);

  objc_destroyWeak((id *)&self->_context);
}

- (void)initWithContext:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 description];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_1C38C1000, v2, v3, "initing iOS bio ratchet UI provider with context: %@", v4, v5, v6, v7, v8);
}

- (void)_presentEmbeddedRatchetUIWithOptions:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C38C1000, v0, v1, "Ratchet presenting modally", v2, v3, v4, v5, v6);
}

- (void)_presentEmbeddedRatchetUIWithOptions:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1 = [a1 embeddedUIPresentationMode];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_1C38C1000, v2, v3, "Ratchet presenting push, %@", v4, v5, v6, v7, v8);
}

- (void)_presentEmbeddedRatchetUIWithOptions:(void *)a1 .cold.3(void *a1)
{
  uint64_t v1 = [a1 debugDescription];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_1C38C1000, v2, v3, "Present embedded ratchet with options: %@", v4, v5, v6, v7, v8);
}

- (void)_presentRatchetUIWithContext:(void *)a1 options:(uint8_t *)buf completion:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_1C38C1000, log, OS_LOG_TYPE_DEBUG, "presentBiometricRatchetArmingUIWithCompletion with context: %@", buf, 0xCu);
}

- (void)_presentRatchetUIWithContext:options:completion:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_1C38C1000, v0, OS_LOG_TYPE_DEBUG, "ratchet identifier is: %@", v1, 0xCu);
}

void __83__AKBiometricRatchetiOSUIProvider__presentRatchetUIWithContext_options_completion___block_invoke_cold_1()
{
  __assert_rtn("-[AKBiometricRatchetiOSUIProvider _presentRatchetUIWithContext:options:completion:]_block_invoke", "AKBiometricRatchetiOSUIProvider.m", 112, "result != nil || error != nil");
}

void __83__AKBiometricRatchetiOSUIProvider__presentRatchetUIWithContext_options_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8(&dword_1C38C1000, v0, v1, "returning result: %@, error: %@");
}

void __83__AKBiometricRatchetiOSUIProvider__presentRatchetUIWithContext_options_completion___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_9(&dword_1C38C1000, v0, v1, "Ratchet is in unexpected error - %@, underlying error - %@");
}

void __66__AKBiometricRatchetiOSUIProvider_presentRatchetUIWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_1C38C1000, v0, v1, "disableFindMy failed with error - %@", v2, v3, v4, v5, v6);
}

void __66__AKBiometricRatchetiOSUIProvider_presentRatchetUIWithCompletion___block_invoke_2_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_7();
  _os_log_debug_impl(&dword_1C38C1000, v0, OS_LOG_TYPE_DEBUG, "Ratchet returning result: %@, error: %@", v1, 0x16u);
}

- (void)ratchetViewController:didFinishWithResult:error:.cold.1()
{
  __assert_rtn("-[AKBiometricRatchetiOSUIProvider ratchetViewController:didFinishWithResult:error:]", "AKBiometricRatchetiOSUIProvider.m", 216, "result != nil || error != nil");
}

- (void)ratchetViewController:didFinishWithResult:error:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8(&dword_1C38C1000, v0, v1, "ratchetViewController didFinishWithResult: result: %@, error: %@");
}

- (void)_dismissRatchetUIForContext:viewController:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C38C1000, v0, v1, "Dismissing modally presented ratchet", v2, v3, v4, v5, v6);
}

- (void)_dismissRatchetUIForContext:viewController:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C38C1000, v0, v1, "Popping pushed ratchet", v2, v3, v4, v5, v6);
}

- (void)_disableFindMyIfRequiredWithContext:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1C38C1000, v0, v1, "Disabling FM not required via idms - idms is handling the logic to determine with operations need this", v2, v3, v4, v5, v6);
}

- (void)_disableFindMyIfRequiredWithContext:completion:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1C38C1000, v0, v1, "does not respondToSelector requireDisableLocationWithCompletion", v2, v3, v4, v5, v6);
}

void __82__AKBiometricRatchetiOSUIProvider__disableFindMyIfRequiredWithContext_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1C38C1000, v0, v1, "Require disable returned unknown, no-op", v2, v3, v4, v5, v6);
}

void __82__AKBiometricRatchetiOSUIProvider__disableFindMyIfRequiredWithContext_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1C38C1000, v0, v1, "does not respondToSelector disableLocationDisplayWithCompletion", v2, v3, v4, v5, v6);
}

void __82__AKBiometricRatchetiOSUIProvider__disableFindMyIfRequiredWithContext_completion___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1C38C1000, v0, v1, "Disabling FindyMy not required via FindMy as it might already be in the blackout period", v2, v3, v4, v5, v6);
}

void __82__AKBiometricRatchetiOSUIProvider__disableFindMyIfRequiredWithContext_completion___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_1C38C1000, v0, v1, "Cannot determine if disable is required due to error: %@", v2, v3, v4, v5, v6);
}

void __82__AKBiometricRatchetiOSUIProvider__disableFindMyIfRequiredWithContext_completion___block_invoke_87_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C38C1000, v0, v1, "disableLocationDisplay suceeded", v2, v3, v4, v5, v6);
}

void __82__AKBiometricRatchetiOSUIProvider__disableFindMyIfRequiredWithContext_completion___block_invoke_87_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_1C38C1000, v0, v1, "disableLocationDisplay failed with error - %@", v2, v3, v4, v5, v6);
}

- (void)_displayFindMyDisablementFailedErrorWithContext:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C38C1000, v0, v1, "nil presentingViewController", v2, v3, v4, v5, v6);
}

- (void)_displayFindMyDisablementFailedErrorWithContext:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_1C38C1000, v0, OS_LOG_TYPE_DEBUG, "presentingViewController - %@", v1, 0xCu);
}

void __83__AKBiometricRatchetiOSUIProvider__displayFindMyDisablementFailedErrorWithContext___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C38C1000, v0, v1, "User picked OK", v2, v3, v4, v5, v6);
}

@end
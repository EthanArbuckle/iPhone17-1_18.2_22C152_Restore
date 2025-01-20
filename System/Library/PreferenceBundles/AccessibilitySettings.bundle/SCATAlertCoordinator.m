@interface SCATAlertCoordinator
- (BOOL)isShowingAlert;
- (SCATAlertCoordinator)initWithViewController:(id)a3;
- (UIViewController)viewController;
- (void)setShowingAlert:(BOOL)a3;
- (void)setViewController:(id)a3;
- (void)showSwichAlreadyInUseAlert:(id)a3;
- (void)showSwitchNamingAlertWithSwitch:(id)a3 message:(id)a4 successHandler:(id)a5 cancelHandler:(id)a6;
@end

@implementation SCATAlertCoordinator

- (SCATAlertCoordinator)initWithViewController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SCATAlertCoordinator;
  v5 = [(SCATAlertCoordinator *)&v8 init];
  v6 = v5;
  if (v5) {
    [(SCATAlertCoordinator *)v5 setViewController:v4];
  }

  return v6;
}

- (void)showSwitchNamingAlertWithSwitch:(id)a3 message:(id)a4 successHandler:(id)a5 cancelHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10) {
    _AXAssert();
  }
  if (![(SCATAlertCoordinator *)self isShowingAlert])
  {
    v28 = v12;
    uint64_t v14 = AXParameterizedLocalizedString();
    uint64_t v15 = AXParameterizedLocalizedString();
    v27 = AXParameterizedLocalizedString();
    objc_initWeak(location, self);
    id v25 = v11;
    v26 = (void *)v14;
    v16 = +[UIAlertController alertControllerWithTitle:v14 message:v11 preferredStyle:1];
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = __93__SCATAlertCoordinator_showSwitchNamingAlertWithSwitch_message_successHandler_cancelHandler___block_invoke;
    v40[3] = &unk_20C450;
    id v17 = v13;
    id v41 = v17;
    objc_copyWeak(&v42, location);
    v18 = (void *)v15;
    v19 = +[UIAlertAction actionWithTitle:v15 style:1 handler:v40];
    [v16 addAction:v19];

    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = __93__SCATAlertCoordinator_showSwitchNamingAlertWithSwitch_message_successHandler_cancelHandler___block_invoke_2;
    v34[3] = &unk_20C4A0;
    id v20 = v16;
    id v35 = v20;
    id v21 = v10;
    id v36 = v21;
    objc_copyWeak(&v39, location);
    id v12 = v28;
    id v37 = v28;
    id v38 = v17;
    v22 = +[UIAlertAction actionWithTitle:v27 style:0 handler:v34];
    [v20 addAction:v22];

    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = __93__SCATAlertCoordinator_showSwitchNamingAlertWithSwitch_message_successHandler_cancelHandler___block_invoke_4;
    v32[3] = &unk_20C4C8;
    id v33 = v21;
    [v20 addTextFieldWithConfigurationHandler:v32];
    v23 = [(SCATAlertCoordinator *)self viewController];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = __93__SCATAlertCoordinator_showSwitchNamingAlertWithSwitch_message_successHandler_cancelHandler___block_invoke_5;
    v29[3] = &unk_20C148;
    id v24 = v20;
    id v30 = v24;
    objc_copyWeak(&v31, location);
    [v23 presentViewController:v24 animated:1 completion:v29];

    objc_destroyWeak(&v31);
    objc_destroyWeak(&v39);

    objc_destroyWeak(&v42);
    objc_destroyWeak(location);

    id v11 = v25;
  }
}

void __93__SCATAlertCoordinator_showSwitchNamingAlertWithSwitch_message_successHandler_cancelHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setShowingAlert:0];
}

void __93__SCATAlertCoordinator_showSwitchNamingAlertWithSwitch_message_successHandler_cancelHandler___block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1[4] textFields];
  v5 = [v4 firstObject];

  v6 = [v5 text];
  if ([v6 length]) {
    [v5 text];
  }
  else {
  v7 = [v5 placeholder];
  }

  objc_super v8 = [a1[5] name];
  if ([v8 length])
  {
    v9 = [a1[5] name];
    unsigned __int8 v10 = [v9 isEqualToString:v7];

    if (v10) {
      goto LABEL_10;
    }
  }
  else
  {
  }
  if (SCATSwitchExistsWithName())
  {
    objc_copyWeak(&v16, a1 + 8);
    id v13 = a1[5];
    id v14 = a1[6];
    id v15 = a1[7];
    AXPerformBlockOnMainThreadAfterDelay();

    objc_destroyWeak(&v16);
    goto LABEL_12;
  }
LABEL_10:
  [a1[5] setName:v7];
  id v11 = (void (**)(void))a1[6];
  if (v11) {
    v11[2]();
  }
LABEL_12:
  id WeakRetained = objc_loadWeakRetained(a1 + 8);
  [WeakRetained setShowingAlert:0];
}

void __93__SCATAlertCoordinator_showSwitchNamingAlertWithSwitch_message_successHandler_cancelHandler___block_invoke_3(uint64_t a1)
{
  AXParameterizedLocalizedString();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained showSwitchNamingAlertWithSwitch:*(void *)(a1 + 32) message:v3 successHandler:*(void *)(a1 + 40) cancelHandler:*(void *)(a1 + 48)];
}

void __93__SCATAlertCoordinator_showSwitchNamingAlertWithSwitch_message_successHandler_cancelHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = SCATNextAvailableSwitchName();
  [v7 setPlaceholder:v3];

  id v4 = [*(id *)(a1 + 32) name];
  id v5 = [v4 length];

  if (v5)
  {
    v6 = [*(id *)(a1 + 32) name];
    [v7 setText:v6];
  }
  [v7 setAutocapitalizationType:2];
  [v7 setAutocorrectionType:1];
  [v7 setEnablesReturnKeyAutomatically:1];
}

void __93__SCATAlertCoordinator_showSwitchNamingAlertWithSwitch_message_successHandler_cancelHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) textFields];
  id v3 = [v2 firstObject];
  [v3 becomeFirstResponder];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setShowingAlert:1];
}

- (void)showSwichAlreadyInUseAlert:(id)a3
{
  id v4 = a3;
  if (![(SCATAlertCoordinator *)self isShowingAlert])
  {
    objc_initWeak(&location, self);
    id v5 = AXParameterizedLocalizedString();
    v6 = AXParameterizedLocalizedString();
    id v7 = AXParameterizedLocalizedString();
    objc_super v8 = +[UIAlertController alertControllerWithTitle:v5 message:v6 preferredStyle:1];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __51__SCATAlertCoordinator_showSwichAlreadyInUseAlert___block_invoke;
    v13[3] = &unk_20C450;
    id v14 = v4;
    objc_copyWeak(&v15, &location);
    v9 = +[UIAlertAction actionWithTitle:v7 style:1 handler:v13];
    [v8 addAction:v9];
    unsigned __int8 v10 = [(SCATAlertCoordinator *)self viewController];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = __51__SCATAlertCoordinator_showSwichAlreadyInUseAlert___block_invoke_2;
    v11[3] = &unk_208798;
    objc_copyWeak(&v12, &location);
    [v10 presentViewController:v8 animated:1 completion:v11];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&v15);

    objc_destroyWeak(&location);
  }
}

void __51__SCATAlertCoordinator_showSwichAlreadyInUseAlert___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setShowingAlert:0];
}

void __51__SCATAlertCoordinator_showSwichAlreadyInUseAlert___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setShowingAlert:1];
}

- (UIViewController)viewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);

  return (UIViewController *)WeakRetained;
}

- (void)setViewController:(id)a3
{
}

- (BOOL)isShowingAlert
{
  return self->_showingAlert;
}

- (void)setShowingAlert:(BOOL)a3
{
  self->_showingAlert = a3;
}

- (void).cxx_destruct
{
}

@end
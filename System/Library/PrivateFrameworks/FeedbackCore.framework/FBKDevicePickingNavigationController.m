@interface FBKDevicePickingNavigationController
- (FBKDevicePickingNavigationController)initWithDeviceChoices:(id)a3 allowsMultipleSelection:(BOOL)a4 completion:(id)a5;
- (id)completion;
- (void)deviceChoicesController:(id)a3 didChooseDevices:(id)a4;
- (void)deviceChoicesControllerDidCancelWithController:(id)a3;
- (void)pairedDevicesDidChangeWithAddedDevice:(id)a3 removed:(id)a4;
- (void)pairingViewDidCancel;
- (void)pairingViewDidClose;
- (void)setCompletion:(id)a3;
@end

@implementation FBKDevicePickingNavigationController

- (FBKDevicePickingNavigationController)initWithDeviceChoices:(id)a3 allowsMultipleSelection:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  v10 = objc_alloc_init(FBKDeviceChoicesViewController);
  [(FBKDeviceChoicesViewController *)v10 setDeviceChoices:v9];

  [(FBKDeviceChoicesViewController *)v10 setIsMultiSelect:v5];
  [(FBKDeviceChoicesViewController *)v10 setChoiceDelegate:self];
  v14.receiver = self;
  v14.super_class = (Class)FBKDevicePickingNavigationController;
  v11 = [(FBKDevicePickingNavigationController *)&v14 initWithRootViewController:v10];
  v12 = v11;
  if (v11) {
    [(FBKDevicePickingNavigationController *)v11 setCompletion:v8];
  }

  return v12;
}

- (void)pairedDevicesDidChangeWithAddedDevice:(id)a3 removed:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = +[FBKLog ded];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = v6;
      _os_log_impl(&dword_22A36D000, v8, OS_LOG_TYPE_DEFAULT, "device picker paired new device [%{public}@]", buf, 0xCu);
    }

    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __86__FBKDevicePickingNavigationController_pairedDevicesDidChangeWithAddedDevice_removed___block_invoke;
    v12[3] = &unk_264874270;
    v12[4] = self;
    id v13 = v6;
    [(FBKDevicePickingNavigationController *)self dismissViewControllerAnimated:1 completion:v12];
  }
  else
  {
    id v9 = +[FBKLog ded];
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v10)
      {
        v11 = [v7 description];
        *(_DWORD *)buf = 138543362;
        id v15 = v11;
        _os_log_impl(&dword_22A36D000, v9, OS_LOG_TYPE_DEFAULT, "removed device [%{public}@] while being asked to pair with new one, noop", buf, 0xCu);
      }
    }
    else if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22A36D000, v9, OS_LOG_TYPE_DEFAULT, "how did we get here?", buf, 2u);
    }
  }
}

void __86__FBKDevicePickingNavigationController_pairedDevicesDidChangeWithAddedDevice_removed___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) completion];

  if (v2)
  {
    v4 = [*(id *)(a1 + 32) completion];
    v3 = [MEMORY[0x263EFFA08] setWithObject:*(void *)(a1 + 40)];
    v4[2](v4, v3);
  }
}

- (void)pairingViewDidClose
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "-[FBKDevicePickingNavigationController pairingViewDidClose]";
  _os_log_debug_impl(&dword_22A36D000, log, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v1, 0xCu);
}

- (void)pairingViewDidCancel
{
  uint64_t v3 = +[FBKLog ded];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22A36D000, v3, OS_LOG_TYPE_DEFAULT, "device picker paired no device", buf, 2u);
  }

  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __60__FBKDevicePickingNavigationController_pairingViewDidCancel__block_invoke;
  v4[3] = &unk_264873FE8;
  v4[4] = self;
  [(FBKDevicePickingNavigationController *)self dismissViewControllerAnimated:1 completion:v4];
}

void __60__FBKDevicePickingNavigationController_pairingViewDidCancel__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) completion];

  if (v2)
  {
    v4 = [*(id *)(a1 + 32) completion];
    uint64_t v3 = [MEMORY[0x263EFFA08] set];
    v4[2](v4, v3);
  }
}

- (void)deviceChoicesController:(id)a3 didChooseDevices:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = +[FBKLog ded];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 valueForKeyPath:@"publicLogDescription"];
    *(_DWORD *)buf = 138543362;
    v12 = v7;
    _os_log_impl(&dword_22A36D000, v6, OS_LOG_TYPE_DEFAULT, "device picker chose devices [%{public}@]", buf, 0xCu);
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __81__FBKDevicePickingNavigationController_deviceChoicesController_didChooseDevices___block_invoke;
  v9[3] = &unk_264874270;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  [(FBKDevicePickingNavigationController *)self dismissViewControllerAnimated:1 completion:v9];
}

void __81__FBKDevicePickingNavigationController_deviceChoicesController_didChooseDevices___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) completion];

  if (v2)
  {
    v4 = [*(id *)(a1 + 32) completion];
    v4[2](v4, *(void *)(a1 + 40));
  }
  else
  {
    uint64_t v3 = +[FBKLog ded];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __81__FBKDevicePickingNavigationController_deviceChoicesController_didChooseDevices___block_invoke_cold_1(v3);
    }
  }
}

- (void)deviceChoicesControllerDidCancelWithController:(id)a3
{
  v4 = +[FBKLog ded];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22A36D000, v4, OS_LOG_TYPE_DEFAULT, "device picker chose no device", buf, 2u);
  }

  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __87__FBKDevicePickingNavigationController_deviceChoicesControllerDidCancelWithController___block_invoke;
  v5[3] = &unk_264873FE8;
  v5[4] = self;
  [(FBKDevicePickingNavigationController *)self dismissViewControllerAnimated:1 completion:v5];
}

void __87__FBKDevicePickingNavigationController_deviceChoicesControllerDidCancelWithController___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) completion];

  if (v2)
  {
    id v5 = [*(id *)(a1 + 32) completion];
    uint64_t v3 = [MEMORY[0x263EFFA08] set];
    v5[2](v5, v3);
  }
  else
  {
    v4 = +[FBKLog ded];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __81__FBKDevicePickingNavigationController_deviceChoicesController_didChooseDevices___block_invoke_cold_1(v4);
    }
  }
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
}

void __81__FBKDevicePickingNavigationController_deviceChoicesController_didChooseDevices___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_22A36D000, log, OS_LOG_TYPE_ERROR, "Device choices made but no completion block given", v1, 2u);
}

@end
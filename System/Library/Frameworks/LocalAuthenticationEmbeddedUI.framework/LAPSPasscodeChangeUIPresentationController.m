@interface LAPSPasscodeChangeUIPresentationController
- (LAPSPasscodeChangeUIPresentationController)initWithParentVC:(id)a3 containerVC:(id)a4;
- (void)_restoreParentModalInPresentationFlag;
- (void)_setupParentVCIfNeededAnimated:(BOOL)a3;
- (void)_storeParentModalInPresentationFlag;
- (void)dismissWithCompletion:(id)a3;
- (void)presentAlertVC:(id)a3;
- (void)presentVC:(id)a3 animated:(BOOL)a4;
@end

@implementation LAPSPasscodeChangeUIPresentationController

- (LAPSPasscodeChangeUIPresentationController)initWithParentVC:(id)a3 containerVC:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  v11.receiver = self;
  v11.super_class = (Class)LAPSPasscodeChangeUIPresentationController;
  v8 = [(LAPSPasscodeChangeUIPresentationController *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_parentVC, v6);
    [(LAPSPasscodeChangeUIPresentationController *)v9 _storeParentModalInPresentationFlag];
    objc_storeStrong((id *)&v9->_containerVC, a4);
  }

  return v9;
}

- (void)dismissWithCompletion:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v4 = (void (**)(void))a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  v5 = LACLogPasscodeService();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138543362;
    v15 = self;
    _os_log_impl(&dword_23F450000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ will dismiss UI", (uint8_t *)&v14, 0xCu);
  }

  [(LACUIContainerViewController *)self->_containerVC resignFirstResponder];
  id v6 = [(LACUIContainerViewController *)self->_containerVC view];
  [v6 setUserInteractionEnabled:0];

  [(LAPSPasscodeChangeUIPresentationController *)self _restoreParentModalInPresentationFlag];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentVC);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v9 = [(LACUIContainerViewController *)self->_containerVC navigationItem];
    id v10 = objc_alloc_init(MEMORY[0x263F824A8]);
    [v10 setTitle:&stru_26F31E768];
    [v9 setBackBarButtonItem:v10];

LABEL_7:
    v4[2](v4);
    goto LABEL_8;
  }
  p_rootVC = &self->_rootVC;
  id v12 = objc_loadWeakRetained((id *)p_rootVC);

  if (!v12) {
    goto LABEL_7;
  }
  id v13 = objc_loadWeakRetained((id *)p_rootVC);
  [v13 dismissViewControllerAnimated:1 completion:v4];

LABEL_8:
}

- (void)presentAlertVC:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  v5 = LACLogPasscodeService();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    id v10 = self;
    __int16 v11 = 2114;
    id v12 = v4;
    _os_log_impl(&dword_23F450000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ will present %{public}@", (uint8_t *)&v9, 0x16u);
  }

  id v6 = [(LACUIContainerViewController *)self->_containerVC parentViewController];
  if (v6) {
    id WeakRetained = self->_containerVC;
  }
  else {
    id WeakRetained = (LACUIContainerViewController *)objc_loadWeakRetained((id *)&self->_parentVC);
  }
  v8 = WeakRetained;

  [(LACUIContainerViewController *)v8 resignFirstResponder];
  [(LACUIContainerViewController *)v8 presentViewController:v4 animated:1 completion:&__block_literal_global_5];
}

- (void)presentVC:(id)a3 animated:(BOOL)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v7 = LACLogPasscodeService();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v12 = self;
    __int16 v13 = 2114;
    id v14 = v6;
    _os_log_impl(&dword_23F450000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ will present %{public}@", buf, 0x16u);
  }

  [(LAPSPasscodeChangeUIPresentationController *)self _setupParentVCIfNeededAnimated:1];
  containerVC = self->_containerVC;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __65__LAPSPasscodeChangeUIPresentationController_presentVC_animated___block_invoke;
  v9[3] = &unk_26506F300;
  BOOL v10 = a4;
  v9[4] = self;
  [(LACUIContainerViewController *)containerVC presentViewController:v6 transitionStyle:__65__LAPSPasscodeChangeUIPresentationController_presentVC_animated___block_invoke((uint64_t)v9)];
}

BOOL __65__LAPSPasscodeChangeUIPresentationController_presentVC_animated___block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 40)) {
    return 0;
  }
  v1 = [*(id *)(*(void *)(a1 + 32) + 32) currentViewController];
  BOOL v2 = v1 != 0;

  return v2;
}

- (void)_storeParentModalInPresentationFlag
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentVC);
  self->_parentModalInPresentationOriginalFlag = [WeakRetained isModalInPresentation];
}

- (void)_restoreParentModalInPresentationFlag
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentVC);
  [WeakRetained setModalInPresentation:self->_parentModalInPresentationOriginalFlag];
}

- (void)_setupParentVCIfNeededAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(LACUIContainerViewController *)self->_containerVC parentViewController];

  if (!v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_parentVC);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id obj = objc_loadWeakRetained((id *)&self->_parentVC);
      [obj setModalInPresentation:1];
      containerVC = self->_containerVC;
      int v9 = [obj viewControllers];
      objc_msgSend(obj, "pushViewController:animated:", containerVC, objc_msgSend(v9, "count") != 0);

      [(LACUIContainerViewController *)self->_containerVC setParentViewController:obj];
    }
    else
    {
      id obj = (id)[objc_alloc(MEMORY[0x263F52558]) initWithRootViewController:self->_containerVC];
      [obj setShouldTrackPreferredContentSize:0];
      [obj setModalInPresentation:1];
      [obj setModalPresentationStyle:2];
      id v10 = objc_loadWeakRetained((id *)&self->_parentVC);
      [v10 presentViewController:obj animated:v3 completion:&__block_literal_global_9];
    }
    objc_storeWeak((id *)&self->_rootVC, obj);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerVC, 0);
  objc_destroyWeak((id *)&self->_rootVC);

  objc_destroyWeak((id *)&self->_parentVC);
}

@end
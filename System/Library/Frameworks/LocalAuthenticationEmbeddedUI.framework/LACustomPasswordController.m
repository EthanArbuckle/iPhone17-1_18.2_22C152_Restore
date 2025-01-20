@interface LACustomPasswordController
- (LACustomPasswordController)initWithConfiguration:(id)a3;
- (LACustomPasswordControllerDelegate)delegate;
- (int64_t)modalPresentationStyle;
- (int64_t)modalTransitionStyle;
- (int64_t)preferredStatusBarStyle;
- (void)_finishWithError:(uint64_t)a1;
- (void)authorizationController:(id)a3 didProvideAuthorizationRequirementWithReply:(id)a4;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation LACustomPasswordController

- (LACustomPasswordController)initWithConfiguration:(id)a3
{
  v44[4] = *MEMORY[0x263EF8340];
  id v39 = a3;
  v43.receiver = self;
  v43.super_class = (Class)LACustomPasswordController;
  v4 = [(LACustomPasswordController *)&v43 initWithNibName:0 bundle:0];
  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    laContext = v4->_laContext;
    v4->_laContext = (LAContext *)v5;

    v38 = (void *)[objc_alloc(MEMORY[0x263F52520]) initWithCustomPasswordConfiguration:v39 context:v4->_laContext];
    v37 = [v38 validateConfiguration];
    if (v37)
    {
      v7 = (void *)MEMORY[0x263EFF940];
      v8 = [v37 debugDescription];
      [v7 raise:*MEMORY[0x263EFF4A0], @"%@", v8 format];
    }
    objc_initWeak(&location, v4);
    v9 = [LAAuthorizationViewController alloc];
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __52__LACustomPasswordController_initWithConfiguration___block_invoke;
    v40[3] = &unk_26506EB38;
    objc_copyWeak(&v41, &location);
    v10 = [(LAAuthorizationViewController *)v9 initWithConfiguration:v38 completion:v40];
    [(LAAuthorizationViewController *)v10 setDelegate:v4];
    v11 = [(LACustomPasswordController *)v4 view];
    v12 = [(LAAuthorizationViewController *)v10 view];
    [v11 addSubview:v12];

    [(LACustomPasswordController *)v4 addChildViewController:v10];
    [(LAAuthorizationViewController *)v10 didMoveToParentViewController:v4];
    v13 = [(LAAuthorizationViewController *)v10 view];
    [v13 setTranslatesAutoresizingMaskIntoConstraints:0];

    v23 = (void *)MEMORY[0x263F08938];
    v36 = [(LACustomPasswordController *)v4 view];
    v34 = [v36 leadingAnchor];
    v35 = [(LAAuthorizationViewController *)v10 view];
    v33 = [v35 leadingAnchor];
    v32 = [v34 constraintEqualToAnchor:v33];
    v44[0] = v32;
    v31 = [(LACustomPasswordController *)v4 view];
    v29 = [v31 trailingAnchor];
    v30 = [(LAAuthorizationViewController *)v10 view];
    v28 = [v30 trailingAnchor];
    v27 = [v29 constraintEqualToAnchor:v28];
    v44[1] = v27;
    v26 = [(LACustomPasswordController *)v4 view];
    v24 = [v26 topAnchor];
    v25 = [(LAAuthorizationViewController *)v10 view];
    v14 = [v25 topAnchor];
    v15 = [v24 constraintEqualToAnchor:v14];
    v44[2] = v15;
    v16 = [(LACustomPasswordController *)v4 view];
    v17 = [v16 bottomAnchor];
    v18 = [(LAAuthorizationViewController *)v10 view];
    v19 = [v18 bottomAnchor];
    v20 = [v17 constraintEqualToAnchor:v19];
    v44[3] = v20;
    v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:4];
    [v23 activateConstraints:v21];

    objc_storeWeak((id *)&v4->_authorizationController, v10);
    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);
  }
  return v4;
}

void __52__LACustomPasswordController_initWithConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained) {
    -[LACustomPasswordController _finishWithError:]((uint64_t)WeakRetained, v5);
  }
}

- (void)_finishWithError:(uint64_t)a1
{
  id v8 = a2;
  if (a1)
  {
    uint64_t v3 = *(void *)(a1 + 992);
    if (v3)
    {
      (*(void (**)(void))(v3 + 16))();
      v4 = *(void **)(a1 + 992);
      *(void *)(a1 + 992) = 0;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 1000));
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = objc_loadWeakRetained((id *)(a1 + 1000));
      [v7 customPasswordController:a1 didFinishWithError:v8];
    }
  }
}

- (int64_t)modalPresentationStyle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_authorizationController);
  int64_t v3 = [WeakRetained modalPresentationStyle];

  return v3;
}

- (int64_t)modalTransitionStyle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_authorizationController);
  int64_t v3 = [WeakRetained modalTransitionStyle];

  return v3;
}

- (int64_t)preferredStatusBarStyle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_authorizationController);
  int64_t v3 = [WeakRetained preferredStatusBarStyle];

  return v3;
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  id v5 = (void *)MEMORY[0x2455CBB70](a4, a2, a3);
  id completion = self->_completion;
  self->_id completion = v5;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_authorizationController);
  [WeakRetained dismiss];
}

- (void)authorizationController:(id)a3 didProvideAuthorizationRequirementWithReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  laContext = self->_laContext;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __98__LACustomPasswordController_authorizationController_didProvideAuthorizationRequirementWithReply___block_invoke;
  v10[3] = &unk_26506EB60;
  objc_copyWeak(&v12, &location);
  id v9 = v7;
  id v11 = v9;
  [(LAContext *)laContext credentialOfType:-9 reply:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __98__LACustomPasswordController_authorizationController_didProvideAuthorizationRequirementWithReply___block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = (void *)[[NSString alloc] initWithData:v12 encoding:4];
    if (v4
      && ([MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet],
          id v5 = objc_claimAutoreleasedReturnValue(),
          [v4 stringByTrimmingCharactersInSet:v5],
          id v6 = objc_claimAutoreleasedReturnValue(),
          uint64_t v7 = [v6 length],
          v6,
          v5,
          v7))
    {
      id v8 = objc_loadWeakRetained(WeakRetained + 125);
      [v8 customPasswordController:WeakRetained didReceiveCustomPassword:v4 processCustomPasswordWithCompletion:*(void *)(a1 + 32)];
    }
    else
    {
      id v9 = objc_loadWeakRetained(WeakRetained + 125);
      char v10 = objc_opt_respondsToSelector();

      if ((v10 & 1) == 0)
      {
LABEL_8:

        goto LABEL_9;
      }
      id v8 = [MEMORY[0x263F104E0] errorWithCode:-1019];
      id v11 = objc_loadWeakRetained(WeakRetained + 125);
      [v11 customPasswordController:WeakRetained didFinishWithError:v8];
    }
    goto LABEL_8;
  }
LABEL_9:
}

- (LACustomPasswordControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (LACustomPasswordControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_completion, 0);
  objc_destroyWeak((id *)&self->_authorizationController);

  objc_storeStrong((id *)&self->_laContext, 0);
}

@end
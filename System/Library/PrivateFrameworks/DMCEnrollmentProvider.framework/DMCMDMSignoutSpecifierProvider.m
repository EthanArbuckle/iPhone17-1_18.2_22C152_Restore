@interface DMCMDMSignoutSpecifierProvider
- (DMCEnrollmentInterface)enrollmentInterface;
- (UIViewController)viewController;
- (id)_specifierForSignoutButton;
- (id)_vc;
- (id)specifiers;
- (void)_specifierForMDMProfileWasTapped:(id)a3;
- (void)setEnrollmentInterface:(id)a3;
- (void)setViewController:(id)a3;
@end

@implementation DMCMDMSignoutSpecifierProvider

- (id)specifiers
{
  v11[2] = *MEMORY[0x263EF8340];
  v10.receiver = self;
  v10.super_class = (Class)DMCMDMSignoutSpecifierProvider;
  v3 = [(DMCSpecifierProvider *)&v10 specifiers];

  if (v3)
  {
    v9.receiver = self;
    v9.super_class = (Class)DMCMDMSignoutSpecifierProvider;
    v4 = [(DMCSpecifierProvider *)&v9 specifiers];
  }
  else
  {
    v5 = [MEMORY[0x263F5FC40] groupSpecifierWithID:*MEMORY[0x263F52ED8]];
    v11[0] = v5;
    v6 = [(DMCMDMSignoutSpecifierProvider *)self _specifierForSignoutButton];
    v11[1] = v6;
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
    v4 = [(DMCSpecifierProvider *)self cachedSpecifiers:v7];
  }
  return v4;
}

- (id)_specifierForSignoutButton
{
  v3 = (void *)MEMORY[0x263F5FC40];
  v4 = DMCLocalizedString();
  v5 = [v3 deleteButtonSpecifierWithName:v4 target:self action:sel__specifierForMDMProfileWasTapped_];

  [v5 setProperty:*MEMORY[0x263F52ED0] forKey:*MEMORY[0x263F60138]];
  return v5;
}

- (void)_specifierForMDMProfileWasTapped:(id)a3
{
  id v4 = a3;
  if (!self->_enrollmentInterface)
  {
    objc_initWeak(&location, self);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __67__DMCMDMSignoutSpecifierProvider__specifierForMDMProfileWasTapped___block_invoke;
    v20[3] = &unk_2645E9398;
    objc_copyWeak(&v21, &location);
    v5 = (void *)MEMORY[0x223C90320](v20);
    v6 = [DMCEnrollmentInterface alloc];
    v7 = [(DMCMDMSignoutSpecifierProvider *)self _vc];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __67__DMCMDMSignoutSpecifierProvider__specifierForMDMProfileWasTapped___block_invoke_4;
    v18[3] = &unk_2645E97A8;
    id v8 = v5;
    id v19 = v8;
    objc_super v9 = [(DMCEnrollmentInterface *)v6 initFromViewController:v7 enrollmentResultBlock:v18];
    enrollmentInterface = self->_enrollmentInterface;
    self->_enrollmentInterface = v9;

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  v11 = [(DMCSpecifierProvider *)self rmAccount];
  v12 = objc_msgSend(v11, "dmc_altDSID");

  if (![v12 length])
  {
    v13 = [(DMCSpecifierProvider *)self accountManager];
    v14 = [v13 accounts];
    v15 = [v14 allValues];
    v16 = [v15 firstObject];
    uint64_t v17 = objc_msgSend(v16, "dmc_altDSID");

    v12 = (void *)v17;
  }
  [(DMCEnrollmentInterface *)self->_enrollmentInterface startUnenrollmentWithAltDSID:v12 silent:0];
}

void __67__DMCMDMSignoutSpecifierProvider__specifierForMDMProfileWasTapped___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__DMCMDMSignoutSpecifierProvider__specifierForMDMProfileWasTapped___block_invoke_2;
  block[3] = &unk_2645E9398;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v2);
}

void __67__DMCMDMSignoutSpecifierProvider__specifierForMDMProfileWasTapped___block_invoke_2(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F1CB68];
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __67__DMCMDMSignoutSpecifierProvider__specifierForMDMProfileWasTapped___block_invoke_3;
  v2[3] = &unk_2645E9398;
  objc_copyWeak(&v3, (id *)(a1 + 32));
  [v1 _performWithoutDeferringTransitions:v2];
  objc_destroyWeak(&v3);
}

void __67__DMCMDMSignoutSpecifierProvider__specifierForMDMProfileWasTapped___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v11 = WeakRetained;
    id v2 = [WeakRetained _vc];
    id v3 = v2;
    if (v2)
    {
      id v4 = [v2 navigationController];
      v5 = [v4 popViewControllerAnimated:0];

      if (!v5)
      {
        [v3 popRecursivelyToRootController];
        v6 = [v3 navigationController];
        v7 = [v6 viewControllers];
        int v8 = [v7 containsObject:v3];

        if (v8)
        {
          objc_super v9 = [MEMORY[0x263F01880] defaultWorkspace];
          objc_super v10 = [NSURL URLWithString:*MEMORY[0x263F53E48]];
          [v9 openSensitiveURL:v10 withOptions:0];
        }
      }
    }

    id WeakRetained = v11;
  }
}

uint64_t __67__DMCMDMSignoutSpecifierProvider__specifierForMDMProfileWasTapped___block_invoke_4(uint64_t result, int a2, char a3)
{
  if (a2 && (a3 & 1) == 0)
  {
    result = *(void *)(result + 32);
    if (result) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }
  return result;
}

- (id)_vc
{
  id v3 = [(DMCMDMSignoutSpecifierProvider *)self viewController];

  if (v3)
  {
    id v4 = [(DMCMDMSignoutSpecifierProvider *)self viewController];
  }
  else
  {
    v5 = [(DMCSpecifierProvider *)self delegate];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v4 = [(DMCSpecifierProvider *)self delegate];
    }
    else
    {
      v7 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)objc_super v9 = 0;
        _os_log_impl(&dword_221CC5000, v7, OS_LOG_TYPE_ERROR, "DMCMDMSignoutSpecifierProvider does not have a view controller to pop", v9, 2u);
      }
      id v4 = 0;
    }
  }
  return v4;
}

- (UIViewController)viewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  return (UIViewController *)WeakRetained;
}

- (void)setViewController:(id)a3
{
}

- (DMCEnrollmentInterface)enrollmentInterface
{
  return self->_enrollmentInterface;
}

- (void)setEnrollmentInterface:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enrollmentInterface, 0);
  objc_destroyWeak((id *)&self->_viewController);
}

@end
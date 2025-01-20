@interface DBLockOutViewController
- (DBEnvironmentConfiguration)environmentConfiguration;
- (DBLockOutView)lockOutView;
- (DBLockOutViewController)initWithEnvironmentConfiguration:(id)a3;
- (DBLockOutViewControllerDelegate)delegate;
- (id)_newLockOutViewForMode:(int64_t)a3;
- (id)_wallpaperView;
- (id)preferredFocusEnvironments;
- (int64_t)lockOutMode;
- (void)lockOutView:(id)a3 didTapButtonOfType:(unint64_t)a4;
- (void)lockOutViewWantsToDismiss:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnvironmentConfiguration:(id)a3;
- (void)setLockOutMode:(int64_t)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setLockOutView:(id)a3;
@end

@implementation DBLockOutViewController

- (DBLockOutViewController)initWithEnvironmentConfiguration:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DBLockOutViewController;
  v6 = [(DBLockOutViewController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_environmentConfiguration, a3);
  }

  return v7;
}

- (void)setLockOutMode:(int64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  uint64_t v47 = *MEMORY[0x263EF8340];
  v8 = (void (**)(void))a5;
  objc_super v9 = v8;
  if (self->_lockOutMode == a3)
  {
    if (v8) {
      v8[2](v8);
    }
  }
  else
  {
    v10 = DBLogForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = DBDescriptionForLockOutMode(a3);
      *(_DWORD *)buf = 138412290;
      v46 = v11;
      _os_log_impl(&dword_22D6F0000, v10, OS_LOG_TYPE_INFO, "[DBLockOut] lockOutMode updating to %@", buf, 0xCu);
    }
    self->_lockOutMode = a3;
    v12 = [(DBLockOutViewController *)self lockOutView];

    if (v12)
    {
      v12 = [(DBLockOutViewController *)self lockOutView];
      [(DBLockOutViewController *)self setLockOutView:0];
    }
    id v13 = [(DBLockOutViewController *)self _newLockOutViewForMode:self->_lockOutMode];
    v14 = v13;
    if (v13)
    {
      [v13 setDelegate:self];
      [(DBLockOutViewController *)self view];
      v15 = v36 = v12;
      [v15 addSubview:v14];

      [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
      v34 = [v14 leadingAnchor];
      v35 = [(DBLockOutViewController *)self view];
      v33 = [v35 leadingAnchor];
      v32 = [v34 constraintEqualToAnchor:v33];
      v44[0] = v32;
      v30 = [v14 trailingAnchor];
      v31 = [(DBLockOutViewController *)self view];
      v29 = [v31 trailingAnchor];
      v28 = [v30 constraintEqualToAnchor:v29];
      v44[1] = v28;
      v26 = [v14 topAnchor];
      v27 = [(DBLockOutViewController *)self view];
      v16 = [v27 topAnchor];
      v17 = [v26 constraintEqualToAnchor:v16];
      v44[2] = v17;
      v18 = [v14 bottomAnchor];
      v19 = [(DBLockOutViewController *)self view];
      v20 = [v19 bottomAnchor];
      v21 = [v18 constraintEqualToAnchor:v20];
      v44[3] = v21;
      v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:4];

      v12 = v36;
      [MEMORY[0x263F08938] activateConstraints:v25];
      [(DBLockOutViewController *)self setLockOutView:v14];
    }
    if (v5)
    {
      if (v14) {
        double v22 = 0.25;
      }
      else {
        double v22 = 0.0;
      }
      if (v12) {
        double v23 = 0.25;
      }
      else {
        double v23 = 0.0;
      }
      [v14 setAlpha:0.0];
      v24 = (void *)MEMORY[0x263F82E00];
      v42[0] = MEMORY[0x263EF8330];
      v42[1] = 3221225472;
      v42[2] = __62__DBLockOutViewController_setLockOutMode_animated_completion___block_invoke;
      v42[3] = &unk_2649B3E90;
      id v43 = v12;
      v37[0] = MEMORY[0x263EF8330];
      v37[1] = 3221225472;
      v37[2] = __62__DBLockOutViewController_setLockOutMode_animated_completion___block_invoke_2;
      v37[3] = &unk_2649B5FA0;
      id v38 = v43;
      double v41 = v22;
      id v39 = v14;
      v40 = v9;
      [v24 animateWithDuration:v42 animations:v37 completion:v23];
    }
    else
    {
      [v12 removeFromSuperview];
      if (v9) {
        v9[2](v9);
      }
    }
  }
}

uint64_t __62__DBLockOutViewController_setLockOutMode_animated_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

void __62__DBLockOutViewController_setLockOutMode_animated_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  v2 = (void *)MEMORY[0x263F82E00];
  double v3 = *(double *)(a1 + 56);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __62__DBLockOutViewController_setLockOutMode_animated_completion___block_invoke_3;
  v6[3] = &unk_2649B3E90;
  id v7 = *(id *)(a1 + 40);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __62__DBLockOutViewController_setLockOutMode_animated_completion___block_invoke_4;
  v4[3] = &unk_2649B3F00;
  id v5 = *(id *)(a1 + 48);
  [v2 animateWithDuration:v6 animations:v4 completion:v3];
}

uint64_t __62__DBLockOutViewController_setLockOutMode_animated_completion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __62__DBLockOutViewController_setLockOutMode_animated_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)preferredFocusEnvironments
{
  v8[1] = *MEMORY[0x263EF8340];
  if ([(DBLockOutViewController *)self isViewLoaded]
    && ([(DBLockOutViewController *)self lockOutView], (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = (void *)v3;
    v8[0] = v3;
    id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)DBLockOutViewController;
    id v5 = [(DBLockOutViewController *)&v7 preferredFocusEnvironments];
  }
  return v5;
}

- (id)_newLockOutViewForMode:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) < 6)
  {
    id v5 = [DBAlertStyleLockOutView alloc];
    v6 = [(DBLockOutViewController *)self environmentConfiguration];
    objc_super v7 = v5;
    int64_t v8 = a3;
LABEL_3:
    objc_super v9 = (DBHelloLockOutView *)[v7 initWithMode:v8 environmentConfiguration:v6];
    goto LABEL_4;
  }
  if (a3 == 8)
  {
    id v13 = [DBUISyncLockOutView alloc];
    v6 = [(DBLockOutViewController *)self environmentConfiguration];
    objc_super v7 = v13;
    int64_t v8 = 8;
    goto LABEL_3;
  }
  if (a3 != 9) {
    return 0;
  }
  v11 = [DBHelloLockOutView alloc];
  v6 = [(DBLockOutViewController *)self environmentConfiguration];
  v12 = [(DBLockOutViewController *)self _wallpaperView];
  objc_super v9 = [(DBHelloLockOutView *)v11 initWithMode:9 environmentConfiguration:v6 wallpaperView:v12];

LABEL_4:
  return v9;
}

- (id)_wallpaperView
{
  uint64_t v3 = [(DBLockOutViewController *)self delegate];
  v4 = [v3 wallpaperViewForLockOutViewController:self];

  return v4;
}

- (void)lockOutView:(id)a3 didTapButtonOfType:(unint64_t)a4
{
  id v6 = [(DBLockOutViewController *)self delegate];
  [v6 lockOutViewController:self didTapButtonOfType:a4];
}

- (void)lockOutViewWantsToDismiss:(id)a3
{
  id v4 = [(DBLockOutViewController *)self delegate];
  [v4 lockOutViewControllerWantsToDismiss:self];
}

- (DBLockOutViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DBLockOutViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)lockOutMode
{
  return self->_lockOutMode;
}

- (DBEnvironmentConfiguration)environmentConfiguration
{
  return self->_environmentConfiguration;
}

- (void)setEnvironmentConfiguration:(id)a3
{
}

- (DBLockOutView)lockOutView
{
  return self->_lockOutView;
}

- (void)setLockOutView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockOutView, 0);
  objc_storeStrong((id *)&self->_environmentConfiguration, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
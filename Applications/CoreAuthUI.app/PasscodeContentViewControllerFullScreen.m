@interface PasscodeContentViewControllerFullScreen
- (BOOL)_canShowWhileLocked;
- (BOOL)becomeFirstResponder;
- (BOOL)resignFirstResponder;
- (NSString)passcode;
- (PasscodeContentViewControllerFullScreen)initWithPasscode:(id)a3 options:(id)a4;
- (PasscodeViewDelegate)delegate;
- (PasscodeViewState)state;
- (void)_embedSubview:(id)a3;
- (void)_setContentView:(id)a3 animated:(BOOL)a4 withCompletion:(id)a5;
- (void)_showBackOffView;
- (void)_showPasscodeView;
- (void)animateToFailureStateWithCompletion:(id)a3;
- (void)animateToSucessStateWithCompletion:(id)a3;
- (void)loadView;
- (void)passcodeBackOffViewCanceled:(id)a3;
- (void)passcodeLockViewCancelButtonPressed:(id)a3;
- (void)passcodeLockViewPasscodeDidChange:(id)a3;
- (void)passcodeLockViewPasscodeEntered:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setState:(id)a3;
@end

@implementation PasscodeContentViewControllerFullScreen

- (PasscodeContentViewControllerFullScreen)initWithPasscode:(id)a3 options:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PasscodeContentViewControllerFullScreen;
  v7 = [(PasscodeContentViewControllerFullScreen *)&v11 init];
  if (v7)
  {
    v8 = objc_alloc_init(PasscodeContentViewBackground);
    background = v7->_background;
    v7->_background = v8;

    objc_storeStrong((id *)&v7->_passcode, a3);
  }

  return v7;
}

- (void)loadView
{
  id v3 = objc_alloc_init((Class)UIView);
  [(PasscodeContentViewControllerFullScreen *)self setView:v3];

  id v5 = +[UIColor clearColor];
  v4 = [(PasscodeContentViewControllerFullScreen *)self view];
  [v4 setBackgroundColor:v5];
}

- (BOOL)becomeFirstResponder
{
  return [(SBUIPasscodeLockView *)self->_passcodeView becomeFirstResponder];
}

- (BOOL)resignFirstResponder
{
  v4.receiver = self;
  v4.super_class = (Class)PasscodeContentViewControllerFullScreen;
  [(PasscodeContentViewControllerFullScreen *)&v4 resignFirstResponder];
  return [(SBUIPasscodeLockView *)self->_passcodeView resignFirstResponder];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setState:(id)a3
{
  if (self->_state != a3)
  {
    objc_storeStrong((id *)&self->_state, a3);
    int64_t v5 = [(PasscodeViewState *)self->_state rawValue];
    if (v5 == 1)
    {
      [(PasscodeContentViewControllerFullScreen *)self _showBackOffView];
    }
    else if (!v5)
    {
      [(PasscodeContentViewControllerFullScreen *)self _showPasscodeView];
    }
  }

  _objc_release_x1();
}

- (NSString)passcode
{
  return (NSString *)[(SBUIPasscodeLockView *)self->_passcodeView passcode];
}

- (void)animateToSucessStateWithCompletion:(id)a3
{
  passcodeView = self->_passcodeView;
  if (passcodeView) {
    [(SBUIPasscodeLockView *)passcodeView autofillForSuccessfulMesaAttemptWithCompletion:a3];
  }
  else {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (void)animateToFailureStateWithCompletion:(id)a3
{
  passcodeView = self->_passcodeView;
  objc_super v4 = (void (**)(void))a3;
  [(SBUIPasscodeLockView *)passcodeView resetForFailedPasscode];
  v4[2]();
}

- (void)passcodeLockViewPasscodeDidChange:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained passcodeViewPasscodeDidChange:self];
}

- (void)passcodeLockViewPasscodeEntered:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained passcodeViewPasscodeEntered:self];
}

- (void)passcodeLockViewCancelButtonPressed:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained passcodeViewCancelButtonPressed:self];
}

- (void)passcodeBackOffViewCanceled:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained passcodeViewCancelButtonPressed:self];
}

- (void)_showPasscodeView
{
  id WeakRetained = (SBUIPasscodeLockView *)objc_loadWeakRetained((id *)&self->_contentView);
  passcodeView = self->_passcodeView;

  int64_t v5 = objc_alloc_init(PasscodeActiveViewFactory);
  passcode = self->_passcode;
  v7 = [(PasscodeViewState *)self->_state style];
  v8 = [(PasscodeActiveViewFactory *)v5 passcodeViewForPasscode:passcode style:v7];
  v9 = self->_passcodeView;
  self->_passcodeView = v8;

  [(SBUIPasscodeLockView *)self->_passcodeView setDelegate:self];
  [(PasscodeContentViewControllerFullScreen *)self _embedSubview:self->_passcodeView];
  v10 = self->_passcodeView;
  objc_super v11 = [(PasscodeViewState *)self->_state title];
  v12 = [(PasscodeViewState *)self->_state subtitle];
  [(SBUIPasscodeLockView *)v10 updateStatusText:v11 subtitle:v12 animated:0];

  v13 = [(PasscodeViewState *)self->_state accessoryView];

  if (v13)
  {
    v14 = [(PasscodeViewState *)self->_state accessoryView];
    [v14 removeFromSuperview];

    v15 = self->_passcodeView;
    v16 = [(PasscodeViewState *)self->_state accessoryView];
    [(SBUIPasscodeLockView *)v15 addSubview:v16];

    v17 = self->_passcodeView;
    v18 = [(PasscodeViewState *)self->_state accessoryView];
    [(SBUIPasscodeLockView *)v17 bringSubviewToFront:v18];
  }
  background = self->_background;
  v20 = [(PasscodeViewState *)self->_state style];
  [(PasscodeContentViewBackground *)background applyBackgroundForStyle:v20 toView:self->_passcodeView];

  v21 = self->_passcodeView;

  [(PasscodeContentViewControllerFullScreen *)self _setContentView:v21 animated:WeakRetained != passcodeView withCompletion:&stru_100085EF8];
}

- (void)_showBackOffView
{
  id WeakRetained = (PasscodeBackOffView *)objc_loadWeakRetained((id *)&self->_contentView);
  backOffView = self->_backOffView;

  int64_t v5 = self->_backOffView;
  if (v5) {
    id v6 = v5;
  }
  else {
    id v6 = objc_alloc_init(PasscodeBackOffView);
  }
  v7 = self->_backOffView;
  self->_backOffView = v6;

  BOOL v8 = WeakRetained != backOffView;
  [(PasscodeBackOffView *)self->_backOffView setDelegate:self];
  [(PasscodeContentViewControllerFullScreen *)self _embedSubview:self->_backOffView];
  v9 = [(PasscodeViewState *)self->_state style];
  -[PasscodeBackOffView setHasWhiteBackground:](self->_backOffView, "setHasWhiteBackground:", [v9 rawValue] == (id)1);

  v10 = [(PasscodeViewState *)self->_state title];
  [(PasscodeBackOffView *)self->_backOffView setTitle:v10];

  objc_super v11 = [(PasscodeViewState *)self->_state subtitle];
  [(PasscodeBackOffView *)self->_backOffView setSubtitle:v11];

  background = self->_background;
  v13 = [(PasscodeViewState *)self->_state style];
  [(PasscodeContentViewBackground *)background applyBackgroundForStyle:v13 toView:self->_backOffView];

  v14 = self->_backOffView;

  [(PasscodeContentViewControllerFullScreen *)self _setContentView:v14 animated:v8 withCompletion:&stru_100085F18];
}

- (void)_setContentView:(id)a3 animated:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  v9 = (void (**)(void))a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);

  if (WeakRetained == v8)
  {
    v9[2](v9);
  }
  else
  {
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x3032000000;
    v21 = sub_1000064FC;
    v22 = sub_10000650C;
    id v23 = objc_loadWeakRetained((id *)&self->_contentView);
    objc_storeWeak((id *)&self->_contentView, v8);
    [v8 setAlpha:0.0];
    [(PasscodeContentViewControllerFullScreen *)self _embedSubview:v8];
    double v11 = 0.0;
    if (v6)
    {
      if (v19[5]) {
        double v11 = 0.5;
      }
      else {
        double v11 = 0.01;
      }
    }
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100006514;
    v16[3] = &unk_100085F40;
    id v12 = v8;
    id v17 = v12;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100006520;
    v13[3] = &unk_100085F68;
    v15 = &v18;
    v14 = v9;
    +[UIView animateWithDuration:196608 delay:v16 options:v13 animations:v11 completion:0.0];
    [v12 becomeFirstResponder];

    _Block_object_dispose(&v18, 8);
  }
}

- (void)_embedSubview:(id)a3
{
  id v4 = a3;
  +[UIView setAnimationsEnabled:0];
  int64_t v5 = [(PasscodeContentViewControllerFullScreen *)self view];
  [v5 addSubview:v4];

  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  BOOL v6 = [v4 topAnchor];
  v7 = [(PasscodeContentViewControllerFullScreen *)self view];
  id v8 = [v7 topAnchor];
  v9 = [v6 constraintEqualToAnchor:v8];
  [v9 setActive:1];

  v10 = [v4 bottomAnchor];
  double v11 = [(PasscodeContentViewControllerFullScreen *)self view];
  id v12 = [v11 bottomAnchor];
  v13 = [v10 constraintEqualToAnchor:v12];
  [v13 setActive:1];

  v14 = [v4 leadingAnchor];
  v15 = [(PasscodeContentViewControllerFullScreen *)self view];
  v16 = [v15 leadingAnchor];
  id v17 = [v14 constraintEqualToAnchor:v16];
  [v17 setActive:1];

  uint64_t v18 = [v4 trailingAnchor];
  v19 = [(PasscodeContentViewControllerFullScreen *)self view];
  uint64_t v20 = [v19 trailingAnchor];
  v21 = [v18 constraintEqualToAnchor:v20];
  [v21 setActive:1];

  [v4 layoutIfNeeded];

  +[UIView setAnimationsEnabled:1];
}

- (PasscodeViewState)state
{
  return self->_state;
}

- (PasscodeViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PasscodeViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_contentView);
  objc_storeStrong((id *)&self->_backOffView, 0);
  objc_storeStrong((id *)&self->_passcodeView, 0);
  objc_storeStrong((id *)&self->_background, 0);
  objc_storeStrong((id *)&self->_passcode, 0);

  objc_storeStrong((id *)&self->_state, 0);
}

@end
@interface AKAuthorizationPasswordAuthenticationViewController
- (AKAuthorizationPasswordAuthenticationDelegate)delegate;
- (AKAuthorizationPresentationContext)presentationContext;
- (BOOL)isKeyboardAttachedToBottom:(id)a3;
- (double)intrinsicContentHeight;
- (id)_contextForAuthentication;
- (id)_username;
- (void)adjustBottomInsetForKeyboard:(id)a3;
- (void)dealloc;
- (void)keyboardDidShow:(id)a3;
- (void)keyboardWillChangeFrame:(id)a3;
- (void)keyboardWillHide:(id)a3;
- (void)keyboardWillShow:(id)a3;
- (void)layoutViewWithAnimation;
- (void)setDelegate:(id)a3;
- (void)setPresentationContext:(id)a3;
- (void)signInViewController:(id)a3 didAuthenticateWithResults:(id)a4 error:(id)a5;
- (void)sizeToFitPaneContentAnimated:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation AKAuthorizationPasswordAuthenticationViewController

- (void)viewDidLoad
{
  v58[4] = *MEMORY[0x1E4F143B8];
  v57.receiver = self;
  v57.super_class = (Class)AKAuthorizationPasswordAuthenticationViewController;
  [(AKAuthorizationPaneViewController *)&v57 viewDidLoad];
  v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v5 = @"APPLE_ID";
  char v6 = [@"APPLE_ID" containsString:@"REBRAND"];
  if (v6)
  {
    int v7 = 0;
  }
  else
  {
    v2 = [MEMORY[0x1E4F4F020] sharedManager];
    if ([v2 isAABrandingEnabled])
    {
      v5 = [@"APPLE_ID" stringByAppendingString:@"_REBRAND"];
      int v7 = 1;
    }
    else
    {
      int v7 = 0;
    }
  }
  v8 = [v4 localizedStringForKey:v5 value:&stru_1F1EE8138 table:@"Localizable"];
  [(AKAuthorizationPasswordAuthenticationViewController *)self setTitle:v8];

  if (v7) {
  if ((v6 & 1) == 0)
  }

  v9 = objc_alloc_init(AKModalSignInViewController);
  v10 = [MEMORY[0x1E4F428B8] clearColor];
  [(AKModalSignInViewController *)v9 setBackgroundColor:v10];

  [(AKModalSignInViewController *)v9 setHideTitle:1];
  v11 = NSString;
  v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v13 = @"AUTHORIZE_FOR_ACCOUNT_WITH_PASSWORD";
  char v14 = [@"AUTHORIZE_FOR_ACCOUNT_WITH_PASSWORD" containsString:@"REBRAND"];
  if (v14)
  {
    int v15 = 0;
  }
  else
  {
    v55 = [MEMORY[0x1E4F4F020] sharedManager];
    if ([v55 isAABrandingEnabled])
    {
      v13 = [@"AUTHORIZE_FOR_ACCOUNT_WITH_PASSWORD" stringByAppendingString:@"_REBRAND"];
      int v15 = 1;
    }
    else
    {
      int v15 = 0;
    }
  }
  v16 = [v12 localizedStringForKey:v13 value:&stru_1F1EE8138 table:@"Localizable"];
  v17 = [(AKAuthorizationPasswordAuthenticationViewController *)self _username];
  v18 = objc_msgSend(v11, "stringWithFormat:", v16, v17);
  [(AKModalSignInViewController *)v9 setCustomBodyText:v18];

  if (v15) {
  if ((v14 & 1) == 0)
  }

  v19 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v20 = [v19 localizedStringForKey:@"SIGN_IN" value:&stru_1F1EE8138 table:@"Localizable"];
  [(AKModalSignInViewController *)v9 setCustomButtonTitle:v20];

  v21 = [(AKAuthorizationPasswordAuthenticationViewController *)self _contextForAuthentication];
  [(AKBaseSignInViewController *)v9 setContext:v21];

  [(AKBaseSignInViewController *)v9 setDelegate:self];
  [(AKAuthorizationPasswordAuthenticationViewController *)self addChildViewController:v9];
  v22 = [(AKAuthorizationPasswordAuthenticationViewController *)self view];
  v23 = [(AKModalSignInViewController *)v9 view];
  [v22 addSubview:v23];

  [(AKModalSignInViewController *)v9 didMoveToParentViewController:self];
  modalSignInViewController = self->_modalSignInViewController;
  self->_modalSignInViewController = v9;
  v25 = v9;

  v26 = [(AKModalSignInViewController *)v25 view];
  v27 = [v26 bottomAnchor];
  v28 = [(AKAuthorizationPasswordAuthenticationViewController *)self view];
  v29 = [v28 bottomAnchor];
  v30 = [v27 constraintEqualToAnchor:v29];
  modalSignInViewBottomConstraint = self->_modalSignInViewBottomConstraint;
  self->_modalSignInViewBottomConstraint = v30;

  v32 = [(AKModalSignInViewController *)v25 view];
  [v32 setTranslatesAutoresizingMaskIntoConstraints:0];

  v48 = (void *)MEMORY[0x1E4F28DC8];
  v54 = [(AKModalSignInViewController *)v25 view];
  v52 = [v54 topAnchor];
  v53 = [(AKAuthorizationPasswordAuthenticationViewController *)self view];
  v51 = [v53 topAnchor];
  v50 = [v52 constraintEqualToAnchor:v51 constant:24.0];
  v33 = self->_modalSignInViewBottomConstraint;
  v58[0] = v50;
  v58[1] = v33;
  v56 = v25;
  v49 = [(AKModalSignInViewController *)v25 view];
  v47 = [v49 leadingAnchor];
  v34 = [(AKAuthorizationPasswordAuthenticationViewController *)self view];
  v35 = [v34 leadingAnchor];
  v36 = [v47 constraintEqualToAnchor:v35];
  v58[2] = v36;
  v37 = [(AKModalSignInViewController *)v25 view];
  v38 = [v37 trailingAnchor];
  v39 = [(AKAuthorizationPasswordAuthenticationViewController *)self view];
  v40 = [v39 trailingAnchor];
  v41 = [v38 constraintEqualToAnchor:v40];
  v58[3] = v41;
  v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:4];
  [v48 activateConstraints:v42];

  v43 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v43 addObserver:self selector:sel_keyboardDidShow_ name:*MEMORY[0x1E4F43AC8] object:0];

  v44 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v44 addObserver:self selector:sel_keyboardWillShow_ name:*MEMORY[0x1E4F43B88] object:0];

  v45 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v45 addObserver:self selector:sel_keyboardWillHide_ name:*MEMORY[0x1E4F43B80] object:0];

  v46 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v46 addObserver:self selector:sel_keyboardWillChangeFrame_ name:*MEMORY[0x1E4F43B70] object:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  if ([(AKAuthorizationPasswordAuthenticationViewController *)self isMovingFromParentViewController])
  {
    id v5 = [(AKAuthorizationPasswordAuthenticationViewController *)self delegate];
    if ([v5 conformsToProtocol:&unk_1F1F2F588])
    {
      v4 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7003);
      [v5 passwordAuthenticationCompletedWithResults:0 error:v4];
    }
  }
}

- (id)_contextForAuthentication
{
  v3 = objc_alloc_init(AKAppleIDAuthenticationInAppContext);
  v4 = [(AKAuthorizationPasswordAuthenticationViewController *)self _username];
  [(AKAppleIDAuthenticationInAppContext *)v3 setUsername:v4];

  [(AKAppleIDAuthenticationInAppContext *)v3 setIsUsernameEditable:0];
  [(AKAppleIDAuthenticationInAppContext *)v3 setIgnorePasswordCache:1];
  [(AKAppleIDAuthenticationInAppContext *)v3 setPresentingViewController:self];

  return v3;
}

- (id)_username
{
  v2 = [(AKAuthorizationPasswordAuthenticationViewController *)self presentationContext];
  v3 = [v2 userInformation];
  v4 = [v3 accountName];

  return v4;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F43AC8] object:0];

  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x1E4F43B88] object:0];

  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self name:*MEMORY[0x1E4F43B80] object:0];

  char v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 removeObserver:self name:*MEMORY[0x1E4F43B70] object:0];

  v7.receiver = self;
  v7.super_class = (Class)AKAuthorizationPasswordAuthenticationViewController;
  [(AKAuthorizationPasswordAuthenticationViewController *)&v7 dealloc];
}

- (double)intrinsicContentHeight
{
  v3 = [(AKModalSignInViewController *)self->_modalSignInViewController view];
  v4 = [v3 subviews];
  id v5 = [v4 firstObject];

  char v6 = [(AKAuthorizationPasswordAuthenticationViewController *)self view];
  [v6 bounds];
  double Width = CGRectGetWidth(v13);

  LODWORD(v8) = 1148846080;
  LODWORD(v9) = 1112014848;
  objc_msgSend(v5, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", Width, 0.0, v8, v9);
  double v11 = v10 + 0.0 + self->_keyboardHeight + 24.0;

  return v11;
}

- (void)sizeToFitPaneContentAnimated:(BOOL)a3
{
  double v3 = 0.3;
  if (!a3) {
    double v3 = 0.0;
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __84__AKAuthorizationPasswordAuthenticationViewController_sizeToFitPaneContentAnimated___block_invoke;
  v4[3] = &unk_1E648EF28;
  v4[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:4 delay:v4 options:0 animations:v3 completion:0.0];
}

uint64_t __84__AKAuthorizationPasswordAuthenticationViewController_sizeToFitPaneContentAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) sizeToFitPaneContent];
}

- (void)layoutViewWithAnimation
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __78__AKAuthorizationPasswordAuthenticationViewController_layoutViewWithAnimation__block_invoke;
  v2[3] = &unk_1E648EF28;
  v2[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:4 delay:v2 options:0 animations:0.3 completion:0.0];
}

void __78__AKAuthorizationPasswordAuthenticationViewController_layoutViewWithAnimation__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 layoutIfNeeded];
}

- (void)keyboardWillShow:(id)a3
{
  id v14 = a3;
  v4 = [MEMORY[0x1E4F42D90] mainScreen];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;

  BOOL v9 = [(AKAuthorizationPasswordAuthenticationViewController *)self isKeyboardAttachedToBottom:v14];
  double v10 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v11 = [v10 userInterfaceIdiom];

  if (v11 == 1 && v6 > v8 && v9)
  {
    [(AKAuthorizationPasswordAuthenticationViewController *)self adjustBottomInsetForKeyboard:v14];
    [(AKAuthorizationPasswordAuthenticationViewController *)self layoutViewWithAnimation];
  }
}

- (void)keyboardDidShow:(id)a3
{
  id v9 = [a3 userInfo];
  v4 = [v9 objectForKey:*MEMORY[0x1E4F43AF0]];
  [v4 CGRectValue];
  double v6 = v5;

  double v7 = [(AKAuthorizationPasswordAuthenticationViewController *)self view];
  [v7 safeAreaInsets];
  self->_keyboardHeight = v6 - v8;

  [(AKAuthorizationPasswordAuthenticationViewController *)self sizeToFitPaneContentAnimated:1];
}

- (void)keyboardWillHide:(id)a3
{
  self->_keyboardHeight = 0.0;
  v4 = objc_msgSend(MEMORY[0x1E4F42948], "currentDevice", a3);
  uint64_t v5 = [v4 userInterfaceIdiom];

  if (v5 == 1)
  {
    [(NSLayoutConstraint *)self->_modalSignInViewBottomConstraint setConstant:self->_keyboardHeight];
    [(AKAuthorizationPasswordAuthenticationViewController *)self layoutViewWithAnimation];
  }
  else
  {
    [(AKAuthorizationPasswordAuthenticationViewController *)self sizeToFitPaneContentAnimated:1];
  }
}

- (void)keyboardWillChangeFrame:(id)a3
{
  id v12 = a3;
  v4 = [MEMORY[0x1E4F42D90] mainScreen];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;

  id v9 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v10 = [v9 userInterfaceIdiom];

  if (v10 == 1)
  {
    if ([(AKAuthorizationPasswordAuthenticationViewController *)self isKeyboardAttachedToBottom:v12]&& v6 > v8)
    {
      [(AKAuthorizationPasswordAuthenticationViewController *)self adjustBottomInsetForKeyboard:v12];
    }
    else
    {
      self->_keyboardHeight = 0.0;
      [(NSLayoutConstraint *)self->_modalSignInViewBottomConstraint setConstant:0.0];
    }
    uint64_t v11 = [(AKAuthorizationPasswordAuthenticationViewController *)self layoutViewWithAnimation];
  }

  MEMORY[0x1F4181820](v11);
}

- (void)adjustBottomInsetForKeyboard:(id)a3
{
  id v9 = [a3 userInfo];
  v4 = [v9 objectForKey:*MEMORY[0x1E4F43AF0]];
  [v4 CGRectValue];
  double v6 = v5;

  double v7 = [(AKAuthorizationPasswordAuthenticationViewController *)self view];
  [v7 safeAreaInsets];
  self->_keyboardHeight = v6 - v8;

  [(NSLayoutConstraint *)self->_modalSignInViewBottomConstraint setConstant:-(self->_keyboardHeight * 0.5 + 36.0)];
}

- (BOOL)isKeyboardAttachedToBottom:(id)a3
{
  double v3 = (void *)MEMORY[0x1E4F42D90];
  id v4 = a3;
  double v5 = [v3 mainScreen];
  [v5 bounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  id v14 = [v4 userInfo];

  int v15 = [v14 objectForKey:*MEMORY[0x1E4F43AF0]];
  [v15 CGRectValue];
  CGFloat v17 = v16;
  CGFloat v30 = v18;
  CGFloat v31 = v16;
  CGFloat v20 = v19;
  CGFloat v22 = v21;

  v34.origin.x = v7;
  v34.origin.y = v9;
  v34.size.width = v11;
  v34.size.height = v13;
  double MaxX = CGRectGetMaxX(v34);
  v35.origin.x = v17;
  v35.origin.y = v30;
  v35.size.width = v20;
  v35.size.height = v22;
  BOOL v24 = MaxX == CGRectGetMaxX(v35);
  v36.origin.x = v7;
  v36.origin.y = v9;
  v36.size.width = v11;
  v36.size.height = v13;
  double MaxY = CGRectGetMaxY(v36);
  v37.origin.x = v31;
  v37.origin.y = v30;
  v37.size.width = v20;
  v37.size.height = v22;
  double v32 = CGRectGetMaxY(v37);
  v38.origin.x = v7;
  v38.origin.y = v9;
  v38.size.width = v11;
  v38.size.height = v13;
  double Width = CGRectGetWidth(v38);
  v39.origin.x = v31;
  v39.origin.y = v30;
  v39.size.width = v20;
  v39.size.height = v22;
  double v26 = CGRectGetWidth(v39);
  BOOL v27 = MaxY == v32 && v24;
  BOOL v28 = Width == v26 && v27;

  return v28;
}

- (void)signInViewController:(id)a3 didAuthenticateWithResults:(id)a4 error:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(AKAuthorizationPasswordAuthenticationViewController *)self delegate];
  [v9 passwordAuthenticationCompletedWithResults:v8 error:v7];
}

- (AKAuthorizationPasswordAuthenticationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AKAuthorizationPasswordAuthenticationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AKAuthorizationPresentationContext)presentationContext
{
  return self->_presentationContext;
}

- (void)setPresentationContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_modalSignInViewBottomConstraint, 0);

  objc_storeStrong((id *)&self->_modalSignInViewController, 0);
}

@end
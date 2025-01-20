@interface GKSignInViewController
- (AKAppleIDAuthenticationInAppContext)authContext;
- (AKInlineSignInViewController)inlineSignInViewController;
- (BOOL)authenticationController:(id)a3 shouldContinueWithAuthenticationResults:(id)a4 error:(id)a5 forContext:(id)a6;
- (BOOL)constraintsCreated;
- (BOOL)disablesSignIn;
- (BOOL)handleUnderlyingAuthenticationError:(id)a3 playerID:(id)a4;
- (BOOL)isLoadingRemoteUI;
- (BOOL)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5;
- (BOOL)userShouldSkipCreateAppleID;
- (GKAccountRemoteUIController)accountController;
- (GKDispatchGroup)u13Group;
- (GKGame)game;
- (GKSignInInputView)signInInputView;
- (GKSignInView)signInView;
- (GKSignInViewController)init;
- (NSMutableArray)fullWidthViewConstraints;
- (NSMutableArray)u13ObjectModels;
- (NSString)appleID;
- (RemoteUIController)remoteU13Controller;
- (UIActivityIndicatorView)progressIndicator;
- (UIEdgeInsets)contentInsetsBeforeKeyboard;
- (UIEdgeInsets)currentContentInsets;
- (UIEdgeInsets)scrollIndicatorInsetsBeforeKeyboard;
- (UIImageView)bubbleImageView;
- (UILabel)loginPromptLabel;
- (UILabel)signInLabel;
- (UINavigationController)u13NavigationController;
- (UIScrollView)scrollView;
- (UIViewController)remoteUIPresentingViewController;
- (double)fullWidthContentWidthConstraintConstant;
- (double)horizontalPaddingConstraintConstant;
- (double)labelWidthConstraintConstant;
- (id)completionHandler;
- (void)_systemContentSizeSettingDidChange:(id)a3;
- (void)accountRemoteUIController:(id)a3 finishedWithError:(id)a4;
- (void)addCancelButtonToNavigationItem:(id)a3;
- (void)authenticateRequestCompletedWithErrorResponse:(id)a3 error:(id)a4;
- (void)createAppleID;
- (void)createConstraints;
- (void)createSubviews;
- (void)dealloc;
- (void)finishAuthenticationWithError:(id)a3;
- (void)iForgotTapped;
- (void)keyboardWillHide:(id)a3;
- (void)keyboardWillShow:(id)a3;
- (void)loadAccountRemoteUIForPlayer:(id)a3 mode:(int64_t)a4 completionHandler:(id)a5;
- (void)loadAccountRemoteUIForPlayer:(id)a3 mode:(int64_t)a4 url:(id)a5 postBody:(id)a6 completionHandler:(id)a7;
- (void)loadView;
- (void)presentAccountRemoteUIControllerAnimated:(BOOL)a3;
- (void)presentError:(id)a3 forAccountRemoteUIController:(id)a4;
- (void)remoteUIController:(id)a3 didReceiveHTTPResponse:(id)a4;
- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5;
- (void)remoteUIControllerDidDismiss:(id)a3;
- (void)setAccountController:(id)a3;
- (void)setAppleID:(id)a3;
- (void)setAuthContext:(id)a3;
- (void)setBubbleImageView:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setConstraintsCreated:(BOOL)a3;
- (void)setContentInsetsBeforeKeyboard:(UIEdgeInsets)a3;
- (void)setCurrentContentInsets:(UIEdgeInsets)a3;
- (void)setDisablesSignIn:(BOOL)a3;
- (void)setFullWidthContentWidthConstraintConstant:(double)a3;
- (void)setFullWidthViewConstraints:(id)a3;
- (void)setGame:(id)a3;
- (void)setHorizontalPaddingConstraintConstant:(double)a3;
- (void)setInlineSignInViewController:(id)a3;
- (void)setLabelWidthConstraintConstant:(double)a3;
- (void)setLoadingRemoteUI:(BOOL)a3;
- (void)setLoginPromptLabel:(id)a3;
- (void)setProgressIndicator:(id)a3;
- (void)setRemoteU13Controller:(id)a3;
- (void)setRemoteUIPresentingViewController:(id)a3;
- (void)setScrollIndicatorInsetsBeforeKeyboard:(UIEdgeInsets)a3;
- (void)setScrollView:(id)a3;
- (void)setSignInInputView:(id)a3;
- (void)setSignInLabel:(id)a3;
- (void)setSignInView:(id)a3;
- (void)setU13Group:(id)a3;
- (void)setU13NavigationController:(id)a3;
- (void)setU13ObjectModels:(id)a3;
- (void)setUserShouldSkipCreateAppleID:(BOOL)a3;
- (void)setupAuthKitInlineViewController;
- (void)showAAUISignInController;
- (void)showAccountDisabledAlert;
- (void)showAccountRemoteUIForAccountName:(id)a3 mode:(int64_t)a4;
- (void)showAccountRemoteUIForAccountName:(id)a3 mode:(int64_t)a4 url:(id)a5 postBody:(id)a6;
- (void)showAccountRemoteUIForLocalPlayer:(id)a3 mode:(int64_t)a4 url:(id)a5 postBody:(id)a6;
- (void)showAccountRemoteUIForPlayerID:(id)a3 mode:(int64_t)a4;
- (void)showAuthKitAlertFromGreenBuddyWithAuthInfo:(id)a3 completion:(id)a4;
- (void)showConnectionFailedAlert;
- (void)showForgotPasswordAlert;
- (void)showLoginFailedAlert;
- (void)showPasswordAlertWithTitle:(id)a3 message:(id)a4;
- (void)showPasswordChangeAlertWithURL:(id)a3;
- (void)showPasswordResetAlertWithTitle:(id)a3 message:(id)a4;
- (void)showViewController:(id)a3;
- (void)signIn;
- (void)signInController:(id)a3 didCompleteWithOperationsResults:(id)a4;
- (void)signInControllerDidCancel:(id)a3;
- (void)signInViewController:(id)a3 didAuthenticateWithResults:(id)a4 error:(id)a5;
- (void)startLoadingIndicator;
- (void)stopLoadingIndicator;
- (void)updateConstraintConstantsForTraitCollection:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation GKSignInViewController

- (GKSignInViewController)init
{
  v7.receiver = self;
  v7.super_class = (Class)GKSignInViewController;
  v2 = [(GKSignInViewController *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F636F0] currentGame];
    game = v2->_game;
    v2->_game = (GKGame *)v3;

    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v2 selector:sel__systemContentSizeSettingDidChange_ name:*MEMORY[0x1E4FB27A8] object:0];
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)GKSignInViewController;
  [(GKSignInViewController *)&v4 dealloc];
}

- (void)viewWillAppear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)GKSignInViewController;
  [(GKViewController *)&v11 viewWillAppear:a3];
  -[UIScrollView setContentInset:](self->_scrollView, "setContentInset:", self->_currentContentInsets.top, self->_currentContentInsets.left, self->_currentContentInsets.bottom, self->_currentContentInsets.right);
  objc_super v4 = [(GKSignInViewController *)self signInInputView];
  [v4 bounds];
  -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v5, v6);

  objc_super v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 addObserver:self selector:sel_keyboardWillShow_ name:*MEMORY[0x1E4FB2C58] object:0];

  v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 addObserver:self selector:sel_keyboardWillHide_ name:*MEMORY[0x1E4FB2C50] object:0];

  v9 = [(GKSignInViewController *)self navigationController];
  [v9 setNavigationBarHidden:0];

  v10 = [(GKSignInViewController *)self navigationItem];
  [(GKSignInViewController *)self addCancelButtonToNavigationItem:v10];
}

- (void)addCancelButtonToNavigationItem:(id)a3
{
  objc_super v4 = (objc_class *)MEMORY[0x1E4FB14A8];
  id v5 = a3;
  id v6 = (id)[[v4 alloc] initWithBarButtonSystemItem:1 target:self action:sel_cancelSignIn];
  [v6 setAccessibilityIdentifier:@"UIA.GameCenter.SignIn.cancelButton"];
  [v5 setLeftBarButtonItem:v6];
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)GKSignInViewController;
  [(GKSignInViewController *)&v5 viewWillLayoutSubviews];
  -[UIScrollView setContentInset:](self->_scrollView, "setContentInset:", self->_currentContentInsets.top, self->_currentContentInsets.left, self->_currentContentInsets.bottom, self->_currentContentInsets.right);
  [(GKSignInInputView *)self->_signInInputView bounds];
  -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v3, v4);
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)GKSignInViewController;
  [(GKViewController *)&v3 viewDidAppear:a3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GKSignInViewController;
  [(GKSignInViewController *)&v6 viewDidDisappear:a3];
  double v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x1E4FB2C58] object:0];

  objc_super v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self name:*MEMORY[0x1E4FB2C50] object:0];
}

- (void)loadView
{
  v24.receiver = self;
  v24.super_class = (Class)GKSignInViewController;
  [(GKViewController *)&v24 loadView];
  objc_super v3 = [MEMORY[0x1E4F637E8] shared];
  int v4 = [v3 easySignInSheetEnabled];

  if (v4)
  {
    objc_initWeak(&location, self);
    objc_super v5 = [GKSignInView alloc];
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    v20 = __34__GKSignInViewController_loadView__block_invoke;
    v21 = &unk_1E5F634E8;
    objc_copyWeak(&v22, &location);
    objc_super v6 = [(GKSignInView *)v5 initWithSignInAction:&v18];
    signInView = self->_signInView;
    self->_signInView = v6;

    -[GKSignInView setTranslatesAutoresizingMaskIntoConstraints:](self->_signInView, "setTranslatesAutoresizingMaskIntoConstraints:", 0, v18, v19, v20, v21);
    v8 = [(GKSignInViewController *)self view];
    [v8 addSubview:self->_signInView];

    v9 = (void *)MEMORY[0x1E4F28DC8];
    v10 = self->_signInView;
    objc_super v11 = [(GKSignInViewController *)self view];
    [v9 _gkInstallEdgeConstraintsForView:v10 containedWithinParentView:v11];

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  else
  {
    [(GKSignInViewController *)self createSubviews];
    [(GKSignInViewController *)self setupAuthKitInlineViewController];
    [(GKSignInViewController *)self createConstraints];
  }
  v12 = [(GKSignInViewController *)self scrollView];
  [v12 setContentInsetAdjustmentBehavior:0];

  v13 = [(GKSignInViewController *)self navigationController];
  [v13 setNavigationBarHidden:0];

  v14 = [(GKSignInViewController *)self navigationController];
  [v14 makeNavigationBarBackgroundTranslucent];

  v15 = objc_opt_new();
  v16 = [(GKSignInViewController *)self navigationController];
  v17 = [v16 navigationBar];
  [v17 setShadowImage:v15];

  self->_constraintsCreated = 0;
}

void __34__GKSignInViewController_loadView__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained showAAUISignInController];
}

- (void)setupAuthKitInlineViewController
{
  objc_super v3 = (AKInlineSignInViewController *)objc_alloc_init(MEMORY[0x1E4F4F108]);
  inlineSignInViewController = self->_inlineSignInViewController;
  self->_inlineSignInViewController = v3;

  [(AKInlineSignInViewController *)self->_inlineSignInViewController setWantsAuthenticationProgress:1];
  objc_super v5 = [(AKInlineSignInViewController *)self->_inlineSignInViewController authenticationController];
  [v5 setDelegate:self];

  objc_super v6 = [(AKInlineSignInViewController *)self->_inlineSignInViewController view];
  [v6 setAccessibilityIdentifier:@"UIA.GameCenter.SignIn.form"];

  objc_super v7 = (AKAppleIDAuthenticationInAppContext *)objc_alloc_init(MEMORY[0x1E4F4F100]);
  authContext = self->_authContext;
  self->_authContext = v7;

  [(AKAppleIDAuthenticationInAppContext *)self->_authContext setServiceType:6];
  [(AKAppleIDAuthenticationInAppContext *)self->_authContext setPresentingViewController:self];
  [(AKInlineSignInViewController *)self->_inlineSignInViewController setDelegate:self];
  v9 = [(GKSignInViewController *)self authContext];
  [(AKInlineSignInViewController *)self->_inlineSignInViewController setContext:v9];

  [(AKInlineSignInViewController *)self->_inlineSignInViewController setWantsAuthenticationProgress:1];
  [(AKInlineSignInViewController *)self->_inlineSignInViewController setSecondaryButtonTarget:self action:sel_iForgotTapped];
  [(AKInlineSignInViewController *)self->_inlineSignInViewController setTertiaryButtonTarget:self action:sel_createAppleID];
  [(GKSignInViewController *)self addChildViewController:self->_inlineSignInViewController];
  v10 = [(GKSignInViewController *)self signInInputView];
  objc_super v11 = [(AKInlineSignInViewController *)self->_inlineSignInViewController view];
  [v10 addSubview:v11];

  [(AKInlineSignInViewController *)self->_inlineSignInViewController didMoveToParentViewController:self];
  id v16 = [(AKInlineSignInViewController *)self->_inlineSignInViewController view];
  v12 = [v16 bottomAnchor];
  v13 = [(GKSignInViewController *)self signInInputView];
  v14 = [v13 bottomAnchor];
  v15 = [v12 constraintEqualToAnchor:v14];
  [v15 setActive:1];
}

- (void)signInController:(id)a3 didCompleteWithOperationsResults:(id)a4
{
  objc_super v5 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F4D8F8]];
  objc_super v6 = [v5 error];
  if (v6)
  {
  }
  else if ([v5 success])
  {
    objc_super v7 = [MEMORY[0x1E4F636C8] proxyForLocalPlayer];
    v8 = [v7 accountServicePrivate];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __76__GKSignInViewController_signInController_didCompleteWithOperationsResults___block_invoke;
    v13[3] = &unk_1E5F65008;
    v13[4] = self;
    [v8 authenticatePlayerWithUsername:0 password:0 altDSID:0 usingFastPath:1 handler:v13];

    goto LABEL_11;
  }
  v9 = [v5 error];

  if (v9)
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v10 = (id)GKOSLoggers();
    }
    objc_super v11 = (void *)*MEMORY[0x1E4F63850];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63850], OS_LOG_TYPE_ERROR)) {
      -[GKSignInViewController signInController:didCompleteWithOperationsResults:](v11, v5);
    }
  }
  [(GKSignInViewController *)self dismissViewControllerAnimated:1 completion:0];
LABEL_11:
  v12 = [(GKSignInViewController *)self signInView];
  [v12 enablePrimaryButton];
}

uint64_t __76__GKSignInViewController_signInController_didCompleteWithOperationsResults___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) authenticateRequestCompletedWithErrorResponse:a2 error:a3];
}

- (void)signInControllerDidCancel:(id)a3
{
  [(GKSignInViewController *)self dismissViewControllerAnimated:1 completion:0];
  id v4 = [(GKSignInViewController *)self signInView];
  [v4 enablePrimaryButton];
}

- (void)signInViewController:(id)a3 didAuthenticateWithResults:(id)a4 error:(id)a5
{
  id v8 = a3;
  if (a4 && !a5)
  {
    uint64_t v9 = *MEMORY[0x1E4F4EE10];
    id v10 = a4;
    objc_super v11 = [v10 objectForKeyedSubscript:v9];
    v12 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F4EDE8]];
    v13 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F4ED98]];

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80__GKSignInViewController_signInViewController_didAuthenticateWithResults_error___block_invoke;
    block[3] = &unk_1E5F63350;
    block[4] = self;
    id v14 = v8;
    id v20 = v14;
    dispatch_async(MEMORY[0x1E4F14428], block);
    v15 = [MEMORY[0x1E4F636C8] proxyForLocalPlayer];
    id v16 = [v15 accountServicePrivate];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __80__GKSignInViewController_signInViewController_didAuthenticateWithResults_error___block_invoke_2;
    v17[3] = &unk_1E5F65030;
    v17[4] = self;
    id v18 = v14;
    [v16 authenticatePlayerWithUsername:v11 password:v12 altDSID:v13 usingFastPath:1 handler:v17];
  }
}

void __80__GKSignInViewController_signInViewController_didAuthenticateWithResults_error___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) startLoadingIndicator];
  id v2 = [*(id *)(a1 + 40) view];
  [v2 setHidden:1];
}

void __80__GKSignInViewController_signInViewController_didAuthenticateWithResults_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) stopLoadingIndicator];
  if (v5)
  {
    objc_super v6 = [*(id *)(a1 + 40) view];
    [v6 setHidden:0];
  }
  [*(id *)(a1 + 32) authenticateRequestCompletedWithErrorResponse:v7 error:v5];
}

- (BOOL)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5
{
  id v5 = (objc_class *)MEMORY[0x1E4F4BFA0];
  id v6 = a4;
  id v7 = objc_alloc_init(v5);
  id v8 = [v7 clientInfoHeader];
  [v6 setValue:v8 forHTTPHeaderField:@"X-MMe-Client-Info"];

  uint64_t v9 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v10 = [v9 objectForKey:*MEMORY[0x1E4F1C400]];
  objc_super v11 = [v10 uppercaseString];
  [v6 setValue:v11 forHTTPHeaderField:@"X-MMe-Country"];

  return 1;
}

- (void)remoteUIController:(id)a3 didReceiveHTTPResponse:(id)a4
{
  id v5 = objc_msgSend(a4, "URL", a3);
  id v6 = [v5 absoluteString];
  int v7 = [v6 containsString:@"skipCreateAppleID"];

  if (v7) {
    self->_userShouldSkipCreateAppleID = 1;
  }
}

- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (a5
    && *a5 == 2
    && ([v9 defaultPages],
        objc_super v11 = objc_claimAutoreleasedReturnValue(),
        uint64_t v12 = [v11 count],
        v11,
        !v12))
  {
    id v18 = (NSObject **)MEMORY[0x1E4F63860];
    uint64_t v19 = *MEMORY[0x1E4F63860];
    if (!*MEMORY[0x1E4F63860])
    {
      id v20 = (id)GKOSLoggers();
      uint64_t v19 = *v18;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_1AF250000, v19, OS_LOG_TYPE_INFO, "Warning: AppleIDController received an object model with actionSignal=Push but no pages.", v21, 2u);
    }
  }
  else
  {
    u13ObjectModels = self->_u13ObjectModels;
    if (!u13ObjectModels)
    {
      id v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v15 = self->_u13ObjectModels;
      self->_u13ObjectModels = v14;

      u13ObjectModels = self->_u13ObjectModels;
    }
    [(NSMutableArray *)u13ObjectModels addObject:v10];
    id v16 = [v10 clientInfo];
    v17 = [v16 objectForKeyedSubscript:@"continue"];

    if (v17 && ([v17 BOOLValue] & 1) == 0) {
      self->_userShouldSkipCreateAppleID = 1;
    }
  }
}

- (void)remoteUIControllerDidDismiss:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 navigationController];
  id v6 = (id)[v5 popViewControllerAnimated:1];

  if (self->_userShouldSkipCreateAppleID)
  {
    [(GKDispatchGroup *)self->_u13Group leave];
  }
  else
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v8 = self->_u13ObjectModels;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v25;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v25 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v24 + 1) + 8 * v12++) populatePostbackDictionary:v7];
        }
        while (v10 != v12);
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v10);
    }

    v13 = [MEMORY[0x1E4F1CA20] currentLocale];
    id v14 = [v13 objectForKey:*MEMORY[0x1E4F1C400]];

    if (![v14 length]) {
      -[GKSignInViewController remoteUIControllerDidDismiss:]();
    }
    v15 = [MEMORY[0x1E4F28B50] _gkPreferredSystemLanguage];
    if (![v15 length]) {
      -[GKSignInViewController remoteUIControllerDidDismiss:]();
    }
    if ([v15 rangeOfString:@"-"] == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v16 = NSString;
      v17 = [v14 lowercaseString];
      uint64_t v18 = [v16 stringWithFormat:@"%@-%@", v15, v17];

      v15 = (void *)v18;
    }
    uint64_t v19 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
    id v20 = [v19 name];

    if ([v20 length]) {
      [v7 setObject:v20 forKey:*MEMORY[0x1E4F4BF78]];
    }
    [v7 setObject:v15 forKey:*MEMORY[0x1E4F4BF70]];
    v21 = [v14 uppercaseString];
    [v7 setObject:v21 forKey:*MEMORY[0x1E4F4BF68]];

    id v22 = objc_alloc_init(MEMORY[0x1E4F4BFF8]);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __55__GKSignInViewController_remoteUIControllerDidDismiss___block_invoke;
    v23[3] = &unk_1E5F65058;
    v23[4] = self;
    [v22 createAppleIDWithParameters:v7 handlerWithResponse:v23];
  }
}

void __55__GKSignInViewController_remoteUIControllerDidDismiss___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = [v6 responseDictionary];
  uint64_t v14 = [v7 objectForKeyedSubscript:@"title"];

  id v8 = [v6 responseDictionary];

  uint64_t v9 = [v8 objectForKeyedSubscript:@"status-message"];

  if (v14 | v9)
  {
    uint64_t v10 = *(void **)(a1 + 32);
    uint64_t v11 = GKGameCenterUIFrameworkBundle();
    uint64_t v12 = GKGetLocalizedStringFromTableInBundle();
    id v13 = (id)[v10 _gkPresentAlertWithTitle:v14 message:v9 buttonTitle:v12];
  }
  [*(id *)(*(void *)(a1 + 32) + 1152) leave];
}

- (BOOL)authenticationController:(id)a3 shouldContinueWithAuthenticationResults:(id)a4 error:(id)a5 forContext:(id)a6
{
  id v9 = a6;
  uint64_t v10 = *MEMORY[0x1E4F4EDE0];
  id v11 = a5;
  uint64_t v12 = [a4 objectForKey:v10];
  uint64_t v13 = [v11 code];

  if (v13 == -7006)
  {
    [(GKSignInViewController *)self showLoginFailedAlert];
  }
  else if (v12)
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F636D8];
    v15 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKSignInViewController.m", 586, "-[GKSignInViewController authenticationController:shouldContinueWithAuthenticationResults:error:forContext:]");
    id v16 = [v14 dispatchGroupWithName:v15];
    [(GKSignInViewController *)self setU13Group:v16];

    u13Group = self->_u13Group;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __108__GKSignInViewController_authenticationController_shouldContinueWithAuthenticationResults_error_forContext___block_invoke;
    v19[3] = &unk_1E5F63008;
    id v20 = v12;
    id v21 = v9;
    id v22 = self;
    [(GKDispatchGroup *)u13Group perform:v19];
    [(GKDispatchGroup *)self->_u13Group enter];
    [(GKDispatchGroup *)self->_u13Group wait];
  }
  return 1;
}

void __108__GKSignInViewController_authenticationController_shouldContinueWithAuthenticationResults_error_forContext___block_invoke(uint64_t a1, void *a2)
{
  id v31 = a2;
  id v3 = objc_alloc_init(MEMORY[0x1E4F4BFA0]);
  id v4 = (void *)MEMORY[0x1E4F1CB10];
  id v5 = [MEMORY[0x1E4F4C008] urlConfiguration];
  id v6 = [v5 repairCloudAccountUIURL];
  uint64_t v7 = [v4 URLWithString:v6];

  v32 = (void *)v7;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F28E88]) initWithURL:v7 cachePolicy:1 timeoutInterval:30.0];
  [v8 setHTTPMethod:@"POST"];
  [v8 setValue:@"application/x-plist" forHTTPHeaderField:@"Content-Type"];
  [v8 setValue:*(void *)(a1 + 32) forHTTPHeaderField:@"X-Apple-AK-Continuation-Data"];
  v33 = v3;
  id v9 = [v3 clientInfoHeader];
  [v8 setValue:v9 forHTTPHeaderField:@"X-MMe-Client-Info"];

  uint64_t v10 = [*(id *)(a1 + 40) altDSID];
  uint64_t v29 = [*(id *)(a1 + 40) _password];
  v30 = (void *)v10;
  v28 = [NSString stringWithFormat:@"%@:%@", v10, v29];
  id v11 = [v28 dataUsingEncoding:4];
  uint64_t v12 = [v11 base64EncodedStringWithOptions:0];

  uint64_t v13 = [NSString stringWithFormat:@"Basic %@", v12];
  [v8 addValue:v13 forHTTPHeaderField:@"Authorization"];
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F4EF78]) initWithIdentifier:@"com.apple.GameCenter.u13"];
  v15 = [MEMORY[0x1E4F290F0] defaultSessionConfiguration];
  objc_msgSend(v15, "set_appleIDContext:", v14);
  id v16 = objc_alloc_init(MEMORY[0x1E4F95F70]);
  uint64_t v17 = *(void *)(a1 + 48);
  uint64_t v18 = *(void **)(v17 + 1128);
  *(void *)(v17 + 1128) = v16;

  objc_msgSend(*(id *)(*(void *)(a1 + 48) + 1128), "setDelegate:");
  [*(id *)(*(void *)(a1 + 48) + 1128) setSessionConfiguration:v15];
  id v19 = objc_alloc_init(MEMORY[0x1E4FB19E8]);
  uint64_t v20 = *(void *)(a1 + 48);
  id v21 = *(void **)(v20 + 1136);
  *(void *)(v20 + 1136) = v19;

  id v22 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v23 = [v22 userInterfaceIdiom];

  if (v23 == 1)
  {
    [*(id *)(*(void *)(a1 + 48) + 1136) setModalPresentationStyle:16];
    long long v24 = [*(id *)(*(void *)(a1 + 48) + 1136) view];
    long long v25 = [v24 layer];
    [v25 setMasksToBounds:1];
  }
  [*(id *)(a1 + 48) presentViewController:*(void *)(*(void *)(a1 + 48) + 1136) animated:1 completion:0];
  objc_msgSend(*(id *)(*(void *)(a1 + 48) + 1128), "setDelegate:");
  [*(id *)(*(void *)(a1 + 48) + 1128) setNavigationController:*(void *)(*(void *)(a1 + 48) + 1136)];
  long long v26 = *(void **)(*(void *)(a1 + 48) + 1128);
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __108__GKSignInViewController_authenticationController_shouldContinueWithAuthenticationResults_error_forContext___block_invoke_2;
  v34[3] = &unk_1E5F65080;
  id v35 = v31;
  id v27 = v31;
  [v26 loadRequest:v8 completion:v34];
}

uint64_t __108__GKSignInViewController_authenticationController_shouldContinueWithAuthenticationResults_error_forContext___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)createSubviews
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1BE0]);
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  id v8 = (UIScrollView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], v5, v6, v7);
  scrollView = self->_scrollView;
  self->_scrollView = v8;

  [(UIScrollView *)self->_scrollView setAlwaysBounceVertical:1];
  [(UIScrollView *)self->_scrollView setDelegate:self];
  [(UIScrollView *)self->_scrollView setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v10 = [(GKViewController *)self colorPalette];
  id v11 = [v10 viewBackgroundColor];
  [(UIScrollView *)self->_scrollView setBackgroundColor:v11];

  [(UIScrollView *)self->_scrollView setOpaque:1];
  [(UIScrollView *)self->_scrollView contentInset];
  self->_contentInsetsBeforeKeyboard.top = v12;
  self->_contentInsetsBeforeKeyboard.left = v13;
  self->_contentInsetsBeforeKeyboard.bottom = v14;
  self->_contentInsetsBeforeKeyboard.right = v15;
  long long v16 = *(_OWORD *)&self->_contentInsetsBeforeKeyboard.bottom;
  *(_OWORD *)&self->_currentContentInsets.top = *(_OWORD *)&self->_contentInsetsBeforeKeyboard.top;
  *(_OWORD *)&self->_currentContentInsets.bottom = v16;
  [(UIScrollView *)self->_scrollView verticalScrollIndicatorInsets];
  self->_scrollIndicatorInsetsBeforeKeyboard.top = v17;
  self->_scrollIndicatorInsetsBeforeKeyboard.left = v18;
  self->_scrollIndicatorInsetsBeforeKeyboard.bottom = v19;
  self->_scrollIndicatorInsetsBeforeKeyboard.right = v20;
  id v21 = -[GKSignInInputView initWithFrame:]([GKSignInInputView alloc], "initWithFrame:", v4, v5, v6, v7);
  signInInputView = self->_signInInputView;
  self->_signInInputView = v21;

  [(GKSignInInputView *)self->_signInInputView setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v23 = [MEMORY[0x1E4FB1618] clearColor];
  [(GKSignInInputView *)self->_signInInputView setBackgroundColor:v23];

  long long v24 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  loginPromptLabel = self->_loginPromptLabel;
  self->_loginPromptLabel = v24;

  [(UILabel *)self->_loginPromptLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v26) = 1148846080;
  [(UILabel *)self->_loginPromptLabel setContentCompressionResistancePriority:1 forAxis:v26];
  id v27 = [MEMORY[0x1E4FB1618] clearColor];
  [(UILabel *)self->_loginPromptLabel setBackgroundColor:v27];

  [(UILabel *)self->_loginPromptLabel setLineBreakMode:0];
  [(UILabel *)self->_loginPromptLabel setNumberOfLines:0];
  [(UILabel *)self->_loginPromptLabel setTextAlignment:1];
  v28 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [(UILabel *)self->_loginPromptLabel setFont:v28];

  uint64_t v29 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [(UILabel *)self->_loginPromptLabel setTextColor:v29];

  v30 = objc_msgSend(MEMORY[0x1E4F63998], "SIGN_IN_PROMPT_MESSAGE_TEXT");
  [(UILabel *)self->_loginPromptLabel setText:v30];

  [(UILabel *)self->_loginPromptLabel setAccessibilityIdentifier:@"UIA.GameCenter.SignIn.prompt"];
  id v31 = objc_alloc(MEMORY[0x1E4FB1838]);
  v32 = (void *)MEMORY[0x1E4FB1818];
  v33 = GKGameCenterUIFrameworkBundle();
  v34 = [v32 imageNamed:@"GKOnboardingIcon" inBundle:v33];
  id v35 = (UIImageView *)[v31 initWithImage:v34];
  bubbleImageView = self->_bubbleImageView;
  self->_bubbleImageView = v35;

  [(UIImageView *)self->_bubbleImageView setAccessibilityIdentifier:@"UIA.GameCenter.SignIn.icon"];
  v37 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  signInLabel = self->_signInLabel;
  self->_signInLabel = v37;

  [(UILabel *)self->_signInLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v39 = [MEMORY[0x1E4FB1618] clearColor];
  [(UILabel *)self->_signInLabel setBackgroundColor:v39];

  [(UILabel *)self->_signInLabel setLineBreakMode:0];
  [(UILabel *)self->_signInLabel setNumberOfLines:0];
  [(UILabel *)self->_signInLabel setTextAlignment:1];
  v40 = [MEMORY[0x1E4FB08E0] _gkPreferredFontForTextStyle:*MEMORY[0x1E4FB2980] symbolicTraits:2];
  [(UILabel *)self->_signInLabel setFont:v40];

  v41 = GKGameCenterUIFrameworkBundle();
  v42 = GKGetLocalizedStringFromTableInBundle();
  [(UILabel *)self->_signInLabel setText:v42];

  [(UILabel *)self->_signInLabel setAccessibilityIdentifier:@"UIA.GameCenter.SignIn.header"];
  v43 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
  progressIndicator = self->_progressIndicator;
  self->_progressIndicator = v43;

  [(UIActivityIndicatorView *)self->_progressIndicator setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIActivityIndicatorView *)self->_progressIndicator setHidesWhenStopped:1];
  v45 = [(GKViewController *)self colorPalette];
  v46 = [v45 activityIndicatorColor];
  [(UIActivityIndicatorView *)self->_progressIndicator setColor:v46];

  [(UIActivityIndicatorView *)self->_progressIndicator setAccessibilityIdentifier:@"UIA.GameCenter.SignIn.progressIndicator"];
  id v49 = [(GKSignInViewController *)self view];
  v47 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v49 setBackgroundColor:v47];

  [v49 addSubview:self->_scrollView];
  id v48 = (id)[v49 _gkApplyFakeStatusBarView];
  [(UIScrollView *)self->_scrollView addSubview:self->_signInInputView];
  [(GKSignInInputView *)self->_signInInputView addSubview:self->_bubbleImageView];
  [(GKSignInInputView *)self->_signInInputView addSubview:self->_signInLabel];
  [(GKSignInInputView *)self->_signInInputView addSubview:self->_loginPromptLabel];
  [(GKSignInInputView *)self->_signInInputView addSubview:self->_progressIndicator];
}

- (void)viewSafeAreaInsetsDidChange
{
  id v3 = [(GKSignInViewController *)self view];
  [v3 safeAreaInsets];
  double v5 = v4;
  double v6 = [(GKSignInViewController *)self view];
  [v6 safeAreaInsets];
  double v8 = v5 + v7;

  id v9 = [(GKSignInViewController *)self signInInputView];
  uint64_t v10 = [v9 signInInputViewHeightConstraint];
  [v10 setConstant:-v8];

  v11.receiver = self;
  v11.super_class = (Class)GKSignInViewController;
  [(GKSignInViewController *)&v11 viewSafeAreaInsetsDidChange];
}

- (void)_systemContentSizeSettingDidChange:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = [(GKSignInInputView *)self->_signInInputView subviews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v8 conformsToProtocol:&unk_1F08433D8]) {
          [v8 replayAndApplyStyleWithSystemContentChange:1];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKSignInViewController;
  [(GKSignInViewController *)&v9 willTransitionToTraitCollection:v6 withTransitionCoordinator:a4];
  if ([v6 userInterfaceIdiom] == 1)
  {
    [(GKSignInViewController *)self updateConstraintConstantsForTraitCollection:v6];
    double v7 = [(GKSignInViewController *)self fullWidthViewConstraints];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __84__GKSignInViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke;
    v8[3] = &unk_1E5F650A8;
    v8[4] = self;
    [v7 enumerateObjectsUsingBlock:v8];
  }
}

void __84__GKSignInViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 fullWidthContentWidthConstraintConstant];
  objc_msgSend(v3, "setConstant:");
}

- (void)updateConstraintConstantsForTraitCollection:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if (v5 == 1)
  {
    if (*MEMORY[0x1E4F63830]) {
      double v6 = 291.0;
    }
    else {
      double v6 = dbl_1AF7CAE50[[v7 horizontalSizeClass] == 2];
    }
  }
  else
  {
    double v6 = 290.0;
  }
  [(GKSignInViewController *)self setFullWidthContentWidthConstraintConstant:v6];
}

- (void)createConstraints
{
  v51[2] = *MEMORY[0x1E4F143B8];
  if (!self->_constraintsCreated)
  {
    v43 = [(GKSignInViewController *)self view];
    double v3 = *MEMORY[0x1E4FB2848];
    double v4 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v5 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v6 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    id v7 = objc_msgSend(MEMORY[0x1E4F28DC8], "_gkConstraintsForView:withinView:insets:", self->_scrollView, v43, *MEMORY[0x1E4FB2848], v4, v5, v6);
    [v43 addConstraints:v7];

    double v8 = (void *)MEMORY[0x1E4F28DC8];
    signInInputView = self->_signInInputView;
    long long v10 = self->_scrollView;
    long long v11 = objc_msgSend(v8, "_gkConstraintsForView:withinView:insets:", signInInputView, v10, v3, v4, v5, v6);
    [(UIScrollView *)v10 addConstraints:v11];

    long long v12 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_signInInputView attribute:7 relatedBy:0 toItem:v10 attribute:7 multiplier:1.0 constant:0.0];
    [(UIScrollView *)v10 addConstraint:v12];

    v42 = [MEMORY[0x1E4F1CA48] array];
    [(UIImageView *)self->_bubbleImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    CGFloat v13 = [(UIImageView *)self->_bubbleImageView bottomAnchor];
    uint64_t v14 = [(UILabel *)self->_signInLabel firstBaselineAnchor];
    CGFloat v15 = [v13 constraintEqualToAnchor:v14 constant:-37.0];
    [v15 setActive:1];

    long long v16 = [(UIImageView *)self->_bubbleImageView centerXAnchor];
    CGFloat v17 = [(GKSignInInputView *)self->_signInInputView centerXAnchor];
    CGFloat v18 = [v16 constraintEqualToAnchor:v17 constant:0.0];
    [v18 setActive:1];

    CGFloat v19 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_signInLabel attribute:11 relatedBy:0 toItem:self->_signInInputView attribute:3 multiplier:1.0 constant:0.0];
    [(GKSignInInputView *)self->_signInInputView setTopToSignInBaselineConstraint:v19];

    CGFloat v20 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_loginPromptLabel attribute:12 relatedBy:0 toItem:self->_signInLabel attribute:11 multiplier:1.0 constant:0.0];
    [(GKSignInInputView *)self->_signInInputView setSignInBaselineToPromptTextTopConstraint:v20];

    id v21 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_progressIndicator attribute:3 relatedBy:0 toItem:self->_loginPromptLabel attribute:11 multiplier:1.0 constant:0.0];
    [(GKSignInInputView *)self->_signInInputView setPromptTextToProgressIndicatorTopConstraint:v21];

    id v22 = (void *)MEMORY[0x1E4F28DC8];
    uint64_t v23 = [(AKInlineSignInViewController *)self->_inlineSignInViewController view];
    long long v24 = [v22 constraintWithItem:v23 attribute:12 relatedBy:0 toItem:self->_loginPromptLabel attribute:11 multiplier:1.0 constant:0.0];
    [(GKSignInInputView *)self->_signInInputView setSignInFormToSignInLabelTopConstraint:v24];

    long long v25 = [(GKSignInViewController *)self signInInputView];
    double v26 = [v25 heightAnchor];
    id v27 = [(GKSignInViewController *)self view];
    v28 = [v27 heightAnchor];
    uint64_t v29 = [v26 constraintGreaterThanOrEqualToAnchor:v28];
    [(GKSignInInputView *)self->_signInInputView setSignInInputViewHeightConstraint:v29];

    v30 = [(GKSignInInputView *)self->_signInInputView signInInputViewHeightConstraint];
    [v30 setActive:1];

    id v31 = [(GKSignInInputView *)self->_signInInputView allVariableConstraints];
    [v42 addObjectsFromArray:v31];

    v32 = [(GKSignInViewController *)self traitCollection];
    [(GKSignInViewController *)self updateConstraintConstantsForTraitCollection:v32];

    signInLabel = self->_signInLabel;
    v51[0] = self->_loginPromptLabel;
    v51[1] = signInLabel;
    v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:2];
    v50[0] = self->_progressIndicator;
    id v35 = [(AKInlineSignInViewController *)self->_inlineSignInViewController view];
    v50[1] = v35;
    v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:2];
    v37 = [v34 arrayByAddingObjectsFromArray:v36];

    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __43__GKSignInViewController_createConstraints__block_invoke;
    v47[3] = &unk_1E5F650D0;
    id v38 = v42;
    id v48 = v38;
    id v49 = self;
    [v37 enumerateObjectsUsingBlock:v47];
    v39 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v34, "count"));
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __43__GKSignInViewController_createConstraints__block_invoke_2;
    v44[3] = &unk_1E5F650F8;
    v44[4] = self;
    id v45 = v38;
    id v46 = v39;
    id v40 = v39;
    id v41 = v38;
    [v34 enumerateObjectsUsingBlock:v44];
    [(GKSignInViewController *)self setFullWidthViewConstraints:v40];
    [(GKSignInInputView *)self->_signInInputView addConstraints:v41];
    [(GKSignInInputView *)self->_signInInputView setupConstraintConstantsForOrientation:[(GKSignInViewController *)self interfaceOrientation]];
    [(GKSignInInputView *)self->_signInInputView setNeedsLayout];
    self->_constraintsCreated = 1;
  }
}

void __43__GKSignInViewController_createConstraints__block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x1E4F28DC8] _gkConstraintForView:a2 centeredXInView:*(void *)(*(void *)(a1 + 40) + 1064)];
  [v2 addObject:v3];
}

void __43__GKSignInViewController_createConstraints__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F28DC8];
  double v4 = *(void **)(a1 + 32);
  id v5 = a2;
  [v4 fullWidthContentWidthConstraintConstant];
  objc_msgSend(v3, "_gkConstraintForView:withConstantWidth:", v5);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 40) addObject:v6];
  [*(id *)(a1 + 48) addObject:v6];
}

- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  v8.receiver = self;
  v8.super_class = (Class)GKSignInViewController;
  -[GKSignInViewController willAnimateRotationToInterfaceOrientation:duration:](&v8, sel_willAnimateRotationToInterfaceOrientation_duration_);
  [(GKSignInInputView *)self->_signInInputView setupConstraintConstantsForOrientation:a3];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__GKSignInViewController_willAnimateRotationToInterfaceOrientation_duration___block_invoke;
  v7[3] = &unk_1E5F62EB0;
  v7[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v7 animations:a4];
}

uint64_t __77__GKSignInViewController_willAnimateRotationToInterfaceOrientation_duration___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1064) layoutIfNeeded];
}

- (void)startLoadingIndicator
{
  id v2 = [(GKSignInViewController *)self progressIndicator];
  [v2 startAnimating];
}

- (void)stopLoadingIndicator
{
  id v2 = [(GKSignInViewController *)self progressIndicator];
  [v2 stopAnimating];
}

- (void)signIn
{
  id v3 = [MEMORY[0x1E4F639D0] authenticatorForPlayerWithUsername:self->_appleID password:0 withPresentingViewController:self];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__GKSignInViewController_signIn__block_invoke;
  v5[3] = &unk_1E5F62EB0;
  v5[4] = self;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __32__GKSignInViewController_signIn__block_invoke_3;
  v4[3] = &unk_1E5F65120;
  v4[4] = self;
  [v3 authenticateUsingAuthUIWithAuthUIDismissHandler:v5 completionHandler:v4];
}

void __32__GKSignInViewController_signIn__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__GKSignInViewController_signIn__block_invoke_2;
  block[3] = &unk_1E5F62EB0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __32__GKSignInViewController_signIn__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) startLoadingIndicator];
}

void __32__GKSignInViewController_signIn__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v7 = a4;
  [*(id *)(a1 + 32) authenticateRequestCompletedWithErrorResponse:a5 error:v7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __32__GKSignInViewController_signIn__block_invoke_4;
  v10[3] = &unk_1E5F63350;
  uint64_t v8 = *(void *)(a1 + 32);
  id v11 = v7;
  uint64_t v12 = v8;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v10);
}

uint64_t __32__GKSignInViewController_signIn__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 40) stopLoadingIndicator];
}

- (void)showPasswordChangeAlertWithURL:(id)a3
{
  id v4 = a3;
  id v5 = GKGameCenterUIFrameworkBundle();
  id v6 = GKGetLocalizedStringFromTableInBundle();

  id v7 = NSString;
  uint64_t v8 = GKGameCenterUIFrameworkBundle();
  id v9 = GKGetLocalizedStringFromTableInBundle();
  long long v10 = [v4 host];
  id v11 = objc_msgSend(v7, "stringWithFormat:", v9, v10);

  uint64_t v12 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v6 message:v11 preferredStyle:1];
  CGFloat v13 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v14 = GKGameCenterUIFrameworkBundle();
  CGFloat v15 = GKGetLocalizedStringFromTableInBundle();
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __57__GKSignInViewController_showPasswordChangeAlertWithURL___block_invoke;
  v23[3] = &unk_1E5F63170;
  id v24 = v4;
  id v16 = v4;
  CGFloat v17 = [v13 actionWithTitle:v15 style:0 handler:v23];
  [v12 addAction:v17];

  CGFloat v18 = (void *)MEMORY[0x1E4FB1410];
  CGFloat v19 = GKGameCenterUIFrameworkBundle();
  CGFloat v20 = GKGetLocalizedStringFromTableInBundle();
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __57__GKSignInViewController_showPasswordChangeAlertWithURL___block_invoke_2;
  v22[3] = &unk_1E5F63170;
  v22[4] = self;
  id v21 = [v18 actionWithTitle:v20 style:1 handler:v22];
  [v12 addAction:v21];

  [(GKSignInViewController *)self presentViewController:v12 animated:1 completion:0];
}

void __57__GKSignInViewController_showPasswordChangeAlertWithURL___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v2 openURL:*(void *)(a1 + 32)];
}

void __57__GKSignInViewController_showPasswordChangeAlertWithURL___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] userErrorForCode:2 underlyingError:0];
  [v1 finishAuthenticationWithError:v2];
}

- (void)authenticateRequestCompletedWithErrorResponse:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    if ([MEMORY[0x1E4F636F0] isGameCenter]
      && [v6 shouldShowLinkAccountsUI])
    {
      uint64_t v8 = [v6 playerID];
      [(GKSignInViewController *)self showAccountRemoteUIForPlayerID:v8 mode:3];
      goto LABEL_10;
    }
    if (([v6 passwordChangeRequired] & 1) == 0)
    {
      [(GKSignInViewController *)self finishAuthenticationWithError:0];
      goto LABEL_11;
    }
LABEL_9:
    uint64_t v8 = [v6 passwordChangeURL];
    [(GKSignInViewController *)self showPasswordChangeAlertWithURL:v8];
    goto LABEL_10;
  }
  if ([v6 passwordChangeRequired]) {
    goto LABEL_9;
  }
  if (![v7 gkIsNotConnectedToInternetError])
  {
    CGFloat v15 = [v7 domain];
    int v16 = [v15 isEqualToString:*MEMORY[0x1E4F63140]];

    if (v16)
    {
      uint64_t v17 = [v7 code];
      if (v17 > 5)
      {
        if (v17 == 6)
        {
          long long v25 = [v7 userInfo];
          uint64_t v8 = [v25 objectForKey:*MEMORY[0x1E4F28A50]];

          double v26 = [v6 playerID];
          BOOL v27 = [(GKSignInViewController *)self handleUnderlyingAuthenticationError:v8 playerID:v26];

          if (!v27) {
            [(GKSignInViewController *)self showConnectionFailedAlert];
          }
          goto LABEL_10;
        }
        if (v17 == 15)
        {
          CGFloat v18 = (void *)MEMORY[0x1E4FB1418];
          CGFloat v19 = GKGameCenterUIFrameworkBundle();
          CGFloat v20 = GKGetLocalizedStringFromTableInBundle();
          uint64_t v8 = [v18 alertControllerWithTitle:v20 message:0 preferredStyle:1];

          id v21 = (void *)MEMORY[0x1E4FB1410];
          id v22 = GKGameCenterUIFrameworkBundle();
          uint64_t v23 = GKGetLocalizedStringFromTableInBundle();
          v28[0] = MEMORY[0x1E4F143A8];
          v28[1] = 3221225472;
          v28[2] = __78__GKSignInViewController_authenticateRequestCompletedWithErrorResponse_error___block_invoke;
          v28[3] = &unk_1E5F63170;
          v28[4] = self;
          id v24 = [v21 actionWithTitle:v23 style:0 handler:v28];
          [v8 addAction:v24];

          [(GKSignInViewController *)self presentViewController:v8 animated:1 completion:0];
          goto LABEL_10;
        }
      }
      else
      {
        if (v17 == 2) {
          goto LABEL_11;
        }
        if (v17 == 5)
        {
          [(GKSignInViewController *)self showLoginFailedAlert];
          goto LABEL_11;
        }
      }
    }
    [(GKSignInViewController *)self showConnectionFailedAlert];
    goto LABEL_11;
  }
  uint64_t v8 = GKGameCenterUIFrameworkBundle();
  id v9 = GKGetLocalizedStringFromTableInBundle();
  long long v10 = GKGameCenterUIFrameworkBundle();
  id v11 = GKGetLocalizedStringFromTableInBundle();
  uint64_t v12 = GKGameCenterUIFrameworkBundle();
  CGFloat v13 = GKGetLocalizedStringFromTableInBundle();
  id v14 = (id)[(GKSignInViewController *)self _gkPresentAlertWithTitle:v9 message:v11 buttonTitle:v13];

LABEL_10:
LABEL_11:
}

void __78__GKSignInViewController_authenticateRequestCompletedWithErrorResponse_error___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] userErrorForCode:15 underlyingError:0];
  [v1 finishAuthenticationWithError:v2];
}

- (void)presentError:(id)a3 forAccountRemoteUIController:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "mode", a3);
  if (v5 == 3 || v5 == 2 || v5 == 1)
  {
    id v6 = GKGameCenterUIFrameworkBundle();
    GKGetLocalizedStringFromTableInBundle();
    id v12 = (id)objc_claimAutoreleasedReturnValue();

    id v7 = GKGameCenterUIFrameworkBundle();
    uint64_t v8 = GKGetLocalizedStringFromTableInBundle();
  }
  else
  {
    id v12 = 0;
    uint64_t v8 = 0;
  }
  id v9 = GKGameCenterUIFrameworkBundle();
  long long v10 = GKGetLocalizedStringFromTableInBundle();
  id v11 = (id)[(GKSignInViewController *)self _gkPresentAlertWithTitle:v12 message:v8 buttonTitle:v10];
}

- (void)accountRemoteUIController:(id)a3 finishedWithError:(id)a4
{
  id v5 = a3;
  id v6 = [v5 playerForRemoteUI];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F63760] localPlayer];
  }
  id v9 = v8;

  if ([v5 isServerAuthenticated])
  {
    if ([v9 isAuthenticated])
    {
      [(GKSignInViewController *)self finishAuthenticationWithError:0];
    }
    else if ([v5 mode] == 1)
    {
      [(GKSignInViewController *)self cancelSignIn];
    }
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __70__GKSignInViewController_accountRemoteUIController_finishedWithError___block_invoke;
    v10[3] = &unk_1E5F63240;
    void v10[4] = self;
    [v9 signOutWithCompletionHandler:v10];
  }
  [(GKSignInViewController *)self dismissViewControllerAnimated:1 completion:0];
}

uint64_t __70__GKSignInViewController_accountRemoteUIController_finishedWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishAuthenticationWithError:0];
}

- (void)loadAccountRemoteUIForPlayer:(id)a3 mode:(int64_t)a4 completionHandler:(id)a5
{
}

- (void)loadAccountRemoteUIForPlayer:(id)a3 mode:(int64_t)a4 url:(id)a5 postBody:(id)a6 completionHandler:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (!v16)
  {
    CGFloat v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"GKSignInViewController.m", 990, @"Invalid parameter not satisfying: %@", @"handler != nil" object file lineNumber description];
  }
  self->_loadingRemoteUI = 1;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __91__GKSignInViewController_loadAccountRemoteUIForPlayer_mode_url_postBody_completionHandler___block_invoke;
  v20[3] = &unk_1E5F65198;
  v20[4] = self;
  id v21 = v13;
  id v22 = v16;
  id v17 = v16;
  id v18 = v13;
  +[GKAccountRemoteUIController accountRemoteUIControllerForPlayer:v18 mode:a4 url:v14 postBody:v15 completionHandler:v20];
}

void __91__GKSignInViewController_loadAccountRemoteUIForPlayer_mode_url_postBody_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    if ([v6 code] == 3)
    {
      id v8 = [v7 domain];
      int v9 = [v8 isEqualToString:@"GKRemoteUIErrorDomain"];

      if (v9)
      {
        long long v10 = *(void **)(a1 + 32);
        id v11 = [v7 userInfo];
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __91__GKSignInViewController_loadAccountRemoteUIForPlayer_mode_url_postBody_completionHandler___block_invoke_2;
        v19[3] = &unk_1E5F65148;
        id v12 = *(void **)(a1 + 40);
        void v19[4] = *(void *)(a1 + 32);
        id v20 = v12;
        [v10 showAuthKitAlertFromGreenBuddyWithAuthInfo:v11 completion:v19];

LABEL_11:
        id v13 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
        goto LABEL_12;
      }
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 1001) = 0;
    id v14 = [v7 domain];
    if ([v14 isEqualToString:@"GKRemoteUIErrorDomain"])
    {
      uint64_t v15 = [v7 code];

      if (!v15)
      {
        [*(id *)(a1 + 40) cancelAuthentication];
        [*(id *)(a1 + 40) startAuthenticationForExistingPrimaryPlayer];
        id v16 = *(void **)(a1 + 32);
        id v17 = [MEMORY[0x1E4F28C58] userErrorForCode:2 underlyingError:0];
        [v16 finishAuthenticationWithError:v17];

        goto LABEL_11;
      }
    }
    else
    {
    }
    [*(id *)(a1 + 32) finishAuthenticationWithError:v7];
    goto LABEL_11;
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 1001) = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __91__GKSignInViewController_loadAccountRemoteUIForPlayer_mode_url_postBody_completionHandler___block_invoke_4;
  v18[3] = &unk_1E5F65170;
  v18[4] = *(void *)(a1 + 32);
  [v5 setCompletionHandler:v18];
  [*(id *)(a1 + 32) setAccountController:v5];
  id v13 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_12:
  v13();
}

void __91__GKSignInViewController_loadAccountRemoteUIForPlayer_mode_url_postBody_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1001) = 0;
  if ([a2 code] == -7003)
  {
    id v3 = [MEMORY[0x1E4F28C58] userErrorForCode:2 underlyingError:0];
    [*(id *)(a1 + 40) authenticationDidCompleteWithError:v3];
    [*(id *)(a1 + 32) finishAuthenticationWithError:v3];
    [*(id *)(a1 + 40) signOutWithCompletionHandler:&__block_literal_global_26];
  }
}

void __91__GKSignInViewController_loadAccountRemoteUIForPlayer_mode_url_postBody_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (([v7 isServerAuthenticated] & 1) == 0)
  {
    uint64_t v6 = [MEMORY[0x1E4F28C58] userErrorForCode:2 underlyingError:0];

    id v5 = (id)v6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [*(id *)(a1 + 32) accountRemoteUIController:v7 finishedWithError:v5];
  }
  [*(id *)(a1 + 32) setAccountController:0];
}

- (void)presentAccountRemoteUIControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [GKRemoteUINavigationController alloc];
  uint64_t v6 = [(GKSignInViewController *)self accountController];
  CGFloat v19 = [(GKRemoteUINavigationController *)v5 initWithRemoteUIController:v6];

  if (([MEMORY[0x1E4F636F0] isGameCenter] & 1) == 0)
  {
    id v7 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v8 = [v7 userInterfaceIdiom];

    if (v8 == 1 && (!*MEMORY[0x1E4F63830] || *MEMORY[0x1E4F63A38] != 0))
    {
      [(GKRemoteUINavigationController *)v19 setModalPresentationStyle:16];
      long long v10 = [MEMORY[0x1E4F63A10] sharedTheme];
      [v10 formSheetSize];
      -[GKRemoteUINavigationController setFormSheetSize:](v19, "setFormSheetSize:");

      id v11 = [(GKRemoteUINavigationController *)v19 view];
      id v12 = [v11 layer];
      [v12 setMasksToBounds:1];

      id v13 = [MEMORY[0x1E4F63A10] sharedTheme];
      [v13 formSheetCornerRadius];
      double v15 = v14;
      id v16 = [(GKRemoteUINavigationController *)v19 view];
      id v17 = [v16 layer];
      [v17 setCornerRadius:v15];
    }
  }
  if (self->_remoteUIPresentingViewController) {
    remoteUIPresentingViewController = (GKSignInViewController *)self->_remoteUIPresentingViewController;
  }
  else {
    remoteUIPresentingViewController = self;
  }
  [(GKSignInViewController *)remoteUIPresentingViewController presentViewController:v19 animated:v3 completion:0];
}

- (void)showAccountRemoteUIForAccountName:(id)a3 mode:(int64_t)a4
{
}

- (void)showAccountRemoteUIForPlayerID:(id)a3 mode:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(GKSignInViewController *)self view];
  [v7 setUserInteractionEnabled:0];

  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  CGFloat v19 = __Block_byref_object_copy__4;
  id v20 = __Block_byref_object_dispose__4;
  id v21 = 0;
  uint64_t v8 = [MEMORY[0x1E4F63760] authenticatedLocalPlayersFiltered:0];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __62__GKSignInViewController_showAccountRemoteUIForPlayerID_mode___block_invoke;
  id v13 = &unk_1E5F651C0;
  id v9 = v6;
  id v14 = v9;
  double v15 = &v16;
  [v8 enumerateObjectsUsingBlock:&v10];

  -[GKSignInViewController showAccountRemoteUIForLocalPlayer:mode:url:postBody:](self, "showAccountRemoteUIForLocalPlayer:mode:url:postBody:", v17[5], a4, 0, 0, v10, v11, v12, v13);
  _Block_object_dispose(&v16, 8);
}

void __62__GKSignInViewController_showAccountRemoteUIForPlayerID_mode___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v4 = [v7 internal];
  id v5 = [v4 playerID];
  int v6 = [v5 isEqual:*(void *)(a1 + 32)];

  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

- (void)showAccountRemoteUIForAccountName:(id)a3 mode:(int64_t)a4 url:(id)a5 postBody:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(GKSignInViewController *)self view];
  [v13 setUserInteractionEnabled:0];

  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  long long v25 = __Block_byref_object_copy__4;
  double v26 = __Block_byref_object_dispose__4;
  id v27 = 0;
  id v14 = [MEMORY[0x1E4F63760] authenticatedLocalPlayersFiltered:0];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  uint64_t v18 = __78__GKSignInViewController_showAccountRemoteUIForAccountName_mode_url_postBody___block_invoke;
  CGFloat v19 = &unk_1E5F651C0;
  id v15 = v10;
  id v20 = v15;
  id v21 = &v22;
  [v14 enumerateObjectsUsingBlock:&v16];

  -[GKSignInViewController showAccountRemoteUIForLocalPlayer:mode:url:postBody:](self, "showAccountRemoteUIForLocalPlayer:mode:url:postBody:", v23[5], a4, v11, v12, v16, v17, v18, v19);
  _Block_object_dispose(&v22, 8);
}

void __78__GKSignInViewController_showAccountRemoteUIForAccountName_mode_url_postBody___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v4 = [v6 accountName];
  int v5 = [v4 isEqual:*(void *)(a1 + 32)];

  if (v5) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

- (void)showAccountRemoteUIForLocalPlayer:(id)a3 mode:(int64_t)a4 url:(id)a5 postBody:(id)a6
{
  id v10 = (void *)MEMORY[0x1E4F636C8];
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  id v14 = (id)[v10 proxyForPlayer:v13];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __78__GKSignInViewController_showAccountRemoteUIForLocalPlayer_mode_url_postBody___block_invoke;
  v15[3] = &unk_1E5F63240;
  v15[4] = self;
  [(GKSignInViewController *)self loadAccountRemoteUIForPlayer:v13 mode:a4 url:v12 postBody:v11 completionHandler:v15];
}

void __78__GKSignInViewController_showAccountRemoteUIForLocalPlayer_mode_url_postBody___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  BOOL v3 = [*(id *)(a1 + 32) view];
  [v3 setUserInteractionEnabled:1];

  if (v10)
  {
    if ([v10 code] != 3)
    {
      id v4 = *(void **)(a1 + 32);
      int v5 = GKGameCenterUIFrameworkBundle();
      id v6 = GKGetLocalizedStringFromTableInBundle();
      id v7 = GKGameCenterUIFrameworkBundle();
      uint64_t v8 = GKGetLocalizedStringFromTableInBundle();
      id v9 = (id)[v4 _gkPresentAlertForError:v10 title:v6 defaultMessage:v8];
    }
  }
  else
  {
    [*(id *)(a1 + 32) presentAccountRemoteUIControllerAnimated:1];
  }
}

- (void)showAuthKitAlertFromGreenBuddyWithAuthInfo:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 objectForKeyedSubscript:@"authUsername"];
  id v9 = (void *)MEMORY[0x1E4F1CB10];
  id v10 = [v7 objectForKeyedSubscript:@"authOkUrl"];
  id v11 = [v9 URLWithString:v10];

  id v12 = (void *)MEMORY[0x1E4F1CB10];
  id v13 = [v7 objectForKeyedSubscript:@"cancelUrl"];

  id v14 = [v12 URLWithString:v13];

  remoteUIPresentingViewController = (GKSignInViewController *)self->_remoteUIPresentingViewController;
  if (!remoteUIPresentingViewController) {
    remoteUIPresentingViewController = self;
  }
  uint64_t v16 = (void *)MEMORY[0x1E4F639D0];
  uint64_t v17 = remoteUIPresentingViewController;
  uint64_t v18 = [v16 authenticatorForPlayerWithUsername:v8 password:0 withPresentingViewController:v17];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __80__GKSignInViewController_showAuthKitAlertFromGreenBuddyWithAuthInfo_completion___block_invoke;
  v22[3] = &unk_1E5F651E8;
  v22[4] = self;
  id v23 = v11;
  id v24 = v14;
  id v25 = v6;
  id v19 = v6;
  id v20 = v14;
  id v21 = v11;
  [v18 authenticateUsingAuthUIAllowingAppleIDCreation:0 usernameEditable:0 dismissHandler:0 completionHandler:v22];
}

void __80__GKSignInViewController_showAuthKitAlertFromGreenBuddyWithAuthInfo_completion___block_invoke(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v13 = a2;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = v18;
  if (v13 && v14 && !v18)
  {
    id v20 = (void *)a1[4];
    uint64_t v21 = a1[5];
    if (v15) {
      id v22 = v15;
    }
    else {
      id v22 = v13;
    }
    v26[0] = @"authUsername";
    v26[1] = @"authPassword";
    v27[0] = v22;
    v27[1] = v14;
    id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];
    [v20 showAccountRemoteUIForAccountName:v13 mode:1 url:v21 postBody:v23];
  }
  else
  {
    uint64_t v24 = a1[6];
    if (v24) {
      [MEMORY[0x1E4F639D0] postURL:v24 postBody:MEMORY[0x1E4F1CC08] completion:0];
    }
  }
  uint64_t v25 = a1[7];
  if (v25) {
    (*(void (**)(uint64_t, void *))(v25 + 16))(v25, v19);
  }
}

- (void)showViewController:(id)a3
{
  id v4 = a3;
  id v9 = [[GKNavigationController alloc] initWithRootViewController:v4];

  int v5 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if (v6 == 1 && (!*MEMORY[0x1E4F63830] || *MEMORY[0x1E4F63A38] != 0))
  {
    [(GKNavigationController *)v9 setModalPresentationStyle:16];
    uint64_t v8 = [MEMORY[0x1E4F63A10] sharedTheme];
    [v8 formSheetSize];
    -[GKNavigationController setFormSheetSize:](v9, "setFormSheetSize:");
  }
  [(GKSignInViewController *)self presentViewController:v9 animated:1 completion:0];
}

- (void)finishAuthenticationWithError:(id)a3
{
  completionHandler = (void (**)(id, id))self->_completionHandler;
  if (completionHandler)
  {
    completionHandler[2](completionHandler, a3);
    [(GKSignInViewController *)self setCompletionHandler:0];
  }

  [(GKSignInViewController *)self stopLoadingIndicator];
}

- (BOOL)handleUnderlyingAuthenticationError:(id)a3 playerID:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 code];
  switch(v7)
  {
    case 5048:
      id v9 = GKGameCenterUIFrameworkBundle();
      id v10 = GKGetLocalizedStringFromTableInBundle();
      id v11 = GKGameCenterUIFrameworkBundle();
      id v12 = GKGetLocalizedStringFromTableInBundle();
      id v13 = (id)[(GKSignInViewController *)self _gkPresentAlertWithTitle:v10 message:0 buttonTitle:v12];

LABEL_7:
      BOOL v8 = 1;
      break;
    case 5046:
      [(GKSignInViewController *)self showAccountDisabledAlert];
      goto LABEL_7;
    case 5029:
      BOOL v8 = 1;
      [(GKSignInViewController *)self showAccountRemoteUIForPlayerID:v6 mode:1];
      break;
    default:
      BOOL v8 = 0;
      break;
  }

  return v8;
}

- (void)showPasswordResetAlertWithTitle:(id)a3 message:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__GKSignInViewController_showPasswordResetAlertWithTitle_message___block_invoke;
  block[3] = &unk_1E5F63E80;
  block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __66__GKSignInViewController_showPasswordResetAlertWithTitle_message___block_invoke(void *a1)
{
  v1 = (void *)a1[4];
  uint64_t v2 = a1[5];
  uint64_t v3 = a1[6];
  GKGameCenterUIFrameworkBundle();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = GKGetLocalizedStringFromTableInBundle();
  id v5 = (id)[v1 _gkPresentConfirmationAlertWithTitle:v2 message:v3 buttonTitle:v4 block:&__block_literal_global_344 cancelAction:0];
}

void __66__GKSignInViewController_showPasswordResetAlertWithTitle_message___block_invoke_2()
{
  id v1 = [MEMORY[0x1E4FB1438] sharedApplication];
  v0 = [MEMORY[0x1E4F1CB10] URLWithString:*MEMORY[0x1E4F63138]];
  [v1 openURL:v0];
}

- (void)showPasswordAlertWithTitle:(id)a3 message:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__GKSignInViewController_showPasswordAlertWithTitle_message___block_invoke;
  block[3] = &unk_1E5F63E80;
  block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __61__GKSignInViewController_showPasswordAlertWithTitle_message___block_invoke(void *a1)
{
  id v1 = (void *)a1[4];
  uint64_t v2 = a1[5];
  uint64_t v3 = a1[6];
  GKGameCenterUIFrameworkBundle();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = GKGetLocalizedStringFromTableInBundle();
  id v5 = (id)[v1 _gkPresentAlertWithTitle:v2 message:v3 buttonTitle:v4];
}

- (void)showLoginFailedAlert
{
  GKGameCenterUIFrameworkBundle();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = GKGetLocalizedStringFromTableInBundle();
  [(GKSignInViewController *)self showPasswordAlertWithTitle:v3 message:0];
}

- (void)showForgotPasswordAlert
{
  GKGameCenterUIFrameworkBundle();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = GKGetLocalizedStringFromTableInBundle();
  id v4 = GKGameCenterUIFrameworkBundle();
  id v5 = GKGetLocalizedStringFromTableInBundle();
  [(GKSignInViewController *)self showPasswordResetAlertWithTitle:v3 message:v5];
}

- (void)showAccountDisabledAlert
{
  GKGameCenterUIFrameworkBundle();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = GKGetLocalizedStringFromTableInBundle();
  [(GKSignInViewController *)self showPasswordResetAlertWithTitle:v3 message:0];
}

- (void)showConnectionFailedAlert
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__GKSignInViewController_showConnectionFailedAlert__block_invoke;
  block[3] = &unk_1E5F62EB0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __51__GKSignInViewController_showConnectionFailedAlert__block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  GKGameCenterUIFrameworkBundle();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = GKGetLocalizedStringFromTableInBundle();
  uint64_t v3 = GKGameCenterUIFrameworkBundle();
  id v4 = GKGetLocalizedStringFromTableInBundle();
  id v5 = (id)[v1 _gkPresentAlertWithTitle:v2 message:0 buttonTitle:v4];
}

- (void)createAppleID
{
  [(GKSignInViewController *)self setEditing:0];
  id v2 = [MEMORY[0x1E4F63698] defaultWorkspace];
  [v2 openICloudSettings];
}

- (void)showAAUISignInController
{
  uint64_t v3 = objc_alloc_init(GKAAUISignInController);
  [(AAUISignInController *)v3 setServiceType:*MEMORY[0x1E4F4D8F8]];
  [(GKAAUISignInController *)v3 setDelegate:self];
  [(AAUISignInController *)v3 _setShouldForceOperation:1];
  if ([MEMORY[0x1E4F63760] usesGameOverlayUI]
    && ([MEMORY[0x1E4FB16C8] currentDevice],
        id v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 userInterfaceIdiom],
        v4,
        v5 == 1))
  {
    uint64_t v6 = 18;
  }
  else
  {
    uint64_t v6 = 5;
  }
  [(GKAAUISignInController *)v3 setModalPresentationStyle:v6];
  id v7 = [(GKSignInViewController *)self signInView];
  [v7 disablePrimaryButton];

  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__GKSignInViewController_showAAUISignInController__block_invoke;
  v9[3] = &unk_1E5F65210;
  objc_copyWeak(&v11, &location);
  id v8 = v3;
  id v10 = v8;
  [(AAUISignInController *)v8 prepareInViewController:self completion:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __50__GKSignInViewController_showAAUISignInController__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = WeakRetained;
  if (a2)
  {
    [WeakRetained presentViewController:*(void *)(a1 + 32) animated:1 completion:0];
  }
  else
  {
    uint64_t v5 = [WeakRetained signInView];
    [v5 enablePrimaryButton];
  }
}

- (void)iForgotTapped
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F100]);
  [v3 setNeedsCredentialRecovery:1];
  [v3 setPresentingViewController:self];
  id v4 = [(GKSignInViewController *)self appleID];
  [v3 setUsername:v4];

  uint64_t v5 = [(GKSignInViewController *)self view];
  [v5 setUserInteractionEnabled:0];

  id v6 = objc_alloc_init(MEMORY[0x1E4F4EF68]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__GKSignInViewController_iForgotTapped__block_invoke;
  v7[3] = &unk_1E5F65238;
  v7[4] = self;
  [v6 authenticateWithContext:v3 completion:v7];
}

void __39__GKSignInViewController_iForgotTapped__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__GKSignInViewController_iForgotTapped__block_invoke_2;
  block[3] = &unk_1E5F62EB0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __39__GKSignInViewController_iForgotTapped__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setUserInteractionEnabled:1];
}

- (void)keyboardWillShow:(id)a3
{
  id v33 = [a3 userInfo];
  id v4 = [v33 objectForKey:*MEMORY[0x1E4FB2BD8]];
  [v4 CGRectValue];
  double v6 = v5;

  id v7 = [(GKSignInViewController *)self scrollView];
  objc_msgSend(v7, "setContentInset:", 0.0, 0.0, v6, 0.0);

  id v8 = [(GKSignInViewController *)self scrollView];
  objc_msgSend(v8, "setScrollIndicatorInsets:", 0.0, 0.0, v6, 0.0);

  self->_currentContentInsets.top = 0.0;
  self->_currentContentInsets.left = 0.0;
  self->_currentContentInsets.bottom = v6;
  self->_currentContentInsets.right = 0.0;
  id v9 = [(GKSignInViewController *)self view];
  [v9 frame];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  double v17 = v16;

  CGFloat v18 = v17 - v6;
  id v19 = [(GKSignInViewController *)self inlineSignInViewController];
  id v20 = [v19 view];
  [v20 frame];
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;

  uint64_t v29 = [(GKSignInViewController *)self scrollView];
  [v29 contentOffset];
  double v31 = v24 - v30;

  v36.origin.x = v11;
  v36.origin.y = v13;
  v36.size.width = v15;
  v36.size.height = v18;
  v35.x = v22;
  v35.y = v31;
  if (!CGRectContainsPoint(v36, v35))
  {
    v32 = [(GKSignInViewController *)self scrollView];
    objc_msgSend(v32, "scrollRectToVisible:animated:", 1, v22, v31, v26, v28);
  }
}

- (void)keyboardWillHide:(id)a3
{
  double v4 = *MEMORY[0x1E4FB2848];
  double v5 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v6 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v7 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  id v8 = [(GKSignInViewController *)self scrollView];
  objc_msgSend(v8, "setContentInset:", v4, v5, v6, v7);

  self->_currentContentInsets.top = v4;
  self->_currentContentInsets.left = v5;
  self->_currentContentInsets.bottom = v6;
  self->_currentContentInsets.right = v7;
  id v9 = [(GKSignInViewController *)self scrollView];
  objc_msgSend(v9, "setScrollIndicatorInsets:", v4, v5, v6, v7);
}

- (NSString)appleID
{
  return self->_appleID;
}

- (void)setAppleID:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (BOOL)disablesSignIn
{
  return self->_disablesSignIn;
}

- (void)setDisablesSignIn:(BOOL)a3
{
  self->_disablesSignIn = a3;
}

- (UIViewController)remoteUIPresentingViewController
{
  return self->_remoteUIPresentingViewController;
}

- (void)setRemoteUIPresentingViewController:(id)a3
{
}

- (BOOL)isLoadingRemoteUI
{
  return self->_loadingRemoteUI;
}

- (void)setLoadingRemoteUI:(BOOL)a3
{
  self->_loadingRemoteUI = a3;
}

- (GKSignInView)signInView
{
  return self->_signInView;
}

- (void)setSignInView:(id)a3
{
}

- (UIActivityIndicatorView)progressIndicator
{
  return self->_progressIndicator;
}

- (void)setProgressIndicator:(id)a3
{
}

- (UILabel)signInLabel
{
  return self->_signInLabel;
}

- (void)setSignInLabel:(id)a3
{
}

- (UILabel)loginPromptLabel
{
  return self->_loginPromptLabel;
}

- (void)setLoginPromptLabel:(id)a3
{
}

- (GKSignInInputView)signInInputView
{
  return self->_signInInputView;
}

- (void)setSignInInputView:(id)a3
{
}

- (BOOL)constraintsCreated
{
  return self->_constraintsCreated;
}

- (void)setConstraintsCreated:(BOOL)a3
{
  self->_constraintsCreated = a3;
}

- (UIEdgeInsets)currentContentInsets
{
  double top = self->_currentContentInsets.top;
  double left = self->_currentContentInsets.left;
  double bottom = self->_currentContentInsets.bottom;
  double right = self->_currentContentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setCurrentContentInsets:(UIEdgeInsets)a3
{
  self->_currentContentInsets = a3;
}

- (UIEdgeInsets)contentInsetsBeforeKeyboard
{
  double top = self->_contentInsetsBeforeKeyboard.top;
  double left = self->_contentInsetsBeforeKeyboard.left;
  double bottom = self->_contentInsetsBeforeKeyboard.bottom;
  double right = self->_contentInsetsBeforeKeyboard.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setContentInsetsBeforeKeyboard:(UIEdgeInsets)a3
{
  self->_contentInsetsBeforeKeyboard = a3;
}

- (UIEdgeInsets)scrollIndicatorInsetsBeforeKeyboard
{
  double top = self->_scrollIndicatorInsetsBeforeKeyboard.top;
  double left = self->_scrollIndicatorInsetsBeforeKeyboard.left;
  double bottom = self->_scrollIndicatorInsetsBeforeKeyboard.bottom;
  double right = self->_scrollIndicatorInsetsBeforeKeyboard.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setScrollIndicatorInsetsBeforeKeyboard:(UIEdgeInsets)a3
{
  self->_scrollIndicatorInsetsBeforeKeyboard = a3;
}

- (UIImageView)bubbleImageView
{
  return self->_bubbleImageView;
}

- (void)setBubbleImageView:(id)a3
{
}

- (AKInlineSignInViewController)inlineSignInViewController
{
  return self->_inlineSignInViewController;
}

- (void)setInlineSignInViewController:(id)a3
{
}

- (AKAppleIDAuthenticationInAppContext)authContext
{
  return self->_authContext;
}

- (void)setAuthContext:(id)a3
{
}

- (double)fullWidthContentWidthConstraintConstant
{
  return self->_fullWidthContentWidthConstraintConstant;
}

- (void)setFullWidthContentWidthConstraintConstant:(double)a3
{
  self->_fullWidthContentWidthConstraintConstant = a3;
}

- (double)horizontalPaddingConstraintConstant
{
  return self->_horizontalPaddingConstraintConstant;
}

- (void)setHorizontalPaddingConstraintConstant:(double)a3
{
  self->_horizontalPaddingConstraintConstant = a3;
}

- (double)labelWidthConstraintConstant
{
  return self->_labelWidthConstraintConstant;
}

- (void)setLabelWidthConstraintConstant:(double)a3
{
  self->_labelWidthConstraintConstant = a3;
}

- (NSMutableArray)fullWidthViewConstraints
{
  return self->_fullWidthViewConstraints;
}

- (void)setFullWidthViewConstraints:(id)a3
{
}

- (RemoteUIController)remoteU13Controller
{
  return self->_remoteU13Controller;
}

- (void)setRemoteU13Controller:(id)a3
{
}

- (UINavigationController)u13NavigationController
{
  return self->_u13NavigationController;
}

- (void)setU13NavigationController:(id)a3
{
}

- (NSMutableArray)u13ObjectModels
{
  return self->_u13ObjectModels;
}

- (void)setU13ObjectModels:(id)a3
{
}

- (GKDispatchGroup)u13Group
{
  return self->_u13Group;
}

- (void)setU13Group:(id)a3
{
}

- (BOOL)userShouldSkipCreateAppleID
{
  return self->_userShouldSkipCreateAppleID;
}

- (void)setUserShouldSkipCreateAppleID:(BOOL)a3
{
  self->_userShouldSkipCreateAppleID = a3;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (GKGame)game
{
  return self->_game;
}

- (void)setGame:(id)a3
{
}

- (GKAccountRemoteUIController)accountController
{
  return self->_accountController;
}

- (void)setAccountController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountController, 0);
  objc_storeStrong((id *)&self->_game, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_u13Group, 0);
  objc_storeStrong((id *)&self->_u13ObjectModels, 0);
  objc_storeStrong((id *)&self->_u13NavigationController, 0);
  objc_storeStrong((id *)&self->_remoteU13Controller, 0);
  objc_storeStrong((id *)&self->_fullWidthViewConstraints, 0);
  objc_storeStrong((id *)&self->_authContext, 0);
  objc_storeStrong((id *)&self->_inlineSignInViewController, 0);
  objc_storeStrong((id *)&self->_bubbleImageView, 0);
  objc_storeStrong((id *)&self->_signInInputView, 0);
  objc_storeStrong((id *)&self->_loginPromptLabel, 0);
  objc_storeStrong((id *)&self->_signInLabel, 0);
  objc_storeStrong((id *)&self->_progressIndicator, 0);
  objc_storeStrong((id *)&self->_signInView, 0);
  objc_storeStrong((id *)&self->_remoteUIPresentingViewController, 0);
  objc_storeStrong(&self->_completionHandler, 0);

  objc_storeStrong((id *)&self->_appleID, 0);
}

- (void)signInController:(void *)a1 didCompleteWithOperationsResults:(void *)a2 .cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  double v4 = [a2 error];
  int v5 = 138412290;
  double v6 = v4;
  _os_log_error_impl(&dword_1AF250000, v3, OS_LOG_TYPE_ERROR, "signInController:didCompleteWithOperationsResults returned error: %@", (uint8_t *)&v5, 0xCu);
}

- (void)remoteUIControllerDidDismiss:.cold.1()
{
}

- (void)remoteUIControllerDidDismiss:.cold.2()
{
}

@end
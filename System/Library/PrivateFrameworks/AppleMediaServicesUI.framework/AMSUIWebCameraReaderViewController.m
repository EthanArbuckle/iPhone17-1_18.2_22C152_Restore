@interface AMSUIWebCameraReaderViewController
+ (BOOL)cameraSupported;
- (AMSUIWebAppearance)appearance;
- (AMSUIWebCameraReaderInfoView)infoView;
- (AMSUIWebCameraReaderPageModel)model;
- (AMSUIWebCameraReaderViewController)initWithContext:(id)a3;
- (AMSUIWebCameraTextField)textField;
- (AMSUIWebClientContext)context;
- (AMSUIWebNavigationBarModel)navigationBarModel;
- (BOOL)textFieldShouldReturn:(id)a3;
- (CGRect)keyboardRect;
- (NSDictionary)output;
- (UIView)overlay;
- (UIView)textFieldSafeAreaBackdrop;
- (UIViewController)childController;
- (id)_cameraReader;
- (id)_makeTextFieldWithPlaceholderColor:(id)a3;
- (id)_outputForCreditCardReaderObjects:(id)a3;
- (id)_outputForGiftCardReaderCode:(id)a3;
- (id)_outputForGiftCardReaderObjects:(id)a3;
- (id)_outputForIDCardReaderObjects:(id)a3;
- (void)_applyAppearance;
- (void)_commitNavigationBarModel;
- (void)_handleCameraOutput:(id)a3 error:(id)a4;
- (void)_hideKeyboard;
- (void)_layoutFullScreen;
- (void)_layoutHalfScreen;
- (void)_layoutPage;
- (void)_layoutTextField;
- (void)_redeemAction;
- (void)_setCameraToggleButton;
- (void)_setCancelButton;
- (void)_setChild:(id)a3;
- (void)_setRedeemButton;
- (void)_setupCameraReader;
- (void)_setupCameraToggle;
- (void)_setupInfoView;
- (void)_setupNavigationModel;
- (void)_setupPage;
- (void)_setupPageForCreditCard;
- (void)_setupPageForGiftCard;
- (void)_setupPageForIDCard;
- (void)_setupTextEntry;
- (void)cameraReader:(id)a3 didFailWithError:(id)a4;
- (void)cameraReader:(id)a3 didRecognizeObjects:(id)a4;
- (void)cameraReaderDidCancel:(id)a3;
- (void)cameraReaderDidEnd:(id)a3;
- (void)codeRedeemerController:(id)a3 didEndWithInfo:(id)a4;
- (void)codeRedeemerControllerDidCancel:(id)a3;
- (void)dealloc;
- (void)keyboardDidHide:(id)a3;
- (void)keyboardWillHide:(id)a3;
- (void)keyboardWillShow:(id)a3;
- (void)loadView;
- (void)setAppearance:(id)a3;
- (void)setChildController:(id)a3;
- (void)setContext:(id)a3;
- (void)setInfoView:(id)a3;
- (void)setKeyboardRect:(CGRect)a3;
- (void)setModel:(id)a3;
- (void)setNavigationBarModel:(id)a3;
- (void)setOutput:(id)a3;
- (void)setOverlay:(id)a3;
- (void)setTextField:(id)a3;
- (void)setTextFieldSafeAreaBackdrop:(id)a3;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)willPresentPageModel:(id)a3 appearance:(id)a4;
@end

@implementation AMSUIWebCameraReaderViewController

- (AMSUIWebCameraReaderViewController)initWithContext:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSUIWebCameraReaderViewController;
  v6 = [(AMSUICommonViewController *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    v8 = objc_alloc_init(AMSUIWebNavigationBarModel);
    navigationBarModel = v7->_navigationBarModel;
    v7->_navigationBarModel = v8;
  }
  return v7;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F83808] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F83800] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F837A0] object:0];

  v4.receiver = self;
  v4.super_class = (Class)AMSUIWebCameraReaderViewController;
  [(AMSUICommonViewController *)&v4 dealloc];
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)AMSUIWebCameraReaderViewController;
  [(AMSUICommonViewController *)&v3 loadView];
  [(AMSUIWebCameraReaderViewController *)self _applyAppearance];
  [(AMSUIWebCameraReaderViewController *)self _setupPage];
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)AMSUIWebCameraReaderViewController;
  [(AMSUIWebCameraReaderViewController *)&v3 viewWillLayoutSubviews];
  [(AMSUIWebCameraReaderViewController *)self _layoutPage];
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v13.receiver = self;
  v13.super_class = (Class)AMSUIWebCameraReaderViewController;
  [(AMSUIWebCameraReaderViewController *)&v13 viewWillAppear:a3];
  objc_super v4 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v4)
  {
    objc_super v4 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = objc_opt_class();
    v7 = [(AMSUIWebCameraReaderViewController *)self context];
    v8 = [v7 logKey];
    *(_DWORD *)buf = 138543618;
    uint64_t v15 = v6;
    __int16 v16 = 2114;
    v17 = v8;
    _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Presenting camera reader", buf, 0x16u);
  }
  v9 = [(AMSUIWebCameraReaderViewController *)self _cameraReader];

  if (!v9)
  {
    v10 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v10)
    {
      v10 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    objc_super v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      uint64_t v15 = v12;
      _os_log_impl(&dword_21C134000, v11, OS_LOG_TYPE_INFO, "%{public}@: setting up camera session", buf, 0xCu);
    }

    [(AMSUIWebCameraReaderViewController *)self _setupCameraReader];
  }
  [(AMSUIWebCameraReaderViewController *)self _applyAppearance];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AMSUIWebCameraReaderViewController;
  [(AMSUIWebCameraReaderViewController *)&v6 viewDidAppear:a3];
  uint64_t v4 = *MEMORY[0x263EF9D48];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __52__AMSUIWebCameraReaderViewController_viewDidAppear___block_invoke;
  v5[3] = &unk_2643E4568;
  v5[4] = self;
  [MEMORY[0x263EFA598] requestAccessForMediaType:v4 completionHandler:v5];
}

void __52__AMSUIWebCameraReaderViewController_viewDidAppear___block_invoke(uint64_t a1, char a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a2)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __52__AMSUIWebCameraReaderViewController_viewDidAppear___block_invoke_35;
    block[3] = &unk_2643E3118;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    objc_super v3 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v3)
    {
      objc_super v3 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    uint64_t v4 = [v3 OSLogObject];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = objc_opt_class();
      objc_super v6 = [*(id *)(a1 + 32) context];
      v7 = [v6 logKey];
      *(_DWORD *)buf = 138543618;
      uint64_t v13 = v5;
      __int16 v14 = 2114;
      uint64_t v15 = v7;
      _os_log_impl(&dword_21C134000, v4, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] denied camera access", buf, 0x16u);
    }
    v8 = [*(id *)(a1 + 32) context];
    v9 = [v8 dataProvider];
    id v10 = (id)[v9 postEvent:@"VideoAuthorizationDenied" options:MEMORY[0x263EFFA78]];
  }
}

void __52__AMSUIWebCameraReaderViewController_viewDidAppear___block_invoke_35(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v2)
  {
    v2 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  objc_super v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = [*(id *)(a1 + 32) context];
    objc_super v6 = [v5 logKey];
    int v8 = 138543618;
    uint64_t v9 = v4;
    __int16 v10 = 2114;
    objc_super v11 = v6;
    _os_log_impl(&dword_21C134000, v3, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] starting camera session", (uint8_t *)&v8, 0x16u);
  }
  v7 = [*(id *)(a1 + 32) _cameraReader];
  [v7 start];
}

- (void)viewDidDisappear:(BOOL)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)AMSUIWebCameraReaderViewController;
  [(AMSUIWebCameraReaderViewController *)&v17 viewDidDisappear:a3];
  uint64_t v4 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v4)
  {
    uint64_t v4 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  uint64_t v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    uint64_t v19 = v6;
    _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_INFO, "%{public}@: evaluating camera session teardown", buf, 0xCu);
  }

  v7 = [(AMSUIWebCameraReaderViewController *)self model];
  if ([v7 prefersSessionTeardown])
  {
  }
  else
  {
    int v8 = [(AMSUIWebCameraReaderViewController *)self context];
    int v9 = [v8 reducedMemoryMode];

    if (!v9) {
      return;
    }
  }
  __int16 v10 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v10)
  {
    __int16 v10 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  objc_super v11 = [v10 OSLogObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = [(AMSUIWebCameraReaderViewController *)self context];
    __int16 v14 = [v13 logKey];
    *(_DWORD *)buf = 138543618;
    uint64_t v19 = v12;
    __int16 v20 = 2114;
    v21 = v14;
    _os_log_impl(&dword_21C134000, v11, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] cancelling camera session", buf, 0x16u);
  }
  uint64_t v15 = [(AMSUIWebCameraReaderViewController *)self _cameraReader];
  [v15 cancel];

  uint64_t v16 = [(AMSUIWebCameraReaderViewController *)self _cameraReader];
  objc_msgSend(v16, "ams_removeFromParentViewController");

  [(AMSUIWebCameraReaderViewController *)self setChildController:0];
}

+ (BOOL)cameraSupported
{
  return [MEMORY[0x263F37E00] supportedCameraCount] != 0;
}

- (void)_setChild:(id)a3
{
  id v4 = a3;
  [(AMSUIWebCameraReaderViewController *)self setChildController:v4];
  [(UIViewController *)self ams_setChildViewController:v4];
}

- (void)_setupPage
{
  [(AMSUIWebCameraReaderViewController *)self _setupCameraReader];
  [(AMSUIWebCameraReaderViewController *)self _setupInfoView];
  [(AMSUIWebCameraReaderViewController *)self _setupCameraToggle];
  [(AMSUIWebCameraReaderViewController *)self _setupTextEntry];
  id v6 = [(AMSUIWebCameraReaderViewController *)self model];
  if ([v6 isFullScreen])
  {
    objc_super v3 = [(AMSUIWebCameraReaderViewController *)self model];
    id v4 = [v3 navigationBar];
    uint64_t v5 = [v4 style];

    if (v5 != 9)
    {
      [(AMSUIWebCameraReaderViewController *)self _setupNavigationModel];
      [(AMSUIWebCameraReaderViewController *)self _commitNavigationBarModel];
    }
  }
  else
  {
  }
}

- (void)_setupCameraReader
{
  objc_super v3 = [(AMSUIWebCameraReaderViewController *)self model];
  uint64_t v4 = [v3 pageType];

  switch(v4)
  {
    case 2:
      [(AMSUIWebCameraReaderViewController *)self _setupPageForIDCard];
      break;
    case 1:
      [(AMSUIWebCameraReaderViewController *)self _setupPageForGiftCard];
      break;
    case 0:
      [(AMSUIWebCameraReaderViewController *)self _setupPageForCreditCard];
      break;
  }
}

- (void)_setupInfoView
{
  objc_super v3 = [(AMSUIWebCameraReaderViewController *)self model];
  char v4 = [v3 isFullScreen];

  if ((v4 & 1) == 0)
  {
    uint64_t v5 = [AMSUIWebCameraReaderInfoView alloc];
    id v6 = -[AMSUIWebCameraReaderInfoView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [(AMSUIWebCameraReaderViewController *)self setInfoView:v6];

    v7 = [(AMSUIWebCameraReaderViewController *)self model];
    int v8 = [v7 primaryLabel];
    int v9 = [(AMSUIWebCameraReaderViewController *)self infoView];
    __int16 v10 = [v9 primaryLabel];
    [v10 setText:v8];

    objc_super v11 = [(AMSUIWebCameraReaderViewController *)self model];
    uint64_t v12 = [v11 secondaryLabel];
    uint64_t v13 = [(AMSUIWebCameraReaderViewController *)self infoView];
    __int16 v14 = [v13 secondaryLabel];
    [v14 setText:v12];

    uint64_t v15 = [(AMSUIWebCameraReaderViewController *)self infoView];
    uint64_t v16 = [v15 bottomLink];
    objc_super v17 = [(AMSUIWebCameraReaderViewController *)self model];
    uint64_t v18 = [v17 bottomLinkLabel];
    uint64_t v19 = (void *)v18;
    if (v18) {
      __int16 v20 = (__CFString *)v18;
    }
    else {
      __int16 v20 = &stru_26CC491D8;
    }
    [v16 setTitle:v20 forState:0];

    v21 = [(AMSUIWebCameraReaderViewController *)self model];
    uint64_t v22 = [v21 bottomLinkAction];
    v23 = [(AMSUIWebCameraReaderViewController *)self infoView];
    [v23 setBottomLinkAction:v22];

    id v24 = [(AMSUICommonViewController *)self view];
    [v24 addSubview:self->_infoView];
  }
}

- (void)_setupTextEntry
{
  id v21 = [(AMSUIWebCameraReaderViewController *)self model];
  if ([v21 allowsTextEntry])
  {
    objc_super v3 = [(AMSUIWebCameraReaderViewController *)self model];
    int v4 = [v3 isFullScreen];

    if (!v4) {
      return;
    }
    id v21 = [MEMORY[0x263F824D8] effectWithStyle:10];
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F82E50]) initWithEffect:v21];
    [(AMSUIWebCameraReaderViewController *)self setTextFieldSafeAreaBackdrop:v5];
    id v6 = [(AMSUICommonViewController *)self view];
    v7 = [(AMSUIWebCameraReaderViewController *)self textFieldSafeAreaBackdrop];
    [v6 addSubview:v7];

    id v8 = objc_alloc_init(MEMORY[0x263F82CB0]);
    [v8 addTarget:self action:sel__overlayTapGestureAction_];
    id v9 = objc_alloc_init(MEMORY[0x263F82E00]);
    [(AMSUIWebCameraReaderViewController *)self setOverlay:v9];

    __int16 v10 = [(AMSUIWebCameraReaderViewController *)self overlay];
    objc_super v11 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:1.0];
    [v10 setBackgroundColor:v11];

    uint64_t v12 = [(AMSUIWebCameraReaderViewController *)self overlay];
    [v12 setAlpha:0.0];

    uint64_t v13 = [(AMSUIWebCameraReaderViewController *)self overlay];
    [v13 addGestureRecognizer:v8];

    __int16 v14 = [(AMSUICommonViewController *)self view];
    uint64_t v15 = [v14 tintColor];
    uint64_t v16 = [(AMSUIWebCameraReaderViewController *)self _makeTextFieldWithPlaceholderColor:v15];

    [v16 setClearsPlaceholderOnBeginEditing:0];
    [v16 setDelegate:self];
    objc_super v17 = [(AMSUIWebCameraReaderViewController *)self model];
    uint64_t v18 = [v17 textFieldPlaceholder];
    [v16 setPlaceholder:v18];

    [(AMSUIWebCameraReaderViewController *)self setTextField:v16];
    uint64_t v19 = [(AMSUICommonViewController *)self view];
    [v19 addSubview:v16];

    __int16 v20 = [MEMORY[0x263F08A00] defaultCenter];
    [v20 addObserver:self selector:sel_keyboardWillShow_ name:*MEMORY[0x263F83808] object:0];
    [v20 addObserver:self selector:sel_keyboardWillHide_ name:*MEMORY[0x263F83800] object:0];
    [v20 addObserver:self selector:sel_keyboardDidHide_ name:*MEMORY[0x263F837A0] object:0];
  }
}

- (id)_makeTextFieldWithPlaceholderColor:(id)a3
{
  v19[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F81708] systemFontOfSize:16.0];
  uint64_t v6 = *MEMORY[0x263F814F0];
  v19[0] = v5;
  uint64_t v7 = *MEMORY[0x263F81500];
  v18[0] = v6;
  v18[1] = v7;
  id v8 = v4;
  if (!v4)
  {
    id v8 = [MEMORY[0x263F825C8] colorWithWhite:0.7 alpha:1.0];
  }
  v19[1] = v8;
  id v9 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
  if (!v4) {

  }
  id v10 = objc_alloc(MEMORY[0x263F086A0]);
  objc_super v11 = [(AMSUIWebCameraReaderViewController *)self model];
  uint64_t v12 = [v11 textFieldPlaceholder];
  uint64_t v13 = (void *)v12;
  if (v12) {
    __int16 v14 = (__CFString *)v12;
  }
  else {
    __int16 v14 = &stru_26CC491D8;
  }
  uint64_t v15 = (void *)[v10 initWithString:v14 attributes:v9];

  uint64_t v16 = -[AMSUIWebCameraTextField initWithFrame:]([AMSUIWebCameraTextField alloc], "initWithFrame:", 0.0, 0.0, 1.0, 44.0);
  [(AMSUIWebCameraTextField *)v16 setAutocorrectionType:1];
  [(AMSUIWebCameraTextField *)v16 setAutocapitalizationType:3];
  [(AMSUIWebCameraTextField *)v16 setFont:v5];
  [(AMSUIWebCameraTextField *)v16 setAttributedPlaceholder:v15];

  return v16;
}

- (void)_layoutPage
{
  objc_super v3 = [(AMSUIWebCameraReaderViewController *)self model];
  int v4 = [v3 isFullScreen];

  if (v4) {
    [(AMSUIWebCameraReaderViewController *)self _layoutFullScreen];
  }
  else {
    [(AMSUIWebCameraReaderViewController *)self _layoutHalfScreen];
  }
  [(AMSUIWebCameraReaderViewController *)self _layoutTextField];
}

- (void)_layoutHalfScreen
{
  objc_super v3 = [(AMSUICommonViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v11 * 0.66;
  uint64_t v13 = [(AMSUIWebCameraReaderViewController *)self childController];
  __int16 v14 = [v13 view];
  objc_msgSend(v14, "setFrame:", v5, v7, v9, v12);

  uint64_t v15 = [(AMSUICommonViewController *)self view];
  [v15 bounds];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  id v22 = [(AMSUIWebCameraReaderViewController *)self infoView];
  objc_msgSend(v22, "setFrame:", v17, v12, v19, v21 - v12);
}

- (void)_layoutFullScreen
{
  objc_super v3 = [(AMSUICommonViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v12 = [(AMSUIWebCameraReaderViewController *)self childController];
  uint64_t v13 = [v12 view];
  objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);

  id v14 = [(AMSUIWebCameraReaderViewController *)self infoView];
  [v14 setHidden:1];
}

- (void)_layoutTextField
{
  objc_super v3 = [(AMSUIWebCameraReaderViewController *)self textField];

  if (!v3) {
    return;
  }
  double v4 = [(AMSUICommonViewController *)self view];
  [v4 safeAreaInsets];
  double v6 = v5;

  double v7 = [(AMSUIWebCameraReaderViewController *)self textField];
  if (![v7 isFirstResponder])
  {

    goto LABEL_7;
  }
  [(AMSUIWebCameraReaderViewController *)self keyboardRect];
  BOOL v8 = CGRectEqualToRect(v24, *MEMORY[0x263F001A8]);

  if (v8)
  {
LABEL_7:
    id v14 = [(AMSUIWebCameraReaderViewController *)self textField];
    uint64_t v15 = [(AMSUICommonViewController *)self view];
    [v15 bounds];
    double v17 = v16 + -44.0 - v6;
    double v18 = [(AMSUICommonViewController *)self view];
    [v18 bounds];
    objc_msgSend(v14, "setFrame:", 0.0, v17);

    id v22 = [(AMSUIWebCameraReaderViewController *)self textFieldSafeAreaBackdrop];
    uint64_t v13 = [(AMSUICommonViewController *)self view];
    [v13 bounds];
    double v20 = v19 + -44.0 - v6;
    double v21 = [(AMSUICommonViewController *)self view];
    [v21 bounds];
    objc_msgSend(v22, "setFrame:", 0.0, v20);

    goto LABEL_8;
  }
  double v9 = [(AMSUIWebCameraReaderViewController *)self textField];
  CGFloat v10 = CGRectGetMinY(self->_keyboardRect) + -44.0;
  double v11 = [(AMSUICommonViewController *)self view];
  [v11 bounds];
  objc_msgSend(v9, "setFrame:", 0.0, v10);

  id v22 = [(AMSUIWebCameraReaderViewController *)self textFieldSafeAreaBackdrop];
  CGFloat v12 = CGRectGetMinY(self->_keyboardRect) + -44.0;
  uint64_t v13 = [(AMSUICommonViewController *)self view];
  [v13 bounds];
  objc_msgSend(v22, "setFrame:", 0.0, v12);
LABEL_8:
}

- (void)_commitNavigationBarModel
{
  objc_super v3 = [(AMSUIWebCameraReaderViewController *)self navigationBarModel];
  [v3 setStyle:5];

  double v4 = [(AMSUIWebCameraReaderViewController *)self context];
  double v5 = [v4 flowController];
  id v7 = [v5 currentContainer];

  double v6 = [(AMSUIWebCameraReaderViewController *)self navigationBarModel];
  [v7 applyNavigationModel:v6];
}

- (void)_setupNavigationModel
{
  id v5 = [(AMSUIWebCameraReaderViewController *)self model];
  objc_super v3 = [v5 primaryLabel];
  double v4 = [(AMSUIWebCameraReaderViewController *)self navigationBarModel];
  [v4 setTitle:v3];
}

- (void)_setupCameraToggle
{
  objc_super v3 = [(AMSUIWebCameraReaderViewController *)self model];
  int v4 = [v3 allowsCameraToggle];

  if (v4)
  {
    [(AMSUIWebCameraReaderViewController *)self _setCameraToggleButton];
    [(AMSUIWebCameraReaderViewController *)self _setCancelButton];
    [(AMSUIWebCameraReaderViewController *)self _commitNavigationBarModel];
  }
}

- (void)_setCancelButton
{
  objc_super v3 = [AMSUIWebFlowAction alloc];
  int v4 = [(AMSUIWebCameraReaderViewController *)self context];
  CGFloat v10 = [(AMSUIWebFlowAction *)v3 initWithContext:v4];

  [(AMSUIWebFlowAction *)v10 setPresentationType:4];
  id v5 = objc_alloc_init(AMSUIWebButtonModel);
  double v6 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.AppleMediaServicesUI"];
  id v7 = AMSUILocalizedStringFromBundle(@"CANCEL", 0, v6);
  [(AMSUIWebButtonModel *)v5 setTitle:v7];

  [(AMSUIWebButtonModel *)v5 setAction:v10];
  [(AMSUIWebButtonModel *)v5 setEnabled:1];
  [(AMSUIWebButtonModel *)v5 setStyle:3];
  BOOL v8 = objc_alloc_init(AMSUIWebBarButtonItemModel);
  [(AMSUIWebBarButtonItemModel *)v8 setButtonModel:v5];
  double v9 = [(AMSUIWebCameraReaderViewController *)self navigationBarModel];
  [v9 setLeftBarButtonItemModel:v8];
}

- (void)_setRedeemButton
{
  objc_super v3 = objc_alloc_init(AMSUIWebButtonModel);
  int v4 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.AppleMediaServicesUI"];
  id v5 = AMSUILocalizedStringFromBundle(@"REDEEM", 0, v4);
  [(AMSUIWebButtonModel *)v3 setTitle:v5];

  [(AMSUIWebButtonModel *)v3 setEnabled:1];
  [(AMSUIWebButtonModel *)v3 setStyle:0];
  objc_initWeak(&location, self);
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  CGFloat v10 = __54__AMSUIWebCameraReaderViewController__setRedeemButton__block_invoke;
  double v11 = &unk_2643E37D0;
  objc_copyWeak(&v12, &location);
  [(AMSUIWebButtonModel *)v3 setActionBlock:&v8];
  double v6 = objc_alloc_init(AMSUIWebBarButtonItemModel);
  -[AMSUIWebBarButtonItemModel setButtonModel:](v6, "setButtonModel:", v3, v8, v9, v10, v11);
  id v7 = [(AMSUIWebCameraReaderViewController *)self navigationBarModel];
  [v7 setRightBarButtonItemModel:v6];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __54__AMSUIWebCameraReaderViewController__setRedeemButton__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _redeemAction];
}

- (void)_setCameraToggleButton
{
  objc_super v3 = objc_alloc_init(AMSUIWebButtonModel);
  [(AMSUIWebButtonModel *)v3 setSystemImageName:@"arrow.triangle.2.circlepath.camera"];
  [(AMSUIWebButtonModel *)v3 setEnabled:1];
  [(AMSUIWebButtonModel *)v3 setStyle:0];
  objc_initWeak(&location, self);
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  uint64_t v8 = __60__AMSUIWebCameraReaderViewController__setCameraToggleButton__block_invoke;
  uint64_t v9 = &unk_2643E37D0;
  objc_copyWeak(&v10, &location);
  [(AMSUIWebButtonModel *)v3 setActionBlock:&v6];
  int v4 = objc_alloc_init(AMSUIWebBarButtonItemModel);
  -[AMSUIWebBarButtonItemModel setButtonModel:](v4, "setButtonModel:", v3, v6, v7, v8, v9);
  id v5 = [(AMSUIWebCameraReaderViewController *)self navigationBarModel];
  [v5 setRightBarButtonItemModel:v4];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __60__AMSUIWebCameraReaderViewController__setCameraToggleButton__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained _cameraReader];
  [v1 toggleCamera];
}

- (id)_outputForCreditCardReaderObjects:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v29;
    uint64_t v8 = *MEMORY[0x263F37DE8];
    uint64_t v9 = *MEMORY[0x263F37DD8];
    uint64_t v10 = *MEMORY[0x263F37DE0];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v13 = [v12 type];
        int v14 = [v13 isEqual:v8];

        if (v14)
        {
          uint64_t v15 = [v12 stringValue];
          [v4 setObject:v15 forKeyedSubscript:@"cardNumber"];
        }
        double v16 = [v12 type];
        int v17 = [v16 isEqual:v9];

        if (v17)
        {
          double v18 = [v12 stringValue];
          [v4 setObject:v18 forKeyedSubscript:@"cardholderName"];
        }
        double v19 = [v12 type];
        int v20 = [v19 isEqual:v10];

        if (v20)
        {
          id v21 = v12;
          id v22 = [v21 dayValue];
          [v4 setObject:v22 forKeyedSubscript:@"cardExpirationDay"];

          v23 = [v21 monthValue];
          [v4 setObject:v23 forKeyedSubscript:@"cardExpirationMonth"];

          CGRect v24 = [v21 yearValue];
          [v4 setObject:v24 forKeyedSubscript:@"cardExpirationYear"];

          v25 = [v21 stringValue];

          [v4 setObject:v25 forKeyedSubscript:@"cardExpirationString"];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v6);
  }

  return v4;
}

- (void)_setupPageForCreditCard
{
  v6[3] = *MEMORY[0x263EF8340];
  if ([(id)objc_opt_class() cameraSupported])
  {
    id v3 = objc_alloc_init(MEMORY[0x263F37E00]);
    [v3 setHidePlacementText:1];
    [v3 setDelegate:self];
    uint64_t v4 = *MEMORY[0x263F37DD8];
    v6[0] = *MEMORY[0x263F37DE8];
    v6[1] = v4;
    v6[2] = *MEMORY[0x263F37DE0];
    uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:3];
    [v3 setOutputObjectTypes:v5];

    [(AMSUIWebCameraReaderViewController *)self _setChild:v3];
  }
}

- (void)_setupPageForGiftCard
{
  if ([MEMORY[0x263F37E18] isCRCodeRedeemerAvailable])
  {
    id v3 = objc_alloc_init(MEMORY[0x263F37E18]);
    [v3 setDelegate:self];
    [(AMSUIWebCameraReaderViewController *)self _setChild:v3];
  }
}

- (id)_outputForGiftCardReaderObjects:(id)a3
{
  uint64_t v4 = [a3 valueForKey:*MEMORY[0x263F37DC8]];
  if (v4)
  {
    uint64_t v5 = [(AMSUIWebCameraReaderViewController *)self _outputForGiftCardReaderCode:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)_outputForGiftCardReaderCode:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v5 = v4;
  if (v3) {
    [v4 setObject:v3 forKeyedSubscript:@"giftCardCode"];
  }
  if ([v5 count]) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  return v7;
}

- (void)_setupPageForIDCard
{
  v6[2] = *MEMORY[0x263EF8340];
  if ([(id)objc_opt_class() cameraSupported])
  {
    id v3 = objc_alloc_init(MEMORY[0x263F37E00]);
    [v3 setHidePlacementText:1];
    [v3 setDelegate:self];
    uint64_t v4 = *MEMORY[0x263F37DF0];
    v6[0] = *MEMORY[0x263F37DF8];
    v6[1] = v4;
    uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
    [v3 setOutputObjectTypes:v5];

    [(AMSUIWebCameraReaderViewController *)self _setChild:v3];
  }
}

- (id)_outputForIDCardReaderObjects:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    uint64_t v9 = *MEMORY[0x263F37DF8];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        double v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v12 = objc_msgSend(v11, "type", (void)v20);
        int v13 = [v12 isEqual:v9];

        if (v13)
        {
          id v14 = v11;
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v15 = v14;
          }
          else {
            id v15 = 0;
          }

          if (v15)
          {
            double v16 = [v15 imageValue];
            int v17 = UIImagePNGRepresentation(v16);
            double v18 = [v17 base64EncodedStringWithOptions:0];
            [v4 setObject:v18 forKeyedSubscript:@"cardImage"];
            [v4 setObject:@"image/png" forKeyedSubscript:@"mimeType"];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)_applyAppearance
{
  id v9 = [(AMSUIWebCameraReaderViewController *)self appearance];
  id v3 = [v9 backgroundColor];
  id v4 = v3;
  if (!v3)
  {
    id v4 = +[AMSUIWebAppearance defaultPlatformBackgroundColor];
  }
  id v5 = [(AMSUICommonViewController *)self view];
  objc_msgSend(v5, "ams_setBackgroundColor:", v4);

  if (!v3) {
  uint64_t v6 = [v9 backgroundColor];
  }
  uint64_t v7 = v6;
  if (!v6)
  {
    uint64_t v7 = +[AMSUIWebAppearance defaultPlatformBackgroundColor];
  }
  uint64_t v8 = [(AMSUIWebCameraReaderViewController *)self infoView];
  objc_msgSend(v8, "ams_setBackgroundColor:", v7);

  if (!v6) {
}
  }

- (id)_cameraReader
{
  v2 = [(AMSUIWebCameraReaderViewController *)self childController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (void)_handleCameraOutput:(id)a3 error:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 count];
  if (!v7 && !v8)
  {
    AMSError();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v9 = [(AMSUIWebCameraReaderViewController *)self context];
  uint64_t v10 = [v9 logKey];
  double v11 = AMSUIWebSetSubLogKey(v10, 0);

  id v12 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v12)
  {
    id v12 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  int v13 = [v12 OSLogObject];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v25 = objc_opt_class();
    __int16 v26 = 2114;
    v27 = v11;
    _os_log_impl(&dword_21C134000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Sending event", buf, 0x16u);
  }

  v22[0] = @"output";
  id v14 = v6;
  if (!v6)
  {
    id v14 = objc_msgSend(MEMORY[0x263EFF9D0], "null", v22[0]);
  }
  v22[1] = @"error";
  v23[0] = v14;
  id v15 = AMSUIWebJSError(v7);
  double v16 = v15;
  if (!v15)
  {
    double v16 = [MEMORY[0x263EFF9D0] null];
  }
  v23[1] = v16;
  int v17 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
  if (!v15) {

  }
  if (!v6) {
  double v18 = [[AMSUIWebJSRequest alloc] initWithServiceName:@"CameraReaderInfo" logKey:v11];
  }
  [(AMSUIWebJSRequest *)v18 setOptions:v17];
  double v19 = [(AMSUIWebCameraReaderViewController *)self context];
  long long v20 = [v19 dataProvider];
  id v21 = (id)[v20 runJSRequest:v18];
}

- (void)willPresentPageModel:(id)a3 appearance:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  if (v9)
  {
    objc_storeStrong((id *)&self->_model, v9);
    objc_storeStrong((id *)&self->_appearance, a4);
  }
  else
  {
    uint64_t v10 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v10)
    {
      uint64_t v10 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    double v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = objc_opt_class();
      int v13 = [(AMSUIWebCameraReaderViewController *)self context];
      id v14 = [v13 logKey];
      int v15 = 138543874;
      uint64_t v16 = v12;
      __int16 v17 = 2114;
      double v18 = v14;
      __int16 v19 = 2114;
      id v20 = v8;
      _os_log_impl(&dword_21C134000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Invalid camera page model: %{public}@", (uint8_t *)&v15, 0x20u);
    }
  }
}

- (void)cameraReaderDidCancel:(id)a3
{
  AMSError();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(AMSUIWebCameraReaderViewController *)self _handleCameraOutput:0 error:v4];
}

- (void)cameraReader:(id)a3 didFailWithError:(id)a4
{
}

- (void)cameraReader:(id)a3 didRecognizeObjects:(id)a4
{
  id v9 = a4;
  id v5 = [(AMSUIWebCameraReaderViewController *)self model];
  uint64_t v6 = [v5 pageType];

  if (v6 == 2)
  {
    uint64_t v7 = [(AMSUIWebCameraReaderViewController *)self _outputForIDCardReaderObjects:v9];
    goto LABEL_5;
  }
  if (!v6)
  {
    uint64_t v7 = [(AMSUIWebCameraReaderViewController *)self _outputForCreditCardReaderObjects:v9];
LABEL_5:
    id v8 = (void *)v7;
    goto LABEL_7;
  }
  id v8 = 0;
LABEL_7:
  [(AMSUIWebCameraReaderViewController *)self setOutput:v8];
}

- (void)cameraReaderDidEnd:(id)a3
{
  id v4 = [(AMSUIWebCameraReaderViewController *)self output];
  [(AMSUIWebCameraReaderViewController *)self _handleCameraOutput:v4 error:0];
}

- (void)codeRedeemerControllerDidCancel:(id)a3
{
  AMSError();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(AMSUIWebCameraReaderViewController *)self _handleCameraOutput:0 error:v4];
}

- (void)codeRedeemerController:(id)a3 didEndWithInfo:(id)a4
{
  uint64_t v5 = *MEMORY[0x263F37DD0];
  id v6 = a4;
  id v8 = [v6 valueForKey:v5];
  uint64_t v7 = [(AMSUIWebCameraReaderViewController *)self _outputForGiftCardReaderObjects:v6];

  [(AMSUIWebCameraReaderViewController *)self _handleCameraOutput:v7 error:v8];
}

- (void)textFieldDidBeginEditing:(id)a3
{
  [(AMSUIWebCameraReaderViewController *)self _setRedeemButton];
  [(AMSUIWebCameraReaderViewController *)self _commitNavigationBarModel];
  id v4 = [(AMSUICommonViewController *)self view];
  uint64_t v5 = [(AMSUIWebCameraReaderViewController *)self overlay];
  [v4 insertSubview:v5 belowSubview:self->_textField];

  id v6 = [(AMSUIWebCameraReaderViewController *)self overlay];
  uint64_t v7 = [(AMSUICommonViewController *)self view];
  [v7 bounds];
  objc_msgSend(v6, "setFrame:");

  id v8 = [(AMSUIWebCameraReaderViewController *)self overlay];
  id v9 = [MEMORY[0x263F825C8] blackColor];
  [v8 setBackgroundColor:v9];

  uint64_t v10 = [(AMSUIWebCameraReaderViewController *)self overlay];
  [v10 setAlpha:0.0];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __63__AMSUIWebCameraReaderViewController_textFieldDidBeginEditing___block_invoke;
  v12[3] = &unk_2643E3118;
  v12[4] = self;
  [MEMORY[0x263F82E00] animateWithDuration:v12 animations:0.2];
  double v11 = [(AMSUIWebCameraReaderViewController *)self _cameraReader];
  [v11 cancel];
}

void __63__AMSUIWebCameraReaderViewController_textFieldDidBeginEditing___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) overlay];
  [v1 setAlpha:0.4];
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 1;
}

- (void)textFieldDidEndEditing:(id)a3
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__AMSUIWebCameraReaderViewController_textFieldDidEndEditing___block_invoke;
  v7[3] = &unk_2643E3118;
  v7[4] = self;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __61__AMSUIWebCameraReaderViewController_textFieldDidEndEditing___block_invoke_2;
  void v6[3] = &unk_2643E4568;
  void v6[4] = self;
  [MEMORY[0x263F82E00] animateWithDuration:v7 animations:v6 completion:0.2];
  UIKeyboardOrderOutAutomatic();
  id v4 = [(AMSUIWebCameraReaderViewController *)self _cameraReader];
  [v4 start];

  uint64_t v5 = [(AMSUIWebCameraReaderViewController *)self textField];
  [v5 setText:0];
}

void __61__AMSUIWebCameraReaderViewController_textFieldDidEndEditing___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) overlay];
  [v1 setAlpha:0.0];
}

void __61__AMSUIWebCameraReaderViewController_textFieldDidEndEditing___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) overlay];
  [v1 removeFromSuperview];
}

- (void)keyboardWillShow:(id)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v10 = 0;
  double v11 = 0.0;
  id v4 = [a3 userInfo];
  uint64_t v5 = [v4 objectForKey:*MEMORY[0x263F837B8]];
  [v5 getValue:&v12];

  id v6 = [v4 objectForKey:*MEMORY[0x263F83778]];
  [v6 getValue:&v10];

  uint64_t v7 = [v4 objectForKey:*MEMORY[0x263F83780]];
  [v7 getValue:&v11];

  id v8 = [(AMSUICommonViewController *)self view];
  objc_msgSend(v8, "convertRect:fromView:", 0, v12, v13);
  -[AMSUIWebCameraReaderViewController setKeyboardRect:](self, "setKeyboardRect:");

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __55__AMSUIWebCameraReaderViewController_keyboardWillShow___block_invoke;
  v9[3] = &unk_2643E3118;
  v9[4] = self;
  [MEMORY[0x263F82E00] animateWithDuration:v10 << 16 delay:v9 options:0 animations:v11 completion:0.0];
}

uint64_t __55__AMSUIWebCameraReaderViewController_keyboardWillShow___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _layoutTextField];
}

- (void)keyboardWillHide:(id)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v10 = 0;
  double v11 = 0.0;
  id v4 = [a3 userInfo];
  uint64_t v5 = [v4 objectForKey:*MEMORY[0x263F837B8]];
  [v5 getValue:&v12];

  id v6 = [v4 objectForKey:*MEMORY[0x263F83778]];
  [v6 getValue:&v10];

  uint64_t v7 = [v4 objectForKey:*MEMORY[0x263F83780]];
  [v7 getValue:&v11];

  id v8 = [(AMSUICommonViewController *)self view];
  objc_msgSend(v8, "convertRect:fromView:", 0, v12, v13);
  -[AMSUIWebCameraReaderViewController setKeyboardRect:](self, "setKeyboardRect:");

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __55__AMSUIWebCameraReaderViewController_keyboardWillHide___block_invoke;
  v9[3] = &unk_2643E3118;
  v9[4] = self;
  [MEMORY[0x263F82E00] animateWithDuration:v10 << 16 delay:v9 options:0 animations:v11 completion:0.0];
}

uint64_t __55__AMSUIWebCameraReaderViewController_keyboardWillHide___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _layoutTextField];
}

- (void)keyboardDidHide:(id)a3
{
  CGSize v4 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
  self->_keyboardRect.origin = (CGPoint)*MEMORY[0x263F001A8];
  self->_keyboardRect.size = v4;
  uint64_t v5 = [(AMSUIWebCameraReaderViewController *)self model];
  int v6 = [v5 allowsCameraToggle];

  if (v6)
  {
    [(AMSUIWebCameraReaderViewController *)self _setCameraToggleButton];
  }
  else
  {
    uint64_t v7 = [(AMSUIWebCameraReaderViewController *)self navigationBarModel];
    [v7 setRightBarButtonItemModel:0];
  }
  [(AMSUIWebCameraReaderViewController *)self _commitNavigationBarModel];
}

- (void)_redeemAction
{
  id v3 = [(AMSUIWebCameraReaderViewController *)self textField];
  CGSize v4 = [v3 text];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    int v6 = [(AMSUIWebCameraReaderViewController *)self textField];
    id v8 = [v6 text];

    uint64_t v7 = [(AMSUIWebCameraReaderViewController *)self _outputForGiftCardReaderCode:v8];
    [(AMSUIWebCameraReaderViewController *)self _handleCameraOutput:v7 error:0];
  }
}

- (void)_hideKeyboard
{
}

- (AMSUIWebAppearance)appearance
{
  return self->_appearance;
}

- (void)setAppearance:(id)a3
{
}

- (UIViewController)childController
{
  return self->_childController;
}

- (void)setChildController:(id)a3
{
}

- (AMSUIWebClientContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (AMSUIWebCameraReaderInfoView)infoView
{
  return self->_infoView;
}

- (void)setInfoView:(id)a3
{
}

- (AMSUIWebCameraReaderPageModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (AMSUIWebNavigationBarModel)navigationBarModel
{
  return self->_navigationBarModel;
}

- (void)setNavigationBarModel:(id)a3
{
}

- (NSDictionary)output
{
  return self->_output;
}

- (void)setOutput:(id)a3
{
}

- (CGRect)keyboardRect
{
  double x = self->_keyboardRect.origin.x;
  double y = self->_keyboardRect.origin.y;
  double width = self->_keyboardRect.size.width;
  double height = self->_keyboardRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setKeyboardRect:(CGRect)a3
{
  self->_keyboardRect = a3;
}

- (UIView)overlay
{
  return self->_overlay;
}

- (void)setOverlay:(id)a3
{
}

- (AMSUIWebCameraTextField)textField
{
  return self->_textField;
}

- (void)setTextField:(id)a3
{
}

- (UIView)textFieldSafeAreaBackdrop
{
  return self->_textFieldSafeAreaBackdrop;
}

- (void)setTextFieldSafeAreaBackdrop:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textFieldSafeAreaBackdrop, 0);
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_overlay, 0);
  objc_storeStrong((id *)&self->_output, 0);
  objc_storeStrong((id *)&self->_navigationBarModel, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_infoView, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_childController, 0);
  objc_storeStrong((id *)&self->_appearance, 0);
}

@end
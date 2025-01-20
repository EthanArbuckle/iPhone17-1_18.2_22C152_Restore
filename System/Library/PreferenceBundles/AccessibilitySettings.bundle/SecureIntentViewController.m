@interface SecureIntentViewController
+ (BOOL)isEnrolledWithRequestSource:(unint64_t)a3;
+ (int64_t)authStorageKeyForRequestSource:(unint64_t)a3;
- (BOOL)isEnrolled;
- (LAContext)context;
- (PKPaymentAuthorizationController)pkController;
- (SecureIntentViewController)initWithSource:(unint64_t)a3 context:(id)a4 delegate:(id)a5;
- (SecureIntentViewControllerDelegate)intentDelegate;
- (id)_details;
- (id)_errorMessage;
- (id)_logger;
- (id)_title;
- (id)authStorageKeyDescription:(int64_t)a3;
- (id)presentationWindowForPaymentAuthorizationController:(id)a3;
- (id)requestSourceDescription;
- (int64_t)_authStorageKey;
- (unint64_t)requestSource;
- (unint64_t)supportedInterfaceOrientations;
- (void)_cancelEnrollment;
- (void)_continueEnrollment;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)paymentAuthorizationController:(id)a3 didAuthorizeContextWithHandler:(id)a4;
- (void)paymentAuthorizationControllerDidFinish:(id)a3;
- (void)setContext:(id)a3;
- (void)setIntentDelegate:(id)a3;
- (void)setPkController:(id)a3;
- (void)setRequestSource:(unint64_t)a3;
- (void)viewDidLoad;
@end

@implementation SecureIntentViewController

- (SecureIntentViewController)initWithSource:(unint64_t)a3 context:(id)a4 delegate:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SecureIntentViewController;
  v11 = [(SecureIntentViewController *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(SecureIntentViewController *)v11 setDelegate:v11];
    v12->_requestSource = a3;
    objc_storeWeak((id *)&v12->_intentDelegate, v10);
    objc_storeStrong((id *)&v12->_context, a4);
  }

  return v12;
}

- (void)viewDidLoad
{
  v15.receiver = self;
  v15.super_class = (Class)SecureIntentViewController;
  [(SecureIntentViewController *)&v15 viewDidLoad];
  id v3 = objc_alloc((Class)OBWelcomeController);
  v4 = [(SecureIntentViewController *)self _title];
  v5 = [(SecureIntentViewController *)self _details];
  id v6 = [v3 initWithTitle:v4 detailText:v5 icon:0];

  v7 = +[OBBoldTrayButton boldButton];
  v8 = settingsLocString(@"CONTINUE", @"Accessibility");
  [v7 setTitle:v8 forState:0];

  [v7 addTarget:self action:"_continueEnrollment" forControlEvents:64];
  id v9 = [v6 buttonTray];
  [v9 addButton:v7];

  id v10 = +[OBLinkTrayButton linkButton];
  v11 = settingsLocString(@"SECURE_INTENT_NOT_NOW", @"Accessibility");
  [v10 setTitle:v11 forState:0];

  [v10 addTarget:self action:"_cancelEnrollment" forControlEvents:64];
  v12 = [v6 buttonTray];
  [v12 addButton:v10];

  id v13 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"_cancelEnrollment"];
  objc_super v14 = [v6 navigationItem];
  [v14 setLeftBarButtonItem:v13];

  [(SecureIntentViewController *)self pushViewController:v6 animated:1];
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)_cancelEnrollment
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = __47__SecureIntentViewController__cancelEnrollment__block_invoke;
  v2[3] = &unk_2087C0;
  v2[4] = self;
  [(SecureIntentViewController *)self dismissViewControllerAnimated:1 completion:v2];
}

void __47__SecureIntentViewController__cancelEnrollment__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  [WeakRetained secureIntentViewControllerDidCancel:*(void *)(a1 + 32)];
}

- (void)_continueEnrollment
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Already showing secure intent registration flow.", v1, 2u);
}

void __49__SecureIntentViewController__continueEnrollment__block_invoke(id a1, BOOL a2)
{
  id v3 = AXLogSettings();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __49__SecureIntentViewController__continueEnrollment__block_invoke_cold_1(a2, v3);
  }
}

- (id)_title
{
  unint64_t requestSource = self->_requestSource;
  if (requestSource > 2)
  {
    id v3 = 0;
  }
  else
  {
    id v3 = settingsLocString(off_20AFD8[requestSource], @"Accessibility");
  }

  return v3;
}

- (id)_details
{
  unint64_t requestSource = self->_requestSource;
  switch(requestSource)
  {
    case 2uLL:
      v4 = AXLocStringKeyForModel();
      v5 = settingsLocString(v4, @"Accessibility");

      goto LABEL_9;
    case 1uLL:
      id v3 = @"SECURE_INTENT_AST_DETAIL";
      goto LABEL_7;
    case 0uLL:
      id v3 = @"SECURE_INTENT_SC_DETAIL";
LABEL_7:
      v5 = settingsLocString(v3, @"Accessibility");
      goto LABEL_9;
  }
  v5 = 0;
LABEL_9:

  return v5;
}

- (id)_errorMessage
{
  unint64_t requestSource = self->_requestSource;
  if (requestSource > 2)
  {
    id v3 = 0;
  }
  else
  {
    id v3 = settingsLocString(off_20AFF0[requestSource], @"Accessibility");
  }

  return v3;
}

- (BOOL)isEnrolled
{
  return +[SecureIntentViewController isEnrolledWithRequestSource:self->_requestSource];
}

- (int64_t)_authStorageKey
{
  return +[SecureIntentViewController authStorageKeyForRequestSource:self->_requestSource];
}

- (id)_logger
{
  if (self->_requestSource == 2) {
    AXLogUltronKShot();
  }
  else {
  v2 = AXLogSettings();
  }

  return v2;
}

+ (int64_t)authStorageKeyForRequestSource:(unint64_t)a3
{
  if (a3 > 2) {
    return 0;
  }
  else {
    return qword_1A15A0[a3];
  }
}

+ (BOOL)isEnrolledWithRequestSource:(unint64_t)a3
{
  id v4 = [objc_alloc((Class)LAStorage) initWithDomain:0 authenticationContext:0];
  int64_t v5 = +[SecureIntentViewController authStorageKeyForRequestSource:a3];
  if (v5) {
    unsigned __int8 v6 = [v4 BOOLForKey:v5];
  }
  else {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v6 = a4;
  id v8 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"_cancelEnrollment"];
  v7 = [v6 navigationItem];

  [v7 setLeftBarButtonItem:v8];
}

- (void)paymentAuthorizationControllerDidFinish:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  pkController = self->_pkController;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __70__SecureIntentViewController_paymentAuthorizationControllerDidFinish___block_invoke;
  v6[3] = &unk_208BB8;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  [(PKPaymentAuthorizationController *)pkController dismissWithCompletion:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __70__SecureIntentViewController_paymentAuthorizationControllerDidFinish___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = (void *)WeakRetained[2];
  WeakRetained[2] = 0;

  AXPerformBlockOnMainThread();
}

id __70__SecureIntentViewController_paymentAuthorizationControllerDidFinish___block_invoke_2(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 8) <= 1uLL) {
    _AXSAccessibilitySetSecureIntentProvider();
  }
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __70__SecureIntentViewController_paymentAuthorizationControllerDidFinish___block_invoke_3;
  v3[3] = &unk_208948;
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:v3];
}

void __70__SecureIntentViewController_paymentAuthorizationControllerDidFinish___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  [WeakRetained secureIntentViewControllerDidFinish:*(void *)(a1 + 40)];
}

- (id)presentationWindowForPaymentAuthorizationController:(id)a3
{
  id v3 = [(SecureIntentViewController *)self view];
  id v4 = [v3 window];

  return v4;
}

- (id)authStorageKeyDescription:(int64_t)a3
{
  CFStringRef v3 = @"LAStorageKeySoundEnrollment";
  if (a3 != 17) {
    CFStringRef v3 = 0;
  }
  if (a3 == 1) {
    return @"LAStorageKeyDoublePressDisabled";
  }
  else {
    return (id)v3;
  }
}

- (id)requestSourceDescription
{
  unint64_t requestSource = self->_requestSource;
  CFStringRef v3 = @"SecureIntentRequestSourceSwitchControl";
  if (requestSource == 1) {
    CFStringRef v3 = @"SecureIntentRequestSourceAssistiveTouch";
  }
  if (requestSource == 2) {
    return @"SecureIntentRequestSourceCustomSoundRecognition";
  }
  else {
    return (id)v3;
  }
}

- (void)paymentAuthorizationController:(id)a3 didAuthorizeContextWithHandler:(id)a4
{
  id v5 = a4;
  int64_t v6 = [(SecureIntentViewController *)self _authStorageKey];
  if (v6)
  {
    int64_t v7 = v6;
    id v8 = [objc_alloc((Class)LAStorage) initWithDomain:0 authenticationContext:self->_context];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = __92__SecureIntentViewController_paymentAuthorizationController_didAuthorizeContextWithHandler___block_invoke;
    v10[3] = &unk_20AFA0;
    v10[4] = self;
    int64_t v12 = v7;
    id v11 = v5;
    [v8 setBool:1 forKey:v7 completionHandler:v10];
  }
  else
  {
    id v9 = [(SecureIntentViewController *)self _logger];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SecureIntentViewController paymentAuthorizationController:didAuthorizeContextWithHandler:](v9);
    }

    id v8 = [objc_alloc((Class)PKPaymentAuthorizationResult) initWithStatus:0 errors:0];
    (*((void (**)(id, id))v5 + 2))(v5, v8);
  }
}

void __92__SecureIntentViewController_paymentAuthorizationController_didAuthorizeContextWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _logger];
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v11 = [*(id *)(a1 + 32) authStorageKeyDescription:*(void *)(a1 + 48)];
      int64_t v12 = [*(id *)(a1 + 32) requestSourceDescription];
      *(_DWORD *)buf = 138412802;
      objc_super v15 = v11;
      __int16 v16 = 2112;
      v17 = v12;
      __int16 v18 = 2112;
      id v19 = v3;
      _os_log_error_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, "SecureIntent: Unable to set LAStorageKey: %@ for request source: %@. Error: %@", buf, 0x20u);
    }
    id v6 = objc_alloc((Class)PKPaymentAuthorizationResult);
    id v13 = v3;
    int64_t v7 = +[NSArray arrayWithObjects:&v13 count:1];
    id v8 = [v6 initWithStatus:1 errors:v7];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [*(id *)(a1 + 32) authStorageKeyDescription:*(void *)(a1 + 48)];
      id v10 = [*(id *)(a1 + 32) requestSourceDescription];
      *(_DWORD *)buf = 138412546;
      objc_super v15 = v9;
      __int16 v16 = 2112;
      v17 = v10;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "SecureIntent: Successfully set LAStorageKey: %@ for request source: %@.", buf, 0x16u);
    }
    id v8 = [objc_alloc((Class)PKPaymentAuthorizationResult) initWithStatus:0 errors:0];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (unint64_t)requestSource
{
  return self->_requestSource;
}

- (void)setRequestSource:(unint64_t)a3
{
  self->_unint64_t requestSource = a3;
}

- (PKPaymentAuthorizationController)pkController
{
  return self->_pkController;
}

- (void)setPkController:(id)a3
{
}

- (LAContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (SecureIntentViewControllerDelegate)intentDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_intentDelegate);

  return (SecureIntentViewControllerDelegate *)WeakRetained;
}

- (void)setIntentDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_intentDelegate);
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_pkController, 0);
}

void __49__SecureIntentViewController__continueEnrollment__block_invoke_cold_1(char a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "Showing Controller: %d", (uint8_t *)v2, 8u);
}

- (void)paymentAuthorizationController:(NSObject *)a1 didAuthorizeContextWithHandler:.cold.1(NSObject *a1)
{
  v2 = +[NSNumber numberWithInteger:0];
  int v3 = 138412290;
  id v4 = v2;
  _os_log_error_impl(&dword_0, a1, OS_LOG_TYPE_ERROR, "SecureIntent: Not supported. Receieved storage key: %@. Bypassing the payment sheet.", (uint8_t *)&v3, 0xCu);
}

@end
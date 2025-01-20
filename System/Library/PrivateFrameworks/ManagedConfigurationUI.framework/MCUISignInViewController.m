@interface MCUISignInViewController
- (AKAppleIDAuthenticationInAppContext)context;
- (BOOL)authenticationFinished;
- (BOOL)signInButtonTapped;
- (MCSignInPageAuthenticationSectionController)authSectionController;
- (MCSignInPageTitleSectionController)titleSectionController;
- (MCUISignInViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (MCUISignInViewControllerDelegate)delegate;
- (NSString)orgName;
- (void)setAuthSectionController:(id)a3;
- (void)setAuthenticationFinished:(BOOL)a3;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setOrgName:(id)a3;
- (void)setSignInButtonTapped:(BOOL)a3;
- (void)setTitleSectionController:(id)a3;
- (void)signInViewController:(id)a3 didAuthenticateWithResults:(id)a4 error:(id)a5;
- (void)signInViewController:(id)a3 willPerformAuthenticationWithContext:(id)a4 completionHandler:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MCUISignInViewController

- (MCUISignInViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)MCUISignInViewController;
  v4 = [(MCUISignInViewController *)&v12 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    titleSectionController = v4->_titleSectionController;
    v4->_titleSectionController = (MCSignInPageTitleSectionController *)v5;

    uint64_t v7 = objc_opt_new();
    authSectionController = v4->_authSectionController;
    v4->_authSectionController = (MCSignInPageAuthenticationSectionController *)v7;

    v9 = [(MCSignInPageAuthenticationSectionController *)v4->_authSectionController inlineSignInViewController];
    [v9 setDelegate:v4];

    v13[0] = v4->_titleSectionController;
    v13[1] = v4->_authSectionController;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    [(MCSectionBasedTableViewController *)v4 setSectionControllers:v10];
  }
  return v4;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)MCUISignInViewController;
  [(MCSectionBasedTableViewController *)&v7 viewDidLoad];
  v3 = [(MCUISignInViewController *)self authSectionController];
  v4 = [v3 inlineSignInViewController];
  [(MCUISignInViewController *)self addChildViewController:v4];

  uint64_t v5 = [(MCUISignInViewController *)self authSectionController];
  v6 = [v5 inlineSignInViewController];
  [v6 didMoveToParentViewController:self];
}

- (void)viewWillAppear:(BOOL)a3
{
  v17.receiver = self;
  v17.super_class = (Class)MCUISignInViewController;
  [(MCUISignInViewController *)&v17 viewWillAppear:a3];
  v4 = (void *)MEMORY[0x1E4F42A80];
  uint64_t v5 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
  v6 = [v4 MCUIImageWithColor:v5];

  objc_super v7 = [(MCUISignInViewController *)self navigationController];
  v8 = [v7 navigationBar];
  [v8 setBackgroundImage:v6 forBarMetrics:0];

  v9 = [(MCUISignInViewController *)self navigationController];
  v10 = [v9 navigationBar];
  v11 = objc_opt_new();
  [v10 setShadowImage:v11];

  objc_super v12 = [(MCUISignInViewController *)self navigationController];
  v13 = [v12 navigationBar];
  [v13 setTranslucent:1];

  v14 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
  v15 = [(MCUISignInViewController *)self view];
  [v15 setBackgroundColor:v14];

  v16 = [(MCUISignInViewController *)self navigationItem];
  [v16 setTitle:&stru_1F40ADA78];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MCUISignInViewController;
  [(MCUISignInViewController *)&v6 viewDidAppear:a3];
  if (![(MCUISignInViewController *)self signInButtonTapped])
  {
    v4 = [(MCUISignInViewController *)self authSectionController];
    uint64_t v5 = [v4 inlineSignInViewController];
    [v5 signInButtonWasTapped:0];

    [(MCUISignInViewController *)self setSignInButtonTapped:1];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MCUISignInViewController;
  [(MCUISignInViewController *)&v7 viewDidDisappear:a3];
  v4 = [(MCUISignInViewController *)self presentingViewController];
  if (!v4 && ![(MCUISignInViewController *)self authenticationFinished])
  {
    uint64_t v5 = [(MCUISignInViewController *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) == 0) {
      return;
    }
    v4 = [(MCUISignInViewController *)self delegate];
    [v4 signInViewControllerDidCancelAuthentication:self];
  }
}

- (AKAppleIDAuthenticationInAppContext)context
{
  v2 = [(MCUISignInViewController *)self authSectionController];
  v3 = [v2 inlineSignInViewController];
  v4 = [v3 context];

  return (AKAppleIDAuthenticationInAppContext *)v4;
}

- (void)setContext:(id)a3
{
  id v4 = a3;
  id v6 = [(MCUISignInViewController *)self authSectionController];
  uint64_t v5 = [v6 inlineSignInViewController];
  [v5 setContext:v4];
}

- (void)setOrgName:(id)a3
{
  id v5 = (id)[a3 copy];
  id v4 = [(MCUISignInViewController *)self titleSectionController];
  [v4 setOrgName:v5];
}

- (NSString)orgName
{
  v2 = [(MCUISignInViewController *)self titleSectionController];
  v3 = [v2 orgName];

  return (NSString *)v3;
}

- (void)signInViewController:(id)a3 willPerformAuthenticationWithContext:(id)a4 completionHandler:(id)a5
{
  v9 = (void (**)(void))a5;
  id v6 = [(MCUISignInViewController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    v8 = [(MCUISignInViewController *)self delegate];
    [v8 signInViewController:self willAuthenticateWithCompletionHandler:v9];
  }
  else
  {
    v9[2]();
  }
}

- (void)signInViewController:(id)a3 didAuthenticateWithResults:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__MCUISignInViewController_signInViewController_didAuthenticateWithResults_error___block_invoke;
  block[3] = &unk_1E6EAD610;
  block[4] = self;
  id v12 = v8;
  id v13 = v7;
  id v9 = v7;
  id v10 = v8;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __82__MCUISignInViewController_signInViewController_didAuthenticateWithResults_error___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isBeingDismissed] & 1) == 0)
  {
    v2 = [*(id *)(a1 + 32) presentingViewController];

    if (v2)
    {
      if (!*(void *)(a1 + 40))
      {
        [*(id *)(a1 + 32) setAuthenticationFinished:1];
        v3 = [*(id *)(a1 + 32) delegate];
        char v4 = objc_opt_respondsToSelector();

        if (v4)
        {
          id v5 = [*(id *)(a1 + 32) delegate];
          [v5 signInViewController:*(void *)(a1 + 32) didAuthenticateWithResults:*(void *)(a1 + 48) error:*(void *)(a1 + 40)];
        }
      }
    }
  }
}

- (MCUISignInViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MCUISignInViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)signInButtonTapped
{
  return self->_signInButtonTapped;
}

- (void)setSignInButtonTapped:(BOOL)a3
{
  self->_signInButtonTapped = a3;
}

- (BOOL)authenticationFinished
{
  return self->_authenticationFinished;
}

- (void)setAuthenticationFinished:(BOOL)a3
{
  self->_authenticationFinished = a3;
}

- (MCSignInPageTitleSectionController)titleSectionController
{
  return self->_titleSectionController;
}

- (void)setTitleSectionController:(id)a3
{
}

- (MCSignInPageAuthenticationSectionController)authSectionController
{
  return self->_authSectionController;
}

- (void)setAuthSectionController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authSectionController, 0);
  objc_storeStrong((id *)&self->_titleSectionController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
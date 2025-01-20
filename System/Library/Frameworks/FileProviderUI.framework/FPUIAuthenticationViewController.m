@interface FPUIAuthenticationViewController
- (FPUIAuthenticationDelegate)authenticationDelegate;
- (FPUIAuthenticationLandingViewController)landingViewController;
- (FPUIAuthenticationViewController)initWithServerURL:(id)a3;
- (NSURL)initialConnectionURL;
- (void)setAuthenticationDelegate:(id)a3;
- (void)setInitialConnectionURL:(id)a3;
- (void)setLandingViewController:(id)a3;
- (void)viewDidLoad;
@end

@implementation FPUIAuthenticationViewController

- (FPUIAuthenticationViewController)initWithServerURL:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FPUIAuthenticationViewController;
  v5 = [(FPUIAuthenticationViewController *)&v9 initWithNibName:0 bundle:0];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    initialConnectionURL = v5->_initialConnectionURL;
    v5->_initialConnectionURL = (NSURL *)v6;
  }
  return v5;
}

- (void)viewDidLoad
{
  v32[4] = *MEMORY[0x263EF8340];
  v31.receiver = self;
  v31.super_class = (Class)FPUIAuthenticationViewController;
  [(FPUIAuthenticationViewController *)&v31 viewDidLoad];
  v3 = [[FPUIAuthenticationLandingViewController alloc] initWithURL:self->_initialConnectionURL];
  id v4 = [(FPUIAuthenticationViewController *)self authenticationDelegate];
  [(FPUIAuthenticationTableViewController *)v3 setAuthenticationDelegate:v4];

  v30 = v3;
  objc_storeWeak((id *)&self->_landingViewController, v3);
  v5 = (void *)[objc_alloc(MEMORY[0x263F1C7F8]) initWithRootViewController:v3];
  [(FPUIAuthenticationViewController *)self addChildViewController:v5];
  uint64_t v6 = [(FPUIAuthenticationViewController *)self view];
  v7 = [v5 view];
  [v6 addSubview:v7];

  v20 = (void *)MEMORY[0x263F08938];
  v29 = [(FPUIAuthenticationViewController *)self view];
  v27 = [v29 centerXAnchor];
  v28 = [v5 view];
  v26 = [v28 centerXAnchor];
  v25 = [v27 constraintEqualToAnchor:v26];
  v32[0] = v25;
  v24 = [(FPUIAuthenticationViewController *)self view];
  v22 = [v24 centerYAnchor];
  v23 = [v5 view];
  v21 = [v23 centerYAnchor];
  v19 = [v22 constraintEqualToAnchor:v21];
  v32[1] = v19;
  v18 = [(FPUIAuthenticationViewController *)self view];
  v16 = [v18 widthAnchor];
  v17 = [v5 view];
  v8 = [v17 widthAnchor];
  objc_super v9 = [v16 constraintEqualToAnchor:v8];
  v32[2] = v9;
  v10 = [(FPUIAuthenticationViewController *)self view];
  v11 = [v10 heightAnchor];
  v12 = [v5 view];
  v13 = [v12 heightAnchor];
  v14 = [v11 constraintEqualToAnchor:v13];
  v32[3] = v14;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:4];
  [v20 activateConstraints:v15];

  [v5 didMoveToParentViewController:self];
}

- (void)setInitialConnectionURL:(id)a3
{
  uint64_t v6 = (NSURL *)a3;
  if (self->_initialConnectionURL != v6)
  {
    objc_storeStrong((id *)&self->_initialConnectionURL, a3);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_landingViewController);
    [WeakRetained setInitialConnectionURL:v6];
  }
}

- (FPUIAuthenticationDelegate)authenticationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_authenticationDelegate);

  return (FPUIAuthenticationDelegate *)WeakRetained;
}

- (void)setAuthenticationDelegate:(id)a3
{
}

- (NSURL)initialConnectionURL
{
  return self->_initialConnectionURL;
}

- (FPUIAuthenticationLandingViewController)landingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_landingViewController);

  return (FPUIAuthenticationLandingViewController *)WeakRetained;
}

- (void)setLandingViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_landingViewController);
  objc_storeStrong((id *)&self->_initialConnectionURL, 0);

  objc_destroyWeak((id *)&self->_authenticationDelegate);
}

@end
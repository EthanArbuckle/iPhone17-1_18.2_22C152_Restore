@interface DBApplicationViewController
- (BOOL)presentsFullScreen;
- (BOOL)presentsUnderStatusBar;
- (DBApplication)application;
- (DBApplication)proxyApplication;
- (DBApplicationSceneHostViewController)sceneHostViewController;
- (DBApplicationViewController)initWithEntity:(id)a3 environment:(id)a4;
- (DBDashboardEntity)entity;
- (DBEnvironment)environment;
- (DBUserAlert)userAlert;
- (NSString)alertPresentationRequester;
- (NSString)identifier;
- (UIView)alertPresentationView;
- (id)presentationViewWithIdentifier:(id)a3;
- (void)_addAlertSubviewIfNeeded;
- (void)_removeAlertSubviewIfNeeded;
- (void)_requestDismissal;
- (void)activateSceneWithSettings:(id)a3 completion:(id)a4;
- (void)applicationSceneHostViewController:(id)a3 didUpdateSceneContentState:(int64_t)a4;
- (void)backgroundSceneWithCompletion:(id)a3;
- (void)deactivateSceneWithReasonMask:(unint64_t)a3;
- (void)dealloc;
- (void)foregroundSceneWithSettings:(id)a3 completion:(id)a4;
- (void)handleEvent:(id)a3;
- (void)invalidatePresentationViewForIdentifier:(id)a3;
- (void)setAlertPresentationView:(id)a3;
- (void)setApplication:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setProxyApplication:(id)a3;
- (void)setSceneHostViewController:(id)a3;
- (void)setUserAlert:(id)a3;
- (void)viewDidLoad;
@end

@implementation DBApplicationViewController

- (DBApplicationViewController)initWithEntity:(id)a3 environment:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v33.receiver = self;
  v33.super_class = (Class)DBApplicationViewController;
  v9 = [(DBApplicationViewController *)&v33 initWithNibName:0 bundle:0];
  if (v9)
  {
    if ([v7 isApplicationEntity])
    {
      uint64_t v10 = objc_opt_class();
      id v11 = v7;
      if (v10)
      {
        if (objc_opt_isKindOfClass()) {
          v12 = v11;
        }
        else {
          v12 = 0;
        }
      }
      else
      {
        v12 = 0;
      }
      id v13 = v12;

      uint64_t v14 = [v13 application];
      application = v9->_application;
      v9->_application = (DBApplication *)v14;

      proxyApplication = v9->_proxyApplication;
      v9->_proxyApplication = 0;
    }
    if ([v7 isProxiedApplicationEntity])
    {
      uint64_t v17 = objc_opt_class();
      id v18 = v7;
      if (v17)
      {
        if (objc_opt_isKindOfClass()) {
          v19 = v18;
        }
        else {
          v19 = 0;
        }
      }
      else
      {
        v19 = 0;
      }
      id v20 = v19;

      uint64_t v21 = [v20 applicationToProxy];
      v22 = v9->_application;
      v9->_application = (DBApplication *)v21;

      v23 = [v20 proxyEntity];
      uint64_t v24 = [v23 application];
      v25 = v9->_proxyApplication;
      v9->_proxyApplication = (DBApplication *)v24;
    }
    objc_storeStrong((id *)&v9->_entity, a3);
    objc_storeWeak((id *)&v9->_environment, v8);
    v26 = NSString;
    v27 = (objc_class *)objc_opt_class();
    v28 = NSStringFromClass(v27);
    v29 = [(DBApplication *)v9->_application bundleIdentifier];
    uint64_t v30 = [v26 stringWithFormat:@"%@-%@-%u", v28, v29, ++counter];
    alertPresentationRequester = v9->_alertPresentationRequester;
    v9->_alertPresentationRequester = (NSString *)v30;
  }
  return v9;
}

- (void)dealloc
{
  v3 = [(DBApplicationViewController *)self sceneHostViewController];
  [v3 invalidateScenePresenter];

  v4 = [(DBApplicationViewController *)self userAlert];
  v5 = [(DBApplicationViewController *)self alertPresentationRequester];
  [v4 relinquishPresentationForRequester:v5];

  v6.receiver = self;
  v6.super_class = (Class)DBApplicationViewController;
  [(DBApplicationViewController *)&v6 dealloc];
}

- (DBApplicationSceneHostViewController)sceneHostViewController
{
  sceneHostViewController = self->_sceneHostViewController;
  if (!sceneHostViewController)
  {
    v4 = [DBApplicationSceneHostViewController alloc];
    v5 = [(DBApplicationViewController *)self application];
    objc_super v6 = [(DBApplicationViewController *)self proxyApplication];
    id v7 = [(DBApplicationViewController *)self environment];
    id v8 = [(DBSceneHostViewController *)v4 initWithApplication:v5 proxyApplication:v6 environment:v7];
    v9 = self->_sceneHostViewController;
    self->_sceneHostViewController = v8;

    [(DBApplicationSceneHostViewController *)self->_sceneHostViewController setDelegate:self];
    sceneHostViewController = self->_sceneHostViewController;
  }
  return sceneHostViewController;
}

- (void)setUserAlert:(id)a3
{
  v5 = (DBUserAlert *)a3;
  if (self->_userAlert != v5)
  {
    objc_super v6 = v5;
    [(DBApplicationViewController *)self _removeAlertSubviewIfNeeded];
    objc_storeStrong((id *)&self->_userAlert, a3);
    [(DBApplicationViewController *)self _addAlertSubviewIfNeeded];
    v5 = v6;
  }
}

- (void)viewDidLoad
{
  v39[4] = *MEMORY[0x263EF8340];
  v38.receiver = self;
  v38.super_class = (Class)DBApplicationViewController;
  [(DBApplicationViewController *)&v38 viewDidLoad];
  v3 = [MEMORY[0x263F825C8] tableBackgroundColor];
  v4 = [(DBApplicationViewController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = [(DBApplicationViewController *)self sceneHostViewController];
  [(DBApplicationViewController *)self addChildViewController:v5];

  objc_super v6 = [(DBApplicationViewController *)self view];
  id v7 = [(DBApplicationViewController *)self sceneHostViewController];
  id v8 = [v7 view];
  [v6 addSubview:v8];

  v9 = [(DBApplicationViewController *)self sceneHostViewController];
  [v9 didMoveToParentViewController:self];

  uint64_t v10 = [(DBApplicationViewController *)self sceneHostViewController];
  id v11 = [v10 view];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

  v26 = (void *)MEMORY[0x263F08938];
  v37 = [(DBApplicationViewController *)self sceneHostViewController];
  v36 = [v37 view];
  v34 = [v36 leadingAnchor];
  v35 = [(DBApplicationViewController *)self view];
  objc_super v33 = [v35 leadingAnchor];
  v32 = [v34 constraintEqualToAnchor:v33];
  v39[0] = v32;
  v31 = [(DBApplicationViewController *)self sceneHostViewController];
  uint64_t v30 = [v31 view];
  v28 = [v30 trailingAnchor];
  v29 = [(DBApplicationViewController *)self view];
  v27 = [v29 trailingAnchor];
  v25 = [v28 constraintEqualToAnchor:v27];
  v39[1] = v25;
  uint64_t v24 = [(DBApplicationViewController *)self sceneHostViewController];
  v23 = [v24 view];
  v22 = [v23 topAnchor];
  v12 = [(DBApplicationViewController *)self view];
  id v13 = [v12 topAnchor];
  uint64_t v14 = [v22 constraintEqualToAnchor:v13];
  v39[2] = v14;
  v15 = [(DBApplicationViewController *)self sceneHostViewController];
  v16 = [v15 view];
  uint64_t v17 = [v16 bottomAnchor];
  id v18 = [(DBApplicationViewController *)self view];
  v19 = [v18 bottomAnchor];
  id v20 = [v17 constraintEqualToAnchor:v19];
  v39[3] = v20;
  uint64_t v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:4];
  [v26 activateConstraints:v21];
}

- (void)applicationSceneHostViewController:(id)a3 didUpdateSceneContentState:(int64_t)a4
{
  if (a4 == 2) {
    [(DBApplicationViewController *)self _addAlertSubviewIfNeeded];
  }
  else {
    [(DBApplicationViewController *)self _removeAlertSubviewIfNeeded];
  }
}

- (BOOL)presentsUnderStatusBar
{
  return 1;
}

- (BOOL)presentsFullScreen
{
  v2 = [(DBApplicationViewController *)self application];
  char v3 = [v2 presentsFullScreen];

  return v3;
}

- (NSString)identifier
{
  v2 = [(DBApplicationViewController *)self application];
  char v3 = [v2 bundleIdentifier];

  return (NSString *)v3;
}

- (id)presentationViewWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(DBApplicationViewController *)self sceneHostViewController];
  objc_super v6 = [v5 presentationViewWithIdentifier:v4];

  return v6;
}

- (void)invalidatePresentationViewForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(DBApplicationViewController *)self sceneHostViewController];
  [v5 invalidatePresentationViewForIdentifier:v4];
}

- (void)foregroundSceneWithSettings:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(DBApplicationViewController *)self sceneHostViewController];
  [v8 foregroundSceneWithSettings:v7 completion:v6];
}

- (void)backgroundSceneWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(DBApplicationViewController *)self sceneHostViewController];
  [v5 backgroundSceneWithCompletion:v4];
}

- (void)activateSceneWithSettings:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(DBApplicationViewController *)self sceneHostViewController];
  [v8 activateSceneWithSettings:v7 completion:v6];
}

- (void)deactivateSceneWithReasonMask:(unint64_t)a3
{
  id v4 = [(DBApplicationViewController *)self sceneHostViewController];
  [v4 deactivateSceneWithReasonMask:a3];
}

- (void)handleEvent:(id)a3
{
  if ([a3 type] == 1)
  {
    [(DBApplicationViewController *)self _requestDismissal];
  }
}

- (void)_requestDismissal
{
  id v6 = objc_alloc_init(DBMutableWorkspaceStateChangeRequest);
  char v3 = [(DBApplicationViewController *)self application];
  [(DBMutableWorkspaceStateChangeRequest *)v6 deactivateApplication:v3];

  id v4 = [(DBApplicationViewController *)self environment];
  id v5 = [v4 workspace];
  [v5 requestStateChange:v6];
}

- (void)_addAlertSubviewIfNeeded
{
  v47[4] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(DBApplicationViewController *)self userAlert];
  if (v3)
  {
    id v44 = (id)v3;
    id v4 = [(DBApplicationViewController *)self alertPresentationView];
    if (v4)
    {
    }
    else
    {
      id v5 = [(DBApplicationViewController *)self sceneHostViewController];
      uint64_t v6 = [v5 sceneContentState];

      if (v6 == 2)
      {
        id v7 = [(DBApplicationViewController *)self userAlert];
        id v8 = [(DBApplicationViewController *)self alertPresentationRequester];
        v9 = [v7 presentationViewForRequester:v8];

        [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
        uint64_t v10 = [(DBApplicationViewController *)self view];
        [v10 addSubview:v9];

        [(DBApplicationViewController *)self setAlertPresentationView:v9];
        id v11 = [(DBApplicationViewController *)self userAlert];
        LODWORD(v8) = [v11 requiresSafeAreaWindow];

        if (v8)
        {
          v12 = [(DBApplicationViewController *)self view];
          id v13 = [v12 safeAreaLayoutGuide];

          v37 = (void *)MEMORY[0x263F08938];
          uint64_t v14 = [v9 topAnchor];
          v15 = [v13 topAnchor];
          id v45 = [v14 constraintEqualToAnchor:v15];
          v47[0] = v45;
          v16 = [v9 bottomAnchor];
          v42 = [v13 bottomAnchor];
          v43 = v16;
          v41 = objc_msgSend(v16, "constraintEqualToAnchor:");
          v47[1] = v41;
          uint64_t v17 = [v9 leadingAnchor];
          v39 = [v13 leadingAnchor];
          v40 = v17;
          id v18 = objc_msgSend(v17, "constraintEqualToAnchor:");
          v47[2] = v18;
          v19 = [v9 trailingAnchor];
          id v20 = [v13 trailingAnchor];
          uint64_t v21 = [v19 constraintEqualToAnchor:v20];
          v47[3] = v21;
          v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v47 count:4];
          [v37 activateConstraints:v22];
        }
        else
        {
          objc_super v38 = (void *)MEMORY[0x263F08938];
          v36 = [v9 topAnchor];
          v35 = [(DBApplicationViewController *)self view];
          uint64_t v34 = [v35 topAnchor];
          id v45 = [v36 constraintEqualToAnchor:v34];
          v46[0] = v45;
          v23 = [v9 bottomAnchor];
          v42 = [(DBApplicationViewController *)self view];
          [v42 bottomAnchor];
          v41 = v43 = v23;
          v40 = objc_msgSend(v23, "constraintEqualToAnchor:");
          v46[1] = v40;
          uint64_t v24 = [v9 leadingAnchor];
          id v18 = [(DBApplicationViewController *)self view];
          v19 = [v18 leadingAnchor];
          v39 = v24;
          id v20 = [v24 constraintEqualToAnchor:v19];
          v46[2] = v20;
          uint64_t v21 = [v9 trailingAnchor];
          v22 = [(DBApplicationViewController *)self view];
          v25 = [v22 trailingAnchor];
          v26 = [v21 constraintEqualToAnchor:v25];
          v46[3] = v26;
          v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v46 count:4];
          [v38 activateConstraints:v27];

          uint64_t v14 = v35;
          v15 = (void *)v34;

          id v13 = v36;
        }

        v28 = [(DBApplicationViewController *)self environment];
        char v29 = objc_opt_respondsToSelector();

        if (v29)
        {
          uint64_t v30 = [(DBApplicationViewController *)self userAlert];
          v31 = [(DBApplicationViewController *)self environment];
          v32 = [(DBApplicationViewController *)self application];
          objc_super v33 = [(DBApplicationViewController *)self proxyApplication];
          objc_msgSend(v30, "setUserInterfaceStyle:", objc_msgSend(v31, "sceneInterfaceStyleForApplication:proxyApplication:", v32, v33));
        }
      }
    }
  }
}

- (void)_removeAlertSubviewIfNeeded
{
  uint64_t v3 = [(DBApplicationViewController *)self userAlert];

  if (v3)
  {
    id v4 = [(DBApplicationViewController *)self userAlert];
    id v5 = [(DBApplicationViewController *)self alertPresentationRequester];
    [v4 relinquishPresentationForRequester:v5];

    uint64_t v6 = [(DBApplicationViewController *)self alertPresentationView];
    [v6 removeFromSuperview];

    [(DBApplicationViewController *)self setAlertPresentationView:0];
  }
}

- (DBDashboardEntity)entity
{
  return self->_entity;
}

- (DBUserAlert)userAlert
{
  return self->_userAlert;
}

- (DBEnvironment)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  return (DBEnvironment *)WeakRetained;
}

- (void)setEnvironment:(id)a3
{
}

- (DBApplication)application
{
  return self->_application;
}

- (void)setApplication:(id)a3
{
}

- (DBApplication)proxyApplication
{
  return self->_proxyApplication;
}

- (void)setProxyApplication:(id)a3
{
}

- (void)setSceneHostViewController:(id)a3
{
}

- (UIView)alertPresentationView
{
  return self->_alertPresentationView;
}

- (void)setAlertPresentationView:(id)a3
{
}

- (NSString)alertPresentationRequester
{
  return self->_alertPresentationRequester;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertPresentationRequester, 0);
  objc_storeStrong((id *)&self->_alertPresentationView, 0);
  objc_storeStrong((id *)&self->_sceneHostViewController, 0);
  objc_storeStrong((id *)&self->_proxyApplication, 0);
  objc_storeStrong((id *)&self->_application, 0);
  objc_destroyWeak((id *)&self->_environment);
  objc_storeStrong((id *)&self->_userAlert, 0);
  objc_storeStrong((id *)&self->_entity, 0);
}

@end
@interface AISSetupViewController
- (AISSetupContext)context;
- (AISSetupViewController)initWithContext:(id)a3;
- (BOOL)shouldAutoDismiss;
- (UIAction)dontSuggestUserAction;
- (UIAction)skipAction;
- (__AISSetupViewController)viewController;
- (id)reportHandler;
- (void)_updateAutoDismissal;
- (void)didMoveToParentViewController:(id)a3;
- (void)setContext:(id)a3;
- (void)setDontSuggestUserAction:(id)a3;
- (void)setReportHandler:(id)a3;
- (void)setShouldAutoDismiss:(BOOL)a3;
- (void)setSkipAction:(id)a3;
- (void)setViewController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation AISSetupViewController

- (AISSetupViewController)initWithContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AISSetupViewController;
  v6 = [(AISSetupViewController *)&v9 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    v7->_shouldAutoDismiss = 1;
  }

  return v7;
}

- (void)viewDidLoad
{
  v59[6] = *MEMORY[0x263EF8340];
  v58.receiver = self;
  v58.super_class = (Class)AISSetupViewController;
  [(AISSetupViewController *)&v58 viewDidLoad];
  v3 = [__AISSetupViewController alloc];
  v4 = [(AISSetupViewController *)self context];
  id v5 = [(AISSetupViewController *)self dontSuggestUserAction];
  v6 = [(AISSetupViewController *)self skipAction];
  BOOL v7 = [(AISSetupViewController *)self shouldAutoDismiss];
  v8 = [(AISSetupViewController *)self context];
  uint64_t v9 = [v8 isPreEstablishedClient];
  v10 = [(AISSetupViewController *)self reportHandler];
  v11 = [(__AISSetupViewController *)v3 initWithContext:v4 dontSuggestUserAction:v5 skipAction:v6 shouldAutoDismiss:v7 isPreEstablishedClient:v9 reportHandler:v10];
  viewController = self->_viewController;
  self->_viewController = v11;

  v13 = [(AISSetupViewController *)self viewController];
  v14 = [v13 view];
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];

  v15 = [(AISSetupViewController *)self viewController];
  [v15 willMoveToParentViewController:self];

  [(AISSetupViewController *)self addChildViewController:self->_viewController];
  v16 = [(AISSetupViewController *)self view];
  v17 = [(AISSetupViewController *)self viewController];
  v18 = [v17 view];
  [v16 addSubview:v18];

  v41 = (void *)MEMORY[0x263F08938];
  v57 = [(AISSetupViewController *)self viewController];
  v56 = [v57 view];
  v54 = [v56 topAnchor];
  v55 = [(AISSetupViewController *)self view];
  v53 = [v55 topAnchor];
  v52 = [v54 constraintEqualToAnchor:v53];
  v59[0] = v52;
  v51 = [(AISSetupViewController *)self viewController];
  v50 = [v51 view];
  v48 = [v50 bottomAnchor];
  v49 = [(AISSetupViewController *)self view];
  v47 = [v49 bottomAnchor];
  v46 = [v48 constraintEqualToAnchor:v47];
  v59[1] = v46;
  v45 = [(AISSetupViewController *)self viewController];
  v44 = [v45 view];
  v42 = [v44 leadingAnchor];
  v43 = [(AISSetupViewController *)self view];
  v40 = [v43 leadingAnchor];
  v39 = [v42 constraintEqualToAnchor:v40];
  v59[2] = v39;
  v38 = [(AISSetupViewController *)self viewController];
  v37 = [v38 view];
  v35 = [v37 trailingAnchor];
  v36 = [(AISSetupViewController *)self view];
  v34 = [v36 trailingAnchor];
  v33 = [v35 constraintEqualToAnchor:v34];
  v59[3] = v33;
  v32 = [(AISSetupViewController *)self viewController];
  v31 = [v32 view];
  v29 = [v31 centerXAnchor];
  v30 = [(AISSetupViewController *)self view];
  v19 = [v30 centerXAnchor];
  v20 = [v29 constraintEqualToAnchor:v19];
  v59[4] = v20;
  v21 = [(AISSetupViewController *)self viewController];
  v22 = [v21 view];
  v23 = [v22 centerYAnchor];
  v24 = [(AISSetupViewController *)self view];
  v25 = [v24 centerYAnchor];
  v26 = [v23 constraintEqualToAnchor:v25];
  v59[5] = v26;
  v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v59 count:6];
  [v41 activateConstraints:v27];

  v28 = [(AISSetupViewController *)self viewController];
  [v28 didMoveToParentViewController:self];

  [(AISSetupViewController *)self _updateAutoDismissal];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AISSetupViewController;
  [(AISSetupViewController *)&v4 viewDidAppear:a3];
  [(AISSetupViewController *)self _updateAutoDismissal];
}

- (void)didMoveToParentViewController:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AISSetupViewController;
  [(AISSetupViewController *)&v4 didMoveToParentViewController:a3];
  [(AISSetupViewController *)self _updateAutoDismissal];
}

- (void)setShouldAutoDismiss:(BOOL)a3
{
  self->_shouldAutoDismiss = a3;
  [(AISSetupViewController *)self _updateAutoDismissal];
}

- (void)_updateAutoDismissal
{
  v3 = [(AISSetupViewController *)self viewController];

  if (v3)
  {
    if ([(AISSetupViewController *)self shouldAutoDismiss])
    {
      objc_super v4 = [(AISSetupViewController *)self navigationController];
      BOOL v5 = v4 == 0;
    }
    else
    {
      BOOL v5 = 0;
    }
    id v6 = [(AISSetupViewController *)self viewController];
    [v6 setShouldAutoDismiss:v5];
  }
}

- (AISSetupContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (id)reportHandler
{
  return self->_reportHandler;
}

- (void)setReportHandler:(id)a3
{
}

- (BOOL)shouldAutoDismiss
{
  return self->_shouldAutoDismiss;
}

- (UIAction)dontSuggestUserAction
{
  return self->_dontSuggestUserAction;
}

- (void)setDontSuggestUserAction:(id)a3
{
}

- (UIAction)skipAction
{
  return self->_skipAction;
}

- (void)setSkipAction:(id)a3
{
}

- (__AISSetupViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_skipAction, 0);
  objc_storeStrong((id *)&self->_dontSuggestUserAction, 0);
  objc_storeStrong(&self->_reportHandler, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
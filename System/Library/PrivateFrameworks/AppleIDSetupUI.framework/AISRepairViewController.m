@interface AISRepairViewController
- (AISRepairContext)context;
- (AISRepairViewController)initWithContext:(id)a3;
- (BOOL)shouldAutoDismiss;
- (__AISRepairViewController)viewController;
- (id)reportHandler;
- (void)_updateAutoDismissal;
- (void)setContext:(id)a3;
- (void)setReportHandler:(id)a3;
- (void)setShouldAutoDismiss:(BOOL)a3;
- (void)setViewController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation AISRepairViewController

- (AISRepairViewController)initWithContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AISRepairViewController;
  v6 = [(AISRepairViewController *)&v9 initWithNibName:0 bundle:0];
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
  v54[6] = *MEMORY[0x263EF8340];
  v53.receiver = self;
  v53.super_class = (Class)AISRepairViewController;
  [(AISRepairViewController *)&v53 viewDidLoad];
  v3 = [__AISRepairViewController alloc];
  v4 = [(AISRepairViewController *)self context];
  id v5 = [(AISRepairViewController *)self reportHandler];
  v6 = [(__AISRepairViewController *)v3 initWithContext:v4 reportHandler:v5];
  viewController = self->_viewController;
  self->_viewController = v6;

  v8 = [(AISRepairViewController *)self viewController];
  objc_super v9 = [v8 view];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

  v10 = [(AISRepairViewController *)self viewController];
  [v10 willMoveToParentViewController:self];

  [(AISRepairViewController *)self addChildViewController:self->_viewController];
  v11 = [(AISRepairViewController *)self view];
  v12 = [(AISRepairViewController *)self viewController];
  v13 = [v12 view];
  [v11 addSubview:v13];

  v36 = (void *)MEMORY[0x263F08938];
  v52 = [(AISRepairViewController *)self viewController];
  v51 = [v52 view];
  v49 = [v51 topAnchor];
  v50 = [(AISRepairViewController *)self view];
  v48 = [v50 topAnchor];
  v47 = [v49 constraintEqualToAnchor:v48];
  v54[0] = v47;
  v46 = [(AISRepairViewController *)self viewController];
  v45 = [v46 view];
  v43 = [v45 bottomAnchor];
  v44 = [(AISRepairViewController *)self view];
  v42 = [v44 bottomAnchor];
  v41 = [v43 constraintEqualToAnchor:v42];
  v54[1] = v41;
  v40 = [(AISRepairViewController *)self viewController];
  v39 = [v40 view];
  v37 = [v39 leadingAnchor];
  v38 = [(AISRepairViewController *)self view];
  v35 = [v38 leadingAnchor];
  v34 = [v37 constraintEqualToAnchor:v35];
  v54[2] = v34;
  v33 = [(AISRepairViewController *)self viewController];
  v32 = [v33 view];
  v30 = [v32 trailingAnchor];
  v31 = [(AISRepairViewController *)self view];
  v29 = [v31 trailingAnchor];
  v28 = [v30 constraintEqualToAnchor:v29];
  v54[3] = v28;
  v27 = [(AISRepairViewController *)self viewController];
  v26 = [v27 view];
  v24 = [v26 centerXAnchor];
  v25 = [(AISRepairViewController *)self view];
  v14 = [v25 centerXAnchor];
  v15 = [v24 constraintEqualToAnchor:v14];
  v54[4] = v15;
  v16 = [(AISRepairViewController *)self viewController];
  v17 = [v16 view];
  v18 = [v17 centerYAnchor];
  v19 = [(AISRepairViewController *)self view];
  v20 = [v19 centerYAnchor];
  v21 = [v18 constraintEqualToAnchor:v20];
  v54[5] = v21;
  v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v54 count:6];
  [v36 activateConstraints:v22];

  v23 = [(AISRepairViewController *)self viewController];
  [v23 didMoveToParentViewController:self];

  [(AISRepairViewController *)self _updateAutoDismissal];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AISRepairViewController;
  [(AISRepairViewController *)&v4 viewDidAppear:a3];
  [(AISRepairViewController *)self _updateAutoDismissal];
}

- (void)setShouldAutoDismiss:(BOOL)a3
{
  self->_shouldAutoDismiss = a3;
  [(AISRepairViewController *)self _updateAutoDismissal];
}

- (void)_updateAutoDismissal
{
  v3 = [(AISRepairViewController *)self viewController];

  if (v3)
  {
    if ([(AISRepairViewController *)self shouldAutoDismiss])
    {
      objc_super v4 = [(AISRepairViewController *)self navigationController];
      BOOL v5 = v4 == 0;
    }
    else
    {
      BOOL v5 = 0;
    }
    id v6 = [(AISRepairViewController *)self viewController];
    [v6 setShouldAutoDismiss:v5];
  }
}

- (AISRepairContext)context
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

- (__AISRepairViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong(&self->_reportHandler, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
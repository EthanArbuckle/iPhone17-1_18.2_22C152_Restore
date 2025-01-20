@interface PKTextInputDebugViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_needsReloadData;
- (BOOL)_needsReloadTargetsVisualization;
- (BOOL)_visualizeTargets;
- (NSArray)_statusViewPositionConstraints;
- (NSTimer)_autoreloadTimer;
- (PKTextInputDebugLogController)debugLogController;
- (PKTextInputDebugStateIntrospector)introspectorDataSource;
- (PKTextInputDebugTargetsView)_targetsContainerView;
- (PKTextInputDebugViewControllerDelegate)delegate;
- (PKTextInputElementsController)elementsController;
- (UITableView)_statusTableView;
- (UIToolbar)_statusViewToolbar;
- (UIView)_statusContainerView;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)statusViewAnchorCorner;
- (void)_configureCell:(id)a3 forItemAtIndex:(int64_t)a4;
- (void)_handleCloseButton:(id)a3;
- (void)_handleLogButton:(id)a3;
- (void)_handleRadarButton:(id)a3;
- (void)_handleTargetsButton:(id)a3;
- (void)_reloadDebugStateData;
- (void)_reloadTargetsVisualization;
- (void)_setVisualizeTargets:(BOOL)a3;
- (void)_setupStatusView;
- (void)_updateStatusView;
- (void)_updateTargetsVisualizationView;
- (void)debugViewTableCellDidTapDetailsButton:(id)a3;
- (void)loadView;
- (void)setDebugLogController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setElementsController:(id)a3;
- (void)setIntrospectorDataSource:(id)a3;
- (void)setNeedsReloadDebugStateData;
- (void)setNeedsReloadTargetsVisualization;
- (void)setStatusViewAnchorCorner:(unint64_t)a3;
- (void)set_autoreloadTimer:(id)a3;
- (void)set_needsReloadData:(BOOL)a3;
- (void)set_needsReloadTargetsVisualization:(BOOL)a3;
- (void)set_statusContainerView:(id)a3;
- (void)set_statusTableView:(id)a3;
- (void)set_statusViewPositionConstraints:(id)a3;
- (void)set_statusViewToolbar:(id)a3;
- (void)set_targetsContainerView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation PKTextInputDebugViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)loadView
{
  v3 = [PKTexInputDebugContainerView alloc];
  v4 = -[PKTexInputDebugContainerView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(PKTextInputDebugViewController *)self setView:v4];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)PKTextInputDebugViewController;
  [(PKTextInputDebugViewController *)&v3 viewDidLoad];
  [(PKTextInputDebugViewController *)self _setupStatusView];
  [(PKTextInputDebugViewController *)self setStatusViewAnchorCorner:8];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKTextInputDebugViewController;
  [(PKTextInputDebugViewController *)&v5 viewDidAppear:a3];
  v4 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__handleAutoreloadTimerFired selector:0 userInfo:1 repeats:1.0];
  [(PKTextInputDebugViewController *)self set_autoreloadTimer:v4];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKTextInputDebugViewController;
  [(PKTextInputDebugViewController *)&v5 viewDidDisappear:a3];
  v4 = [(PKTextInputDebugViewController *)self _autoreloadTimer];
  [v4 invalidate];

  [(PKTextInputDebugViewController *)self set_autoreloadTimer:0];
}

- (void)_setupStatusView
{
  v67[5] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v8 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], v5, v6, v7);
  [(PKTextInputDebugViewController *)self set_statusContainerView:v8];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v8 setOpaque:0];
  v9 = [MEMORY[0x1E4FB1618] whiteColor];
  [v8 setTintColor:v9];

  [v8 setClipsToBounds:1];
  v10 = [v8 layer];
  [v10 setCornerRadius:12.0];

  v11 = [(PKTextInputDebugViewController *)self view];
  [v11 addSubview:v8];

  v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1DF0]), "initWithFrame:", v4, v5, v6, v7);
  [(PKTextInputDebugViewController *)self set_statusViewToolbar:v12];
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v12 setOpaque:0];
  [v8 addSubview:v12];
  v61 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
  id v13 = objc_alloc(MEMORY[0x1E4FB14A8]);
  v14 = [MEMORY[0x1E4FB1818] systemImageNamed:@"ant.fill"];
  uint64_t v15 = [v13 initWithImage:v14 style:0 target:self action:sel__handleRadarButton_];

  v60 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:@"Targets" style:0 target:self action:sel__handleTargetsButton_];
  v59 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:@"Log" style:0 target:self action:sel__handleLogButton_];
  v57 = (void *)v15;
  v58 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel__handleCloseButton_];
  v16 = (void *)v15;
  v67[0] = v15;
  v67[1] = v61;
  v67[2] = v60;
  v67[3] = v59;
  v67[4] = v58;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:5];
  [v12 setItems:v17];

  [v16 setEnabled:os_variant_has_internal_diagnostics()];
  v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1D00]), "initWithFrame:style:", 0, v4, v5, v6, v7);
  [(PKTextInputDebugViewController *)self set_statusTableView:v18];
  [v18 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v18 setAllowsSelection:0];
  [v8 addSubview:v18];
  [v18 setDataSource:self];
  [v18 setDelegate:self];
  uint64_t v19 = objc_opt_class();
  v20 = (objc_class *)objc_opt_class();
  v21 = NSStringFromClass(v20);
  [v18 registerClass:v19 forCellReuseIdentifier:v21];

  [v18 setOpaque:0];
  [v18 setSeparatorStyle:0];
  [v18 setEstimatedRowHeight:30.0];
  [v18 setRowHeight:*MEMORY[0x1E4FB2F28]];
  [v18 setSectionHeaderHeight:28.0];
  objc_msgSend(v18, "setContentInset:", 0.0, 0.0, 12.0, 0.0);
  v22 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.7];
  [v8 setBackgroundColor:v22];

  v23 = v12;
  [v12 setBarStyle:1];
  id v24 = objc_alloc_init(MEMORY[0x1E4FB1818]);
  [v12 setBackgroundImage:v24 forToolbarPosition:0 barMetrics:0];

  id v25 = objc_alloc_init(MEMORY[0x1E4FB1818]);
  [v12 setShadowImage:v25 forToolbarPosition:0];

  v26 = [MEMORY[0x1E4FB1618] clearColor];
  [v18 setBackgroundColor:v26];

  v63 = [MEMORY[0x1E4F1CA48] array];
  v27 = [v8 heightAnchor];
  v28 = [v27 constraintEqualToConstant:500.0];
  v66[0] = v28;
  v29 = [v8 widthAnchor];
  v30 = [v29 constraintEqualToConstant:320.0];
  v66[1] = v30;
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:2];
  [v63 addObjectsFromArray:v31];

  v32 = v23;
  v54 = [v23 topAnchor];
  v52 = [v8 topAnchor];
  v33 = [v54 constraintEqualToAnchor:v52];
  v65[0] = v33;
  v34 = [v23 leadingAnchor];
  v62 = v8;
  v35 = [v8 leadingAnchor];
  v36 = [v34 constraintEqualToAnchor:v35];
  v65[1] = v36;
  v56 = v32;
  v37 = [v32 trailingAnchor];
  v38 = [v8 trailingAnchor];
  v39 = [v37 constraintEqualToAnchor:v38];
  v65[2] = v39;
  v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:3];
  [v63 addObjectsFromArray:v40];

  v55 = [v18 topAnchor];
  v53 = [v32 bottomAnchor];
  v51 = [v55 constraintEqualToAnchor:v53];
  v64[0] = v51;
  v50 = [v18 bottomAnchor];
  v49 = [v62 bottomAnchor];
  v41 = [v50 constraintEqualToAnchor:v49];
  v64[1] = v41;
  v42 = [v18 leadingAnchor];
  v43 = [v62 leadingAnchor];
  v44 = [v42 constraintEqualToAnchor:v43];
  v64[2] = v44;
  v45 = [v18 trailingAnchor];
  v46 = [v62 trailingAnchor];
  v47 = [v45 constraintEqualToAnchor:v46];
  v64[3] = v47;
  v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:4];
  [v63 addObjectsFromArray:v48];

  [MEMORY[0x1E4F28DC8] activateConstraints:v63];
}

- (void)setStatusViewAnchorCorner:(unint64_t)a3
{
  if (self->_statusViewAnchorCorner != a3)
  {
    self->_statusViewAnchorCorner = a3;
    [(PKTextInputDebugViewController *)self _updateStatusView];
  }
}

- (void)setElementsController:(id)a3
{
  double v5 = (PKTextInputElementsController *)a3;
  if (self->_elementsController != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_elementsController, a3);
    [(PKTextInputDebugViewController *)self setNeedsReloadTargetsVisualization];
    double v5 = v6;
  }
}

- (void)setNeedsReloadDebugStateData
{
  if (![(PKTextInputDebugViewController *)self _needsReloadData])
  {
    [(PKTextInputDebugViewController *)self set_needsReloadData:1];
    [(PKTextInputDebugViewController *)self performSelector:sel__reloadDebugStateData withObject:0 afterDelay:0.0];
  }
}

- (void)setNeedsReloadTargetsVisualization
{
  if (![(PKTextInputDebugViewController *)self _needsReloadTargetsVisualization])
  {
    [(PKTextInputDebugViewController *)self set_needsReloadTargetsVisualization:1];
    [(PKTextInputDebugViewController *)self performSelector:sel__reloadTargetsVisualization withObject:0 afterDelay:0.0];
  }
}

- (void)_updateStatusView
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v3 = [(PKTextInputDebugViewController *)self _statusViewPositionConstraints];

  if (v3)
  {
    double v4 = (void *)MEMORY[0x1E4F28DC8];
    double v5 = [(PKTextInputDebugViewController *)self _statusViewPositionConstraints];
    [v4 deactivateConstraints:v5];

    [(PKTextInputDebugViewController *)self set_statusViewPositionConstraints:0];
  }
  double v6 = [(PKTextInputDebugViewController *)self _statusContainerView];
  unint64_t v7 = [(PKTextInputDebugViewController *)self statusViewAnchorCorner];
  switch(v7)
  {
    case 4uLL:
      v17 = [v6 bottomAnchor];
      v9 = [(PKTextInputDebugViewController *)self view];
      v10 = [v9 bottomAnchor];
      v21 = v17;
      v11 = [v17 constraintEqualToAnchor:v10 constant:-60.0];
      v23[0] = v11;
      v12 = [v6 leadingAnchor];
      id v13 = [(PKTextInputDebugViewController *)self view];
      v14 = [v13 leadingAnchor];
      uint64_t v15 = [v12 constraintEqualToAnchor:v14 constant:22.0];
      v23[1] = v15;
      v16 = v23;
      break;
    case 2uLL:
      v18 = [v6 topAnchor];
      v9 = [(PKTextInputDebugViewController *)self view];
      v10 = [v9 topAnchor];
      v21 = v18;
      v11 = [v18 constraintEqualToAnchor:v10 constant:60.0];
      v24[0] = v11;
      v12 = [v6 trailingAnchor];
      id v13 = [(PKTextInputDebugViewController *)self view];
      v14 = [v13 trailingAnchor];
      uint64_t v15 = [v12 constraintEqualToAnchor:v14 constant:-22.0];
      v24[1] = v15;
      v16 = v24;
      break;
    case 1uLL:
      v8 = [v6 topAnchor];
      v9 = [(PKTextInputDebugViewController *)self view];
      v10 = [v9 topAnchor];
      v21 = v8;
      v11 = [v8 constraintEqualToAnchor:v10 constant:60.0];
      v25[0] = v11;
      v12 = [v6 leadingAnchor];
      id v13 = [(PKTextInputDebugViewController *)self view];
      v14 = [v13 leadingAnchor];
      uint64_t v15 = [v12 constraintEqualToAnchor:v14 constant:22.0];
      v25[1] = v15;
      v16 = v25;
      break;
    default:
      uint64_t v19 = [v6 bottomAnchor];
      v9 = [(PKTextInputDebugViewController *)self view];
      v10 = [v9 bottomAnchor];
      v21 = v19;
      v11 = [v19 constraintEqualToAnchor:v10 constant:-60.0];
      v22[0] = v11;
      v12 = [v6 trailingAnchor];
      id v13 = [(PKTextInputDebugViewController *)self view];
      v14 = [v13 trailingAnchor];
      uint64_t v15 = [v12 constraintEqualToAnchor:v14 constant:-22.0];
      v22[1] = v15;
      v16 = v22;
      break;
  }
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];

  [MEMORY[0x1E4F28DC8] activateConstraints:v20];
  [(PKTextInputDebugViewController *)self set_statusViewPositionConstraints:v20];
}

- (void)_reloadDebugStateData
{
  id v3 = [(PKTextInputDebugViewController *)self _statusTableView];
  [v3 reloadData];

  [(PKTextInputDebugViewController *)self set_needsReloadData:0];
}

- (void)_setVisualizeTargets:(BOOL)a3
{
  if (self->__visualizeTargets != a3)
  {
    self->__visualizeTargets = a3;
    [(PKTextInputDebugViewController *)self _updateTargetsVisualizationView];
    if (self->__visualizeTargets)
    {
      [(PKTextInputDebugViewController *)self setNeedsReloadTargetsVisualization];
    }
  }
}

- (void)_updateTargetsVisualizationView
{
  BOOL v3 = [(PKTextInputDebugViewController *)self _visualizeTargets];
  double v4 = [(PKTextInputDebugViewController *)self _targetsContainerView];

  if (!v3 || v4)
  {
    if (v4) {
      char v11 = v3;
    }
    else {
      char v11 = 1;
    }
    if ((v11 & 1) == 0)
    {
      v12 = [(PKTextInputDebugViewController *)self _targetsContainerView];
      [v12 removeFromSuperview];

      [(PKTextInputDebugViewController *)self set_targetsContainerView:0];
    }
  }
  else
  {
    double v5 = [PKTextInputDebugTargetsView alloc];
    double v6 = [(PKTextInputDebugViewController *)self view];
    [v6 bounds];
    unint64_t v7 = -[PKTextInputDebugTargetsView initWithFrame:](v5, "initWithFrame:");
    [(PKTextInputDebugViewController *)self set_targetsContainerView:v7];

    v8 = [(PKTextInputDebugViewController *)self _targetsContainerView];
    [v8 setAutoresizingMask:18];

    id v13 = [(PKTextInputDebugViewController *)self view];
    v9 = [(PKTextInputDebugViewController *)self _targetsContainerView];
    v10 = [(PKTextInputDebugViewController *)self _statusContainerView];
    [v13 insertSubview:v9 belowSubview:v10];
  }
}

- (void)_reloadTargetsVisualization
{
  if ([(PKTextInputDebugViewController *)self _visualizeTargets])
  {
    uint64_t v3 = [(PKTextInputDebugViewController *)self elementsController];
    double v4 = (void *)v3;
    if (v3) {
      double v5 = *(void **)(v3 + 40);
    }
    else {
      double v5 = 0;
    }
    id v6 = v5;
    unint64_t v7 = [v6 allValues];

    v8 = (void *)MEMORY[0x1E4F1CBF0];
    if (v7) {
      v8 = v7;
    }
    id v9 = v8;

    v10 = [(PKTextInputDebugViewController *)self _targetsContainerView];
    [v10 setVisualizationElements:v9];
  }

  [(PKTextInputDebugViewController *)self set_needsReloadTargetsVisualization:0];
}

- (void)_handleCloseButton:(id)a3
{
  id v4 = [(PKTextInputDebugViewController *)self delegate];
  [v4 debugViewControllerNeedsDismiss:self];
}

- (void)_handleTargetsButton:(id)a3
{
  uint64_t v4 = [(PKTextInputDebugViewController *)self _visualizeTargets] ^ 1;

  [(PKTextInputDebugViewController *)self _setVisualizeTargets:v4];
}

- (void)_handleLogButton:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PKTextInputDebugViewController *)self introspectorDataSource];
  uint64_t v4 = [v3 fullDebugStateDescription];

  double v5 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    unint64_t v7 = v4;
    _os_log_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_DEFAULT, "Pencil Text Input State:\n%@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)_handleRadarButton:(id)a3
{
  uint64_t v4 = [(PKTextInputDebugViewController *)self debugLogController];
  -[PKTextInputDebugLogController sharpenerLogWithCurrentContent](v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  double v5 = [[PKTextInputDebugRadarViewController alloc] initWithSharpenerLog:v7];
  int v6 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v5];
  [v6 setModalPresentationStyle:2];
  [(PKTextInputDebugViewController *)self presentViewController:v6 animated:1 completion:0];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v4 = [(PKTextInputDebugViewController *)self introspectorDataSource];
  double v5 = [v4 debugStateKeys];
  int64_t v6 = [v5 count];

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (objc_class *)objc_opt_class();
  id v9 = NSStringFromClass(v8);
  v10 = [v7 dequeueReusableCellWithIdentifier:v9 forIndexPath:v6];

  if (![v6 section]) {
    -[PKTextInputDebugViewController _configureCell:forItemAtIndex:](self, "_configureCell:forItemAtIndex:", v10, [v6 item]);
  }

  return v10;
}

- (void)_configureCell:(id)a3 forItemAtIndex:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(PKTextInputDebugViewController *)self introspectorDataSource];
  uint64_t v8 = [v7 debugStateKeys];
  id v15 = [v8 objectAtIndex:a4];

  id v9 = [(PKTextInputDebugViewController *)self introspectorDataSource];
  v10 = [v9 debugStateTitleForStateKey:v15];

  char v11 = [(PKTextInputDebugViewController *)self introspectorDataSource];
  v12 = [v11 debugStateDescriptionForStateKey:v15];

  id v13 = [(PKTextInputDebugViewController *)self introspectorDataSource];
  uint64_t v14 = [v13 debugStateCanShowDetailsForStateKey:v15];

  [v6 setTitleText:v10];
  [v6 setValueAttributedText:v12];
  [v6 setShowDetailsButton:v14];
  [v6 setStatusKey:v15];
  [v6 setDelegate:self];
}

- (void)debugViewTableCellDidTapDetailsButton:(id)a3
{
  id v7 = [a3 statusKey];
  uint64_t v4 = [(PKTextInputDebugViewController *)self introspectorDataSource];
  double v5 = [v4 debugStateDetailViewControllerForStateKey:v7];

  if (v5)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v5];
    [v6 setModalPresentationStyle:2];
    [(PKTextInputDebugViewController *)self presentViewController:v6 animated:1 completion:0];
  }
}

- (PKTextInputDebugStateIntrospector)introspectorDataSource
{
  return self->_introspectorDataSource;
}

- (void)setIntrospectorDataSource:(id)a3
{
}

- (PKTextInputDebugViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKTextInputDebugViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PKTextInputDebugLogController)debugLogController
{
  return self->_debugLogController;
}

- (void)setDebugLogController:(id)a3
{
}

- (PKTextInputElementsController)elementsController
{
  return self->_elementsController;
}

- (unint64_t)statusViewAnchorCorner
{
  return self->_statusViewAnchorCorner;
}

- (UIView)_statusContainerView
{
  return self->__statusContainerView;
}

- (void)set_statusContainerView:(id)a3
{
}

- (UITableView)_statusTableView
{
  return self->__statusTableView;
}

- (void)set_statusTableView:(id)a3
{
}

- (UIToolbar)_statusViewToolbar
{
  return self->__statusViewToolbar;
}

- (void)set_statusViewToolbar:(id)a3
{
}

- (PKTextInputDebugTargetsView)_targetsContainerView
{
  return self->__targetsContainerView;
}

- (void)set_targetsContainerView:(id)a3
{
}

- (NSArray)_statusViewPositionConstraints
{
  return self->__statusViewPositionConstraints;
}

- (void)set_statusViewPositionConstraints:(id)a3
{
}

- (BOOL)_visualizeTargets
{
  return self->__visualizeTargets;
}

- (BOOL)_needsReloadData
{
  return self->__needsReloadData;
}

- (void)set_needsReloadData:(BOOL)a3
{
  self->__needsReloadData = a3;
}

- (BOOL)_needsReloadTargetsVisualization
{
  return self->__needsReloadTargetsVisualization;
}

- (void)set_needsReloadTargetsVisualization:(BOOL)a3
{
  self->__needsReloadTargetsVisualization = a3;
}

- (NSTimer)_autoreloadTimer
{
  return self->__autoreloadTimer;
}

- (void)set_autoreloadTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__autoreloadTimer, 0);
  objc_storeStrong((id *)&self->__statusViewPositionConstraints, 0);
  objc_storeStrong((id *)&self->__targetsContainerView, 0);
  objc_storeStrong((id *)&self->__statusViewToolbar, 0);
  objc_storeStrong((id *)&self->__statusTableView, 0);
  objc_storeStrong((id *)&self->__statusContainerView, 0);
  objc_storeStrong((id *)&self->_elementsController, 0);
  objc_storeStrong((id *)&self->_debugLogController, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_introspectorDataSource, 0);
}

@end
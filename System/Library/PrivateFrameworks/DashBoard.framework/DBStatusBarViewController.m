@interface DBStatusBarViewController
- (BOOL)_isDualStatusBarLayout;
- (DBEnvironmentConfiguration)environmentConfiguration;
- (DBStatusBarStateProvider)stateProvider;
- (DBStatusBarViewController)initWithStateProvider:(id)a3 layout:(unint64_t)a4 environmentConfiguration:(id)a5;
- (STUIStatusBar_Wrapper)statusBarView;
- (unint64_t)layout;
- (void)_createStatusBar;
- (void)_subscribeDataTypes;
- (void)dealloc;
- (void)setEnvironmentConfiguration:(id)a3;
- (void)setLayout:(unint64_t)a3;
- (void)setStateProvider:(id)a3;
- (void)setStatusBarView:(id)a3;
- (void)statusBarEdgeUpdated;
- (void)viewDidLoad;
@end

@implementation DBStatusBarViewController

- (DBStatusBarViewController)initWithStateProvider:(id)a3 layout:(unint64_t)a4 environmentConfiguration:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)DBStatusBarViewController;
  v11 = [(DBStatusBarViewController *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_stateProvider, a3);
    v12->_layout = a4;
    objc_storeStrong((id *)&v12->_environmentConfiguration, a5);
  }

  return v12;
}

- (void)dealloc
{
  v3 = [(DBStatusBarViewController *)self stateProvider];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)DBStatusBarViewController;
  [(DBStatusBarViewController *)&v4 dealloc];
}

- (void)_createStatusBar
{
  v46[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F7C458]);
  objc_super v4 = [(DBStatusBarViewController *)self stateProvider];
  v5 = objc_msgSend(v3, "initWithFrame:showForegroundView:inProcessStateProvider:", 1, v4, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(DBStatusBarViewController *)self setStatusBarView:v5];

  if (![(DBStatusBarViewController *)self _isDualStatusBarLayout])
  {
    id v10 = [(DBStatusBarViewController *)self environmentConfiguration];
    if ([v10 currentStatusBarEdge] == 1)
    {
    }
    else
    {
      v11 = [(DBStatusBarViewController *)self environmentConfiguration];
      uint64_t v12 = [v11 currentStatusBarEdge];

      if (v12 != 3) {
        goto LABEL_12;
      }
    }
    v6 = [(DBStatusBarViewController *)self statusBarView];
    v8 = [v6 statusBar];
    uint64_t v45 = *MEMORY[0x263F7C460];
    v46[0] = MEMORY[0x263EFFA88];
    v13 = [NSDictionary dictionaryWithObjects:v46 forKeys:&v45 count:1];
    [v8 setVisualProviderInfo:v13];

    goto LABEL_11;
  }
  if ([(DBStatusBarViewController *)self layout] == 1)
  {
    v6 = [(DBStatusBarViewController *)self statusBarView];
    v7 = [v6 statusBar];
    v8 = v7;
    id v9 = &unk_26E17F1A0;
LABEL_8:
    [v7 setVisualProviderInfo:v9];
LABEL_11:

    goto LABEL_12;
  }
  if ([(DBStatusBarViewController *)self layout] == 2)
  {
    v6 = [(DBStatusBarViewController *)self statusBarView];
    v7 = [v6 statusBar];
    v8 = v7;
    id v9 = &unk_26E17F1C8;
    goto LABEL_8;
  }
LABEL_12:
  objc_super v14 = [(DBStatusBarViewController *)self statusBarView];
  v15 = [v14 statusBar];
  v16 = [MEMORY[0x263F82B60] _carScreen];
  [v15 setTargetScreen:v16];

  v17 = [(DBStatusBarViewController *)self statusBarView];
  [v17 setTranslatesAutoresizingMaskIntoConstraints:0];

  v18 = [(DBStatusBarViewController *)self statusBarView];
  v19 = [(DBStatusBarViewController *)self stateProvider];
  [v18 setStyleDelegate:v19];

  [(DBStatusBarViewController *)self _subscribeDataTypes];
  v20 = [(DBStatusBarViewController *)self view];
  v21 = [(DBStatusBarViewController *)self statusBarView];
  [v20 addSubview:v21];

  v34 = (void *)MEMORY[0x263F08938];
  v43 = [(DBStatusBarViewController *)self statusBarView];
  v41 = [v43 leadingAnchor];
  v42 = [(DBStatusBarViewController *)self view];
  v40 = [v42 leadingAnchor];
  v39 = [v41 constraintEqualToAnchor:v40];
  v44[0] = v39;
  v38 = [(DBStatusBarViewController *)self statusBarView];
  v36 = [v38 trailingAnchor];
  v37 = [(DBStatusBarViewController *)self view];
  v35 = [v37 trailingAnchor];
  v33 = [v36 constraintEqualToAnchor:v35];
  v44[1] = v33;
  v32 = [(DBStatusBarViewController *)self statusBarView];
  v22 = [v32 topAnchor];
  v23 = [(DBStatusBarViewController *)self view];
  v24 = [v23 topAnchor];
  v25 = [v22 constraintEqualToAnchor:v24];
  v44[2] = v25;
  v26 = [(DBStatusBarViewController *)self statusBarView];
  v27 = [v26 bottomAnchor];
  v28 = [(DBStatusBarViewController *)self view];
  v29 = [v28 bottomAnchor];
  v30 = [v27 constraintEqualToAnchor:v29];
  v44[3] = v30;
  v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:4];
  [v34 activateConstraints:v31];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)DBStatusBarViewController;
  [(DBStatusBarViewController *)&v3 viewDidLoad];
  [(DBStatusBarViewController *)self _createStatusBar];
}

- (void)statusBarEdgeUpdated
{
  objc_super v3 = [(DBStatusBarViewController *)self statusBarView];
  [v3 removeFromSuperview];

  [(DBStatusBarViewController *)self setStatusBarView:0];
  [(DBStatusBarViewController *)self _createStatusBar];
}

- (BOOL)_isDualStatusBarLayout
{
  unint64_t v3 = [(DBStatusBarViewController *)self layout];
  if (v3 != 1) {
    LOBYTE(v3) = [(DBStatusBarViewController *)self layout] == 2;
  }
  return v3;
}

- (void)_subscribeDataTypes
{
  unint64_t v3 = [(DBStatusBarViewController *)self layout];
  if (v3 > 2) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = qword_22D86EFF0[v3];
  }
  id v5 = [(DBStatusBarViewController *)self stateProvider];
  [v5 subscribeForDataType:v4];
}

- (DBStatusBarStateProvider)stateProvider
{
  return self->_stateProvider;
}

- (void)setStateProvider:(id)a3
{
}

- (STUIStatusBar_Wrapper)statusBarView
{
  return self->_statusBarView;
}

- (void)setStatusBarView:(id)a3
{
}

- (DBEnvironmentConfiguration)environmentConfiguration
{
  return self->_environmentConfiguration;
}

- (void)setEnvironmentConfiguration:(id)a3
{
}

- (unint64_t)layout
{
  return self->_layout;
}

- (void)setLayout:(unint64_t)a3
{
  self->_layout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environmentConfiguration, 0);
  objc_storeStrong((id *)&self->_statusBarView, 0);
  objc_storeStrong((id *)&self->_stateProvider, 0);
}

@end
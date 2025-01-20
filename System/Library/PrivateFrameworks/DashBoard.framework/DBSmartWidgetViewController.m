@interface DBSmartWidgetViewController
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)isHighPriority;
- (BOOL)wantsToShowPrediction;
- (DBSmartWidgetAnimating)animationDelegate;
- (DBSmartWidgetEngine)engine;
- (DBSmartWidgetView)widgetView;
- (DBSmartWidgetViewController)initWithEnvironment:(id)a3 engine:(id)a4 animationDelegate:(id)a5;
- (NSSet)recognizers;
- (UIActivityIndicatorView)spinnerView;
- (UILongPressGestureRecognizer)refreshRecognizer;
- (UISwipeGestureRecognizer)nextPredictionRecognizer;
- (UISwipeGestureRecognizer)previousPredictionRecognizer;
- (UITapGestureRecognizer)actionRecognizer;
- (UITapGestureRecognizer)actionSelectRecognizer;
- (int64_t)currentPredictionIndex;
- (void)_nextPrediction;
- (void)_performAction;
- (void)_previousPrediction;
- (void)_refresh;
- (void)_updatePrediction;
- (void)setActionRecognizer:(id)a3;
- (void)setActionSelectRecognizer:(id)a3;
- (void)setAnimationDelegate:(id)a3;
- (void)setCurrentPredictionIndex:(int64_t)a3;
- (void)setNextPredictionRecognizer:(id)a3;
- (void)setPreviousPredictionRecognizer:(id)a3;
- (void)setRecognizers:(id)a3;
- (void)setRefreshRecognizer:(id)a3;
- (void)setSpinnerView:(id)a3;
- (void)setWantsToShowPrediction:(BOOL)a3;
- (void)setWidgetView:(id)a3;
- (void)smartWidgetEngine:(id)a3 didUpdateCurrentPredictions:(id)a4;
- (void)viewDidLoad;
@end

@implementation DBSmartWidgetViewController

- (DBSmartWidgetViewController)initWithEnvironment:(id)a3 engine:(id)a4 animationDelegate:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)DBSmartWidgetViewController;
  v11 = [(DBWidgetViewController *)&v23 initWithEnvironment:a3];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_animationDelegate, v10);
    v13 = [DBSmartWidgetView alloc];
    uint64_t v14 = -[DBSmartWidgetView initWithFrame:](v13, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    widgetView = v12->_widgetView;
    v12->_widgetView = (DBSmartWidgetView *)v14;

    [(DBSmartWidgetView *)v12->_widgetView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(DBSmartWidgetView *)v12->_widgetView setEngine:v9];
    v12->_currentPredictionIndex = 0;
    uint64_t v16 = [objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:101];
    spinnerView = v12->_spinnerView;
    v12->_spinnerView = (UIActivityIndicatorView *)v16;

    v18 = [MEMORY[0x263F825C8] _labelColor];
    [(UIActivityIndicatorView *)v12->_spinnerView setColor:v18];

    [(UIActivityIndicatorView *)v12->_spinnerView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIActivityIndicatorView *)v12->_spinnerView setHidesWhenStopped:1];
    objc_storeStrong((id *)&v12->_engine, a4);
    objc_initWeak(&location, v12);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __76__DBSmartWidgetViewController_initWithEnvironment_engine_animationDelegate___block_invoke;
    v20[3] = &unk_2649B4738;
    objc_copyWeak(&v21, &location);
    dispatch_async(MEMORY[0x263EF83A0], v20);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v12;
}

void __76__DBSmartWidgetViewController_initWithEnvironment_engine_animationDelegate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updatePrediction];
  v1 = [WeakRetained engine];
  [v1 addObserver:WeakRetained];
}

- (BOOL)isHighPriority
{
  v2 = [(DBSmartWidgetViewController *)self engine];
  char v3 = [v2 hasHighPriorityPrediction];

  return v3;
}

- (void)viewDidLoad
{
  v79[4] = *MEMORY[0x263EF8340];
  v77.receiver = self;
  v77.super_class = (Class)DBSmartWidgetViewController;
  [(DBSmartWidgetViewController *)&v77 viewDidLoad];
  char v3 = [(DBSmartWidgetViewController *)self view];
  [v3 setAccessibilityIdentifier:@"CARAppTodaySmartViewWidget"];

  v4 = objc_opt_new();
  v5 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel__performAction];
  [(DBSmartWidgetViewController *)self setActionRecognizer:v5];

  v6 = [(DBSmartWidgetViewController *)self actionRecognizer];
  [v6 setDelegate:self];

  v7 = [(DBWidgetViewController *)self contentView];
  v8 = [(DBSmartWidgetViewController *)self actionRecognizer];
  [v7 addGestureRecognizer:v8];

  id v9 = [(DBSmartWidgetViewController *)self actionRecognizer];
  [v4 addObject:v9];

  id v10 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel__performAction];
  [(DBSmartWidgetViewController *)self setActionSelectRecognizer:v10];

  v11 = [(DBSmartWidgetViewController *)self actionSelectRecognizer];
  [v11 setAllowedPressTypes:&unk_26E17EF48];

  v12 = [(DBSmartWidgetViewController *)self actionSelectRecognizer];
  [v12 setDelegate:self];

  v13 = [(DBSmartWidgetViewController *)self view];
  uint64_t v14 = [(DBSmartWidgetViewController *)self actionSelectRecognizer];
  [v13 addGestureRecognizer:v14];

  v15 = [(DBSmartWidgetViewController *)self actionSelectRecognizer];
  [v4 addObject:v15];

  uint64_t v16 = [MEMORY[0x263EFFA40] standardUserDefaults];
  LODWORD(v14) = [v16 BOOLForKey:@"CARSmartWidgetDebugGestures"];

  if (v14)
  {
    v17 = (void *)[objc_alloc(MEMORY[0x263F82938]) initWithTarget:self action:sel__refresh];
    [(DBSmartWidgetViewController *)self setRefreshRecognizer:v17];

    v18 = [(DBSmartWidgetViewController *)self refreshRecognizer];
    [v18 setDelegate:self];

    v19 = [(DBWidgetViewController *)self contentView];
    v20 = [(DBSmartWidgetViewController *)self refreshRecognizer];
    [v19 addGestureRecognizer:v20];

    id v21 = (void *)[objc_alloc(MEMORY[0x263F82C38]) initWithTarget:self action:sel__previousPrediction];
    [(DBSmartWidgetViewController *)self setPreviousPredictionRecognizer:v21];

    v22 = [(DBSmartWidgetViewController *)self previousPredictionRecognizer];
    [v22 setDelegate:self];

    objc_super v23 = [(DBSmartWidgetViewController *)self previousPredictionRecognizer];
    [v23 setDirection:2];

    v24 = [(DBWidgetViewController *)self contentView];
    v25 = [(DBSmartWidgetViewController *)self previousPredictionRecognizer];
    [v24 addGestureRecognizer:v25];

    v26 = (void *)[objc_alloc(MEMORY[0x263F82C38]) initWithTarget:self action:sel__nextPrediction];
    [(DBSmartWidgetViewController *)self setNextPredictionRecognizer:v26];

    v27 = [(DBSmartWidgetViewController *)self nextPredictionRecognizer];
    [v27 setDelegate:self];

    v28 = [(DBSmartWidgetViewController *)self nextPredictionRecognizer];
    [v28 setDirection:1];

    v29 = [(DBWidgetViewController *)self contentView];
    v30 = [(DBSmartWidgetViewController *)self nextPredictionRecognizer];
    [v29 addGestureRecognizer:v30];

    v31 = [(DBSmartWidgetViewController *)self actionRecognizer];
    v79[0] = v31;
    v32 = [(DBSmartWidgetViewController *)self refreshRecognizer];
    v79[1] = v32;
    v33 = [(DBSmartWidgetViewController *)self previousPredictionRecognizer];
    v79[2] = v33;
    v34 = [(DBSmartWidgetViewController *)self nextPredictionRecognizer];
    v79[3] = v34;
    v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:v79 count:4];
    [v4 addObjectsFromArray:v35];
  }
  v36 = [MEMORY[0x263EFFA08] setWithArray:v4];
  [(DBSmartWidgetViewController *)self setRecognizers:v36];

  v37 = [(DBWidgetViewController *)self contentView];
  v38 = [(DBSmartWidgetViewController *)self widgetView];
  [v37 addSubview:v38];

  v39 = [(DBWidgetViewController *)self contentView];
  v40 = [(DBSmartWidgetViewController *)self spinnerView];
  [v39 addSubview:v40];

  v41 = [(DBSmartWidgetViewController *)self widgetView];
  v42 = [v41 prediction];

  v76 = v4;
  if (!v42)
  {
    v43 = [(DBSmartWidgetViewController *)self spinnerView];
    [v43 startAnimating];
  }
  v62 = (void *)MEMORY[0x263F08938];
  v75 = [(DBSmartWidgetViewController *)self widgetView];
  v73 = [v75 topAnchor];
  v74 = [(DBWidgetViewController *)self contentView];
  v72 = [v74 topAnchor];
  v71 = [v73 constraintEqualToAnchor:v72];
  v78[0] = v71;
  v70 = [(DBSmartWidgetViewController *)self widgetView];
  v68 = [v70 leftAnchor];
  v69 = [(DBWidgetViewController *)self contentView];
  v67 = [v69 leftAnchor];
  v66 = [v68 constraintEqualToAnchor:v67];
  v78[1] = v66;
  v65 = [(DBSmartWidgetViewController *)self widgetView];
  v63 = [v65 rightAnchor];
  v64 = [(DBWidgetViewController *)self contentView];
  v61 = [v64 rightAnchor];
  v60 = [v63 constraintEqualToAnchor:v61];
  v78[2] = v60;
  v59 = [(DBSmartWidgetViewController *)self widgetView];
  v57 = [v59 bottomAnchor];
  v58 = [(DBWidgetViewController *)self contentView];
  v56 = [v58 bottomAnchor];
  v55 = [v57 constraintEqualToAnchor:v56];
  v78[3] = v55;
  v54 = [(DBSmartWidgetViewController *)self spinnerView];
  v44 = [v54 centerXAnchor];
  v45 = [(DBWidgetViewController *)self contentView];
  v46 = [v45 centerXAnchor];
  v47 = [v44 constraintEqualToAnchor:v46];
  v78[4] = v47;
  v48 = [(DBSmartWidgetViewController *)self spinnerView];
  v49 = [v48 centerYAnchor];
  v50 = [(DBWidgetViewController *)self contentView];
  v51 = [v50 centerYAnchor];
  v52 = [v49 constraintEqualToAnchor:v51];
  v78[5] = v52;
  v53 = [MEMORY[0x263EFF8C0] arrayWithObjects:v78 count:6];
  [v62 activateConstraints:v53];
}

- (void)_performAction
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_7(&dword_22D6F0000, v0, v1, "Requesting Engine start", v2, v3, v4, v5, v6);
}

- (void)_refresh
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_7(&dword_22D6F0000, v0, v1, "Performing refresh", v2, v3, v4, v5, v6);
}

- (void)_previousPrediction
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_7(&dword_22D6F0000, v0, v1, "Requesting previous prediction", v2, v3, v4, v5, v6);
}

- (void)_nextPrediction
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_7(&dword_22D6F0000, v0, v1, "Requesting next prediction", v2, v3, v4, v5, v6);
}

- (void)_updatePrediction
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 engine];
  uint64_t v4 = [v3 currentPredictions];
  int v5 = 134217984;
  uint64_t v6 = [v4 count];
  _os_log_debug_impl(&dword_22D6F0000, a2, OS_LOG_TYPE_DEBUG, "[Update Prediction] currentPredictions.count=%ld", (uint8_t *)&v5, 0xCu);
}

void __48__DBSmartWidgetViewController__updatePrediction__block_invoke(uint64_t a1)
{
  uint64_t v2 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __48__DBSmartWidgetViewController__updatePrediction__block_invoke_cold_1();
  }

  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = [*(id *)(a1 + 32) widgetView];
  [v4 setPrediction:v3];
}

void __48__DBSmartWidgetViewController__updatePrediction__block_invoke_126(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) widgetView];
  [v2 setPrediction:0];

  id v3 = [*(id *)(a1 + 32) spinnerView];
  [v3 startAnimating];
}

- (void)smartWidgetEngine:(id)a3 didUpdateCurrentPredictions:(id)a4
{
  int v5 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[DBSmartWidgetViewController smartWidgetEngine:didUpdateCurrentPredictions:]();
  }

  [(DBSmartWidgetViewController *)self setCurrentPredictionIndex:0];
  [(DBSmartWidgetViewController *)self _updatePrediction];
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [(DBSmartWidgetViewController *)self recognizers];
  char v7 = [v6 containsObject:v5];

  return v7 ^ 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v5 = a3;
  id v6 = [(DBSmartWidgetViewController *)self nextPredictionRecognizer];
  if (v6 == v5)
  {
    BOOL v8 = 1;
  }
  else
  {
    id v7 = [(DBSmartWidgetViewController *)self previousPredictionRecognizer];
    BOOL v8 = v7 == v5;
  }
  return v8;
}

- (BOOL)wantsToShowPrediction
{
  return self->_wantsToShowPrediction;
}

- (void)setWantsToShowPrediction:(BOOL)a3
{
  self->_wantsToShowPrediction = a3;
}

- (DBSmartWidgetEngine)engine
{
  return self->_engine;
}

- (DBSmartWidgetView)widgetView
{
  return self->_widgetView;
}

- (void)setWidgetView:(id)a3
{
}

- (int64_t)currentPredictionIndex
{
  return self->_currentPredictionIndex;
}

- (void)setCurrentPredictionIndex:(int64_t)a3
{
  self->_currentPredictionIndex = a3;
}

- (UIActivityIndicatorView)spinnerView
{
  return self->_spinnerView;
}

- (void)setSpinnerView:(id)a3
{
}

- (NSSet)recognizers
{
  return self->_recognizers;
}

- (void)setRecognizers:(id)a3
{
}

- (UITapGestureRecognizer)actionRecognizer
{
  return self->_actionRecognizer;
}

- (void)setActionRecognizer:(id)a3
{
}

- (UITapGestureRecognizer)actionSelectRecognizer
{
  return self->_actionSelectRecognizer;
}

- (void)setActionSelectRecognizer:(id)a3
{
}

- (UILongPressGestureRecognizer)refreshRecognizer
{
  return self->_refreshRecognizer;
}

- (void)setRefreshRecognizer:(id)a3
{
}

- (UISwipeGestureRecognizer)previousPredictionRecognizer
{
  return self->_previousPredictionRecognizer;
}

- (void)setPreviousPredictionRecognizer:(id)a3
{
}

- (UISwipeGestureRecognizer)nextPredictionRecognizer
{
  return self->_nextPredictionRecognizer;
}

- (void)setNextPredictionRecognizer:(id)a3
{
}

- (DBSmartWidgetAnimating)animationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_animationDelegate);
  return (DBSmartWidgetAnimating *)WeakRetained;
}

- (void)setAnimationDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_animationDelegate);
  objc_storeStrong((id *)&self->_nextPredictionRecognizer, 0);
  objc_storeStrong((id *)&self->_previousPredictionRecognizer, 0);
  objc_storeStrong((id *)&self->_refreshRecognizer, 0);
  objc_storeStrong((id *)&self->_actionSelectRecognizer, 0);
  objc_storeStrong((id *)&self->_actionRecognizer, 0);
  objc_storeStrong((id *)&self->_recognizers, 0);
  objc_storeStrong((id *)&self->_spinnerView, 0);
  objc_storeStrong((id *)&self->_widgetView, 0);
  objc_storeStrong((id *)&self->_engine, 0);
}

void __48__DBSmartWidgetViewController__updatePrediction__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_7(&dword_22D6F0000, v0, v1, "[Update Prediction] Animated prediction update", v2, v3, v4, v5, v6);
}

- (void)smartWidgetEngine:didUpdateCurrentPredictions:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_7(&dword_22D6F0000, v0, v1, "Predictions updated", v2, v3, v4, v5, v6);
}

@end
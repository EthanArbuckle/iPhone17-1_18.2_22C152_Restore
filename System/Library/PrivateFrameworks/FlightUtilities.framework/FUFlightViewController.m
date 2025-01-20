@interface FUFlightViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)highlightCurrentFlightLeg;
- (BOOL)showInfoPanel;
- (CGSize)preferredContentSize;
- (FUFlightView)flightView;
- (FUFlightView)previewFlightView;
- (FUFlightView)regularFlightView;
- (FUFlightViewController)init;
- (FUFlightViewController)initWithFlightCode:(unint64_t)a3 airlineCode:(id)a4;
- (FUFlightViewController)initWithFlights:(id)a3;
- (FUFlightViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (FUFlightViewController)initWithSFFlight:(id)a3 leg:(int64_t)a4 style:(unint64_t)a5 delegate:(id)a6;
- (FUFlightViewController)initWithSFFlights:(id)a3;
- (NSArray)flights;
- (NSNumber)flightCode;
- (NSString)airlineCode;
- (int64_t)selectedFlight;
- (int64_t)selectedLeg;
- (void)addFittingView:(id)a3;
- (void)awakeFromNib;
- (void)commonInit;
- (void)fadeLayer:(id)a3 visible:(BOOL)a4 completionBlock:(id)a5;
- (void)flightView:(id)a3 didSelectLeg:(int64_t)a4 ofFlight:(int64_t)a5;
- (void)hideView:(id)a3;
- (void)loadFlightWithFlightCode:(id)a3 airlineCode:(id)a4 date:(id)a5;
- (void)setAirlineCode:(id)a3;
- (void)setDisplayStyle:(unint64_t)a3;
- (void)setFlightCode:(id)a3;
- (void)setFlights:(id)a3;
- (void)setFlights:(id)a3 selectedFlight:(int64_t)a4 selectedLeg:(int64_t)a5;
- (void)setHighlightCurrentFlightLeg:(BOOL)a3;
- (void)setNoBackground;
- (void)setPreviewFlightView:(id)a3;
- (void)setRegularFlightView:(id)a3;
- (void)setSelectedFlight:(int64_t)a3;
- (void)setSelectedLeg:(int64_t)a3;
- (void)setShowInfoPanel:(BOOL)a3;
- (void)showErrorView;
- (void)showFlightView;
- (void)showLoadingView;
- (void)showView:(id)a3;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation FUFlightViewController

- (FUFlightViewController)init
{
  return [(FUFlightViewController *)self initWithNibName:0 bundle:0];
}

- (FUFlightViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v8.receiver = self;
  v8.super_class = (Class)FUFlightViewController;
  v6 = [(FUFlightViewController *)&v8 initWithNibName:@"FUFlightViewController" bundle:v5];

  if (v6)
  {
    v6->_displayStyle = 2;
    [(FUFlightViewController *)v6 commonInit];
  }
  return v6;
}

- (FUFlightViewController)initWithFlights:(id)a3
{
  id v4 = a3;
  v5 = [(FUFlightViewController *)self init];
  v6 = v5;
  if (v5)
  {
    v5->_displayStyle = 2;
    if (v4) {
      [(FUFlightViewController *)v5 setFlights:v4];
    }
    [(FUFlightViewController *)v6 commonInit];
  }

  return v6;
}

- (FUFlightViewController)initWithSFFlights:(id)a3
{
  id v4 = a3;
  v5 = [(FUFlightViewController *)self init];
  v6 = v5;
  if (v5)
  {
    v5->_displayStyle = 2;
    if (v4)
    {
      v7 = [MEMORY[0x263F3F390] convertFlightModel:v4 withError:0];
      [(FUFlightViewController *)v6 setFlights:v7];
    }
    [(FUFlightViewController *)v6 commonInit];
  }

  return v6;
}

- (FUFlightViewController)initWithSFFlight:(id)a3 leg:(int64_t)a4 style:(unint64_t)a5 delegate:(id)a6
{
  v18[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  v12 = [(FUFlightViewController *)self init];
  v13 = v12;
  if (v12)
  {
    v12->_displayStyle = a5;
    objc_storeWeak((id *)&v12->_delegate, v11);
    if (v10)
    {
      v14 = (void *)MEMORY[0x263F3F390];
      v18[0] = v10;
      v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
      v16 = [v14 convertFlightModel:v15 withError:0];
      [(FUFlightViewController *)v13 setFlights:v16 selectedFlight:0 selectedLeg:a4];
    }
    [(FUFlightViewController *)v13 commonInit];
  }

  return v13;
}

- (FUFlightViewController)initWithFlightCode:(unint64_t)a3 airlineCode:(id)a4
{
  id v6 = a4;
  v7 = [(FUFlightViewController *)self init];
  objc_super v8 = v7;
  if (v7)
  {
    v7->_displayStyle = 2;
    v9 = [NSNumber numberWithUnsignedInteger:a3];
    [(FUFlightViewController *)v8 setFlightCode:v9];

    [(FUFlightViewController *)v8 setAirlineCode:v6];
    id v10 = NSString;
    id v11 = objc_msgSend(v6, "FU_uppercaseStringUsingCurrentLocale:", 0);
    v12 = [v10 stringWithFormat:@"%@%ld", v11, a3];
    [(FUFlightViewController *)v8 setTitle:v12];

    [(FUFlightViewController *)v8 commonInit];
    uint64_t v13 = [(FUFlightViewController *)v8 flightCode];
    if (v13)
    {
      v14 = (void *)v13;
      v15 = [(FUFlightViewController *)v8 airlineCode];

      if (v15) {
        v8->_requiresDataLoad = 1;
      }
    }
    if (v8->_viewLoaded && v8->_requiresDataLoad)
    {
      v8->_requiresDataLoad = 0;
      v16 = [(FUFlightViewController *)v8 flightCode];
      v17 = [(FUFlightViewController *)v8 airlineCode];
      v18 = [MEMORY[0x263EFF910] date];
      [(FUFlightViewController *)v8 loadFlightWithFlightCode:v16 airlineCode:v17 date:v18];
    }
  }

  return v8;
}

- (void)commonInit
{
  [(FUFlightViewController *)self setHighlightCurrentFlightLeg:1];
  [(FUFlightViewController *)self setShowInfoPanel:1];
  unint64_t displayStyle = self->_displayStyle;
  id v4 = [(FUFlightViewController *)self flightView];
  [v4 setDisplayStyle:displayStyle];
}

- (void)awakeFromNib
{
  v5.receiver = self;
  v5.super_class = (Class)FUFlightViewController;
  [(FUFlightViewController *)&v5 awakeFromNib];
  unint64_t displayStyle = self->_displayStyle;
  id v4 = [(FUFlightViewController *)self flightView];
  [v4 setDisplayStyle:displayStyle];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)loadFlightWithFlightCode:(id)a3 airlineCode:(id)a4 date:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(FUFlightViewController *)self setAirlineCode:v9];
  [(FUFlightViewController *)self setFlightCode:v8];
  self->_loadingFlight = 1;
  dispatch_time_t v11 = dispatch_time(0, 750000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__FUFlightViewController_loadFlightWithFlightCode_airlineCode_date___block_invoke;
  block[3] = &unk_264BDD588;
  block[4] = self;
  dispatch_after(v11, MEMORY[0x263EF83A0], block);
  objc_initWeak(&location, self);
  v12 = (void *)[MEMORY[0x263F3F388] flightFactoryClassWithProvider:*MEMORY[0x263F3F380]];
  uint64_t v13 = [(FUFlightViewController *)self flightCode];
  uint64_t v14 = [v13 unsignedIntegerValue];
  v15 = [(FUFlightViewController *)self airlineCode];
  v16 = v10;
  if (!v10)
  {
    v16 = [MEMORY[0x263EFF910] date];
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __68__FUFlightViewController_loadFlightWithFlightCode_airlineCode_date___block_invoke_2;
  v17[3] = &unk_264BDD5D8;
  objc_copyWeak(&v18, &location);
  [v12 loadFlightsWithNumber:v14 airlineCode:v15 date:v16 dateType:1 completionHandler:v17];
  if (!v10) {

  }
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

unsigned char *__68__FUFlightViewController_loadFlightWithFlightCode_airlineCode_date___block_invoke(uint64_t a1)
{
  result = *(unsigned char **)(a1 + 32);
  if (result[976])
  {
    [result showLoadingView];
    *(void *)(*(void *)(a1 + 32) + 984) = [MEMORY[0x263EFF910] date];
    return (unsigned char *)MEMORY[0x270F9A758]();
  }
  return result;
}

void __68__FUFlightViewController_loadFlightWithFlightCode_airlineCode_date___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 976) = 0;
    id v9 = (void *)*((void *)WeakRetained + 123);
    double v10 = 0.5;
    if (v9)
    {
      objc_msgSend(v9, "timeIntervalSinceNow", 0.5);
      double v10 = -v11;
    }
    dispatch_time_t v12 = dispatch_time(0, (uint64_t)((0.5 - v10) * 1000000000.0));
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __68__FUFlightViewController_loadFlightWithFlightCode_airlineCode_date___block_invoke_3;
    block[3] = &unk_264BDD5B0;
    id v14 = v6;
    id v15 = v8;
    id v16 = v5;
    dispatch_after(v12, MEMORY[0x263EF83A0], block);
  }
}

uint64_t __68__FUFlightViewController_loadFlightWithFlightCode_airlineCode_date___block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    return [*(id *)(a1 + 40) showErrorView];
  }
  else {
    return [*(id *)(a1 + 40) setFlights:*(void *)(a1 + 48)];
  }
}

- (void)setHighlightCurrentFlightLeg:(BOOL)a3
{
  BOOL v3 = a3;
  self->_highlightCurrentFlightLeg = a3;
  id v5 = [(FUFlightViewController *)self flightView];

  if (v5)
  {
    id v6 = [(FUFlightViewController *)self flightView];
    [v6 setHighlightCurrentFlightLeg:v3];
  }
}

- (void)setShowInfoPanel:(BOOL)a3
{
  BOOL v3 = a3;
  self->_showInfoPanel = a3;
  id v5 = [(FUFlightViewController *)self flightView];

  if (v5)
  {
    id v6 = [(FUFlightViewController *)self flightView];
    [v6 setShowInfoPanel:v3];
  }
}

- (void)setDisplayStyle:(unint64_t)a3
{
  if (self->_displayStyle != a3)
  {
    self->_unint64_t displayStyle = a3;
    id v4 = [(FUFlightViewController *)self flightView];
    [v4 setDisplayStyle:a3];
  }
}

- (void)setNoBackground
{
  BOOL v3 = [(FUFlightViewController *)self flightView];
  [v3 removeMapBackground];

  id v4 = [(FUFlightViewController *)self view];
  [v4 setBackgroundColor:0];
}

- (void)setFlights:(id)a3
{
}

- (void)setFlights:(id)a3 selectedFlight:(int64_t)a4 selectedLeg:(int64_t)a5
{
  id v11 = a3;
  self->_loadingFlight = 0;
  objc_storeStrong((id *)&self->_flights, a3);
  id v9 = (id)[(FUFlightViewController *)self view];
  if (v11 && [v11 count])
  {
    double v10 = [(FUFlightViewController *)self flightView];
    [v10 setIgnoreMapUpdate:1];
    [v10 setDisplayStyle:self->_displayStyle];
    [(FUFlightViewController *)self showFlightView];
    if ([v10 setFlights:v11 selectedFlight:a4 selectedLeg:a5]) {
      [v10 layoutSubviews];
    }
    [v10 setIgnoreMapUpdate:0];
    [v10 updateMapCamera];
  }
  else
  {
    [(FUFlightViewController *)self showErrorView];
  }
}

- (void)setSelectedLeg:(int64_t)a3
{
  id v4 = [(FUFlightViewController *)self flightView];
  [v4 setSelectedLeg:a3];
}

- (void)setSelectedFlight:(int64_t)a3
{
  id v4 = [(FUFlightViewController *)self flightView];
  [v4 setSelectedFlight:a3];
}

- (int64_t)selectedLeg
{
  v2 = [(FUFlightViewController *)self flightView];
  int64_t v3 = [v2 selectedLeg];

  return v3;
}

- (int64_t)selectedFlight
{
  v2 = [(FUFlightViewController *)self flightView];
  int64_t v3 = [v2 selectedFlight];

  return v3;
}

- (void)viewDidLoad
{
  v18.receiver = self;
  v18.super_class = (Class)FUFlightViewController;
  [(FUFlightViewController *)&v18 viewDidLoad];
  int64_t v3 = [(FUFlightViewController *)self flightView];
  uint64_t v4 = [v3 displayStyle];

  if (!v4)
  {
    id v5 = [(FUFlightViewController *)self flightView];
    [v5 setDisplayStyle:2];
  }
  BOOL v6 = [(FUFlightViewController *)self highlightCurrentFlightLeg];
  v7 = [(FUFlightViewController *)self flightView];
  [v7 setHighlightCurrentFlightLeg:v6];

  BOOL v8 = [(FUFlightViewController *)self showInfoPanel];
  id v9 = [(FUFlightViewController *)self flightView];
  [v9 setShowInfoPanel:v8];

  if (self->_requiresDataLoad)
  {
    self->_requiresDataLoad = 0;
    double v10 = [(FUFlightViewController *)self flightCode];
    id v11 = [(FUFlightViewController *)self airlineCode];
    dispatch_time_t v12 = [MEMORY[0x263EFF910] date];
    [(FUFlightViewController *)self loadFlightWithFlightCode:v10 airlineCode:v11 date:v12];
  }
  id v13 = objc_alloc_init(MEMORY[0x263F1C7E8]);
  id v14 = [MEMORY[0x263F1C480] effectWithStyle:1100];
  [v13 setBackgroundEffect:v14];

  id v15 = [(FUFlightViewController *)self navigationItem];
  [v15 setScrollEdgeAppearance:v13];

  id v16 = [(FUFlightViewController *)self flightView];
  [(FUFlightViewController *)self showView:v16];

  v17 = [(FUFlightViewController *)self flightView];
  [v17 setDelegate:self];

  self->_viewLoaded = 1;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __77__FUFlightViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v4[3] = &unk_264BDD620;
  v4[4] = self;
  [a4 animateAlongsideTransition:&__block_literal_global completion:v4];
}

void __77__FUFlightViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) flightView];
  [v1 updateMapCamera];
}

- (void)showLoadingView
{
  id v2 = [(FUFlightViewController *)self flightView];
  [v2 showLoading];
}

- (void)showErrorView
{
  id v2 = [(FUFlightViewController *)self flightView];
  [v2 showError];
}

- (void)showFlightView
{
  id v2 = [(FUFlightViewController *)self flightView];
  [v2 showInfo];
}

- (void)showView:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    id v5 = [v4 superview];

    id v4 = v7;
    if (!v5)
    {
      [(FUFlightViewController *)self addFittingView:v7];
      BOOL v6 = [v7 layer];
      [(FUFlightViewController *)self fadeLayer:v6 visible:1 completionBlock:0];

      id v4 = v7;
    }
  }
}

- (void)hideView:(id)a3
{
  id v4 = a3;
  id v5 = [v4 superview];

  if (v5)
  {
    BOOL v6 = [v4 layer];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __35__FUFlightViewController_hideView___block_invoke;
    v7[3] = &unk_264BDD588;
    id v8 = v4;
    [(FUFlightViewController *)self fadeLayer:v6 visible:0 completionBlock:v7];
  }
}

uint64_t __35__FUFlightViewController_hideView___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)addFittingView:(id)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(FUFlightViewController *)self view];
  [v5 addSubview:v4];

  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  BOOL v6 = [(FUFlightViewController *)self view];
  id v7 = (void *)MEMORY[0x263F08938];
  id v16 = @"view";
  v17[0] = v4;
  id v8 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
  id v9 = [v7 constraintsWithVisualFormat:@"H:|[view]|" options:0 metrics:0 views:v8];
  [v6 addConstraints:v9];

  double v10 = [(FUFlightViewController *)self view];
  id v11 = (void *)MEMORY[0x263F08938];
  id v14 = @"view";
  id v15 = v4;
  dispatch_time_t v12 = [NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  id v13 = [v11 constraintsWithVisualFormat:@"V:|[view]|" options:0 metrics:0 views:v12];

  [v10 addConstraints:v13];
}

- (void)fadeLayer:(id)a3 visible:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = (void (**)(void))a5;
  double v10 = [(FUFlightViewController *)self view];
  id v11 = [v10 window];

  if (v11)
  {
    if (v6) {
      *(float *)&double v12 = 0.0;
    }
    else {
      *(float *)&double v12 = 1.0;
    }
    if (v6) {
      float v13 = 1.0;
    }
    else {
      float v13 = 0.0;
    }
    if (v6) {
      id v14 = &unk_26E6BB058;
    }
    else {
      id v14 = &unk_26E6BB068;
    }
    if (v6) {
      id v15 = &unk_26E6BB068;
    }
    else {
      id v15 = &unk_26E6BB058;
    }
    [v8 setOpacity:v12];
    [MEMORY[0x263F158F8] begin];
    id v16 = (void *)MEMORY[0x263F158F8];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __60__FUFlightViewController_fadeLayer_visible_completionBlock___block_invoke;
    v20[3] = &unk_264BDD648;
    v21 = v9;
    [v16 setCompletionBlock:v20];
    *(float *)&double v17 = v13;
    [v8 setOpacity:v17];
    objc_super v18 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
    [v18 setDuration:0.3];
    [v18 setFromValue:v14];
    [v18 setToValue:v15];
    [v8 addAnimation:v18 forKey:@"fade"];

    [MEMORY[0x263F158F8] commit];
  }
  else
  {
    double v19 = 0.0;
    if (v6) {
      *(float *)&double v19 = 1.0;
    }
    [v8 setOpacity:v19];
    if (v9) {
      v9[2](v9);
    }
  }
}

uint64_t __60__FUFlightViewController_fadeLayer_visible_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (CGSize)preferredContentSize
{
  id v2 = [MEMORY[0x263F1C5C0] currentDevice];
  unint64_t v3 = [v2 userInterfaceIdiom];

  if (v3 > 6 || ((1 << v3) & 0x62) == 0)
  {
    double v5 = 370.0;
    double v6 = 696.0;
  }
  else
  {
    double v5 = 550.0;
    double v6 = 320.0;
  }
  result.height = v5;
  result.width = v6;
  return result;
}

- (void)flightView:(id)a3 didSelectLeg:(int64_t)a4 ofFlight:(int64_t)a5
{
  id v30 = a3;
  id v8 = [v30 flights];
  unint64_t v9 = [v8 count];

  double v10 = [v30 flights];
  id v11 = [v10 firstObject];
  double v12 = [v11 legs];
  unint64_t v13 = [v12 count];

  if (v9 >= 2)
  {
    if (v13 >= 2)
    {
      id v14 = NSString;
      id v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v16 = [v15 localizedStringForKey:@"Leg %lu of flight %lu" value:@"Leg %lu of flight %lu" table:@"Localizable"];
      objc_msgSend(v14, "stringWithFormat:", v16, a4 + 1, a5 + 1);
      uint64_t v27 = LABEL_11:;
      goto LABEL_12;
    }
    v21 = [v30 flights];
    v22 = [v21 firstObject];
    v23 = [v22 displayFlightCode];

    v24 = NSString;
    v25 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v15 = v25;
    if (!v23)
    {
      id v16 = [v25 localizedStringForKey:@"Flight %lu" value:@"Flight %lu" table:@"Localizable"];
      objc_msgSend(v24, "stringWithFormat:", v16, a5 + 1, v29);
      goto LABEL_11;
    }
    id v16 = [v25 localizedStringForKey:@"Flight %@" value:@"Flight %@" table:@"Localizable"];
    objc_super v18 = [v30 flights];
    double v19 = [v18 firstObject];
    v20 = [v19 displayFlightCode];
    objc_msgSend(v24, "stringWithFormat:", v16, v20, v29);
    v26 = LABEL_8:;
    [(FUFlightViewController *)self setTitle:v26];

    goto LABEL_13;
  }
  if (v13 >= 2)
  {
    double v17 = NSString;
    id v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v16 = [v15 localizedStringForKey:@"Leg %lu of %@" value:@"Leg %lu of %@" table:@"Localizable"];
    objc_super v18 = [v30 flights];
    double v19 = [v18 firstObject];
    v20 = [v19 displayFlightCode];
    objc_msgSend(v17, "stringWithFormat:", v16, a4 + 1, v20);
    goto LABEL_8;
  }
  id v15 = [v30 flights];
  id v16 = [v15 firstObject];
  uint64_t v27 = [v16 displayFlightCode];
LABEL_12:
  objc_super v18 = (void *)v27;
  [(FUFlightViewController *)self setTitle:v27];
LABEL_13:

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained flightController:self didSelectLeg:a4 ofFlight:a5];
}

- (FUFlightView)flightView
{
  return self->_regularFlightView;
}

- (NSArray)flights
{
  return self->_flights;
}

- (BOOL)highlightCurrentFlightLeg
{
  return self->_highlightCurrentFlightLeg;
}

- (BOOL)showInfoPanel
{
  return self->_showInfoPanel;
}

- (FUFlightView)regularFlightView
{
  return (FUFlightView *)objc_getProperty(self, a2, 1016, 1);
}

- (void)setRegularFlightView:(id)a3
{
}

- (FUFlightView)previewFlightView
{
  return (FUFlightView *)objc_getProperty(self, a2, 1024, 1);
}

- (void)setPreviewFlightView:(id)a3
{
}

- (NSNumber)flightCode
{
  return (NSNumber *)objc_getProperty(self, a2, 1056, 1);
}

- (void)setFlightCode:(id)a3
{
}

- (NSString)airlineCode
{
  return (NSString *)objc_getProperty(self, a2, 1064, 1);
}

- (void)setAirlineCode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_airlineCode, 0);
  objc_storeStrong((id *)&self->_flightCode, 0);
  objc_storeStrong((id *)&self->_flights, 0);
  objc_storeStrong((id *)&self->_savedAppearance, 0);
  objc_storeStrong((id *)&self->_previewFlightView, 0);
  objc_storeStrong((id *)&self->_regularFlightView, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_startLoadingDate, 0);
}

@end
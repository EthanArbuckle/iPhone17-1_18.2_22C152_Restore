@interface FMFMapOptionsViewController
- (CGSize)paneSize;
- (FMFMapOptionsViewController)init;
- (FMFMapOptionsViewControllerDelegate)delegate;
- (MKMapAttribution)mapAttribution;
- (UIButton)mapAttributionButton;
- (UISegmentedControl)segmentedControl;
- (UIView)bottomWhitePane;
- (UIView)topTapView;
- (void)_dismiss:(id)a3;
- (void)attributionButtonPressed:(id)a3;
- (void)awakeFromNib;
- (void)openInMaps:(id)a3;
- (void)segmentedControlChanged:(id)a3;
- (void)setBottomWhitePane:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMapAttribution:(id)a3;
- (void)setMapAttributionButton:(id)a3;
- (void)setSegmentedControl:(id)a3;
- (void)setTopTapView:(id)a3;
- (void)viewDidLoad;
@end

@implementation FMFMapOptionsViewController

- (FMFMapOptionsViewController)init
{
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6.receiver = self;
  v6.super_class = (Class)FMFMapOptionsViewController;
  v4 = [(FMFMapOptionsViewController *)&v6 initWithNibName:@"FMFMapOptions" bundle:v3];

  return v4;
}

- (void)awakeFromNib
{
  v2.receiver = self;
  v2.super_class = (Class)FMFMapOptionsViewController;
  [(FMFMapOptionsViewController *)&v2 awakeFromNib];
}

- (void)_dismiss:(id)a3
{
  id v4 = [(FMFMapOptionsViewController *)self delegate];
  [v4 _dismiss:self];
}

- (CGSize)paneSize
{
  objc_super v2 = [(FMFMapOptionsViewController *)self view];
  objc_msgSend(v2, "systemLayoutSizeFittingSize:", *MEMORY[0x263F1D490], *(double *)(MEMORY[0x263F1D490] + 8));
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)viewDidLoad
{
  double v3 = LogCategory_Daemon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2188D1000, v3, OS_LOG_TYPE_DEFAULT, "FMFMapOptionsViewController: viewDidLoad", buf, 2u);
  }

  v15.receiver = self;
  v15.super_class = (Class)FMFMapOptionsViewController;
  [(FMFMapOptionsViewController *)&v15 viewDidLoad];
  double v4 = (void *)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:self action:sel__dismiss_];
  double v5 = [(FMFMapOptionsViewController *)self topTapView];
  [v5 addGestureRecognizer:v4];

  double v6 = [(FMFMapOptionsViewController *)self mapAttributionButton];
  double v7 = [(FMFMapOptionsViewController *)self mapAttribution];
  double v8 = [v7 string];
  [v6 setAttributedTitle:v8 forState:0];

  v9 = [(FMFMapOptionsViewController *)self delegate];
  v10 = [v9 mapView];
  uint64_t v11 = [v10 mapType];

  if (v11 == 4) {
    uint64_t v12 = 1;
  }
  else {
    uint64_t v12 = v11;
  }
  if (v11 == 3) {
    uint64_t v13 = 2;
  }
  else {
    uint64_t v13 = v12;
  }
  v14 = [(FMFMapOptionsViewController *)self segmentedControl];
  [v14 setSelectedSegmentIndex:v13];
}

- (void)openInMaps:(id)a3
{
  id v4 = a3;
  id v5 = [(FMFMapOptionsViewController *)self delegate];
  [v5 openInMapsButtonTapped:self];
  [(FMFMapOptionsViewController *)self _dismiss:v4];
}

- (MKMapAttribution)mapAttribution
{
  v13[2] = *MEMORY[0x263EF8340];
  mapAttribution = self->_mapAttribution;
  if (!mapAttribution)
  {
    if (!mapAttribution_stringAttributes)
    {
      v12[0] = *MEMORY[0x263F1C240];
      id v4 = [MEMORY[0x263F1C550] labelColor];
      v13[0] = v4;
      v12[1] = *MEMORY[0x263F1C238];
      id v5 = [MEMORY[0x263F1C658] boldSystemFontOfSize:12.0];
      v13[1] = v5;
      uint64_t v6 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
      double v7 = (void *)mapAttribution_stringAttributes;
      mapAttribution_stringAttributes = v6;
    }
    double v8 = [(FMFMapOptionsViewController *)self delegate];
    v9 = [v8 mapView];
    v10 = [v9 mapAttributionWithStringAttributes:mapAttribution_stringAttributes underlineText:1];
    [(FMFMapOptionsViewController *)self setMapAttribution:v10];

    mapAttribution = self->_mapAttribution;
  }
  return mapAttribution;
}

- (void)attributionButtonPressed:(id)a3
{
  id v8 = a3;
  id v4 = [(FMFMapOptionsViewController *)self mapAttribution];
  id v5 = [v4 url];

  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263F01880] defaultWorkspace];
    double v7 = [v4 url];
    [v6 openURL:v7 withOptions:0];
  }
  [(FMFMapOptionsViewController *)self _dismiss:v8];
}

- (void)segmentedControlChanged:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 selectedSegmentIndex];
  uint64_t v6 = LogCategory_Daemon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134217984;
    uint64_t v10 = v5;
    _os_log_impl(&dword_2188D1000, v6, OS_LOG_TYPE_DEFAULT, "FMFMapOptionsViewController: newMapType %lu", (uint8_t *)&v9, 0xCu);
  }

  if ([v4 selectedSegmentIndex] == 1)
  {
    uint64_t v5 = 4;
  }
  else if ([v4 selectedSegmentIndex] == 2)
  {
    uint64_t v5 = 3;
  }
  double v7 = [(FMFMapOptionsViewController *)self delegate];
  id v8 = [v7 mapView];
  [v8 setMapType:v5];

  [v7 mapTypeChanged:v5];
  [(FMFMapOptionsViewController *)self _dismiss:v4];
}

- (FMFMapOptionsViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (FMFMapOptionsViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIButton)mapAttributionButton
{
  return self->_mapAttributionButton;
}

- (void)setMapAttributionButton:(id)a3
{
}

- (UIView)topTapView
{
  return self->_topTapView;
}

- (void)setTopTapView:(id)a3
{
}

- (UISegmentedControl)segmentedControl
{
  return self->_segmentedControl;
}

- (void)setSegmentedControl:(id)a3
{
}

- (UIView)bottomWhitePane
{
  return self->_bottomWhitePane;
}

- (void)setBottomWhitePane:(id)a3
{
}

- (void)setMapAttribution:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapAttribution, 0);
  objc_storeStrong((id *)&self->_bottomWhitePane, 0);
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_storeStrong((id *)&self->_topTapView, 0);
  objc_storeStrong((id *)&self->_mapAttributionButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
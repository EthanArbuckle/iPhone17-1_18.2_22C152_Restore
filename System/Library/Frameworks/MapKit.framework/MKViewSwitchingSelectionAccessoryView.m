@interface MKViewSwitchingSelectionAccessoryView
- (MKViewSwitchingSelectionAccessoryView)initWithFrame:(CGRect)a3;
- (UIViewController)parentViewController;
- (id)_createErrorView;
- (id)_createLoadingView;
- (id)_createMapItemViewController:(id)a3;
- (void)_displayView:(id)a3;
- (void)_displayViewController:(id)a3;
- (void)_updateDisplay;
- (void)displayError;
- (void)displayLoading;
- (void)displayMapItem:(id)a3;
- (void)placeCardPreferredContentSizeDidChange:(CGSize)a3;
- (void)setParentViewController:(id)a3;
@end

@implementation MKViewSwitchingSelectionAccessoryView

- (MKViewSwitchingSelectionAccessoryView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MKViewSwitchingSelectionAccessoryView;
  v3 = -[MKSelectionAccessoryView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(MKViewSwitchingSelectionAccessoryView *)v3 _updateDisplay];
  }
  return v4;
}

- (void)displayLoading
{
  if (self->_error || self->_mapItem)
  {
    self->_error = 0;
    mapItem = self->_mapItem;
    self->_mapItem = 0;

    [(MKViewSwitchingSelectionAccessoryView *)self _updateDisplay];
  }
}

- (void)displayMapItem:(id)a3
{
  v5 = (MKMapItem *)a3;
  if (self->_error || self->_mapItem != v5)
  {
    self->_error = 0;
    objc_super v6 = v5;
    objc_storeStrong((id *)&self->_mapItem, a3);
    [(MKViewSwitchingSelectionAccessoryView *)self _updateDisplay];
    v5 = v6;
  }
}

- (void)displayError
{
  if (!self->_error || self->_mapItem)
  {
    self->_error = 1;
    mapItem = self->_mapItem;
    self->_mapItem = 0;

    [(MKViewSwitchingSelectionAccessoryView *)self _updateDisplay];
  }
}

- (void)_updateDisplay
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  viewController = self->_viewController;
  if (viewController) {
    [(UIViewController *)viewController willMoveToParentViewController:0];
  }
  view = self->_view;
  if (view)
  {
    [(UIView *)view removeFromSuperview];
    v5 = self->_view;
    self->_view = 0;
  }
  objc_super v6 = self->_viewController;
  if (v6)
  {
    [(UIViewController *)v6 removeFromParentViewController];
    v7 = self->_viewController;
    self->_viewController = 0;
  }
  mapItem = self->_mapItem;
  if (mapItem)
  {
    v9 = [(MKMapItem *)mapItem placemark];
    uint64_t v10 = [v9 location];
    if (v10)
    {
      v11 = (void *)v10;
      v12 = [(MKMapItem *)self->_mapItem placemark];
      v13 = [v12 location];
      [v13 coordinate];
      double v15 = v14;
      double v17 = v16;

      if (v17 >= -180.0 && v17 <= 180.0 && v15 >= -90.0 && v15 <= 90.0)
      {
        v18 = [(MKViewSwitchingSelectionAccessoryView *)self _createMapItemViewController:self->_mapItem];
        [(MKViewSwitchingSelectionAccessoryView *)self _displayViewController:v18];
        goto LABEL_19;
      }
    }
    else
    {
    }
    goto LABEL_17;
  }
  if (self->_error)
  {
LABEL_17:
    uint64_t v19 = [(MKViewSwitchingSelectionAccessoryView *)self _createErrorView];
    goto LABEL_18;
  }
  uint64_t v19 = [(MKViewSwitchingSelectionAccessoryView *)self _createLoadingView];
LABEL_18:
  v18 = (void *)v19;
  [(MKViewSwitchingSelectionAccessoryView *)self _displayView:v19];
LABEL_19:

  [(MKSelectionAccessoryView *)self _bringDismissButtonToFront];
}

- (void)_displayViewController:(id)a3
{
  v8 = (_MKSelectionAccessoryParentViewController *)a3;
  WeakRetained = (_MKSelectionAccessoryParentViewController *)objc_loadWeakRetained((id *)&self->_parentViewController);
  if (!WeakRetained) {
    WeakRetained = [[_MKSelectionAccessoryParentViewController alloc] initWithChildViewController:v8];
  }
  [(_MKSelectionAccessoryParentViewController *)WeakRetained addChildViewController:v8];
  [(_MKSelectionAccessoryParentViewController *)v8 setPlaceCardContentSizeDelegate:self];
  id v5 = objc_loadWeakRetained((id *)&self->_parentViewController);
  if (v5) {
    objc_super v6 = v8;
  }
  else {
    objc_super v6 = WeakRetained;
  }
  objc_storeStrong((id *)&self->_viewController, v6);

  v7 = [(UIViewController *)self->_viewController view];
  [(MKViewSwitchingSelectionAccessoryView *)self _displayView:v7];

  [(_MKSelectionAccessoryParentViewController *)v8 didMoveToParentViewController:WeakRetained];
}

- (void)_displayView:(id)a3
{
  v21[4] = *MEMORY[0x1E4F143B8];
  p_view = &self->_view;
  objc_storeStrong((id *)&self->_view, a3);
  id v17 = a3;
  [(UIView *)*p_view setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MKViewSwitchingSelectionAccessoryView *)self addSubview:*p_view];
  double v16 = (void *)MEMORY[0x1E4F28DC8];
  v20 = [(UIView *)*p_view topAnchor];
  uint64_t v19 = [(MKViewSwitchingSelectionAccessoryView *)self topAnchor];
  v18 = [v20 constraintEqualToAnchor:v19];
  v21[0] = v18;
  objc_super v6 = [(UIView *)*p_view leadingAnchor];
  v7 = [(MKViewSwitchingSelectionAccessoryView *)self leadingAnchor];
  v8 = [v6 constraintEqualToAnchor:v7];
  v21[1] = v8;
  v9 = [(MKViewSwitchingSelectionAccessoryView *)self trailingAnchor];
  uint64_t v10 = [(UIView *)*p_view trailingAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  v21[2] = v11;
  v12 = [(MKViewSwitchingSelectionAccessoryView *)self bottomAnchor];
  v13 = [(UIView *)*p_view bottomAnchor];
  double v14 = [v12 constraintEqualToAnchor:v13];
  v21[3] = v14;
  double v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:4];
  [v16 activateConstraints:v15];
}

- (void)placeCardPreferredContentSizeDidChange:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (qword_1E91540F8 != -1) {
    dispatch_once(&qword_1E91540F8, &__block_literal_global_149);
  }
  objc_super v6 = (void *)_MergedGlobals_1_2;
  if (os_log_type_enabled((os_log_t)_MergedGlobals_1_2, OS_LOG_TYPE_DEBUG))
  {
    v7 = NSString;
    v8 = v6;
    v9 = [v7 stringWithFormat:@"{%.1f, %.1f}", *(void *)&width, *(void *)&height];
    *(_DWORD *)buf = 138543362;
    double v14 = v9;
    _os_log_impl(&dword_18BAEC000, v8, OS_LOG_TYPE_DEBUG, "SelectionAccessoryView placeCardPreferredContentSizeDidChange: %{public}@", buf, 0xCu);
  }
  uint64_t v10 = [(MKSelectionAccessoryView *)self placeCardContentSizeDelegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    v12 = [(MKSelectionAccessoryView *)self placeCardContentSizeDelegate];
    objc_msgSend(v12, "placeCardPreferredContentSizeDidChange:", width, height);
  }
}

- (id)_createLoadingView
{
  return 0;
}

- (id)_createMapItemViewController:(id)a3
{
  return 0;
}

- (id)_createErrorView
{
  return 0;
}

- (UIViewController)parentViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setParentViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentViewController);
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_viewController, 0);

  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end
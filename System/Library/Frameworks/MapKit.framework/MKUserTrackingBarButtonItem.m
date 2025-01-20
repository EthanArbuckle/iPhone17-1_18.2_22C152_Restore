@interface MKUserTrackingBarButtonItem
+ (Class)_activityIndicatorClass;
- (BOOL)_isHighlightedForState:(int64_t)a3;
- (BOOL)_isInMiniBar;
- (BOOL)_selectsWhenTracking;
- (BOOL)isEnabled;
- (MKMapView)mapView;
- (MKUserTrackingBarButtonItem)init;
- (MKUserTrackingBarButtonItem)initWithCoder:(id)a3;
- (MKUserTrackingBarButtonItem)initWithMapView:(MKMapView *)mapView;
- (MKUserTrackingView)_userTrackingView;
- (UINavigationBar)_navigationBar;
- (UIToolbar)_toolbar;
- (UIView)_associatedView;
- (id)_imageForState:(int64_t)a3 controlState:(unint64_t)a4;
- (id)_imageForUserTrackingMode:(int64_t)a3;
- (id)_landscapeImagePhoneForUserTrackingMode:(int64_t)a3;
- (id)_trackingEmptyImage;
- (id)_trackingFollowImage;
- (id)_trackingFollowWithHeadingImage;
- (id)_trackingNoneImage;
- (id)createViewForNavigationItem:(id)a3;
- (id)createViewForToolbar:(id)a3;
- (int64_t)_activityIndicatorStyle;
- (int64_t)_state;
- (void)_goToNextMode:(id)a3;
- (void)_setImage:(id)a3 forUserTrackingMode:(int64_t)a4;
- (void)_setInternallyEnabled:(BOOL)a3;
- (void)_setLandscapeImagePhone:(id)a3 forUserTrackingMode:(int64_t)a4;
- (void)_setSelectsWhenTracking:(BOOL)a3;
- (void)_setState:(int64_t)a3;
- (void)_setUserTrackingView:(id)a3;
- (void)_updateForState:(int64_t)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setEnabled:(BOOL)a3;
- (void)setMapView:(MKMapView *)mapView;
- (void)set_associatedView:(id)a3;
- (void)set_navigationBar:(id)a3;
- (void)set_toolbar:(id)a3;
@end

@implementation MKUserTrackingBarButtonItem

- (MKUserTrackingBarButtonItem)initWithMapView:(MKMapView *)mapView
{
  v5 = mapView;
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v17 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v18 = *MEMORY[0x1E4F1C3C8];
    v19 = NSString;
    v15 = self;
    v20 = NSStringFromSelector(a2);
    v21 = [v19 stringWithFormat:@"%@ %@", v15, v20];

    [v17 raise:v18, @"%@: mapView must be an MKMapView instance", v21 format];
    v16 = 0;
  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)MKUserTrackingBarButtonItem;
    v6 = [(UIBarItem *)&v23 init];
    v7 = v6;
    if (v6)
    {
      [(MKUserTrackingBarButtonItem *)v6 setStyle:0];
      [(MKUserTrackingBarButtonItem *)v7 setTarget:v7];
      [(MKUserTrackingBarButtonItem *)v7 setAction:sel__goToNextMode_];
      [(MKUserTrackingBarButtonItem *)v7 _setInternallyEnabled:1];
      uint64_t v8 = +[_MKUserTrackingButton buttonWithUserTrackingView:v5];
      userTrackingButton = v7->_userTrackingButton;
      v7->_userTrackingButton = (_MKUserTrackingButton *)v8;

      uint64_t v10 = [(_MKUserTrackingButton *)v7->_userTrackingButton controller];
      controller = v7->_controller;
      v7->_controller = (_MKUserTrackingButtonController *)v10;

      objc_storeStrong((id *)&v7->_customButton, v7->_userTrackingButton);
      [(MKUserTrackingBarButtonItem *)v7 setCustomView:v7->_customButton];
      [(MKUserTrackingBarButtonItem *)v7 set_associatedView:v7->_customButton];
      v7->_hasCustomAssociatedView = 1;
      v12 = v7->_userTrackingButton;
      id v13 = objc_alloc_init(MEMORY[0x1E4F42CA0]);
      [(_MKUserTrackingButton *)v12 addInteraction:v13];

      v14 = +[MKUsageCounter sharedCounter];
      [v14 count:5];
    }
    v15 = v7;
    v16 = v15;
  }

  return v16;
}

- (MKUserTrackingBarButtonItem)init
{
  return [(MKUserTrackingBarButtonItem *)self initWithMapView:0];
}

- (MKUserTrackingBarButtonItem)initWithCoder:(id)a3
{
  return [(MKUserTrackingBarButtonItem *)self initWithMapView:0];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  associatedView = self->_associatedView;
  if (associatedView) {
    [(UIView *)associatedView removeObserver:self forKeyPath:@"controlSize"];
  }
  v5.receiver = self;
  v5.super_class = (Class)MKUserTrackingBarButtonItem;
  [(MKUserTrackingBarButtonItem *)&v5 dealloc];
}

- (BOOL)_selectsWhenTracking
{
  return [(_MKUserTrackingButton *)self->_userTrackingButton _selectsWhenTracking];
}

- (void)_setSelectsWhenTracking:(BOOL)a3
{
}

- (id)_imageForState:(int64_t)a3 controlState:(unint64_t)a4
{
  if (self->_userTrackingButton)
  {
    v4 = [(_MKUserTrackingButton *)self->_userTrackingButton _imageForState:a3 controlState:a4];
  }
  else
  {
    switch(a3)
    {
      case -1:
      case 1:
        v4 = [(MKUserTrackingBarButtonItem *)self _trackingEmptyImage];
        break;
      case 0:
        v4 = [(MKUserTrackingBarButtonItem *)self _trackingNoneImage];
        break;
      case 2:
        v4 = [(MKUserTrackingBarButtonItem *)self _trackingFollowImage];
        break;
      case 3:
        v4 = [(MKUserTrackingBarButtonItem *)self _trackingFollowWithHeadingImage];
        break;
      default:
        v4 = 0;
        break;
    }
  }

  return v4;
}

- (id)_imageForUserTrackingMode:(int64_t)a3
{
  return [(_MKUserTrackingButton *)self->_userTrackingButton _imageForUserTrackingMode:a3 controlState:0];
}

- (void)_setImage:(id)a3 forUserTrackingMode:(int64_t)a4
{
}

- (id)_landscapeImagePhoneForUserTrackingMode:(int64_t)a3
{
  return [(_MKUserTrackingButton *)self->_userTrackingButton _landscapeImagePhoneForUserTrackingMode:a3 controlState:0];
}

- (void)_setLandscapeImagePhone:(id)a3 forUserTrackingMode:(int64_t)a4
{
}

- (id)_trackingEmptyImage
{
  trackingEmptyImage = self->_trackingEmptyImage;
  if (!trackingEmptyImage)
  {
    objc_msgSend(MEMORY[0x1E4F42A80], "_mapkit_imageNamed:", @"TrackingEmpty.png");
    v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
    objc_super v5 = self->_trackingEmptyImage;
    self->_trackingEmptyImage = v4;

    trackingEmptyImage = self->_trackingEmptyImage;
  }

  return trackingEmptyImage;
}

- (id)_trackingNoneImage
{
  trackingNoneImage = self->_trackingNoneImage;
  if (!trackingNoneImage)
  {
    if (_MKLinkedOnOrAfterReleaseSet(2310)) {
      [MEMORY[0x1E4F42A80] systemImageNamed:@"location"];
    }
    else {
      objc_msgSend(MEMORY[0x1E4F42A80], "_mapkit_imageNamed:", @"TrackingLocationMask");
    }
    v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
    objc_super v5 = self->_trackingNoneImage;
    self->_trackingNoneImage = v4;

    trackingNoneImage = self->_trackingNoneImage;
  }

  return trackingNoneImage;
}

- (id)_trackingFollowImage
{
  trackingFollowImage = self->_trackingFollowImage;
  if (!trackingFollowImage)
  {
    if (_MKLinkedOnOrAfterReleaseSet(2310)) {
      [MEMORY[0x1E4F42A80] systemImageNamed:@"location.fill"];
    }
    else {
      objc_msgSend(MEMORY[0x1E4F42A80], "_mapkit_imageNamed:", @"TrackingLocationMask");
    }
    v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
    objc_super v5 = self->_trackingFollowImage;
    self->_trackingFollowImage = v4;

    trackingFollowImage = self->_trackingFollowImage;
  }

  return trackingFollowImage;
}

- (id)_trackingFollowWithHeadingImage
{
  trackingFollowWithHeadingImage = self->_trackingFollowWithHeadingImage;
  if (!trackingFollowWithHeadingImage)
  {
    if (_MKLinkedOnOrAfterReleaseSet(2310)) {
      [MEMORY[0x1E4F42A80] systemImageNamed:@"location.north.line.fill"];
    }
    else {
      objc_msgSend(MEMORY[0x1E4F42A80], "_mapkit_imageNamed:", @"TrackingHeadingMask");
    }
    v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
    objc_super v5 = self->_trackingFollowWithHeadingImage;
    self->_trackingFollowWithHeadingImage = v4;

    trackingFollowWithHeadingImage = self->_trackingFollowWithHeadingImage;
  }

  return trackingFollowWithHeadingImage;
}

+ (Class)_activityIndicatorClass
{
  return (Class)objc_opt_class();
}

- (int64_t)_activityIndicatorStyle
{
  if ([(MKUserTrackingBarButtonItem *)self _isInMiniBar]) {
    return 4;
  }
  else {
    return 100;
  }
}

- (BOOL)_isInMiniBar
{
  toolbar = self->_toolbar;
  if (toolbar || (toolbar = self->_navigationBar) != 0) {
    LOBYTE(toolbar) = [toolbar isMinibar];
  }
  return (char)toolbar;
}

- (MKUserTrackingView)_userTrackingView
{
  return [(_MKUserTrackingButtonController *)self->_controller userTrackingView];
}

- (void)_setUserTrackingView:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v4 = (MKMapView *)v6;
  }
  else {
    v4 = 0;
  }
  mapView = self->_mapView;
  self->_mapView = v4;

  [(_MKUserTrackingButtonController *)self->_controller setUserTrackingView:v6];
}

- (MKMapView)mapView
{
  v3 = [(MKUserTrackingBarButtonItem *)self _userTrackingView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    objc_super v5 = [(MKUserTrackingBarButtonItem *)self _userTrackingView];
  }
  else
  {
    objc_super v5 = 0;
  }

  return (MKMapView *)v5;
}

- (void)setMapView:(MKMapView *)mapView
{
  objc_super v5 = mapView;
  id v13 = v5;
  if (v5 && (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), objc_super v5 = v13, (isKindOfClass & 1) == 0))
  {
    v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3C8];
    v9 = NSString;
    uint64_t v10 = self;
    v11 = NSStringFromSelector(a2);
    v12 = [v9 stringWithFormat:@"%@ %@", v10, v11];

    [v7 raise:v8, @"%@: mapView must be an MKMapView instance", v12 format];
  }
  else
  {
    [(MKUserTrackingBarButtonItem *)self _setUserTrackingView:v5];
  }
}

- (BOOL)isEnabled
{
  return self->_explicitlyEnabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_explicitlyEnabled = a3;
  BOOL v4 = a3 && self->_internallyEnabled;
  v5.receiver = self;
  v5.super_class = (Class)MKUserTrackingBarButtonItem;
  [(MKUserTrackingBarButtonItem *)&v5 setEnabled:v4];
  [(UIButton *)self->_customButton setEnabled:v4];
}

- (void)_setInternallyEnabled:(BOOL)a3
{
  self->_internallyEnabled = a3;
  BOOL v4 = self->_explicitlyEnabled && a3;
  v5.receiver = self;
  v5.super_class = (Class)MKUserTrackingBarButtonItem;
  [(MKUserTrackingBarButtonItem *)&v5 setEnabled:v4];
  [(UIButton *)self->_customButton setEnabled:v4];
}

- (void)set_associatedView:(id)a3
{
  id v7 = a3;
  p_associatedView = &self->_associatedView;
  associatedView = self->_associatedView;
  if (associatedView) {
    [(UIView *)associatedView removeObserver:self forKeyPath:@"controlSize"];
  }
  objc_storeStrong((id *)&self->_associatedView, a3);
  if (*p_associatedView) {
    [(UIView *)*p_associatedView addObserver:self forKeyPath:@"controlSize" options:0 context:0];
  }
}

- (id)createViewForToolbar:(id)a3
{
  id v4 = a3;
  if (self->_hasCustomAssociatedView)
  {
    objc_super v5 = [(MKUserTrackingBarButtonItem *)self _associatedView];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)MKUserTrackingBarButtonItem;
    id v6 = [(MKUserTrackingBarButtonItem *)&v9 createViewForToolbar:v4];
    [(MKUserTrackingBarButtonItem *)self set_associatedView:v6];

    [(MKUserTrackingBarButtonItem *)self set_toolbar:v4];
    id v7 = [(_MKUserTrackingButtonController *)self->_controller imageView];
    [v7 removeFromSuperview];
    [(UIView *)self->_associatedView addSubview:v7];
    [(MKUserTrackingBarButtonItem *)self _repositionViews];
    objc_super v5 = self->_associatedView;
  }

  return v5;
}

- (id)createViewForNavigationItem:(id)a3
{
  id v4 = a3;
  if (self->_hasCustomAssociatedView)
  {
    objc_super v5 = [(MKUserTrackingBarButtonItem *)self _associatedView];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)MKUserTrackingBarButtonItem;
    id v6 = [(MKUserTrackingBarButtonItem *)&v10 createViewForNavigationItem:v4];
    [(MKUserTrackingBarButtonItem *)self set_associatedView:v6];

    id v7 = [v4 navigationBar];
    [(MKUserTrackingBarButtonItem *)self set_navigationBar:v7];

    uint64_t v8 = [(_MKUserTrackingButtonController *)self->_controller imageView];
    [v8 removeFromSuperview];
    [(UIView *)self->_associatedView addSubview:v8];
    [(MKUserTrackingBarButtonItem *)self _repositionViews];
    objc_super v5 = self->_associatedView;
  }

  return v5;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v10 isEqualToString:@"controlSize"])
  {
    [(MKUserTrackingBarButtonItem *)self _repositionViews];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)MKUserTrackingBarButtonItem;
    [(MKUserTrackingBarButtonItem *)&v13 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (BOOL)_isHighlightedForState:(int64_t)a3
{
  return a3 > 1;
}

- (void)_updateForState:(int64_t)a3
{
}

- (int64_t)_state
{
  return [(_MKUserTrackingButtonController *)self->_controller state];
}

- (void)_setState:(int64_t)a3
{
}

- (void)_goToNextMode:(id)a3
{
}

- (UIToolbar)_toolbar
{
  return self->_toolbar;
}

- (void)set_toolbar:(id)a3
{
}

- (UINavigationBar)_navigationBar
{
  return self->_navigationBar;
}

- (void)set_navigationBar:(id)a3
{
}

- (UIView)_associatedView
{
  return self->_associatedView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedView, 0);
  objc_storeStrong((id *)&self->_navigationBar, 0);
  objc_storeStrong((id *)&self->_toolbar, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_storeStrong((id *)&self->_trackingFollowWithHeadingImage, 0);
  objc_storeStrong((id *)&self->_trackingFollowImage, 0);
  objc_storeStrong((id *)&self->_trackingNoneImage, 0);
  objc_storeStrong((id *)&self->_trackingEmptyImage, 0);
  objc_storeStrong((id *)&self->_userTrackingButton, 0);
  objc_storeStrong((id *)&self->_controller, 0);

  objc_storeStrong((id *)&self->_customButton, 0);
}

@end
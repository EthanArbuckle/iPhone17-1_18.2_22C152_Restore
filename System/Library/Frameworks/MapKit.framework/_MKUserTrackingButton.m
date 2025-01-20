@interface _MKUserTrackingButton
+ (Class)_activityIndicatorClass;
+ (_MKUserTrackingButton)buttonWithMapView:(id)a3 applyDefaultImageIfNeeded:(BOOL)a4;
+ (_MKUserTrackingButton)buttonWithUserTrackingView:(id)a3;
+ (_MKUserTrackingButton)buttonWithUserTrackingView:(id)a3 withType:(int64_t)a4;
+ (_MKUserTrackingButton)buttonWithUserTrackingView:(id)a3 withType:(int64_t)a4 applyDefaultImageIfNeeded:(BOOL)a5;
- (BOOL)_isHighlightedForState:(int64_t)a3;
- (BOOL)_selectsWhenTracking;
- (BOOL)inMiniBar;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MKMapView)mapView;
- (MKUserTrackingView)userTrackingView;
- (UIEdgeInsets)_imageEdgeInsetsForUserTrackingMode:(int64_t)a3;
- (_MKUserTrackingButtonController)controller;
- (id)_defaultImageForUserTrackingMode:(int64_t)a3 controlState:(unint64_t)a4;
- (id)_defaultLandscapeImagePhoneForUserTrackingMode:(int64_t)a3 controlState:(unint64_t)a4;
- (id)_imageForState:(int64_t)a3 controlState:(unint64_t)a4;
- (id)_imageForUserTrackingMode:(int64_t)a3 controlState:(unint64_t)a4;
- (id)_landscapeImagePhoneForUserTrackingMode:(int64_t)a3 controlState:(unint64_t)a4;
- (int64_t)_activityIndicatorStyle;
- (int64_t)_state;
- (unint64_t)behavior;
- (unint64_t)controlSize;
- (void)_repositionViews;
- (void)_setImage:(id)a3 forUserTrackingMode:(int64_t)a4 controlState:(unint64_t)a5;
- (void)_setImageEdgeInsets:(UIEdgeInsets)a3 forUserTrackingMode:(int64_t)a4;
- (void)_setInternallyEnabled:(BOOL)a3;
- (void)_setLandscapeImagePhone:(id)a3 forUserTrackingMode:(int64_t)a4 controlState:(unint64_t)a5;
- (void)_setSelectsWhenTracking:(BOOL)a3;
- (void)_setState:(int64_t)a3;
- (void)setControlSize:(unint64_t)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setMapView:(id)a3;
- (void)setUserTrackingView:(id)a3;
- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4;
- (void)updateForMiniBarState:(BOOL)a3;
@end

@implementation _MKUserTrackingButton

- (void)_setImageEdgeInsets:(UIEdgeInsets)a3 forUserTrackingMode:(int64_t)a4
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  if (!self->_customImageEdgeInsets)
  {
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    customImageEdgeInsets = self->_customImageEdgeInsets;
    self->_customImageEdgeInsets = v10;
  }
  v12 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithUIEdgeInsets:", top, left, bottom, right);
  v13 = self->_customImageEdgeInsets;
  v14 = [NSNumber numberWithInteger:a4];
  [(NSMutableDictionary *)v13 setObject:v12 forKeyedSubscript:v14];

  controller = self->_controller;

  [(_MKUserTrackingButtonController *)controller _reloadState];
}

- (void)_setImage:(id)a3 forUserTrackingMode:(int64_t)a4 controlState:(unint64_t)a5
{
  id v16 = a3;
  customImages = self->_customImages;
  if (!customImages)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v10 = self->_customImages;
    self->_customImages = v9;

    customImages = self->_customImages;
  }
  v11 = [NSNumber numberWithInteger:a4];
  id v12 = [(NSMutableDictionary *)customImages objectForKeyedSubscript:v11];

  if (!v12)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v13 = self->_customImages;
    v14 = [NSNumber numberWithInteger:a4];
    [(NSMutableDictionary *)v13 setObject:v12 forKeyedSubscript:v14];
  }
  v15 = [NSNumber numberWithUnsignedInteger:a5];
  if (v16) {
    [v12 setObject:v16 forKeyedSubscript:v15];
  }
  else {
    [v12 removeObjectForKey:v15];
  }

  [(_MKUserTrackingButtonController *)self->_controller _reloadState];
}

- (id)_imageForState:(int64_t)a3 controlState:(unint64_t)a4
{
  switch(a3)
  {
    case -1:
    case 1:
      v6 = objc_msgSend(MEMORY[0x1E4F42A80], "_mapkit_imageNamed:", @"TrackingEmpty.png", a4, v4);
      goto LABEL_17;
    case 0:
      if (self->_inMiniBar)
      {
        uint64_t v8 = 0;
        goto LABEL_12;
      }
      uint64_t v9 = 0;
      goto LABEL_16;
    case 2:
      if (self->_inMiniBar)
      {
        uint64_t v8 = 1;
        goto LABEL_12;
      }
      uint64_t v9 = 1;
      goto LABEL_16;
    case 3:
      if (self->_inMiniBar)
      {
        uint64_t v8 = 2;
LABEL_12:
        v6 = -[_MKUserTrackingButton _landscapeImagePhoneForUserTrackingMode:controlState:](self, "_landscapeImagePhoneForUserTrackingMode:controlState:", v8, a4, v4);
      }
      else
      {
        uint64_t v9 = 2;
LABEL_16:
        v6 = -[_MKUserTrackingButton _imageForUserTrackingMode:controlState:](self, "_imageForUserTrackingMode:controlState:", v9, a4, v4);
      }
LABEL_17:
      return v6;
    default:
      v6 = 0;
      return v6;
  }
}

- (id)_imageForUserTrackingMode:(int64_t)a3 controlState:(unint64_t)a4
{
  customImages = self->_customImages;
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithInteger:");
  uint64_t v9 = [(NSMutableDictionary *)customImages objectForKeyedSubscript:v8];

  if (!v9
    || ([NSNumber numberWithUnsignedInteger:a4],
        v10 = objc_claimAutoreleasedReturnValue(),
        [v9 objectForKeyedSubscript:v10],
        v11 = objc_claimAutoreleasedReturnValue(),
        v10,
        !v11))
  {
    if (self->_applyDefaultImageIfNeeded)
    {
      v11 = [(_MKUserTrackingButton *)self _defaultImageForUserTrackingMode:a3 controlState:a4];
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (BOOL)inMiniBar
{
  return self->_inMiniBar;
}

- (void)_repositionViews
{
  int64_t v3 = [(_MKUserTrackingButtonController *)self->_controller state];
  switch(v3)
  {
    case 3:
      uint64_t v4 = self;
      uint64_t v5 = 2;
      goto LABEL_7;
    case 2:
      uint64_t v4 = self;
      uint64_t v5 = 1;
      goto LABEL_7;
    case 0:
      uint64_t v4 = self;
      uint64_t v5 = 0;
LABEL_7:
      [(_MKUserTrackingButton *)v4 _imageEdgeInsetsForUserTrackingMode:v5];
      goto LABEL_9;
  }
  double v6 = *MEMORY[0x1E4F437F8];
  double v7 = *(double *)(MEMORY[0x1E4F437F8] + 8);
  double v8 = *(double *)(MEMORY[0x1E4F437F8] + 16);
  double v9 = *(double *)(MEMORY[0x1E4F437F8] + 24);
LABEL_9:

  -[_MKUserTrackingButton setImageEdgeInsets:](self, "setImageEdgeInsets:", v6, v7, v8, v9);
}

- (UIEdgeInsets)_imageEdgeInsetsForUserTrackingMode:(int64_t)a3
{
  customImageEdgeInsets = self->_customImageEdgeInsets;
  double v6 = objc_msgSend(NSNumber, "numberWithInteger:");
  double v7 = [(NSMutableDictionary *)customImageEdgeInsets objectForKeyedSubscript:v6];

  if (v7)
  {
    [v7 UIEdgeInsetsValue];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    goto LABEL_15;
  }
  double v13 = 0.0;
  if ((unint64_t)a3 > 1)
  {
    double v15 = 0.0;
    double v11 = 0.0;
    double v9 = 0.0;
    goto LABEL_15;
  }
  if (self->_inMiniBar)
  {
    if (_MKLinkedOnOrAfterReleaseSet(2310))
    {
LABEL_10:
      double v9 = 1.0;
      double v15 = 2.0;
      double v11 = 2.0;
      goto LABEL_15;
    }
    double v15 = 2.0;
    if (self->_inMiniBar)
    {
      double v11 = 0.0;
      double v9 = 2.0;
      goto LABEL_15;
    }
  }
  if (_MKLinkedOnOrAfterReleaseSet(2310)) {
    goto LABEL_10;
  }
  double v15 = 2.0;
  if (self->_inMiniBar) {
    double v9 = 2.0;
  }
  else {
    double v9 = 3.0;
  }
  double v11 = 0.0;
LABEL_15:

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.double right = v19;
  result.double bottom = v18;
  result.double left = v17;
  result.double top = v16;
  return result;
}

+ (_MKUserTrackingButton)buttonWithMapView:(id)a3 applyDefaultImageIfNeeded:(BOOL)a4
{
  return (_MKUserTrackingButton *)[a1 buttonWithUserTrackingView:a3 withType:1 applyDefaultImageIfNeeded:a4];
}

- (void)_setSelectsWhenTracking:(BOOL)a3
{
  self->_selectsWhenTracking = a3;
}

+ (_MKUserTrackingButton)buttonWithUserTrackingView:(id)a3 withType:(int64_t)a4 applyDefaultImageIfNeeded:(BOOL)a5
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = [a1 buttonWithType:a4];
  [(id)v9 sizeToFit];
  *(unsigned char *)(v9 + 777) = 1;
  *(unsigned char *)(v9 + 778) = 1;
  *(unsigned char *)(v9 + 779) = a5;
  double v10 = [_MKUserTrackingButtonController alloc];
  double v11 = [(id)v9 imageView];
  uint64_t v12 = [(_MKUserTrackingButtonController *)v10 initWithTarget:v9 userTrackingView:v8 imageView:v11 button:v9];

  double v13 = *(void **)(v9 + 744);
  *(void *)(v9 + 744) = v12;

  [(id)v9 addTarget:*(void *)(v9 + 744) action:sel__goToNextMode_ forControlEvents:0x2000];
  *(unsigned char *)(v9 + 776) = 1;
  objc_msgSend(*(id *)(v9 + 744), "setButtonBehavior:", objc_msgSend((id)v9, "behavior"));
  [*(id *)(v9 + 744) _reloadState];
  v17[0] = objc_opt_class();
  double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  id v15 = (id)[(id)v9 registerForTraitChanges:v14 withAction:sel_traitEnvironment_didChangeTraitCollection_];

  return (_MKUserTrackingButton *)(id)v9;
}

- (unint64_t)behavior
{
  return 0;
}

- (BOOL)_isHighlightedForState:(int64_t)a3
{
  return a3 > 1 && self->_selectsWhenTracking;
}

- (void)_setInternallyEnabled:(BOOL)a3
{
  self->_internallyEnabled = a3;
  *(void *)&a3 = self->_explicitlyEnabled && a3;
  v3.receiver = self;
  v3.super_class = (Class)_MKUserTrackingButton;
  [(_MKUserTrackingButton *)&v3 setEnabled:a3];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = 36.0;
  if (self->_inMiniBar) {
    double v3 = 25.0;
  }
  double v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

+ (_MKUserTrackingButton)buttonWithUserTrackingView:(id)a3
{
  return (_MKUserTrackingButton *)[a1 buttonWithUserTrackingView:a3 withType:1];
}

+ (_MKUserTrackingButton)buttonWithUserTrackingView:(id)a3 withType:(int64_t)a4
{
  return (_MKUserTrackingButton *)[a1 buttonWithUserTrackingView:a3 withType:a4 applyDefaultImageIfNeeded:1];
}

- (MKMapView)mapView
{
  double v3 = [(_MKUserTrackingButtonController *)self->_controller userTrackingView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v5 = [(_MKUserTrackingButtonController *)self->_controller userTrackingView];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return (MKMapView *)v5;
}

- (void)setMapView:(id)a3
{
  id v5 = a3;
  id v13 = v5;
  if (v5 && (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), id v5 = v13, (isKindOfClass & 1) == 0))
  {
    double v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3C8];
    uint64_t v9 = NSString;
    double v10 = self;
    double v11 = NSStringFromSelector(a2);
    uint64_t v12 = [v9 stringWithFormat:@"%@ %@", v10, v11];

    [v7 raise:v8, @"%@: mapView must be an MKMapView instance", v12 format];
  }
  else
  {
    [(_MKUserTrackingButtonController *)self->_controller setUserTrackingView:v5];
  }
}

- (void)setControlSize:(unint64_t)a3
{
  if (self->_controlSize != a3)
  {
    self->_controlSize = a3;
    -[_MKUserTrackingButtonController setControlSize:](self->_controller, "setControlSize:");
  }
}

- (MKUserTrackingView)userTrackingView
{
  return [(_MKUserTrackingButtonController *)self->_controller userTrackingView];
}

- (void)setUserTrackingView:(id)a3
{
}

- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "userInterfaceStyle", a3);
  double v6 = [(_MKUserTrackingButton *)self traitCollection];
  uint64_t v7 = [v6 userInterfaceStyle];

  if (v5 != v7)
  {
    controller = self->_controller;
    [(_MKUserTrackingButtonController *)controller _updateLoading];
  }
}

- (id)_defaultImageForUserTrackingMode:(int64_t)a3 controlState:(unint64_t)a4
{
  if (a4)
  {
    uint64_t v8 = 0;
    return (id)v8;
  }
  uint64_t v15 = v4;
  uint64_t v8 = _MKLinkedOnOrAfterReleaseSet(2310);
  if (v8)
  {
    double v11 = @"location";
    if (a3 == 1) {
      double v11 = @"location.fill";
    }
    if (a3 == 2) {
      uint64_t v12 = @"location.north.line.fill";
    }
    else {
      uint64_t v12 = v11;
    }
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F42A80], "systemImageNamed:", v12, v5, v15, v6);
    goto LABEL_19;
  }
  if (a3 == 2)
  {
    id v13 = (void *)MEMORY[0x1E4F42A80];
    double v14 = @"TrackingHeadingMask.png";
  }
  else if (a3 == 1)
  {
    id v13 = (void *)MEMORY[0x1E4F42A80];
    double v14 = @"TrackingLocationMask.png";
  }
  else
  {
    if (a3) {
      goto LABEL_19;
    }
    id v13 = (void *)MEMORY[0x1E4F42A80];
    double v14 = @"TrackingLocationOffMask.png";
  }
  uint64_t v8 = objc_msgSend(v13, "_mapkit_imageNamed:", v14, v5, v15, v6);
LABEL_19:
  return (id)v8;
}

- (id)_defaultLandscapeImagePhoneForUserTrackingMode:(int64_t)a3 controlState:(unint64_t)a4
{
  if (a4)
  {
    uint64_t v8 = 0;
    return (id)v8;
  }
  uint64_t v15 = v4;
  uint64_t v8 = _MKLinkedOnOrAfterReleaseSet(2310);
  if (v8)
  {
    double v11 = @"location";
    if (a3 == 1) {
      double v11 = @"location.fill";
    }
    if (a3 == 2) {
      uint64_t v12 = @"location.north.line.fill";
    }
    else {
      uint64_t v12 = v11;
    }
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F42A80], "systemImageNamed:", v12, v5, v15, v6);
    goto LABEL_19;
  }
  if (a3 == 2)
  {
    id v13 = (void *)MEMORY[0x1E4F42A80];
    double v14 = @"TrackingHeadingMaskLandscape.png";
  }
  else if (a3 == 1)
  {
    id v13 = (void *)MEMORY[0x1E4F42A80];
    double v14 = @"TrackingLocationMaskLandscape.png";
  }
  else
  {
    if (a3) {
      goto LABEL_19;
    }
    id v13 = (void *)MEMORY[0x1E4F42A80];
    double v14 = @"TrackingLocationOffMaskLandscape.png";
  }
  uint64_t v8 = objc_msgSend(v13, "_mapkit_imageNamed:", v14, v5, v15, v6);
LABEL_19:
  return (id)v8;
}

- (id)_landscapeImagePhoneForUserTrackingMode:(int64_t)a3 controlState:(unint64_t)a4
{
  customLandscapeImagePhones = self->_customLandscapeImagePhones;
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithInteger:");
  uint64_t v9 = [(NSMutableDictionary *)customLandscapeImagePhones objectForKeyedSubscript:v8];

  if (!v9
    || ([NSNumber numberWithUnsignedInteger:a4],
        double v10 = objc_claimAutoreleasedReturnValue(),
        [v9 objectForKeyedSubscript:v10],
        double v11 = objc_claimAutoreleasedReturnValue(),
        v10,
        !v11))
  {
    double v11 = [(_MKUserTrackingButton *)self _defaultLandscapeImagePhoneForUserTrackingMode:a3 controlState:a4];
  }

  return v11;
}

- (void)_setLandscapeImagePhone:(id)a3 forUserTrackingMode:(int64_t)a4 controlState:(unint64_t)a5
{
  id v16 = a3;
  customLandscapeImagePhones = self->_customLandscapeImagePhones;
  if (!customLandscapeImagePhones)
  {
    uint64_t v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    double v10 = self->_customLandscapeImagePhones;
    self->_customLandscapeImagePhones = v9;

    customLandscapeImagePhones = self->_customLandscapeImagePhones;
  }
  double v11 = [NSNumber numberWithInteger:a4];
  id v12 = [(NSMutableDictionary *)customLandscapeImagePhones objectForKeyedSubscript:v11];

  if (!v12)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v13 = self->_customLandscapeImagePhones;
    double v14 = [NSNumber numberWithInteger:a4];
    [(NSMutableDictionary *)v13 setObject:v12 forKeyedSubscript:v14];
  }
  uint64_t v15 = [NSNumber numberWithUnsignedInteger:a5];
  if (v16) {
    [v12 setObject:v16 forKeyedSubscript:v15];
  }
  else {
    [v12 removeObjectForKey:v15];
  }

  [(_MKUserTrackingButtonController *)self->_controller _reloadState];
}

+ (Class)_activityIndicatorClass
{
  return (Class)objc_opt_class();
}

- (int64_t)_activityIndicatorStyle
{
  return 100;
}

- (int64_t)_state
{
  return [(_MKUserTrackingButtonController *)self->_controller state];
}

- (void)_setState:(int64_t)a3
{
}

- (void)updateForMiniBarState:(BOOL)a3
{
  if (self->_inMiniBar != a3)
  {
    self->_inMiniBar = a3;
    [(_MKUserTrackingButtonController *)self->_controller _reloadState];
    [(_MKUserTrackingButton *)self sizeToFit];
  }
}

- (void)setEnabled:(BOOL)a3
{
  self->_explicitlyEnabled = a3;
  v3.receiver = self;
  v3.super_class = (Class)_MKUserTrackingButton;
  -[_MKUserTrackingButton setEnabled:](&v3, sel_setEnabled_);
}

- (_MKUserTrackingButtonController)controller
{
  return self->_controller;
}

- (BOOL)_selectsWhenTracking
{
  return self->_selectsWhenTracking;
}

- (unint64_t)controlSize
{
  return self->_controlSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customImageEdgeInsets, 0);
  objc_storeStrong((id *)&self->_customLandscapeImagePhones, 0);
  objc_storeStrong((id *)&self->_customImages, 0);

  objc_storeStrong((id *)&self->_controller, 0);
}

@end
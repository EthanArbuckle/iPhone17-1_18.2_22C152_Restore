@interface PhoneViewController
+ ($1FF454C5B48E436092D281DABF654916)badge;
+ (BOOL)tabBarIconImageFinished:(id *)a3 forTabBarItemName:(id)a4;
+ (id)defaultPNGName;
+ (id)tabBarIconName;
+ (int)tabViewType;
+ (void)initializeIconAndTitle:(id)a3;
- (BOOL)shouldSnapshot;
- (Class)cellClassForCachedCellHeight;
- (PhoneViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)cachedCellHeight;
- (unint64_t)supportedInterfaceOrientations;
- (void)_loadOffsetDefaultForKey:(id)a3 withScrollView:(id)a4;
- (void)_prepareForLoadView;
- (void)_saveOffsetDefaultForKey:(id)a3 withScrollView:(id)a4;
- (void)_updateCachedCellHeight;
- (void)setCachedCellHeight:(double)a3;
- (void)setCellClassForCachedCellHeight:(Class)a3;
@end

@implementation PhoneViewController

void __46__PhoneViewController_initializeIconAndTitle___block_invoke(uint64_t a1)
{
  id v2 = [(id)objc_opt_class() badge];
  uint64_t v4 = v3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __46__PhoneViewController_initializeIconAndTitle___block_invoke_2;
  block[3] = &unk_10027C918;
  id v6 = *(id *)(a1 + 40);
  id v7 = v2;
  uint64_t v8 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

+ ($1FF454C5B48E436092D281DABF654916)badge
{
  BOOL v2 = 1;
  unint64_t v3 = 0;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (PhoneViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PhoneViewController;
  uint64_t v4 = [(PhoneViewController *)&v7 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    +[PhoneViewController initializeIconAndTitle:v4];
    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v4 selector:"savePreferences" name:@"PhoneApplicationDeactivatedNotification" object:0];
    [v5 addObserver:v4 selector:"contentSizeCategoryDidChange" name:UIContentSizeCategoryDidChangeNotification object:0];
    if ([UIApp userInterfaceStyle] == 1) {
      [(PhoneViewController *)v4 setEdgesForExtendedLayout:0];
    }
  }
  return v4;
}

+ (void)initializeIconAndTitle:(id)a3
{
  id v3 = a3;
  unsigned int v4 = +[UIApplication shouldMakeUIForDefaultPNG];
  if (v4)
  {
    id v5 = 0;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_respondsToSelector())
    {
      id v5 = objc_msgSend(objc_alloc((Class)UITabBarItem), "initWithTabBarSystemItem:tag:", objc_msgSend((id)objc_opt_class(), "tabBarSystemItem"), 0);
      id v6 = objc_opt_new();
      [v5 setStandardAppearance:v6];

      [v3 setTabBarItem:v5];
    }
    else
    {
      id v5 = [v3 tabBarItem];
      objc_opt_class();
      if (objc_opt_respondsToSelector())
      {
        objc_super v7 = [(id)objc_opt_class() tabBarIconImage];
        [v5 setImage:v7];
      }
    }
  }
  objc_opt_class();
  uint64_t v8 = &stru_100285990;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v8 = [(id)objc_opt_class() tabBarIconName];
  }
  if (v4) {
    v9 = &stru_100285990;
  }
  else {
    v9 = v8;
  }
  v10 = v9;
  if ([v5 isSystemItem]) {
    [v5 _setInternalTitle:v10];
  }
  else {
    [v5 setTitle:v10];
  }
  if (objc_opt_respondsToSelector()) {
    [v3 setTitle:v10];
  }
  objc_opt_class();
  if (objc_opt_respondsToSelector())
  {
    v11 = dispatch_get_global_queue(0, 0);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = __46__PhoneViewController_initializeIconAndTitle___block_invoke;
    v12[3] = &unk_10027C940;
    id v13 = v3;
    id v14 = v5;
    dispatch_async(v11, v12);
  }
}

void __46__PhoneViewController_initializeIconAndTitle___block_invoke_2(void *a1)
{
  v1 = (void *)a1[4];
  PhoneStringForBadgeValue(a1[5], a1[6]);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 setBadgeValue:v2];
}

- (unint64_t)supportedInterfaceOrientations
{
  if ([UIApp contentViewCanRotate]) {
    return 30;
  }
  else {
    return 2;
  }
}

+ (int)tabViewType
{
  return 0;
}

+ (id)tabBarIconName
{
  return 0;
}

+ (id)defaultPNGName
{
  return @"Default";
}

- (BOOL)shouldSnapshot
{
  return 1;
}

- (void)_saveOffsetDefaultForKey:(id)a3 withScrollView:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  if (([(PhoneViewController *)self isViewLoaded] & 1) != 0
    || (+[NSString stringWithFormat:@"View must be loaded before you call _saveOffsetDefaultForKey:withScrollView:"], v9 = objc_claimAutoreleasedReturnValue(), NSLog(@"** TUAssertion failure: %@", v9), v9, !_TUAssertShouldCrashApplication())|| ([(PhoneViewController *)self isViewLoaded] & 1) != 0)
  {
    if (v8) {
      goto LABEL_7;
    }
  }
  else
  {
    v19 = +[NSAssertionHandler currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"PhoneViewController.m" lineNumber:157 description:@"View must be loaded before you call _saveOffsetDefaultForKey:withScrollView:"];

    if (v8) {
      goto LABEL_7;
    }
  }
  v10 = +[NSString stringWithFormat:@"Passed nil key to _saveOffsetDefaultForKey:withScrollView:"];
  NSLog(@"** TUAssertion failure: %@", v10);

  if (_TUAssertShouldCrashApplication())
  {
    v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PhoneViewController.m" lineNumber:158 description:@"Passed nil key to _saveOffsetDefaultForKey:withScrollView:"];
  }
LABEL_7:
  if (!v7)
  {
    v12 = +[NSString stringWithFormat:@"Passed nil scrollView to _saveOffsetDefaultForKey:withScrollView:"];
    NSLog(@"** TUAssertion failure: %@", v12);

    if (_TUAssertShouldCrashApplication())
    {
      id v13 = +[NSAssertionHandler currentHandler];
      [v13 handleFailureInMethod:a2 object:self file:@"PhoneViewController.m" lineNumber:159 description:@"Passed nil scrollView to _saveOffsetDefaultForKey:withScrollView:"];
    }
  }
  [v7 contentOffset];
  double v15 = v14;
  [v7 contentInset];
  double v17 = v16;

  double v18 = v15 + v17;
  *(float *)&double v18 = v15 + v17;
  id v20 = +[NSNumber numberWithFloat:v18];
  PHPreferencesSetValueInDomain(v8, v20, 0);
}

- (void)_loadOffsetDefaultForKey:(id)a3 withScrollView:(id)a4
{
  id v17 = a3;
  id v7 = a4;
  if (([(PhoneViewController *)self isViewLoaded] & 1) == 0)
  {
    id v8 = +[NSString stringWithFormat:@"View must be loaded before you call _loadOffsetDefaultForKey:withScrollView:"];
    NSLog(@"** TUAssertion failure: %@", v8);

    if (_TUAssertShouldCrashApplication())
    {
      if (([(PhoneViewController *)self isViewLoaded] & 1) == 0)
      {
        double v16 = +[NSAssertionHandler currentHandler];
        [v16 handleFailureInMethod:a2 object:self file:@"PhoneViewController.m" lineNumber:164 description:@"View must be loaded before you call _loadOffsetDefaultForKey:withScrollView:"];
      }
    }
  }
  if (!v17)
  {
    v9 = +[NSString stringWithFormat:@"Passed nil key to _saveOffsetDefaultForKey:withScrollView:"];
    NSLog(@"** TUAssertion failure: %@", v9);

    if (_TUAssertShouldCrashApplication())
    {
      v10 = +[NSAssertionHandler currentHandler];
      [v10 handleFailureInMethod:a2 object:self file:@"PhoneViewController.m" lineNumber:165 description:@"Passed nil key to _saveOffsetDefaultForKey:withScrollView:"];
    }
  }
  if (!v7)
  {
    v11 = +[NSString stringWithFormat:@"Passed nil scrollView to _loadOffsetDefaultForKey:withScrollView:"];
    NSLog(@"** TUAssertion failure: %@", v11);

    if (_TUAssertShouldCrashApplication())
    {
      v12 = +[NSAssertionHandler currentHandler];
      [v12 handleFailureInMethod:a2 object:self file:@"PhoneViewController.m" lineNumber:166 description:@"Passed nil scrollView to _loadOffsetDefaultForKey:withScrollView:"];
    }
  }
  id v13 = PHPreferencesGetValue(v17);
  double v14 = v13;
  if (v13)
  {
    [v13 floatValue];
    if (v15 < 0.0) {
      float v15 = 0.0;
    }
    [v7 setContentOffset:0.0 v15];
  }
}

- (void)_prepareForLoadView
{
  v4.receiver = self;
  v4.super_class = (Class)PhoneViewController;
  if ([(PhoneViewController *)&v4 respondsToSelector:"_primitiveSetNavigationControllerContentInsetAdjustment:"])
  {
    v3.receiver = self;
    v3.super_class = (Class)PhoneViewController;
    if ([(PhoneViewController *)&v3 respondsToSelector:"_primitiveSetNavigationControllerContentOffsetAdjustment:"])
    {
      -[PhoneViewController _primitiveSetNavigationControllerContentInsetAdjustment:](self, "_primitiveSetNavigationControllerContentInsetAdjustment:", 0.0, 0.0, 0.0, 0.0);
      [(PhoneViewController *)self _primitiveSetNavigationControllerContentOffsetAdjustment:0.0];
    }
  }
}

- (void)setCellClassForCachedCellHeight:(Class)a3
{
  p_cellClassForCachedCellHeight = &self->_cellClassForCachedCellHeight;
  if (*p_cellClassForCachedCellHeight != a3)
  {
    objc_storeStrong((id *)p_cellClassForCachedCellHeight, a3);
    [(PhoneViewController *)self _updateCachedCellHeight];
  }
}

- (void)_updateCachedCellHeight
{
  if ([(PhoneViewController *)self cellClassForCachedCellHeight])
  {
    id v7 = [objc_alloc(-[PhoneViewController cellClassForCachedCellHeight](self, "cellClassForCachedCellHeight")) initWithStyle:1 reuseIdentifier:@"PHSizingCell"];
    objc_super v3 = [(PhoneViewController *)self view];
    [v3 frame];
    [v7 systemLayoutSizeFittingSize:v4];
    double v6 = v5;

    [(PhoneViewController *)self setCachedCellHeight:v6];
  }
}

+ (BOOL)tabBarIconImageFinished:(id *)a3 forTabBarItemName:(id)a4
{
  return *a3 != 0;
}

- (double)cachedCellHeight
{
  return self->_cachedCellHeight;
}

- (void)setCachedCellHeight:(double)a3
{
  self->_cachedCellHeight = a3;
}

- (Class)cellClassForCachedCellHeight
{
  return self->_cellClassForCachedCellHeight;
}

- (void).cxx_destruct
{
}

@end
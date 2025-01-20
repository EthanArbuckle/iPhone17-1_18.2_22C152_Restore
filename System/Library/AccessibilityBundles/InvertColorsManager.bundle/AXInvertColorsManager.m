@interface AXInvertColorsManager
+ (BOOL)objectIsOnCarScreen:(id)a3;
+ (BOOL)toggleDarkModeWindowInvert:(id)a3;
+ (id)findSubviewDescendants:(id)a3 visitor:(id)a4;
+ (void)_initializeMonitoring;
+ (void)_traverseAppForInvertColors;
+ (void)initialize;
+ (void)toggleDarkModeWindowsInvert;
+ (void)toggleFirstLayerWindowInvert:(id)a3;
+ (void)toggleFirstLayerWindowsInvert;
+ (void)traverseAppForInvertColors:(id)a3;
+ (void)updateClassicInvertColors:(id)a3;
- (AXInvertColorsManager)init;
- (BOOL)_shouldInstallCategories;
- (id)_invertColorHelperClasses;
- (void)_installCategories;
- (void)_installSpringBoardCategories;
- (void)_installUIKitCategories;
- (void)_installWebKitCategories;
@end

@implementation AXInvertColorsManager

+ (void)initialize
{
  if (qword_836A8 != -1) {
    dispatch_once(&qword_836A8, &stru_44AF8);
  }
}

+ (void)_initializeMonitoring
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1F6AC;
  block[3] = &unk_446A8;
  block[4] = a1;
  if (qword_836B8 != -1) {
    dispatch_once(&qword_836B8, block);
  }
}

- (AXInvertColorsManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)AXInvertColorsManager;
  v2 = [(AXInvertColorsManager *)&v12 init];
  v3 = v2;
  if (v2)
  {
    if ([(AXInvertColorsManager *)v2 _shouldInstallCategories]) {
      [(AXInvertColorsManager *)v3 _installUIKitCategories];
    }
    location[1] = _NSConcreteStackBlock;
    location[2] = (id)3221225472;
    location[3] = sub_1F8BC;
    location[4] = &unk_44528;
    v4 = v3;
    v11 = v4;
    AXPerformBlockAsynchronouslyOnMainThread();
    objc_initWeak(location, v4);
    v5 = +[AXSettings sharedInstance];
    id WeakRetained = objc_loadWeakRetained(location);
    [v5 registerUpdateBlock:&stru_44B18 forRetrieveSelector:"classicInvertColors" withListener:WeakRetained];

    v9 = v4;
    AXPerformBlockOnMainThreadAfterDelay();
    v7 = v9;

    objc_destroyWeak(location);
  }

  return v3;
}

- (id)_invertColorHelperClasses
{
  v2 = +[NSMutableArray array];
  unsigned int outCount = 0;
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 executablePath];
  v5 = objc_copyClassNamesForImage((const char *)[v4 UTF8String], &outCount);

  if (outCount)
  {
    for (unint64_t i = 0; i < outCount; ++i)
    {
      v7 = +[NSString stringWithUTF8String:v5[i]];
      if ([(NSString *)v7 hasPrefix:@"AXInvertColors_"]) {
        [v2 addObject:NSClassFromString(v7)];
      }
    }
  }
  free(v5);
  [v2 sortUsingComparator:&stru_44BB8];

  return v2;
}

+ (id)findSubviewDescendants:(id)a3 visitor:(id)a4
{
  id v5 = a3;
  v6 = (unsigned int (**)(id, void *, unsigned char *))a4;
  id v7 = [objc_allocWithZone((Class)NSMutableArray) init];
  [v7 addObject:v5];
  v8 = +[NSMutableArray array];
  if ([v7 count])
  {
    while (1)
    {
      v9 = [v7 lastObject];
      [v7 removeLastObject];
      char v12 = 0;
      if (v6[2](v6, v9, &v12)) {
        [v8 addObject:v9];
      }
      if (v12) {
        break;
      }
      v10 = [v9 subviews];
      [v7 addObjectsFromArray:v10];

      if (![v7 count]) {
        goto LABEL_8;
      }
    }
  }
LABEL_8:

  return v8;
}

+ (void)traverseAppForInvertColors:(id)a3
{
  v3 = (void (**)(id, void *))a3;
  id v4 = +[NSMutableArray array];
  id v5 = +[UIApplication sharedApplication];
  [v4 axSafelyAddObject:v5];

  v6 = +[UIApplication sharedApplication];
  id v7 = [v6 delegate];
  [v4 axSafelyAddObject:v7];

  v8 = +[UIWindow allWindowsIncludingInternalWindows:1 onlyVisibleWindows:0];
  [v4 axSafelyAddObjectsFromArray:v8];

  v9 = AXLogInvertColorsTraversal();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_21FB4((uint64_t)v4, v9, v10, v11, v12, v13, v14, v15);
  }

  if ([v4 count])
  {
    *(void *)&long long v16 = 138477827;
    long long v23 = v16;
    while (1)
    {
      v18 = [v4 firstObject];
      v3[2](v3, v18);
      v19 = AXLogInvertColorsTraversal();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = v23;
        v25 = v18;
        _os_log_debug_impl(&dword_0, v19, OS_LOG_TYPE_DEBUG, "Call load %{private}@", buf, 0xCu);
      }

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v21 = [v18 childViewControllers];
        [v4 axSafelyAddObjectsFromArray:v21];
        goto LABEL_11;
      }
LABEL_12:
      v22 = objc_msgSend(v18, "_accessibilityInvertColorAdditionalVisitors", v23);
      [v4 axSafelyAddObjectsFromArray:v22];

      [v4 removeObjectAtIndex:0];
      if (![v4 count]) {
        goto LABEL_13;
      }
    }
    v20 = [v18 subviews];
    [v4 axSafelyAddObjectsFromArray:v20];

    v21 = +[UIViewController viewControllerForView:v18];
    [v4 axSafelyAddObject:v21];
LABEL_11:

    goto LABEL_12;
  }
LABEL_13:
}

+ (BOOL)objectIsOnCarScreen:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v3 screen],
        id v4 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v5 = [v4 _isCarScreen],
        v4,
        (v5 & 1) != 0))
  {
    unsigned __int8 v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [v3 window];
      v8 = [v7 screen];
      unsigned __int8 v6 = [v8 _isCarScreen];
    }
    else
    {
      unsigned __int8 v6 = 0;
    }
  }

  return v6;
}

+ (void)_traverseAppForInvertColors
{
  v2 = objc_opt_class();

  [v2 traverseAppForInvertColors:&stru_44C18];
}

+ (void)updateClassicInvertColors:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v3 accessibilityIgnoresInvertColors])
  {
    id v4 = [v3 layer];
    unsigned __int8 v5 = [v4 valueForKeyPath:@"filters.InvertColorsDoubleInvert"];

    if (v5)
    {
      unsigned __int8 v6 = [v4 valueForKeyPath:@"filters.InvertColorsDoubleInvert.enabled"];
      id v7 = +[AXSettings sharedInstance];
      unsigned int v8 = [v7 classicInvertColors];

      if ((v6 == 0) != v8)
      {
        v9 = +[AXSettings sharedInstance];
        uint64_t v10 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v9 classicInvertColors] ^ 1);
        [v4 setValue:v10 forKeyPath:@"filters.InvertColorsDoubleInvert.enabled"];

        uint64_t v11 = AXLogInvertColors();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          uint64_t v12 = +[AXSettings sharedInstance];
          if ([v12 classicInvertColors]) {
            CFStringRef v13 = @"Unapplied: %@";
          }
          else {
            CFStringRef v13 = @"Applied: %@";
          }
          uint64_t v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v4);
          *(_DWORD *)buf = 138412290;
          long long v16 = v14;
          _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
        }
      }
    }
  }
}

+ (void)toggleDarkModeWindowsInvert
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v2 = +[UIWindow allWindowsIncludingInternalWindows:1 onlyVisibleWindows:0];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_207BC;
  v10[3] = &unk_44C40;
  v10[4] = &v11;
  [v2 enumerateObjectsUsingBlock:v10];

  if (*((unsigned char *)v12 + 24))
  {
    id v3 = AXLogInvertColors();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      int v6 = _AXSInvertColorsEnabled();
      id v7 = +[NSBundle mainBundle];
      id v8 = [v7 bundleIdentifier];
      int IsSystemWideDarkModeEnabled = AXInvertColorsIsSystemWideDarkModeEnabled();
      *(_DWORD *)buf = 67109634;
      int v16 = v6;
      __int16 v17 = 2112;
      id v18 = v8;
      __int16 v19 = 1024;
      int v20 = IsSystemWideDarkModeEnabled;
      _os_log_debug_impl(&dword_0, v3, OS_LOG_TYPE_DEBUG, "Notify windows of style change: %d, by %@, dark mode: %d\n\n", buf, 0x18u);
    }
    id v4 = +[UIScreen mainScreen];
    id v5 = [v4 safeValueForKey:@"_notifyTraitsChangedAndPropagate"];
  }
  _Block_object_dispose(&v11, 8);
}

+ (BOOL)toggleDarkModeWindowInvert:(id)a3
{
  id v3 = a3;
  int v4 = _AXSInvertColorsEnabledGlobalCached();
  if (v4)
  {
    if ([v3 _accessibilityInvertColorsIsDarkWindow]) {
      id v5 = [v3 _accessibilityInvertColorsSupportsDarkWindowInvert];
    }
    else {
      id v5 = 0;
    }
    id v7 = [v3 layer];
    id v8 = v7;
    id v9 = v5;
  }
  else
  {
    int v6 = [v3 layer];
    +[AXInvertColorsAppHelper unapplyInvertFilterToLayer:v6];

    id v7 = [v3 layer];
    id v8 = v7;
    id v9 = 0;
  }
  +[AXInvertColorsAppHelper toggleDarkModeWindowInvertFilterToLayer:v8 enabled:v9];

  return v4 == 0;
}

+ (void)toggleFirstLayerWindowsInvert
{
  if ((AXProcessIsSpringBoard() & 1) == 0 && (AXProcessIsSpotlight() & 1) == 0)
  {
    id v2 = +[UIWindow allWindowsIncludingInternalWindows:1 onlyVisibleWindows:1];
    [v2 enumerateObjectsUsingBlock:&stru_44C80];
  }
}

+ (void)toggleFirstLayerWindowInvert:(id)a3
{
  id v3 = a3;
  if ((_AXSInvertColorsEnabledGlobalCached() || !_AXSInvertColorsEnabled())
    && (!_AXSInvertColorsEnabledGlobalCached() || _AXSInvertColorsEnabled())
    || _AXSClassicInvertColorsEnabled()
    || ([v3 _accessibilityInvertColorsIsDarkWindow] & 1) != 0)
  {
    int v4 = [v3 layer];
    +[AXInvertColorsAppHelper unapplyInvertFilterToLayer:v4];

    [v3 setAccessibilityInvertColorsIsolatedTree:0];
    id v5 = AXLogInvertColors();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_22020((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  else
  {
    uint64_t v12 = [v3 layer];
    +[AXInvertColorsAppHelper applyInvertFilterToLayer:v12];

    [v3 setAccessibilityInvertColorsIsolatedTree:1];
    id v5 = AXLogInvertColors();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_2208C((uint64_t)v3, v5, v13, v14, v15, v16, v17, v18);
    }
  }
}

- (BOOL)_shouldInstallCategories
{
  return 1;
}

- (void)_installUIKitCategories
{
  id v2 = AXLogInvertColorsLoadBundles();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = +[NSBundle mainBundle];
    int v4 = [v3 bundleIdentifier];
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Installing UIKit categories in %@", (uint8_t *)&v5, 0xCu);
  }
  [(id)AXSafeClassFromString() initializeOverridesImmediately];
}

- (void)_installSpringBoardCategories
{
  id v2 = AXLogInvertColorsLoadBundles();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = +[NSBundle mainBundle];
    int v4 = [v3 bundleIdentifier];
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Installing SpringBoard categories in %@", (uint8_t *)&v5, 0xCu);
  }
  [(id)AXSafeClassFromString() initializeOverridesImmediately];
}

- (void)_installWebKitCategories
{
  id v2 = AXLogInvertColorsLoadBundles();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = +[NSBundle mainBundle];
    int v4 = [v3 bundleIdentifier];
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Installing WebKit categories in %@", (uint8_t *)&v5, 0xCu);
  }
  [(id)AXSafeClassFromString() initializeOverridesImmediately];
}

- (void)_installCategories
{
  id v3 = AXLogInvertColorsLoadBundles();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = +[NSBundle mainBundle];
    int v5 = [v4 bundleIdentifier];
    *(_DWORD *)buf = 138412290;
    int v20 = v5;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Installing categories in %@", buf, 0xCu);
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [(AXInvertColorsManager *)self _invertColorHelperClasses];
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (unint64_t i = 0; i != v8; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v12 = AXLogInvertColors();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          int v20 = v11;
          _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "Class: %@", buf, 0xCu);
        }

        [v11 initializeOverrides];
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  uint64_t v13 = +[AXBinaryMonitor sharedInstance];
  [v13 evaluateExistingBinaries];

  AXPerformBlockOnMainThreadAfterDelay();
}

@end
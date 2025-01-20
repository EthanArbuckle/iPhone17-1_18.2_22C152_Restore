@interface AXInvertColorsAppHelper
+ (BOOL)hasInvertFilter:(id)a3;
+ (BOOL)initializedOverrides;
+ (id)_accessibilityUpdateInvertColorsFilters:(id)a3 traverseAncestors:(BOOL)a4 updateType:(int64_t)a5;
+ (id)backgroundView:(id)a3;
+ (id)bundleName;
+ (id)insertBackgroundView:(id)a3 alpha:(double)a4;
+ (id)insertBackgroundView:(id)a3 color:(id)a4;
+ (id)invertImage:(id)a3;
+ (int64_t)helperType;
+ (int64_t)loadPriority;
+ (void)_initializeOverrides;
+ (void)_removeInvertFilter:(id)a3;
+ (void)applyInvertFilterToLayer:(id)a3;
+ (void)initializeOverrides;
+ (void)moveInvertFilterToFront:(id)a3;
+ (void)performValidations:(id)a3;
+ (void)removeBackgroundView:(id)a3;
+ (void)setInitializedOverrides:(BOOL)a3;
+ (void)toggleDarkModeWindowInvertFilterToLayer:(id)a3 enabled:(BOOL)a4;
+ (void)toggleInvertColors:(id)a3;
+ (void)toggleInvertColors:(id)a3 moveFilterToFront:(BOOL)a4;
+ (void)toggleInvertColorsOnLayer:(id)a3 moveFilterToFront:(BOOL)a4;
+ (void)toggleInvertColorsOnView:(id)a3;
+ (void)unapplyInvertFilterToLayer:(id)a3;
@end

@implementation AXInvertColorsAppHelper

+ (BOOL)initializedOverrides
{
  v2 = (void *)qword_83618;
  v3 = NSStringFromClass((Class)a1);
  v4 = [v2 objectForKeyedSubscript:v3];
  unsigned __int8 v5 = [v4 BOOLValue];

  return v5;
}

+ (void)setInitializedOverrides:(BOOL)a3
{
  BOOL v3 = a3;
  if (qword_83620 != -1) {
    dispatch_once(&qword_83620, &stru_44568);
  }
  id v7 = +[NSNumber numberWithBool:v3];
  unsigned __int8 v5 = (void *)qword_83618;
  v6 = NSStringFromClass((Class)a1);
  [v5 setObject:v7 forKeyedSubscript:v6];
}

+ (void)performValidations:(id)a3
{
}

+ (id)insertBackgroundView:(id)a3 color:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5
    && !+[AXInvertColorsManager objectIsOnCarScreen:v5])
  {
    id v7 = [v5 viewWithTag:123456789];
    if (!v7)
    {
      id v8 = objc_alloc((Class)UIView);
      v9 = [v5 window];
      [v9 bounds];
      id v7 = objc_msgSend(v8, "initWithFrame:");

      [v7 setTag:123456789];
      [v7 setBackgroundColor:v6];
      [v7 setUserInteractionEnabled:0];
      [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v7 setAccessibilityIgnoresInvertColors:1];
      [v5 insertSubview:v7 atIndex:0];
      v23 = [v7 leadingAnchor];
      v22 = [v5 leadingAnchor];
      v21 = [v23 constraintEqualToAnchor:v22];
      v24[0] = v21;
      v20 = [v7 trailingAnchor];
      v19 = [v5 trailingAnchor];
      v18 = [v20 constraintEqualToAnchor:v19];
      v24[1] = v18;
      v10 = [v7 topAnchor];
      v11 = [v5 topAnchor];
      v12 = [v10 constraintEqualToAnchor:v11];
      v24[2] = v12;
      v13 = [v7 bottomAnchor];
      v14 = [v5 bottomAnchor];
      v15 = [v13 constraintEqualToAnchor:v14];
      v24[3] = v15;
      v16 = +[NSArray arrayWithObjects:v24 count:4];
      +[NSLayoutConstraint activateConstraints:v16];
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)backgroundView:(id)a3
{
  return [a3 viewWithTag:123456789];
}

+ (id)insertBackgroundView:(id)a3 alpha:(double)a4
{
  id v6 = a3;
  id v7 = +[UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:a4];
  id v8 = [a1 insertBackgroundView:v6 color:v7];

  return v8;
}

+ (void)removeBackgroundView:(id)a3
{
  id v3 = [a3 viewWithTag:123456789];
  [v3 removeFromSuperview];
}

+ (id)_accessibilityUpdateInvertColorsFilters:(id)a3 traverseAncestors:(BOOL)a4 updateType:(int64_t)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  BOOL IsInvertColorsEnabled = UIAccessibilityIsInvertColorsEnabled();
  if (a5 == 1 && !IsInvertColorsEnabled)
  {
    id v10 = 0;
    goto LABEL_21;
  }
  id v11 = v8;
  if (v11 && !a5)
  {
    while (1)
    {
      v12 = [v11 filters];
      id v13 = [v12 indexOfObjectPassingTest:&stru_445A8];
      BOOL v14 = !v12 || v13 == (id)0x7FFFFFFFFFFFFFFFLL;
      int v15 = !v14 || !v6;
      if (v15 == 1) {
        break;
      }
      uint64_t v16 = [v11 superlayer];

      id v11 = (id)v16;
      if (!v16) {
        goto LABEL_14;
      }
    }

    goto LABEL_18;
  }
LABEL_14:
  if (!a5)
  {
LABEL_18:
    [a1 unapplyInvertFilterToLayer:v11];
    goto LABEL_19;
  }
  if (a5 < 1)
  {
LABEL_19:
    id v10 = 0;
    goto LABEL_20;
  }
  [a1 applyInvertFilterToLayer:v11];
  id v10 = v11;
LABEL_20:

LABEL_21:

  return v10;
}

+ (void)toggleDarkModeWindowInvertFilterToLayer:(id)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  BOOL v6 = [v9 filters];
  id v7 = [v6 mutableCopy];

  if (v4)
  {
    if ((objc_msgSend(v7, "ax_containsObjectUsingBlock:", &stru_445E8) & 1) == 0)
    {
      if (!v7)
      {
        id v7 = +[NSMutableArray array];
      }
      id v8 = +[CAFilter filterWithType:kCAFilterColorInvert];
      [v8 setName:@"InvertColorsDarkModeWindowFilter"];
      [v8 setAccessibility:1];
      [v7 addObject:v8];
      [v9 setValue:v7 forKey:@"filters"];
      [a1 unapplyInvertFilterToLayer:v9];
    }
  }
  else
  {
    objc_msgSend(v7, "ax_removeObjectsFromArrayUsingBlock:", &stru_44608);
    [v9 setValue:v7 forKey:@"filters"];
  }
}

+ (void)unapplyInvertFilterToLayer:(id)a3
{
  id v8 = a3;
  id v3 = [v8 filters];
  BOOL v4 = v3;
  if (v3)
  {
    id v5 = [v3 indexOfObjectPassingTest:&stru_445A8];
    if (v5 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v6 = v5;
      id v7 = [v4 mutableCopy];
      [v7 removeObjectAtIndex:v6];
      [v8 setValue:v7 forKey:@"filters"];
    }
  }
}

+ (id)invertImage:(id)a3
{
  id v3 = a3;
  [v3 size];
  double v5 = v4;
  [v3 size];
  double v7 = v6;
  if (fabs(v5) < 0.001 || fabs(v6) < 0.001 || v5 <= 0.0 || v6 <= 0.0)
  {
    id v15 = v3;
  }
  else
  {
    [v3 scale];
    CGFloat v9 = v8;
    v18.width = v5;
    v18.height = v7;
    UIGraphicsBeginImageContextWithOptions(v18, 0, v9);
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSetBlendMode(CurrentContext, kCGBlendModeCopy);
    objc_msgSend(v3, "drawInRect:", 0.0, 0.0, v5, v7);
    id v11 = UIGraphicsGetCurrentContext();
    CGContextSetBlendMode(v11, kCGBlendModeDifference);
    v12 = UIGraphicsGetCurrentContext();
    id v13 = +[UIColor clearColor];
    CGContextSetFillColorWithColor(v12, (CGColorRef)[v13 CGColor]);

    BOOL v14 = UIGraphicsGetCurrentContext();
    v19.origin.x = 0.0;
    v19.origin.y = 0.0;
    v19.size.width = v5;
    v19.size.height = v7;
    CGContextFillRect(v14, v19);
    UIGraphicsGetImageFromCurrentImageContext();
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
  }

  return v15;
}

+ (void)applyInvertFilterToLayer:(id)a3
{
  id v7 = a3;
  id v3 = [v7 valueForKeyPath:@"filters.InvertColorsDoubleInvert"];
  if (v3)
  {
LABEL_2:

    goto LABEL_4;
  }
  double v4 = [v7 valueForKeyPath:@"filters.InvertColorsDarkModeWindowFilter"];

  if (!v4)
  {
    double v5 = [v7 filters];
    id v3 = [v5 mutableCopy];

    if (!v3)
    {
      id v3 = +[NSMutableArray array];
    }
    double v6 = +[CAFilter filterWithType:kCAFilterColorInvert];
    [v6 setName:@"InvertColorsDoubleInvert"];
    [v6 setAccessibility:1];
    [v3 addObject:v6];
    [v7 setValue:v3 forKey:@"filters"];

    goto LABEL_2;
  }
LABEL_4:
}

+ (void)moveInvertFilterToFront:(id)a3
{
  id v8 = a3;
  id v3 = [v8 filters];
  double v4 = (char *)[v3 indexOfObjectPassingTest:&stru_445A8];

  if ((unint64_t)(v4 - 1) <= 0x7FFFFFFFFFFFFFFDLL)
  {
    double v5 = [v8 filters];
    id v6 = [v5 mutableCopy];

    id v7 = [v6 objectAtIndex:v4];
    [v6 removeObjectAtIndex:v4];
    [v6 insertObject:v7 atIndex:0];
    [v8 setValue:v6 forKey:@"filters"];
  }
}

+ (void)_removeInvertFilter:(id)a3
{
  id v9 = a3;
  id v3 = [v9 layer];
  double v4 = [v3 filters];

  if (v4)
  {
    id v5 = [v4 indexOfObjectPassingTest:&stru_445A8];
    if ((unint64_t)v5 <= 0x7FFFFFFFFFFFFFFELL)
    {
      id v6 = v5;
      id v7 = [v4 mutableCopy];
      [v7 removeObjectAtIndex:v6];
      id v8 = [v9 layer];
      [v8 setValue:v7 forKey:@"filters"];
    }
  }
}

+ (BOOL)hasInvertFilter:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 layer];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_8:
      char v7 = 0;
      goto LABEL_11;
    }
    id v4 = v3;
  }
  id v5 = v4;
  if (!v4) {
    goto LABEL_8;
  }
  id v6 = [v4 valueForKeyPath:@"filters.InvertColorsDoubleInvert"];
  if (v6)
  {
    char v7 = 1;
  }
  else
  {
    id v8 = [v5 valueForKeyPath:@"filters.InvertColorsDarkModeWindowFilter"];
    char v7 = v8 != 0;
  }
LABEL_11:

  return v7;
}

+ (int64_t)loadPriority
{
  return [a1 helperType] == (char *)&dword_0 + 1;
}

+ (int64_t)helperType
{
  return 2;
}

+ (id)bundleName
{
  v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  id v4 = (char *)[v3 rangeOfString:@"_"];
  if (v4 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    objc_opt_class();
    _AXAssert();
    id v5 = 0;
  }
  else
  {
    id v5 = [v3 substringFromIndex:v4 + 1];
  }

  return v5;
}

+ (void)_initializeOverrides
{
  if (([a1 initializedOverrides] & 1) == 0)
  {
    id v3 = +[AXValidationManager sharedInstance];
    v13[4] = a1;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_65A8;
    v14[3] = &unk_44628;
    v14[4] = a1;
    v12[4] = a1;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_65CC;
    v13[3] = &unk_44628;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_666C;
    v12[3] = &unk_44688;
    [v3 performValidations:v14 withPreValidationHandler:v13 postValidationHandler:&stru_44668 safeCategoryInstallationHandler:v12];

    [a1 setInitializedOverrides:1];
    id v4 = +[AXSubsystemInvertColors sharedInstance];
    unsigned __int8 v5 = [v4 ignoreLogging];

    if ((v5 & 1) == 0)
    {
      id v6 = +[AXSubsystemInvertColors identifier];
      char v7 = AXLoggerForFacility();

      os_log_type_t v8 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v7, v8))
      {
        id v9 = AXColorizeFormatLog();
        id v11 = [a1 bundleName];
        id v10 = _AXStringForArgs();

        if (os_log_type_enabled(v7, v8))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v16 = v10;
          _os_log_impl(&dword_0, v7, v8, "%{public}@", buf, 0xCu);
        }
      }
    }
  }
}

+ (void)initializeOverrides
{
  id v3 = +[AXSubsystemInvertColors sharedInstance];
  unsigned __int8 v4 = [v3 ignoreLogging];

  if ((v4 & 1) == 0)
  {
    unsigned __int8 v5 = +[AXSubsystemInvertColors identifier];
    id v6 = AXLoggerForFacility();

    os_log_type_t v7 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v6, v7))
    {
      os_log_type_t v8 = AXColorizeFormatLog();
      id v13 = [a1 bundleName];
      id v9 = _AXStringForArgs();

      if (os_log_type_enabled(v6, v7))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v16 = v9;
        _os_log_impl(&dword_0, v6, v7, "%{public}@", buf, 0xCu);
      }
    }
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_693C;
  v14[3] = &unk_446A8;
  v14[4] = a1;
  id v10 = objc_retainBlock(v14);
  switch((unint64_t)[a1 helperType])
  {
    case 1uLL:
      id v11 = [sub_6A84() sharedInstance];
      v12 = [a1 bundleName];
      [v11 addHandler:v10 forFramework:v12];
      goto LABEL_12;
    case 2uLL:
      id v11 = [sub_6A84() sharedInstance];
      v12 = [a1 bundleName];
      [v11 addHandler:v10 forApp:v12];
      goto LABEL_12;
    case 3uLL:
      id v11 = [sub_6A84() sharedInstance];
      v12 = [a1 bundleName];
      [v11 addHandler:v10 forAppExtension:v12];
      goto LABEL_12;
    case 4uLL:
      id v11 = [sub_6A84() sharedInstance];
      v12 = [a1 bundleName];
      [v11 addHandler:v10 forBundleName:v12];
LABEL_12:

      break;
    default:
      break;
  }
}

+ (void)toggleInvertColors:(id)a3
{
}

+ (void)toggleInvertColors:(id)a3 moveFilterToFront:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    +[AXInvertColorsAppHelper toggleInvertColorsOnView:v5];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      +[AXInvertColorsAppHelper toggleInvertColorsOnLayer:v5 moveFilterToFront:v4];
    }
    else
    {
      id v6 = AXLogInvertColorsTraversal();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        sub_218BC((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  +[AXInvertColorsManager updateClassicInvertColors:v5];
}

+ (void)toggleInvertColorsOnLayer:(id)a3 moveFilterToFront:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = a3;
  id v5 = [v10 delegate];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v10 delegate];
  }
  else
  {
    id v6 = 0;
  }

  uint64_t v7 = [v6 window];
  uint64_t v8 = [v7 traitCollection];
  uint64_t v9 = (char *)[v8 userInterfaceStyle];

  if (!_AXSInvertColorsEnabled() || v9 == (unsigned char *)&dword_0 + 2)
  {
    +[AXInvertColorsAppHelper unapplyInvertFilterToLayer:v10];
  }
  else
  {
    +[AXInvertColorsAppHelper applyInvertFilterToLayer:v10];
    if (v4) {
      +[AXInvertColorsAppHelper moveInvertFilterToFront:v10];
    }
  }
}

+ (void)toggleInvertColorsOnView:(id)a3
{
  id v7 = a3;
  if (([v7 accessibilityInvertColorsIsolatedTree] & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v3 = v7;
    }
    else
    {
      id v3 = [v7 window];
    }
    BOOL v4 = v3;
    id v5 = [v3 traitCollection];
    id v6 = (char *)[v5 userInterfaceStyle];

    if ([v7 _accessibilityAppliesInvertColors] && v6 != (unsigned char *)&dword_0 + 2
      || [v7 _accessibilityAppliesInvertColorsInDarkUI] && v6 == (unsigned char *)&dword_0 + 2)
    {
      [v7 _accessibilityApplyInvertFilter];
    }
    else
    {
      +[AXInvertColorsAppHelper _removeInvertFilter:v7];
    }
  }
}

@end
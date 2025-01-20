@interface BuddyAccessibilityUtilities
+ (id)accessibilityViewController;
+ (id)navigationBarButton;
+ (id)navigationBarButtonItemWithButton:(id)a3;
@end

@implementation BuddyAccessibilityUtilities

+ (id)accessibilityViewController
{
  v20[2] = a1;
  v20[1] = (id)a2;
  v20[0] = +[NSBundle bundleWithPath:@"/System/Library/AccessibilityBundles/AXBuddyBundle.bundle"];
  id location = 0;
  id obj = 0;
  unsigned __int8 v2 = [v20[0] loadAndReturnError:&obj];
  objc_storeStrong(&location, obj);
  if ((v2 & 1) == 0)
  {
    os_log_t v9 = (os_log_t)(id)_BYLoggingFacility();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      sub_10004B238((uint64_t)v22, (uint64_t)location);
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to load accessibility bundle: %@", v22, 0xCu);
    }
    objc_storeStrong((id *)&v9, 0);
    goto LABEL_12;
  }
  Class aClass = (Class)[v20[0] principalClass];
  if (([(objc_class *)aClass isSubclassOfClass:objc_opt_class()] & 1) == 0)
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      id v10 = NSStringFromClass(aClass);
      sub_10004B238((uint64_t)buf, (uint64_t)v10);
      _os_log_error_impl((void *)&_mh_execute_header, oslog, v11, "Accessibility bundle is not subclass of UIViewController (is %@)", buf, 0xCu);

      objc_storeStrong(&v10, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
LABEL_12:
    id v21 = 0;
    int v13 = 1;
    goto LABEL_13;
  }
  id v16 = objc_alloc_init(aClass);
  id v3 = +[BYDevice currentDevice];
  id v4 = [v3 type];

  if (v4 == (id)1)
  {
    [v16 setModalPresentationStyle:2];
    +[OBBaseWelcomeController preferredContentSize];
    *(double *)&long long v15 = v5;
    *((double *)&v15 + 1) = v6;
    long long v14 = v15;
    [v16 setPreferredContentSize:v5, v6];
  }
  id v21 = v16;
  int v13 = 1;
  objc_storeStrong(&v16, 0);
LABEL_13:
  objc_storeStrong(&location, 0);
  objc_storeStrong(v20, 0);
  v7 = v21;

  return v7;
}

+ (id)navigationBarButton
{
  v14[2] = a1;
  v14[1] = (id)a2;
  unsigned __int8 v2 = +[UIImage imageNamed:@"AccessibilityButtonItem"];
  v14[0] = [(UIImage *)v2 _imageThatSuppressesAccessibilityHairlineThickening];

  id location = +[UIButton buttonWithType:0];
  [location setBackgroundImage:v14[0] forState:0];
  id v3 = +[UIColor systemWhiteColor];
  id v4 = [v3 CGColor];
  id v5 = [location layer];
  [v5 setBackgroundColor:v4];

  [v14[0] size];
  double v7 = v6 / 2.0;
  id v9 = [location layer:v6];
  [v9 setCornerRadius:v7];

  id v10 = +[UIColor systemBlueColor];
  [location setTintColor:v10];

  id v11 = location;
  objc_storeStrong(&location, 0);
  objc_storeStrong(v14, 0);
  return v11;
}

+ (id)navigationBarButtonItemWithButton:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = objc_alloc((Class)UIBarButtonItem);
  id v6 = [v3 initWithCustomView:location[0]];
  [v6 setStyle:0];
  id v4 = v6;
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return v4;
}

@end
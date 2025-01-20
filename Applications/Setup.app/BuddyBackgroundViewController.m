@interface BuddyBackgroundViewController
- (BOOL)prefersStatusBarHidden;
- (double)alphaForBuddyBackgroundStyle:(unint64_t)a3;
- (int64_t)preferredStatusBarStyle;
- (void)dismissModalViewControllerWithTransition:(int)a3;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)dismissViewControllerWithTransition:(int)a3 completion:(id)a4;
- (void)setBuddyBackgroundFilterStyle:(unint64_t)a3;
- (void)viewDidLoad;
@end

@implementation BuddyBackgroundViewController

- (void)viewDidLoad
{
  v7 = self;
  SEL v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)BuddyBackgroundViewController;
  [(BuddyBackgroundViewController *)&v5 viewDidLoad];
  id v2 = objc_alloc((Class)UIVisualEffectView);
  v3 = +[UIBlurEffect effectWithStyle:19];
  id v4 = [v2 initWithEffect:v3];
  [(BuddyBackgroundViewController *)v7 setView:v4];

  [(BuddyBackgroundViewController *)v7 setBuddyBackgroundFilterStyle:0];
}

- (void)dismissViewControllerWithTransition:(int)a3 completion:(id)a4
{
  v9 = self;
  SEL v8 = a2;
  int v7 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(BuddyBackgroundViewController *)v9 presentedViewController];
    sub_10004B238((uint64_t)buf, (uint64_t)v4);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Preventing dismissal of %@...", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  if (location) {
    (*((void (**)(void))location + 2))();
  }
  objc_storeStrong(&location, 0);
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  v9 = self;
  SEL v8 = a2;
  BOOL v7 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(BuddyBackgroundViewController *)v9 presentedViewController];
    sub_10004B238((uint64_t)buf, (uint64_t)v4);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Preventing dismissal of %@...", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  if (location) {
    (*((void (**)(void))location + 2))();
  }
  objc_storeStrong(&location, 0);
}

- (void)dismissModalViewControllerWithTransition:(int)a3
{
  BOOL v7 = self;
  SEL v6 = a2;
  int v5 = a3;
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [(BuddyBackgroundViewController *)v7 presentedViewController];
    sub_10004B238((uint64_t)buf, (uint64_t)v3);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Preventing dismissal of %@...", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (BOOL)prefersStatusBarHidden
{
  id v2 = [(BuddyBackgroundViewController *)self presentedViewController];
  unsigned __int8 v3 = [v2 prefersStatusBarHidden];

  return v3 & 1;
}

- (void)setBuddyBackgroundFilterStyle:(unint64_t)a3
{
  v13 = self;
  SEL v12 = a2;
  v11 = (void *)a3;
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100046588((uint64_t)buf, (uint64_t)v11);
    _os_log_impl((void *)&_mh_execute_header, oslog, v9, "Setting background style: %lu", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  unsigned __int8 v3 = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  SEL v6 = sub_1001BA330;
  BOOL v7 = &unk_1002B1198;
  v8[0] = v13;
  v8[1] = v11;
  +[UIView animateWithDuration:&v3 animations:0.5];
  objc_storeStrong(v8, 0);
}

- (double)alphaForBuddyBackgroundStyle:(unint64_t)a3
{
  if (!a3) {
    return 0.0;
  }
  if (a3 == 1) {
    return 0.7;
  }
  return v4;
}

@end
@interface BuddyNavigationBarUpdater
- (UINavigationController)currentNavigationController;
- (UIViewController)currentViewController;
- (UIViewController)previousViewController;
- (UIViewControllerTransitionCoordinator)transitionCoordinator;
- (void)_updateNavigationBarBackButtonIfNeeded:(id)a3 forViewController:(id)a4;
- (void)_updateNavigationBarBackgroundIfNeeded:(id)a3 forViewController:(id)a4;
- (void)handleSwipeBackGesture:(id)a3;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 operation:(int64_t)a5 animated:(BOOL)a6;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 operation:(int64_t)a5 animated:(BOOL)a6;
- (void)setCurrentNavigationController:(id)a3;
- (void)setCurrentViewController:(id)a3;
- (void)setNavigationControllerIfNeeded:(id)a3;
- (void)setPreviousViewController:(id)a3;
- (void)setTransitionCoordinator:(id)a3;
- (void)updateViewControllers;
@end

@implementation BuddyNavigationBarUpdater

- (void)_updateNavigationBarBackgroundIfNeeded:(id)a3 forViewController:(id)a4
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v18 = 0;
  objc_storeStrong(&v18, a4);
  id v5 = [location[0] traitCollection];
  id v6 = [v5 userInterfaceStyle];

  id v17 = v6;
  id v7 = [v18 traitCollection];
  id v8 = [v7 userInterfaceStyle];

  id v16 = v8;
  char v15 = 0;
  id v9 = [v18 traitCollection];
  unsigned __int8 v10 = 0;
  if ([v9 userInterfaceStyle] == (id)1) {
    unsigned __int8 v10 = [v18 conformsToProtocol:&OBJC_PROTOCOL___BFFViewControllerAppearanceConfigurationDelegate];
  }

  char v15 = v10 & 1;
  if (v10)
  {
    id v11 = v18;
    if (objc_msgSend(v11, "hasBlackBackground", v11)) {
      [location[0] setOverrideUserInterfaceStyle:2];
    }
    objc_storeStrong(&v14, 0);
  }
  else if (v17 != v16)
  {
    id v12 = location[0];
    id v13 = [v18 traitCollection];
    [v12 setOverrideUserInterfaceStyle:[v13 userInterfaceStyle]];
  }
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
}

- (void)_updateNavigationBarBackButtonIfNeeded:(id)a3 forViewController:(id)a4
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v21 = 0;
  objc_storeStrong(&v21, a4);
  id v5 = +[BYPreferencesController buddyPreferencesInternal];
  unsigned __int8 v6 = [v5 BOOLForKey:@"ignoreBackButtonHandling"];

  if (v6)
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = oslog;
      os_log_type_t v8 = v19;
      sub_10004B24C(buf);
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Found: Ignore back button handling key. Ignore back button handling.", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    int v17 = 1;
  }
  else
  {
    id v16 = 0;
    if ([v21 conformsToProtocol:&OBJC_PROTOCOL___BFFViewControllerAppearanceConfigurationDelegate])
    {
      id v15 = v21;
      if ([v15 usesWhiteBackButton])
      {
        id v9 = +[UIColor whiteColor];
        id v10 = v16;
        id v16 = v9;
      }
      objc_storeStrong(&v15, 0);
    }
    if (!v16)
    {
      id v11 = +[UIColor systemBlueColor];
      id v12 = v16;
      id v16 = v11;
    }
    id v13 = v16;
    id v14 = [location[0] tintColor];

    if (v13 != v14) {
      [location[0] setTintColor:v16];
    }
    objc_storeStrong(&v16, 0);
    int v17 = 0;
  }
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 operation:(int64_t)a5 animated:(BOOL)a6
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  [(BuddyNavigationBarUpdater *)v15 setNavigationControllerIfNeeded:location[0]];
  if (a5 == 2)
  {
    os_log_type_t v8 = v15;
    id v9 = [location[0] navigationBar];
    [(BuddyNavigationBarUpdater *)v8 _updateNavigationBarBackgroundIfNeeded:v9 forViewController:v13];

    id v10 = [(BuddyNavigationBarUpdater *)v15 transitionCoordinator];
    LOBYTE(v8) = v10 == 0;

    if (v8)
    {
      id v11 = v15;
      id v12 = [location[0] navigationBar];
      [(BuddyNavigationBarUpdater *)v11 _updateNavigationBarBackButtonIfNeeded:v12 forViewController:v13];
    }
  }
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 operation:(int64_t)a5 animated:(BOOL)a6
{
  id v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  [(BuddyNavigationBarUpdater *)v16 updateViewControllers];
  if (a5 == 1)
  {
    os_log_type_t v8 = v16;
    id v9 = [location[0] navigationBar];
    [(BuddyNavigationBarUpdater *)v8 _updateNavigationBarBackgroundIfNeeded:v9 forViewController:v14];
  }
  id v10 = [(BuddyNavigationBarUpdater *)v16 transitionCoordinator];
  BOOL v11 = v10 == 0;

  if (v11)
  {
    id v12 = v16;
    id v13 = [location[0] navigationBar];
    [(BuddyNavigationBarUpdater *)v12 _updateNavigationBarBackButtonIfNeeded:v13 forViewController:v14];
  }
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

- (void)updateViewControllers
{
  v2 = [(BuddyNavigationBarUpdater *)self currentNavigationController];
  id v3 = [(UINavigationController *)v2 childViewControllers];
  v4 = (char *)[v3 count];

  if ((unint64_t)v4 >= 2)
  {
    id v5 = [(BuddyNavigationBarUpdater *)self currentNavigationController];
    id v6 = [(UINavigationController *)v5 childViewControllers];
    id v7 = [v6 objectAtIndexedSubscript:v4 - 2];
    [(BuddyNavigationBarUpdater *)self setPreviousViewController:v7];
  }
  else
  {
    [(BuddyNavigationBarUpdater *)self setPreviousViewController:0];
  }
  os_log_type_t v8 = [(BuddyNavigationBarUpdater *)self currentNavigationController];
  id v9 = [(UINavigationController *)v8 childViewControllers];
  id v10 = [v9 lastObject];
  [(BuddyNavigationBarUpdater *)self setCurrentViewController:v10];
}

- (void)setNavigationControllerIfNeeded:(id)a3
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = (UINavigationController *)location[0];
  v4 = [(BuddyNavigationBarUpdater *)v10 currentNavigationController];

  if (v3 != v4)
  {
    id v5 = [(BuddyNavigationBarUpdater *)v10 currentNavigationController];
    id v6 = [(UINavigationController *)v5 interactivePopGestureRecognizer];
    [(UIGestureRecognizer *)v6 removeTarget:v10 action:"handleSwipeBackGesture:"];

    [(BuddyNavigationBarUpdater *)v10 setCurrentNavigationController:location[0]];
    id v7 = [(BuddyNavigationBarUpdater *)v10 currentNavigationController];
    os_log_type_t v8 = [(UINavigationController *)v7 interactivePopGestureRecognizer];
    [(UIGestureRecognizer *)v8 addTarget:v10 action:"handleSwipeBackGesture:"];
  }
  objc_storeStrong(location, 0);
}

- (void)handleSwipeBackGesture:(id)a3
{
  v30 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  switch((unint64_t)[location[0] state])
  {
    case 1uLL:
      id v3 = [(BuddyNavigationBarUpdater *)v30 currentNavigationController];
      id v4 = [(UINavigationController *)v3 transitionCoordinator];
      [(BuddyNavigationBarUpdater *)v30 setTransitionCoordinator:v4];

      id v5 = v30;
      id v6 = [(BuddyNavigationBarUpdater *)v30 currentNavigationController];
      id v7 = [(UINavigationController *)v6 navigationBar];
      os_log_type_t v8 = [(BuddyNavigationBarUpdater *)v30 currentViewController];
      [(BuddyNavigationBarUpdater *)v5 _updateNavigationBarBackButtonIfNeeded:v7 forViewController:v8];

      break;
    case 2uLL:
      id v9 = [(BuddyNavigationBarUpdater *)v30 transitionCoordinator];

      if (v9)
      {
        id v10 = [(BuddyNavigationBarUpdater *)v30 transitionCoordinator];
        [(UIViewControllerTransitionCoordinator *)v10 percentComplete];
        double v12 = v11;

        if (v12 <= 0.25)
        {
          int v17 = v30;
          id v18 = [(BuddyNavigationBarUpdater *)v30 currentNavigationController];
          os_log_type_t v19 = [(UINavigationController *)v18 navigationBar];
          v20 = [(BuddyNavigationBarUpdater *)v30 currentViewController];
          [(BuddyNavigationBarUpdater *)v17 _updateNavigationBarBackButtonIfNeeded:v19 forViewController:v20];
        }
        else
        {
          id v13 = v30;
          id v14 = [(BuddyNavigationBarUpdater *)v30 currentNavigationController];
          id v15 = [(UINavigationController *)v14 navigationBar];
          id v16 = [(BuddyNavigationBarUpdater *)v30 previousViewController];
          [(BuddyNavigationBarUpdater *)v13 _updateNavigationBarBackButtonIfNeeded:v15 forViewController:v16];
        }
      }
      break;
    case 3uLL:
      v25 = v30;
      v26 = [(BuddyNavigationBarUpdater *)v30 currentNavigationController];
      v27 = [(UINavigationController *)v26 navigationBar];
      v28 = [(BuddyNavigationBarUpdater *)v30 previousViewController];
      [(BuddyNavigationBarUpdater *)v25 _updateNavigationBarBackButtonIfNeeded:v27 forViewController:v28];

      [(BuddyNavigationBarUpdater *)v30 setTransitionCoordinator:0];
      break;
    case 4uLL:
      id v21 = v30;
      v22 = [(BuddyNavigationBarUpdater *)v30 currentNavigationController];
      v23 = [(UINavigationController *)v22 navigationBar];
      v24 = [(BuddyNavigationBarUpdater *)v30 currentViewController];
      [(BuddyNavigationBarUpdater *)v21 _updateNavigationBarBackButtonIfNeeded:v23 forViewController:v24];

      break;
    default:
      break;
  }
  objc_storeStrong(location, 0);
}

- (UIViewControllerTransitionCoordinator)transitionCoordinator
{
  return (UIViewControllerTransitionCoordinator *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTransitionCoordinator:(id)a3
{
}

- (UINavigationController)currentNavigationController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentNavigationController);

  return (UINavigationController *)WeakRetained;
}

- (void)setCurrentNavigationController:(id)a3
{
}

- (UIViewController)currentViewController
{
  return self->_currentViewController;
}

- (void)setCurrentViewController:(id)a3
{
}

- (UIViewController)previousViewController
{
  return self->_previousViewController;
}

- (void)setPreviousViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
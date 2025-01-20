@interface BuddyNavigationPit
+ (id)shared;
- (BOOL)controllerNeedsToRunForClass:(Class)a3;
- (BOOL)isFlowItemOnTop:(id)a3;
- (id)popToBuddyControllerWithClass:(Class)a3 animated:(BOOL)a4;
- (id)popToBuddyControllerWithClass:(Class)a3 withOffset:(unint64_t)a4 animated:(BOOL)a5;
- (void)_pitLog:(id)a3 withObject:(id)a4;
- (void)flow:(id)a3 finishedWithLastItem:(id)a4 nextItem:(id)a5;
- (void)flowItemCancelled:(id)a3;
- (void)flowItemDone:(id)a3;
- (void)flowItemDone:(id)a3 nextItem:(id)a4;
- (void)flowItemDone:(id)a3 nextItemClass:(Class)a4;
- (void)markFlowItemDone:(id)a3;
- (void)presentWiFiPaneForFlow:(id)a3;
- (void)pushFlowItem:(id)a3 animated:(BOOL)a4;
- (void)pushFlowItem:(id)a3 inFlow:(id)a4 animated:(BOOL)a5;
- (void)pushFlowItem:(id)a3 inFlow:(id)a4 withExtendedInitialization:(BOOL)a5 animated:(BOOL)a6;
- (void)pushFlowItem:(id)a3 inFlow:(id)a4 withExtendedInitialization:(BOOL)a5 animated:(BOOL)a6 willPushFlowItem:(id)a7;
- (void)removeViewControllersOnNextPush:(id)a3;
@end

@implementation BuddyNavigationPit

+ (id)shared
{
  v5 = (dispatch_once_t *)&unk_100321C50;
  id location = 0;
  objc_storeStrong(&location, &stru_1002B2A10);
  if (*v5 != -1) {
    dispatch_once(v5, location);
  }
  objc_storeStrong(&location, 0);
  v2 = (void *)qword_100321C48;

  return v2;
}

- (BOOL)controllerNeedsToRunForClass:(Class)a3
{
  v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s", "-[BuddyNavigationPit controllerNeedsToRunForClass:]");
  [(BuddyNavigationPit *)self _pitLog:v4 withObject:a3];

  return 0;
}

- (BOOL)isFlowItemOnTop:(id)a3
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v7;
  v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s", "-[BuddyNavigationPit isFlowItemOnTop:]");
  [(BuddyNavigationPit *)v3 _pitLog:v4 withObject:location[0]];

  objc_storeStrong(location, 0);
  return 0;
}

- (void)markFlowItemDone:(id)a3
{
  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v6;
  v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s", "-[BuddyNavigationPit markFlowItemDone:]");
  [(BuddyNavigationPit *)v3 _pitLog:v4 withObject:location[0]];

  objc_storeStrong(location, 0);
}

- (id)popToBuddyControllerWithClass:(Class)a3 animated:(BOOL)a4
{
  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s", "-[BuddyNavigationPit popToBuddyControllerWithClass:animated:]");
  [(BuddyNavigationPit *)self _pitLog:v5 withObject:a3];

  return 0;
}

- (id)popToBuddyControllerWithClass:(Class)a3 withOffset:(unint64_t)a4 animated:(BOOL)a5
{
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s", "-[BuddyNavigationPit popToBuddyControllerWithClass:withOffset:animated:]");
  [(BuddyNavigationPit *)self _pitLog:v6 withObject:a3];

  return 0;
}

- (void)pushFlowItem:(id)a3 animated:(BOOL)a4
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = v7;
  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s", "-[BuddyNavigationPit pushFlowItem:animated:]");
  [(BuddyNavigationPit *)v4 _pitLog:v5 withObject:location[0]];

  objc_storeStrong(location, 0);
}

- (void)pushFlowItem:(id)a3 inFlow:(id)a4 animated:(BOOL)a5
{
  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = 0;
  objc_storeStrong(&v8, a4);
  v6 = v10;
  v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s", "-[BuddyNavigationPit pushFlowItem:inFlow:animated:]");
  [(BuddyNavigationPit *)v6 _pitLog:v7 withObject:location[0]];

  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)pushFlowItem:(id)a3 inFlow:(id)a4 withExtendedInitialization:(BOOL)a5 animated:(BOOL)a6
{
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  v7 = v11;
  id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s", "-[BuddyNavigationPit pushFlowItem:inFlow:withExtendedInitialization:animated:]");
  [(BuddyNavigationPit *)v7 _pitLog:v8 withObject:location[0]];

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)pushFlowItem:(id)a3 inFlow:(id)a4 withExtendedInitialization:(BOOL)a5 animated:(BOOL)a6 willPushFlowItem:(id)a7
{
  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v16 = 0;
  objc_storeStrong(&v16, a4);
  BOOL v15 = a5;
  BOOL v14 = a6;
  id v13 = 0;
  objc_storeStrong(&v13, a7);
  v11 = v18;
  v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s", "-[BuddyNavigationPit pushFlowItem:inFlow:withExtendedInitialization:animated:willPushFlowItem:]");
  [(BuddyNavigationPit *)v11 _pitLog:v12 withObject:location[0]];

  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

- (void)removeViewControllersOnNextPush:(id)a3
{
  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v6;
  v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s", "-[BuddyNavigationPit removeViewControllersOnNextPush:]");
  [(BuddyNavigationPit *)v3 _pitLog:v4 withObject:location[0]];

  objc_storeStrong(location, 0);
}

- (void)flowItemCancelled:(id)a3
{
  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v6;
  v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s", "-[BuddyNavigationPit flowItemCancelled:]");
  [(BuddyNavigationPit *)v3 _pitLog:v4 withObject:location[0]];

  objc_storeStrong(location, 0);
}

- (void)flowItemDone:(id)a3
{
  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v6;
  v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s", "-[BuddyNavigationPit flowItemDone:]");
  [(BuddyNavigationPit *)v3 _pitLog:v4 withObject:location[0]];

  objc_storeStrong(location, 0);
}

- (void)flowItemDone:(id)a3 nextItem:(id)a4
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  v5 = v9;
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s", "-[BuddyNavigationPit flowItemDone:nextItem:]");
  [(BuddyNavigationPit *)v5 _pitLog:v6 withObject:location[0]];

  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)flowItemDone:(id)a3 nextItemClass:(Class)a4
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = v7;
  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s", "-[BuddyNavigationPit flowItemDone:nextItemClass:]");
  [(BuddyNavigationPit *)v4 _pitLog:v5 withObject:location[0]];

  objc_storeStrong(location, 0);
}

- (void)flow:(id)a3 finishedWithLastItem:(id)a4 nextItem:(id)a5
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = 0;
  objc_storeStrong(&v10, a4);
  id v9 = 0;
  objc_storeStrong(&v9, a5);
  id v7 = v12;
  id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s", "-[BuddyNavigationPit flow:finishedWithLastItem:nextItem:]");
  [(BuddyNavigationPit *)v7 _pitLog:v8 withObject:v10];

  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (void)presentWiFiPaneForFlow:(id)a3
{
  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v6;
  v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s", "-[BuddyNavigationPit presentWiFiPaneForFlow:]");
  [(BuddyNavigationPit *)v3 _pitLog:v4 withObject:location[0]];

  objc_storeStrong(location, 0);
}

- (void)_pitLog:(id)a3 withObject:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_FAULT))
  {
    sub_1000DC614((uint64_t)buf, (uint64_t)location[0], (uint64_t)v6);
  }
  objc_storeStrong((id *)&oslog, 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

@end
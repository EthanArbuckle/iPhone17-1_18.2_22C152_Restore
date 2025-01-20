@interface BuddyUpdateFinishedFlow
+ (id)allowedFlowItems;
- (BuddyUpdateFinishedFlow)initWithNavigationController:(id)a3 flowDelegate:(id)a4 flowStarter:(id)a5 dependencyInjector:(id)a6;
- (void)flowItemDone:(id)a3;
- (void)flowItemDone:(id)a3 nextItem:(id)a4;
- (void)flowItemDone:(id)a3 nextItemClass:(Class)a4;
@end

@implementation BuddyUpdateFinishedFlow

- (BuddyUpdateFinishedFlow)initWithNavigationController:(id)a3 flowDelegate:(id)a4 flowStarter:(id)a5 dependencyInjector:(id)a6
{
  id v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v16 = 0;
  objc_storeStrong(&v16, a4);
  id v15 = 0;
  objc_storeStrong(&v15, a5);
  id v14 = 0;
  objc_storeStrong(&v14, a6);
  id v9 = v18;
  id v18 = 0;
  v13.receiver = v9;
  v13.super_class = (Class)BuddyUpdateFinishedFlow;
  id v18 = [(BuddyUpdateFinishedFlow *)&v13 initWithNavigationController:location[0] flowDelegate:v16 flowStarter:v15 dependencyInjector:v14];
  objc_storeStrong(&v18, v18);
  if (v18)
  {
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v10 = +[NSArray arrayWithObjects:v19 count:2];
    [v18 setClassList:v10];
  }
  v11 = (BuddyUpdateFinishedFlow *)v18;
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v18, 0);
  return v11;
}

+ (id)allowedFlowItems
{
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  return +[NSArray arrayWithObjects:v3 count:2];
}

- (void)flowItemDone:(id)a3 nextItem:(id)a4
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  v5.receiver = v8;
  v5.super_class = (Class)BuddyUpdateFinishedFlow;
  [(BuddyUpdateFinishedFlow *)&v5 flowItemDone:location[0] nextItem:0];
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)flowItemDone:(id)a3 nextItemClass:(Class)a4
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[BuddyUpdateFinishedFlow flowItemDone:nextItem:](v6, "flowItemDone:nextItem:", location[0], 0, a4);
  objc_storeStrong(location, 0);
}

- (void)flowItemDone:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(BuddyUpdateFinishedFlow *)v4 flowItemDone:location[0] nextItem:0];
  objc_storeStrong(location, 0);
}

@end
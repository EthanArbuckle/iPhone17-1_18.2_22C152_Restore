@interface BuddyActivationFlow
+ (BOOL)controllerNeedsToRun;
+ (id)allowedFlowItems;
- (ActivationController)activationController;
- (BuddyActivationFlow)initWithNavigationController:(id)a3 flowDelegate:(id)a4 flowStarter:(id)a5 dependencyInjector:(id)a6;
- (BuddyActivationState)activationState;
- (id)_activationController;
- (void)configureFlowItem:(id)a3;
- (void)flowItemDone:(id)a3 nextItem:(id)a4;
- (void)presentWiFiPaneForFlowItem:(id)a3;
- (void)setActivationController:(id)a3;
- (void)setActivationState:(id)a3;
@end

@implementation BuddyActivationFlow

- (BuddyActivationFlow)initWithNavigationController:(id)a3 flowDelegate:(id)a4 flowStarter:(id)a5 dependencyInjector:(id)a6
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
  v13.super_class = (Class)BuddyActivationFlow;
  id v18 = [(BuddyActivationFlow *)&v13 initWithNavigationController:location[0] flowDelegate:v16 flowStarter:v15 dependencyInjector:v14];
  objc_storeStrong(&v18, v18);
  if (v18)
  {
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v19[2] = objc_opt_class();
    v19[3] = objc_opt_class();
    v19[4] = objc_opt_class();
    v19[5] = objc_opt_class();
    v10 = +[NSArray arrayWithObjects:v19 count:6];
    [v18 setClassList:v10];
  }
  v11 = (BuddyActivationFlow *)v18;
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
  v3[2] = objc_opt_class();
  v3[3] = objc_opt_class();
  v3[4] = objc_opt_class();
  v3[5] = objc_opt_class();
  return +[NSArray arrayWithObjects:v3 count:6];
}

- (void)configureFlowItem:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10.receiver = v12;
  v10.super_class = (Class)BuddyActivationFlow;
  [(BuddyActivationFlow *)&v10 configureFlowItem:location[0]];
  if ([location[0] conformsToProtocol:&OBJC_PROTOCOL___BuddyActivationRestarting])
  {
    id v9 = location[0];
    v3 = _NSConcreteStackBlock;
    int v4 = -1073741824;
    int v5 = 0;
    v6 = sub_100077364;
    v7 = &unk_1002B0D20;
    v8 = v12;
    [v9 setRestartActivation:&v3];
    objc_storeStrong((id *)&v8, 0);
    objc_storeStrong(&v9, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)flowItemDone:(id)a3 nextItem:(id)a4
{
  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v17 = 0;
  objc_storeStrong(&v17, a4);
  v21[0] = objc_opt_class();
  v21[1] = objc_opt_class();
  v21[2] = objc_opt_class();
  v21[3] = objc_opt_class();
  id v16 = +[NSArray arrayWithObjects:v21 count:4];
  if (!v17 || ([v16 containsObject:objc_opt_class()] & 1) == 0)
  {
    id v15 = objc_alloc_init((Class)NSMutableArray);
    memset(__b, 0, sizeof(__b));
    id v5 = [(BuddyActivationFlow *)v19 controllers];
    id v6 = [v5 countByEnumeratingWithState:__b objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)__b[2];
      do
      {
        for (unint64_t i = 0; i < (unint64_t)v6; ++i)
        {
          if (*(void *)__b[2] != v7) {
            objc_enumerationMutation(v5);
          }
          id v14 = *(id *)(__b[1] + 8 * i);
          if ([v16 containsObject:objc_opt_class()])
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v15 addObject:v14];
            }
            else if (objc_opt_respondsToSelector())
            {
              id v9 = v15;
              id v10 = [v14 viewController];
              [v9 addObject:v10];
            }
          }
        }
        id v6 = [v5 countByEnumeratingWithState:__b objects:v20 count:16];
      }
      while (v6);
    }

    id v11 = [(BuddyActivationFlow *)v19 navigationFlowDelegate];
    [v11 removeViewControllersOnNextPush:v15];

    objc_storeStrong(&v15, 0);
  }
  v12.receiver = v19;
  v12.super_class = (Class)BuddyActivationFlow;
  [(BuddyActivationFlow *)&v12 flowItemDone:location[0] nextItem:v17];
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

+ (BOOL)controllerNeedsToRun
{
  id v2 = +[BuddyActivationConfiguration currentConfiguration];
  char v3 = [v2 isActivated] ^ 1;

  return v3 & 1;
}

- (void)presentWiFiPaneForFlowItem:(id)a3
{
  uint64_t v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddyActivationFlow *)v7 flowItemDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(BuddyActivationFlow *)v7 flowItemDelegate];
    [v5 presentWiFiPaneForFlowItem:location[0]];
  }
  objc_storeStrong(location, 0);
}

- (id)_activationController
{
  objc_super v12 = self;
  SEL v11 = a2;
  memset(__b, 0, sizeof(__b));
  id v2 = [(BuddyActivationFlow *)v12 controllers];
  id v3 = [v2 countByEnumeratingWithState:__b objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)__b[2];
    do
    {
      for (unint64_t i = 0; i < (unint64_t)v3; ++i)
      {
        if (*(void *)__b[2] != v4) {
          objc_enumerationMutation(v2);
        }
        id v10 = *(id *)(__b[1] + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v13 = v10;
          int v8 = 1;
          goto LABEL_11;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:__b objects:v14 count:16];
    }
    while (v3);
  }
  int v8 = 0;
LABEL_11:

  if (!v8) {
    id v13 = 0;
  }
  id v6 = v13;

  return v6;
}

- (BuddyActivationState)activationState
{
  return self->_activationState;
}

- (void)setActivationState:(id)a3
{
}

- (ActivationController)activationController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activationController);

  return (ActivationController *)WeakRetained;
}

- (void)setActivationController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
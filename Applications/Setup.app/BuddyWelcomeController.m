@interface BuddyWelcomeController
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BFFFlowItemDelegate)delegate;
- (BuddyWelcomeController)init;
- (id)createLinkButtonWithTitle:(id)a3 action:(SEL)a4;
- (void)addBoldButton:(id)a3 action:(SEL)a4;
- (void)addLinkButton:(id)a3 action:(SEL)a4;
- (void)setDelegate:(id)a3;
@end

@implementation BuddyWelcomeController

- (BuddyWelcomeController)init
{
  location[0] = self;
  objc_storeStrong(location, 0);
  return (BuddyWelcomeController *)location[1];
}

+ (unint64_t)applicableDispositions
{
}

- (id)createLinkButtonWithTitle:(id)a3 action:(SEL)a4
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7[1] = (id)a4;
  v7[0] = +[OBLinkTrayButton linkButton];
  [v7[0] setTitle:location[0] forState:0];
  [v7[0] addTarget:v9 action:a4 forControlEvents:64];
  id v5 = v7[0];
  objc_storeStrong(v7, 0);
  objc_storeStrong(location, 0);
  return v5;
}

- (void)addLinkButton:(id)a3 action:(SEL)a4
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6[1] = (id)a4;
  v6[0] = [(BuddyWelcomeController *)v8 createLinkButtonWithTitle:location[0] action:a4];
  id v5 = [(BuddyWelcomeController *)v8 buttonTray];
  [v5 addButton:v6[0]];

  objc_storeStrong(v6, 0);
  objc_storeStrong(location, 0);
}

- (void)addBoldButton:(id)a3 action:(SEL)a4
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6[1] = (id)a4;
  v6[0] = +[OBBoldTrayButton boldButton];
  [v6[0] setTitle:location[0] forState:0];
  [v6[0] addTarget:v8 action:a4 forControlEvents:64];
  id v5 = [(BuddyWelcomeController *)v8 buttonTray];
  [v5 addButton:v6[0]];

  objc_storeStrong(v6, 0);
  objc_storeStrong(location, 0);
}

+ (id)cloudConfigSkipKey
{
  id v7 = a1;
  SEL aSelector = a2;
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v4 = OS_LOG_TYPE_FAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_FAULT))
  {
    id location = NSStringFromSelector(aSelector);
    sub_10004B238((uint64_t)buf, (uint64_t)location);
    _os_log_fault_impl((void *)&_mh_execute_header, oslog, v4, "Subclasses must implement %@", buf, 0xCu);

    objc_storeStrong(&location, 0);
  }
  objc_storeStrong((id *)&oslog, 0);
  return 0;
}

- (BFFFlowItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BFFFlowItemDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
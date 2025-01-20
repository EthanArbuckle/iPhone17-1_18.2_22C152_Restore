@interface AppleEthernetController
- (AppleEthernetController)initWithNibName:(id)a3 bundle:(id)a4;
- (AppleEthernetSettingsController)settingsController;
- (NSArray)interfaces;
- (PSSystemConfigurationDynamicStoreEthernetWatcher)interfaceWatcher;
- (UITableView)interfacesView;
- (id)processInterfaces:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)refresh;
- (void)renameInterfaces:(id)a3;
- (void)setInterfaceWatcher:(id)a3;
- (void)setInterfaces:(id)a3;
- (void)setInterfacesView:(id)a3;
- (void)setSettingsController:(id)a3;
- (void)sortInterfaces:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AppleEthernetController

- (AppleEthernetController)initWithNibName:(id)a3 bundle:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)AppleEthernetController;
  v4 = [(AppleEthernetController *)&v12 initWithNibName:0 bundle:0];
  if (v4)
  {
    v5 = +[NSBundle bundleForClass:objc_opt_class()];
    v6 = [v5 localizedStringForKey:@"ETHERNET" value:&stru_C600 table:@"Ethernet"];
    [(AppleEthernetController *)v4 setTitle:v6];
    v7 = [(AppleEthernetController *)v4 navigationItem];
    [v7 setLargeTitleDisplayMode:2];

    uint64_t v8 = +[PSSystemConfigurationDynamicStoreEthernetWatcher sharedManager];
    interfaceWatcher = v4->_interfaceWatcher;
    v4->_interfaceWatcher = (PSSystemConfigurationDynamicStoreEthernetWatcher *)v8;

    settingsController = v4->_settingsController;
    v4->_settingsController = 0;
  }
  return v4;
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)AppleEthernetController;
  [(AppleEthernetController *)&v12 viewDidLoad];
  v3 = [(PSSystemConfigurationDynamicStoreEthernetWatcher *)self->_interfaceWatcher ethernetNetworkInterfaces];
  v4 = [(AppleEthernetController *)self processInterfaces:v3];
  interfaces = self->_interfaces;
  self->_interfaces = v4;

  id v6 = objc_alloc((Class)UITableView);
  v7 = [(AppleEthernetController *)self view];
  [v7 frame];
  uint64_t v8 = (UITableView *)objc_msgSend(v6, "initWithFrame:style:", 2);
  interfacesView = self->_interfacesView;
  self->_interfacesView = v8;

  [(UITableView *)self->_interfacesView registerClass:objc_opt_class() forCellReuseIdentifier:@"InterfaceCell"];
  [(UITableView *)self->_interfacesView setDelegate:self];
  [(UITableView *)self->_interfacesView setDataSource:self];
  [(UITableView *)self->_interfacesView setAutoresizingMask:18];
  v10 = [(AppleEthernetController *)self view];
  [v10 addSubview:self->_interfacesView];

  v11 = +[NSNotificationCenter defaultCenter];
  [v11 addObserver:self selector:"refresh" name:PSEthernetChangedNotification object:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AppleEthernetController;
  [(AppleEthernetController *)&v5 viewWillAppear:a3];
  settingsController = self->_settingsController;
  self->_settingsController = 0;
}

- (void)refresh
{
  v3 = [(PSSystemConfigurationDynamicStoreEthernetWatcher *)self->_interfaceWatcher ethernetNetworkInterfaces];
  v4 = [(AppleEthernetController *)self processInterfaces:v3];
  interfaces = self->_interfaces;
  self->_interfaces = v4;

  interfacesView = self->_interfacesView;

  [(UITableView *)interfacesView reloadData];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  interfaces = self->_interfaces;
  id v6 = a4;
  -[NSArray objectAtIndex:](interfaces, "objectAtIndex:", [v6 row]);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  v7 = [[AppleEthernetSettingsController alloc] initWithDefaultConfigForInterface:v10];
  settingsController = self->_settingsController;
  self->_settingsController = v7;

  v9 = [(AppleEthernetController *)self navigationController];
  [v9 pushViewController:self->_settingsController animated:1];

  [(UITableView *)self->_interfacesView deselectRowAtIndexPath:v6 animated:1];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  interfacesView = self->_interfacesView;
  id v6 = a4;
  v7 = [(UITableView *)interfacesView dequeueReusableCellWithIdentifier:@"InterfaceCell"];
  interfaces = self->_interfaces;
  id v9 = [v6 row];

  id v10 = [(NSArray *)interfaces objectAtIndex:v9];
  [v7 initializeWithInterface:v10];

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4) {
    return 0;
  }
  else {
    return [(NSArray *)self->_interfaces count];
  }
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (a4)
  {
    v4 = 0;
  }
  else
  {
    objc_super v5 = +[NSBundle bundleForClass:objc_opt_class()];
    v4 = [v5 localizedStringForKey:@"INTERFACES" value:&stru_C600 table:@"Ethernet"];
  }

  return v4;
}

- (id)processInterfaces:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[NSMutableArray array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_super v12 = objc_alloc_init(AppleEthernetInterface);
        v13 = v11;
        CFStringRef LocalizedDisplayName = SCNetworkInterfaceGetLocalizedDisplayName(v13);
        -[AppleEthernetInterface setDisplayName:](v12, "setDisplayName:", LocalizedDisplayName, (void)v16);
        [(AppleEthernetInterface *)v12 setBSDName:SCNetworkInterfaceGetBSDName(v13)];
        CFRelease(v13);
        [v5 addObject:v12];
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  [(AppleEthernetController *)self sortInterfaces:v5];
  [(AppleEthernetController *)self renameInterfaces:v5];

  return v5;
}

- (void)sortInterfaces:(id)a3
{
}

- (void)renameInterfaces:(id)a3
{
  id v3 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = (char *)[v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    objc_super v5 = v4;
    id v6 = 0;
    LODWORD(v7) = 0;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v20;
    do
    {
      uint64_t v10 = 0;
      uint64_t v18 = v8;
      uint64_t v11 = -v8;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v3);
        }
        objc_super v12 = *(void **)(*((void *)&v19 + 1) + 8 * v10);
        if (!v6
          || (([*(id *)(*((void *)&v19 + 1) + 8 * v10) displayName],
               v13 = objc_claimAutoreleasedReturnValue(),
               unsigned int v14 = [v13 isEqualToString:v6],
               v13,
               v14)
            ? (BOOL v15 = v11 == v10)
            : (BOOL v15 = 1),
              v15))
        {
          [v12 displayName];
          long long v16 = v6;
          id v6 = LODWORD(v7) = 1;
        }
        else
        {
          long long v16 = [v12 displayName];
          uint64_t v7 = (v7 + 1);
          long long v17 = +[NSString stringWithFormat:@"%@ %u", v16, v7];
          [v12 setDisplayName:v17];
        }
        ++v10;
      }
      while (v5 != (char *)v10);
      uint64_t v8 = (uint64_t)&v5[v18];
      objc_super v5 = (char *)[v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v5);
  }
  else
  {
    id v6 = 0;
  }
}

- (NSArray)interfaces
{
  return self->_interfaces;
}

- (void)setInterfaces:(id)a3
{
}

- (UITableView)interfacesView
{
  return self->_interfacesView;
}

- (void)setInterfacesView:(id)a3
{
}

- (PSSystemConfigurationDynamicStoreEthernetWatcher)interfaceWatcher
{
  return self->_interfaceWatcher;
}

- (void)setInterfaceWatcher:(id)a3
{
}

- (AppleEthernetSettingsController)settingsController
{
  return self->_settingsController;
}

- (void)setSettingsController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsController, 0);
  objc_storeStrong((id *)&self->_interfaceWatcher, 0);
  objc_storeStrong((id *)&self->_interfacesView, 0);

  objc_storeStrong((id *)&self->_interfaces, 0);
}

@end
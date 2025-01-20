@interface HSPCNameInputSourcesViewController
+ (id)applicableServicesForAccessory:(id)a3;
+ (id)inputSourceServicesForAccessory:(id)a3;
- (BOOL)areAllServicesFrozen;
- (BOOL)shouldServiceBeFrozen:(id)a3;
- (BOOL)shouldServiceStartEnabled:(id)a3;
- (HSPCNameInputSourcesViewController)initWithCoordinator:(id)a3 config:(id)a4;
- (id)cellReuseIdentifierForService:(id)a3;
- (id)characteristicTypesToPreload;
- (id)serviceComparator;
- (id)servicesToPreload;
- (id)shouldSkip;
- (void)viewDidLoad;
@end

@implementation HSPCNameInputSourcesViewController

- (id)servicesToPreload
{
  v2 = [(HSPCNameServicesViewController *)self config];
  v3 = [v2 addedAccessory];

  v4 = [(id)objc_opt_class() inputSourceServicesForAccessory:v3];

  return v4;
}

- (id)characteristicTypesToPreload
{
  v8.receiver = self;
  v8.super_class = (Class)HSPCNameInputSourcesViewController;
  v2 = [(HSPCNameServicesViewController *)&v8 characteristicTypesToPreload];
  id v3 = [v2 mutableCopy];

  v9[0] = HMCharacteristicTypeIsConfigured;
  v9[1] = HMCharacteristicTypeCurrentVisibilityState;
  v9[2] = HMCharacteristicTypeTargetVisibilityState;
  v4 = +[NSArray arrayWithObjects:v9 count:3];
  v5 = +[NSSet setWithArray:v4];
  [v3 unionSet:v5];

  id v6 = [v3 copy];

  return v6;
}

- (id)shouldSkip
{
  id v3 = objc_opt_class();
  v4 = [(HSPCNameServicesViewController *)self config];
  v5 = [v4 addedAccessory];
  id v6 = [v3 applicableServicesForAccessory:v5];
  v7 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v6 count] == 0);
  objc_super v8 = +[NAFuture futureWithResult:v7];

  return v8;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)HSPCNameInputSourcesViewController;
  [(HSPCNameServicesViewController *)&v8 viewDidLoad];
  unsigned int v3 = [(HSPCNameInputSourcesViewController *)self areAllServicesFrozen];
  v4 = off_1000A88E8;
  if (!v3) {
    v4 = off_1000A88F8;
  }
  [(__objc2_class *)*v4 leadingSeparatorMargin];
  double v6 = v5;
  v7 = [(HSPCNameServicesViewController *)self tableView];
  [v7 setSeparatorInset:0.0, v6, 0.0, 0.0];
}

+ (id)inputSourceServicesForAccessory:(id)a3
{
  id v3 = a3;
  v4 = [v3 hf_primaryService];
  double v5 = [v3 hf_visibleServices];

  double v6 = [v4 hf_childServices];
  v7 = [v5 setByAddingObjectsFromSet:v6];

  objc_super v8 = [v7 na_filter:&stru_1000AA0A0];

  return v8;
}

+ (id)applicableServicesForAccessory:(id)a3
{
  id v3 = [a1 inputSourceServicesForAccessory:a3];
  v4 = [v3 na_filter:&stru_1000AA0C0];

  return v4;
}

- (id)serviceComparator
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002BF50;
  v4[3] = &unk_1000AA110;
  v4[4] = self;
  v2 = objc_retainBlock(v4);

  return v2;
}

- (HSPCNameInputSourcesViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HSPCNameInputSourcesViewController;
  v4 = [(HSPCNameServicesViewController *)&v7 initWithCoordinator:a3 config:a4];
  if (v4)
  {
    double v5 = HULocalizedString();
    [(HSPCNameInputSourcesViewController *)v4 setTitle:v5];

    [(HSPCNameInputSourcesViewController *)v4 setSubtitle:0];
  }
  return v4;
}

- (BOOL)shouldServiceStartEnabled:(id)a3
{
  id v3 = [a3 hf_characteristicOfType:HMCharacteristicTypeCurrentVisibilityState];
  objc_opt_class();
  v4 = [v3 value];
  if (objc_opt_isKindOfClass()) {
    double v5 = v4;
  }
  else {
    double v5 = 0;
  }
  id v6 = v5;

  if (v6) {
    BOOL v7 = [v6 integerValue] != (id)1;
  }
  else {
    BOOL v7 = 1;
  }

  return v7;
}

- (BOOL)shouldServiceBeFrozen:(id)a3
{
  id v3 = [a3 hf_characteristicOfType:HMCharacteristicTypeTargetVisibilityState];
  char v4 = [v3 hf_isWritable] ^ 1;

  return v4;
}

- (id)cellReuseIdentifierForService:(id)a3
{
  char v4 = [(HSPCNameServicesViewController *)self frozenServices];
  id v5 = [v4 count];
  id v6 = [(HSPCNameServicesViewController *)self services];
  id v7 = [v6 count];

  objc_super v8 = off_1000A88E8;
  if (v5 != v7) {
    objc_super v8 = off_1000A88F8;
  }
  v9 = [(__objc2_class *)*v8 _reuseIdentifier];

  return v9;
}

- (BOOL)areAllServicesFrozen
{
  id v3 = [(HSPCNameServicesViewController *)self frozenServices];
  id v4 = [v3 count];
  id v5 = [(HSPCNameServicesViewController *)self services];
  LOBYTE(v4) = v4 == [v5 count];

  return (char)v4;
}

@end
@interface BuddyButtonConfigurationWrapper
- (UIViewController)viewController;
- (id)configurationCompleted;
- (void)prepare:(id)a3;
- (void)setConfigurationCompleted:(id)a3;
- (void)setViewController:(id)a3;
@end

@implementation BuddyButtonConfigurationWrapper

- (void)prepare:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = sub_100114F90();
  v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  v7 = sub_1001150A8;
  v8 = &unk_1002B0CF8;
  v9 = v12;
  id v10 = location[0];
  [v3 preloadResourcesWithCompletion:&v4];
  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (id)configurationCompleted
{
  return self->_configurationCompleted;
}

- (void)setConfigurationCompleted:(id)a3
{
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
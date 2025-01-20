@interface ACUICloudNotificationAccountDataSource
- (ACUICloudNotificationAccountDataSource)initWithAccountDataSource:(id)a3;
- (ACUIRemoteAccountSyncController)accountDataSource;
- (NSHashTable)observers;
- (id)accounts;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)saveAccount:(id)a3 completion:(id)a4;
- (void)setAccountDataSource:(id)a3;
- (void)setObservers:(id)a3;
- (void)syncControllerAccountsChanged:(id)a3;
- (void)syncControllerAccountsInvalidated:(id)a3;
- (void)syncControllerStateChanged:(id)a3;
@end

@implementation ACUICloudNotificationAccountDataSource

- (ACUICloudNotificationAccountDataSource)initWithAccountDataSource:(id)a3
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v9;
  v9 = 0;
  v7.receiver = v3;
  v7.super_class = (Class)ACUICloudNotificationAccountDataSource;
  v9 = [(ACUICloudNotificationAccountDataSource *)&v7 init];
  objc_storeStrong((id *)&v9, v9);
  if (v9)
  {
    [(ACUICloudNotificationAccountDataSource *)v9 setAccountDataSource:location[0]];
    id v6 = [objc_alloc((Class)NSHashTable) initWithOptions:5 capacity:3];
    -[ACUICloudNotificationAccountDataSource setObservers:](v9, "setObservers:");

    [location[0] addObserver:v9];
  }
  v5 = v9;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v9, 0);
  return v5;
}

- (void)saveAccount:(id)a3 completion:(id)a4
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  accountDataSource = v9->_accountDataSource;
  id v6 = [location[0] acAccount];
  -[ACUIRemoteAccountSyncController updateRemoteAccount:completion:](accountDataSource, "updateRemoteAccount:completion:");

  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (id)accounts
{
  v3 = [(ACUIRemoteAccountSyncController *)self->_accountDataSource accounts];
  id v4 = [(NSArray *)v3 ac_map:&stru_186A8];

  return v4;
}

- (void)addObserver:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(NSHashTable *)v4->_observers addObject:location[0]];
  objc_storeStrong(location, 0);
}

- (void)removeObserver:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(NSHashTable *)v4->_observers removeObject:location[0]];
  objc_storeStrong(location, 0);
}

- (void)syncControllerAccountsChanged:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  memset(__b, 0, sizeof(__b));
  obj = v12->_observers;
  id v8 = [(NSHashTable *)obj countByEnumeratingWithState:__b objects:v13 count:16];
  if (v8)
  {
    uint64_t v4 = *(void *)__b[2];
    uint64_t v5 = 0;
    id v6 = v8;
    while (1)
    {
      uint64_t v3 = v5;
      if (*(void *)__b[2] != v4) {
        objc_enumerationMutation(obj);
      }
      id v10 = *(id *)(__b[1] + 8 * v5);
      [v10 accountDataSourceAccountsChanged:v12];
      ++v5;
      if (v3 + 1 >= (unint64_t)v6)
      {
        uint64_t v5 = 0;
        id v6 = [(NSHashTable *)obj countByEnumeratingWithState:__b objects:v13 count:16];
        if (!v6) {
          break;
        }
      }
    }
  }

  objc_storeStrong(location, 0);
}

- (void)syncControllerAccountsInvalidated:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)syncControllerStateChanged:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (ACUIRemoteAccountSyncController)accountDataSource
{
  return self->_accountDataSource;
}

- (void)setAccountDataSource:(id)a3
{
}

- (NSHashTable)observers
{
  return (NSHashTable *)objc_getProperty(self, a2, 16, 1);
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
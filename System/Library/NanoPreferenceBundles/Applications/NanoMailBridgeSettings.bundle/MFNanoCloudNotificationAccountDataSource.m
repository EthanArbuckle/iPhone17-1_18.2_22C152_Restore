@interface MFNanoCloudNotificationAccountDataSource
- (MFNanoAccountsSettingsDataSource)accountDataSource;
- (MFNanoCloudNotificationAccountDataSource)initWithAccountDataSource:(id)a3;
- (NSHashTable)observers;
- (id)accounts;
- (void)accountsSettingsDataSourceDidUpdate:(id)a3;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)saveAccount:(id)a3 completion:(id)a4;
- (void)setAccountDataSource:(id)a3;
- (void)setObservers:(id)a3;
@end

@implementation MFNanoCloudNotificationAccountDataSource

- (MFNanoCloudNotificationAccountDataSource)initWithAccountDataSource:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MFNanoCloudNotificationAccountDataSource;
  v5 = [(MFNanoCloudNotificationAccountDataSource *)&v10 init];
  v6 = v5;
  if (v5)
  {
    [(MFNanoCloudNotificationAccountDataSource *)v5 setAccountDataSource:v4];
    id v7 = [objc_alloc((Class)NSHashTable) initWithOptions:5 capacity:3];
    [(MFNanoCloudNotificationAccountDataSource *)v6 setObservers:v7];

    v8 = [(MFNanoCloudNotificationAccountDataSource *)v6 accountDataSource];
    [v8 addObserver:v6];
  }
  return v6;
}

- (id)accounts
{
  v2 = [(MFNanoAccountsSettingsDataSource *)self->_accountDataSource accounts];
  v3 = objc_msgSend(v2, "ef_map:", &stru_2CA58);

  return v3;
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)saveAccount:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v5 = [a3 nnmkAccount];
  +[NNMKStandaloneAccountHelper saveLocalAccountProperties:v5 withCompletion:v6];
}

- (void)accountsSettingsDataSourceDidUpdate:(id)a3
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = self->_observers;
  id v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * (void)v7), "accountDataSourceAccountsChanged:", self, (void)v8);
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (MFNanoAccountsSettingsDataSource)accountDataSource
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
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_accountDataSource, 0);
}

@end
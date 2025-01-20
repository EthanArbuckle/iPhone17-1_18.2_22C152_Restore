@interface AAUIAppsSyncingToDriveSpecifierProvider
- (AAUIAppsSyncingToDriveSpecifierProvider)initWithAccountManager:(id)a3 presenter:(id)a4;
- (AAUISpecifierProviderDelegate)delegate;
- (NSArray)specifiers;
- (id)_specifiersForAppsSyncingToDrive;
- (id)account;
- (void)_fetchServerApps;
- (void)_reloadSpecifier;
- (void)setDelegate:(id)a3;
- (void)setSpecifiers:(id)a3;
@end

@implementation AAUIAppsSyncingToDriveSpecifierProvider

- (AAUIAppsSyncingToDriveSpecifierProvider)initWithAccountManager:(id)a3 presenter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)AAUIAppsSyncingToDriveSpecifierProvider;
  v9 = [(AAUIAppsSyncingToDriveSpecifierProvider *)&v23 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accountManager, a3);
    id v11 = objc_alloc((Class)ICQCloudStorageDataController);
    v12 = [(AIDAAccountManager *)v10->_accountManager accounts];
    v13 = [v12 objectForKeyedSubscript:AIDAServiceTypeCloud];
    v14 = (ICQCloudStorageDataController *)[v11 initWithAccount:v13];
    datacontroller = v10->_datacontroller;
    v10->_datacontroller = v14;

    v16 = [[AAUIUbiquitySpecifierProvider alloc] initWithAccountManager:v10->_accountManager];
    ubiquitySpecifierProvider = v10->_ubiquitySpecifierProvider;
    v10->_ubiquitySpecifierProvider = v16;

    v18 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    serverApps = v10->_serverApps;
    v10->_serverApps = v18;

    v20 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    appsSyncingToDriveBundleIDs = v10->_appsSyncingToDriveBundleIDs;
    v10->_appsSyncingToDriveBundleIDs = v20;

    objc_storeWeak((id *)&v10->_listController, v8);
    v10->_isAppsSyncToDriveRequestInProgress = 0;
  }

  return v10;
}

- (id)account
{
  v2 = [(AIDAAccountManager *)self->_accountManager accounts];
  v3 = [v2 objectForKeyedSubscript:AIDAServiceTypeCloud];

  return v3;
}

- (NSArray)specifiers
{
  v3 = [(AAUIAppsSyncingToDriveSpecifierProvider *)self _specifiersForAppsSyncingToDrive];
  specifiers = self->_specifiers;
  self->_specifiers = v3;

  v5 = self->_specifiers;

  return v5;
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v6 = a3;
  id v5 = objc_storeWeak((id *)p_delegate, v6);
  [(AAUIUbiquitySpecifierProvider *)self->_ubiquitySpecifierProvider setDelegate:v6];

  [(AAUIAppsSyncingToDriveSpecifierProvider *)self _fetchServerApps];
}

- (id)_specifiersForAppsSyncingToDrive
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  if ([(NSMutableSet *)self->_appsSyncingToDriveBundleIDs count])
  {
    v4 = [(AAUIUbiquitySpecifierProvider *)self->_ubiquitySpecifierProvider specifiers];
    id v7 = _NSConcreteStackBlock;
    uint64_t v8 = 3221225472;
    v9 = sub_13A68;
    v10 = &unk_75928;
    id v11 = self;
    id v12 = v3;
    [v4 enumerateObjectsUsingBlock:&v7];
  }
  id v5 = objc_msgSend(v3, "copy", v7, v8, v9, v10, v11);

  return v5;
}

- (void)_reloadSpecifier
{
  id v5 = [(NSArray *)self->_specifiers copy];
  specifiers = self->_specifiers;
  self->_specifiers = 0;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained reloadSpecifiersForProvider:self oldSpecifiers:v5 animated:0];
}

- (void)_fetchServerApps
{
  [(NSMutableSet *)self->_serverApps removeAllObjects];
  self->_isAppsSyncToDriveRequestInProgress = 1;
  id v3 = objc_alloc((Class)ICQCloudStorageDataController);
  v4 = [(AAUIAppsSyncingToDriveSpecifierProvider *)self account];
  id v5 = [v3 initWithAccount:v4];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_13C2C;
  v6[3] = &unk_759A0;
  v6[4] = self;
  [v5 fetchAppsSyncingToiCloudDriveWithCompletion:v6];
}

- (AAUISpecifierProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AAUISpecifierProviderDelegate *)WeakRetained;
}

- (void)setSpecifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_appsSyncingToDriveBundleIDs, 0);
  objc_storeStrong((id *)&self->_serverApps, 0);
  objc_destroyWeak((id *)&self->_listController);
  objc_storeStrong((id *)&self->_ubiquitySpecifierProvider, 0);
  objc_storeStrong((id *)&self->_datacontroller, 0);

  objc_storeStrong((id *)&self->_accountManager, 0);
}

@end
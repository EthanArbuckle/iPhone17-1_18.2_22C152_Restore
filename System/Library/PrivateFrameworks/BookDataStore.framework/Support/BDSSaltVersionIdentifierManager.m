@interface BDSSaltVersionIdentifierManager
- (BCCloudChangeTokenController)tokenController;
- (BDSCloudKitSupportZoneRecovery)zoneDataManager;
- (BDSSaltVersionIdentifierManager)initWithZoneDataManager:(id)a3 tokenController:(id)a4 databaseController:(id)a5;
- (NSString)description;
- (NSString)zoneName;
- (void)databaseController:(id)a3 saltVersionIdentifierChanged:(id)a4 completion:(id)a5;
- (void)handleSaltVersionIdentifierChange:(id)a3 completion:(id)a4;
- (void)setTokenController:(id)a3;
- (void)setZoneDataManager:(id)a3;
- (void)setZoneName:(id)a3;
@end

@implementation BDSSaltVersionIdentifierManager

- (BDSSaltVersionIdentifierManager)initWithZoneDataManager:(id)a3 tokenController:(id)a4 databaseController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)BDSSaltVersionIdentifierManager;
  v11 = [(BDSSaltVersionIdentifierManager *)&v21 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_zoneDataManager, v8);
    objc_storeWeak((id *)&v12->_tokenController, v9);
    v13 = [v9 zoneName];
    v14 = (NSString *)[v13 copy];
    zoneName = v12->_zoneName;
    v12->_zoneName = v14;

    [v10 addObserver:v12 zoneID:v12->_zoneName];
    v16 = sub_10000CE18();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&v12->_zoneDataManager);
      id v18 = objc_loadWeakRetained((id *)&v12->_tokenController);
      v19 = v12->_zoneName;
      *(_DWORD *)buf = 138412802;
      id v23 = WeakRetained;
      __int16 v24 = 2112;
      id v25 = v18;
      __int16 v26 = 2112;
      v27 = v19;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[BDSSaltVersionIdentifierManager] init with %@ %@. Adding to zone:(%@)", buf, 0x20u);
    }
  }

  return v12;
}

- (void)databaseController:(id)a3 saltVersionIdentifierChanged:(id)a4 completion:(id)a5
{
}

- (void)handleSaltVersionIdentifierChange:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BDSSaltVersionIdentifierManager *)self zoneName];
  id v9 = sub_10000CE18();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v30 = v8;
    __int16 v31 = 2112;
    id v32 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[BDSSaltVersionIdentifierManager] #saltVersionIdentifierChanged - %@ ---1. %@  ", buf, 0x16u);
  }

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100074114;
  v25[3] = &unk_1002604D8;
  v25[4] = self;
  id v10 = v8;
  id v26 = v10;
  id v11 = v6;
  id v27 = v11;
  id v12 = v7;
  id v28 = v12;
  v13 = objc_retainBlock(v25);
  v14 = [(BDSSaltVersionIdentifierManager *)self tokenController];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000744A8;
  v19[3] = &unk_100261F30;
  id v23 = v13;
  id v24 = v12;
  id v20 = v10;
  objc_super v21 = self;
  id v22 = v11;
  id v15 = v11;
  id v16 = v12;
  v17 = v13;
  id v18 = v10;
  [v14 zoneNeedsUpdate:v15 completion:v19];
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(BDSSaltVersionIdentifierManager *)self zoneName];
  id v6 = [(BDSSaltVersionIdentifierManager *)self zoneDataManager];
  id v7 = +[NSString stringWithFormat:@"<%@:%p zoneName=%@ zoneDataManager=%@>", v4, self, v5, v6];

  return (NSString *)v7;
}

- (BDSCloudKitSupportZoneRecovery)zoneDataManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_zoneDataManager);
  return (BDSCloudKitSupportZoneRecovery *)WeakRetained;
}

- (void)setZoneDataManager:(id)a3
{
}

- (BCCloudChangeTokenController)tokenController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tokenController);
  return (BCCloudChangeTokenController *)WeakRetained;
}

- (void)setTokenController:(id)a3
{
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (void)setZoneName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneName, 0);
  objc_destroyWeak((id *)&self->_tokenController);
  objc_destroyWeak((id *)&self->_zoneDataManager);
}

@end
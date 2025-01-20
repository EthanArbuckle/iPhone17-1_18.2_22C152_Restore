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
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v40.receiver = self;
  v40.super_class = (Class)BDSSaltVersionIdentifierManager;
  v11 = [(BDSSaltVersionIdentifierManager *)&v40 init];
  uint64_t v12 = (uint64_t)v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_zoneDataManager, v8);
    objc_storeWeak((id *)(v12 + 16), v9);
    v20 = objc_msgSend_zoneName(v9, v13, v14, v15, v16, v17, v18, v19);
    uint64_t v28 = objc_msgSend_copy(v20, v21, v22, v23, v24, v25, v26, v27);
    v29 = *(void **)(v12 + 24);
    *(void *)(v12 + 24) = v28;

    objc_msgSend_addObserver_zoneID_(v10, v30, v12, *(void *)(v12 + 24), v31, v32, v33, v34);
    v35 = BDSCloudKitSyncLog();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(v12 + 8));
      id v37 = objc_loadWeakRetained((id *)(v12 + 16));
      uint64_t v38 = *(void *)(v12 + 24);
      *(_DWORD *)buf = 138412802;
      id v42 = WeakRetained;
      __int16 v43 = 2112;
      id v44 = v37;
      __int16 v45 = 2112;
      uint64_t v46 = v38;
      _os_log_impl(&dword_2360BC000, v35, OS_LOG_TYPE_INFO, "[BDSSaltVersionIdentifierManager] init with %@ %@. Adding to zone:(%@)", buf, 0x20u);
    }
  }

  return (BDSSaltVersionIdentifierManager *)v12;
}

- (void)databaseController:(id)a3 saltVersionIdentifierChanged:(id)a4 completion:(id)a5
{
}

- (void)handleSaltVersionIdentifierChange:(id)a3 completion:(id)a4
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = objc_msgSend_zoneName(self, v8, v9, v10, v11, v12, v13, v14);
  uint64_t v16 = BDSCloudKitSyncLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v49 = v15;
    __int16 v50 = 2112;
    id v51 = v6;
    _os_log_impl(&dword_2360BC000, v16, OS_LOG_TYPE_DEFAULT, "[BDSSaltVersionIdentifierManager] #saltVersionIdentifierChanged - %@ ---1. %@  ", buf, 0x16u);
  }

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_2360D4A98;
  aBlock[3] = &unk_264CA1100;
  aBlock[4] = self;
  id v17 = v15;
  id v45 = v17;
  id v18 = v6;
  id v46 = v18;
  id v19 = v7;
  id v47 = v19;
  v20 = _Block_copy(aBlock);
  uint64_t v28 = objc_msgSend_tokenController(self, v21, v22, v23, v24, v25, v26, v27);
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = sub_2360D4E2C;
  v38[3] = &unk_264CA1150;
  id v42 = v20;
  id v43 = v19;
  id v39 = v17;
  objc_super v40 = self;
  id v41 = v18;
  id v29 = v18;
  id v30 = v19;
  id v31 = v20;
  id v32 = v17;
  objc_msgSend_zoneNeedsUpdate_completion_(v28, v33, (uint64_t)v29, (uint64_t)v38, v34, v35, v36, v37);
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v13 = objc_msgSend_zoneName(self, v6, v7, v8, v9, v10, v11, v12);
  v21 = objc_msgSend_zoneDataManager(self, v14, v15, v16, v17, v18, v19, v20);
  uint64_t v28 = objc_msgSend_stringWithFormat_(v3, v22, @"<%@:%p zoneName=%@ zoneDataManager=%@>", v23, v24, v25, v26, v27, v5, self, v13, v21);

  return (NSString *)v28;
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
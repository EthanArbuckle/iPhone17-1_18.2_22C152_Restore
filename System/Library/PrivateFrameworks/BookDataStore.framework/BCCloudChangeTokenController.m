@interface BCCloudChangeTokenController
- (BCCloudChangeTokenController)initWithMOC:(id)a3 zoneName:(id)a4 cloudKitController:(id)a5;
- (BCCloudKitController)cloudKitController;
- (BOOL)enableCloudSync;
- (NSManagedObjectContext)moc;
- (NSString)zoneName;
- (void)deleteCloudDataWithCompletion:(id)a3;
- (void)serverChangeTokenWithCompletion:(id)a3;
- (void)setCloudKitController:(id)a3;
- (void)setEnableCloudSync:(BOOL)a3;
- (void)setMoc:(id)a3;
- (void)setZoneName:(id)a3;
- (void)storeServerChangeToken:(id)a3 completion:(id)a4;
- (void)updateSaltVersionIdentifier:(id)a3 completion:(id)a4;
- (void)zoneNeedsUpdate:(id)a3 completion:(id)a4;
@end

@implementation BCCloudChangeTokenController

- (BCCloudChangeTokenController)initWithMOC:(id)a3 zoneName:(id)a4 cloudKitController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v40.receiver = self;
  v40.super_class = (Class)BCCloudChangeTokenController;
  v11 = [(BCCloudChangeTokenController *)&v40 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_moc, v8);
    uint64_t v20 = objc_msgSend_copy(v9, v13, v14, v15, v16, v17, v18, v19);
    zoneName = v12->_zoneName;
    v12->_zoneName = (NSString *)v20;

    id v22 = objc_storeWeak((id *)&v12->_cloudKitController, v10);
    int v30 = objc_msgSend_didChangeContainer(v10, v23, v24, v25, v26, v27, v28, v29);

    if (v30)
    {
      v38[0] = MEMORY[0x263EF8330];
      v38[1] = 3221225472;
      v38[2] = sub_236100B50;
      v38[3] = &unk_264CA2008;
      v39 = v12;
      objc_msgSend_dissociateCloudDataFromSyncWithCompletion_(v39, v31, (uint64_t)v38, v32, v33, v34, v35, v36);
    }
  }

  return v12;
}

- (void)setEnableCloudSync:(BOOL)a3
{
  BOOL v8 = a3;
  uint64_t v79 = *MEMORY[0x263EF8340];
  id v10 = objc_msgSend_shared(MEMORY[0x263F2BA58], a2, a3, v3, v4, v5, v6, v7);
  int v18 = objc_msgSend_verboseLoggingEnabled(v10, v11, v12, v13, v14, v15, v16, v17);

  if (v18)
  {
    uint64_t v26 = BDSCloudKitDevelopmentLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = @"NO";
      if (v8) {
        uint64_t v27 = @"YES";
      }
      int v77 = 138412290;
      v78 = v27;
      _os_log_impl(&dword_2360BC000, v26, OS_LOG_TYPE_DEFAULT, "\"\\\"BCCloudChangeTokenController #enableCloudSync setEnableCloudSync %@\\\"\"", (uint8_t *)&v77, 0xCu);
    }
  }
  if (self->_enableCloudSync != v8)
  {
    self->_enableCloudSync = v8;
    if (v8)
    {
      id v28 = objc_alloc(MEMORY[0x263EFD808]);
      uint64_t v36 = objc_msgSend_zoneName(self, v29, v30, v31, v32, v33, v34, v35);
      v42 = objc_msgSend_initWithZoneName_ownerName_(v28, v37, (uint64_t)v36, *MEMORY[0x263EFD488], v38, v39, v40, v41);

      v50 = objc_msgSend_cloudKitController(self, v43, v44, v45, v46, v47, v48, v49);
      v58 = objc_msgSend_privateCloudDatabaseController(v50, v51, v52, v53, v54, v55, v56, v57);
      objc_msgSend_registerServerChangeTokenStore_forZoneID_(v58, v59, (uint64_t)self, (uint64_t)v42, v60, v61, v62, v63);
    }
    else
    {
      v42 = objc_msgSend_cloudKitController(self, v19, v20, v21, v22, v23, v24, v25);
      v50 = objc_msgSend_privateCloudDatabaseController(v42, v64, v65, v66, v67, v68, v69, v70);
      objc_msgSend_unregisterServerChangeTokenStore_(v50, v71, (uint64_t)self, v72, v73, v74, v75, v76);
    }
  }
}

- (void)zoneNeedsUpdate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = objc_msgSend_moc(self, v8, v9, v10, v11, v12, v13, v14);
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = sub_236100EDC;
  v25[3] = &unk_264CA1100;
  v25[4] = self;
  id v26 = v6;
  id v27 = v15;
  id v28 = v7;
  id v16 = v7;
  id v17 = v15;
  id v18 = v6;
  objc_msgSend_performBlock_(v17, v19, (uint64_t)v25, v20, v21, v22, v23, v24);
}

- (void)updateSaltVersionIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = objc_msgSend_moc(self, v8, v9, v10, v11, v12, v13, v14);
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = sub_236101330;
  v25[3] = &unk_264CA1100;
  v25[4] = self;
  id v26 = v6;
  id v27 = v15;
  id v28 = v7;
  id v16 = v7;
  id v17 = v15;
  id v18 = v6;
  objc_msgSend_performBlock_(v17, v19, (uint64_t)v25, v20, v21, v22, v23, v24);
}

- (void)deleteCloudDataWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v12 = objc_msgSend_moc(self, v5, v6, v7, v8, v9, v10, v11);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = sub_236101800;
  v21[3] = &unk_264CA1890;
  id v22 = v12;
  uint64_t v23 = self;
  id v24 = v4;
  id v13 = v4;
  id v14 = v12;
  objc_msgSend_performBlock_(v14, v15, (uint64_t)v21, v16, v17, v18, v19, v20);
}

- (void)storeServerChangeToken:(id)a3 completion:(id)a4
{
  uint64_t v95 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_enableCloudSync(self, v8, v9, v10, v11, v12, v13, v14))
  {
    id v22 = objc_alloc(MEMORY[0x263F08910]);
    inited = objc_msgSend_initRequiringSecureCoding_(v22, v23, 1, v24, v25, v26, v27, v28);
    objc_msgSend_encodeWithCoder_(v6, v30, (uint64_t)inited, v31, v32, v33, v34, v35);
    objc_msgSend_finishEncoding(inited, v36, v37, v38, v39, v40, v41, v42);
    v50 = objc_msgSend_encodedData(inited, v43, v44, v45, v46, v47, v48, v49);
    v58 = objc_msgSend_moc(self, v51, v52, v53, v54, v55, v56, v57);
    v86[0] = MEMORY[0x263EF8330];
    v86[1] = 3221225472;
    v86[2] = sub_236101C80;
    v86[3] = &unk_264CA2030;
    v86[4] = self;
    id v87 = v6;
    id v88 = v58;
    id v89 = v50;
    id v90 = v7;
    id v59 = v50;
    id v60 = v58;
    objc_msgSend_performBlock_(v60, v61, (uint64_t)v86, v62, v63, v64, v65, v66);
  }
  else
  {
    uint64_t v67 = objc_msgSend_shared(MEMORY[0x263F2BA58], v15, v16, v17, v18, v19, v20, v21);
    int v75 = objc_msgSend_verboseLoggingEnabled(v67, v68, v69, v70, v71, v72, v73, v74);

    if (v75)
    {
      uint64_t v76 = BDSCloudKitDevelopmentLog();
      if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
      {
        v84 = objc_msgSend_zoneName(self, v77, v78, v79, v80, v81, v82, v83);
        *(_DWORD *)buf = 138412546;
        v92 = v84;
        __int16 v93 = 2112;
        id v94 = v6;
        _os_log_impl(&dword_2360BC000, v76, OS_LOG_TYPE_DEFAULT, "\"\\\"BCCloudChangeTokenController - #recordChange zone: %@ NOT storing server change token: %@\\\"\"", buf, 0x16u);
      }
    }
    v85 = _Block_copy(v7);
    inited = v85;
    if (v85) {
      (*((void (**)(void *))v85 + 2))(v85);
    }
  }
}

- (void)serverChangeTokenWithCompletion:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v12 = objc_msgSend_moc(self, v5, v6, v7, v8, v9, v10, v11);
  uint64_t v13 = BDSCloudKitLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v21 = objc_msgSend_zoneName(self, v14, v15, v16, v17, v18, v19, v20);
    *(_DWORD *)buf = 138412290;
    uint64_t v35 = v21;
    _os_log_impl(&dword_2360BC000, v13, OS_LOG_TYPE_INFO, "BCCloudChangeTokenController - serverChangeTokenWithCompletion: %@", buf, 0xCu);
  }
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = sub_236102010;
  v30[3] = &unk_264CA1890;
  id v31 = v12;
  uint64_t v32 = self;
  id v33 = v4;
  id v22 = v4;
  id v23 = v12;
  objc_msgSend_performBlock_(v23, v24, (uint64_t)v30, v25, v26, v27, v28, v29);
}

- (BOOL)enableCloudSync
{
  return self->_enableCloudSync;
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (void)setZoneName:(id)a3
{
}

- (NSManagedObjectContext)moc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_moc);
  return (NSManagedObjectContext *)WeakRetained;
}

- (void)setMoc:(id)a3
{
}

- (BCCloudKitController)cloudKitController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cloudKitController);
  return (BCCloudKitController *)WeakRetained;
}

- (void)setCloudKitController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cloudKitController);
  objc_destroyWeak((id *)&self->_moc);
  objc_storeStrong((id *)&self->_zoneName, 0);
}

@end
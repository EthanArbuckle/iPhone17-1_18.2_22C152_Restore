@interface BLBookletMigrationStore
- (BLBookletMigrationStore)init;
- (BLServiceProxy)serviceProxy;
- (BOOL)removeAllMigrationInfosExcludingStates:(id)a3 error:(id *)a4;
- (BOOL)setMigrationState:(int64_t)a3 forStoreIDs:(id)a4 error:(id *)a5;
- (void)migrationInfosWithState:(int64_t)a3 completion:(id)a4;
- (void)migrationInfosWithStates:(id)a3 completion:(id)a4;
- (void)migrationInfosWithStoreIDs:(id)a3 completion:(id)a4;
@end

@implementation BLBookletMigrationStore

- (BLBookletMigrationStore)init
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v12.receiver = self;
  v12.super_class = (Class)BLBookletMigrationStore;
  v2 = [(BLBookletMigrationStore *)&v12 init];
  if (v2)
  {
    v3 = [BLServiceProxy alloc];
    id v11 = 0;
    uint64_t v6 = objc_msgSend_initWithError_(v3, v4, (uint64_t)&v11, v5);
    id v7 = v11;
    serviceProxy = v2->_serviceProxy;
    v2->_serviceProxy = (BLServiceProxy *)v6;

    if (!v2->_serviceProxy)
    {
      v9 = BLDefaultLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v14 = v7;
        _os_log_impl(&dword_21DFE3000, v9, OS_LOG_TYPE_ERROR, "Unable to create service proxy: %@", buf, 0xCu);
      }

      v2 = 0;
    }
  }
  return v2;
}

- (BOOL)setMigrationState:(int64_t)a3 forStoreIDs:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = sub_21E0092FC;
  v19 = sub_21E00930C;
  id v20 = 0;
  serviceProxy = self->_serviceProxy;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = sub_21E009314;
  v14[3] = &unk_26448BA58;
  v14[4] = &v15;
  objc_msgSend_setMigrationState_forStoreIDs_withReply_(serviceProxy, v10, a3, (uint64_t)v8, v14);
  id v11 = (void *)v16[5];
  if (a5 && v11)
  {
    *a5 = v11;
    id v11 = (void *)v16[5];
  }
  BOOL v12 = v11 == 0;
  _Block_object_dispose(&v15, 8);

  return v12;
}

- (void)migrationInfosWithStoreIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_21E0092FC;
  v23 = sub_21E00930C;
  id v24 = 0;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = sub_21E0092FC;
  uint64_t v17 = sub_21E00930C;
  id v18 = 0;
  serviceProxy = self->_serviceProxy;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_21E0094BC;
  v12[3] = &unk_26448BA80;
  v12[4] = &v13;
  v12[5] = &v19;
  objc_msgSend_migrationInfosWithStoreIDs_withReply_(serviceProxy, v9, (uint64_t)v6, (uint64_t)v12);
  uint64_t v10 = MEMORY[0x223C1EDC0](v7);
  id v11 = (void *)v10;
  if (v10) {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v10, v14[5], v20[5]);
  }

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
}

- (void)migrationInfosWithState:(int64_t)a3 completion:(id)a4
{
  id v6 = (void *)MEMORY[0x263EFFA08];
  id v7 = NSNumber;
  id v8 = a4;
  id v11 = objc_msgSend_numberWithInteger_(v7, v9, a3, v10);
  objc_msgSend_setWithObject_(v6, v12, (uint64_t)v11, v13);
  id v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_migrationInfosWithStates_completion_(self, v14, (uint64_t)v15, (uint64_t)v8);
}

- (void)migrationInfosWithStates:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_21E0092FC;
  v23 = sub_21E00930C;
  id v24 = 0;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = sub_21E0092FC;
  uint64_t v17 = sub_21E00930C;
  id v18 = 0;
  serviceProxy = self->_serviceProxy;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_21E009784;
  v12[3] = &unk_26448BA80;
  v12[4] = &v13;
  v12[5] = &v19;
  objc_msgSend_migrationInfosWithStates_withReply_(serviceProxy, v9, (uint64_t)v6, (uint64_t)v12);
  uint64_t v10 = MEMORY[0x223C1EDC0](v7);
  id v11 = (void *)v10;
  if (v10) {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v10, v14[5], v20[5]);
  }

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
}

- (BOOL)removeAllMigrationInfosExcludingStates:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = sub_21E0092FC;
  uint64_t v17 = sub_21E00930C;
  id v18 = 0;
  serviceProxy = self->_serviceProxy;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_21E009938;
  v12[3] = &unk_26448BA58;
  v12[4] = &v13;
  objc_msgSend_removeAllMigrationInfosExcludingStates_withReply_(serviceProxy, v8, (uint64_t)v6, (uint64_t)v12);
  v9 = (void *)v14[5];
  if (a4 && v9)
  {
    *a4 = v9;
    v9 = (void *)v14[5];
  }
  BOOL v10 = v9 == 0;
  _Block_object_dispose(&v13, 8);

  return v10;
}

- (BLServiceProxy)serviceProxy
{
  return self->_serviceProxy;
}

- (void).cxx_destruct
{
}

@end
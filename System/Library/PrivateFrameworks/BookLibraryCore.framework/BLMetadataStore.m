@interface BLMetadataStore
- (BLMetadataStore)init;
- (BLServiceProxy)serviceProxy;
- (BOOL)removeRacGUIDForStoreID:(int64_t)a3 error:(id *)a4;
- (BOOL)setRacGUID:(id)a3 forStoreID:(int64_t)a4 error:(id *)a5;
- (void)racGUIDForStoreID:(int64_t)a3 result:(id)a4;
@end

@implementation BLMetadataStore

- (BLMetadataStore)init
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v12.receiver = self;
  v12.super_class = (Class)BLMetadataStore;
  v2 = [(BLMetadataStore *)&v12 init];
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

- (BOOL)setRacGUID:(id)a3 forStoreID:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = sub_21E009BA8;
  v19 = sub_21E009BB8;
  id v20 = 0;
  serviceProxy = self->_serviceProxy;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = sub_21E009BC0;
  v14[3] = &unk_26448BA58;
  v14[4] = &v15;
  objc_msgSend_setRacGUID_forStoreID_withReply_(serviceProxy, v10, (uint64_t)v8, a4, v14);
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

- (void)racGUIDForStoreID:(int64_t)a3 result:(id)a4
{
  id v6 = a4;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = sub_21E009BA8;
  v22 = sub_21E009BB8;
  id v23 = 0;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = sub_21E009BA8;
  v16 = sub_21E009BB8;
  id v17 = 0;
  serviceProxy = self->_serviceProxy;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_21E009D5C;
  v11[3] = &unk_26448BAA8;
  v11[4] = &v12;
  v11[5] = &v18;
  objc_msgSend_racGUIDForStoreID_withReply_(serviceProxy, v8, a3, (uint64_t)v11);
  uint64_t v9 = MEMORY[0x223C1EDC0](v6);
  v10 = (void *)v9;
  if (v9) {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v9, v13[5], v19[5]);
  }

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
}

- (BOOL)removeRacGUIDForStoreID:(int64_t)a3 error:(id *)a4
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = sub_21E009BA8;
  uint64_t v14 = sub_21E009BB8;
  id v15 = 0;
  serviceProxy = self->_serviceProxy;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_21E009EF4;
  v9[3] = &unk_26448BA58;
  v9[4] = &v10;
  objc_msgSend_removeRacGUIDForStoreID_withReply_(serviceProxy, a2, a3, (uint64_t)v9);
  id v6 = (void *)v11[5];
  if (a4 && v6)
  {
    *a4 = v6;
    id v6 = (void *)v11[5];
  }
  BOOL v7 = v6 == 0;
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (BLServiceProxy)serviceProxy
{
  return self->_serviceProxy;
}

- (void).cxx_destruct
{
}

@end
@interface GEOConfigPersistence
+ (BOOL)_migrateDates:(id)a3 withConverter:(id)a4;
+ (BOOL)_setup:(id)a3;
- (GEOConfigPersistence)initWithDBPath:(id)a3;
- (id)_getExpiredKeyPathsOlderThanTime:(id)a3 osVersion:(id)a4;
- (id)_getExpiredKeyPathsOlderThanTime:(id)a3 osVersion:(id)a4 from:(id)a5;
- (id)defaultForKeyPath:(id)a3;
- (id)defaultForKeyPathComponents:(id)a3;
- (id)getAllExpiringKeys;
- (id)getExpireForKeyPath:(id)a3;
- (id)getExpiredKeyPathsOlderThanOSVersion:(id)a3;
- (id)getExpiredKeyPathsOlderThanTime:(id)a3;
- (id)xpcDefaultForKeyPath:(id)a3;
- (id)xpcDefaultForKeyPathComponents:(id)a3;
- (void)_pruneExpiredKeyPathsOlderThanTime:(id)a3 osVersion:(id)a4;
- (void)clearExpirationForKeyPath:(id)a3;
- (void)dealloc;
- (void)flush;
- (void)pruneExpiredKeyPathsOlderThanOSVersion:(id)a3;
- (void)pruneExpiredKeyPathsOlderThanTime:(id)a3;
- (void)setDefault:(id)a3 forKeyPath:(id)a4;
- (void)setExpire:(id)a3;
- (void)setXPCDefault:(id)a3 forKeyPath:(id)a4;
- (void)tearDown;
@end

@implementation GEOConfigPersistence

- (id)defaultForKeyPath:(id)a3
{
  v4 = GEOConfig_splitKeyPathComponents(a3);
  v5 = [(GEOConfigPersistence *)self defaultForKeyPathComponents:v4];

  return v5;
}

- (id)getExpireForKeyPath:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  keyExpiryCache = self->_keyExpiryCache;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__GEOConfigPersistence_getExpireForKeyPath___block_invoke;
  v9[3] = &unk_1E53D7AF0;
  v11 = &v12;
  id v6 = v4;
  id v10 = v6;
  [(_GEOConfigCache *)keyExpiryCache withCache:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)defaultForKeyPathComponents:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  configDB = self->_configDB;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__GEOConfigPersistence_defaultForKeyPathComponents___block_invoke;
  v9[3] = &unk_1E53D7CC8;
  id v6 = v4;
  id v10 = v6;
  v11 = &v12;
  [(_GEOConfigCache *)configDB withCache:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)xpcDefaultForKeyPath:(id)a3
{
  id v4 = GEOConfig_splitKeyPathComponents(a3);
  v5 = [(GEOConfigPersistence *)self xpcDefaultForKeyPathComponents:v4];

  return v5;
}

- (id)xpcDefaultForKeyPathComponents:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  xpcConfigDB = self->_xpcConfigDB;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__GEOConfigPersistence_xpcDefaultForKeyPathComponents___block_invoke;
  v9[3] = &unk_1E53D7CC8;
  id v6 = v4;
  id v10 = v6;
  v11 = &v12;
  [(_GEOConfigCache *)xpcConfigDB withCache:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __44__GEOConfigPersistence_getExpireForKeyPath___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __55__GEOConfigPersistence_xpcDefaultForKeyPathComponents___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  if ([*(id *)(a1 + 32) count])
  {
    _valueForKeyPath(v8, *(void **)(a1 + 32), 0, 0);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = v8;
  }
  uint64_t v4 = v3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = _geoDefaultsToDict(v4);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v4)
      {
        id v7 = [v4 value];
      }
      else
      {
        id v7 = 0;
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v7);
      if (!v4) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
    uint64_t v5 = _geoDefaultsToArray(v4);
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
LABEL_9:

LABEL_10:
}

void __52__GEOConfigPersistence_defaultForKeyPathComponents___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  if ([*(id *)(a1 + 32) count])
  {
    _valueForKeyPath(v8, *(void **)(a1 + 32), 0, 0);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = v8;
  }
  uint64_t v4 = v3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = _geoDefaultsToDict(v4);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v4)
      {
        id v7 = [v4 value];
      }
      else
      {
        id v7 = 0;
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v7);
      if (!v4) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
    uint64_t v5 = _geoDefaultsToArray(v4);
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
LABEL_9:

LABEL_10:
}

void __42__GEOConfigPersistence_getAllExpiringKeys__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)setDefault:(id)a3 forKeyPath:(id)a4
{
  configDB = self->_configDB;
  id v6 = a3;
  GEOConfig_splitKeyPathComponents(a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  _setDefault(configDB, v6, v7);
}

- (void)setXPCDefault:(id)a3 forKeyPath:(id)a4
{
  xpcConfigDB = self->_xpcConfigDB;
  id v6 = a3;
  GEOConfig_splitKeyPathComponents(a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  _setDefault(xpcConfigDB, v6, v7);
}

- (id)getAllExpiringKeys
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  id v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  keyExpiryCache = self->_keyExpiryCache;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__GEOConfigPersistence_getAllExpiringKeys__block_invoke;
  v5[3] = &unk_1E53D7B18;
  v5[4] = &v6;
  [(_GEOConfigCache *)keyExpiryCache withCache:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (GEOConfigPersistence)initWithDBPath:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)GEOConfigPersistence;
  uint64_t v5 = [(GEOConfigPersistence *)&v25 init];
  if (v5)
  {
    uint64_t v6 = j__GEOGetUserDefaultsLog();
    os_signpost_id_t v7 = os_signpost_id_generate(v6);

    objc_initWeak(&location, v5);
    uint64_t v8 = [GEOSQLiteDB alloc];
    v9 = j__GEOGetUserDefaultsLog();
    id v10 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v4];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __39__GEOConfigPersistence_initWithDBPath___block_invoke_2;
    v22[3] = &unk_1E53D7918;
    objc_copyWeak(&v23, &location);
    uint64_t v11 = [(GEOSQLiteDB *)v8 initWithQueueName:"com.apple.geo.ConfigPersistence" log:v9 databaseFileURL:v10 sqliteFlags:0x400000 pragmas:0 setupBlock:&__block_literal_global_0 tearDownBlock:v22];
    db = v5->_db;
    v5->_db = (GEOSQLiteDB *)v11;

    v13 = [[_GEOConfigDBOperationQueue alloc] init:v5->_db];
    operationQueue = v5->_operationQueue;
    v5->_operationQueue = v13;

    v15 = v5->_db;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __39__GEOConfigPersistence_initWithDBPath___block_invoke_3;
    v19[3] = &unk_1E53D79B0;
    os_signpost_id_t v21 = v7;
    v16 = v5;
    v20 = v16;
    [(GEOSQLiteDB *)v15 executeSync:v19];
    id v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 addObserver:v16 selector:sel_flush name:@"GEODaemonShouldTerminateNotification" object:0];

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v5;
}

BOOL __39__GEOConfigPersistence_initWithDBPath___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[GEOConfigPersistence _setup:a2];
}

void __39__GEOConfigPersistence_initWithDBPath___block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    [WeakRetained[5] flushOnDBQueue];
    WeakRetained = v2;
  }
}

void __39__GEOConfigPersistence_initWithDBPath___block_invoke_3(uint64_t a1)
{
  v2 = j__GEOGetUserDefaultsLog();
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_188D96000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v4, "ReadConfig", "table=defaults", buf, 2u);
  }

  uint64_t v5 = +[GEODefaultsDBDict dbValue:0];
  [v5 setDbId:0];
  uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
  [v6 setObject:v5 forKeyedSubscript:&unk_1ED73D570];
  os_signpost_id_t v7 = *(void **)(*(void *)(a1 + 32) + 8);
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __39__GEOConfigPersistence_initWithDBPath___block_invoke_138;
  v60[3] = &unk_1E53D7960;
  id v63 = &__block_literal_global_133;
  id v8 = v5;
  id v61 = v8;
  id v9 = v6;
  id v62 = v9;
  id v10 = v7;
  uint64_t v11 = v60;
  uint64_t v71 = 0;
  v72 = &v71;
  uint64_t v73 = 0x3032000000;
  v74 = __Block_byref_object_copy_;
  v75 = __Block_byref_object_dispose_;
  id v76 = 0;
  *(void *)buf = MEMORY[0x1E4F143A8];
  uint64_t v65 = 3221225472;
  v66 = __ListValues_block_invoke;
  v67 = &unk_1E53D7C78;
  id v12 = v10;
  id v68 = v12;
  v13 = v11;
  id v69 = v13;
  v70 = &v71;
  [v12 statementForKey:@"ListValues" statementBlock:buf];

  _Block_object_dispose(&v71, 8);
  id v14 = [[_GEOConfigDB alloc] init:*(void *)(*(void *)(a1 + 32) + 8) cache:v8 operationQueue:*(void *)(*(void *)(a1 + 32) + 40) clearFunction:ClearValue setFunction:SetValue addFunction:AddValue tableName:@"defaults"];
  uint64_t v15 = *(void *)(a1 + 32);
  v16 = *(void **)(v15 + 16);
  *(void *)(v15 + 16) = v14;

  id v17 = j__GEOGetUserDefaultsLog();
  v18 = v17;
  os_signpost_id_t v19 = *(void *)(a1 + 40);
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_188D96000, v18, OS_SIGNPOST_INTERVAL_END, v19, "ReadConfig", "table=defaults", buf, 2u);
  }

  v20 = j__GEOGetUserDefaultsLog();
  os_signpost_id_t v21 = v20;
  os_signpost_id_t v22 = *(void *)(a1 + 40);
  if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_188D96000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v22, "ReadConfig", "table=defaults_xpc", buf, 2u);
  }

  id v23 = +[GEODefaultsDBDict dbValue:0];
  [v23 setDbId:0];
  v24 = [MEMORY[0x1E4F1CA60] dictionary];
  [v24 setObject:v23 forKeyedSubscript:&unk_1ED73D570];
  objc_super v25 = *(void **)(*(void *)(a1 + 32) + 8);
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __39__GEOConfigPersistence_initWithDBPath___block_invoke_144;
  v56[3] = &unk_1E53D7960;
  id v59 = &__block_literal_global_133;
  id v26 = v23;
  id v57 = v26;
  id v27 = v24;
  id v58 = v27;
  id v28 = v25;
  v29 = v56;
  uint64_t v71 = 0;
  v72 = &v71;
  uint64_t v73 = 0x3032000000;
  v74 = __Block_byref_object_copy_;
  v75 = __Block_byref_object_dispose_;
  id v76 = 0;
  *(void *)buf = MEMORY[0x1E4F143A8];
  uint64_t v65 = 3221225472;
  v66 = __ListXPCValues_block_invoke;
  v67 = &unk_1E53D7C78;
  id v30 = v28;
  id v68 = v30;
  v31 = v29;
  id v69 = v31;
  v70 = &v71;
  [v30 statementForKey:@"ListXPCValues" statementBlock:buf];

  _Block_object_dispose(&v71, 8);
  id v32 = [[_GEOConfigDB alloc] init:*(void *)(*(void *)(a1 + 32) + 8) cache:v26 operationQueue:*(void *)(*(void *)(a1 + 32) + 40) clearFunction:ClearXPCValue setFunction:SetXPCValue addFunction:AddXPCValue tableName:@"defaults_xpc"];
  uint64_t v33 = *(void *)(a1 + 32);
  v34 = *(void **)(v33 + 24);
  *(void *)(v33 + 24) = v32;

  v35 = j__GEOGetUserDefaultsLog();
  v36 = v35;
  os_signpost_id_t v37 = *(void *)(a1 + 40);
  if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_188D96000, v36, OS_SIGNPOST_INTERVAL_END, v37, "ReadConfig", "table=defaults_xpc", buf, 2u);
  }

  v38 = j__GEOGetUserDefaultsLog();
  v39 = v38;
  os_signpost_id_t v40 = *(void *)(a1 + 40);
  if (v40 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_188D96000, v39, OS_SIGNPOST_INTERVAL_BEGIN, v40, "ReadConfig", "table=key_expiry", buf, 2u);
  }

  v41 = [MEMORY[0x1E4F1CA60] dictionary];
  v42 = *(void **)(*(void *)(a1 + 32) + 8);
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __39__GEOConfigPersistence_initWithDBPath___block_invoke_148;
  v54[3] = &unk_1E53D7988;
  id v43 = v41;
  id v55 = v43;
  id v44 = v42;
  v45 = v54;
  uint64_t v71 = 0;
  v72 = &v71;
  uint64_t v73 = 0x3032000000;
  v74 = __Block_byref_object_copy_;
  v75 = __Block_byref_object_dispose_;
  id v76 = 0;
  *(void *)buf = MEMORY[0x1E4F143A8];
  uint64_t v65 = 3221225472;
  v66 = __GetAllExpired_block_invoke;
  v67 = &unk_1E53D7C78;
  id v46 = v44;
  id v68 = v46;
  v47 = v45;
  id v69 = v47;
  v70 = &v71;
  [v46 statementForKey:@"GetAllExpired" statementBlock:buf];

  _Block_object_dispose(&v71, 8);
  id v48 = [[_GEOConfigCache alloc] init:v43];
  uint64_t v49 = *(void *)(a1 + 32);
  v50 = *(void **)(v49 + 32);
  *(void *)(v49 + 32) = v48;

  v51 = j__GEOGetUserDefaultsLog();
  v52 = v51;
  os_signpost_id_t v53 = *(void *)(a1 + 40);
  if (v53 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v51))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_188D96000, v52, OS_SIGNPOST_INTERVAL_END, v53, "ReadConfig", "table=key_expiry", buf, 2u);
  }
}

void __39__GEOConfigPersistence_initWithDBPath___block_invoke_4(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (a4)
  {
    id v17 = [NSNumber numberWithLongLong:a8];
    v18 = [v13 objectForKeyedSubscript:v17];

    if (!v18)
    {
      v20 = j__GEOGetUserDefaultsLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218498;
        *(void *)&buf[4] = a8;
        __int16 v31 = 2112;
        id v32 = v14;
        __int16 v33 = 2048;
        uint64_t v34 = a4;
        _os_log_impl(&dword_188D96000, v20, OS_LOG_TYPE_ERROR, "Could not find parent %lld for key %@ (%lld)", buf, 0x20u);
      }
      goto LABEL_17;
    }
    if ([v15 isEqualToString:@"dict"])
    {
      os_signpost_id_t v19 = GEODefaultsDBDict;
LABEL_9:
      v20 = [(__objc2_class *)v19 dbValue:v18];
      os_signpost_id_t v21 = [NSNumber numberWithLongLong:a4];
      [v13 setObject:v20 forKeyedSubscript:v21];

LABEL_16:
      [v20 setDbId:a4];
      [v18 setObject:v20 forKeyedSubscript:v14];
LABEL_17:

      goto LABEL_18;
    }
    if ([v15 isEqualToString:@"arr"])
    {
      os_signpost_id_t v19 = GEODefaultsDBArray;
      goto LABEL_9;
    }
    id v22 = v16;
    id v23 = v15;
    if ([v23 isEqualToString:@"nil"])
    {
      id v24 = [MEMORY[0x1E4F1CA98] null];
LABEL_14:
      objc_super v25 = v24;
LABEL_15:

      v20 = +[GEODefaultsDBValue dbValue:v18 type:v23 value:v25];

      goto LABEL_16;
    }
    if ([v23 isEqualToString:@"str"])
    {
      id v24 = v22;
      goto LABEL_14;
    }
    if ([v23 isEqualToString:@"int"])
    {
      id v26 = [MEMORY[0x1E4F28FE8] scannerWithString:v22];
      if ([v22 containsString:@"-"])
      {
        *(void *)buf = 0;
        if (objc_msgSend(v26, "scanLongLong:", buf, v26))
        {
          uint64_t v27 = [NSNumber numberWithLongLong:*(void *)buf];
          goto LABEL_28;
        }
      }
      else
      {
        *(void *)buf = 0;
        if (objc_msgSend(v26, "scanUnsignedLongLong:", buf, v26))
        {
          uint64_t v27 = [NSNumber numberWithUnsignedLongLong:*(void *)buf];
          goto LABEL_28;
        }
      }
      objc_super v25 = 0;
      goto LABEL_34;
    }
    if (![v23 isEqualToString:@"dbl"])
    {
      if ([v23 isEqualToString:@"date"])
      {
        id v28 = [MEMORY[0x1E4F28FE8] scannerWithString:v22];
        *(void *)buf = 0;
        objc_super v25 = 0;
        if ([v28 scanDouble:buf])
        {
          objc_super v25 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:*(double *)buf];
        }

        goto LABEL_15;
      }
      if (![v23 isEqualToString:@"bytes"])
      {
        objc_super v25 = 0;
        goto LABEL_15;
      }
      id v24 = (id)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v22 options:0];
      goto LABEL_14;
    }
    [MEMORY[0x1E4F28FE8] scannerWithString:v22];
    v29 = *(void *)buf = 0;
    objc_super v25 = 0;
    if (![v29 scanDouble:buf])
    {
LABEL_34:

      goto LABEL_15;
    }
    uint64_t v27 = [NSNumber numberWithDouble:*(double *)buf];
LABEL_28:
    objc_super v25 = (void *)v27;
    goto LABEL_34;
  }
LABEL_18:
}

uint64_t __39__GEOConfigPersistence_initWithDBPath___block_invoke_138(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return 1;
}

uint64_t __39__GEOConfigPersistence_initWithDBPath___block_invoke_144(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return 1;
}

uint64_t __39__GEOConfigPersistence_initWithDBPath___block_invoke_148(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  if (a3 < 1
    || ([MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)a3],
        (id v9 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if ([v8 length])
    {
      id v9 = 0;
    }
    else
    {
      id v9 = [MEMORY[0x1E4F1C9C8] distantPast];
    }
  }
  id v10 = +[GEOConfigExpiringKey expiringKey:v7 withTime:v9 osVersion:v8];
  [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:v7];

  return 1;
}

- (void)flush
{
}

- (void)tearDown
{
  [(_GEOConfigDBOperationQueue *)self->_operationQueue flush];
  db = self->_db;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__GEOConfigPersistence_tearDown__block_invoke;
  v5[3] = &unk_1E53D79D8;
  v5[4] = self;
  [(GEOSQLiteDB *)db executeSync:v5];
  os_signpost_id_t v4 = self->_db;
  self->_db = 0;
}

uint64_t __32__GEOConfigPersistence_tearDown__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) tearDown];
}

- (void)dealloc
{
  [(GEOConfigPersistence *)self tearDown];
  v3.receiver = self;
  v3.super_class = (Class)GEOConfigPersistence;
  [(GEOConfigPersistence *)&v3 dealloc];
}

+ (BOOL)_migrateDates:(id)a3 withConverter:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  int v7 = objc_msgSend(v5, "prepareStatement:forKey:", "SELECT rowid, key, value FROM defaults WHERE type = 'date'", @"find_dates");
  int v8 = [v5 prepareStatement:"UPDATE defaults SET value = @value WHERE rowid = @rowid " forKey:@"update_date"];
  int v9 = objc_msgSend(v5, "prepareStatement:forKey:", "DELETE FROM defaults    WHERE rowid = @rowid;",
         @"delete_date");
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __52__GEOConfigPersistence__migrateDates_withConverter___block_invoke;
  v27[3] = &unk_1E53D7A00;
  char v29 = v7;
  id v10 = v5;
  id v28 = v10;
  char v30 = v8;
  char v31 = v9;
  uint64_t v11 = MEMORY[0x18C120660](v27);
  id v12 = (void (**)(void))v11;
  if (v7 & v8 & v9)
  {
    uint64_t v21 = 0;
    id v22 = &v21;
    uint64_t v23 = 0x3032000000;
    id v24 = __Block_byref_object_copy_;
    objc_super v25 = __Block_byref_object_dispose_;
    id v26 = 0;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __52__GEOConfigPersistence__migrateDates_withConverter___block_invoke_171;
    v17[3] = &unk_1E53D7A78;
    v20 = &v21;
    id v18 = v10;
    id v19 = v6;
    char v13 = [v18 statementForKey:@"find_dates" statementBlock:v17];
    if (v22[5])
    {
      id v14 = j__GEOGetUserDefaultsLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = v22[5];
        *(_DWORD *)buf = 138543362;
        uint64_t v33 = v15;
        _os_log_impl(&dword_188D96000, v14, OS_LOG_TYPE_ERROR, "Got error during date migration: %{public}@", buf, 0xCu);
      }
    }
    v12[2](v12);

    _Block_object_dispose(&v21, 8);
  }
  else
  {
    (*(void (**)(uint64_t))(v11 + 16))(v11);
    char v13 = 0;
  }

  return v13;
}

uint64_t __52__GEOConfigPersistence__migrateDates_withConverter___block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  if (*(unsigned char *)(result + 40)) {
    result = [*(id *)(result + 32) clearStatement:@"find_dates"];
  }
  if (*(unsigned char *)(v1 + 41)) {
    result = [*(id *)(v1 + 32) clearStatement:@"update_date"];
  }
  if (*(unsigned char *)(v1 + 42))
  {
    v2 = *(void **)(v1 + 32);
    return [v2 clearStatement:@"delete_date"];
  }
  return result;
}

BOOL __52__GEOConfigPersistence__migrateDates_withConverter___block_invoke_171(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = sqlite3_step(a2);
  if (v4 == 100)
  {
    while (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      uint64_t v5 = [*(id *)(a1 + 32) int64ForColumn:0 inStatment:a2];
      id v6 = [*(id *)(a1 + 32) stringForColumn:1 inStatment:a2];
      int v7 = [*(id *)(a1 + 32) stringForColumn:2 inStatment:a2];
      int v8 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      if (v8)
      {
        int v9 = *(void **)(a1 + 32);
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __52__GEOConfigPersistence__migrateDates_withConverter___block_invoke_2;
        v25[3] = &unk_1E53D7A28;
        id v10 = v9;
        uint64_t v11 = *(void *)(a1 + 48);
        id v26 = v10;
        uint64_t v28 = v11;
        uint64_t v29 = v5;
        id v27 = v8;
        [v10 executeStatement:@"update_date" statementBlock:v25];

        id v12 = &v26;
      }
      else
      {
        char v13 = j__GEOGetUserDefaultsLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          char v31 = v7;
          __int16 v32 = 2112;
          uint64_t v33 = v6;
          _os_log_impl(&dword_188D96000, v13, OS_LOG_TYPE_ERROR, "Unable to parse date \"%{public}@\" for key %{publid}@, deleting instead.", buf, 0x16u);
        }

        id v14 = *(void **)(a1 + 32);
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __52__GEOConfigPersistence__migrateDates_withConverter___block_invoke_175;
        v23[3] = &unk_1E53D7A50;
        id v15 = v14;
        uint64_t v16 = *(void *)(a1 + 48);
        v24[0] = v15;
        v24[1] = v16;
        v24[2] = v5;
        [v15 executeStatement:@"delete_date" statementBlock:v23];
        id v12 = (id *)v24;
      }

      uint64_t v4 = sqlite3_step(a2);
      if (v4 != 100) {
        goto LABEL_11;
      }
    }
    uint64_t v4 = 100;
  }
LABEL_11:
  if (v4 != 101)
  {
    uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v19 = *(void *)(v17 + 40);
    id v18 = (id *)(v17 + 40);
    if (!v19)
    {
      v20 = *(void **)(a1 + 32);
      id obj = 0;
      [v20 reportSQLiteErrorCode:v4 method:@"step" error:&obj];
      objc_storeStrong(v18, obj);
    }
  }
  return v4 == 101;
}

uint64_t __52__GEOConfigPersistence__migrateDates_withConverter___block_invoke_2(void *a1, uint64_t a2)
{
  uint64_t v4 = (void *)a1[4];
  uint64_t v5 = a1[7];
  uint64_t v6 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v6 + 40);
  int v7 = [v4 bindInt64Parameter:"@rowid" toValue:v5 inStatement:a2 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  if (!v7) {
    return 0;
  }
  int v8 = (void *)a1[4];
  uint64_t v9 = a1[5];
  uint64_t v10 = *(void *)(a1[6] + 8);
  id v13 = *(id *)(v10 + 40);
  uint64_t v11 = [v8 bindTextParameter:"@value" toValue:v9 inStatement:a2 error:&v13];
  objc_storeStrong((id *)(v10 + 40), v13);
  return v11;
}

uint64_t __52__GEOConfigPersistence__migrateDates_withConverter___block_invoke_175(void *a1, uint64_t a2)
{
  uint64_t v2 = a1[6];
  objc_super v3 = (void *)a1[4];
  uint64_t v4 = *(void *)(a1[5] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v3 bindInt64Parameter:"@rowid" toValue:v2 inStatement:a2 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  return v5;
}

+ (BOOL)_setup:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v4, "user_version");
  uint64_t v6 = v5;
  if ((unint64_t)(v5 - 1) < 2) {
    goto LABEL_5;
  }
  int v7 = 0;
  if (v5 == 3) {
    goto LABEL_7;
  }
  if (!v5)
  {
    sqlite3_exec((sqlite3 *)[v4 sqliteDB], "DROP TABLE defaults_from_companion", 0, 0, 0);
LABEL_5:
    *(void *)buf = 0;
    *(void *)&long long v26 = buf;
    *((void *)&v26 + 1) = 0x3032000000;
    id v27 = __Block_byref_object_copy_;
    uint64_t v28 = __Block_byref_object_dispose_;
    id v29 = 0;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __31__GEOConfigPersistence__setup___block_invoke;
    void v24[3] = &unk_1E53D7AA0;
    v24[4] = buf;
    v24[5] = v6;
    int v8 = [a1 _migrateDates:v4 withConverter:v24];
    _Block_object_dispose(buf, 8);

    int v7 = v8 ^ 1;
  }
  objc_msgSend(v4, "setUser_version:", 3);
LABEL_7:
  uint64_t v9 = j__GEOGetUserDefaultsLog();
  id v10 = v4;
  uint64_t v11 = v10;
  if (v7) {
    id v12 = "DROP TABLE defaults";
  }
  else {
    id v12 = 0;
  }
  if (!objc_msgSend(v10, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS defaults(   rowid INTEGER PRIMARY KEY NOT NULL,    key TEXT NOT NULL,    parent INT REFERENCES defaults(rowid) ON UPDATE CASCADE ON DELETE CASCADE,    type TEXT NOT NULL,    value TEXT,    UNIQUE(key, parent)   );",
                        v12)
    || (!v7 ? (id v13 = 0) : (id v13 = "DROP TABLE defaults_xpc"),
        !objc_msgSend(v11, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS defaults_xpc(   rowid INTEGER PRIMARY KEY NOT NULL,    key TEXT NOT NULL,    parent INT REFERENCES defaults_xpc(rowid) ON UPDATE CASCADE ON DELETE CASCADE,    type TEXT NOT NULL,    value TEXT,    UNIQUE(key, parent)   );",
                         v13)
     || (!v7 ? (id v14 = 0) : (id v14 = "DROP TABLE defaults_from_companion"),
         !objc_msgSend(v11, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS defaults_from_companion(   rowid INTEGER PRIMARY KEY NOT NULL,    key TEXT NOT NULL,    parent INT REFERENCES defaults_from_companion(rowid) ON UPDATE CASCADE ON DELETE CASCADE,    type TEXT NOT NULL,    value TEXT,    UNIQUE(key, parent)   );",
                          v14)
      || (!v7 ? (id v15 = 0) : (id v15 = "DROP TABLE auto_expire"),
          !objc_msgSend(v11, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS auto_expire(   key_path TEXT PRIMARY KEY NOT NULL,    expire_time INT,    expire_os_version TEXT   );",
                           v15)
       || !objc_msgSend(v11, "prepareStatement:forKey:", "INSERT INTO defaults    (rowid, key, parent, type, value)    VALUES (@rowid, @key, @parent, @type, @value);",
                           @"AddValue")
       || !objc_msgSend(v11, "prepareStatement:forKey:", "UPDATE defaults    SET type = @type, value = @value    WHERE rowid = @rowid;",
                           @"SetValue")
       || !objc_msgSend(v11, "prepareStatement:forKey:", "DELETE FROM defaults    WHERE rowid = @rowid;",
                           @"ClearValue")
       || !objc_msgSend(v11, "prepareStatement:forKey:", "SELECT rowid, key, type, value, parent    FROM defaults    ORDER BY parent, rowid;",
                           @"ListValues")
       || !objc_msgSend(v11, "prepareStatement:forKey:", "INSERT INTO defaults_xpc    (rowid, key, parent, type, value)    VALUES (@rowid, @key, @parent, @type, @value);",
                           @"AddXPCValue")
       || !objc_msgSend(v11, "prepareStatement:forKey:", "UPDATE defaults_xpc    SET type = @type, value = @value    WHERE rowid = @rowid;",
                           @"SetXPCValue")
       || !objc_msgSend(v11, "prepareStatement:forKey:", "DELETE FROM defaults_xpc    WHERE rowid = @rowid;",
                           @"ClearXPCValue")
       || !objc_msgSend(v11, "prepareStatement:forKey:", "SELECT rowid, key, type, value, parent    FROM defaults_xpc    ORDER BY parent, rowid;",
                           @"ListXPCValues")
       || !objc_msgSend(v11, "prepareStatement:forKey:", "INSERT INTO defaults_from_companion    (rowid, key, parent, type, value)    VALUES (@rowid, @key, @parent, @type, @value);",
                           @"AddCompanionValue")
       || !objc_msgSend(v11, "prepareStatement:forKey:", "UPDATE defaults_from_companion    SET type = @type, value = @value    WHERE rowid = @rowid;",
                           @"SetCompanionValue")
       || !objc_msgSend(v11, "prepareStatement:forKey:", "DELETE FROM defaults_from_companion    WHERE rowid = @rowid;",
                           @"ClearCompanionValue")
       || !objc_msgSend(v11, "prepareStatement:forKey:", "SELECT rowid, key, type, value, parent    FROM defaults_from_companion    ORDER BY parent, rowid;",
                           @"ListCompanionValues")
       || !objc_msgSend(v11, "prepareStatement:forKey:", "INSERT OR REPLACE INTO auto_expire    (key_path, expire_time, expire_os_version)    VALUES (@key_path, @expire_time, @expire_os_version);",
                           @"SetExpire")
       || (objc_msgSend(v11, "prepareStatement:forKey:", "DELETE FROM auto_expire    WHERE key_path = @key_path;",
             @"ClearExpireForKey") & 1) == 0))))
  {

    goto LABEL_42;
  }
  int v16 = objc_msgSend(v11, "prepareStatement:forKey:", "SELECT key_path, expire_time, expire_os_version    FROM auto_expire;",
          @"GetAllExpired");

  if (!v16)
  {
LABEL_42:
    BOOL v19 = 0;
    goto LABEL_43;
  }
  errmsg = 0;
  int v17 = sqlite3_exec((sqlite3 *)[v11 sqliteDB], "INSERT OR IGNORE INTO defaults (rowid, key, type, value, parent)  VALUES(0, 'root', 'dict', NULL, 0)", 0, 0, &errmsg);
  if (v17)
  {
    id v18 = j__GEOGetUserDefaultsLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&uint8_t buf[4] = v17;
      LOWORD(v26) = 2080;
      *(void *)((char *)&v26 + 2) = errmsg;
      _os_log_impl(&dword_188D96000, v18, OS_LOG_TYPE_ERROR, "Unable to create root node in defaults table %d: %s", buf, 0x12u);
    }

    goto LABEL_42;
  }
  errmsg = 0;
  int v21 = sqlite3_exec((sqlite3 *)[v11 sqliteDB], "INSERT OR IGNORE INTO defaults_xpc (rowid, key, type, value, parent)  VALUES(0, 'root', 'dict', NULL, 0)", 0, 0, &errmsg);
  BOOL v19 = v21 == 0;
  if (v21)
  {
    id v22 = j__GEOGetUserDefaultsLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&uint8_t buf[4] = v21;
      LOWORD(v26) = 2080;
      *(void *)((char *)&v26 + 2) = errmsg;
      _os_log_impl(&dword_188D96000, v22, OS_LOG_TYPE_ERROR, "Unable to create root node in defaults_xpc table %d: %s", buf, 0x12u);
    }
  }
LABEL_43:

  return v19;
}

id __31__GEOConfigPersistence__setup___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    if (*(uint64_t *)(a1 + 40) > 1)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F28D48]);
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;
    }
    else
    {
      id v4 = objc_alloc_init(MEMORY[0x1E4F28C10]);
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v6 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = v4;

      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setDateFormat:@"yyyy.MM.dd HH:mm:ss Z"];
    }
  }
  id v10 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) dateFromString:v3];
  uint64_t v11 = v10;
  if (v10)
  {
    id v12 = NSNumber;
    [v10 timeIntervalSinceReferenceDate];
    id v13 = objc_msgSend(v12, "numberWithDouble:");
    id v14 = [v13 stringValue];
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (void)setExpire:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    keyExpiryCache = self->_keyExpiryCache;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __34__GEOConfigPersistence_setExpire___block_invoke;
    v10[3] = &unk_1E53D7AC8;
    id v7 = v4;
    id v11 = v7;
    [(_GEOConfigCache *)keyExpiryCache withCache:v10];
    operationQueue = self->_operationQueue;
    id v9 = [[_GEOConfigDBUpdateExpireOperation alloc] init:self->_db expire:v7];
    [(_GEOConfigDBOperationQueue *)operationQueue enqueueOperation:v9];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: expire != ((void *)0)", buf, 2u);
  }
}

void __34__GEOConfigPersistence_setExpire___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 keyPath];
  [v3 setObject:v2 forKeyedSubscript:v4];
}

- (void)clearExpirationForKeyPath:(id)a3
{
  id v4 = a3;
  keyExpiryCache = self->_keyExpiryCache;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__GEOConfigPersistence_clearExpirationForKeyPath___block_invoke;
  v9[3] = &unk_1E53D7AC8;
  id v10 = v4;
  id v6 = v4;
  [(_GEOConfigCache *)keyExpiryCache withCache:v9];
  operationQueue = self->_operationQueue;
  id v8 = [[_GEOConfigDBClearExpireOperation alloc] init:self->_db keyPath:v6];
  [(_GEOConfigDBOperationQueue *)operationQueue enqueueOperation:v8];
}

uint64_t __50__GEOConfigPersistence_clearExpirationForKeyPath___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setObject:0 forKeyedSubscript:*(void *)(a1 + 32)];
}

- (id)_getExpiredKeyPathsOlderThanTime:(id)a3 osVersion:(id)a4 from:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (__CFString *)a4;
  id v9 = a5;
  if (v7) {
    goto LABEL_4;
  }
  if ([(__CFString *)v8 length])
  {
    id v7 = [MEMORY[0x1E4F1C9C8] distantFuture];
LABEL_4:
    uint64_t v10 = [(__CFString *)v8 length];
    id v11 = @"9999Z999999z";
    if (v10) {
      id v11 = v8;
    }
    id v12 = v11;

    id v13 = [MEMORY[0x1E4F1CA48] array];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v14 = objc_msgSend(v9, "allValues", 0);
    uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v23 != v17) {
            objc_enumerationMutation(v14);
          }
          BOOL v19 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if ([v19 _isExpiredRelativeTo:v7 osVersion:v12])
          {
            v20 = [v19 keyPath];
            [v13 addObject:v20];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v16);
    }

    goto LABEL_16;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: date != ((void *)0) || osVersion.length > 0", buf, 2u);
  }
  id v13 = (void *)MEMORY[0x1E4F1CBF0];
  id v12 = v8;
LABEL_16:

  return v13;
}

- (id)_getExpiredKeyPathsOlderThanTime:(id)a3 osVersion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  int v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  keyExpiryCache = self->_keyExpiryCache;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__GEOConfigPersistence__getExpiredKeyPathsOlderThanTime_osVersion___block_invoke;
  v13[3] = &unk_1E53D7B40;
  uint64_t v16 = &v17;
  v13[4] = self;
  id v9 = v6;
  id v14 = v9;
  id v10 = v7;
  id v15 = v10;
  [(_GEOConfigCache *)keyExpiryCache withCache:v13];
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);

  return v11;
}

void __67__GEOConfigPersistence__getExpiredKeyPathsOlderThanTime_osVersion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) _getExpiredKeyPathsOlderThanTime:*(void *)(a1 + 40) osVersion:*(void *)(a1 + 48) from:a2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)_pruneExpiredKeyPathsOlderThanTime:(id)a3 osVersion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  keyExpiryCache = self->_keyExpiryCache;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__GEOConfigPersistence__pruneExpiredKeyPathsOlderThanTime_osVersion___block_invoke;
  v11[3] = &unk_1E53D7B68;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(_GEOConfigCache *)keyExpiryCache withCache:v11];
}

void __69__GEOConfigPersistence__pruneExpiredKeyPathsOlderThanTime_osVersion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) _getExpiredKeyPathsOlderThanTime:*(void *)(a1 + 40) osVersion:*(void *)(a1 + 48) from:v3];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        [v3 setObject:0 forKeyedSubscript:v9];
        id v10 = *(void **)(*(void *)(a1 + 32) + 40);
        id v11 = [[_GEOConfigDBClearExpireOperation alloc] init:*(void *)(*(void *)(a1 + 32) + 8) keyPath:v9];
        [v10 enqueueOperation:v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (id)getExpiredKeyPathsOlderThanTime:(id)a3
{
  return [(GEOConfigPersistence *)self _getExpiredKeyPathsOlderThanTime:a3 osVersion:0];
}

- (void)pruneExpiredKeyPathsOlderThanTime:(id)a3
{
}

- (id)getExpiredKeyPathsOlderThanOSVersion:(id)a3
{
  id v4 = a3;
  if (![v4 length])
  {
    uint64_t v5 = +[GEOPlatform sharedPlatform];
    uint64_t v6 = [v5 buildVersion];

    id v4 = (id)v6;
  }
  uint64_t v7 = [(GEOConfigPersistence *)self _getExpiredKeyPathsOlderThanTime:0 osVersion:v4];

  return v7;
}

- (void)pruneExpiredKeyPathsOlderThanOSVersion:(id)a3
{
  id v7 = a3;
  if ([v7 length])
  {
    id v4 = v7;
  }
  else
  {
    uint64_t v5 = +[GEOPlatform sharedPlatform];
    uint64_t v6 = [v5 buildVersion];

    id v4 = (id)v6;
  }
  id v8 = v4;
  [(GEOConfigPersistence *)self _pruneExpiredKeyPathsOlderThanTime:0 osVersion:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_keyExpiryCache, 0);
  objc_storeStrong((id *)&self->_xpcConfigDB, 0);
  objc_storeStrong((id *)&self->_configDB, 0);

  objc_storeStrong((id *)&self->_db, 0);
}

@end
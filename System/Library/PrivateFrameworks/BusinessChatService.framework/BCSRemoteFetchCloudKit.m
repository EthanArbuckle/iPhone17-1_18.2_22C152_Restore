@interface BCSRemoteFetchCloudKit
- (BCSICloudServerEnvironmentProtocol)environment;
- (BCSRemoteFetchCloudKit)initWithEnvironment:(id)a3 database:(id)a4 databaseContainer:(id)a5 queryOperationFactory:(id)a6 coalesceHelper:(id)a7 bloomFilterExtractor:(id)a8 operationGroupFactory:(id)a9 metricFactory:(id)a10;
- (NSString)debugDescription;
- (id)_queryOperationForQuery:(void *)a3 clientBundleID:(void *)a4 systemTask:(void *)a5 requestSpecificAdditionalHTTPHeaders:(uint64_t)a6 type:(void *)a7 singleFetchCompletion:;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)shardItemFromURL:(id)a3 type:(int64_t)a4;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_configureOperationForQuery:(void *)a3 clientBundleID:(void *)a4 systemTask:(void *)a5 requestSpecificAdditionalHTTPHeaders:(uint64_t)a6 type:;
- (void)fetchConfigItemWithType:(int64_t)a3 clientBundleID:(id)a4 completion:(id)a5;
- (void)fetchConfigItemWithType:(int64_t)a3 clientBundleID:(id)a4 systemTask:(id)a5 completion:(id)a6;
- (void)fetchItemsWithBucketStartIndex:(int64_t)a3 endIndex:(int64_t)a4 type:(int64_t)a5 forClientBundleID:(id)a6 completion:(id)a7;
- (void)fetchMegashardItemWithType:(int64_t)a3 clientBundleID:(id)a4 completion:(id)a5;
- (void)fetchMegashardItemWithType:(int64_t)a3 clientBundleID:(id)a4 systemTask:(id)a5 completion:(id)a6;
- (void)fetchShardMatching:(id)a3 clientBundleID:(id)a4 completion:(id)a5;
@end

@implementation BCSRemoteFetchCloudKit

- (BCSRemoteFetchCloudKit)initWithEnvironment:(id)a3 database:(id)a4 databaseContainer:(id)a5 queryOperationFactory:(id)a6 coalesceHelper:(id)a7 bloomFilterExtractor:(id)a8 operationGroupFactory:(id)a9 metricFactory:(id)a10
{
  id v44 = a10;
  id v43 = a9;
  id v41 = a8;
  id v42 = a8;
  id v40 = a7;
  id v17 = a7;
  id v39 = a6;
  id v18 = a6;
  id v38 = a5;
  id v19 = a5;
  id v37 = a4;
  id v20 = a4;
  id obj = a3;
  id v21 = a3;
  v22 = objc_alloc_init(BCSCloudKitQueryProvider);
  id v23 = v21;
  id v24 = v20;
  id v45 = v19;
  v25 = v22;
  id v26 = v18;
  id v27 = v17;
  id v28 = v42;
  id v29 = v43;
  id v30 = v44;
  if (self)
  {
    v46.receiver = self;
    v46.super_class = (Class)BCSRemoteFetchCloudKit;
    v31 = [(BCSRemoteFetchCloudKit *)&v46 init];
    self = v31;
    if (v31)
    {
      objc_storeStrong((id *)&v31->_environment, obj);
      objc_storeStrong((id *)&self->_database, v37);
      objc_storeStrong((id *)&self->_databaseContainer, v38);
      objc_storeStrong((id *)&self->_queryProvider, v22);
      objc_storeStrong((id *)&self->_queryOperationFactory, v39);
      objc_storeStrong((id *)&self->_coalesceHelper, v40);
      objc_storeStrong((id *)&self->_bloomFilterExtractor, v41);
      objc_storeStrong((id *)&self->_operationGroupFactory, a9);
      objc_storeStrong((id *)&self->_metricFactory, a10);
    }
  }

  v32 = self;
  v33 = v25;
  v34 = v32;

  return v34;
}

- (NSString)debugDescription
{
  return (NSString *)[(BCSRemoteFetchCloudKit *)self descriptionWithMultilinePrefix:0];
}

- (void)fetchConfigItemWithType:(int64_t)a3 clientBundleID:(id)a4 completion:(id)a5
{
}

- (void)fetchConfigItemWithType:(int64_t)a3 clientBundleID:(id)a4 systemTask:(id)a5 completion:(id)a6
{
  v60[1] = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  v12 = (void (**)(id, void, void *))a6;
  v13 = ABSLogCommon();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = "-[BCSRemoteFetchCloudKit fetchConfigItemWithType:clientBundleID:systemTask:completion:]";
    _os_log_debug_impl(&dword_2154F4000, v13, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  if (v12)
  {
    unsigned __int8 v56 = 0;
    v14 = objc_msgSend(NSString, "stringWithFormat:", @"cloudkit_config_fetch_type_%ld", a3);
    v15 = [[BCSCoalesceObjectConfig alloc] initWithCompletionBlock:v12 coalesceKey:v14];
    if (v11
      && (!self ? (v16 = 0) : (v16 = self->_coalesceHelper),
          [(BCSCoalesceHelperProtocol *)v16 isDuplicateRequest:v15]))
    {
      id v17 = ABSLogCommon();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&buf[4] = "-[BCSRemoteFetchCloudKit fetchConfigItemWithType:clientBundleID:systemTask:completion:]";
        _os_log_impl(&dword_2154F4000, v17, OS_LOG_TYPE_DEFAULT, "New request is a scheduled duplicate and already in progress:%s", buf, 0xCu);
      }

      uint64_t v57 = *MEMORY[0x263F08320];
      v58 = @"Request is a scheduled duplicate and already in progress";
      id v18 = [NSDictionary dictionaryWithObjects:&v58 forKeys:&v57 count:1];
      id v19 = +[BCSError errorWithDomain:@"com.apple.businessservices" code:42 userInfo:v18];
      v12[2](v12, 0, v19);
    }
    else
    {
      if (self) {
        coalesceHelper = self->_coalesceHelper;
      }
      else {
        coalesceHelper = 0;
      }
      [(BCSCoalesceHelperProtocol *)coalesceHelper enqueueCoalesceObject:v15 isDuplicateRequest:&v56];
      int v21 = v56;
      v22 = ABSLogCommon();
      id v18 = v22;
      if (v21)
      {
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)&buf[4] = "-[BCSRemoteFetchCloudKit fetchConfigItemWithType:clientBundleID:systemTask:completion:]";
          _os_log_impl(&dword_2154F4000, v18, OS_LOG_TYPE_DEFAULT, "New request is duplicate and already in progress:%s", buf, 0xCu);
        }
      }
      else
      {
        v47 = v10;
        os_signpost_id_t v23 = os_signpost_id_generate(v22);

        objc_super v46 = v14;
        if (self) {
          metricFactory = self->_metricFactory;
        }
        else {
          metricFactory = 0;
        }
        v25 = metricFactory;
        id v26 = [(BCSMetricFactoryProtocol *)v25 measurementFactory];
        id v27 = [(BCSRemoteFetchCloudKit *)self environment];
        id v28 = objc_msgSend(v26, "configCloudKitFetchAndDecodeTimingMeasurementForType:identifier:", objc_msgSend(v27, "type"), v23);

        [v28 begin];
        v52[0] = MEMORY[0x263EF8330];
        v52[1] = 3221225472;
        v52[2] = __87__BCSRemoteFetchCloudKit_fetchConfigItemWithType_clientBundleID_systemTask_completion___block_invoke;
        v52[3] = &unk_264249E60;
        id v18 = v28;
        v53 = v18;
        v54 = self;
        id v55 = v46;
        id v44 = (void *)MEMORY[0x2166BDB40](v52);
        if (self) {
          id v29 = self->_metricFactory;
        }
        else {
          id v29 = 0;
        }
        id v30 = v29;
        v31 = [(BCSMetricFactoryProtocol *)v30 measurementFactory];
        v32 = [(BCSRemoteFetchCloudKit *)self environment];
        v33 = objc_msgSend(v31, "configCloudKitFetchTimingMeasurementForType:identifier:", objc_msgSend(v32, "type"), v23);

        [v33 begin];
        if (self) {
          queryProvider = self->_queryProvider;
        }
        else {
          queryProvider = 0;
        }
        v35 = [(BCSCloudKitQueryProviding *)queryProvider queryForFetchConfigItemWithType:a3];
        id v45 = v15;
        if (self)
        {
          switch(a3)
          {
            case 1:
              v60[0] = @"X-CloudKit-BusinessChat-QueryName";
              v36 = @"ChatSuggestConfig";
              break;
            case 2:
              v60[0] = @"X-CloudKit-BusinessLink-QueryName";
              v36 = @"DomainLinkConfig";
              break;
            case 3:
              v60[0] = @"X-CloudKit-BusinessCaller-QueryName";
              v36 = @"CallerIdConfig";
              break;
            case 4:
              v60[0] = @"X-CloudKit-BusinessEmail-QueryName";
              v36 = @"BrandedEmailConfig";
              break;
            default:
              goto LABEL_25;
          }
          *(void *)buf = v36;
          id v37 = [NSDictionary dictionaryWithObjects:buf forKeys:v60 count:1];
        }
        else
        {
LABEL_25:
          id v37 = 0;
        }
        v48[0] = MEMORY[0x263EF8330];
        v48[1] = 3221225472;
        v48[2] = __87__BCSRemoteFetchCloudKit_fetchConfigItemWithType_clientBundleID_systemTask_completion___block_invoke_75;
        v48[3] = &unk_264249E88;
        id v38 = v33;
        id v49 = v38;
        int64_t v51 = a3;
        id v39 = v44;
        id v50 = v39;
        id v40 = v35;
        id v41 = -[BCSRemoteFetchCloudKit _queryOperationForQuery:clientBundleID:systemTask:requestSpecificAdditionalHTTPHeaders:type:singleFetchCompletion:]((id *)&self->super.isa, v35, v47, v11, v37, a3, v48);

        if ((unint64_t)(a3 - 1) <= 3)
        {
          id v42 = [(__objc2_class *)*off_26424A088[a3 - 1] keysRequestedForCloudKitFetch];
          [v41 setDesiredKeys:v42];
        }
        if (self) {
          database = self->_database;
        }
        else {
          database = 0;
        }
        [(BCSCloudKitDatabaseProtocol *)database addOperation:v41];

        v14 = v46;
        id v10 = v47;
        v15 = v45;
      }
    }
  }
}

void __87__BCSRemoteFetchCloudKit_fetchConfigItemWithType_clientBundleID_systemTask_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) end];
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    v8 = *(void **)(v7 + 56);
  }
  else {
    v8 = 0;
  }
  [v8 dequeueCoalesceObjectsForCoalesceKey:*(void *)(a1 + 48)];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v16 + 1) + 8 * v13);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v15 = [v14 configCompletionBlock];
          (*(void (**)(uint64_t, id, id))(v15 + 16))(v15, v5, v6);
        }
        else
        {
          uint64_t v15 = ABSLogCommon();
          if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            int v21 = "-[BCSRemoteFetchCloudKit fetchConfigItemWithType:clientBundleID:systemTask:completion:]_block_invoke";
            _os_log_error_impl(&dword_2154F4000, (os_log_t)v15, OS_LOG_TYPE_ERROR, "Wrong type of completion block added to config pool:%s", buf, 0xCu);
          }
        }

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v11);
  }
}

void __87__BCSRemoteFetchCloudKit_fetchConfigItemWithType_clientBundleID_systemTask_completion___block_invoke_75(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) end];
  if (v5 && !v6)
  {
    uint64_t v7 = ABSLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = NSStringFromBCSType(*(void *)(a1 + 48));
      *(_DWORD *)buf = 138412290;
      id v23 = v8;
      _os_log_impl(&dword_2154F4000, v7, OS_LOG_TYPE_DEFAULT, "Query returned, parsing config with type: %@", buf, 0xCu);
    }
    unint64_t v9 = *(void *)(a1 + 48) - 1;
    if (v9 <= 3 && (uint64_t v10 = [objc_alloc(*off_26424A088[v9]) initWithRecord:v5]) != 0)
    {
      uint64_t v11 = (void *)v10;
      uint64_t v12 = 0;
    }
    else
    {
      v14 = ABSLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2154F4000, v14, OS_LOG_TYPE_DEFAULT, "CKFetch config item - CKRecord has incorrect format", buf, 2u);
      }

      uint64_t v20 = *MEMORY[0x263F08320];
      int v21 = @"Fetch config item failed - CKRecord has incorrect format";
      uint64_t v15 = [NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
      uint64_t v12 = +[BCSError errorWithDomain:@"com.apple.businessservices" code:40 userInfo:v15];

      uint64_t v11 = 0;
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

LABEL_19:
    goto LABEL_20;
  }
  if (!v6)
  {
    uint64_t v18 = *MEMORY[0x263F08320];
    long long v19 = @"Fetch config item failed, nothing returned from fetch";
    long long v16 = [NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    uint64_t v11 = +[BCSError errorWithDomain:@"com.apple.businessservices" code:42 userInfo:v16];

    long long v17 = ABSLogCommon();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = 0;
      _os_log_impl(&dword_2154F4000, v17, OS_LOG_TYPE_DEFAULT, "CKFetch config item - error: %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_19;
  }
  uint64_t v13 = ABSLogCommon();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v6;
    _os_log_impl(&dword_2154F4000, v13, OS_LOG_TYPE_DEFAULT, "CKFetch config item - error: %@", buf, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_20:
}

- (id)_queryOperationForQuery:(void *)a3 clientBundleID:(void *)a4 systemTask:(void *)a5 requestSpecificAdditionalHTTPHeaders:(uint64_t)a6 type:(void *)a7 singleFetchCompletion:
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  if (a1)
  {
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __140__BCSRemoteFetchCloudKit__queryOperationForQuery_clientBundleID_systemTask_requestSpecificAdditionalHTTPHeaders_type_singleFetchCompletion___block_invoke;
    v25[3] = &unk_264249FC8;
    v25[4] = a1;
    id v26 = v13;
    id v27 = v14;
    id v28 = v15;
    uint64_t v29 = a6;
    id v16 = a7;
    id v17 = a2;
    uint64_t v18 = (void *)MEMORY[0x2166BDB40](v25);
    id v19 = v17;
    uint64_t v20 = v18;
    id v21 = v16;
    a1 = [a1[5] makeQueryOperation];
    [a1 setQuery:v19];
    v20[2](v20, a1);
    v36[0] = 0;
    v36[1] = v36;
    v36[2] = 0x2020000000;
    char v37 = 0;
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __91__BCSRemoteFetchCloudKit__queryOperationForQuery_configurationBlock_singleFetchCompletion___block_invoke;
    v33[3] = &unk_264249FF0;
    v35 = v36;
    id v22 = v21;
    id v34 = v22;
    [a1 setRecordFetchedBlock:v33];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __91__BCSRemoteFetchCloudKit__queryOperationForQuery_configurationBlock_singleFetchCompletion___block_invoke_2;
    v30[3] = &unk_26424A018;
    v32 = v36;
    id v23 = v22;
    id v31 = v23;
    [a1 setQueryCompletionBlock:v30];

    _Block_object_dispose(v36, 8);
  }

  return a1;
}

- (void)fetchShardMatching:(id)a3 clientBundleID:(id)a4 completion:(id)a5
{
  v55[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = ABSLogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[BCSRemoteFetchCloudKit fetchShardMatching:clientBundleID:completion:]";
    _os_log_debug_impl(&dword_2154F4000, v11, OS_LOG_TYPE_DEBUG, "%s@", buf, 0xCu);
  }

  if (v10)
  {
    unsigned __int8 v53 = 0;
    uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"cloudkit_shard_fetch_type_%ld_start_%lld_count_%lld", objc_msgSend(v8, "type"), objc_msgSend(v8, "startIndex"), objc_msgSend(v8, "shardCount"));
    id v13 = [[BCSCoalesceObjectShard alloc] initWithCompletionBlock:v10 coalesceKey:v12];
    if (self) {
      coalesceHelper = self->_coalesceHelper;
    }
    else {
      coalesceHelper = 0;
    }
    [(BCSCoalesceHelperProtocol *)coalesceHelper enqueueCoalesceObject:v13 isDuplicateRequest:&v53];
    int v15 = v53;
    id v16 = ABSLogCommon();
    id v17 = v16;
    if (v15)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = "-[BCSRemoteFetchCloudKit fetchShardMatching:clientBundleID:completion:]";
        _os_log_impl(&dword_2154F4000, v17, OS_LOG_TYPE_DEFAULT, "New request is duplicate and already in progress:%s", buf, 0xCu);
      }
    }
    else
    {
      os_signpost_id_t v18 = os_signpost_id_generate(v16);

      id v44 = v9;
      if (self) {
        metricFactory = self->_metricFactory;
      }
      else {
        metricFactory = 0;
      }
      uint64_t v20 = metricFactory;
      id v21 = [(BCSMetricFactoryProtocol *)v20 measurementFactory];
      id v22 = [(BCSRemoteFetchCloudKit *)self environment];
      id v23 = objc_msgSend(v21, "shardCloudKitFetchAndDecodeTimingMeasurementForType:identifier:", objc_msgSend(v22, "type"), v18);

      [v23 begin];
      v49[0] = MEMORY[0x263EF8330];
      v49[1] = 3221225472;
      v49[2] = __71__BCSRemoteFetchCloudKit_fetchShardMatching_clientBundleID_completion___block_invoke;
      v49[3] = &unk_264249EB0;
      id v17 = v23;
      id v50 = v17;
      int64_t v51 = self;
      id v52 = v12;
      id v42 = (void *)MEMORY[0x2166BDB40](v49);
      uint64_t v24 = v13;
      if (self) {
        v25 = self->_metricFactory;
      }
      else {
        v25 = 0;
      }
      id v26 = v25;
      id v27 = [(BCSMetricFactoryProtocol *)v26 measurementFactory];
      id v28 = [(BCSRemoteFetchCloudKit *)self environment];
      uint64_t v29 = objc_msgSend(v27, "shardCloudKitFetchTimingMeasurementForType:identifier:", objc_msgSend(v28, "type"), v18);

      [v29 begin];
      if (self) {
        queryProvider = self->_queryProvider;
      }
      else {
        queryProvider = 0;
      }
      id v43 = [(BCSCloudKitQueryProviding *)queryProvider queryForFetchShardIdentifier:v8];
      uint64_t v31 = [v8 type];
      id v13 = v24;
      if (self)
      {
        switch(v31)
        {
          case 1:
            v55[0] = @"X-CloudKit-BusinessChat-QueryName";
            v32 = @"ChatSuggestFilter";
            break;
          case 2:
            v55[0] = @"X-CloudKit-BusinessLink-QueryName";
            v32 = @"BusinessLinkFilterV2";
            break;
          case 3:
            v55[0] = @"X-CloudKit-BusinessLink-QueryName";
            v32 = @"DomainShard";
            break;
          case 4:
            v55[0] = @"X-CloudKit-BusinessCaller-QueryName";
            v32 = @"CallerIdFilter";
            break;
          case 5:
            v55[0] = @"X-CloudKit-BusinessEmail-QueryName";
            v32 = @"BrandedEmailFilter";
            break;
          default:
            goto LABEL_18;
        }
        *(void *)buf = v32;
        v33 = [NSDictionary dictionaryWithObjects:buf forKeys:v55 count:1];
      }
      else
      {
LABEL_18:
        v33 = 0;
      }
      uint64_t v34 = [v8 type];
      if ((unint64_t)(v34 - 2) > 3) {
        uint64_t v35 = 1;
      }
      else {
        uint64_t v35 = qword_215570BE8[v34 - 2];
      }
      v45[0] = MEMORY[0x263EF8330];
      v45[1] = 3221225472;
      v45[2] = __71__BCSRemoteFetchCloudKit_fetchShardMatching_clientBundleID_completion___block_invoke_90;
      v45[3] = &unk_264249ED8;
      id v46 = v29;
      id v47 = v8;
      id v48 = v42;
      id v36 = v42;
      char v37 = v29;
      id v38 = v36;
      id v39 = v37;
      id v40 = -[BCSRemoteFetchCloudKit _queryOperationForQuery:clientBundleID:systemTask:requestSpecificAdditionalHTTPHeaders:type:singleFetchCompletion:]((id *)&self->super.isa, v43, v44, 0, v33, v35, v45);

      if (self) {
        database = self->_database;
      }
      else {
        database = 0;
      }
      [(BCSCloudKitDatabaseProtocol *)database addOperation:v40];

      id v9 = v44;
    }
  }
}

void __71__BCSRemoteFetchCloudKit_fetchShardMatching_clientBundleID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) end];
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    id v8 = *(void **)(v7 + 56);
  }
  else {
    id v8 = 0;
  }
  [v8 dequeueCoalesceObjectsForCoalesceKey:*(void *)(a1 + 48)];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v16 + 1) + 8 * v13);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v15 = [v14 shardCompletionBlock];
          (*(void (**)(uint64_t, id, id))(v15 + 16))(v15, v5, v6);
        }
        else
        {
          uint64_t v15 = ABSLogCommon();
          if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            id v21 = "-[BCSRemoteFetchCloudKit fetchShardMatching:clientBundleID:completion:]_block_invoke";
            _os_log_error_impl(&dword_2154F4000, (os_log_t)v15, OS_LOG_TYPE_ERROR, "Wrong type of completion block added to shard pool:%s", buf, 0xCu);
          }
        }

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v11);
  }
}

void __71__BCSRemoteFetchCloudKit_fetchShardMatching_clientBundleID_completion___block_invoke_90(uint64_t a1, void *a2, void *a3)
{
  v21[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) end];
  if (v5 && !v6)
  {
    uint64_t v7 = [*(id *)(a1 + 40) type];
    id v8 = off_264248490;
    if (v7 != 3) {
      id v8 = off_2642484A8;
    }
    id v9 = objc_msgSend(objc_alloc(*v8), "initWithRecord:type:", v5, objc_msgSend(*(id *)(a1 + 40), "type"));
    if (v9)
    {
      uint64_t v10 = 0;
    }
    else
    {
      id v14 = ABSLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2154F4000, v14, OS_LOG_TYPE_DEFAULT, "CKFetch shard item - CKRecord has incorrect format", buf, 2u);
      }

      uint64_t v20 = *MEMORY[0x263F08320];
      v21[0] = @"Fetch shard item failed - CKRecord has incorrect format";
      uint64_t v15 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
      uint64_t v10 = +[BCSError errorWithDomain:@"com.apple.businessservices" code:40 userInfo:v15];
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

LABEL_18:
    goto LABEL_19;
  }
  if (!v6)
  {
    uint64_t v16 = *MEMORY[0x263F08320];
    long long v17 = @"Fetch shard item failed, nothing returned from fetch";
    uint64_t v12 = [NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    id v9 = +[BCSError errorWithDomain:@"com.apple.businessservices" code:42 userInfo:v12];

    uint64_t v13 = ABSLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v9;
      _os_log_impl(&dword_2154F4000, v13, OS_LOG_TYPE_DEFAULT, "CKFetch shard item - error: %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_18;
  }
  uint64_t v11 = ABSLogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v6;
    _os_log_impl(&dword_2154F4000, v11, OS_LOG_TYPE_DEFAULT, "CKFetch shard item - error: %@", buf, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_19:
}

- (void)fetchMegashardItemWithType:(int64_t)a3 clientBundleID:(id)a4 completion:(id)a5
{
}

- (void)fetchMegashardItemWithType:(int64_t)a3 clientBundleID:(id)a4 systemTask:(id)a5 completion:(id)a6
{
  v59[1] = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = ABSLogCommon();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[BCSRemoteFetchCloudKit fetchMegashardItemWithType:clientBundleID:systemTask:completion:]";
    _os_log_debug_impl(&dword_2154F4000, v13, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  if (v12)
  {
    unsigned __int8 v55 = 0;
    id v14 = objc_msgSend(NSString, "stringWithFormat:", @"cloudkit_config_and_shard_fetch_type_%ld", a3);
    uint64_t v15 = [[BCSCoalesceObjectMegashard alloc] initWithCompletionBlock:v12 coalesceKey:v14];
    if (v11
      && (!self ? (uint64_t v16 = 0) : (uint64_t v16 = self->_coalesceHelper),
          [(BCSCoalesceHelperProtocol *)v16 isDuplicateRequest:v15]))
    {
      long long v17 = ABSLogCommon();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = "-[BCSRemoteFetchCloudKit fetchMegashardItemWithType:clientBundleID:systemTask:completion:]";
        _os_log_impl(&dword_2154F4000, v17, OS_LOG_TYPE_DEFAULT, "New request is a scheduled duplicate and already in progress:%s", buf, 0xCu);
      }

      uint64_t v56 = *MEMORY[0x263F08320];
      uint64_t v57 = @"Request is a scheduled duplicate and already in progress";
      long long v18 = [NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1];
      id v19 = +[BCSError errorWithDomain:@"com.apple.businessservices" code:42 userInfo:v18];
      (*((void (**)(id, void, void, void, void *))v12 + 2))(v12, 0, 0, 0, v19);
    }
    else
    {
      if (self) {
        coalesceHelper = self->_coalesceHelper;
      }
      else {
        coalesceHelper = 0;
      }
      [(BCSCoalesceHelperProtocol *)coalesceHelper enqueueCoalesceObject:v15 isDuplicateRequest:&v55];
      int v21 = v55;
      id v22 = ABSLogCommon();
      long long v18 = v22;
      if (v21)
      {
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)&uint8_t buf[4] = "-[BCSRemoteFetchCloudKit fetchMegashardItemWithType:clientBundleID:systemTask:completion:]";
          _os_log_impl(&dword_2154F4000, v18, OS_LOG_TYPE_DEFAULT, "New request is duplicate and already in progress:%s", buf, 0xCu);
        }
      }
      else
      {
        os_signpost_id_t v23 = os_signpost_id_generate(v22);

        id v44 = v14;
        id v45 = v10;
        if (self) {
          metricFactory = self->_metricFactory;
        }
        else {
          metricFactory = 0;
        }
        v25 = metricFactory;
        id v26 = [(BCSMetricFactoryProtocol *)v25 measurementFactory];
        id v27 = [(BCSRemoteFetchCloudKit *)self environment];
        id v28 = objc_msgSend(v26, "megashardCloudKitFetchAndDecodeTimingMeasurementForType:identifier:", objc_msgSend(v27, "type"), v23);

        [v28 begin];
        v51[0] = MEMORY[0x263EF8330];
        v51[1] = 3221225472;
        v51[2] = __90__BCSRemoteFetchCloudKit_fetchMegashardItemWithType_clientBundleID_systemTask_completion___block_invoke;
        v51[3] = &unk_264249F00;
        long long v18 = v28;
        id v52 = v18;
        unsigned __int8 v53 = self;
        id v54 = v44;
        id v43 = (void *)MEMORY[0x2166BDB40](v51);
        os_signpost_id_t v29 = v23;
        if (self) {
          id v30 = self->_metricFactory;
        }
        else {
          id v30 = 0;
        }
        uint64_t v31 = v30;
        v32 = [(BCSMetricFactoryProtocol *)v31 measurementFactory];
        v33 = [(BCSRemoteFetchCloudKit *)self environment];
        uint64_t v34 = objc_msgSend(v32, "megashardCloudKitFetchTimingMeasurementForType:identifier:", objc_msgSend(v33, "type"), v29);

        [v34 begin];
        if (self) {
          queryProvider = self->_queryProvider;
        }
        else {
          queryProvider = 0;
        }
        id v36 = [(BCSCloudKitQueryProviding *)queryProvider queryForFetchConfigItemWithType:a3];
        if (self)
        {
          switch(a3)
          {
            case 1:
              v59[0] = @"X-CloudKit-BusinessChat-QueryName";
              char v37 = @"ChatSuggestConfigMegashard";
              break;
            case 2:
              v59[0] = @"X-CloudKit-BusinessLink-QueryName";
              char v37 = @"DomainLinkConfigMegashards";
              break;
            case 3:
            case 4:
              v59[0] = @"X-CloudKit-BusinessCaller-QueryName";
              char v37 = @"BrandedEmailConfigMegashard";
              break;
            default:
              goto LABEL_25;
          }
          *(void *)buf = v37;
          id v38 = [NSDictionary dictionaryWithObjects:buf forKeys:v59 count:1];
        }
        else
        {
LABEL_25:
          id v38 = 0;
        }
        v46[0] = MEMORY[0x263EF8330];
        v46[1] = 3221225472;
        v46[2] = __90__BCSRemoteFetchCloudKit_fetchMegashardItemWithType_clientBundleID_systemTask_completion___block_invoke_104;
        v46[3] = &unk_264249F50;
        id v47 = v34;
        id v48 = self;
        id v49 = v43;
        int64_t v50 = a3;
        id v39 = v43;
        id v40 = v34;
        id v41 = -[BCSRemoteFetchCloudKit _queryOperationForQuery:clientBundleID:systemTask:requestSpecificAdditionalHTTPHeaders:type:singleFetchCompletion:]((id *)&self->super.isa, v36, v45, v11, v38, a3, v46);

        if (self) {
          database = self->_database;
        }
        else {
          database = 0;
        }
        id v14 = v44;
        [(BCSCloudKitDatabaseProtocol *)database addOperation:v41];

        id v10 = v45;
      }
    }
  }
}

void __90__BCSRemoteFetchCloudKit_fetchMegashardItemWithType_clientBundleID_systemTask_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  [*(id *)(a1 + 32) end];
  uint64_t v13 = *(void *)(a1 + 40);
  if (v13) {
    id v14 = *(void **)(v13 + 56);
  }
  else {
    id v14 = 0;
  }
  [v14 dequeueCoalesceObjectsForCoalesceKey:*(void *)(a1 + 48)];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v23;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void **)(*((void *)&v22 + 1) + 8 * v19);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v21 = [v20 megashardCompletionBlock];
          (*(void (**)(uint64_t, id, id, id, id))(v21 + 16))(v21, v9, v10, v11, v12);
        }
        else
        {
          uint64_t v21 = ABSLogCommon();
          if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            id v27 = "-[BCSRemoteFetchCloudKit fetchMegashardItemWithType:clientBundleID:systemTask:completion:]_block_invoke";
            _os_log_error_impl(&dword_2154F4000, (os_log_t)v21, OS_LOG_TYPE_ERROR, "Wrong type of completion block added to bloom filter and config pool:%s", buf, 0xCu);
          }
        }

        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v17);
  }
}

void __90__BCSRemoteFetchCloudKit_fetchMegashardItemWithType_clientBundleID_systemTask_completion___block_invoke_104(uint64_t a1, void *a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) end];
  if (v5 && !v6)
  {
    unint64_t v7 = *(void *)(a1 + 56);
    BOOL v8 = v7 > 4;
    uint64_t v9 = (1 << v7) & 0x1A;
    if (v8 || v9 == 0)
    {
      id v11 = [[BCSDomainConfigItem alloc] initWithRecord:v5];
      uint64_t v12 = [(BCSDomainConfigItem *)v11 domainMegaShardURL];
      if (!v11) {
        goto LABEL_27;
      }
    }
    else
    {
      id v11 = [[BCSConfigItem alloc] initWithRecord:v5];
      uint64_t v12 = 0;
      if (!v11) {
        goto LABEL_27;
      }
    }
    uint64_t v16 = [(BCSConfigItem *)v11 filterMegaShardURL];
    uint64_t v17 = v16 | v12;

    if (v17)
    {
      uint64_t v18 = ABSLogCommon();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = [(BCSConfigItem *)v11 filterMegaShardURL];
        *(_DWORD *)buf = 138412290;
        id v39 = v19;
        _os_log_impl(&dword_2154F4000, v18, OS_LOG_TYPE_DEFAULT, "Extracting shard URLs from filter shard URL: %@", buf, 0xCu);
      }
      uint64_t v20 = (void *)MEMORY[0x263EFF8F8];
      uint64_t v21 = [(BCSConfigItem *)v11 filterMegaShardURL];
      id v33 = 0;
      long long v22 = [v20 dataWithContentsOfURL:v21 options:0 error:&v33];
      id v23 = v33;

      if (!v22)
      {
        long long v24 = ABSLogCommon();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v39 = v23;
          _os_log_error_impl(&dword_2154F4000, v24, OS_LOG_TYPE_ERROR, "Failed to read filter shard from disk: %@", buf, 0xCu);
        }
      }
      long long v25 = *(void **)(a1 + 40);
      if (v25) {
        long long v25 = (void *)v25[8];
      }
      id v26 = v25;
      id v27 = [(BCSConfigItem *)v11 filterMegaShardURL];
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __90__BCSRemoteFetchCloudKit_fetchMegashardItemWithType_clientBundleID_systemTask_completion___block_invoke_106;
      v30[3] = &unk_264249F28;
      id v32 = *(id *)(a1 + 48);
      uint64_t v31 = v11;
      [v26 extractShardsURLsFromFilterShardURL:v27 domainShardURL:v12 completion:v30];

      goto LABEL_30;
    }
LABEL_27:
    id v28 = ABSLogCommon();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2154F4000, v28, OS_LOG_TYPE_DEFAULT, "CKFetch megashard item - couldn't extract configItem and/or bloom filter URL", buf, 2u);
    }

    uint64_t v36 = *MEMORY[0x263F08320];
    char v37 = @"Fetch megashard item failed - CKRecord has incorrect format";
    uint64_t v29 = [NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
    id v23 = +[BCSError errorWithDomain:@"com.apple.businessservices" code:40 userInfo:v29];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_30:

LABEL_31:
    goto LABEL_32;
  }
  if (!v6)
  {
    uint64_t v34 = *MEMORY[0x263F08320];
    uint64_t v35 = @"Fetch megashard item failed, nothing returned from fetch";
    id v14 = [NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    id v11 = +[BCSError errorWithDomain:@"com.apple.businessservices" code:42 userInfo:v14];

    id v15 = ABSLogCommon();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v39 = 0;
      _os_log_impl(&dword_2154F4000, v15, OS_LOG_TYPE_DEFAULT, "CKFetch megashard item - error: %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_31;
  }
  uint64_t v13 = ABSLogCommon();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v39 = v6;
    _os_log_impl(&dword_2154F4000, v13, OS_LOG_TYPE_DEFAULT, "CKFetch megshard item - error: %@", buf, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_32:
}

uint64_t __90__BCSRemoteFetchCloudKit_fetchMegashardItemWithType_clientBundleID_systemTask_completion___block_invoke_106(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(a1 + 40);
  if (a4) {
    return (*(uint64_t (**)(uint64_t, void, void, void, uint64_t))(v5 + 16))(v5, 0, 0, 0, a4);
  }
  else {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(v5 + 16))(v5, a2, a3, *(void *)(a1 + 32));
  }
}

- (void)fetchItemsWithBucketStartIndex:(int64_t)a3 endIndex:(int64_t)a4 type:(int64_t)a5 forClientBundleID:(id)a6 completion:(id)a7
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v12 = a6;
  id v13 = a7;
  id v14 = ABSLogCommon();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[BCSRemoteFetchCloudKit fetchItemsWithBucketStartIndex:endIndex:type:forClientBundl"
                                    "eID:completion:]";
    _os_log_debug_impl(&dword_2154F4000, v14, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&buf, 0xCu);
  }

  if (v13)
  {
    char v67 = 0;
    uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"cloudkit_item_fetch_type_%ld_start_%lld_end_%lld", a5, a3, a4);
    uint64_t v16 = [[BCSCoalesceObjectItems alloc] initWithCompletionBlock:v13 coalesceKey:v15];
    if (self) {
      coalesceHelper = self->_coalesceHelper;
    }
    else {
      coalesceHelper = 0;
    }
    uint64_t v57 = v16;
    -[BCSCoalesceHelperProtocol enqueueCoalesceObject:isDuplicateRequest:](coalesceHelper, "enqueueCoalesceObject:isDuplicateRequest:");
    uint64_t v18 = ABSLogCommon();
    unsigned __int8 v55 = v12;
    os_signpost_id_t v19 = os_signpost_id_generate(v18);

    uint64_t v56 = (void *)v15;
    if (self) {
      metricFactory = self->_metricFactory;
    }
    else {
      metricFactory = 0;
    }
    uint64_t v21 = metricFactory;
    long long v22 = [(BCSMetricFactoryProtocol *)v21 measurementFactory];
    id v23 = [(BCSRemoteFetchCloudKit *)self environment];
    long long v24 = objc_msgSend(v22, "itemCloudKitFetchAndDecodeTimingMeasurementForType:identifier:", objc_msgSend(v23, "type"), v19);

    [v24 begin];
    v63[0] = MEMORY[0x263EF8330];
    v63[1] = 3221225472;
    v63[2] = __100__BCSRemoteFetchCloudKit_fetchItemsWithBucketStartIndex_endIndex_type_forClientBundleID_completion___block_invoke;
    v63[3] = &unk_264249F78;
    id v25 = v24;
    id v64 = v25;
    v65 = self;
    id v66 = v56;
    id v52 = (void *)MEMORY[0x2166BDB40](v63);
    if (self) {
      id v26 = self->_metricFactory;
    }
    else {
      id v26 = 0;
    }
    id v27 = v26;
    id v28 = [(BCSMetricFactoryProtocol *)v27 measurementFactory];
    uint64_t v29 = [(BCSRemoteFetchCloudKit *)self environment];
    id v30 = objc_msgSend(v28, "itemCloudKitFetchTimingMeasurementForType:identifier:", objc_msgSend(v29, "type"), v19);

    [v30 begin];
    if (self) {
      queryProvider = self->_queryProvider;
    }
    else {
      queryProvider = 0;
    }
    id v32 = [(BCSCloudKitQueryProviding *)queryProvider queryForFetchItemsWithStartIndex:a3 endIndex:a4 type:a5];
    if (self)
    {
      switch(a5)
      {
        case 1:
          v78[0] = @"X-CloudKit-BusinessChat-QueryName";
          id v33 = @"ChatSuggest";
          break;
        case 2:
          v78[0] = @"X-CloudKit-BusinessLink-QueryName";
          id v33 = @"BusinessLinkV2";
          break;
        case 3:
          v78[0] = @"X-CloudKit-BusinessCaller-QueryName";
          id v33 = @"CallerId";
          break;
        case 4:
          v78[0] = @"X-CloudKit-BusinessCaller-QueryName";
          id v33 = @"BrandedEmail";
          break;
        default:
          goto LABEL_15;
      }
      *(void *)&long long buf = v33;
      uint64_t v34 = [NSDictionary dictionaryWithObjects:&buf forKeys:v78 count:1];
    }
    else
    {
LABEL_15:
      uint64_t v34 = 0;
    }
    v58[0] = MEMORY[0x263EF8330];
    v58[1] = 3221225472;
    v58[2] = __100__BCSRemoteFetchCloudKit_fetchItemsWithBucketStartIndex_endIndex_type_forClientBundleID_completion___block_invoke_119;
    v58[3] = &unk_264249FA0;
    id v59 = v30;
    v60 = self;
    id v61 = v52;
    int64_t v62 = a5;
    id v53 = v52;
    id v51 = v30;
    id v35 = v55;
    id v36 = v34;
    id v54 = v32;
    int64_t v50 = v35;
    if (self)
    {
      *(void *)&long long buf = MEMORY[0x263EF8330];
      *((void *)&buf + 1) = 3221225472;
      v71 = __142__BCSRemoteFetchCloudKit__queryOperationForQuery_clientBundleID_systemTask_requestSpecificAdditionalHTTPHeaders_type_multipleFetchCompletion___block_invoke;
      v72 = &unk_264249FC8;
      v73 = self;
      id v74 = v35;
      id v75 = 0;
      id v76 = v36;
      int64_t v77 = a5;
      char v37 = v58;
      id v38 = v32;
      id v39 = (void *)MEMORY[0x2166BDB40](&buf);
      uint64_t v40 = v37;
      queryOperationFactory = self->_queryOperationFactory;
      id v42 = v39;
      id v43 = v38;
      id v44 = [(BCSQueryOperationFactoryProtocol *)queryOperationFactory makeQueryOperation];
      [v44 setQuery:v43];

      v42[2](v42, v44);
      id v45 = [MEMORY[0x263EFF980] array];
      v68[0] = MEMORY[0x263EF8330];
      v68[1] = 3221225472;
      v68[2] = __93__BCSRemoteFetchCloudKit__queryOperationForQuery_configurationBlock_multipleFetchCompletion___block_invoke;
      v68[3] = &unk_26424A040;
      id v46 = v45;
      id v69 = v46;
      [v44 setRecordFetchedBlock:v68];
      v78[0] = MEMORY[0x263EF8330];
      v78[1] = 3221225472;
      v78[2] = __93__BCSRemoteFetchCloudKit__queryOperationForQuery_configurationBlock_multipleFetchCompletion___block_invoke_2;
      v78[3] = &unk_26424A068;
      id v47 = v40;
      id v79 = v46;
      id v80 = v47;
      id v48 = v46;
      [v44 setQueryCompletionBlock:v78];
    }
    else
    {
      id v44 = 0;
    }

    if (self) {
      database = self->_database;
    }
    else {
      database = 0;
    }
    [(BCSCloudKitDatabaseProtocol *)database addOperation:v44];

    id v12 = v55;
  }
}

void __100__BCSRemoteFetchCloudKit_fetchItemsWithBucketStartIndex_endIndex_type_forClientBundleID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) end];
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    BOOL v8 = *(void **)(v7 + 56);
  }
  else {
    BOOL v8 = 0;
  }
  [v8 dequeueCoalesceObjectsForCoalesceKey:*(void *)(a1 + 48)];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v16 + 1) + 8 * v13);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v15 = [v14 itemsCompletionBlock];
          (*(void (**)(uint64_t, id, id))(v15 + 16))(v15, v5, v6);
        }
        else
        {
          uint64_t v15 = ABSLogCommon();
          if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 136315138;
            uint64_t v21 = "-[BCSRemoteFetchCloudKit fetchItemsWithBucketStartIndex:endIndex:type:forClientBundleID:completion:]_block_invoke";
            _os_log_error_impl(&dword_2154F4000, (os_log_t)v15, OS_LOG_TYPE_ERROR, "Wrong type of completion block added to bloom filter and config pool:%s", buf, 0xCu);
          }
        }

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v11);
  }
}

void __100__BCSRemoteFetchCloudKit_fetchItemsWithBucketStartIndex_endIndex_type_forClientBundleID_completion___block_invoke_119(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) end];
  if (v5 && !v6)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 56);
    id v9 = v5;
    if (!v7)
    {
      long long v16 = 0;
LABEL_23:

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      goto LABEL_24;
    }
    switch(v8)
    {
      case 3:
        uint64_t v10 = +[BCSBusinessCallerItem itemsFromRecords:v9];
        break;
      case 2:
        uint64_t v15 = +[BCSLinkItemModel linkItemModelsFromRecords:v9];
        long long v16 = +[BCSLinkItem linkItemsFromLinkItemModels:v15];

        goto LABEL_19;
      case 1:
        uint64_t v10 = +[BCSBusinessItem businessItemsFromRecords:v9];
        break;
      default:
        long long v16 = 0;
LABEL_19:
        if (![v16 count])
        {
          long long v17 = ABSLogCommon();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_2154F4000, v17, OS_LOG_TYPE_DEFAULT, "No items returned from CloudKit results", buf, 2u);
          }
        }
        goto LABEL_23;
    }
    long long v16 = (void *)v10;
    goto LABEL_19;
  }
  if (v6)
  {
    uint64_t v11 = ABSLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v21 = v6;
      _os_log_impl(&dword_2154F4000, v11, OS_LOG_TYPE_DEFAULT, "CKFetch items - error: %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v18 = *MEMORY[0x263F08320];
    long long v19 = @"Fetch items failed, nothing returned from fetch";
    uint64_t v12 = [NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    uint64_t v13 = +[BCSError errorWithDomain:@"com.apple.businessservices" code:42 userInfo:v12];

    id v14 = ABSLogCommon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v21 = 0;
      _os_log_impl(&dword_2154F4000, v14, OS_LOG_TYPE_DEFAULT, "CKFetch megashard item - error: %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
LABEL_24:
}

- (id)shardItemFromURL:(id)a3 type:(int64_t)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = ABSLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = NSStringFromBCSShardType(a4);
    int v11 = 138412546;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_2154F4000, v6, OS_LOG_TYPE_DEFAULT, "shardItemFromURL:%@ type:%@", (uint8_t *)&v11, 0x16u);
  }
  if (a4 == 3) {
    uint64_t v8 = [[BCSDomainShardItem alloc] initWithURL:v5];
  }
  else {
    uint64_t v8 = [[BCSFilterShardItem alloc] initWithURL:v5 type:a4];
  }
  id v9 = v8;

  return v9;
}

- (id)succinctDescription
{
  v2 = [(BCSRemoteFetchCloudKit *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x263F29C40] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(BCSRemoteFetchCloudKit *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = [(BCSRemoteFetchCloudKit *)self succinctDescriptionBuilder];
  id v5 = (id)[v4 appendObject:self->_environment withName:@"iCloudEnvironment"];

  return v4;
}

void __140__BCSRemoteFetchCloudKit__queryOperationForQuery_clientBundleID_systemTask_requestSpecificAdditionalHTTPHeaders_type_singleFetchCompletion___block_invoke(uint64_t a1, void *a2)
{
}

- (void)_configureOperationForQuery:(void *)a3 clientBundleID:(void *)a4 systemTask:(void *)a5 requestSpecificAdditionalHTTPHeaders:(uint64_t)a6 type:
{
  id v31 = a2;
  id v11 = a5;
  if (a1)
  {
    id v12 = (objc_class *)MEMORY[0x263EFD808];
    id v13 = a4;
    id v14 = a3;
    id v15 = [v12 alloc];
    long long v16 = (void *)[v15 initWithZoneName:@"_defaultZone" ownerName:*MEMORY[0x263EFD488]];
    [v31 setZoneID:v16];

    long long v17 = objc_opt_new();
    uint64_t v18 = [a1 environment];
    long long v19 = [v18 additionalRequestHTTPHeaders];
    uint64_t v20 = objc_msgSend(v17, "bs_dictionaryByAddingEntriesFromDictionary:", v19);

    id v21 = objc_msgSend(v20, "bs_dictionaryByAddingEntriesFromDictionary:", v11);

    uint64_t v22 = [v31 configuration];
    [v22 setAdditionalRequestHTTPHeaders:v21];

    uint64_t v23 = [v31 configuration];
    [v23 setSourceApplicationBundleIdentifier:v14];

    long long v24 = [v31 configuration];
    [v24 setSystemTask:v13];

    if (!v13)
    {
      [v31 setQualityOfService:25];
      id v25 = [v31 configuration];
      [v25 setDiscretionaryNetworkBehavior:0];

      id v26 = [v31 configuration];
      [v26 setAutomaticallyRetryNetworkFailures:0];
    }
    id v27 = [a1[9] makeOperationGroup];
    switch(a6)
    {
      case 1:
        id v28 = @"X-CloudKit-BusinessChat-QueryName";
        goto LABEL_9;
      case 2:
        id v28 = @"X-CloudKit-BusinessLink-QueryName";
        goto LABEL_9;
      case 3:
        uint64_t v29 = [v11 objectForKeyedSubscript:@"X-CloudKit-BusinessCaller-QueryName"];
        [v27 setName:v29];

        id v30 = [v31 configuration];
        objc_msgSend(v30, "set_sourceApplicationSecondaryIdentifier:", @"com.apple.CommCenter.BrandedCalling");
        goto LABEL_10;
      case 4:
        id v28 = @"X-CloudKit-BusinessEmail-QueryName";
LABEL_9:
        id v30 = [v11 objectForKeyedSubscript:v28];
        [v27 setName:v30];
LABEL_10:

        break;
      default:
        break;
    }
    [v31 setGroup:v27];
  }
}

void __142__BCSRemoteFetchCloudKit__queryOperationForQuery_clientBundleID_systemTask_requestSpecificAdditionalHTTPHeaders_type_multipleFetchCompletion___block_invoke(uint64_t a1, void *a2)
{
}

uint64_t __91__BCSRemoteFetchCloudKit__queryOperationForQuery_configurationBlock_singleFetchCompletion___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __91__BCSRemoteFetchCloudKit__queryOperationForQuery_configurationBlock_singleFetchCompletion___block_invoke_2(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

uint64_t __93__BCSRemoteFetchCloudKit__queryOperationForQuery_configurationBlock_multipleFetchCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

uint64_t __93__BCSRemoteFetchCloudKit__queryOperationForQuery_configurationBlock_multipleFetchCompletion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 40);
  if (a3) {
    return (*(uint64_t (**)(uint64_t, void))(v4 + 16))(v4, 0);
  }
  else {
    return (*(uint64_t (**)(uint64_t, void))(v4 + 16))(v4, *(void *)(a1 + 32));
  }
}

- (BCSICloudServerEnvironmentProtocol)environment
{
  return self->_environment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricFactory, 0);
  objc_storeStrong((id *)&self->_operationGroupFactory, 0);
  objc_storeStrong((id *)&self->_bloomFilterExtractor, 0);
  objc_storeStrong((id *)&self->_coalesceHelper, 0);
  objc_storeStrong((id *)&self->_databaseContainer, 0);
  objc_storeStrong((id *)&self->_queryOperationFactory, 0);
  objc_storeStrong((id *)&self->_queryProvider, 0);
  objc_storeStrong((id *)&self->_queryOperation, 0);
  objc_storeStrong((id *)&self->_database, 0);

  objc_storeStrong((id *)&self->_environment, 0);
}

@end
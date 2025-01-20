@interface BCSBusinessQueryService
- (BCSBusinessQueryService)init;
- (BCSBusinessQueryService)initWithConnection:(id)a3 clientBundleIdentifier:(id)a4;
- (id)businessItemForPhoneNumber:(id)a3 isChatSuggestVisible:(BOOL *)a4 error:(id *)a5;
- (id)businessItemForPhoneNumber:(id)a3 isMessageable:(BOOL *)a4 isChatSuggestVisible:(BOOL *)a5 error:(id *)a6;
- (id)cachedBusinessMetadataForEmail:(id)a3 error:(id *)a4;
- (void)_deleteInMemoryCache;
- (void)_fetchBusinessItemWithDetailsForPhoneNumber:(uint64_t)a1 forClientBundleID:(void *)a2 completion:(void *)a3;
- (void)_isBusinessRegisteredForURL:(id)a3 chopURL:(BOOL)a4 completion:(id)a5;
- (void)clearCachesForLinkItemsAssociatedWithBundleID:(id)a3 completion:(id)a4;
- (void)clearCachesForType:(int64_t)a3 completion:(id)a4;
- (void)clearExpiredCachesForType:(int64_t)a3 completion:(id)a4;
- (void)didFetchBusinessMetadata:(id)a3 forEmailIdentifier:(id)a4 requestId:(id)a5 error:(id)a6 reply:(id)a7;
- (void)didFetchBusinessMetadataForEmailsForRequestId:(id)a3 error:(id)a4 reply:(id)a5;
- (void)fetchBusinessCallerMetadataForPhoneNumber:(id)a3 metadataCallback:(id)a4 logoURLCallback:(id)a5 completion:(id)a6;
- (void)fetchBusinessCallerMetadataWithPhoneNumber:(id)a3 completion:(id)a4;
- (void)fetchBusinessItemForPhoneNumber:(id)a3 completion:(id)a4;
- (void)fetchBusinessItemWithDetailsForPhoneNumber:(id)a3 completion:(id)a4;
- (void)fetchBusinessItemWithPhoneNumber:(id)a3 completion:(id)a4;
- (void)fetchBusinessLogoForBusinessIdentifier:(id)a3 completion:(id)a4;
- (void)fetchBusinessMetadataForEmail:(id)a3 completion:(id)a4;
- (void)fetchBusinessMetadataForEmailIdentifier:(id)a3 completion:(id)a4;
- (void)fetchBusinessMetadataForEmails:(id)a3 perItemCallback:(id)a4 completion:(id)a5;
- (void)fetchLinkItemWithHash:(id)a3 completion:(id)a4;
- (void)fetchLinkItemWithURL:(id)a3 chopURL:(BOOL)a4 completion:(id)a5;
- (void)fetchLinkItemWithURL:(id)a3 completion:(id)a4;
- (void)fetchSquareIconDataForBusinessItem:(id)a3 completion:(id)a4;
- (void)isBusinessCallerRegisteredForPhoneNumber:(id)a3 completion:(id)a4;
- (void)isBusinessRegisteredForPhoneNumber:(id)a3 completion:(id)a4;
- (void)isBusinessRegisteredForURL:(id)a3 chopURL:(BOOL)a4 completion:(id)a5;
- (void)isBusinessRegisteredForURL:(id)a3 completion:(id)a4;
- (void)prefetchBloomFilterAndConfigCacheWithCompletion:(id)a3;
- (void)warmCacheIfNecessaryForPhoneNumbers:(id)a3;
@end

@implementation BCSBusinessQueryService

- (BCSBusinessQueryService)init
{
  v3 = -[BCSXPCDaemonConnection initWithMachServiceName:exportedClient:]((id *)[BCSXPCDaemonConnection alloc], @"com.apple.businessservicesd", self);
  v4 = [MEMORY[0x263F086E0] mainBundle];
  v5 = [v4 bundleIdentifier];
  v6 = [(BCSBusinessQueryService *)self initWithConnection:v3 clientBundleIdentifier:v5];

  return v6;
}

- (BCSBusinessQueryService)initWithConnection:(id)a3 clientBundleIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)BCSBusinessQueryService;
  v9 = [(BCSBusinessQueryService *)&v20 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connection, a3);
    uint64_t v11 = [v8 copy];
    clientBundleIdentifier = v10->_clientBundleIdentifier;
    v10->_clientBundleIdentifier = (NSString *)v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    requestsById = v10->_requestsById;
    v10->_requestsById = v13;

    v15 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    requestLock = v10->_requestLock;
    v10->_requestLock = v15;

    dispatch_queue_t v17 = dispatch_queue_create("com.apple.BusinessQueryService.serialqueue", 0);
    serialQueue = v10->_serialQueue;
    v10->_serialQueue = (OS_dispatch_queue *)v17;

    [(BCSXPCDaemonConnectionProtocol *)v10->_connection setExportedClient:v10];
    [(BCSXPCDaemonConnectionProtocol *)v10->_connection resume];
  }

  return v10;
}

- (void)warmCacheIfNecessaryForPhoneNumbers:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = ABSLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    uint64_t v11 = "-[BCSBusinessQueryService warmCacheIfNecessaryForPhoneNumbers:]";
    _os_log_impl(&dword_2154F4000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v10, 0xCu);
  }

  if ((unint64_t)[v4 count] < 0x1F)
  {
    id v6 = v4;
  }
  else
  {
    objc_msgSend(v4, "subarrayWithRange:", 0, 30);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v7 = v6;
  if (self) {
    connection = self->_connection;
  }
  else {
    connection = 0;
  }
  v9 = [(BCSXPCDaemonConnectionProtocol *)connection remoteObjectProxy];
  [v9 warmCacheIfNecessaryForPhoneNumbers:v7 forClientBundleID:@"com.apple.businessservicesd"];
}

- (id)businessItemForPhoneNumber:(id)a3 isMessageable:(BOOL *)a4 isChatSuggestVisible:(BOOL *)a5 error:(id *)a6
{
  if (a4) {
    *a4 = 1;
  }
  return [(BCSBusinessQueryService *)self businessItemForPhoneNumber:a3 isChatSuggestVisible:a5 error:a6];
}

- (id)businessItemForPhoneNumber:(id)a3 isChatSuggestVisible:(BOOL *)a4 error:(id *)a5
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v8 = a3;
  v9 = ABSLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[BCSBusinessQueryService businessItemForPhoneNumber:isChatSuggestVisible:error:]";
    _os_log_impl(&dword_2154F4000, v9, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__2;
  v54 = __Block_byref_object_dispose__2;
  id v55 = 0;
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x2020000000;
  char v44 = 0;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__2;
  v39 = __Block_byref_object_dispose__2;
  id v40 = 0;
  if (self) {
    id Property = objc_getProperty(self, v10, 8, 1);
  }
  else {
    id Property = 0;
  }
  id v12 = Property;
  [v12 timeIntervalSinceNow];
  BOOL v15 = v13 <= 0.0 && v12 != 0;
  BOOL v16 = v13 > -2.0 && v15;
  if (v16) {
    goto LABEL_16;
  }
  dispatch_queue_t v17 = dispatch_group_create();
  dispatch_group_enter(v17);
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __81__BCSBusinessQueryService_businessItemForPhoneNumber_isChatSuggestVisible_error___block_invoke;
  v30[3] = &unk_264248EF8;
  p_long long buf = &buf;
  v33 = &v41;
  v34 = &v35;
  v18 = v17;
  v31 = v18;
  -[BCSBusinessQueryService _fetchBusinessItemWithDetailsForPhoneNumber:forClientBundleID:completion:]((uint64_t)self, v8, v30);
  dispatch_time_t v19 = dispatch_time(0, 1000000000);
  BOOL v20 = dispatch_group_wait(v18, v19) == 0;

  if (v20)
  {
    if (a4) {
      *a4 = *((unsigned char *)v42 + 24);
    }
    if (a5) {
      *a5 = (id) v36[5];
    }
    if (self) {
      objc_setProperty_atomic(self, v21, 0, 8);
    }
    id v28 = *(id *)(*((void *)&buf + 1) + 40);
  }
  else
  {
LABEL_16:
    v22 = ABSLogCommon();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v47 = 136315394;
      v48 = "-[BCSBusinessQueryService businessItemForPhoneNumber:isChatSuggestVisible:error:]";
      __int16 v49 = 1024;
      int v50 = !v16;
      _os_log_impl(&dword_2154F4000, v22, OS_LOG_TYPE_DEFAULT, "%s timed out - did really attempt:%d", v47, 0x12u);
    }

    if (a4) {
      *a4 = 0;
    }
    if (a5)
    {
      v23 = (void *)MEMORY[0x263F087E8];
      uint64_t v24 = *MEMORY[0x263F08338];
      v45[0] = *MEMORY[0x263F08320];
      v45[1] = v24;
      v46[0] = @"businessItemForPhoneNumber server fetch timed out";
      v46[1] = @"The operation timed out";
      v25 = [NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:2];
      *a5 = [v23 errorWithDomain:@"BusinessChat" code:-1001 userInfo:v25];
    }
    if (!v16)
    {
      v27 = [MEMORY[0x263EFF910] date];
      if (self) {
        objc_setProperty_atomic(self, v26, v27, 8);
      }
    }
    id v28 = 0;
  }

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&buf, 8);

  return v28;
}

void __81__BCSBusinessQueryService_businessItemForPhoneNumber_isChatSuggestVisible_error___block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a2;
  id v9 = a4;
  int v10 = ABSLogCommon();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (!v8 || v9)
  {
    if (v9)
    {
      if (v11)
      {
        int v12 = 136315650;
        double v13 = "-[BCSBusinessQueryService businessItemForPhoneNumber:isChatSuggestVisible:error:]_block_invoke";
        __int16 v14 = 2112;
        id v15 = v9;
        __int16 v16 = 1024;
        int v17 = a3;
        _os_log_impl(&dword_2154F4000, v10, OS_LOG_TYPE_DEFAULT, "%s Failed fetch with error %@ - isChatSuggestVisible:%d", (uint8_t *)&v12, 0x1Cu);
      }

      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a4);
    }
    else
    {
      if (v11)
      {
        int v12 = 136315394;
        double v13 = "-[BCSBusinessQueryService businessItemForPhoneNumber:isChatSuggestVisible:error:]_block_invoke";
        __int16 v14 = 1024;
        LODWORD(v15) = a3;
        _os_log_impl(&dword_2154F4000, v10, OS_LOG_TYPE_DEFAULT, "%s No bizItem exists for this phoneNumber - isChatSuggestVisible:%d", (uint8_t *)&v12, 0x12u);
      }
    }
  }
  else
  {
    if (v11)
    {
      int v12 = 136315394;
      double v13 = "-[BCSBusinessQueryService businessItemForPhoneNumber:isChatSuggestVisible:error:]_block_invoke";
      __int16 v14 = 1024;
      LODWORD(v15) = a3;
      _os_log_impl(&dword_2154F4000, v10, OS_LOG_TYPE_DEFAULT, "%s Fetched bizItem Visible %d", (uint8_t *)&v12, 0x12u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)_fetchBusinessItemWithDetailsForPhoneNumber:(uint64_t)a1 forClientBundleID:(void *)a2 completion:(void *)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a1)
  {
    id v6 = @"com.apple.businessservicesd";
    id v7 = a2;
    id v8 = ABSLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = *(void **)(a1 + 16);
      id v10 = v9;
      BOOL v11 = [v10 remoteObjectProxy];
      *(_DWORD *)long long buf = 136315650;
      uint64_t v18 = "-[BCSBusinessQueryService _fetchBusinessItemWithDetailsForPhoneNumber:forClientBundleID:completion:]";
      __int16 v19 = 2112;
      BOOL v20 = v9;
      __int16 v21 = 2112;
      v22 = v11;
      _os_log_impl(&dword_2154F4000, v8, OS_LOG_TYPE_DEFAULT, "%s - connection:%@ remoteObjectProxy:%@", buf, 0x20u);
    }
    id v12 = *(id *)(a1 + 16);
    double v13 = [v12 remoteObjectProxy];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __100__BCSBusinessQueryService__fetchBusinessItemWithDetailsForPhoneNumber_forClientBundleID_completion___block_invoke;
    v15[3] = &unk_264248F48;
    id v14 = v5;

    id v16 = v14;
    [v13 fetchBusinessItemWithDetailsForPhoneNumber:v7 forClientBundleID:@"com.apple.businessservicesd" completion:v15];
  }
}

- (void)fetchBusinessItemWithPhoneNumber:(id)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  id v8 = ABSLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
    {
      id v9 = self->_connection;
      connection = self->_connection;
    }
    else
    {
      id v9 = 0;
      connection = 0;
    }
    BOOL v11 = connection;
    id v12 = [(BCSXPCDaemonConnectionProtocol *)v11 remoteObjectProxy];
    *(_DWORD *)long long buf = 136315650;
    BOOL v20 = "-[BCSBusinessQueryService fetchBusinessItemWithPhoneNumber:completion:]";
    __int16 v21 = 2112;
    v22 = v9;
    __int16 v23 = 2112;
    uint64_t v24 = v12;
    _os_log_impl(&dword_2154F4000, v8, OS_LOG_TYPE_DEFAULT, "%s - connection:%@ remoteObjectProxy:%@", buf, 0x20u);
  }
  if (self) {
    double v13 = self->_connection;
  }
  else {
    double v13 = 0;
  }
  id v14 = v13;
  id v15 = [(BCSXPCDaemonConnectionProtocol *)v14 remoteObjectProxy];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __71__BCSBusinessQueryService_fetchBusinessItemWithPhoneNumber_completion___block_invoke;
  v17[3] = &unk_264248F20;

  id v18 = v6;
  id v16 = v6;
  [v15 fetchBusinessItemWithPhoneNumber:v7 forClientBundleID:@"com.apple.businessservicesd" completion:v17];
}

uint64_t __71__BCSBusinessQueryService_fetchBusinessItemWithPhoneNumber_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)fetchBusinessItemWithDetailsForPhoneNumber:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __81__BCSBusinessQueryService_fetchBusinessItemWithDetailsForPhoneNumber_completion___block_invoke;
  v8[3] = &unk_264248F48;
  id v9 = v6;
  id v7 = v6;
  -[BCSBusinessQueryService _fetchBusinessItemWithDetailsForPhoneNumber:forClientBundleID:completion:]((uint64_t)self, a3, v8);
}

uint64_t __81__BCSBusinessQueryService_fetchBusinessItemWithDetailsForPhoneNumber_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchBusinessItemForPhoneNumber:(id)a3 completion:(id)a4
{
}

uint64_t __100__BCSBusinessQueryService__fetchBusinessItemWithDetailsForPhoneNumber_forClientBundleID_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)isBusinessRegisteredForPhoneNumber:(id)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  id v8 = ABSLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
    {
      id v9 = self->_connection;
      connection = self->_connection;
    }
    else
    {
      id v9 = 0;
      connection = 0;
    }
    BOOL v11 = connection;
    id v12 = [(BCSXPCDaemonConnectionProtocol *)v11 remoteObjectProxy];
    *(_DWORD *)long long buf = 136315650;
    BOOL v20 = "-[BCSBusinessQueryService isBusinessRegisteredForPhoneNumber:completion:]";
    __int16 v21 = 2112;
    v22 = v9;
    __int16 v23 = 2112;
    uint64_t v24 = v12;
    _os_log_impl(&dword_2154F4000, v8, OS_LOG_TYPE_DEFAULT, "%s - connection:%@ remoteObjectProxy:%@", buf, 0x20u);
  }
  if (self) {
    double v13 = self->_connection;
  }
  else {
    double v13 = 0;
  }
  id v14 = v13;
  id v15 = [(BCSXPCDaemonConnectionProtocol *)v14 remoteObjectProxy];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __73__BCSBusinessQueryService_isBusinessRegisteredForPhoneNumber_completion___block_invoke;
  v17[3] = &unk_264248838;

  id v18 = v6;
  id v16 = v6;
  [v15 fetchIsBusinessPhoneNumber:v7 forClientBundleID:@"com.apple.businessservicesd" completion:v17];
}

uint64_t __73__BCSBusinessQueryService_isBusinessRegisteredForPhoneNumber_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)fetchSquareIconDataForBusinessItem:(id)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (v6)
  {
    id v7 = a3;
    id v8 = ABSLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (self)
      {
        id v9 = self->_connection;
        connection = self->_connection;
      }
      else
      {
        id v9 = 0;
        connection = 0;
      }
      BOOL v11 = connection;
      id v12 = [(BCSXPCDaemonConnectionProtocol *)v11 remoteObjectProxy];
      *(_DWORD *)long long buf = 136315650;
      BOOL v20 = "-[BCSBusinessQueryService fetchSquareIconDataForBusinessItem:completion:]";
      __int16 v21 = 2112;
      v22 = v9;
      __int16 v23 = 2112;
      uint64_t v24 = v12;
      _os_log_impl(&dword_2154F4000, v8, OS_LOG_TYPE_DEFAULT, "%s - connection:%@ remoteObjectProxy:%@", buf, 0x20u);
    }
    if (self) {
      double v13 = self->_connection;
    }
    else {
      double v13 = 0;
    }
    id v14 = v13;
    id v15 = [(BCSXPCDaemonConnectionProtocol *)v14 remoteObjectProxy];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __73__BCSBusinessQueryService_fetchSquareIconDataForBusinessItem_completion___block_invoke;
    v17[3] = &unk_264248F70;
    id v16 = v6;

    id v18 = v16;
    [v15 fetchSquareIconDataForBusinessItem:v7 forClientBundleID:@"com.apple.businessservicesd" completion:v17];
  }
}

uint64_t __73__BCSBusinessQueryService_fetchSquareIconDataForBusinessItem_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchLinkItemWithURL:(id)a3 completion:(id)a4
{
}

- (void)fetchLinkItemWithURL:(id)a3 chopURL:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = a3;
  id v10 = ABSLogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
    {
      BOOL v11 = self->_connection;
      connection = self->_connection;
    }
    else
    {
      BOOL v11 = 0;
      connection = 0;
    }
    double v13 = connection;
    id v14 = [(BCSXPCDaemonConnectionProtocol *)v13 remoteObjectProxy];
    *(_DWORD *)long long buf = 136315650;
    v22 = "-[BCSBusinessQueryService fetchLinkItemWithURL:chopURL:completion:]";
    __int16 v23 = 2112;
    uint64_t v24 = v11;
    __int16 v25 = 2112;
    v26 = v14;
    _os_log_impl(&dword_2154F4000, v10, OS_LOG_TYPE_DEFAULT, "%s - connection:%@ remoteObjectProxy:%@", buf, 0x20u);
  }
  if (self) {
    id v15 = self->_connection;
  }
  else {
    id v15 = 0;
  }
  id v16 = v15;
  int v17 = [(BCSXPCDaemonConnectionProtocol *)v16 remoteObjectProxy];
  if (self) {
    self = (BCSBusinessQueryService *)self->_clientBundleIdentifier;
  }
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __67__BCSBusinessQueryService_fetchLinkItemWithURL_chopURL_completion___block_invoke;
  v19[3] = &unk_264248F98;
  id v20 = v8;
  id v18 = v8;
  [v17 fetchLinkItemModelWithURL:v9 chopURL:v5 forClientBundleID:self completion:v19];
}

void __67__BCSBusinessQueryService_fetchLinkItemWithURL_chopURL_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6)
  {
    if (v10)
    {
      id v7 = [BCSLinkItem alloc];
      id v8 = objc_alloc_init(BCSLocaleHelper);
      id v9 = [(BCSLinkItem *)v7 initWithLinkItemModel:v10 localeHelper:v8];

      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, 0, v5);
    }
  }
}

- (void)isBusinessRegisteredForURL:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __65__BCSBusinessQueryService_isBusinessRegisteredForURL_completion___block_invoke;
  v8[3] = &unk_264248FC0;
  id v9 = v6;
  id v7 = v6;
  [(BCSBusinessQueryService *)self isBusinessRegisteredForURL:a3 chopURL:1 completion:v8];
}

uint64_t __65__BCSBusinessQueryService_isBusinessRegisteredForURL_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)isBusinessRegisteredForURL:(id)a3 chopURL:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = a3;
  id v10 = ABSLogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
    {
      BOOL v11 = self->_connection;
      connection = self->_connection;
    }
    else
    {
      BOOL v11 = 0;
      connection = 0;
    }
    double v13 = connection;
    id v14 = [(BCSXPCDaemonConnectionProtocol *)v13 remoteObjectProxy];
    *(_DWORD *)long long buf = 136315650;
    v22 = "-[BCSBusinessQueryService isBusinessRegisteredForURL:chopURL:completion:]";
    __int16 v23 = 2112;
    uint64_t v24 = v11;
    __int16 v25 = 2112;
    v26 = v14;
    _os_log_impl(&dword_2154F4000, v10, OS_LOG_TYPE_DEFAULT, "%s - connection:%@ remoteObjectProxy:%@", buf, 0x20u);
  }
  if (self) {
    id v15 = self->_connection;
  }
  else {
    id v15 = 0;
  }
  id v16 = v15;
  int v17 = [(BCSXPCDaemonConnectionProtocol *)v16 remoteObjectProxy];
  if (self) {
    self = (BCSBusinessQueryService *)self->_clientBundleIdentifier;
  }
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __73__BCSBusinessQueryService_isBusinessRegisteredForURL_chopURL_completion___block_invoke;
  v19[3] = &unk_264248FE8;
  id v20 = v8;
  id v18 = v8;
  [v17 isBusinessRegisteredForURL:v9 chopURL:v5 forClientBundleID:self completion:v19];
}

uint64_t __73__BCSBusinessQueryService_isBusinessRegisteredForURL_chopURL_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a3, a5);
  }
  return result;
}

- (void)_isBusinessRegisteredForURL:(id)a3 chopURL:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = a3;
  id v10 = ABSLogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
    {
      BOOL v11 = self->_connection;
      connection = self->_connection;
    }
    else
    {
      BOOL v11 = 0;
      connection = 0;
    }
    double v13 = connection;
    id v14 = [(BCSXPCDaemonConnectionProtocol *)v13 remoteObjectProxy];
    *(_DWORD *)long long buf = 136315650;
    v22 = "-[BCSBusinessQueryService _isBusinessRegisteredForURL:chopURL:completion:]";
    __int16 v23 = 2112;
    uint64_t v24 = v11;
    __int16 v25 = 2112;
    v26 = v14;
    _os_log_impl(&dword_2154F4000, v10, OS_LOG_TYPE_DEFAULT, "%s - connection:%@ remoteObjectProxy:%@", buf, 0x20u);
  }
  if (self) {
    id v15 = self->_connection;
  }
  else {
    id v15 = 0;
  }
  id v16 = v15;
  int v17 = [(BCSXPCDaemonConnectionProtocol *)v16 remoteObjectProxy];
  if (self) {
    self = (BCSBusinessQueryService *)self->_clientBundleIdentifier;
  }
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __74__BCSBusinessQueryService__isBusinessRegisteredForURL_chopURL_completion___block_invoke;
  v19[3] = &unk_264248FE8;
  id v20 = v8;
  id v18 = v8;
  [v17 isBusinessRegisteredForURL:v9 chopURL:v5 forClientBundleID:self completion:v19];
}

uint64_t __74__BCSBusinessQueryService__isBusinessRegisteredForURL_chopURL_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)fetchLinkItemWithHash:(id)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  id v8 = ABSLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
    {
      id v9 = self->_connection;
      connection = self->_connection;
    }
    else
    {
      id v9 = 0;
      connection = 0;
    }
    BOOL v11 = connection;
    id v12 = [(BCSXPCDaemonConnectionProtocol *)v11 remoteObjectProxy];
    *(_DWORD *)long long buf = 136315650;
    id v20 = "-[BCSBusinessQueryService fetchLinkItemWithHash:completion:]";
    __int16 v21 = 2112;
    v22 = v9;
    __int16 v23 = 2112;
    uint64_t v24 = v12;
    _os_log_impl(&dword_2154F4000, v8, OS_LOG_TYPE_DEFAULT, "%s - connection:%@ remoteObjectProxy:%@", buf, 0x20u);
  }
  if (self) {
    double v13 = self->_connection;
  }
  else {
    double v13 = 0;
  }
  id v14 = v13;
  id v15 = [(BCSXPCDaemonConnectionProtocol *)v14 remoteObjectProxy];
  if (self) {
    self = (BCSBusinessQueryService *)self->_clientBundleIdentifier;
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __60__BCSBusinessQueryService_fetchLinkItemWithHash_completion___block_invoke;
  v17[3] = &unk_264248F98;
  id v18 = v6;
  id v16 = v6;
  [v15 fetchLinkItemModelWithHash:v7 forClientBundleID:self completion:v17];
}

void __60__BCSBusinessQueryService_fetchLinkItemWithHash_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6)
  {
    if (v10)
    {
      id v7 = [BCSLinkItem alloc];
      id v8 = objc_alloc_init(BCSLocaleHelper);
      id v9 = [(BCSLinkItem *)v7 initWithLinkItemModel:v10 localeHelper:v8];

      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, 0, v5);
    }
  }
}

- (void)isBusinessCallerRegisteredForPhoneNumber:(id)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  id v8 = ABSLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
    {
      id v9 = self->_connection;
      connection = self->_connection;
    }
    else
    {
      id v9 = 0;
      connection = 0;
    }
    BOOL v11 = connection;
    id v12 = [(BCSXPCDaemonConnectionProtocol *)v11 remoteObjectProxy];
    *(_DWORD *)long long buf = 136315650;
    id v20 = "-[BCSBusinessQueryService isBusinessCallerRegisteredForPhoneNumber:completion:]";
    __int16 v21 = 2112;
    v22 = v9;
    __int16 v23 = 2112;
    uint64_t v24 = v12;
    _os_log_impl(&dword_2154F4000, v8, OS_LOG_TYPE_DEFAULT, "%s - connection:%@ remoteObjectProxy:%@", buf, 0x20u);
  }
  if (self) {
    double v13 = self->_connection;
  }
  else {
    double v13 = 0;
  }
  id v14 = v13;
  id v15 = [(BCSXPCDaemonConnectionProtocol *)v14 remoteObjectProxy];
  if (self) {
    self = (BCSBusinessQueryService *)self->_clientBundleIdentifier;
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __79__BCSBusinessQueryService_isBusinessCallerRegisteredForPhoneNumber_completion___block_invoke;
  v17[3] = &unk_264248838;
  id v18 = v6;
  id v16 = v6;
  [v15 isBusinessCallerRegisteredForPhoneNumber:v7 forClientBundleID:self completion:v17];
}

uint64_t __79__BCSBusinessQueryService_isBusinessCallerRegisteredForPhoneNumber_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)fetchBusinessCallerMetadataWithPhoneNumber:(id)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  id v8 = ABSLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
    {
      id v9 = self->_connection;
      connection = self->_connection;
    }
    else
    {
      id v9 = 0;
      connection = 0;
    }
    BOOL v11 = connection;
    id v12 = [(BCSXPCDaemonConnectionProtocol *)v11 remoteObjectProxy];
    *(_DWORD *)long long buf = 136315650;
    id v20 = "-[BCSBusinessQueryService fetchBusinessCallerMetadataWithPhoneNumber:completion:]";
    __int16 v21 = 2112;
    v22 = v9;
    __int16 v23 = 2112;
    uint64_t v24 = v12;
    _os_log_impl(&dword_2154F4000, v8, OS_LOG_TYPE_DEFAULT, "%s - connection:%@ remoteObjectProxy:%@", buf, 0x20u);
  }
  if (self) {
    double v13 = self->_connection;
  }
  else {
    double v13 = 0;
  }
  id v14 = v13;
  id v15 = [(BCSXPCDaemonConnectionProtocol *)v14 remoteObjectProxy];
  if (self) {
    self = (BCSBusinessQueryService *)self->_clientBundleIdentifier;
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __81__BCSBusinessQueryService_fetchBusinessCallerMetadataWithPhoneNumber_completion___block_invoke;
  v17[3] = &unk_264249010;
  id v18 = v6;
  id v16 = v6;
  [v15 fetchBusinessCallerMetadataForPhoneNumber:v7 forClientBundleID:self completion:v17];
}

uint64_t __81__BCSBusinessQueryService_fetchBusinessCallerMetadataWithPhoneNumber_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)fetchBusinessCallerMetadataForPhoneNumber:(id)a3 metadataCallback:(id)a4 logoURLCallback:(id)a5 completion:(id)a6
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  id v14 = ABSLogCommon();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
    {
      id v15 = self->_connection;
      connection = self->_connection;
    }
    else
    {
      id v15 = 0;
      connection = 0;
    }
    int v17 = connection;
    id v18 = [(BCSXPCDaemonConnectionProtocol *)v17 remoteObjectProxy];
    *(_DWORD *)long long buf = 136315650;
    v32 = "-[BCSBusinessQueryService fetchBusinessCallerMetadataForPhoneNumber:metadataCallback:logoURLCallback:completion:]";
    __int16 v33 = 2112;
    v34 = v15;
    __int16 v35 = 2112;
    v36 = v18;
    _os_log_impl(&dword_2154F4000, v14, OS_LOG_TYPE_DEFAULT, "%s - connection:%@ remoteObjectProxy:%@", buf, 0x20u);
  }
  if (self) {
    __int16 v19 = self->_connection;
  }
  else {
    __int16 v19 = 0;
  }
  id v20 = v19;
  __int16 v21 = [(BCSXPCDaemonConnectionProtocol *)v20 remoteObjectProxy];
  if (self) {
    self = (BCSBusinessQueryService *)self->_clientBundleIdentifier;
  }
  id v28 = v11;
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __113__BCSBusinessQueryService_fetchBusinessCallerMetadataForPhoneNumber_metadataCallback_logoURLCallback_completion___block_invoke;
  v29[3] = &unk_264249038;
  id v30 = v10;
  id v26 = v12;
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __113__BCSBusinessQueryService_fetchBusinessCallerMetadataForPhoneNumber_metadataCallback_logoURLCallback_completion___block_invoke_2;
  v27[3] = &unk_264249060;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __113__BCSBusinessQueryService_fetchBusinessCallerMetadataForPhoneNumber_metadataCallback_logoURLCallback_completion___block_invoke_3;
  v25[3] = &unk_264249088;
  id v22 = v12;
  id v23 = v11;
  id v24 = v10;
  [v21 fetchBusinessCallerMetadataForPhoneNumber:v13 forClientBundleID:self metadataCallback:v29 logoURLCallback:v27 completion:v25];
}

uint64_t __113__BCSBusinessQueryService_fetchBusinessCallerMetadataForPhoneNumber_metadataCallback_logoURLCallback_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __113__BCSBusinessQueryService_fetchBusinessCallerMetadataForPhoneNumber_metadataCallback_logoURLCallback_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __113__BCSBusinessQueryService_fetchBusinessCallerMetadataForPhoneNumber_metadataCallback_logoURLCallback_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)fetchBusinessMetadataForEmail:(id)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  id v8 = ABSLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
    {
      id v9 = self->_connection;
      connection = self->_connection;
    }
    else
    {
      id v9 = 0;
      connection = 0;
    }
    id v11 = connection;
    id v12 = [(BCSXPCDaemonConnectionProtocol *)v11 remoteObjectProxy];
    *(_DWORD *)long long buf = 136315650;
    id v20 = "-[BCSBusinessQueryService fetchBusinessMetadataForEmail:completion:]";
    __int16 v21 = 2112;
    id v22 = v9;
    __int16 v23 = 2112;
    id v24 = v12;
    _os_log_impl(&dword_2154F4000, v8, OS_LOG_TYPE_DEFAULT, "%s - connection:%@ remoteObjectProxy:%@", buf, 0x20u);
  }
  if (self) {
    id v13 = self->_connection;
  }
  else {
    id v13 = 0;
  }
  id v14 = v13;
  id v15 = [(BCSXPCDaemonConnectionProtocol *)v14 remoteObjectProxy];
  if (self) {
    self = (BCSBusinessQueryService *)self->_clientBundleIdentifier;
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __68__BCSBusinessQueryService_fetchBusinessMetadataForEmail_completion___block_invoke;
  v17[3] = &unk_2642490B0;
  id v18 = v6;
  id v16 = v6;
  [v15 fetchBusinessMetadataForEmail:v7 forClientBundleID:self completion:v17];
}

uint64_t __68__BCSBusinessQueryService_fetchBusinessMetadataForEmail_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)fetchBusinessMetadataForEmailIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  id v8 = ABSLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
    {
      id v9 = self->_connection;
      connection = self->_connection;
    }
    else
    {
      id v9 = 0;
      connection = 0;
    }
    id v11 = connection;
    id v12 = [(BCSXPCDaemonConnectionProtocol *)v11 remoteObjectProxy];
    *(_DWORD *)long long buf = 136315650;
    id v20 = "-[BCSBusinessQueryService fetchBusinessMetadataForEmailIdentifier:completion:]";
    __int16 v21 = 2112;
    id v22 = v9;
    __int16 v23 = 2112;
    id v24 = v12;
    _os_log_impl(&dword_2154F4000, v8, OS_LOG_TYPE_DEFAULT, "%s - connection:%@ remoteObjectProxy:%@", buf, 0x20u);
  }
  if (self) {
    id v13 = self->_connection;
  }
  else {
    id v13 = 0;
  }
  id v14 = v13;
  id v15 = [(BCSXPCDaemonConnectionProtocol *)v14 remoteObjectProxy];
  if (self) {
    self = (BCSBusinessQueryService *)self->_clientBundleIdentifier;
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __78__BCSBusinessQueryService_fetchBusinessMetadataForEmailIdentifier_completion___block_invoke;
  v17[3] = &unk_2642490B0;
  id v18 = v6;
  id v16 = v6;
  [v15 fetchBusinessMetadataForEmailIdentifier:v7 forClientBundleID:self completion:v17];
}

uint64_t __78__BCSBusinessQueryService_fetchBusinessMetadataForEmailIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)fetchBusinessLogoForBusinessIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  id v8 = ABSLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
    {
      id v9 = self->_connection;
      connection = self->_connection;
    }
    else
    {
      id v9 = 0;
      connection = 0;
    }
    id v11 = connection;
    id v12 = [(BCSXPCDaemonConnectionProtocol *)v11 remoteObjectProxy];
    *(_DWORD *)long long buf = 136315650;
    id v20 = "-[BCSBusinessQueryService fetchBusinessLogoForBusinessIdentifier:completion:]";
    __int16 v21 = 2112;
    id v22 = v9;
    __int16 v23 = 2112;
    id v24 = v12;
    _os_log_impl(&dword_2154F4000, v8, OS_LOG_TYPE_DEFAULT, "%s - connection:%@ remoteObjectProxy:%@", buf, 0x20u);
  }
  if (self) {
    id v13 = self->_connection;
  }
  else {
    id v13 = 0;
  }
  id v14 = v13;
  id v15 = [(BCSXPCDaemonConnectionProtocol *)v14 remoteObjectProxy];
  if (self) {
    self = (BCSBusinessQueryService *)self->_clientBundleIdentifier;
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __77__BCSBusinessQueryService_fetchBusinessLogoForBusinessIdentifier_completion___block_invoke;
  v17[3] = &unk_2642490D8;
  id v18 = v6;
  id v16 = v6;
  [v15 fetchBusinessLogoForBusinessIdentifier:v7 forClientBundleID:self completion:v17];
}

uint64_t __77__BCSBusinessQueryService_fetchBusinessLogoForBusinessIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)fetchBusinessMetadataForEmails:(id)a3 perItemCallback:(id)a4 completion:(id)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, BCSBusinessQueryRequest *))a5;
  id v11 = ABSLogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
    {
      id v12 = self->_connection;
      connection = self->_connection;
    }
    else
    {
      id v12 = 0;
      connection = 0;
    }
    id v14 = connection;
    id v15 = [(BCSXPCDaemonConnectionProtocol *)v14 remoteObjectProxy];
    *(_DWORD *)long long buf = 136315650;
    v32 = "-[BCSBusinessQueryService fetchBusinessMetadataForEmails:perItemCallback:completion:]";
    __int16 v33 = 2112;
    v34 = v12;
    __int16 v35 = 2112;
    v36 = v15;
    _os_log_impl(&dword_2154F4000, v11, OS_LOG_TYPE_DEFAULT, "%s - connection:%@ remoteObjectProxy:%@", buf, 0x20u);
  }
  if (![v8 count])
  {
    int v17 = +[BCSError errorWithDomain:@"com.apple.businessservices" code:44 errorDescription:@"Batch must contain at least one identifier"];
    goto LABEL_9;
  }
  if ((unint64_t)[v8 count] >= 0x1F)
  {
    id v16 = objc_msgSend(NSString, "stringWithFormat:", @"Batch exceeds maximum size (%ld > %lu)", objc_msgSend(v8, "count"), 30);
    int v17 = +[BCSError errorWithDomain:@"com.apple.businessservices" code:44 errorDescription:v16];

LABEL_9:
    v10[2](v10, v17);
    goto LABEL_21;
  }
  int v17 = objc_alloc_init(BCSBusinessQueryRequest);
  id v18 = [MEMORY[0x263F08C38] UUID];
  [(BCSBusinessQueryRequest *)v17 setRequestId:v18];

  [(BCSBusinessQueryRequest *)v17 setFetchEmailsPerItemBlock:v9];
  [(BCSBusinessQueryRequest *)v17 setFetchEmailsCompletion:v10];
  if (self)
  {
    [(NSLock *)self->_requestLock lock];
    requestsById = self->_requestsById;
  }
  else
  {
    [0 lock];
    requestsById = 0;
  }
  id v20 = requestsById;
  __int16 v21 = [(BCSBusinessQueryRequest *)v17 requestId];
  [(NSMutableDictionary *)v20 setObject:v17 forKeyedSubscript:v21];

  if (self) {
    requestLock = self->_requestLock;
  }
  else {
    requestLock = 0;
  }
  [(NSLock *)requestLock unlock];
  __int16 v23 = ABSLogCommon();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    id v24 = [(BCSBusinessQueryRequest *)v17 requestId];
    *(_DWORD *)long long buf = 136315394;
    v32 = "-[BCSBusinessQueryService fetchBusinessMetadataForEmails:perItemCallback:completion:]";
    __int16 v33 = 2112;
    v34 = v24;
    _os_log_impl(&dword_2154F4000, v23, OS_LOG_TYPE_DEFAULT, "%s - issuing request with requestId: %@", buf, 0x16u);
  }
  if (self) {
    uint64_t v25 = self->_connection;
  }
  else {
    uint64_t v25 = 0;
  }
  id v26 = v25;
  uint64_t v27 = [(BCSXPCDaemonConnectionProtocol *)v26 remoteObjectProxy];
  if (self) {
    clientBundleIdentifier = self->_clientBundleIdentifier;
  }
  else {
    clientBundleIdentifier = 0;
  }
  v29 = clientBundleIdentifier;
  id v30 = [(BCSBusinessQueryRequest *)v17 requestId];
  [v27 fetchBusinessMetadataForEmails:v8 forClientBundleID:v29 requestId:v30 completion:&__block_literal_global_4];

LABEL_21:
}

void __85__BCSBusinessQueryService_fetchBusinessMetadataForEmails_perItemCallback_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (v2)
  {
    v3 = ABSLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_error_impl(&dword_2154F4000, v3, OS_LOG_TYPE_ERROR, "fetchBusinessMetadataForEmails:forClientBundleId:requestId:completion: did error: %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (id)cachedBusinessMetadataForEmail:(id)a3 error:(id *)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = ABSLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
    {
      id v8 = self->_connection;
      connection = self->_connection;
    }
    else
    {
      id v8 = 0;
      connection = 0;
    }
    id v10 = connection;
    id v11 = [(BCSXPCDaemonConnectionProtocol *)v10 remoteObjectProxy];
    *(_DWORD *)long long buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[BCSBusinessQueryService cachedBusinessMetadataForEmail:error:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2112;
    __int16 v35 = v11;
    _os_log_impl(&dword_2154F4000, v7, OS_LOG_TYPE_DEFAULT, "%s - connection:%@ remoteObjectProxy:%@", buf, 0x20u);
  }
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  __int16 v35 = __Block_byref_object_copy__2;
  v36 = __Block_byref_object_dispose__2;
  id v37 = 0;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__2;
  v32 = __Block_byref_object_dispose__2;
  id v33 = 0;
  if (self) {
    id v12 = self->_connection;
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __64__BCSBusinessQueryService_cachedBusinessMetadataForEmail_error___block_invoke;
  v27[3] = &unk_264249120;
  void v27[4] = &v28;
  id v14 = [(BCSXPCDaemonConnectionProtocol *)v13 synchronousRemoteObjectProxyWithErrorHandler:v27];

  if (self) {
    serialQueue = self->_serialQueue;
  }
  else {
    serialQueue = 0;
  }
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __64__BCSBusinessQueryService_cachedBusinessMetadataForEmail_error___block_invoke_2;
  v21[3] = &unk_264249170;
  id v16 = v14;
  id v22 = v16;
  id v17 = v6;
  id v23 = v17;
  id v24 = self;
  uint64_t v25 = &v28;
  id v26 = buf;
  dispatch_sync(serialQueue, v21);
  if (a4)
  {
    id v18 = (void *)v29[5];
    if (v18) {
      *a4 = v18;
    }
  }
  id v19 = *(id *)(*(void *)&buf[8] + 40);

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(buf, 8);

  return v19;
}

void __64__BCSBusinessQueryService_cachedBusinessMetadataForEmail_error___block_invoke(uint64_t a1, void *a2)
{
}

uint64_t __64__BCSBusinessQueryService_cachedBusinessMetadataForEmail_error___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4) {
    uint64_t v5 = *(void *)(v4 + 24);
  }
  else {
    uint64_t v5 = 0;
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__BCSBusinessQueryService_cachedBusinessMetadataForEmail_error___block_invoke_3;
  v7[3] = &unk_264249148;
  long long v8 = *(_OWORD *)(a1 + 56);
  return [v2 cachedBusinessMetadataForEmail:v3 forClientBundleID:v5 completion:v7];
}

void __64__BCSBusinessQueryService_cachedBusinessMetadataForEmail_error___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (a3)
  {
    uint64_t v6 = [a3 copy];
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    long long v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
}

- (void)prefetchBloomFilterAndConfigCacheWithCompletion:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = ABSLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
    {
      uint64_t v6 = self->_connection;
      connection = self->_connection;
    }
    else
    {
      uint64_t v6 = 0;
      connection = 0;
    }
    long long v8 = connection;
    uint64_t v9 = [(BCSXPCDaemonConnectionProtocol *)v8 remoteObjectProxy];
    int v12 = 136315650;
    id v13 = "-[BCSBusinessQueryService prefetchBloomFilterAndConfigCacheWithCompletion:]";
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v9;
    _os_log_impl(&dword_2154F4000, v5, OS_LOG_TYPE_DEFAULT, "%s - connection:%@ remoteObjectProxy:%@", (uint8_t *)&v12, 0x20u);
  }
  if (self) {
    id v10 = self->_connection;
  }
  else {
    id v10 = 0;
  }
  id v11 = [(BCSXPCDaemonConnectionProtocol *)v10 remoteObjectProxy];
  [v11 prefetchMegashardsWithCompletion:v4];
}

- (void)clearCachesForType:(int64_t)a3 completion:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = ABSLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
    {
      long long v8 = self->_connection;
      connection = self->_connection;
    }
    else
    {
      long long v8 = 0;
      connection = 0;
    }
    id v10 = connection;
    id v11 = [(BCSXPCDaemonConnectionProtocol *)v10 remoteObjectProxy];
    int v14 = 136315650;
    id v15 = "-[BCSBusinessQueryService clearCachesForType:completion:]";
    __int16 v16 = 2112;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v11;
    _os_log_impl(&dword_2154F4000, v7, OS_LOG_TYPE_DEFAULT, "%s - connection:%@ remoteObjectProxy:%@", (uint8_t *)&v14, 0x20u);
  }
  if (self) {
    int v12 = self->_connection;
  }
  else {
    int v12 = 0;
  }
  id v13 = [(BCSXPCDaemonConnectionProtocol *)v12 remoteObjectProxy];
  [v13 clearCachesForType:a3 completion:v6];
}

- (void)clearExpiredCachesForType:(int64_t)a3 completion:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = ABSLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
    {
      long long v8 = self->_connection;
      connection = self->_connection;
    }
    else
    {
      long long v8 = 0;
      connection = 0;
    }
    id v10 = connection;
    id v11 = [(BCSXPCDaemonConnectionProtocol *)v10 remoteObjectProxy];
    int v14 = 136315650;
    id v15 = "-[BCSBusinessQueryService clearExpiredCachesForType:completion:]";
    __int16 v16 = 2112;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v11;
    _os_log_impl(&dword_2154F4000, v7, OS_LOG_TYPE_DEFAULT, "%s - connection:%@ remoteObjectProxy:%@", (uint8_t *)&v14, 0x20u);
  }
  if (self) {
    int v12 = self->_connection;
  }
  else {
    int v12 = 0;
  }
  id v13 = [(BCSXPCDaemonConnectionProtocol *)v12 remoteObjectProxy];
  [v13 clearExpiredCachesForType:a3 completion:v6];
}

- (void)clearCachesForLinkItemsAssociatedWithBundleID:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  long long v8 = ABSLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
    {
      uint64_t v9 = self->_connection;
      connection = self->_connection;
    }
    else
    {
      uint64_t v9 = 0;
      connection = 0;
    }
    id v11 = connection;
    int v12 = [(BCSXPCDaemonConnectionProtocol *)v11 remoteObjectProxy];
    int v15 = 136315650;
    __int16 v16 = "-[BCSBusinessQueryService clearCachesForLinkItemsAssociatedWithBundleID:completion:]";
    __int16 v17 = 2112;
    __int16 v18 = v9;
    __int16 v19 = 2112;
    uint64_t v20 = v12;
    _os_log_impl(&dword_2154F4000, v8, OS_LOG_TYPE_DEFAULT, "%s - connection:%@ remoteObjectProxy:%@", (uint8_t *)&v15, 0x20u);
  }
  if (self) {
    id v13 = self->_connection;
  }
  else {
    id v13 = 0;
  }
  int v14 = [(BCSXPCDaemonConnectionProtocol *)v13 remoteObjectProxy];
  [v14 clearCachesForLinkItemsAssociatedWithBundleID:v7 completion:v6];
}

- (void)didFetchBusinessMetadata:(id)a3 forEmailIdentifier:(id)a4 requestId:(id)a5 error:(id)a6 reply:(id)a7
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  int v14 = (char *)a5;
  id v15 = a6;
  __int16 v16 = (void (**)(id, uint64_t))a7;
  __int16 v17 = ABSLogCommon();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138413058;
    id v24 = v14;
    __int16 v25 = 2112;
    id v26 = v12;
    __int16 v27 = 2112;
    id v28 = v13;
    __int16 v29 = 2112;
    id v30 = v15;
    _os_log_impl(&dword_2154F4000, v17, OS_LOG_TYPE_DEFAULT, "didFetchBusinessMetadata:forEmailIdentifier:withError:reply: - requestId: %@, metadata: %@, identifier: %@, error: %@", (uint8_t *)&v23, 0x2Au);
  }

  if (self)
  {
    [(NSLock *)self->_requestLock lock];
    requestsById = self->_requestsById;
  }
  else
  {
    [0 lock];
    requestsById = 0;
  }
  __int16 v19 = [(NSMutableDictionary *)requestsById objectForKeyedSubscript:v14];
  if (self) {
    requestLock = self->_requestLock;
  }
  else {
    requestLock = 0;
  }
  [(NSLock *)requestLock unlock];
  if (v19)
  {
    uint64_t v21 = [v19 fetchEmailsPerItemBlock];
    uint64_t v22 = (*(uint64_t (**)(uint64_t, id, id, id))(v21 + 16))(v21, v13, v12, v15);
  }
  else
  {
    uint64_t v21 = ABSLogCommon();
    if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR))
    {
      int v23 = 136315138;
      id v24 = "-[BCSBusinessQueryService didFetchBusinessMetadata:forEmailIdentifier:requestId:error:reply:]";
      _os_log_error_impl(&dword_2154F4000, (os_log_t)v21, OS_LOG_TYPE_ERROR, "%s - Invalid request ID!", (uint8_t *)&v23, 0xCu);
    }
    uint64_t v22 = 0;
  }

  v16[2](v16, v22);
}

- (void)didFetchBusinessMetadataForEmailsForRequestId:(id)a3 error:(id)a4 reply:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  long long v8 = (char *)a3;
  id v9 = a4;
  id v10 = (void (**)(void))a5;
  id v11 = ABSLogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138412546;
    uint64_t v21 = v8;
    __int16 v22 = 2112;
    id v23 = v9;
    _os_log_impl(&dword_2154F4000, v11, OS_LOG_TYPE_DEFAULT, "didFetchBusinessMetadataForEmailsWithError:reply: - requestId: %@, error: %@", (uint8_t *)&v20, 0x16u);
  }

  if (self)
  {
    [(NSLock *)self->_requestLock lock];
    requestsById = self->_requestsById;
  }
  else
  {
    [0 lock];
    requestsById = 0;
  }
  id v13 = [(NSMutableDictionary *)requestsById objectForKeyedSubscript:v8];
  if (self) {
    requestLock = self->_requestLock;
  }
  else {
    requestLock = 0;
  }
  [(NSLock *)requestLock unlock];
  if (v13)
  {
    if (self)
    {
      [(NSLock *)self->_requestLock lock];
      id v15 = self->_requestsById;
    }
    else
    {
      [0 lock];
      id v15 = 0;
    }
    __int16 v16 = v15;
    __int16 v17 = [v13 requestId];
    [(NSMutableDictionary *)v16 removeObjectForKey:v17];

    if (self) {
      __int16 v18 = self->_requestLock;
    }
    else {
      __int16 v18 = 0;
    }
    [(NSLock *)v18 unlock];
    uint64_t v19 = [v13 fetchEmailsCompletion];
    (*(void (**)(uint64_t, id))(v19 + 16))(v19, v9);
  }
  else
  {
    uint64_t v19 = ABSLogCommon();
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR))
    {
      int v20 = 136315138;
      uint64_t v21 = "-[BCSBusinessQueryService didFetchBusinessMetadataForEmailsForRequestId:error:reply:]";
      _os_log_error_impl(&dword_2154F4000, (os_log_t)v19, OS_LOG_TYPE_ERROR, "%s - Invalid request ID!", (uint8_t *)&v20, 0xCu);
    }
  }

  v10[2](v10);
}

- (void)_deleteInMemoryCache
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v3 = ABSLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
    {
      id v4 = self->_connection;
      connection = self->_connection;
    }
    else
    {
      id v4 = 0;
      connection = 0;
    }
    id v6 = connection;
    id v7 = [(BCSXPCDaemonConnectionProtocol *)v6 remoteObjectProxy];
    int v10 = 136315650;
    id v11 = "-[BCSBusinessQueryService _deleteInMemoryCache]";
    __int16 v12 = 2112;
    id v13 = v4;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl(&dword_2154F4000, v3, OS_LOG_TYPE_DEFAULT, "%s - connection:%@ remoteObjectProxy:%@", (uint8_t *)&v10, 0x20u);
  }
  if (self) {
    long long v8 = self->_connection;
  }
  else {
    long long v8 = 0;
  }
  id v9 = [(BCSXPCDaemonConnectionProtocol *)v8 remoteObjectProxy];
  [v9 _deleteInMemoryCache];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_requestLock, 0);
  objc_storeStrong((id *)&self->_requestsById, 0);
  objc_storeStrong((id *)&self->_clientBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_lastTimeoutDate, 0);
}

@end
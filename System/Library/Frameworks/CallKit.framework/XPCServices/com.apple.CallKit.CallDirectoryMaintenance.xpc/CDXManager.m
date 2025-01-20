@interface CDXManager
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CDXManager)init;
- (CUSystemMonitor)systemMonitor;
- (CXCallDirectoryHost)host;
- (FTServerBag)serverBag;
- (OS_dispatch_group)liveLookupGroup;
- (_TtC42com_apple_CallKit_CallDirectoryMaintenance20LiveLookupStoreProxy)liveLookupStore;
- (_TtC42com_apple_CallKit_CallDirectoryMaintenance21CoreAnalyticsReporter)analyticsReporter;
- (_TtC42com_apple_CallKit_CallDirectoryMaintenance21SecureImageTranscoder)imageTranscoder;
- (id)_loadExtensionDataOperationWithStore:(id)a3 extension:(id)a4;
- (id)identificationEntryFrom:(id)a3 withName:(id)a4 withIconURL:(id)a5 withType:(int64_t)a6 fromCache:(BOOL)a7;
- (int64_t)lastInformationUpdate;
- (void)_setUpTemporaryDirectory;
- (void)callDirectoryHost:(id)a3 requestedEnabledForLiveLookupExtension:(id)a4 completionHandler:(id)a5;
- (void)callDirectoryHost:(id)a3 requestedEnabledStatusForExtension:(id)a4 completionHandler:(id)a5;
- (void)callDirectoryHost:(id)a3 requestedExtensionsWithCompletionHandler:(id)a4;
- (void)callDirectoryHost:(id)a3 requestedFirstEnabledLiveBlockingExtensionIdentifierForPhoneNumber:(id)a4 completionHandler:(id)a5;
- (void)callDirectoryHost:(id)a3 requestedFirstIdentificationEntriesForEnabledExtensionsWithPhoneNumbers:(id)a4 cacheOnly:(BOOL)a5 completionHandler:(id)a6;
- (void)callDirectoryHost:(id)a3 requestedLastUpdatedInfoWithCompletionHandler:(id)a4;
- (void)callDirectoryHost:(id)a3 requestedLiveBlockingInfoFor:(id)a4 completionHandler:(id)a5;
- (void)callDirectoryHost:(id)a3 requestedRefreshExtensionContextForLiveLookupExtension:(id)a4 completionHandler:(id)a5;
- (void)callDirectoryHost:(id)a3 requestedRefreshPIRParametersForLiveLookupExtension:(id)a4 completionHandler:(id)a5;
- (void)callDirectoryHost:(id)a3 requestedReloadForExtension:(id)a4 completionHandler:(id)a5;
- (void)callDirectoryHost:(id)a3 requestedResetForLiveLookupExtension:(id)a4 completionHandler:(id)a5;
- (void)callDirectoryHost:(id)a3 requestedSetEnabled:(BOOL)a4 forLiveLookupExtension:(id)a5 completionHandler:(id)a6;
- (void)callDirectoryHost:(id)a3 requestedToCompactStoreWithCompletionHandler:(id)a4;
- (void)callDirectoryHost:(id)a3 requestedToLaunchCallDirectorySettingsWithCompletionHandler:(id)a4;
- (void)callDirectoryHost:(id)a3 requestedToPrepareStoreWithCompletionHandler:(id)a4;
- (void)callDirectoryHost:(id)a3 requestedToSetEnabled:(BOOL)a4 forExtension:(id)a5 completionHandler:(id)a6;
- (void)callDirectoryHost:(id)a3 requestedToSetPrioritizedExtensionIdentifiers:(id)a4 completionHandler:(id)a5;
- (void)callDirectoryHost:(id)a3 requestedToSynchronizeExtensionsWithCompletionHandler:(id)a4;
- (void)callDirectoryHostRequestedToCleanupLiveLookupData:(id)a3;
- (void)callDirectoryLastInformationUpdatedForPhoneNumber:(int64_t)a3;
- (void)fetchLiveIdentityInfoFor:(id)a3 cacheOnly:(BOOL)a4 completionHandler:(id)a5;
- (void)fetchLiveInfoFor:(id)a3 with:(id)a4 blockingCompletion:(id)a5 identityCompletion:(id)a6;
- (void)setAnalyticsReporter:(id)a3;
- (void)setHost:(id)a3;
- (void)setImageTranscoder:(id)a3;
- (void)setLastInformationUpdate:(int64_t)a3;
- (void)setLiveLookupGroup:(id)a3;
- (void)setLiveLookupStore:(id)a3;
- (void)setServerBag:(id)a3;
- (void)setSystemMonitor:(id)a3;
- (void)writeImageIfNecessary:(id)a3 extensionIdentifier:(id)a4 handle:(id)a5 completionHandler:(id)a6;
@end

@implementation CDXManager

- (CDXManager)init
{
  v25.receiver = self;
  v25.super_class = (Class)CDXManager;
  v2 = [(CDXManager *)&v25 init];
  v3 = v2;
  if (v2)
  {
    [(CDXManager *)v2 _setUpTemporaryDirectory];
    uint64_t v4 = +[FTServerBag sharedInstance];
    serverBag = v3->_serverBag;
    v3->_serverBag = (FTServerBag *)v4;

    v6 = objc_alloc_init(_TtC42com_apple_CallKit_CallDirectoryMaintenance20LiveLookupStoreProxy);
    liveLookupStore = v3->_liveLookupStore;
    v3->_liveLookupStore = v6;

    v8 = objc_alloc_init(_TtC42com_apple_CallKit_CallDirectoryMaintenance21SecureImageTranscoder);
    imageTranscoder = v3->_imageTranscoder;
    v3->_imageTranscoder = v8;

    dispatch_group_t v10 = dispatch_group_create();
    liveLookupGroup = v3->_liveLookupGroup;
    v3->_liveLookupGroup = (OS_dispatch_group *)v10;

    v12 = objc_alloc_init(_TtC42com_apple_CallKit_CallDirectoryMaintenance21CoreAnalyticsReporter);
    analyticsReporter = v3->_analyticsReporter;
    v3->_analyticsReporter = v12;

    v14 = (CXCallDirectoryHost *)objc_alloc_init((Class)CXCallDirectoryHost);
    host = v3->_host;
    v3->_host = v14;

    [(CXCallDirectoryHost *)v3->_host setDelegate:v3 queue:0];
    v16 = (CUSystemMonitor *)objc_alloc_init((Class)CUSystemMonitor);
    systemMonitor = v3->_systemMonitor;
    v3->_systemMonitor = v16;

    objc_initWeak(&location, v3);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10000A51C;
    v22[3] = &unk_100034DD0;
    objc_copyWeak(&v23, &location);
    [(CUSystemMonitor *)v3->_systemMonitor setFirstUnlockHandler:v22];
    v18 = v3->_systemMonitor;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10000A5AC;
    v20[3] = &unk_100034DD0;
    objc_copyWeak(&v21, &location);
    [(CUSystemMonitor *)v18 activateWithCompletion:v20];
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = +[NSBundle mainBundle];
  v7 = [v6 bundleIdentifier];

  if ([v7 isEqualToString:CXCallDirectoryDefaultHostBundleIdentifier])
  {
    uint64_t v8 = +[NSXPCInterface cx_callDirectoryManagerDefaultHostInterface];
  }
  else
  {
    if (![v7 isEqualToString:CXCallDirectoryMaintenanceHostBundleIdentifier]) {
      goto LABEL_7;
    }
    uint64_t v8 = +[NSXPCInterface cx_callDirectoryManagerMaintenanceHostInterface];
  }
  v9 = v8;
  if (v8)
  {
    dispatch_group_t v10 = [(CDXManager *)self host];
    [v5 setExportedObject:v10];

    [v5 setExportedInterface:v9];
    [v5 resume];
    BOOL v11 = 1;
    goto LABEL_10;
  }
LABEL_7:
  v9 = sub_100006944();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_100023DD0();
  }
  BOOL v11 = 0;
LABEL_10:

  return v11;
}

- (void)callDirectoryHost:(id)a3 requestedReloadForExtension:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = sub_100006944();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "extension %@", buf, 0xCu);
  }

  id v18 = 0;
  id v10 = [objc_alloc((Class)CXCallDirectoryStore) initForReadingAndWritingWithError:&v18];
  id v11 = v18;
  if (v10)
  {
    v12 = [(CDXManager *)self _loadExtensionDataOperationWithStore:v10 extension:v7];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10000AA38;
    v14[3] = &unk_100034DF8;
    id v15 = v7;
    id v16 = v10;
    id v17 = v8;
    [v12 performWithCompletionHandler:v14];
  }
  else
  {
    v13 = sub_100006944();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100023E38();
    }

    v12 = +[NSError cx_callDirectoryManagerErrorWithCode:0];
    (*((void (**)(id, void *))v8 + 2))(v8, v12);
  }
}

- (void)callDirectoryHost:(id)a3 requestedEnabledStatusForExtension:(id)a4 completionHandler:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  id v8 = sub_100006944();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "extension %@", buf, 0xCu);
  }

  id v19 = 0;
  id v9 = [objc_alloc((Class)CXCallDirectoryStore) initForReadingAndWritingWithError:&v19];
  id v10 = v19;
  if (v9)
  {
    id v11 = [CDXRetrieveExtensionEnabledStatusOperation alloc];
    v12 = [v6 identifier];
    v13 = [(CDXRetrieveExtensionEnabledStatusOperation *)v11 initWithExtensionIdentifier:v12 store:v9];

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000ACD0;
    v15[3] = &unk_100034E20;
    id v16 = v6;
    id v17 = v9;
    id v18 = v7;
    [(CDXRetrieveExtensionEnabledStatusOperation *)v13 performWithCompletionHandler:v15];
  }
  else
  {
    v14 = sub_100006944();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100023F0C();
    }

    v13 = +[NSError cx_callDirectoryManagerErrorWithCode:0];
    (*((void (**)(id, void, CDXRetrieveExtensionEnabledStatusOperation *))v7 + 2))(v7, 0, v13);
  }
}

- (void)callDirectoryHost:(id)a3 requestedToSetEnabled:(BOOL)a4 forExtension:(id)a5 completionHandler:(id)a6
{
  BOOL v7 = a4;
  id v9 = a5;
  id v10 = a6;
  id v11 = sub_100006944();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v26 = v9;
    __int16 v27 = 1024;
    BOOL v28 = v7;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "extension %@ enabled %d", buf, 0x12u);
  }

  id v24 = 0;
  id v12 = [objc_alloc((Class)CXCallDirectoryStore) initForReadingAndWritingWithError:&v24];
  id v13 = v24;
  if (v12)
  {
    v14 = [(CDXManager *)self _loadExtensionDataOperationWithStore:v12 extension:v9];
    id v15 = [CDXSetExtensionEnabledOperation alloc];
    id v16 = [v9 identifier];
    id v17 = [(CDXSetExtensionEnabledOperation *)v15 initWithExtensionIdentifier:v16 enabled:v7 loadExtensionDataOperation:v14 store:v12];

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10000AFB0;
    v19[3] = &unk_100034E48;
    BOOL v23 = v7;
    id v20 = v9;
    id v21 = v12;
    id v22 = v10;
    [(CDXSetExtensionEnabledOperation *)v17 performWithCompletionHandler:v19];
  }
  else
  {
    id v18 = sub_100006944();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_100023E38();
    }

    v14 = +[NSError cx_callDirectoryManagerErrorWithCode:0];
    (*((void (**)(id, void *))v10 + 2))(v10, v14);
  }
}

- (void)callDirectoryHost:(id)a3 requestedFirstIdentificationEntriesForEnabledExtensionsWithPhoneNumbers:(id)a4 cacheOnly:(BOOL)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  id v11 = sub_100006944();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "phoneNumbers %@", buf, 0xCu);
  }

  id v21 = 0;
  id v12 = [objc_alloc((Class)CXCallDirectoryStore) initForReadingAndWritingWithError:&v21];
  id v13 = v21;
  if (v12)
  {
    v14 = [[CDXRetrieveFirstIdentificationEntriesOperation alloc] initWithPhoneNumbers:v9 store:v12];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10000B230;
    v16[3] = &unk_100034E98;
    id v17 = v9;
    id v18 = self;
    BOOL v20 = a5;
    id v19 = v10;
    [(CDXRetrieveFirstIdentificationEntriesOperation *)v14 performWithCompletionHandler:v16];
  }
  else
  {
    id v15 = sub_100006944();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100023F0C();
    }

    v14 = +[NSError cx_callDirectoryManagerErrorWithCode:0];
    (*((void (**)(id, void, CDXRetrieveFirstIdentificationEntriesOperation *))v10 + 2))(v10, 0, v14);
  }
}

- (void)writeImageIfNecessary:(id)a3 extensionIdentifier:(id)a4 handle:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void))a6;
  if (![v10 hasIcon]) {
    goto LABEL_6;
  }
  v14 = [v10 icon];
  if (([v14 hasImage] & 1) == 0)
  {

    goto LABEL_6;
  }
  id v15 = [v10 icon];
  id v16 = [v15 image];
  id v17 = [v16 length];

  if (!v17)
  {
LABEL_6:
    v13[2](v13, 0);
    goto LABEL_7;
  }
  id v18 = +[NSDate date];
  id v19 = [(CDXManager *)self imageTranscoder];
  BOOL v20 = [v10 icon];
  id v21 = [v20 image];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10000B75C;
  v23[3] = &unk_100034EC0;
  id v24 = v18;
  objc_super v25 = self;
  id v26 = v11;
  id v27 = v12;
  BOOL v28 = v13;
  id v22 = v18;
  [v19 generatePreviewImageFrom:v21 completionHandler:v23];

LABEL_7:
}

- (void)fetchLiveInfoFor:(id)a3 with:(id)a4 blockingCompletion:(id)a5 identityCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v40 = a6;
  id v13 = [(CDXManager *)self liveLookupStore];
  v14 = [v13 extensionIdentifierFor:v11];

  id v15 = [objc_alloc((Class)NSString) initWithFormat:@"%@.block", v14];
  id v16 = [objc_alloc((Class)CMLClientConfig) initWithUseCase:v15 sourceApplicationBundleIdentifier:v14];
  id v17 = [objc_alloc((Class)CMLKeywordPIRClient) initWithClientConfig:v16];
  id v18 = sub_100006944();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v58 = v15;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "requestData useCase: %@", buf, 0xCu);
  }

  id v19 = +[NSDate date];
  BOOL v20 = [(CDXManager *)self liveLookupGroup];
  dispatch_group_enter(v20);

  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_10000BD5C;
  v49[3] = &unk_100034EE8;
  id v39 = v19;
  id v50 = v39;
  v51 = self;
  id v21 = v14;
  id v52 = v21;
  id v53 = v15;
  id v22 = v12;
  id v56 = v22;
  id v23 = v10;
  id v54 = v23;
  id v24 = v11;
  id v55 = v24;
  id v25 = v15;
  [v17 requestDataByStringKeyword:v23 completionHandler:v49];
  id v26 = objc_alloc((Class)NSString);

  id v27 = [v26 initWithFormat:@"%@.identity", v21];
  id v28 = [objc_alloc((Class)CMLClientConfig) initWithUseCase:v27 sourceApplicationBundleIdentifier:v21];

  id v29 = [objc_alloc((Class)CMLKeywordPIRClient) initWithClientConfig:v28];
  v30 = sub_100006944();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v58 = v27;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "requestData useCase: %@", buf, 0xCu);
  }

  v31 = +[NSDate date];
  v32 = [(CDXManager *)self liveLookupGroup];
  dispatch_group_enter(v32);

  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_10000C068;
  v41[3] = &unk_100034EE8;
  id v42 = v31;
  v43 = self;
  id v44 = v21;
  id v45 = v27;
  id v47 = v24;
  id v48 = v40;
  id v46 = v23;
  id v33 = v24;
  id v34 = v23;
  id v35 = v40;
  id v36 = v27;
  id v37 = v21;
  id v38 = v31;
  [v29 requestDataByStringKeyword:v34 completionHandler:v41];
}

- (id)identificationEntryFrom:(id)a3 withName:(id)a4 withIconURL:(id)a5 withType:(int64_t)a6 fromCache:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a5;
  id v12 = a4;
  id v13 = +[NSExtension extensionWithIdentifier:a3 error:0];
  id v14 = objc_alloc_init((Class)CXCallDirectoryIdentificationEntry);
  id v15 = [v13 identifier];
  [v14 setExtensionIdentifier:v15];

  id v16 = [v13 localizedName];
  [v14 setLocalizedExtensionName:v16];

  id v17 = [v13 localizedContainingAppName];
  [v14 setLocalizedExtensionContainingAppName:v17];

  [v14 setLocalizedLabel:v12];
  [v14 setIconURL:v11];

  [v14 setType:a6];
  [v14 setFromCache:v7];

  return v14;
}

- (void)fetchLiveIdentityInfoFor:(id)a3 cacheOnly:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v55 = a4;
  id v59 = a3;
  id v53 = (void (**)(id, void *, void))a5;
  BOOL v7 = sub_100006944();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v59;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v55;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "fetchLiveIdentityInfoFor handle=%@ cacheOnly=%d", buf, 0x12u);
  }

  id v8 = [(CDXManager *)self liveLookupGroup];
  id v9 = [(CDXManager *)self serverBag];
  dispatch_time_t v10 = dispatch_time(0, 1000000000 * (void)[v9 identityWaitSeconds]);
  intptr_t v11 = dispatch_group_wait(v8, v10);

  if (v11)
  {
    id v12 = sub_100006944();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [(CDXManager *)self serverBag];
      id v14 = [v13 identityWaitSeconds];
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "not all previous fetches completed within %lu second(s) continuing", buf, 0xCu);
    }
  }
  id v15 = [(CDXManager *)self liveLookupStore];
  id v52 = [v15 activeExtensions];

  id v16 = sub_100006944();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = [v52 count];
    *(_DWORD *)buf = 134218242;
    *(void *)&uint8_t buf[4] = v17;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v59;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "extensions=%lu handle=%@", buf, 0x16u);
  }

  if ([v52 count])
  {
    id v57 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v52, "count"));
    group = 0;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v83 = 0;
    if (!v55) {
      group = dispatch_group_create();
    }
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id obj = v52;
    id v18 = [obj countByEnumeratingWithState:&v72 objects:v81 count:16];
    if (v18)
    {
      unsigned __int16 v20 = 0;
      uint64_t v58 = *(void *)v73;
      *(void *)&long long v19 = 138412290;
      long long v51 = v19;
      while (2)
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v73 != v58) {
            objc_enumerationMutation(obj);
          }
          uint64_t v22 = *(void *)(*((void *)&v72 + 1) + 8 * i);
          id v23 = [(CDXManager *)self liveLookupStore];
          id v24 = [v23 extensionIdentifierFor:v22];

          id v25 = [(CDXManager *)self liveLookupStore];
          id v26 = [v25 fetchIdentityInfoFor:v59 from:v22];

          if (v26)
          {
            id v27 = [(CDXManager *)self liveLookupStore];
            id v28 = [v27 nameFor:v26];

            id v29 = [(CDXManager *)self liveLookupStore];
            v30 = [v29 iconURLFor:v26];

            v31 = [(CDXManager *)self liveLookupStore];
            id v32 = [v31 identityTypeFor:v26];

            id v33 = [(CDXManager *)self identificationEntryFrom:v24 withName:v28 withIconURL:v30 withType:v32 fromCache:1];
            id v34 = sub_100006944();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v77 = 138412546;
              id v78 = v26;
              __int16 v79 = 2112;
              v80 = v24;
              _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "found %@ in cache for %@", v77, 0x16u);
            }

            if (v28 && [v28 length] && !v20)
            {
              id v42 = [(CDXManager *)self analyticsReporter];
              [v42 sendIdentityCacheHitFor:v24];

              v53[2](v53, v33, 0);
LABEL_37:

              goto LABEL_41;
            }
            [v57 setObject:v33 atIndexedSubscript:v20];
          }
          else
          {
            if (!v55)
            {
              dispatch_group_enter(group);
              id v35 = sub_100006944();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v77 = v51;
                id v78 = v24;
                _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "fetching identity for %@", v77, 0xCu);
              }

              v64[0] = _NSConcreteStackBlock;
              v64[1] = 3221225472;
              v64[2] = sub_10000CF50;
              v64[3] = &unk_100034F38;
              id v65 = v24;
              v66 = self;
              unsigned __int16 v71 = v20;
              v69 = v53;
              v70 = buf;
              id v67 = v57;
              v68 = group;
              [(CDXManager *)self fetchLiveInfoFor:v59 with:v22 blockingCompletion:0 identityCompletion:v64];
            }
            ++v20;
          }
        }
        id v18 = [obj countByEnumeratingWithState:&v72 objects:v81 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }

    if (v55
      || ([(CDXManager *)self serverBag],
          id v36 = objc_claimAutoreleasedReturnValue(),
          dispatch_time_t v37 = dispatch_time(0, 1000000000 * (void)[v36 identityWaitSeconds]),
          BOOL v38 = dispatch_group_wait(group, v37) == 0,
          v36,
          v38))
    {
      id v39 = sub_100006944();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v77 = 0;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "all identity fetches complete", v77, 2u);
      }
    }
    else
    {
      id v39 = sub_100006944();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        id v40 = [(CDXManager *)self serverBag];
        id v41 = [v40 identityWaitSeconds];
        *(_DWORD *)v77 = 134217984;
        id v78 = v41;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "not all identity fetches returned within %lu second(s)", v77, 0xCu);
      }
    }

    if (!*(unsigned char *)(*(void *)&buf[8] + 24))
    {
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      id obj = v57;
      id v43 = [obj countByEnumeratingWithState:&v60 objects:v76 count:16];
      if (v43)
      {
        uint64_t v44 = *(void *)v61;
        while (2)
        {
          for (j = 0; j != v43; j = (char *)j + 1)
          {
            if (*(void *)v61 != v44) {
              objc_enumerationMutation(obj);
            }
            id v46 = *(void **)(*((void *)&v60 + 1) + 8 * (void)j);
            if (v46)
            {
              id v47 = [*(id *)(*((void *)&v60 + 1) + 8 * (void)j) localizedLabel];
              BOOL v48 = v47 == 0;

              if (!v48)
              {
                if ([v46 fromCache])
                {
                  v49 = [(CDXManager *)self analyticsReporter];
                  id v50 = [v46 extensionIdentifier];
                  [v49 sendIdentityCacheHitFor:v50];
                }
                v53[2](v53, v46, 0);
                goto LABEL_37;
              }
            }
          }
          id v43 = [obj countByEnumeratingWithState:&v60 objects:v76 count:16];
          if (v43) {
            continue;
          }
          break;
        }
      }

      v53[2](v53, 0, 0);
    }
LABEL_41:

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v53[2](v53, 0, 0);
  }
}

- (void)callDirectoryHost:(id)a3 requestedLiveBlockingInfoFor:(id)a4 completionHandler:(id)a5
{
  id v43 = a3;
  id v46 = a4;
  id v45 = (void (**)(id, id, void))a5;
  id v8 = sub_100006944();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v46;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "requestedLiveBlockingInfoFor handle=%@", buf, 0xCu);
  }

  id v9 = [(CDXManager *)self liveLookupStore];
  uint64_t v44 = [v9 activeExtensions];

  dispatch_time_t v10 = [(CDXManager *)self liveLookupStore];
  BOOL v48 = [v10 getBlockingInfoFor:v46];

  if ([v48 count]
    && (([(CDXManager *)self liveLookupStore],
         intptr_t v11 = objc_claimAutoreleasedReturnValue(),
         id v12 = [v11 shouldBlockWith:v48],
         v11,
         (v12 & 1) != 0)
     || (id v13 = [v48 count], v13 == objc_msgSend(v44, "count"))))
  {
    id v14 = sub_100006944();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&uint8_t buf[4] = v12;
      *(_WORD *)&buf[8] = 2112;
      *(void *)&buf[10] = v46;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "cache says block (%d) for handle=%@", buf, 0x12u);
    }

    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v15 = v48;
    id v16 = [v15 countByEnumeratingWithState:&v59 objects:v68 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v60;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v60 != v17) {
            objc_enumerationMutation(v15);
          }
          uint64_t v19 = *(void *)(*((void *)&v59 + 1) + 8 * i);
          unsigned __int16 v20 = [(CDXManager *)self analyticsReporter];
          id v21 = [(CDXManager *)self liveLookupStore];
          uint64_t v22 = [v21 extensionIdentifierFrom:v19];
          [v20 sendBlockingCacheHitFor:v22];
        }
        id v16 = [v15 countByEnumeratingWithState:&v59 objects:v68 count:16];
      }
      while (v16);
    }

    v45[2](v45, v12, 0);
  }
  else
  {
    id v23 = sub_100006944();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      id v24 = [v44 count];
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = v24;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v46;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "extensions=%lu handle=%@", buf, 0x16u);
    }

    if ([v44 count])
    {
      id v25 = dispatch_group_create();
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      char v67 = 0;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      id obj = v44;
      id v26 = [obj countByEnumeratingWithState:&v55 objects:v65 count:16];
      if (v26)
      {
        uint64_t v27 = *(void *)v56;
        do
        {
          for (j = 0; j != v26; j = (char *)j + 1)
          {
            if (*(void *)v56 != v27) {
              objc_enumerationMutation(obj);
            }
            uint64_t v29 = *(void *)(*((void *)&v55 + 1) + 8 * (void)j);
            v30 = [(CDXManager *)self liveLookupStore];
            v31 = [v30 extensionIdentifierFor:v29];

            id v32 = [(CDXManager *)self liveLookupStore];
            unsigned int v33 = [v32 llExtension:v29 containedIn:v48];

            if (v33)
            {
              id v34 = [(CDXManager *)self analyticsReporter];
              [v34 sendBlockingCacheHitFor:v31];
            }
            else
            {
              dispatch_group_enter(v25);
              id v35 = sub_100006944();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)long long v63 = 138412290;
                id v64 = v31;
                _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "fetching blocking for %@", v63, 0xCu);
              }

              v49[0] = _NSConcreteStackBlock;
              v49[1] = 3221225472;
              v49[2] = sub_10000D7B4;
              v49[3] = &unk_100034F60;
              id v36 = v31;
              id v54 = buf;
              id v50 = v36;
              long long v51 = self;
              id v53 = v45;
              id v52 = v25;
              [(CDXManager *)self fetchLiveInfoFor:v46 with:v29 blockingCompletion:v49 identityCompletion:0];

              id v34 = v50;
            }
          }
          id v26 = [obj countByEnumeratingWithState:&v55 objects:v65 count:16];
        }
        while (v26);
      }

      dispatch_time_t v37 = [(CDXManager *)self serverBag];
      dispatch_time_t v38 = dispatch_time(0, 1000000000 * (void)[v37 blockingWaitSeconds]);
      intptr_t v39 = dispatch_group_wait(v25, v38);

      if (v39)
      {
        id v40 = sub_100006944();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          id v41 = [(CDXManager *)self serverBag];
          id v42 = [v41 blockingWaitSeconds];
          *(_DWORD *)long long v63 = 134217984;
          id v64 = v42;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "not all blocking fetches returned within %lu second(s)", v63, 0xCu);
        }
      }
      else
      {
        id v40 = sub_100006944();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long v63 = 0;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "all blocking fetches complete", v63, 2u);
        }
      }

      if (!*(unsigned char *)(*(void *)&buf[8] + 24)) {
        v45[2](v45, 0, 0);
      }
      _Block_object_dispose(buf, 8);
    }
    else
    {
      v45[2](v45, 0, 0);
    }
  }
}

- (void)callDirectoryHost:(id)a3 requestedFirstEnabledLiveBlockingExtensionIdentifierForPhoneNumber:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = (void (**)(id, void *, void))a5;
  id v9 = sub_100006944();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    id v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "requestedFirstEnabledLiveBlockingExtensionIdentifierForPhoneNumber handle=%@", (uint8_t *)&v15, 0xCu);
  }

  dispatch_time_t v10 = [(CDXManager *)self liveLookupStore];
  intptr_t v11 = [v10 getBlockingInfoFor:v7];

  if ([v11 count])
  {
    id v12 = [(CDXManager *)self liveLookupStore];
    id v13 = [v12 firstEnabledBlockedExtensionIdentifierFor:v11];

    id v14 = sub_100006944();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412546;
      id v16 = v13;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "cache says blocked by (%@) for handle=%@", (uint8_t *)&v15, 0x16u);
    }

    v8[2](v8, v13, 0);
  }
  else
  {
    id v13 = +[NSError cx_callDirectoryManagerErrorWithCode:0];
    ((void (**)(id, void *, void *))v8)[2](v8, 0, v13);
  }
}

- (void)callDirectoryHost:(id)a3 requestedToSynchronizeExtensionsWithCompletionHandler:(id)a4
{
  id v5 = a4;
  id v6 = sub_100006944();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "requested to synchronize extensions", buf, 2u);
  }

  id v15 = 0;
  id v7 = [objc_alloc((Class)CXCallDirectoryStore) initForReadingAndWritingWithError:&v15];
  id v8 = v15;
  if (v7)
  {
    id v9 = [CDXSynchronizeExtensionsOperation alloc];
    dispatch_time_t v10 = [(CDXManager *)self systemMonitor];
    intptr_t v11 = -[CDXSynchronizeExtensionsOperation initWithStore:firstUnlockStatus:](v9, "initWithStore:firstUnlockStatus:", v7, [v10 firstUnlocked]);

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000DC58;
    v13[3] = &unk_100034F88;
    id v14 = v5;
    [(CDXSynchronizeExtensionsOperation *)v11 performWithCompletionHandler:v13];
  }
  else
  {
    id v12 = sub_100006944();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000241CC();
    }

    intptr_t v11 = +[NSError cx_callDirectoryManagerErrorWithCode:0];
    (*((void (**)(id, CDXSynchronizeExtensionsOperation *))v5 + 2))(v5, v11);
  }
}

- (void)callDirectoryHost:(id)a3 requestedToCompactStoreWithCompletionHandler:(id)a4
{
  id v4 = a4;
  id v5 = sub_100006944();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "requested to compact store", buf, 2u);
  }

  id v12 = 0;
  id v6 = [objc_alloc((Class)CXCallDirectoryStore) initForReadingAndWritingWithError:&v12];
  id v7 = v12;
  if (v6)
  {
    id v8 = [[CDXCompactStoreOperation alloc] initWithStore:v6];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000DE58;
    v10[3] = &unk_100034F88;
    id v11 = v4;
    [(CDXCompactStoreOperation *)v8 performWithCompletionHandler:v10];
  }
  else
  {
    id v9 = sub_100006944();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000241CC();
    }

    id v8 = +[NSError cx_callDirectoryManagerErrorWithCode:0];
    (*((void (**)(id, CDXCompactStoreOperation *))v4 + 2))(v4, v8);
  }
}

- (void)callDirectoryHostRequestedToCleanupLiveLookupData:(id)a3
{
  id v4 = sub_100006944();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "requested to gc livelookupstore", v6, 2u);
  }

  id v5 = [(CDXManager *)self liveLookupStore];
  [v5 cleanup];
}

- (void)callDirectoryHost:(id)a3 requestedToLaunchCallDirectorySettingsWithCompletionHandler:(id)a4
{
  id v4 = (void (**)(id, void))a4;
  id v5 = sub_100006944();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "requested to launch call directory settings", buf, 2u);
  }

  id v6 = +[NSURL URLWithString:@"prefs:root=Phone&path=CALL_DIRECTORIES"];
  id v7 = +[LSApplicationWorkspace defaultWorkspace];
  id v11 = 0;
  unsigned __int8 v8 = [v7 openSensitiveURL:v6 withOptions:0 error:&v11];
  id v9 = v11;

  if ((v8 & 1) != 0 || !v9)
  {
    if (v4) {
      v4[2](v4, 0);
    }
  }
  else
  {
    dispatch_time_t v10 = sub_100006944();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100024304();
    }

    if (v4) {
      ((void (**)(id, id))v4)[2](v4, v9);
    }
  }
}

- (void)callDirectoryHost:(id)a3 requestedExtensionsWithCompletionHandler:(id)a4
{
  id v4 = a4;
  id v5 = sub_100006944();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "requested extensions", buf, 2u);
  }

  id v12 = 0;
  id v6 = [objc_alloc((Class)CXCallDirectoryStore) initForReadingAndWritingWithError:&v12];
  id v7 = v12;
  if (v6)
  {
    unsigned __int8 v8 = [[CDXRetrieveExtensionsOperation alloc] initWithStore:v6];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000E22C;
    v10[3] = &unk_100034FB0;
    id v11 = v4;
    [(CDXRetrieveExtensionsOperation *)v8 performWithCompletionHandler:v10];
  }
  else
  {
    id v9 = sub_100006944();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100023F0C();
    }

    unsigned __int8 v8 = +[NSError cx_callDirectoryManagerErrorWithCode:0];
    (*((void (**)(id, void, CDXRetrieveExtensionsOperation *))v4 + 2))(v4, 0, v8);
  }
}

- (void)callDirectoryHost:(id)a3 requestedToSetPrioritizedExtensionIdentifiers:(id)a4 completionHandler:(id)a5
{
  id v6 = a4;
  id v7 = (void (**)(id, void))a5;
  unsigned __int8 v8 = sub_100006944();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "prioritizedExtensionIdentifiers %@", buf, 0xCu);
  }

  if ((unint64_t)[v6 count] < 2)
  {
    id v12 = sub_100006944();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [v6 count];
      *(_DWORD *)buf = 134217984;
      id v19 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "prioritizedExtensionIdentifiers count is %ld, so doing nothing", buf, 0xCu);
    }

    v7[2](v7, 0);
  }
  else
  {
    id v17 = 0;
    id v9 = [objc_alloc((Class)CXCallDirectoryStore) initForReadingAndWritingWithError:&v17];
    id v10 = v17;
    if (v9)
    {
      id v11 = [[CDXPrioritizeExtensionsOperation alloc] initWithPrioritizedExtensionIdentifiers:v6 store:v9];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10000E58C;
      v15[3] = &unk_100034F88;
      id v16 = v7;
      [(CDXPrioritizeExtensionsOperation *)v11 performWithCompletionHandler:v15];
    }
    else
    {
      id v14 = sub_100006944();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1000241CC();
      }

      id v11 = +[NSError cx_callDirectoryManagerErrorWithCode:0];
      ((void (**)(id, CDXPrioritizeExtensionsOperation *))v7)[2](v7, v11);
    }
  }
}

- (void)callDirectoryHost:(id)a3 requestedToPrepareStoreWithCompletionHandler:(id)a4
{
  id v5 = (void (**)(id, id))a4;
  id v6 = sub_100006944();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "requested to prepare store", buf, 2u);
  }

  id v7 = [CDXPrepareStoreOperation alloc];
  unsigned __int8 v8 = [(CDXManager *)self systemMonitor];
  id v9 = -[CDXPrepareStoreOperation initWithFirstUnlockStatus:](v7, "initWithFirstUnlockStatus:", [v8 firstUnlocked]);

  id v15 = 0;
  unsigned int v10 = [(CDXPrepareStoreOperation *)v9 performWithError:&v15];
  id v11 = v15;
  id v12 = sub_100006944();
  id v13 = v12;
  if (v10)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Store prepared successfully", v14, 2u);
    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    sub_100024448();
  }

  if (v5) {
    v5[2](v5, v11);
  }
}

- (void)callDirectoryHost:(id)a3 requestedEnabledForLiveLookupExtension:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v11 = [(CDXManager *)self liveLookupStore];
  unsigned int v10 = [v9 identifier];

  (*((void (**)(id, id, void))a5 + 2))(v8, [v11 enabledForExtensionWith:v10], 0);
}

- (void)callDirectoryHost:(id)a3 requestedSetEnabled:(BOOL)a4 forLiveLookupExtension:(id)a5 completionHandler:(id)a6
{
  BOOL v7 = a4;
  id v9 = a6;
  id v10 = a5;
  id v12 = [(CDXManager *)self liveLookupStore];
  id v11 = [v10 identifier];

  [v12 setEnabled:v7 forExtensionWith:v11 completionHandler:v9];
}

- (void)callDirectoryHost:(id)a3 requestedResetForLiveLookupExtension:(id)a4 completionHandler:(id)a5
{
  id v10 = (void (**)(id, void))a5;
  id v7 = a4;
  id v8 = [(CDXManager *)self liveLookupStore];
  id v9 = [v7 identifier];

  [v8 resetForExtensionWith:v9];
  v10[2](v10, 0);
}

- (void)callDirectoryHost:(id)a3 requestedRefreshPIRParametersForLiveLookupExtension:(id)a4 completionHandler:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = [&off_100035AD8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(&off_100035AD8);
        }
        uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * (void)v11);
        id v13 = objc_alloc((Class)NSString);
        id v14 = [v6 identifier];
        id v15 = [v13 initWithFormat:@"%@.%@", v14, v12];

        id v16 = objc_alloc((Class)CMLClientConfig);
        id v17 = [v6 identifier];
        id v18 = [v16 initWithUseCase:v15 sourceApplicationBundleIdentifier:v17];

        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_10000EB60;
        v19[3] = &unk_100034FD8;
        id v20 = v7;
        +[CMLUseCaseStatus requestStatusForClientConfig:v18 options:264 completionHandler:v19];

        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [&off_100035AD8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v9);
  }
}

- (void)callDirectoryHost:(id)a3 requestedRefreshExtensionContextForLiveLookupExtension:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_100006944();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [v9 identifier];
    *(_DWORD *)buf = 138412290;
    long long v23 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "requestedRefreshExtensionContextForLiveLookupExtension %@", buf, 0xCu);
  }
  id v13 = [(CDXManager *)self liveLookupStore];
  id v14 = [v9 identifier];
  unsigned int v15 = [v13 enabledForExtensionWith:v14];

  if (v15)
  {
    objc_initWeak((id *)buf, self);
    id v16 = [(CDXManager *)self liveLookupStore];
    id v17 = [v9 identifier];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10000EDA4;
    v18[3] = &unk_100035028;
    id v19 = v9;
    id v20 = v10;
    objc_copyWeak(&v21, (id *)buf);
    [v16 setEnabled:0 forExtensionWith:v17 completionHandler:v18];

    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }
}

- (void)callDirectoryHost:(id)a3 requestedLastUpdatedInfoWithCompletionHandler:(id)a4
{
  id v6 = a4;
  (*((void (**)(id, int64_t, void))a4 + 2))(v6, [(CDXManager *)self lastInformationUpdate], 0);
}

- (void)callDirectoryLastInformationUpdatedForPhoneNumber:(int64_t)a3
{
}

- (void)_setUpTemporaryDirectory
{
  unsetenv("TMPDIR");
  bzero(v4, 0x400uLL);
  if (!_set_user_dir_suffix() || !confstr(65537, v4, 0x400uLL) || mkdir(v4, 0x1C0u) && *__error() != 17)
  {
    v2 = sub_100006944();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_1000244B0();
    }
LABEL_11:

    exit(1);
  }
  bzero(v3, 0x400uLL);
  if (!realpath_DARWIN_EXTSN(v4, v3))
  {
    v2 = sub_100006944();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_100024538();
    }
    goto LABEL_11;
  }
}

- (id)_loadExtensionDataOperationWithStore:(id)a3 extension:(id)a4
{
  id v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v8 = a4;
  id v9 = a3;
  dispatch_queue_t v10 = dispatch_queue_create("com.apple.callkit.calldirectory.loadextensiondataoperation", v7);

  id v11 = [[CDXExtensionDataRequest alloc] initWithExtension:v8 queue:v10];
  uint64_t v12 = [CDXLoadExtensionDataOperation alloc];
  id v13 = [v8 identifier];

  id v14 = [(CDXLoadExtensionDataOperation *)v12 initWithExtensionIdentifier:v13 dataRequest:v11 queue:v10 store:v9 lastUpdateDelegate:self];

  return v14;
}

- (CXCallDirectoryHost)host
{
  return self->_host;
}

- (void)setHost:(id)a3
{
}

- (_TtC42com_apple_CallKit_CallDirectoryMaintenance20LiveLookupStoreProxy)liveLookupStore
{
  return self->_liveLookupStore;
}

- (void)setLiveLookupStore:(id)a3
{
}

- (FTServerBag)serverBag
{
  return self->_serverBag;
}

- (void)setServerBag:(id)a3
{
}

- (int64_t)lastInformationUpdate
{
  return self->_lastInformationUpdate;
}

- (void)setLastInformationUpdate:(int64_t)a3
{
  self->_lastInformationUpdate = a3;
}

- (_TtC42com_apple_CallKit_CallDirectoryMaintenance21SecureImageTranscoder)imageTranscoder
{
  return self->_imageTranscoder;
}

- (void)setImageTranscoder:(id)a3
{
}

- (OS_dispatch_group)liveLookupGroup
{
  return self->_liveLookupGroup;
}

- (void)setLiveLookupGroup:(id)a3
{
}

- (_TtC42com_apple_CallKit_CallDirectoryMaintenance21CoreAnalyticsReporter)analyticsReporter
{
  return self->_analyticsReporter;
}

- (void)setAnalyticsReporter:(id)a3
{
}

- (CUSystemMonitor)systemMonitor
{
  return self->_systemMonitor;
}

- (void)setSystemMonitor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_analyticsReporter, 0);
  objc_storeStrong((id *)&self->_liveLookupGroup, 0);
  objc_storeStrong((id *)&self->_imageTranscoder, 0);
  objc_storeStrong((id *)&self->_serverBag, 0);
  objc_storeStrong((id *)&self->_liveLookupStore, 0);

  objc_storeStrong((id *)&self->_host, 0);
}

@end
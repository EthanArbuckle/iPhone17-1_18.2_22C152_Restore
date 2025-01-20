@interface DCAssetFetcher
+ (id)sharedFetcher;
- (id)_assetQuery;
- (id)_validateAsset:(id)a3 error:(id *)a4;
- (void)_fetchAssetWithContext:(id)a3 completionHandler:(id)a4;
- (void)_handleMissingMetadataWithContext:(id)a3 completion:(id)a4;
- (void)_handleSuccessForQuery:(id)a3 completion:(id)a4;
- (void)_queryMetadataWithContext:(id)a3 completion:(id)a4;
- (void)fetchPublicKeyAssetWithCompletion:(id)a3;
- (void)initiateMetadataFetchIgnoringCachesWithCompletion:(id)a3;
@end

@implementation DCAssetFetcher

+ (id)sharedFetcher
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003A58;
  block[3] = &unk_100008260;
  block[4] = a1;
  if (qword_10000D010 != -1) {
    dispatch_once(&qword_10000D010, block);
  }
  v2 = (void *)qword_10000D008;

  return v2;
}

- (void)fetchPublicKeyAssetWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(DCAssetFetcherContext);
  [(DCAssetFetcherContext *)v5 setAllowCatalogRefresh:0];
  [(DCAssetFetcher *)self _fetchAssetWithContext:v5 completionHandler:v4];
}

- (void)initiateMetadataFetchIgnoringCachesWithCompletion:(id)a3
{
  v3 = (void (**)(id, uint64_t, void))a3;
  id v4 = sub_100003944();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Initiating an out of band catalog download", v5, 2u);
  }

  +[MAAsset startCatalogDownload:@"com.apple.MobileAsset.DeviceCheck" then:&stru_1000082A0];
  v3[2](v3, 1, 0);
}

- (void)_fetchAssetWithContext:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = sub_100003944();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Querying...", v9, 2u);
  }

  [(DCAssetFetcher *)self _queryMetadataWithContext:v7 completion:v6];
}

- (void)_queryMetadataWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  v8 = sub_100003944();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Starting to fetch asset with context: %@", (uint8_t *)&v13, 0xCu);
  }

  v9 = [(DCAssetFetcher *)self _assetQuery];
  id v10 = [v9 queryMetaDataSync];
  if (([v6 ignoreCachedMetadata] & 1) != 0 || v10 == (id)2)
  {
    [(DCAssetFetcher *)self _handleMissingMetadataWithContext:v6 completion:v7];
  }
  else if (v10)
  {
    v11 = sub_100003944();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100005850((uint64_t)v10, v11);
    }

    v12 = +[NSError errorWithDomain:@"com.apple.twobit.fetcherror" code:-3000 userInfo:0];
    v7[2](v7, 0, v12);
  }
  else
  {
    [(DCAssetFetcher *)self _handleSuccessForQuery:v9 completion:v7];
  }
}

- (id)_assetQuery
{
  id v2 = [objc_alloc((Class)MAAssetQuery) initWithType:@"com.apple.MobileAsset.DeviceCheck"];

  return v2;
}

- (void)_handleMissingMetadataWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = sub_100003944();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Query sync result indicated missing asset catalog", buf, 2u);
  }

  if ([v6 allowCatalogRefresh])
  {
    [v6 setAllowCatalogRefresh:0];
    [v6 setIgnoreCachedMetadata:0];
    v9 = sub_100003944();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Attempting to download catalog, waiting for result...", buf, 2u);
    }

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000040B0;
    v12[3] = &unk_1000082C8;
    id v14 = v7;
    v12[4] = self;
    id v13 = v6;
    +[MAAsset startCatalogDownload:@"com.apple.MobileAsset.DeviceCheck" then:v12];

    id v10 = v14;
  }
  else
  {
    v11 = sub_100003944();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000058C8(v11);
    }

    id v10 = +[NSError errorWithDomain:@"com.apple.twobit.fetcherror" code:-3001 userInfo:0];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v10);
  }
}

- (void)_handleSuccessForQuery:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, id))a4;
  v8 = sub_100003944();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v6 results];
    *(_DWORD *)buf = 134217984;
    id v21 = [v9 count];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Query success, results count: %lu", buf, 0xCu);
  }
  id v10 = [v6 results];
  id v11 = [v10 count];

  if (v11)
  {
    v12 = [v6 results];
    id v13 = [v12 count];

    if ((unint64_t)v13 >= 2)
    {
      id v14 = sub_100003944();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_10000590C(v14);
      }
    }
    v15 = [v6 results];
    v16 = [v15 firstObject];

    id v19 = 0;
    v17 = [(DCAssetFetcher *)self _validateAsset:v16 error:&v19];
    id v18 = v19;
    v7[2](v7, v17, v18);
  }
  else
  {
    v16 = +[NSError errorWithDomain:@"com.apple.twobit.fetcherror" code:-3100 userInfo:0];
    v7[2](v7, 0, v16);
  }
}

- (id)_validateAsset:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = sub_100003944();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 state];
    v8 = [v5 attributes];
    int v13 = 138412802;
    id v14 = v5;
    __int16 v15 = 2048;
    id v16 = v7;
    __int16 v17 = 2112;
    id v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Attempting to validate asset: <%@ - %ld> - %@", (uint8_t *)&v13, 0x20u);
  }
  v9 = +[DCAsset assetWithMobileAsset:v5];
  if (v9)
  {
    id v10 = +[DCBGSTaskController sharedInstance];
    uint64_t v11 = kBGSRefreshTaskID;
    [v9 publicKeyRefreshInterval];
    objc_msgSend(v10, "updateTaskWithIdentifier:withRefreshInterval:", v11);
  }
  else if (a4)
  {
    *a4 = +[NSError errorWithDomain:@"com.apple.twobit.fetcherror" code:-3200 userInfo:0];
  }

  return v9;
}

@end
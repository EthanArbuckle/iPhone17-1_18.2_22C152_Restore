@interface QLThumbnailsService
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (NSString)clientApplicationIdentifier;
- (OS_dispatch_queue)backgroundGenerationQueue;
- (OS_dispatch_queue)utilityGenerationQueue;
- (QLThumbnailsService)initWithClientProcessIdentifier:(int)a3 auditToken:(id *)a4;
- (id)makeQueueWithBackgroundPriority:(BOOL)a3;
- (int)pid;
- (void)askThumbnailAdditionIndex:(id)a3;
- (void)canGenerateThumbnailsForContentType:(id)a3 atSize:(CGSize)a4 completionHandler:(id)a5;
- (void)cancelThumbnailRequests:(id)a3;
- (void)fetchAllDataSeparatedVolumesWithCompletionHandler:(id)a3;
- (void)generateSuccessiveThumbnailRepresentationsForRequests:(id)a3 generationHandler:(id)a4 completionHandler:(id)a5;
- (void)getAllThumbnailsForFPItemID:(id)a3 completionHandler:(id)a4;
- (void)getAllThumbnailsForIno:(id)a3 fsid:(id)a4 completionHandler:(id)a5;
- (void)getAllThumbnailsInfoForCacheAtURL:(id)a3 completionHandler:(id)a4;
- (void)getCanGenerateThumbnailsForContentType:(id)a3 completionHandler:(id)a4;
- (void)getInfoForCacheAtURL:(id)a3 completionHandler:(id)a4;
- (void)hasThumbnailForURLWrapper:(id)a3 updateLastHitDate:(BOOL)a4 andSize:(unint64_t)a5 completion:(id)a6;
- (void)removeCachedThumbnailsFromUninstalledFileProvidersWithIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)removeCachedThumbnailsFromUninstalledFileProvidersWithRemainingFileProviderIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)removeThumbnailAdditionsOnURL:(id)a3 completionBlock:(id)a4;
- (void)reset;
- (void)setAuditToken:(id *)a3;
- (void)setBackgroundGenerationQueue:(id)a3;
- (void)setClientApplicationIdentifier:(id)a3;
- (void)setLastHitDateOfAllCachedThumbnailsToDate:(id)a3 withCompletionHandler:(id)a4;
- (void)setPid:(int)a3;
- (void)setUtilityGenerationQueue:(id)a3;
- (void)thumbnailsStoreURLForURL:(id)a3 completionBlock:(id)a4;
@end

@implementation QLThumbnailsService

- (void)cancelThumbnailRequests:(id)a3
{
  id v3 = a3;
  id v4 = +[QLServerThread sharedInstance];
  [v4 cancelThumbnailRequests:v3];
}

- (QLThumbnailsService)initWithClientProcessIdentifier:(int)a3 auditToken:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  v17.receiver = self;
  v17.super_class = (Class)QLThumbnailsService;
  v6 = [(QLThumbnailsService *)&v17 init];
  v7 = v6;
  if (v6)
  {
    [(QLThumbnailsService *)v6 setPid:v5];
    long long v8 = *(_OWORD *)&a4->var0[4];
    v16[0] = *(_OWORD *)a4->var0;
    v16[1] = v8;
    [(QLThumbnailsService *)v7 setAuditToken:v16];
    long long v9 = *(_OWORD *)&a4->var0[4];
    *(_OWORD *)v15.val = *(_OWORD *)a4->var0;
    *(_OWORD *)&v15.val[4] = v9;
    v10 = SecTaskCreateWithAuditToken(0, &v15);
    if (v10)
    {
      v11 = v10;
      *(void *)v15.val = 0;
      v12 = (__CFString *)SecTaskCopySigningIdentifier(v10, (CFErrorRef *)&v15);
      if (v12)
      {
        [(QLThumbnailsService *)v7 setClientApplicationIdentifier:v12];
      }
      else
      {
        v13 = sub_100004B98();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_100005A44((uint64_t *)&v15, v5, v13);
        }
      }
      CFRelease(v11);
    }
  }
  return v7;
}

- (void)generateSuccessiveThumbnailRepresentationsForRequests:(id)a3 generationHandler:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v20 = a5;
  id v10 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v8, "count"));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v11 = v8;
  id v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v24;
    do
    {
      audit_token_t v15 = 0;
      do
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = [objc_alloc((Class)QLTGeneratorThumbnailRequest) initWithRequest:*(void *)(*((void *)&v23 + 1) + 8 * (void)v15) generationHandler:v9];
        objc_super v17 = [(QLThumbnailsService *)self clientApplicationIdentifier];
        [v16 setClientApplicationIdentifier:v17];

        [v10 addObject:v16];
        audit_token_t v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v13);
  }

  v18 = +[QLServerThread sharedInstance];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10000488C;
  v21[3] = &unk_1000082B8;
  id v22 = v20;
  id v19 = v20;
  [v18 generateSuccessiveThumbnailRepresentationsForGeneratorRequests:v10 completionHandler:v21];
}

- (NSString)clientApplicationIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (void)setClientApplicationIdentifier:(id)a3
{
}

- (void)setAuditToken:(id *)a3
{
}

- (void)thumbnailsStoreURLForURL:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = sub_100004E34;
  id v22 = sub_100004E44;
  id v23 = 0;
  id v8 = objc_alloc_init((Class)NSFileCoordinator);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100004E4C;
  v17[3] = &unk_100008290;
  v17[4] = self;
  v17[5] = &v18;
  [v8 coordinateReadingItemAtURL:v6 options:4 error:0 byAccessor:v17];
  if (v19[5]) {
    (*((void (**)(id, void, void, void))v7 + 2))(v7, 0, 0, 0);
  }
  id v9 = objc_alloc((Class)QLThumbnailAddition);
  id v10 = (id *)(v19 + 5);
  id obj = (id)v19[5];
  id v11 = [v9 initWithAdditionsPresentOnURL:v6 error:&obj];
  objc_storeStrong(v10, obj);
  if (v11)
  {
    id v12 = [v11 additionURL];
    id v13 = [v11 metadata];
    uint64_t v14 = [v11 additionURL];
    audit_token_t v15 = sub_100004A14(v14);
    (*((void (**)(id, void *, void *, void *, void))v7 + 2))(v7, v12, v13, v15, 0);
  }
  else
  {
    id v12 = +[NSError errorWithDomain:QLThumbnailsServiceErrorDomain code:0 userInfo:0];
    (*((void (**)(id, void, void, void, void *))v7 + 2))(v7, 0, 0, 0, v12);
  }

  _Block_object_dispose(&v18, 8);
}

- (void)removeThumbnailAdditionsOnURL:(id)a3 completionBlock:(id)a4
{
  id v7 = 0;
  uint64_t v5 = (void (**)(id, id))a4;
  +[QLThumbnailAddition removeAdditionsOnURL:a3 error:&v7];
  id v6 = v7;
  v5[2](v5, v6);
}

- (void)hasThumbnailForURLWrapper:(id)a3 updateLastHitDate:(BOOL)a4 andSize:(unint64_t)a5 completion:(id)a6
{
  BOOL v7 = a4;
  id v9 = a6;
  id v10 = a3;
  id v11 = +[QLThumbnailAdditionIndex sharedInstance];
  [v11 hasThumbnailForURLWrapper:v10 updateLastHitDate:v7 andSize:a5 completion:v9];
}

- (void)askThumbnailAdditionIndex:(id)a3
{
  id v4 = a3;
  id v5 = +[QLThumbnailAdditionIndex sharedInstance];
  (*((void (**)(id, id))a3 + 2))(v4, v5);
}

- (id)makeQueueWithBackgroundPriority:(BOOL)a3
{
  if (a3)
  {
    id v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.quicklook.thumbnailGeneration.background", v4);
    backgroundGenerationQueue = self->_backgroundGenerationQueue;
    p_backgroundGenerationQueue = (id *)&self->_backgroundGenerationQueue;
    id v6 = backgroundGenerationQueue;
  }
  else
  {
    id v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.quicklook.thumbnailGeneration.utility", v4);
    utilityGenerationQueue = self->_utilityGenerationQueue;
    p_backgroundGenerationQueue = (id *)&self->_utilityGenerationQueue;
    id v6 = utilityGenerationQueue;
  }
  id *p_backgroundGenerationQueue = v5;

  id v10 = *p_backgroundGenerationQueue;
  return v10;
}

- (void)removeCachedThumbnailsFromUninstalledFileProvidersWithRemainingFileProviderIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[QLServerThread sharedInstance];
  [v7 removeCachedThumbnailsFromUninstalledFileProvidersWithRemainingFileProviderIdentifiers:v6 completionHandler:v5];
}

- (void)removeCachedThumbnailsFromUninstalledFileProvidersWithIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[QLServerThread sharedInstance];
  [v7 removeCachedThumbnailsFromUninstalledFileProvidersWithIdentifiers:v6 completionHandler:v5];
}

- (void)setLastHitDateOfAllCachedThumbnailsToDate:(id)a3 withCompletionHandler:(id)a4
{
  id v8 = a4;
  id v5 = a3;
  id v6 = +[QLServerThread sharedInstance];
  [v6 setLastHitDateOfAllCachedThumbnailsToDate:v5];

  id v7 = v8;
  if (v8)
  {
    (*((void (**)(id))v8 + 2))(v8);
    id v7 = v8;
  }
}

- (void)reset
{
  id v2 = +[QLServerThread sharedInstance];
  [v2 reset];
}

- (void)getCanGenerateThumbnailsForContentType:(id)a3 completionHandler:(id)a4
{
}

- (void)canGenerateThumbnailsForContentType:(id)a3 atSize:(CGSize)a4 completionHandler:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v8 = (void (**)(id, id))a5;
  id v12 = v8;
  if (a3)
  {
    id v9 = +[UTType _typeWithIdentifier:a3 allowUndeclared:1];
    id v10 = v12;
    if (v9)
    {
      id v11 = +[QLPreviewThumbnailGenerator canGenerateThumbnailForContentType:atSize:](QLPreviewThumbnailGenerator, "canGenerateThumbnailForContentType:atSize:", v9, width, height);
      id v10 = v12;
    }
    else
    {
      id v11 = 0;
    }
    v10[2](v12, v11);
  }
  else
  {
    v8[2](v8, 0);
  }
}

- (void)getAllThumbnailsInfoForCacheAtURL:(id)a3 completionHandler:(id)a4
{
  id v6 = (void *)QLServerThreadInstance;
  id v7 = a4;
  id v9 = [v6 cacheThreadForVolume:a3];
  id v8 = [v9 allThumbnailsInfo];
  (*((void (**)(id, void *))a4 + 2))(v7, v8);
}

- (void)getInfoForCacheAtURL:(id)a3 completionHandler:(id)a4
{
  id v6 = (void *)QLServerThreadInstance;
  id v7 = a4;
  id v9 = [v6 cacheThreadForVolume:a3];
  id v8 = [v9 cacheInfo];
  (*((void (**)(id, void *))a4 + 2))(v7, v8);
}

- (void)getAllThumbnailsForIno:(id)a3 fsid:(id)a4 completionHandler:(id)a5
{
  id v19 = a3;
  id v7 = a4;
  id v8 = (void (**)(id, void *))a5;
  if (v7 && [v7 count] == (id)2)
  {
    id v9 = [v7 objectAtIndexedSubscript:0];
    unsigned int v10 = [v9 intValue];

    id v11 = [v7 objectAtIndexedSubscript:1];
    id v12 = [v11 intValue];

    uint64_t v13 = (void)v12 << 32;
    uint64_t v14 = v10;
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v13 = 0;
  }
  audit_token_t v15 = (void *)QLServerThreadInstance;
  id v16 = +[NSURL fileURLWithPath:@"/"];
  objc_super v17 = [v15 cacheThreadForVolume:v16];
  uint64_t v18 = objc_msgSend(v17, "allThumbnailsForIno:fsid:", objc_msgSend(v19, "unsignedLongLongValue"), v13 | v14);
  v8[2](v8, v18);
}

- (void)getAllThumbnailsForFPItemID:(id)a3 completionHandler:(id)a4
{
  id v5 = (void *)QLServerThreadInstance;
  id v6 = (void (**)(id, void *))a4;
  id v7 = a3;
  id v8 = [v7 providerDomainID];
  id v10 = [v5 cacheThreadForProviderDomainID:v8];

  id v9 = [v10 allThumbnailsForFPItemID:v7];

  v6[2](v6, v9);
}

- (void)fetchAllDataSeparatedVolumesWithCompletionHandler:(id)a3
{
  id v4 = (void *)QLServerThreadInstance;
  id v5 = a3;
  id v6 = [v4 allKnownDataSeparatedVolumes];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (int)pid
{
  return self->_pid;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  objc_copyStruct(retstr, &self->_auditToken, 32, 1, 0);
  return result;
}

- (OS_dispatch_queue)backgroundGenerationQueue
{
  return self->_backgroundGenerationQueue;
}

- (void)setBackgroundGenerationQueue:(id)a3
{
}

- (OS_dispatch_queue)utilityGenerationQueue
{
  return self->_utilityGenerationQueue;
}

- (void)setUtilityGenerationQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_utilityGenerationQueue, 0);

  objc_storeStrong((id *)&self->_backgroundGenerationQueue, 0);
}

@end
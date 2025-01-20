@interface PDFileSyncAgent
+ (BOOL)isUbiquitousURL:(id)a3;
+ (BOOL)isUploaded:(id)a3;
+ (BOOL)removeItemAtURL:(id)a3 error:(id *)a4;
+ (id)documentsURL:(id *)a3;
+ (id)draftsURL:(id *)a3;
+ (id)ubiquitousContainerURL:(id *)a3;
- (BOOL)cacheAssetURLFromCKRecord:(id)a3 usingAsset:(id)a4 error:(id *)a5;
- (BOOL)cacheThumbnailAssetURLFromCKRecord:(id)a3 usingAsset:(id)a4 error:(id *)a5;
- (BOOL)updateAssetIfExists:(id)a3;
- (CLSAbstractAsset)asset;
- (NSOperationQueue)presentedItemOperationQueue;
- (NSSet)observedPresentedItemUbiquityAttributes;
- (NSURL)presentedItemURL;
- (PDFileSyncAgent)initWithAsset:(id)a3 database:(id)a4;
- (id)copyAssetToCloudKitContentStoreCache:(id)a3 createThumbnailIfNeeded:(BOOL)a4;
- (id)copyToiCloudDrive;
- (id)downloadObservers;
- (id)moveDownloadedAssetFileToContentStoreCacheForAsset:(id)a3;
- (id)moveDownloadedAssetThumbnailFileToContentStoreCacheForAsset:(id)a3;
- (id)uploadAfterValidatingURLWithAuditToken:(id *)a3 createThumbnailIfNeeded:(BOOL)a4;
- (id)uploadObservers;
- (void)addDownloadObserver:(id)a3;
- (void)addToFilePresenter;
- (void)addUploadObserver:(id)a3;
- (void)createiCloudDriveCKShare:(id)a3;
- (void)deleteBackingStoreWithCompletion:(id)a3;
- (void)downloadCloudKitPrimaryFileWithCompletion:(id)a3;
- (void)downloadCloudKitThumbnailWithCompletion:(id)a3;
- (void)fetchCloudKitStreamingURLWithCompletion:(id)a3;
- (void)insertOrUpdateAssetInDBWithCoalescing:(BOOL)a3;
- (void)insertStagedAssetInDBToBeginUploading;
- (void)lock;
- (void)notifyUploadCompleted;
- (void)notifyUploadProgress;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)presentedItemDidChangeUbiquityAttributes:(id)a3;
- (void)queued_notifyDownloadCompleted:(BOOL)a3 error:(id)a4;
- (void)queued_notifyDownloadProgressFraction:(double)a3 error:(id)a4;
- (void)queued_notifyUploadCompleted:(BOOL)a3 url:(id)a4 thumbnailURL:(id)a5 relativePathWithinContainer:(id)a6 ubiquitousContainerName:(id)a7 brItemID:(id)a8 brOwnerName:(id)a9 brZoneName:(id)a10 brShareName:(id)a11 fractionUploaded:(double)a12 isTemporary:(BOOL)a13 isStaged:(BOOL)a14 error:(id)a15;
- (void)queued_notifyUploadProgressFraction:(double)a3 error:(id)a4;
- (void)queued_startObservingiCloudDriveUploadProgress;
- (void)queued_stopObservingiCloudDriveUploadProgress;
- (void)removeDownloadObserver:(id)a3;
- (void)removeDownloadObservers:(id)a3;
- (void)removeFromFilePresenter;
- (void)removeUploadObserver:(id)a3;
- (void)removeUploadObservers:(id)a3;
- (void)setAsset:(id)a3;
- (void)startStateMachine;
- (void)unlock;
- (void)uploadStateChanged:(unint64_t)a3;
- (void)uploadToCloudKitContentStore;
@end

@implementation PDFileSyncAgent

+ (id)ubiquitousContainerURL:(id *)a3
{
  uint64_t v4 = sub_1000062FC();
  v5 = (id *)v4;
  if (v4)
  {
    id v6 = *(id *)(v4 + 80);
    if (v6)
    {
      id v7 = v6;
      goto LABEL_7;
    }
  }
  CLSInitLog();
  v8 = (void *)CLSLogAsset;
  if (os_log_type_enabled(CLSLogAsset, OS_LOG_TYPE_ERROR))
  {
    v12 = v8;
    if (v5) {
      id v13 = v5[11];
    }
    else {
      id v13 = 0;
    }
    id v14 = v13;
    int v16 = 138412290;
    id v17 = v14;
    _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "schoolworkUbiquitousContainerURL is nil; schoolworkUbiquitousContainerURL = '%@'. Refreshing accountInfo.",
      (uint8_t *)&v16,
      0xCu);
  }
  sub_100042308((uint64_t)PDAccountInfo, 0);
  +[CLSUtil postNotificationAsync:"com.apple.progressd.accountChanged"];
  uint64_t v9 = sub_1000062FC();

  if (v9)
  {
    id v7 = *(id *)(v9 + 80);
    v5 = (id *)v9;
LABEL_7:
    id v10 = v5[11];
    if (!a3) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  id v15 = 0;
  id v10 = 0;
  v5 = 0;
  id v7 = 0;
  if (a3) {
LABEL_8:
  }
    *a3 = v10;
LABEL_9:

  return v7;
}

+ (id)documentsURL:(id *)a3
{
  uint64_t v4 = objc_msgSend(a1, "ubiquitousContainerURL:");
  v5 = v4;
  if (v4)
  {
    id v6 = [v4 URLByAppendingPathComponent:@"Documents" isDirectory:1];
    id v11 = 0;
    id v7 = objc_msgSend(v6, "cls_createDirectoryIfNeeded:", &v11);
    id v8 = v11;
    uint64_t v9 = v8;
    if (a3) {
      *a3 = v8;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)draftsURL:(id *)a3
{
  uint64_t v4 = objc_msgSend(a1, "documentsURL:");
  v5 = v4;
  if (v4)
  {
    id v6 = [v4 URLByAppendingPathComponent:@".Drafts" isDirectory:1];
    id v11 = 0;
    id v7 = objc_msgSend(v6, "cls_createDirectoryIfNeeded:", &v11);
    id v8 = v11;
    uint64_t v9 = v8;
    if (a3) {
      *a3 = v8;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (BOOL)isUbiquitousURL:(id)a3
{
  id v4 = a3;
  v5 = [a1 ubiquitousContainerURL:0];
  id v6 = v5;
  if (v5) {
    unsigned __int8 v7 = objc_msgSend(v5, "cls_isParentOfURL:", v4);
  }
  else {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

+ (BOOL)isUploaded:(id)a3
{
  id v4 = a3;
  if ([a1 isUbiquitousURL:v4])
  {
    v19[0] = NSURLUbiquitousItemIsUploadedKey;
    v19[1] = NSURLUbiquitousItemIsUploadingKey;
    v19[2] = NSURLUbiquitousItemDownloadingStatusKey;
    v5 = +[NSArray arrayWithObjects:v19 count:3];
    objc_msgSend(v4, "cls_removeCachedResourceValueForKeys:", v5);
    id v14 = 0;
    id v6 = [v4 resourceValuesForKeys:v5 error:&v14];
    id v7 = v14;
    if (v6)
    {
      id v8 = [v6 objectForKeyedSubscript:NSURLUbiquitousItemIsUploadedKey];
      uint64_t v9 = [v6 objectForKeyedSubscript:NSURLUbiquitousItemIsUploadingKey];
      id v10 = [v6 objectForKeyedSubscript:NSURLUbiquitousItemDownloadingStatusKey];
      if ([v8 BOOLValue] && (objc_msgSend(v9, "BOOLValue") & 1) == 0) {
        unsigned __int8 v11 = [NSURLUbiquitousItemDownloadingStatusCurrent isEqualToString:v10];
      }
      else {
        unsigned __int8 v11 = 0;
      }
    }
    else
    {
      CLSInitLog();
      v12 = CLSLogDefault;
      if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v16 = v4;
        __int16 v17 = 2112;
        id v18 = v7;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Unable to get upload status for URL: '%@'. Error: %@", buf, 0x16u);
      }
      unsigned __int8 v11 = 0;
    }
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (PDFileSyncAgent)initWithAsset:(id)a3 database:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PDFileSyncAgent;
  uint64_t v9 = [(PDFileSyncAgent *)&v18 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_asset, a3);
    objc_storeStrong((id *)&v10->_database, a4);
    unsigned __int8 v11 = objc_alloc_init(PDClassKitServiceOperations);
    assetDownloadOperations = v10->_assetDownloadOperations;
    v10->_assetDownloadOperations = v11;

    uint64_t v13 = objc_opt_new();
    uploadObservers = v10->_uploadObservers;
    v10->_uploadObservers = (NSMutableSet *)v13;

    uint64_t v15 = objc_opt_new();
    downloadObservers = v10->_downloadObservers;
    v10->_downloadObservers = (NSMutableSet *)v15;

    v10->_lock = 0;
  }

  return v10;
}

- (void)lock
{
}

- (void)unlock
{
}

- (void)addUploadObserver:(id)a3
{
  id v4 = a3;
  [(PDFileSyncAgent *)self lock];
  [(NSMutableSet *)self->_uploadObservers addObject:v4];

  if (self->_uploadState == 8) {
    [(PDFileSyncAgent *)self notifyUploadCompleted];
  }

  [(PDFileSyncAgent *)self unlock];
}

- (void)removeUploadObserver:(id)a3
{
  id v4 = a3;
  [(PDFileSyncAgent *)self lock];
  [(NSMutableSet *)self->_uploadObservers removeObject:v4];

  if (![(NSMutableSet *)self->_uploadObservers count]) {
    +[PDFileSyncManager removeAgentForAsset:self->_asset forUpload:1];
  }

  [(PDFileSyncAgent *)self unlock];
}

- (void)removeUploadObservers:(id)a3
{
  id v4 = a3;
  [(PDFileSyncAgent *)self lock];
  [(NSMutableSet *)self->_uploadObservers minusSet:v4];

  if (![(NSMutableSet *)self->_uploadObservers count]) {
    +[PDFileSyncManager removeAgentForAsset:self->_asset forUpload:1];
  }

  [(PDFileSyncAgent *)self unlock];
}

- (void)addDownloadObserver:(id)a3
{
  id v4 = a3;
  [(PDFileSyncAgent *)self lock];
  [(NSMutableSet *)self->_downloadObservers addObject:v4];

  [(PDFileSyncAgent *)self unlock];
}

- (void)removeDownloadObserver:(id)a3
{
  id v4 = a3;
  [(PDFileSyncAgent *)self lock];
  [(NSMutableSet *)self->_downloadObservers removeObject:v4];

  if (![(NSMutableSet *)self->_downloadObservers count]) {
    +[PDFileSyncManager removeAgentForAsset:self->_asset forUpload:0];
  }

  [(PDFileSyncAgent *)self unlock];
}

- (void)removeDownloadObservers:(id)a3
{
  id v4 = a3;
  [(PDFileSyncAgent *)self lock];
  [(NSMutableSet *)self->_downloadObservers minusSet:v4];

  if (![(NSMutableSet *)self->_downloadObservers count]) {
    +[PDFileSyncManager removeAgentForAsset:self->_asset forUpload:0];
  }

  [(PDFileSyncAgent *)self unlock];
}

- (id)uploadObservers
{
  [(PDFileSyncAgent *)self lock];
  id v3 = [(NSMutableSet *)self->_uploadObservers copy];
  [(PDFileSyncAgent *)self unlock];

  return v3;
}

- (id)downloadObservers
{
  [(PDFileSyncAgent *)self lock];
  id v3 = [(NSMutableSet *)self->_downloadObservers copy];
  [(PDFileSyncAgent *)self unlock];

  return v3;
}

- (void)queued_notifyUploadProgressFraction:(double)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = [(PDFileSyncAgent *)self uploadObservers];
  if ([v7 count])
  {
    objc_initWeak(&location, self);
    id v8 = sub_10011AB94();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10011ABE8;
    block[3] = &unk_1001F54D0;
    objc_copyWeak(v12, &location);
    id v10 = v7;
    v12[1] = *(id *)&a3;
    id v11 = v6;
    dispatch_async(v8, block);

    objc_destroyWeak(v12);
    objc_destroyWeak(&location);
  }
}

- (void)queued_notifyUploadCompleted:(BOOL)a3 url:(id)a4 thumbnailURL:(id)a5 relativePathWithinContainer:(id)a6 ubiquitousContainerName:(id)a7 brItemID:(id)a8 brOwnerName:(id)a9 brZoneName:(id)a10 brShareName:(id)a11 fractionUploaded:(double)a12 isTemporary:(BOOL)a13 isStaged:(BOOL)a14 error:(id)a15
{
  id v35 = a4;
  id v34 = a5;
  id v33 = a6;
  id v32 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  id v25 = a15;
  objc_initWeak(location, self);
  queue = sub_10011AB94();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011AFA4;
  block[3] = &unk_1001F54F8;
  objc_copyWeak(v52, location);
  BOOL v53 = a3;
  id v42 = v35;
  id v43 = v34;
  id v44 = v33;
  id v45 = v32;
  id v46 = v21;
  id v47 = v22;
  id v48 = v23;
  id v49 = v24;
  v52[1] = *(id *)&a12;
  BOOL v54 = a13;
  BOOL v55 = a14;
  id v50 = v25;
  v51 = self;
  id v40 = v25;
  id v39 = v24;
  id v38 = v23;
  id v26 = v22;
  id v27 = v21;
  id v28 = v32;
  id v29 = v33;
  id v30 = v34;
  id v31 = v35;
  dispatch_async(queue, block);

  objc_destroyWeak(v52);
  objc_destroyWeak(location);
}

- (void)queued_notifyDownloadProgressFraction:(double)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = [(PDFileSyncAgent *)self downloadObservers];
  if ([v7 count])
  {
    objc_initWeak(&location, self);
    id v8 = sub_10011AB94();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10011B254;
    block[3] = &unk_1001F54D0;
    objc_copyWeak(v12, &location);
    id v10 = v7;
    v12[1] = *(id *)&a3;
    id v11 = v6;
    dispatch_async(v8, block);

    objc_destroyWeak(v12);
    objc_destroyWeak(&location);
  }
}

- (void)queued_notifyDownloadCompleted:(BOOL)a3 error:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  id v7 = sub_10011AB94();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011B4A4;
  block[3] = &unk_1001F2CD8;
  objc_copyWeak(&v12, &location);
  BOOL v13 = a3;
  id v10 = v6;
  id v11 = self;
  id v8 = v6;
  dispatch_async(v7, block);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (id)uploadAfterValidatingURLWithAuditToken:(id *)a3 createThumbnailIfNeeded:(BOOL)a4
{
  id v7 = [(CLSAbstractAsset *)self->_asset URL];
  id v8 = [v7 fileSystemRepresentation];

  long long v9 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)id location = *(_OWORD *)a3->var0;
  long long v19 = v9;
  int v10 = sandbox_check_by_audit_token();
  if (v10)
  {
    if (v10 == 1) {
      +[NSError cls_createErrorWithCode:315, @"Cannot upload asset since the client does not have read access to file at '%s'", v8, v14 format];
    }
    else {
    id v12 = +[NSError cls_createErrorWithCode:315, @"Cannot upload asset since the client's sanbox blocks access to file at '%s' [error: %d]", v8, *__error() format];
    }
    objc_msgSend(v12, "cls_log:", CLSLogAsset);
  }
  else
  {
    objc_initWeak(location, self);
    if (qword_10023E790 != -1) {
      dispatch_once(&qword_10023E790, &stru_1001F5A18);
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10011B7E0;
    block[3] = &unk_1001F5520;
    id v11 = (id)qword_10023E798;
    objc_copyWeak(&v16, location);
    void block[4] = self;
    BOOL v17 = a4;
    dispatch_async(v11, block);

    objc_destroyWeak(&v16);
    objc_destroyWeak(location);
    id v12 = 0;
  }

  return v12;
}

- (void)deleteBackingStoreWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  uint64_t v5 = sub_1000062FC();
  id v6 = self->_asset;
  database = self->_database;
  id v8 = [(CLSAbstractAsset *)v6 objectID];
  LOBYTE(database) = sub_100153674((BOOL)database, v8);

  if ((database & 1) == 0)
  {
    uint64_t v14 = +[NSError cls_createErrorWithCode:341 format:@"Cannot delete a file associated with a published asset"];
LABEL_19:
    id v30 = v14;
    objc_msgSend(v14, "cls_log:", CLSLogAsset);
    v4[2](v4, 0, v30);
LABEL_20:

    goto LABEL_21;
  }
  id v9 = [(CLSAbstractAsset *)v6 type];
  if (v9 != (id)3)
  {
    if (v9 == (id)1)
    {
      if (v5)
      {
        id v10 = *(id *)(v5 + 80);
        id v11 = *(void **)(v5 + 72);
      }
      else
      {
        id v10 = 0;
        id v11 = 0;
      }
      id v12 = v11;
      location[1] = _NSConcreteStackBlock;
      id location[2] = (id)3221225472;
      location[3] = sub_10011BE1C;
      location[4] = &unk_1001F2648;
      v41 = v6;
      id v42 = v10;
      id v43 = v4;
      id v13 = v10;
      CLSPerformWithPersona();

      goto LABEL_21;
    uint64_t v14 = };
    goto LABEL_19;
  }
  if (([(CLSAbstractAsset *)v6 isStaged] & 1) == 0)
  {
    id v30 = [(CLSAbstractAsset *)v6 URL];
    v32 = id v31 = [v30 path];
    id v33 = +[NSError cls_createErrorWithCode:341 description:v32];
    v4[2](v4, 0, v33);

    goto LABEL_20;
  }
  objc_initWeak(location, self);
  uint64_t v15 = (PDCKUploadAssetsOperation *)sub_100082660([PDCKUploadAssetsOperation alloc], self->_database);
  assetsOperation = self->_assetsOperation;
  self->_assetsOperation = v15;

  newValue[0] = _NSConcreteStackBlock;
  newValue[1] = 3221225472;
  newValue[2] = sub_10011BFC4;
  newValue[3] = &unk_1001F5548;
  id v39 = v4;
  objc_super v18 = self->_assetsOperation;
  if (v18) {
    objc_setProperty_nonatomic_copy(v18, v17, newValue, 48);
  }
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_10011C0B4;
  v36[3] = &unk_1001F5570;
  objc_copyWeak(&v37, location);
  v20 = self->_assetsOperation;
  if (v20) {
    objc_setProperty_nonatomic_copy(v20, v19, v36, 40);
  }
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10011C1B8;
  v34[3] = &unk_1001F3680;
  objc_copyWeak(&v35, location);
  id v22 = self->_assetsOperation;
  if (v22) {
    objc_setProperty_nonatomic_copy(v22, v21, v34, 32);
  }
  id v23 = objc_alloc((Class)CKRecordID);
  id v24 = [(CLSAbstractAsset *)self->_asset brItemID];
  id v25 = self->_assetsOperation;
  if (v25) {
    id v25 = (PDCKUploadAssetsOperation *)v25->_assetZoneID;
  }
  id v26 = v25;
  id v27 = [v23 initWithRecordName:v24 zoneID:v26];

  id v28 = self->_assetsOperation;
  id v44 = v27;
  id v29 = +[NSArray arrayWithObjects:&v44 count:1];
  sub_100082850((id *)&v28->super.isa, &__NSArray0__struct, v29);

  objc_destroyWeak(&v35);
  objc_destroyWeak(&v37);

  objc_destroyWeak(location);
LABEL_21:
}

- (void)startStateMachine
{
}

- (void)uploadStateChanged:(unint64_t)a3
{
  uint64_t v5 = self->_asset;
  id v6 = [(CLSAbstractAsset *)v5 URL];
  id v7 = [v6 path];
  id v8 = [(CLSAbstractAsset *)v5 type];
  switch(a3)
  {
    case 0uLL:
      CLSInitLog();
      id v9 = (void *)CLSLogAsset;
      if (os_log_type_enabled(CLSLogAsset, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v10 = self->_uploadState - 1;
        if (v10 > 7) {
          CFStringRef v11 = @"PDFileUploadStateUnknown";
        }
        else {
          CFStringRef v11 = off_1001F5A98[v10];
        }
        *(_DWORD *)buf = 141558530;
        uint64_t v59 = 1752392040;
        __int16 v60 = 2112;
        v61 = v7;
        __int16 v62 = 2114;
        v63 = (void *)v11;
        id v39 = v9;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "asset.path: %{mask.hash}@, uploadStateChanged asset: %{public}@ ---> PDFileUploadStateUnknown", buf, 0x20u);
      }
      self->_unint64_t uploadState = 0;
      id v40 = self;
      uint64_t v41 = 1;
      goto LABEL_84;
    case 1uLL:
      if (v8 == (id)3)
      {
        if ([(CLSAbstractAsset *)v5 isUploaded])
        {
LABEL_80:
          id v40 = self;
          uint64_t v41 = 3;
          goto LABEL_84;
        }
        CLSInitLog();
        id v35 = (void *)CLSLogAsset;
        if (os_log_type_enabled(CLSLogAsset, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v36 = self->_uploadState - 1;
          if (v36 > 7) {
            CFStringRef v37 = @"PDFileUploadStateUnknown";
          }
          else {
            CFStringRef v37 = off_1001F5A98[v36];
          }
          *(_DWORD *)buf = 141558530;
          uint64_t v59 = 1752392040;
          __int16 v60 = 2112;
          v61 = v7;
          __int16 v62 = 2114;
          v63 = (void *)v37;
          BOOL v55 = v35;
          _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "asset.path: %{mask.hash}@, uploadStateChanged: %{public}@ ---> PDFileUploadStateNotUploaded", buf, 0x20u);
        }
        self->_unint64_t uploadState = 1;
        [(PDFileSyncAgent *)self uploadToCloudKitContentStore];
      }
      else if (v8 == (id)1)
      {
        unint64_t uploadState = self->_uploadState;
        if (uploadState <= 8 && ((1 << uploadState) & 0x191) != 0)
        {
          CLSInitLog();
          id v13 = (void *)CLSLogAsset;
          if (os_log_type_enabled(CLSLogAsset, OS_LOG_TYPE_DEFAULT))
          {
            unint64_t v14 = self->_uploadState - 1;
            if (v14 > 7) {
              CFStringRef v15 = @"PDFileUploadStateUnknown";
            }
            else {
              CFStringRef v15 = off_1001F5A98[v14];
            }
            *(_DWORD *)buf = 141558530;
            uint64_t v59 = 1752392040;
            __int16 v60 = 2112;
            v61 = v7;
            __int16 v62 = 2114;
            v63 = (void *)v15;
            BOOL v53 = v13;
            _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "asset.path: %{mask.hash}@, uploadStateChanged: %{public}@ ---> PDFileUploadStateNotUploaded", buf, 0x20u);
          }
          self->_unint64_t uploadState = 1;
          [(PDFileSyncAgent *)self queued_startObservingiCloudDriveUploadProgress];
          if (+[PDFileSyncAgent isUploaded:v6])
          {
            [(CLSAbstractAsset *)v5 setFractionUploaded:0.9];
            [(PDFileSyncAgent *)self notifyUploadProgress];
            goto LABEL_80;
          }
        }
      }
LABEL_85:

      return;
    case 2uLL:
      CLSInitLog();
      id v16 = (void *)CLSLogAsset;
      if (os_log_type_enabled(CLSLogAsset, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v17 = self->_uploadState - 1;
        if (v17 > 7) {
          CFStringRef v18 = @"PDFileUploadStateUnknown";
        }
        else {
          CFStringRef v18 = off_1001F5A98[v17];
        }
        *(_DWORD *)buf = 141558530;
        uint64_t v59 = 1752392040;
        __int16 v60 = 2112;
        v61 = v7;
        __int16 v62 = 2114;
        v63 = (void *)v18;
        id v42 = v16;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "asset.path: %{mask.hash}@, uploadStateChanged: %{public}@ ---> PDFileUploadStateUploading", buf, 0x20u);
      }
      self->_unint64_t uploadState = 2;
      [(PDFileSyncAgent *)self notifyUploadProgress];
      goto LABEL_85;
    case 3uLL:
      if (v8 == (id)3) {
        goto LABEL_70;
      }
      if (v8 != (id)1) {
        goto LABEL_85;
      }
      [(PDFileSyncAgent *)self queued_stopObservingiCloudDriveUploadProgress];
      if (self->_uploadState > 2) {
        goto LABEL_85;
      }
      CLSInitLog();
      long long v19 = (void *)CLSLogAsset;
      if (os_log_type_enabled(CLSLogAsset, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v20 = self->_uploadState - 1;
        if (v20 > 7) {
          CFStringRef v21 = @"PDFileUploadStateUnknown";
        }
        else {
          CFStringRef v21 = off_1001F5A98[v20];
        }
        *(_DWORD *)buf = 141558530;
        uint64_t v59 = 1752392040;
        __int16 v60 = 2112;
        v61 = v7;
        __int16 v62 = 2114;
        v63 = (void *)v21;
        BOOL v54 = v19;
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "asset.path: %{mask.hash}@, uploadStateChanged: %{public}@ ---> PDFileUploadStateUploaded", buf, 0x20u);
      }
      self->_unint64_t uploadState = 3;
      id v40 = self;
      uint64_t v41 = 5;
      goto LABEL_84;
    case 4uLL:
      unint64_t v22 = 4;
      goto LABEL_59;
    case 5uLL:
      if (v8 != (id)3)
      {
        if (v8 == (id)1)
        {
          CLSInitLog();
          id v23 = (void *)CLSLogAsset;
          if (os_log_type_enabled(CLSLogAsset, OS_LOG_TYPE_DEFAULT))
          {
            unint64_t v24 = self->_uploadState - 1;
            if (v24 > 7) {
              CFStringRef v25 = @"PDFileUploadStateUnknown";
            }
            else {
              CFStringRef v25 = off_1001F5A98[v24];
            }
            *(_DWORD *)buf = 141558530;
            uint64_t v59 = 1752392040;
            __int16 v60 = 2112;
            v61 = v7;
            __int16 v62 = 2114;
            v63 = (void *)v25;
            id v44 = v23;
            _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "asset.path: %{mask.hash}@, uploadStateChanged: %{public}@ ---> PDFileUploadStateSettingUpShare", buf, 0x20u);
          }
          self->_unint64_t uploadState = 5;
          v57[0] = _NSConcreteStackBlock;
          v57[1] = 3221225472;
          v57[2] = sub_10011CE00;
          v57[3] = &unk_1001F5598;
          v57[4] = self;
          [(PDFileSyncAgent *)self createiCloudDriveCKShare:v57];
        }
        goto LABEL_85;
      }
      CLSInitLog();
      id v38 = CLSLogAsset;
      if (!os_log_type_enabled(CLSLogAsset, OS_LOG_TYPE_ERROR)) {
        goto LABEL_85;
      }
      goto LABEL_49;
    case 6uLL:
      if (v8 != (id)3)
      {
        if (v8 == (id)1)
        {
          CLSInitLog();
          id v26 = (void *)CLSLogAsset;
          if (os_log_type_enabled(CLSLogAsset, OS_LOG_TYPE_DEFAULT))
          {
            unint64_t v27 = self->_uploadState - 1;
            if (v27 > 7) {
              CFStringRef v28 = @"PDFileUploadStateUnknown";
            }
            else {
              CFStringRef v28 = off_1001F5A98[v27];
            }
            *(_DWORD *)buf = 141558530;
            uint64_t v59 = 1752392040;
            __int16 v60 = 2112;
            v61 = v7;
            __int16 v62 = 2114;
            v63 = (void *)v28;
            id v45 = v26;
            _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "asset.path: %{mask.hash}@, uploadStateChanged: %{public}@ ---> PDFileUploadStateShared", buf, 0x20u);
          }
          self->_unint64_t uploadState = 6;
          uploadError = self->_uploadError;
          self->_uploadError = 0;

          [(CLSAbstractAsset *)v5 setFractionUploaded:1.0];
          [(CLSAbstractAsset *)v5 setUploaded:1];
          CLSInitLog();
          id v47 = (void *)CLSLogAsset;
          if (os_log_type_enabled(CLSLogAsset, OS_LOG_TYPE_DEFAULT))
          {
            id v48 = v47;
            [(CLSAbstractAsset *)v5 fractionUploaded];
            *(_DWORD *)buf = 141558530;
            uint64_t v59 = 1752392040;
            __int16 v60 = 2112;
            v61 = v7;
            __int16 v62 = 2048;
            v63 = v49;
            _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Completed upload of asset at '%{mask.hash}@' [reported upload progress as: %f]", buf, 0x20u);
          }
          CLSInitLog();
          id v50 = CLSLogAsset;
          if (os_log_type_enabled(CLSLogAsset, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 141558274;
            uint64_t v59 = 1752392040;
            __int16 v60 = 2112;
            v61 = v7;
            _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "Created a CKShare for asset at '%{mask.hash}@'", buf, 0x16u);
          }
LABEL_70:
          id v40 = self;
          uint64_t v41 = 8;
LABEL_84:
          [(PDFileSyncAgent *)v40 uploadStateChanged:v41];
        }
        goto LABEL_85;
      }
      CLSInitLog();
      id v38 = CLSLogAsset;
      if (!os_log_type_enabled(CLSLogAsset, OS_LOG_TYPE_ERROR)) {
        goto LABEL_85;
      }
      goto LABEL_49;
    case 7uLL:
      if (v8 == (id)3)
      {
        CLSInitLog();
        id v38 = CLSLogAsset;
        if (os_log_type_enabled(CLSLogAsset, OS_LOG_TYPE_ERROR))
        {
LABEL_49:
          *(_DWORD *)buf = 141558274;
          uint64_t v59 = 1752392040;
          __int16 v60 = 2112;
          v61 = v7;
          _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Should not set up CK Share for a file uploaded to CloudKit Content Store. Asset at: '%{mask.hash}@'", buf, 0x16u);
        }
      }
      else if (v8 == (id)1)
      {
        CLSInitLog();
        id v29 = (void *)CLSLogAsset;
        if (os_log_type_enabled(CLSLogAsset, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v30 = self->_uploadState - 1;
          if (v30 > 7) {
            CFStringRef v31 = @"PDFileUploadStateUnknown";
          }
          else {
            CFStringRef v31 = off_1001F5A98[v30];
          }
          *(_DWORD *)buf = 141558530;
          uint64_t v59 = 1752392040;
          __int16 v60 = 2112;
          v61 = v7;
          __int16 v62 = 2114;
          v63 = (void *)v31;
          v51 = v29;
          _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "asset.path: %{mask.hash}@, uploadStateChanged: %{public}@ ---> PDFileUploadStateSharingFailed", buf, 0x20u);
        }
        self->_unint64_t uploadState = 7;
        CLSInitLog();
        v52 = CLSLogAsset;
        if (os_log_type_enabled(CLSLogAsset, OS_LOG_TYPE_ERROR))
        {
          sharingError = self->_sharingError;
          *(_DWORD *)buf = 141558530;
          uint64_t v59 = 1752392040;
          __int16 v60 = 2112;
          v61 = v7;
          __int16 v62 = 2112;
          v63 = sharingError;
          _os_log_error_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "Failed to create a CKShare for asset at '%{mask.hash}@', error: %@", buf, 0x20u);
        }
        objc_storeStrong((id *)&self->_uploadError, self->_sharingError);
LABEL_60:
        [(PDFileSyncAgent *)self notifyUploadCompleted];
      }
      goto LABEL_85;
    case 8uLL:
      CLSInitLog();
      id v32 = (void *)CLSLogAsset;
      if (os_log_type_enabled(CLSLogAsset, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v33 = self->_uploadState - 1;
        if (v33 > 7) {
          CFStringRef v34 = @"PDFileUploadStateUnknown";
        }
        else {
          CFStringRef v34 = off_1001F5A98[v33];
        }
        *(_DWORD *)buf = 141558530;
        uint64_t v59 = 1752392040;
        __int16 v60 = 2112;
        v61 = v7;
        __int16 v62 = 2114;
        v63 = (void *)v34;
        id v43 = v32;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "asset.path: %{mask.hash}@, uploadStateChanged: %{public}@ ---> PDFileUploadStateCompleted", buf, 0x20u);
      }
      unint64_t v22 = 8;
LABEL_59:
      self->_unint64_t uploadState = v22;
      goto LABEL_60;
    default:
      goto LABEL_85;
  }
}

- (void)insertOrUpdateAssetInDBWithCoalescing:(BOOL)a3
{
  if (!a3
    || (+[NSDate now],
        id v4 = objc_claimAutoreleasedReturnValue(),
        [v4 timeIntervalSinceDate:self->_lastDBUpdate],
        double v6 = v5 * 1000.0,
        v4,
        v6 >= 500.0))
  {
    CLSInitLog();
    id v7 = CLSLogAsset;
    if (os_log_type_enabled(CLSLogAsset, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unint64_t v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PDFileSyncAgent insertOrUpdateAssetInDBWithCoalescing", v10, 2u);
    }
    if ([(PDDatabase *)self->_database insertOrUpdateObject:self->_asset])
    {
      id v8 = +[NSDate now];
      lastDBUpdate = self->_lastDBUpdate;
      self->_lastDBUpdate = v8;
    }
  }
}

- (void)insertStagedAssetInDBToBeginUploading
{
  id v3 = self->_asset;
  [(CLSAbstractAsset *)v3 setStaged:1];
  id v4 = [(CLSAbstractAsset *)self->_asset URL];
  double v5 = [v4 lastPathComponent];
  [(CLSAbstractAsset *)v3 setOriginalFilename:v5];

  [(PDFileSyncAgent *)self insertOrUpdateAssetInDBWithCoalescing:0];

  [(PDFileSyncAgent *)self queued_notifyUploadProgressFraction:0 error:0.0];
}

- (void)notifyUploadProgress
{
  id v3 = self->_asset;
  [(PDFileSyncAgent *)self insertOrUpdateAssetInDBWithCoalescing:1];
  [(CLSAbstractAsset *)v3 fractionUploaded];
  -[PDFileSyncAgent queued_notifyUploadProgressFraction:error:](self, "queued_notifyUploadProgressFraction:error:", self->_uploadError);
}

- (void)notifyUploadCompleted
{
  id v3 = self->_asset;
  [(CLSAbstractAsset *)v3 setTemporary:0];
  [(CLSAbstractAsset *)v3 setModified:1];
  [(PDFileSyncAgent *)self insertOrUpdateAssetInDBWithCoalescing:0];
  id v4 = [(CLSAbstractAsset *)v3 URL];
  id v5 = [(CLSAbstractAsset *)v3 type];
  if (v4)
  {
    id v49 = 0;
    double v6 = +[FPSandboxingURLWrapper wrapperWithURL:v4 readonly:0 error:&v49];
    id v7 = v49;
    if (v7)
    {
      id v8 = v7;
      CLSInitLog();
      id v9 = CLSLogAsset;
      if (os_log_type_enabled(CLSLogAsset, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v51 = v4;
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "FPSandboxingURLWrapper failed to wrap '%@'", buf, 0xCu);
      }
    }
  }
  else
  {
    double v6 = 0;
  }
  unint64_t v10 = [(CLSAbstractAsset *)v3 thumbnailURL];
  if (v10)
  {
    id v48 = 0;
    CFStringRef v11 = +[FPSandboxingURLWrapper wrapperWithURL:v10 readonly:0 error:&v48];
    id v12 = v48;
    if (v12)
    {
      CLSInitLog();
      id v13 = CLSLogAsset;
      if (os_log_type_enabled(CLSLogAsset, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v51 = v10;
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "FPSandboxingURLWrapper failed to wrap '%@'", buf, 0xCu);
      }
    }
  }
  else
  {
    id v12 = 0;
    CFStringRef v11 = 0;
  }
  if (v5 == (id)3)
  {
    id v47 = v10;
    id v46 = v11;
    unsigned int v44 = [(CLSAbstractAsset *)v3 isUploaded];
    uint64_t v28 = [(CLSAbstractAsset *)v3 brItemID];
    uint64_t v29 = [(CLSAbstractAsset *)v3 brOwnerName];
    unint64_t v14 = [(CLSAbstractAsset *)v3 brZoneName];
    CFStringRef v15 = [(CLSAbstractAsset *)v3 brShareName];
    [(CLSAbstractAsset *)v3 fractionUploaded];
    double v31 = v30;
    id v32 = v6;
    unsigned __int8 v33 = [(CLSAbstractAsset *)v3 isTemporary];
    unsigned __int8 v34 = [(CLSAbstractAsset *)v3 isStaged];
    uploadError = self->_uploadError;
    BYTE1(v37) = v34;
    LOBYTE(v37) = v33;
    double v6 = v32;
    unint64_t v27 = (void *)v29;
    uint64_t v36 = v29;
    id v35 = self;
    id v26 = (void *)v28;
    CFStringRef v11 = v46;
    -[PDFileSyncAgent queued_notifyUploadCompleted:url:thumbnailURL:relativePathWithinContainer:ubiquitousContainerName:brItemID:brOwnerName:brZoneName:brShareName:fractionUploaded:isTemporary:isStaged:error:](v35, "queued_notifyUploadCompleted:url:thumbnailURL:relativePathWithinContainer:ubiquitousContainerName:brItemID:brOwnerName:brZoneName:brShareName:fractionUploaded:isTemporary:isStaged:error:", v44, v6, v46, 0, 0, v28, v31, v36, v14, v15, v37, uploadError);
    goto LABEL_16;
  }
  if (v5 == (id)1)
  {
    id v47 = v10;
    uint64_t v42 = +[PDFileSyncAgent ubiquitousContainerURL:0];
    uint64_t v41 = objc_msgSend(v4, "cls_pathRelativeToURL:", v42);
    unsigned int v40 = [(CLSAbstractAsset *)v3 isUploaded];
    unint64_t v14 = CLSUbiquitousContainerID();
    CFStringRef v15 = [(CLSAbstractAsset *)v3 brItemID];
    [(CLSAbstractAsset *)v3 brOwnerName];
    id v16 = v45 = v4;
    [(CLSAbstractAsset *)v3 brZoneName];
    v18 = unint64_t v17 = v11;
    [(CLSAbstractAsset *)v3 brShareName];
    id v43 = v12;
    v20 = long long v19 = v6;
    [(CLSAbstractAsset *)v3 fractionUploaded];
    double v22 = v21;
    unsigned __int8 v23 = [(CLSAbstractAsset *)v3 isTemporary];
    unsigned __int8 v24 = [(CLSAbstractAsset *)v3 isStaged];
    id v38 = self->_uploadError;
    BYTE1(v37) = v24;
    LOBYTE(v37) = v23;
    CFStringRef v25 = self;
    unint64_t v27 = (void *)v41;
    id v26 = (void *)v42;
    -[PDFileSyncAgent queued_notifyUploadCompleted:url:thumbnailURL:relativePathWithinContainer:ubiquitousContainerName:brItemID:brOwnerName:brZoneName:brShareName:fractionUploaded:isTemporary:isStaged:error:](v25, "queued_notifyUploadCompleted:url:thumbnailURL:relativePathWithinContainer:ubiquitousContainerName:brItemID:brOwnerName:brZoneName:brShareName:fractionUploaded:isTemporary:isStaged:error:", v40, v19, v17, v41, v14, v15, v22, v16, v18, v20, v37, v38);

    double v6 = v19;
    id v12 = v43;

    CFStringRef v11 = v17;
    id v4 = v45;
LABEL_16:

    unint64_t v10 = v47;
  }
}

+ (BOOL)removeItemAtURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  double v6 = +[NSFileManager defaultManager];
  id v17 = 0;
  unsigned __int8 v7 = [v6 removeItemAtURL:v5 error:&v17];

  id v8 = v17;
  id v9 = v8;
  if (v7)
  {
    BOOL v10 = 1;
  }
  else
  {
    CFStringRef v11 = [v8 underlyingErrors];
    id v12 = [v11 firstObject];

    if ([v12 code] == (id)2
      && ([v12 domain],
          id v13 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v14 = [v13 isEqualToString:NSPOSIXErrorDomain],
          v13,
          (v14 & 1) != 0))
    {
      BOOL v10 = 1;
    }
    else
    {
      id v15 = v9;
      BOOL v10 = 0;
      if (a4) {
        *a4 = v15;
      }
    }
  }
  return v10;
}

- (id)moveDownloadedAssetFileToContentStoreCacheForAsset:(id)a3
{
  id v3 = a3;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  long long v19 = sub_10000B7A4;
  unint64_t v20 = sub_10000B5EC;
  id v21 = 0;
  id v4 = sub_1000062FC();
  id v5 = (id *)(v17 + 5);
  id obj = (id)v17[5];
  double v6 = sub_1000D1688((uint64_t)PDFileManager, v4, &obj);
  objc_storeStrong(v5, obj);
  if (v6)
  {
    unsigned __int8 v7 = [v3 filenameForCKContentStoreCache];
    id v8 = [v6 URLByAppendingPathComponent:v7 isDirectory:0];
    if (v4) {
      id v9 = (void *)v4[9];
    }
    else {
      id v9 = 0;
    }
    id v10 = v9;
    id v13 = v3;
    id v14 = v8;
    CLSPerformWithPersona();

    id v11 = (id)v17[5];
  }
  else
  {
    id v11 = (id)v17[5];
  }

  _Block_object_dispose(&v16, 8);

  return v11;
}

- (id)moveDownloadedAssetThumbnailFileToContentStoreCacheForAsset:(id)a3
{
  id v3 = a3;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  long long v19 = sub_10000B7A4;
  unint64_t v20 = sub_10000B5EC;
  id v21 = 0;
  id v4 = sub_1000062FC();
  id v5 = (id *)(v17 + 5);
  id obj = (id)v17[5];
  double v6 = sub_1000D1688((uint64_t)PDFileManager, v4, &obj);
  objc_storeStrong(v5, obj);
  if (v6)
  {
    unsigned __int8 v7 = [v3 thumbnailFilenameForCKContentStoreCache];
    id v8 = [v6 URLByAppendingPathComponent:v7 isDirectory:0];
    if (v4) {
      id v9 = (void *)v4[9];
    }
    else {
      id v9 = 0;
    }
    id v10 = v9;
    id v13 = v3;
    id v14 = v8;
    CLSPerformWithPersona();

    id v11 = (id)v17[5];
  }
  else
  {
    id v11 = (id)v17[5];
  }

  _Block_object_dispose(&v16, 8);

  return v11;
}

- (id)copyAssetToCloudKitContentStoreCache:(id)a3 createThumbnailIfNeeded:(BOOL)a4
{
  id v6 = a3;
  uint64_t v53 = 0;
  BOOL v54 = (id *)&v53;
  uint64_t v55 = 0x3032000000;
  v56 = sub_10000B7A4;
  v57 = sub_10000B5EC;
  id v58 = 0;
  unsigned __int8 v7 = sub_1000062FC();
  id v8 = v54;
  id v52 = v54[5];
  id v9 = sub_1000D1688((uint64_t)PDFileManager, v7, &v52);
  objc_storeStrong(v8 + 5, v52);
  if (v9)
  {
    uint64_t v10 = [v6 filenameForCKContentStoreCache];
    uint64_t v11 = [v6 thumbnailFilenameForCKContentStoreCache];
    id v12 = [v9 URLByAppendingPathComponent:v10 isDirectory:0];
    if (v11)
    {
      id v13 = [v9 URLByAppendingPathComponent:v11 isDirectory:0];
    }
    else
    {
      id v13 = 0;
    }
    id v15 = [v6 URL];
    uint64_t v46 = 0;
    id v47 = &v46;
    uint64_t v48 = 0x3032000000;
    id v49 = sub_10000B7A4;
    id v50 = sub_10000B5EC;
    id v51 = [v6 thumbnailURL];
    v44[0] = 0;
    v44[1] = v44;
    v44[2] = 0x2020000000;
    unsigned __int8 v45 = 0;
    unsigned __int8 v45 = [v15 isEqual:v12];
    v42[0] = 0;
    v42[1] = v42;
    v42[2] = 0x2020000000;
    unsigned __int8 v43 = 0;
    id v26 = (void *)v11;
    unint64_t v27 = (void *)v10;
    unsigned __int8 v43 = [(id)v47[5] isEqual:v13];
    uint64_t v16 = self;
    if (v7) {
      id v17 = (void *)v7[9];
    }
    else {
      id v17 = 0;
    }
    id v18 = v17;
    uint64_t v29 = _NSConcreteStackBlock;
    uint64_t v30 = 3221225472;
    double v31 = sub_10011E524;
    id v32 = &unk_1001F5638;
    uint64_t v37 = v44;
    id v19 = v12;
    id v33 = v19;
    id v38 = &v53;
    id v39 = v42;
    id v20 = v13;
    id v34 = v20;
    id v21 = v15;
    id v35 = v21;
    id v22 = v6;
    BOOL v41 = a4;
    id v36 = v22;
    unsigned int v40 = &v46;
    CLSPerformWithPersona();

    id v14 = v54[5];
    if (v14)
    {
      id v23 = v14;
    }
    else if (!-[PDDatabase insertOrUpdateObject:](v16->_database, "insertOrUpdateObject:", v22, v26, v27))
    {
      CLSInitLog();
      unsigned __int8 v24 = CLSLogAsset;
      if (os_log_type_enabled(CLSLogAsset, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Failed to insert/update URL and thumbnailURL of asset.", buf, 2u);
      }
    }

    _Block_object_dispose(v42, 8);
    _Block_object_dispose(v44, 8);
    _Block_object_dispose(&v46, 8);
  }
  else
  {
    id v14 = v54[5];
  }

  _Block_object_dispose(&v53, 8);
  return v14;
}

- (void)uploadToCloudKitContentStore
{
  id v3 = self->_asset;
  if ([(CLSAbstractAsset *)v3 isUploaded])
  {
    [(PDFileSyncAgent *)self uploadStateChanged:8];
  }
  else
  {
    objc_initWeak(&location, self);
    v36[0] = 0;
    v36[1] = v36;
    v36[2] = 0x3032000000;
    v36[3] = sub_10000B7A4;
    void v36[4] = sub_10000B5EC;
    sub_100006D08(self->_database, @"PDCK_iCloudUserID");
    id v37 = (id)objc_claimAutoreleasedReturnValue();
    id v4 = (PDCKUploadAssetsOperation *)sub_100082660([PDCKUploadAssetsOperation alloc], self->_database);
    assetsOperation = self->_assetsOperation;
    self->_assetsOperation = v4;

    unsigned __int8 v7 = self->_assetsOperation;
    if (v7) {
      objc_setProperty_nonatomic_copy(v7, v6, &stru_1001F5678, 48);
    }
    newValue[0] = _NSConcreteStackBlock;
    newValue[1] = 3221225472;
    newValue[2] = sub_10011F420;
    newValue[3] = &unk_1001F56A0;
    objc_copyWeak(&v35, &location);
    void newValue[4] = v36;
    id v9 = self->_assetsOperation;
    if (v9) {
      objc_setProperty_nonatomic_copy(v9, v8, newValue, 40);
    }
    uint64_t v29 = _NSConcreteStackBlock;
    uint64_t v30 = 3221225472;
    double v31 = sub_10011F750;
    id v32 = &unk_1001F3680;
    objc_copyWeak(&v33, &location);
    uint64_t v11 = self->_assetsOperation;
    if (v11) {
      objc_setProperty_nonatomic_copy(v11, v10, &v29, 32);
    }
    id v12 = objc_alloc((Class)CKRecordID);
    id v13 = [(CLSAbstractAsset *)self->_asset objectID];
    id v14 = self->_assetsOperation;
    if (v14) {
      id v14 = (PDCKUploadAssetsOperation *)v14->_assetZoneID;
    }
    id v15 = v14;
    id v16 = [v12 initWithRecordName:v13 zoneID:v15];

    id v17 = [objc_alloc((Class)CKRecord) initWithRecordType:@"CLSCKAsset" recordID:v16];
    id v18 = +[NSDate date];
    [v17 setObject:v18 forKeyedSubscript:@"dateCreated"];

    id v19 = +[NSDate date];
    [v17 setObject:v19 forKeyedSubscript:@"dateLastModified"];

    id v20 = objc_alloc((Class)CKAsset);
    uint64_t v21 = [(CLSAbstractAsset *)self->_asset URL];
    id v22 = [v20 initWithFileURL:v21];

    [v17 setObject:v22 forKeyedSubscript:@"asset"];
    id v23 = [(CLSAbstractAsset *)self->_asset thumbnailURL];
    LOBYTE(v21) = v23 == 0;

    if ((v21 & 1) == 0)
    {
      id v24 = objc_alloc((Class)CKAsset);
      CFStringRef v25 = [(CLSAbstractAsset *)self->_asset thumbnailURL];
      id v26 = [v24 initWithFileURL:v25];

      [v17 setObject:v26 forKeyedSubscript:@"assetThumbnail"];
    }
    [(PDFileSyncAgent *)self insertStagedAssetInDBToBeginUploading];
    unint64_t v27 = self->_assetsOperation;
    id v39 = v17;
    uint64_t v28 = +[NSArray arrayWithObjects:&v39 count:1];
    sub_100082850((id *)&v27->super.isa, v28, &__NSArray0__struct);

    objc_destroyWeak(&v33);
    objc_destroyWeak(&v35);
    _Block_object_dispose(v36, 8);

    objc_destroyWeak(&location);
  }
}

- (id)copyToiCloudDrive
{
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000;
  id v32 = sub_10000B7A4;
  id v33 = sub_10000B5EC;
  id v34 = 0;
  id v3 = [(CLSAbstractAsset *)self->_asset URL];
  unsigned int v4 = [v3 startAccessingSecurityScopedResource];
  id v5 = +[NSFileManager defaultManager];
  id v6 = [v3 path];
  unsigned __int8 v7 = [v5 fileExistsAtPath:v6];

  if (v4) {
    [v3 stopAccessingSecurityScopedResource];
  }
  if (v7)
  {
    id v8 = [(CLSAbstractAsset *)self->_asset brItemID];
    uint64_t v9 = objc_msgSend(v3, "br_itemID");
    uint64_t v10 = (void *)v9;
    if (v8)
    {
      if (v9 && ([v8 isEqualToString:v9] & 1) != 0)
      {
        id v11 = 0;
      }
      else
      {
        uint64_t v14 = +[NSError cls_createErrorWithCode:315, @"Attempting to upload a file whose br_ItemID, '%@', does not match asset's br_itemID, '%@'", v10, v8 format];
        id v15 = (void *)v30[5];
        v30[5] = v14;

        objc_msgSend((id)v30[5], "cls_log:", CLSLogAsset);
        id v11 = (id)v30[5];
      }
    }
    else
    {
      id v16 = (id *)(v30 + 5);
      id obj = (id)v30[5];
      id v17 = +[PDFileSyncAgent draftsURL:&obj];
      objc_storeStrong(v16, obj);
      if (v17)
      {
        uint64_t v18 = sub_1000062FC();
        id v19 = (void *)v18;
        if (v18) {
          id v20 = *(void **)(v18 + 72);
        }
        else {
          id v20 = 0;
        }
        id v21 = v20;
        id v26 = v17;
        id v27 = v3;
        CLSPerformWithPersona();

        id v11 = (id)v30[5];
        if (v11) {
          id v22 = v11;
        }
      }
      else
      {
        uint64_t v23 = +[NSError cls_createErrorWithCode:315 underlyingError:v30[5] description:@"Drafts folder not found."];
        id v24 = (void *)v30[5];
        v30[5] = v23;

        objc_msgSend((id)v30[5], "cls_log:", CLSLogAsset);
        id v11 = (id)v30[5];
      }
    }
  }
  else
  {
    uint64_t v12 = +[NSError cls_createErrorWithCode:315, @"No file to upload at '%@'", v3 format];
    id v13 = (void *)v30[5];
    v30[5] = v12;

    objc_msgSend((id)v30[5], "cls_log:", CLSLogAsset);
    id v11 = (id)v30[5];
  }

  _Block_object_dispose(&v29, 8);
  return v11;
}

- (void)queued_startObservingiCloudDriveUploadProgress
{
  objc_initWeak(&location, self);
  v2 = sub_10011AB94();
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100120164;
  v3[3] = &unk_1001F2D28;
  objc_copyWeak(&v4, &location);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)queued_stopObservingiCloudDriveUploadProgress
{
  objc_initWeak(&location, self);
  v2 = sub_10011AB94();
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100120A04;
  v3[3] = &unk_1001F2D28;
  objc_copyWeak(&v4, &location);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)createiCloudDriveCKShare:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  if (qword_10023E7A0 != -1) {
    dispatch_once(&qword_10023E7A0, &stru_1001F5A38);
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100120C00;
  v7[3] = &unk_1001F5768;
  id v5 = (id)qword_10023E7A8;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (NSURL)presentedItemURL
{
  return (NSURL *)[(CLSAbstractAsset *)self->_asset URL];
}

- (NSOperationQueue)presentedItemOperationQueue
{
  if (qword_10023E7B8 != -1) {
    dispatch_once(&qword_10023E7B8, &stru_1001F5A58);
  }
  v2 = (void *)qword_10023E7B0;

  return (NSOperationQueue *)v2;
}

- (NSSet)observedPresentedItemUbiquityAttributes
{
  if (qword_10023E748 != -1) {
    dispatch_once(&qword_10023E748, &stru_1001F5788);
  }
  v2 = (void *)qword_10023E740;

  return (NSSet *)v2;
}

- (void)addToFilePresenter
{
  if (!self->_addedToFilePresenter)
  {
    +[NSFileCoordinator addFilePresenter:self];
    CLSInitLog();
    id v3 = CLSLogAsset;
    if (os_log_type_enabled(CLSLogAsset, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PDFileSyncAgent object '%{public}@' was added to NSFileCoordinator as FilePresenter", buf, 0xCu);
    }
    self->_addedToFilePresenter = 1;
    id v4 = [(CLSAbstractAsset *)self->_asset URL];
    id v5 = [(PDFileSyncAgent *)self observedPresentedItemUbiquityAttributes];
    id v6 = [v5 allObjects];
    objc_msgSend(v4, "cls_removeCachedResourceValueForKeys:", v6);

    unsigned __int8 v7 = [v5 allObjects];
    id v11 = 0;
    id v8 = [v4 resourceValuesForKeys:v7 error:&v11];
    id v9 = v11;

    CLSInitLog();
    uint64_t v10 = CLSLogAsset;
    if (os_log_type_enabled(CLSLogAsset, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v13 = v8;
      __int16 v14 = 2114;
      id v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Added to filePresenter and fetched initial state of attributes: %{public}@, error: %{public}@", buf, 0x16u);
    }
  }
}

- (void)removeFromFilePresenter
{
  if (self->_addedToFilePresenter)
  {
    +[NSFileCoordinator removeFilePresenter:self];
    CLSInitLog();
    id v3 = CLSLogAsset;
    if (os_log_type_enabled(CLSLogAsset, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138543362;
      id v5 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PDFileSyncAgent object '%{public}@' was removed from NSFileCoordinator as FilePresenter", (uint8_t *)&v4, 0xCu);
    }
    self->_addedToFilePresenter = 0;
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [(CLSAbstractAsset *)self->_asset URL];

  if (v13 == a6)
  {
    __int16 v14 = (NSProgress *)v11;
    if (self->_uploadProgress != v14) {
      __assert_rtn("-[PDFileSyncAgent observeValueForKeyPath:ofObject:change:context:]", "PDFileSyncManager.m", 1568, "progress == _uploadProgress");
    }
    id v15 = v14;
    id v16 = self->_asset;
    [(NSProgress *)v15 fractionCompleted];
    double v18 = v17 * 0.9;
    [(CLSAbstractAsset *)v16 setFractionUploaded:v17 * 0.9];
    id v19 = [(CLSAbstractAsset *)self->_asset fileSizeInBytes];
    CLSInitLog();
    id v20 = CLSLogAsset;
    if (os_log_type_enabled(CLSLogAsset, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v23 = (uint64_t)(v18 * (double)(uint64_t)v19);
      __int16 v24 = 2048;
      id v25 = v19;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Uploaded: %ld of %ld bytes", buf, 0x16u);
    }
    [(PDFileSyncAgent *)self uploadStateChanged:2];
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)PDFileSyncAgent;
    [(PDFileSyncAgent *)&v21 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)presentedItemDidChangeUbiquityAttributes:(id)a3
{
  id v4 = a3;
  uint64_t v30 = self;
  uint64_t v29 = [(CLSAbstractAsset *)self->_asset URL];
  CLSInitLog();
  id v5 = CLSLogAsset;
  if (os_log_type_enabled(CLSLogAsset, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v38 = (uint64_t)v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "presentedItemDidChangeUbiquityAttributes, attributes: %@", buf, 0xCu);
  }
  id v6 = [v4 allObjects];
  objc_msgSend(v29, "cls_removeCachedResourceValueForKeys:", v6);

  unsigned __int8 v7 = [v4 allObjects];
  id v36 = 0;
  id v8 = [v29 resourceValuesForKeys:v7 error:&v36];
  id v9 = v36;

  CLSInitLog();
  id v10 = CLSLogAsset;
  if (os_log_type_enabled(CLSLogAsset, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v38 = (uint64_t)v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "presentedItemDidChangeUbiquityAttributes, resourceValues: %@", buf, 0xCu);
  }
  if (!v9)
  {
    id v28 = v4;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id obj = [v8 keyEnumerator];
    id v11 = [obj countByEnumeratingWithState:&v32 objects:v41 count:16];
    if (!v11) {
      goto LABEL_27;
    }
    id v12 = v11;
    uint64_t v13 = *(void *)v33;
    while (1)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v33 != v13) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        if ([v15 isEqualToString:NSURLUbiquitousItemIsUploadedKey])
        {
          id v16 = [v8 objectForKeyedSubscript:NSURLUbiquitousItemIsUploadedKey];
          unsigned int v17 = [v16 BOOLValue];
          CLSInitLog();
          double v18 = (void *)CLSLogAsset;
          if (os_log_type_enabled(CLSLogAsset, OS_LOG_TYPE_DEFAULT))
          {
            id v19 = v18;
            uint64_t v20 = [v29 path];
            objc_super v21 = (void *)v20;
            *(_DWORD *)buf = 138412546;
            id v22 = "not ";
            if (v17) {
              id v22 = "";
            }
            uint64_t v38 = v20;
            __int16 v39 = 2080;
            unsigned int v40 = v22;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "File at path '%@' has %suploaded", buf, 0x16u);
          }
          if (!v17) {
            goto LABEL_24;
          }
          [(PDFileSyncAgent *)v30 removeFromFilePresenter];
          uint64_t v23 = v30;
          uint64_t v24 = 3;
          goto LABEL_23;
        }
        if (![v15 isEqualToString:NSURLUbiquitousItemUploadingErrorKey]) {
          continue;
        }
        id v16 = [v8 objectForKeyedSubscript:NSURLUbiquitousItemUploadingErrorKey];
        if (v16)
        {
          objc_storeStrong((id *)&v30->_uploadError, v16);
          CLSInitLog();
          id v25 = (void *)CLSLogAsset;
          if (os_log_type_enabled(CLSLogAsset, OS_LOG_TYPE_ERROR))
          {
            id v26 = v25;
            id v27 = [v29 path];
            *(_DWORD *)buf = 138412546;
            uint64_t v38 = (uint64_t)v27;
            __int16 v39 = 2112;
            unsigned int v40 = 0;
            _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "iCloud reported an error when uploading asset at '%@', error: %@", buf, 0x16u);
          }
          uint64_t v23 = v30;
          uint64_t v24 = 2;
LABEL_23:
          [(PDFileSyncAgent *)v23 uploadStateChanged:v24];
        }
LABEL_24:
      }
      id v12 = [obj countByEnumeratingWithState:&v32 objects:v41 count:16];
      if (!v12)
      {
LABEL_27:

        id v9 = 0;
        id v4 = v28;
        break;
      }
    }
  }
}

- (BOOL)updateAssetIfExists:(id)a3
{
  id v4 = a3;
  database = self->_database;
  uint64_t v6 = objc_opt_class();
  unsigned __int8 v7 = [v4 objectID];
  LODWORD(database) = [(PDDatabase *)database entityExistsByClass:v6 identity:v7];

  if (database)
  {
    BOOL v8 = [(PDDatabase *)self->_database updateObject:v4];
  }
  else
  {
    CLSInitLog();
    id v9 = CLSLogAsset;
    BOOL v8 = 1;
    if (os_log_type_enabled(CLSLogAsset, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "unable to update asset in the database -- asset not found", v11, 2u);
    }
  }

  return v8;
}

- (BOOL)cacheAssetURLFromCKRecord:(id)a3 usingAsset:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = [a3 objectForKeyedSubscript:@"asset"];
  id v10 = v9;
  if (v9)
  {
    id v11 = [v9 fileURL];
    id v12 = [v8 filenameExtension];
    uint64_t v13 = [v11 URLByAppendingPathExtension:v12];
    __int16 v14 = +[NSFileManager defaultManager];
    id v30 = 0;
    unsigned __int8 v15 = [v14 moveItemAtURL:v11 toURL:v13 error:&v30];
    id v29 = v30;

    if (v15)
    {
      id v16 = v13;

      id v11 = v16;
    }
    else
    {
      CLSInitLog();
      id v19 = CLSLogAsset;
      if (os_log_type_enabled(CLSLogAsset, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        long long v32 = v11;
        __int16 v33 = 2112;
        long long v34 = v13;
        __int16 v35 = 2112;
        id v36 = v29;
        _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "cacheThumbnailAssetURLFromCKRecord unable to rename thumbnail file from: '%@' to: '%@', error: %@", buf, 0x20u);
      }
    }
    uint64_t v20 = [v8 URL];
    [v8 setURL:v11];
    objc_super v21 = [(PDFileSyncAgent *)self moveDownloadedAssetFileToContentStoreCacheForAsset:v8];
    if (v21)
    {
      CLSInitLog();
      id v22 = (void *)CLSLogAsset;
      if (os_log_type_enabled(CLSLogAsset, OS_LOG_TYPE_ERROR))
      {
        id v27 = v22;
        id v28 = [v8 objectID];
        *(_DWORD *)buf = 138412546;
        long long v32 = v28;
        __int16 v33 = 2112;
        long long v34 = v21;
        _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "cacheAssetURLFromCKRecord unable to move file to cache location for CLSAsset.objectID: '%@', error: %@", buf, 0x16u);
      }
      [v8 setURL:v20];
      id v23 = v21;
      if (a5)
      {
        BOOL v18 = 0;
        *a5 = v23;
LABEL_19:

        goto LABEL_20;
      }
    }
    else
    {
      if ([(PDFileSyncAgent *)self updateAssetIfExists:v8])
      {
        BOOL v18 = 1;
        goto LABEL_19;
      }
      uint64_t v24 = [v8 objectID];
      id v25 = +[NSError cls_createErrorWithCode:342, @"unable to update URL of an asset with objectID: %@", v24 format];
      if (a5) {
        *a5 = v25;
      }
    }
    BOOL v18 = 0;
    goto LABEL_19;
  }
  id v17 = +[NSError cls_createErrorWithCode:342 format:@"asset record not found"];
  BOOL v18 = 0;
  if (a5) {
    *a5 = v17;
  }
LABEL_20:

  return v18;
}

- (BOOL)cacheThumbnailAssetURLFromCKRecord:(id)a3 usingAsset:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if (!a5)
  {
    uint64_t v29 = 0;
    a5 = (id *)&v29;
  }
  id v9 = [a3 objectForKeyedSubscript:@"assetThumbnail"];
  id v10 = v9;
  if (v9)
  {
    id v11 = [v9 fileURL];
    id v12 = [v11 pathExtension];
    unsigned __int8 v13 = [v12 isEqualToString:@"jpeg"];

    if ((v13 & 1) == 0)
    {
      __int16 v14 = [v11 URLByAppendingPathExtension:@"jpeg"];
      unsigned __int8 v15 = +[NSFileManager defaultManager];
      id v28 = 0;
      unsigned __int8 v16 = [v15 moveItemAtURL:v11 toURL:v14 error:&v28];
      id v17 = v28;

      if (v16)
      {
        id v18 = v14;

        id v11 = v18;
      }
      else
      {
        CLSInitLog();
        uint64_t v20 = CLSLogAsset;
        if (os_log_type_enabled(CLSLogAsset, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          uint64_t v31 = v11;
          __int16 v32 = 2112;
          __int16 v33 = v14;
          __int16 v34 = 2112;
          id v35 = v17;
          _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "cacheThumbnailAssetURLFromCKRecord unable to rename thumbnail file from: '%@' to: '%@', error: %@", buf, 0x20u);
        }
      }
    }
    objc_super v21 = [v8 thumbnailURL];
    [v8 setThumbnailURL:v11];
    id v22 = [(PDFileSyncAgent *)self moveDownloadedAssetThumbnailFileToContentStoreCacheForAsset:v8];
    if (v22)
    {
      CLSInitLog();
      id v23 = (void *)CLSLogAsset;
      if (os_log_type_enabled(CLSLogAsset, OS_LOG_TYPE_ERROR))
      {
        id v26 = v23;
        id v27 = [v8 objectID];
        *(_DWORD *)buf = 138412546;
        uint64_t v31 = v27;
        __int16 v32 = 2112;
        __int16 v33 = v22;
        _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "cacheThumbnailAssetURLFromCKRecord unable to move thumbnail file to cache location for CLSAsset.objectID: '%@', error: %@", buf, 0x16u);
      }
      [v8 setThumbnailURL:v21];
      BOOL v19 = 0;
      *a5 = v22;
    }
    else if ([(PDFileSyncAgent *)self updateAssetIfExists:v8])
    {
      BOOL v19 = 1;
    }
    else
    {
      uint64_t v24 = [v8 objectID];
      *a5 = +[NSError cls_createErrorWithCode:342, @"unable to update thumbnailURL of an asset with objectID: %@", v24 format];

      BOOL v19 = 0;
    }
  }
  else
  {
    +[NSError cls_createErrorWithCode:342 format:@"thumbnailAsset record not found"];
    BOOL v19 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

- (void)downloadCloudKitPrimaryFileWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  uint64_t v50 = 0;
  id v51 = &v50;
  uint64_t v52 = 0x3032000000;
  uint64_t v53 = sub_10000B7A4;
  BOOL v54 = sub_10000B5EC;
  id v55 = 0;
  objc_opt_class();
  objc_opt_isKindOfClass();
  database = self->_database;
  uint64_t v6 = objc_opt_class();
  unsigned __int8 v7 = [(CLSAbstractAsset *)self->_asset objectID];
  uint64_t v8 = [(PDDatabase *)database select:v6 identity:v7];
  id v9 = (void *)v51[5];
  v51[5] = v8;

  if (v51[5])
  {
    id v10 = sub_1000062FC();
    id v49 = 0;
    id v11 = sub_1000D1688((uint64_t)PDFileManager, v10, &v49);
    id v12 = (PDFileSyncAgent *)v49;
    if (v11)
    {
      unsigned __int8 v13 = [(id)v51[5] brItemID];
      BOOL v14 = v13 == 0;

      if (v14)
      {
        id v23 = [(id)v51[5] objectID];
        uint64_t v24 = +[NSError cls_createErrorWithCode:2, @"Cannot prefetch primary file for asset '%@', its brItemID is nil!", v23 format];

        [(PDFileSyncAgent *)v24 cls_log:CLSLogAsset];
        [(PDFileSyncAgent *)self queued_notifyDownloadCompleted:0 error:v24];
        v4[2](v4, 0, v24);
        id v12 = v24;
      }
      else
      {
        unsigned int v40 = [(id)v51[5] filenameForCKContentStoreCache];
        objc_msgSend(v11, "URLByAppendingPathComponent:isDirectory:");
        BOOL v41 = (PDFileSyncAgent *)objc_claimAutoreleasedReturnValue();
        unsigned __int8 v15 = +[NSFileManager defaultManager];
        unsigned __int8 v16 = [(PDFileSyncAgent *)v41 path];
        unsigned int v17 = [v15 fileExistsAtPath:v16];

        if (v17)
        {
          id v18 = [(id)v51[5] URL];
          unsigned __int8 v19 = [v18 isEqual:v41];

          if ((v19 & 1) == 0)
          {
            [(id)v51[5] setURL:v41];
            if (![(PDFileSyncAgent *)self updateAssetIfExists:v51[5]])
            {
              CLSInitLog();
              uint64_t v20 = CLSLogAsset;
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                __int16 v32 = [(id)v51[5] objectID];
                *(_DWORD *)buf = 138412290;
                uint64_t v59 = v32;
                _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "unable to update URL of an asset '%@'", buf, 0xCu);
              }
            }
          }
          CLSInitLog();
          objc_super v21 = CLSLogAsset;
          if (os_log_type_enabled(CLSLogAsset, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v59 = v41;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "downloadCloudKitPrimaryFileWithCompletion returning URL from cache: '%@'", buf, 0xCu);
          }
          [(PDFileSyncAgent *)self queued_notifyDownloadCompleted:1 error:0];
          ((void (**)(id, PDFileSyncAgent *, void *))v4)[2](v4, v41, 0);
        }
        else
        {
          objc_initWeak(&location, self);
          id v25 = self->_database;
          id v26 = [(id)v51[5] objectID];
          unsigned __int8 v35 = sub_100153674((BOOL)v25, v26);

          uint64_t v38 = sub_1000670BC(self->_database);
          CLSInitLog();
          id v27 = CLSLogAsset;
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            id v28 = [(id)v51[5] objectID];
            *(_DWORD *)buf = 134218242;
            uint64_t v59 = self;
            __int16 v60 = 2112;
            v61 = v28;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "agent <%p> downloadCloudKitPrimaryFileWithCompletion calling fetchRecordsForDownloadingWithZoneName for asset '%@'", buf, 0x16u);
          }
          assetDownloadOperations = self->_assetDownloadOperations;
          id v37 = [(id)v51[5] brZoneName];
          id v36 = [(id)v51[5] brOwnerName];
          __int16 v39 = [(id)v51[5] parentObjectID];
          id v33 = [(id)v51[5] parentEntityType];
          uint64_t v29 = [(id)v51[5] brItemID];
          v57 = v29;
          id v30 = +[NSArray arrayWithObjects:&v57 count:1];
          CFStringRef v56 = @"asset";
          uint64_t v31 = +[NSArray arrayWithObjects:&v56 count:1];
          v46[0] = _NSConcreteStackBlock;
          v46[1] = 3221225472;
          v46[2] = sub_100122BBC;
          v46[3] = &unk_1001F57B0;
          objc_copyWeak(&v47, &location);
          v42[0] = _NSConcreteStackBlock;
          v42[1] = 3221225472;
          v42[2] = sub_100122DD0;
          void v42[3] = &unk_1001F5818;
          objc_copyWeak(&v45, &location);
          unsigned int v44 = &v50;
          unsigned __int8 v43 = v4;
          sub_100115964(assetDownloadOperations, v37, v36, v39, (uint64_t)v33, v38, v30, v31, v35, v46, &stru_1001F57F0, v42);

          objc_destroyWeak(&v45);
          objc_destroyWeak(&v47);

          objc_destroyWeak(&location);
        }
      }
    }
    else
    {
      CLSInitLog();
      id v22 = CLSLogAsset;
      if (os_log_type_enabled(CLSLogAsset, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v59 = v12;
        _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "downloadCloudKitPrimaryFileWithCompletion exiting with error: '%{public}@'", buf, 0xCu);
      }
      [(PDFileSyncAgent *)self queued_notifyDownloadCompleted:0 error:v12];
      v4[2](v4, 0, v12);
    }
  }
  else
  {
    id v12 = +[NSError cls_createErrorWithCode:2 format:@"Cannot download primary file for nil asset."];
    [(PDFileSyncAgent *)v12 cls_log:CLSLogAsset];
    [(PDFileSyncAgent *)self queued_notifyDownloadCompleted:0 error:v12];
    v4[2](v4, 0, v12);
  }

  _Block_object_dispose(&v50, 8);
}

- (void)downloadCloudKitThumbnailWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *, void))a3;
  uint64_t v50 = 0;
  id v51 = &v50;
  uint64_t v52 = 0x3032000000;
  uint64_t v53 = sub_10000B7A4;
  BOOL v54 = sub_10000B5EC;
  id v55 = 0;
  objc_opt_class();
  objc_opt_isKindOfClass();
  database = self->_database;
  uint64_t v6 = objc_opt_class();
  unsigned __int8 v7 = [(CLSAbstractAsset *)self->_asset objectID];
  uint64_t v8 = [(PDDatabase *)database select:v6 identity:v7];
  id v9 = (void *)v51[5];
  v51[5] = v8;

  if (v51[5])
  {
    id v10 = sub_1000062FC();
    id v49 = 0;
    id v11 = sub_1000D1688((uint64_t)PDFileManager, v10, &v49);
    id v12 = (PDFileSyncAgent *)v49;
    if (v11)
    {
      [(id)v51[5] thumbnailFilenameForCKContentStoreCache];
      v43 = uint64_t v42 = v10;
      unsigned __int8 v13 = [v11 URLByAppendingPathComponent:v43 isDirectory:0];
      BOOL v14 = +[NSFileManager defaultManager];
      unsigned __int8 v15 = [(PDFileSyncAgent *)v13 path];
      unsigned int v16 = [v14 fileExistsAtPath:v15];

      unsigned int v17 = (void *)v51[5];
      if (v16)
      {
        id v18 = [v17 thumbnailURL];
        unsigned __int8 v19 = [v18 isEqual:v13];

        if ((v19 & 1) == 0)
        {
          [(id)v51[5] setThumbnailURL:v13];
          if (![(PDFileSyncAgent *)self updateAssetIfExists:v51[5]])
          {
            CLSInitLog();
            uint64_t v20 = CLSLogAsset;
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              unsigned __int8 v35 = [(id)v51[5] objectID];
              *(_DWORD *)buf = 138412290;
              uint64_t v59 = v35;
              _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "unable to update thumbnailURL of an asset '%@'", buf, 0xCu);
            }
          }
        }
        CLSInitLog();
        objc_super v21 = CLSLogAsset;
        if (os_log_type_enabled(CLSLogAsset, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v59 = v13;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "downloadCloudKitThumbnailWithCompletion returning thumbFileURL from cache: '%@'", buf, 0xCu);
        }
        [(PDFileSyncAgent *)self queued_notifyDownloadCompleted:1 error:0];
        v4[2](v4, v13, 0);
      }
      else
      {
        id v23 = [v17 brItemID];
        BOOL v24 = v23 == 0;

        if (v24)
        {
          id v33 = [(id)v51[5] objectID];
          __int16 v34 = +[NSError cls_createErrorWithCode:2, @"Cannot download thumbnail file for asset '%@', its brItemID is nil!", v33 format];

          [(PDFileSyncAgent *)v34 cls_log:CLSLogAsset];
          [(PDFileSyncAgent *)self queued_notifyDownloadCompleted:0 error:v34];
          ((void (**)(id, void *, PDFileSyncAgent *))v4)[2](v4, 0, v34);
          id v12 = v34;
        }
        else
        {
          objc_initWeak(&location, self);
          id v25 = self->_database;
          id v26 = [(id)v51[5] objectID];
          unsigned __int8 v38 = sub_100153674((BOOL)v25, v26);

          BOOL v41 = sub_1000670BC(self->_database);
          CLSInitLog();
          id v27 = CLSLogAsset;
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            id v28 = [(id)v51[5] objectID];
            *(_DWORD *)buf = 134218242;
            uint64_t v59 = self;
            __int16 v60 = 2112;
            v61 = v28;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "agent <%p> downloadCloudKitThumbnailWithCompletion calling fetchRecordsForDownloadingWithZoneName for asset '%@'", buf, 0x16u);
          }
          assetDownloadOperations = self->_assetDownloadOperations;
          unsigned int v40 = [(id)v51[5] brZoneName];
          __int16 v39 = [(id)v51[5] brOwnerName];
          uint64_t v29 = [(id)v51[5] parentObjectID];
          id v36 = [(id)v51[5] parentEntityType];
          id v30 = [(id)v51[5] brItemID];
          v57 = v30;
          uint64_t v31 = +[NSArray arrayWithObjects:&v57 count:1];
          CFStringRef v56 = @"assetThumbnail";
          __int16 v32 = +[NSArray arrayWithObjects:&v56 count:1];
          v44[0] = _NSConcreteStackBlock;
          v44[1] = 3221225472;
          v44[2] = sub_100123998;
          void v44[3] = &unk_1001F5818;
          objc_copyWeak(&v47, &location);
          uint64_t v46 = &v50;
          id v45 = v4;
          sub_100115964(assetDownloadOperations, v40, v39, v29, (uint64_t)v36, v41, v31, v32, v38, &stru_1001F5858, &stru_1001F5878, v44);

          objc_destroyWeak(&v47);
          objc_destroyWeak(&location);
        }
      }

      id v10 = v42;
    }
    else
    {
      CLSInitLog();
      id v22 = CLSLogAsset;
      if (os_log_type_enabled(CLSLogAsset, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v59 = v12;
        _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "downloadCloudKitThumbnailWithCompletion exiting with error: '%{public}@'", buf, 0xCu);
      }
      [(PDFileSyncAgent *)self queued_notifyDownloadCompleted:0 error:v12];
      ((void (**)(id, void *, PDFileSyncAgent *))v4)[2](v4, 0, v12);
    }
  }
  else
  {
    id v12 = +[NSError cls_createErrorWithCode:2 format:@"Cannot download thumbnail file for nil asset."];
    [(PDFileSyncAgent *)v12 cls_log:CLSLogAsset];
    [(PDFileSyncAgent *)self queued_notifyDownloadCompleted:0 error:v12];
    ((void (**)(id, void *, PDFileSyncAgent *))v4)[2](v4, 0, v12);
  }

  _Block_object_dispose(&v50, 8);
}

- (void)fetchCloudKitStreamingURLWithCompletion:(id)a3
{
  id v27 = a3;
  uint64_t v34 = 0;
  unsigned __int8 v35 = &v34;
  uint64_t v36 = 0x3032000000;
  id v37 = sub_10000B7A4;
  unsigned __int8 v38 = sub_10000B5EC;
  id v39 = 0;
  objc_opt_class();
  objc_opt_isKindOfClass();
  database = self->_database;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [(CLSAbstractAsset *)self->_asset objectID];
  uint64_t v7 = [(PDDatabase *)database select:v5 identity:v6];
  uint64_t v8 = (void *)v35[5];
  v35[5] = v7;

  id v9 = (void *)v35[5];
  if (v9)
  {
    id v10 = [v9 originalFilename];
    BOOL v11 = v10 == 0;

    if (v11)
    {
      id v22 = +[NSError cls_createErrorWithCode:2 format:@"Asset must have originalFilename to fetch a valid streaming URL."];
      objc_msgSend(v22, "cls_log:", CLSLogAsset);
      [(PDFileSyncAgent *)self queued_notifyDownloadCompleted:0 error:v22];
      (*((void (**)(id, void, void, void *))v27 + 2))(v27, 0, 0, v22);
    }
    else
    {
      CLSInitLog();
      id v12 = CLSLogAsset;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        unsigned __int8 v13 = [(id)v35[5] objectID];
        *(_DWORD *)buf = 134218242;
        unsigned __int8 v43 = self;
        __int16 v44 = 2112;
        id v45 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "agent <%p> fetchCloudKitStreamingURLWithCompletion calling fetchRecordsForStreamingWithZoneName for asset '%@'", buf, 0x16u);
      }
      objc_initWeak((id *)buf, self);
      BOOL v14 = self->_database;
      unsigned __int8 v15 = [(id)v35[5] objectID];
      unsigned __int8 v24 = sub_100153674((BOOL)v14, v15);

      id v25 = sub_1000670BC(self->_database);
      assetDownloadOperations = self->_assetDownloadOperations;
      id v26 = [(id)v35[5] brZoneName];
      unsigned int v16 = [(id)v35[5] brOwnerName];
      unsigned int v17 = [(id)v35[5] parentObjectID];
      id v18 = [(id)v35[5] parentEntityType];
      unsigned __int8 v19 = [(id)v35[5] brItemID];
      BOOL v41 = v19;
      uint64_t v20 = +[NSArray arrayWithObjects:&v41 count:1];
      CFStringRef v40 = @"asset";
      objc_super v21 = +[NSArray arrayWithObjects:&v40 count:1];
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_100124164;
      v32[3] = &unk_1001F57B0;
      objc_copyWeak(&v33, (id *)buf);
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_100124378;
      v28[3] = &unk_1001F58C0;
      objc_copyWeak(&v31, (id *)buf);
      id v30 = &v34;
      v28[4] = self;
      id v29 = v27;
      sub_100115C1C(assetDownloadOperations, v26, v16, v17, (uint64_t)v18, v25, v20, v21, v24, v32, &stru_1001F5898, v28);

      objc_destroyWeak(&v31);
      objc_destroyWeak(&v33);

      objc_destroyWeak((id *)buf);
      id v22 = 0;
    }
  }
  else
  {
    id v22 = +[NSError cls_createErrorWithCode:2 format:@"Cannot get streaming URL for nil asset."];
    objc_msgSend(v22, "cls_log:", CLSLogAsset);
    [(PDFileSyncAgent *)self queued_notifyDownloadCompleted:0 error:v22];
    (*((void (**)(id, void, void, void *))v27 + 2))(v27, 0, 0, v22);
  }

  _Block_object_dispose(&v34, 8);
}

- (CLSAbstractAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetDownloadOperations, 0);
  objc_storeStrong((id *)&self->_lastDBUpdate, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_assetsOperation, 0);
  objc_storeStrong((id *)&self->_downloadObservers, 0);
  objc_storeStrong((id *)&self->_uploadObservers, 0);
  objc_storeStrong((id *)&self->_sharingError, 0);
  objc_storeStrong((id *)&self->_uploadError, 0);
  objc_storeStrong((id *)&self->_uploadProgress, 0);
  objc_storeStrong(&self->_driveUploadProgressSubscriber, 0);

  objc_storeStrong((id *)&self->_asset, 0);
}

@end
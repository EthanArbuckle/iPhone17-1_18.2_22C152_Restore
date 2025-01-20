@interface VCPFaceProcessingBatchContext
+ (id)batchContextWithPhotoLibrary:(id)a3 clusterer:(id)a4 andContext:(id)a5;
- (BOOL)downloadTimedout;
- (BOOL)hasPanorama;
- (NSDate)lastestDownloadTimestamp;
- (NSMutableDictionary)downloadRequests;
- (NSMutableDictionary)processingStatusMap;
- (NSMutableSet)completedLocalIdentifiersFromComputeSync;
- (NSMutableSet)processedAssets;
- (NSMutableSet)unprocessedAssets;
- (VCPFaceProcessingBatchContext)initWithPhotoLibrary:(id)a3 clusterer:(id)a4 andContext:(id)a5;
- (VCPFaceProcessingChangeBatch)changeBatch;
- (id)resourceForLocalIdentifier:(id)a3;
- (void)setChangeBatch:(id)a3;
- (void)setCompletedLocalIdentifiersFromComputeSync:(id)a3;
- (void)setDownloadRequests:(id)a3;
- (void)setHasPanorama:(BOOL)a3;
- (void)setLastestDownloadTimestamp:(id)a3;
- (void)setProcessedAssets:(id)a3;
- (void)setProcessingStatusMap:(id)a3;
- (void)setUnprocessedAssets:(id)a3;
- (void)storeResource:(id)a3 resourceURL:(id)a4 isBestResource:(BOOL)a5 requestDownload:(BOOL)a6 downloadStatus:(int)a7 forLocalIdentifier:(id)a8;
- (void)updateLastestDownloadTimestamp;
@end

@implementation VCPFaceProcessingBatchContext

- (VCPFaceProcessingBatchContext)initWithPhotoLibrary:(id)a3 clusterer:(id)a4 andContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v30.receiver = self;
  v30.super_class = (Class)VCPFaceProcessingBatchContext;
  v11 = [(VCPFaceProcessingBatchContext *)&v30 init];
  if (v11)
  {
    uint64_t v12 = +[NSMutableSet set];
    processedAssets = v11->_processedAssets;
    v11->_processedAssets = (NSMutableSet *)v12;

    uint64_t v14 = +[NSMutableSet set];
    unprocessedAssets = v11->_unprocessedAssets;
    v11->_unprocessedAssets = (NSMutableSet *)v14;

    uint64_t v16 = +[NSMutableSet set];
    completedLocalIdentifiersFromComputeSync = v11->_completedLocalIdentifiersFromComputeSync;
    v11->_completedLocalIdentifiersFromComputeSync = (NSMutableSet *)v16;

    uint64_t v18 = +[NSMutableDictionary dictionary];
    downloadRequests = v11->_downloadRequests;
    v11->_downloadRequests = (NSMutableDictionary *)v18;

    uint64_t v20 = +[NSMutableDictionary dictionary];
    resources = v11->_resources;
    v11->_resources = (NSMutableDictionary *)v20;

    uint64_t v22 = +[NSMutableDictionary dictionary];
    processingStatusMap = v11->_processingStatusMap;
    v11->_processingStatusMap = (NSMutableDictionary *)v22;

    uint64_t v24 = +[VCPFaceProcessingChangeBatch batchForPhotoLibrary:v8 faceClusterer:v9 andContext:v10];
    changeBatch = v11->_changeBatch;
    v11->_changeBatch = (VCPFaceProcessingChangeBatch *)v24;

    v26 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v27 = dispatch_queue_create("com.apple.mediaanalysis.batchContextManagementQueue", v26);
    managementQueue = v11->_managementQueue;
    v11->_managementQueue = (OS_dispatch_queue *)v27;

    v11->_timeout = 0;
  }

  return v11;
}

+ (id)batchContextWithPhotoLibrary:(id)a3 clusterer:(id)a4 andContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [[VCPFaceProcessingBatchContext alloc] initWithPhotoLibrary:v7 clusterer:v8 andContext:v9];

  return v10;
}

- (id)resourceForLocalIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_1000C0C94;
  uint64_t v16 = sub_1000C0CA4;
  id v17 = 0;
  managementQueue = self->_managementQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C0CAC;
  block[3] = &unk_10021C020;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(managementQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)storeResource:(id)a3 resourceURL:(id)a4 isBestResource:(BOOL)a5 requestDownload:(BOOL)a6 downloadStatus:(int)a7 forLocalIdentifier:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  id v17 = v16;
  if (v16)
  {
    managementQueue = self->_managementQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000C0ED4;
    block[3] = &unk_10021CB58;
    block[4] = self;
    id v22 = v16;
    id v23 = v14;
    id v24 = v15;
    BOOL v26 = a5;
    BOOL v27 = a6;
    int v25 = a7;
    dispatch_sync(managementQueue, block);
  }
  else if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v19 = VCPLogInstance();
    os_log_type_t v20 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v19, v20))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v29 = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "[VCPFaceProcessingBatchContext] Nil asset localIdentifier %@", buf, 0xCu);
    }
  }
}

- (void)updateLastestDownloadTimestamp
{
  managementQueue = self->_managementQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C0FCC;
  block[3] = &unk_100219FC8;
  block[4] = self;
  dispatch_sync(managementQueue, block);
}

- (BOOL)downloadTimedout
{
  managementQueue = self->_managementQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C1138;
  block[3] = &unk_100219FC8;
  block[4] = self;
  dispatch_sync(managementQueue, block);
  return self->_timeout;
}

- (NSMutableSet)processedAssets
{
  return self->_processedAssets;
}

- (void)setProcessedAssets:(id)a3
{
}

- (NSMutableSet)unprocessedAssets
{
  return self->_unprocessedAssets;
}

- (void)setUnprocessedAssets:(id)a3
{
}

- (NSMutableSet)completedLocalIdentifiersFromComputeSync
{
  return self->_completedLocalIdentifiersFromComputeSync;
}

- (void)setCompletedLocalIdentifiersFromComputeSync:(id)a3
{
}

- (NSMutableDictionary)downloadRequests
{
  return self->_downloadRequests;
}

- (void)setDownloadRequests:(id)a3
{
}

- (NSMutableDictionary)processingStatusMap
{
  return self->_processingStatusMap;
}

- (void)setProcessingStatusMap:(id)a3
{
}

- (VCPFaceProcessingChangeBatch)changeBatch
{
  return self->_changeBatch;
}

- (void)setChangeBatch:(id)a3
{
}

- (BOOL)hasPanorama
{
  return self->_hasPanorama;
}

- (void)setHasPanorama:(BOOL)a3
{
  self->_hasPanorama = a3;
}

- (NSDate)lastestDownloadTimestamp
{
  return self->_lastestDownloadTimestamp;
}

- (void)setLastestDownloadTimestamp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastestDownloadTimestamp, 0);
  objc_storeStrong((id *)&self->_changeBatch, 0);
  objc_storeStrong((id *)&self->_processingStatusMap, 0);
  objc_storeStrong((id *)&self->_downloadRequests, 0);
  objc_storeStrong((id *)&self->_completedLocalIdentifiersFromComputeSync, 0);
  objc_storeStrong((id *)&self->_unprocessedAssets, 0);
  objc_storeStrong((id *)&self->_processedAssets, 0);
  objc_storeStrong((id *)&self->_managementQueue, 0);
  objc_storeStrong((id *)&self->_resources, 0);
}

@end
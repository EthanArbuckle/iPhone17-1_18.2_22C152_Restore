@interface MADPhotosFaceAssetProcessingTask
+ (BOOL)_concurrentFaceAnalysis;
+ (id)taskWithAnalysisDatabase:(id)a3 andFaceClusterer:(id)a4;
+ (id)taskWithAnalysisDatabase:(id)a3 andGallery:(id)a4;
+ (unint64_t)_concurrentQueueCount;
- (MADPhotosFaceAssetProcessingTask)initWithAnalysisDatabase:(id)a3 andFaceCluster:(id)a4;
- (MADPhotosFaceAssetProcessingTask)initWithAnalysisDatabase:(id)a3 andGallery:(id)a4;
- (double)downloadInactiveTimeInterval;
- (id)assetLocalIdentifiers;
- (int)_prepare;
- (int)_process;
- (int)_publish;
- (int)removeDownloadRequestIDForAsset:(id)a3;
- (int)status;
- (unint64_t)count;
- (void)_asyncAnalysisWithAssetEntry:(id)a3 resource:(id)a4 resourceURL:(id)a5 isBestResource:(BOOL)a6;
- (void)_collectVNAnimalObservationResults:(id)a3;
- (void)_dispatchAssetEntries;
- (void)_publishEntry:(id)a3 faceLocalIdentifiers:(id *)a4;
- (void)addDownloadRequestID:(int)a3 forAsset:(id)a4;
- (void)addPhotosAsset:(id)a3 priority:(unint64_t)a4 previousStatus:(unint64_t)a5 attempts:(unint64_t)a6 lastAttemptDate:(id)a7;
- (void)cancelRemainingDownloadsWithStatus:(int)a3;
- (void)dealloc;
- (void)download;
- (void)prepare;
- (void)process;
- (void)processDeletedAssets:(id)a3;
- (void)publish;
@end

@implementation MADPhotosFaceAssetProcessingTask

+ (BOOL)_concurrentFaceAnalysis
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_100252620, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_100252620))
  {
    byte_100252618 = DeviceHasANE();
    __cxa_guard_release(&qword_100252620);
  }
  return byte_100252618;
}

+ (unint64_t)_concurrentQueueCount
{
  v2 = &OBJC_PROTOCOL___MADEmbeddingStoreServerProtocol;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_100252630, memory_order_acquire) & 1) == 0)
  {
    int v4 = __cxa_guard_acquire(&qword_100252630);
    v2 = &OBJC_PROTOCOL___MADEmbeddingStoreServerProtocol;
    if (v4)
    {
      byte_100252628 = 1;
      __cxa_guard_release(&qword_100252630);
      v2 = &OBJC_PROTOCOL___MADEmbeddingStoreServerProtocol;
    }
  }
  if (LOBYTE(v2[21].cb)) {
    return 4;
  }
  else {
    return 0;
  }
}

- (MADPhotosFaceAssetProcessingTask)initWithAnalysisDatabase:(id)a3 andFaceCluster:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 photoLibrary];
  unsigned int v10 = objc_msgSend(v9, "mad_useVUGallery");

  if (v10)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v11 = VCPLogInstance();
      os_log_type_t v12 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v11, v12))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, v12, "[MADPhotosFaceAssetProcessingTask] VCPFaceClusterer is disabled", buf, 2u);
      }
    }
    v13 = 0;
  }
  else
  {
    v33.receiver = self;
    v33.super_class = (Class)MADPhotosFaceAssetProcessingTask;
    v14 = [(MADProcessingTask *)&v33 init];
    v15 = v14;
    v16 = v14;
    if (v14)
    {
      objc_storeStrong((id *)&v14->_analysisDatabase, a3);
      uint64_t v17 = +[NSMutableArray array];
      assetEntries = v16->_assetEntries;
      v16->_assetEntries = (NSMutableArray *)v17;

      objc_storeStrong((id *)&v15->_faceClusterer, a4);
      dispatch_group_t v19 = dispatch_group_create();
      processGroup = v16->_processGroup;
      v16->_processGroup = (OS_dispatch_group *)v19;

      v21 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v22 = dispatch_queue_create("com.apple.mediaanalysisd.face.management", v21);
      managementQueue = v16->_managementQueue;
      v16->_managementQueue = (OS_dispatch_queue *)v22;

      v16->_processingJobCount = 0;
      if ([(id)objc_opt_class() _concurrentFaceAnalysis]) {
        uint64_t v24 = (uint64_t)[(id)objc_opt_class() _concurrentQueueCount];
      }
      else {
        uint64_t v24 = 1;
      }
      v16->_processingQueuesCount = v24;
      dispatch_group_t v25 = dispatch_group_create();
      downloadGroup = v16->_downloadGroup;
      v16->_downloadGroup = (OS_dispatch_group *)v25;

      v27 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v28 = dispatch_queue_create("com.apple.mediaanalysisd.face.download", v27);
      downloadStateQueue = v16->_downloadStateQueue;
      v16->_downloadStateQueue = (OS_dispatch_queue *)v28;

      uint64_t v30 = +[NSMutableDictionary dictionary];
      downloadRequestIDs = v16->_downloadRequestIDs;
      v16->_downloadRequestIDs = (NSMutableDictionary *)v30;
    }
    self = v16;
    v13 = self;
  }

  return v13;
}

- (MADPhotosFaceAssetProcessingTask)initWithAnalysisDatabase:(id)a3 andGallery:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 photoLibrary];
  unsigned __int8 v10 = objc_msgSend(v9, "mad_useVUGallery");

  if (v10)
  {
    v33.receiver = self;
    v33.super_class = (Class)MADPhotosFaceAssetProcessingTask;
    v11 = [(MADProcessingTask *)&v33 init];
    os_log_type_t v12 = v11;
    v13 = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_analysisDatabase, a3);
      objc_storeStrong((id *)&v12->_gallery, a4);
      uint64_t v14 = +[NSMutableArray array];
      assetEntries = v13->_assetEntries;
      v13->_assetEntries = (NSMutableArray *)v14;

      dispatch_group_t v16 = dispatch_group_create();
      processGroup = v13->_processGroup;
      v13->_processGroup = (OS_dispatch_group *)v16;

      v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v19 = dispatch_queue_create("com.apple.mediaanalysisd.face.management", v18);
      managementQueue = v13->_managementQueue;
      v13->_managementQueue = (OS_dispatch_queue *)v19;

      v13->_processingJobCount = 0;
      if ([(id)objc_opt_class() _concurrentFaceAnalysis]) {
        uint64_t v21 = (uint64_t)[(id)objc_opt_class() _concurrentQueueCount];
      }
      else {
        uint64_t v21 = 1;
      }
      v13->_processingQueuesCount = v21;
      dispatch_group_t v25 = dispatch_group_create();
      downloadGroup = v13->_downloadGroup;
      v13->_downloadGroup = (OS_dispatch_group *)v25;

      v27 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v28 = dispatch_queue_create("com.apple.mediaanalysisd.face.download", v27);
      downloadStateQueue = v13->_downloadStateQueue;
      v13->_downloadStateQueue = (OS_dispatch_queue *)v28;

      uint64_t v30 = +[NSMutableDictionary dictionary];
      downloadRequestIDs = v13->_downloadRequestIDs;
      v13->_downloadRequestIDs = (NSMutableDictionary *)v30;
    }
    self = v13;
    uint64_t v24 = self;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      dispatch_queue_t v22 = VCPLogInstance();
      os_log_type_t v23 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v22, v23))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, v23, "[MADPhotosFaceAssetProcessingTask] Gallery is not enabled", buf, 2u);
      }
    }
    uint64_t v24 = 0;
  }

  return v24;
}

+ (id)taskWithAnalysisDatabase:(id)a3 andFaceClusterer:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [objc_alloc((Class)objc_opt_class()) initWithAnalysisDatabase:v5 andFaceCluster:v6];

  return v7;
}

+ (id)taskWithAnalysisDatabase:(id)a3 andGallery:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [objc_alloc((Class)objc_opt_class()) initWithAnalysisDatabase:v5 andGallery:v6];

  return v7;
}

- (void)dealloc
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = self->_assetEntries;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v13;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v8 = [v7 downloadURL];
        BOOL v9 = v8 == 0;

        if (!v9)
        {
          unsigned __int8 v10 = [v7 downloadURL];
          +[PHAssetResourceManager vcp_flushResourceURL:v10];
        }
      }
      id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }

  v11.receiver = self;
  v11.super_class = (Class)MADPhotosFaceAssetProcessingTask;
  [(MADPhotosFaceAssetProcessingTask *)&v11 dealloc];
}

- (unint64_t)count
{
  return (unint64_t)[(NSMutableArray *)self->_assetEntries count];
}

- (id)assetLocalIdentifiers
{
  v3 = +[NSMutableSet set];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_assetEntries;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v14;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        unsigned __int8 v10 = objc_msgSend(v8, "asset", (void)v13);
        objc_super v11 = [v10 localIdentifier];
        [v3 addObject:v11];
      }
      id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  return v3;
}

- (int)status
{
  return self->_status;
}

- (void)addPhotosAsset:(id)a3 priority:(unint64_t)a4 previousStatus:(unint64_t)a5 attempts:(unint64_t)a6 lastAttemptDate:(id)a7
{
  id v12 = a3;
  v33.receiver = self;
  v33.super_class = (Class)MADPhotosFaceAssetProcessingTask;
  unint64_t v26 = a5;
  unint64_t v27 = a6;
  id v28 = a7;
  -[MADPhotosAssetProcessingTask addPhotosAsset:priority:previousStatus:attempts:lastAttemptDate:](&v33, "addPhotosAsset:priority:previousStatus:attempts:lastAttemptDate:", v12, a4, a5, a6);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v25 = 64;
  long long v13 = self->_assetEntries;
  id v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v29 objects:v36 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v30;
    while (2)
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * i), "asset", v25);
        v18 = [v17 localIdentifier];
        dispatch_queue_t v19 = [v12 localIdentifier];
        unsigned int v20 = [v18 isEqualToString:v19];

        if (v20)
        {
          if ((int)MediaAnalysisLogLevel() >= 4)
          {
            dispatch_queue_t v22 = VCPLogInstance();
            os_log_type_t v23 = VCPLogToOSLogType[4];
            if (os_log_type_enabled(v22, v23))
            {
              uint64_t v24 = [v12 localIdentifier];
              *(_DWORD *)buf = 138412290;
              v35 = v24;
              _os_log_impl((void *)&_mh_execute_header, v22, v23, "[Face][%@] Batch already contains asset; ignoring",
                buf,
                0xCu);
            }
          }
          goto LABEL_14;
        }
      }
      id v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v29 objects:v36 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }

  uint64_t v21 = *(Class *)((char *)&self->super.super.super.super.super.isa + v25);
  long long v13 = +[MADFaceAssetEntry entryWithAsset:v12 previousStatus:v26 previousAttempts:v27 andLastAttemptDate:v28];
  [v21 addObject:v13];
LABEL_14:
}

- (int)_prepare
{
  id v32 = objc_alloc_init((Class)VCPTimeMeasurement);
  [v32 start];
  id v4 = VCPSignPostLog();
  os_signpost_id_t v5 = os_signpost_id_generate(v4);

  uint64_t v6 = VCPSignPostLog();
  id v7 = v6;
  unint64_t v30 = v5 - 1;
  os_signpost_id_t spid = v5;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "MADPhotosFaceAssetProcessingTask_Prepare", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v8 = VCPLogInstance();
    os_log_type_t v9 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v8, v9))
    {
      unsigned int v10 = [(NSMutableArray *)self->_assetEntries count];
      qos_class_t v11 = qos_class_self();
      v2 = VCPMAQoSDescription(v11);
      *(_DWORD *)buf = 67109378;
      unsigned int v39 = v10;
      __int16 v40 = 2112;
      v41 = v2;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "[Face] Preparing %d assets (QoS: %@)", buf, 0x12u);
    }
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v12 = self->_assetEntries;
  id v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v34;
LABEL_10:
    uint64_t v15 = 0;
    long long v16 = v2;
    while (1)
    {
      if (*(void *)v34 != v14) {
        objc_enumerationMutation(v12);
      }
      uint64_t v17 = *(void **)(*((void *)&v33 + 1) + 8 * (void)v15);
      v18 = [v17 asset];
      unsigned int v19 = objc_msgSend(v18, "vcp_isPano");

      if (v19) {
        self->_processingQueuesCount = 1;
      }
      analysisDatabase = self->_analysisDatabase;
      uint64_t v21 = (char *)[v17 previousAttempts];
      dispatch_queue_t v22 = [v17 asset];
      os_log_type_t v23 = +[NSDate now];
      id v24 = (id)[(VCPDatabaseWriter *)analysisDatabase setAttempts:v21 + 1 asset:v22 taskID:3 status:1 lastAttemptDate:v23];

      if (v24 == -108 || v24 == -36)
      {
        v2 = v24;
      }
      else
      {
        v2 = v24;
        if (v24 != -23) {
          v2 = v16;
        }
      }
      if (v24 == -108 || v24 == -36 || v24 == -23) {
        goto LABEL_37;
      }
      uint64_t v15 = (char *)v15 + 1;
      long long v16 = v2;
      if (v13 == v15)
      {
        id v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v33 objects:v37 count:16];
        if (v13) {
          goto LABEL_10;
        }
        break;
      }
    }
  }

  unsigned int v25 = [(VCPDatabaseWriter *)self->_analysisDatabase commit];
  if (v25 == -108 || v25 == -36)
  {
    int v26 = v25;
  }
  else
  {
    int v26 = v25;
    if (v25 != -23) {
      int v26 = (int)v2;
    }
  }
  if (v25 != -108 && v25 != -36 && v25 != -23)
  {
    unint64_t v27 = VCPSignPostLog();
    id v28 = v27;
    if (v30 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_INTERVAL_END, spid, "MADPhotosFaceAssetProcessingTask_Prepare", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    [v32 stop];
    id v12 = +[VCPMADCoreAnalyticsManager sharedManager];
    [v32 elapsedTimeSeconds];
    -[NSMutableArray accumulateDoubleValue:forField:andEvent:](v12, "accumulateDoubleValue:forField:andEvent:", @"TotalPrepareTimeInSeconds", @"com.apple.mediaanalysisd.FaceAnalysisRunSession");
    LODWORD(v2) = 0;
LABEL_37:

    int v26 = (int)v2;
  }

  return v26;
}

- (void)prepare
{
  self->_status = [(MADPhotosFaceAssetProcessingTask *)self _prepare];
}

- (void)addDownloadRequestID:(int)a3 forAsset:(id)a4
{
  id v6 = a4;
  downloadStateQueue = self->_downloadStateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B0CB4;
  block[3] = &unk_10021BFF8;
  block[4] = self;
  id v10 = v6;
  int v11 = a3;
  id v8 = v6;
  dispatch_sync(downloadStateQueue, block);
}

- (int)removeDownloadRequestIDForAsset:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  downloadStateQueue = self->_downloadStateQueue;
  int v14 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B0E4C;
  block[3] = &unk_10021C020;
  id v9 = v4;
  id v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(downloadStateQueue, block);
  LODWORD(downloadStateQueue) = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  return (int)downloadStateQueue;
}

- (double)downloadInactiveTimeInterval
{
  uint64_t v6 = 0;
  id v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  downloadStateQueue = self->_downloadStateQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000B105C;
  v5[3] = &unk_100219F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(downloadStateQueue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)cancelRemainingDownloadsWithStatus:(int)a3
{
  downloadStateQueue = self->_downloadStateQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000B117C;
  v5[3] = &unk_10021C048;
  v5[4] = self;
  int v6 = a3;
  dispatch_sync(downloadStateQueue, v5);
  dispatch_group_wait((dispatch_group_t)self->_downloadGroup, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)download
{
  id v68 = objc_alloc_init((Class)VCPTimeMeasurement);
  [v68 start];
  v2 = VCPSignPostLog();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  id v4 = VCPSignPostLog();
  os_signpost_id_t v5 = v4;
  os_signpost_id_t spid = v3;
  unint64_t v67 = v3 - 1;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "MADPhotosFaceAssetProcessingTask_Download", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    int v6 = VCPLogInstance();
    os_log_type_t v7 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v6, v7))
    {
      unsigned int v8 = [(NSMutableArray *)self->_assetEntries count];
      qos_class_t v9 = qos_class_self();
      id v10 = VCPMAQoSDescription(v9);
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v88 = v8;
      *(_WORD *)&v88[4] = 2112;
      *(void *)&v88[6] = v10;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "[Face][Download] Downloading %d assets (QoS: %@)", buf, 0x12u);
    }
  }
  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  obj = self->_assetEntries;
  id v11 = [(NSMutableArray *)obj countByEnumeratingWithState:&v81 objects:v86 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v82;
    os_log_type_t v13 = VCPLogToOSLogType[6];
    os_log_type_t type = VCPLogToOSLogType[4];
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v82 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v81 + 1) + 8 * i);
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          long long v16 = VCPLogInstance();
          if (os_log_type_enabled(v16, v13))
          {
            uint64_t v17 = [v15 asset];
            v18 = [v17 localIdentifier];
            *(_DWORD *)buf = 138412290;
            *(void *)v88 = v18;
            _os_log_impl((void *)&_mh_execute_header, v16, v13, "[Face][Download][%@] Finding download resource", buf, 0xCu);
          }
        }
        unsigned int v19 = objc_msgSend(v15, "asset", spid);
        unsigned int v20 = +[VCPFaceUtils preferredResourcesForFaceProcessingWithAsset:v19];

        uint64_t v21 = +[VCPFaceUtils resourceForFaceProcessing:v20 allowStreaming:1];
        [v15 setDownloadResource:v21];

        dispatch_queue_t v22 = [v15 downloadResource];
        BOOL v23 = v22 == 0;

        if (v23)
        {
          if ((int)MediaAnalysisLogLevel() >= 4)
          {
            id v24 = VCPLogInstance();
            if (os_log_type_enabled(v24, type))
            {
              unsigned int v25 = [v15 asset];
              int v26 = [v25 localIdentifier];
              *(_DWORD *)buf = 138412290;
              *(void *)v88 = v26;
              _os_log_impl((void *)&_mh_execute_header, v24, type, "[Face][Download][%@] Failed to find download resource", buf, 0xCu);
            }
          }
          [v15 setStatus:4294943494];
        }
      }
      id v11 = [(NSMutableArray *)obj countByEnumeratingWithState:&v81 objects:v86 count:16];
    }
    while (v11);
  }

  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  v72 = self->_assetEntries;
  id v27 = [(NSMutableArray *)v72 countByEnumeratingWithState:&v77 objects:v85 count:16];
  if (!v27)
  {
    int obja = 0;
    goto LABEL_52;
  }
  int obja = 0;
  uint64_t v28 = *(void *)v78;
  os_log_type_t typea = VCPLogToOSLogType[5];
  os_log_type_t v69 = VCPLogToOSLogType[4];
  do
  {
    for (j = 0; j != v27; j = (char *)j + 1)
    {
      if (*(void *)v78 != v28) {
        objc_enumerationMutation(v72);
      }
      unint64_t v30 = *(void **)(*((void *)&v77 + 1) + 8 * (void)j);
      long long v31 = +[VCPWatchdog sharedWatchdog];
      [v31 pet];

      id v32 = [v30 asset];
      long long v33 = +[PHAssetResource vcp_allResourcesForAsset:v32];
      long long v34 = objc_msgSend(v33, "mad_computeSyncResource");

      if (v34)
      {
        long long v35 = [v30 asset];
        long long v36 = [(MADProcessingTask *)self cancelBlock];
        objc_msgSend(v30, "setIsAnalysisCompleteFromComputeSync:", objc_msgSend(v34, "mad_isAnalysisCompleteFromComputeSyncForAsset:taskID:allowDownload:cancel:", v35, 3, 1, v36));

        if ([v30 isAnalysisCompleteFromComputeSync])
        {
          if ((int)MediaAnalysisLogLevel() >= 5)
          {
            v37 = VCPLogInstance();
            if (os_log_type_enabled(v37, typea))
            {
              v38 = [v30 asset];
              unsigned int v39 = [v38 localIdentifier];
              *(_DWORD *)buf = 138412290;
              *(void *)v88 = v39;
              _os_log_impl((void *)&_mh_execute_header, v37, typea, "[Face][Download][%@] Analysis complete with compute sync, skipping media resource download", buf, 0xCu);
            }
          }
          goto LABEL_48;
        }
        if ((int)MediaAnalysisLogLevel() >= 5)
        {
          __int16 v40 = VCPLogInstance();
          if (os_log_type_enabled(v40, typea))
          {
            v41 = [v30 asset];
            v42 = [v41 localIdentifier];
            *(_DWORD *)buf = 138412290;
            *(void *)v88 = v42;
            _os_log_impl((void *)&_mh_execute_header, v40, typea, "[Face][Download][%@] Analysis remains incomplete with compute sync, falling back to media resource download", buf, 0xCu);
          }
        }
      }
      v43 = [v30 downloadResource];
      BOOL v44 = v43 == 0;

      if (!v44)
      {
        dispatch_group_enter((dispatch_group_t)self->_downloadGroup);
        v45 = [v30 downloadResource];
        v76[0] = _NSConcreteStackBlock;
        v76[1] = 3221225472;
        v76[2] = sub_1000B1FAC;
        v76[3] = &unk_10021C070;
        v76[4] = self;
        v76[5] = v30;
        uint64_t v46 = +[PHAssetResourceManager vcp_requestFileURLForAssetResource:v45 taskID:3 completionHandler:v76];

        if (v46)
        {
          v47 = [v30 asset];
          [(MADPhotosFaceAssetProcessingTask *)self addDownloadRequestID:v46 forAsset:v47];

          ++obja;
        }
        else
        {
          if ((int)MediaAnalysisLogLevel() >= 4)
          {
            v48 = VCPLogInstance();
            if (os_log_type_enabled(v48, v69))
            {
              v49 = [v30 asset];
              v50 = [v49 localIdentifier];
              *(_DWORD *)buf = 138412290;
              *(void *)v88 = v50;
              _os_log_impl((void *)&_mh_execute_header, v48, v69, "[Face][Download][%@] Failed to initialize resource download", buf, 0xCu);
            }
          }
          [v30 setStatus:4294943494];
          dispatch_group_leave((dispatch_group_t)self->_downloadGroup);
        }
      }
LABEL_48:
    }
    id v27 = [(NSMutableArray *)v72 countByEnumeratingWithState:&v77 objects:v85 count:16];
  }
  while (v27);
LABEL_52:

  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v51 = VCPLogInstance();
    os_log_type_t v52 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v51, v52))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v88 = obja;
      _os_log_impl((void *)&_mh_execute_header, v51, v52, "[Face][Download] Waiting for %d downloads to complete", buf, 8u);
    }
  }
  while (1)
  {
    downloadGroup = self->_downloadGroup;
    dispatch_time_t v54 = dispatch_time(0, 500000000);
    if (!dispatch_group_wait(downloadGroup, v54)) {
      break;
    }
    v55 = [(MADProcessingTask *)self cancelBlock];
    if (v55)
    {
      v56 = [(MADProcessingTask *)self cancelBlock];
      int v57 = v56[2]();

      if (v57)
      {
        if ((int)MediaAnalysisLogLevel() >= 5)
        {
          v61 = VCPLogInstance();
          os_log_type_t v62 = VCPLogToOSLogType[5];
          if (os_log_type_enabled(v61, v62))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v61, v62, "[Face][Download] Processing cancelled; cancelling downloads",
              buf,
              2u);
          }
        }
        -[MADPhotosFaceAssetProcessingTask cancelRemainingDownloadsWithStatus:](self, "cancelRemainingDownloadsWithStatus:", 4294967168, spid);
        break;
      }
    }
    [(MADPhotosFaceAssetProcessingTask *)self downloadInactiveTimeInterval];
    if (v58 > 60.0)
    {
      if ((int)MediaAnalysisLogLevel() >= 5)
      {
        v59 = VCPLogInstance();
        os_log_type_t v60 = VCPLogToOSLogType[5];
        if (os_log_type_enabled(v59, v60))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v59, v60, "[Face][Download] Download inactivity timeout; cancelling downloads",
            buf,
            2u);
        }
      }
      [(MADPhotosFaceAssetProcessingTask *)self cancelRemainingDownloadsWithStatus:4294943494];
      break;
    }
  }
  v63 = VCPSignPostLog();
  v64 = v63;
  if (v67 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v63))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v64, OS_SIGNPOST_INTERVAL_END, spid, "MADPhotosFaceAssetProcessingTask_Download", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  [v68 stop];
  v65 = +[VCPMADCoreAnalyticsManager sharedManager];
  [v68 elapsedTimeSeconds];
  objc_msgSend(v65, "accumulateDoubleValue:forField:andEvent:", @"TotalDownloadTimeInSeconds", @"com.apple.mediaanalysisd.FaceAnalysisRunSession");
}

- (void)_collectVNAnimalObservationResults:(id)a3
{
  id v8 = a3;
  os_signpost_id_t v3 = +[VCPMADCoreAnalyticsManager sharedManager];
  id v4 = [v8 objectForKeyedSubscript:@"NumberOfPetsGenerated"];
  objc_msgSend(v3, "accumulateInt64Value:forField:andEvent:", objc_msgSend(v4, "longValue"), @"NumberOfPetsGenerated", @"com.apple.mediaanalysisd.FaceAnalysisRunSession");

  os_signpost_id_t v5 = [v8 objectForKeyedSubscript:@"NumberOfPetsGeneratedWithHeadOnly"];
  objc_msgSend(v3, "accumulateInt64Value:forField:andEvent:", objc_msgSend(v5, "longValue"), @"NumberOfPetsGeneratedWithHeadOnly", @"com.apple.mediaanalysisd.FaceAnalysisRunSession");

  int v6 = [v8 objectForKeyedSubscript:@"NumberOfPetsGeneratedWithBodyOnly"];
  objc_msgSend(v3, "accumulateInt64Value:forField:andEvent:", objc_msgSend(v6, "longValue"), @"NumberOfPetsGeneratedWithBodyOnly", @"com.apple.mediaanalysisd.FaceAnalysisRunSession");

  os_log_type_t v7 = [v8 objectForKeyedSubscript:@"NumberOfPetsGeneratedWithHeadAndBody"];
  objc_msgSend(v3, "accumulateInt64Value:forField:andEvent:", objc_msgSend(v7, "longValue"), @"NumberOfPetsGeneratedWithHeadAndBody", @"com.apple.mediaanalysisd.FaceAnalysisRunSession");
}

- (void)_asyncAnalysisWithAssetEntry:(id)a3 resource:(id)a4 resourceURL:(id)a5 isBestResource:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v73 = a4;
  id v11 = a5;
  uint64_t v12 = [(MADProcessingTask *)self cancelBlock];
  if (v12)
  {
    os_log_type_t v13 = [(MADProcessingTask *)self cancelBlock];
    int v14 = v13[2]();

    if (v14)
    {
      if ((int)MediaAnalysisLogLevel() < 6)
      {
        uint64_t v19 = 4294967168;
        goto LABEL_42;
      }
      uint64_t v15 = VCPLogInstance();
      os_log_type_t v16 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v15, v16))
      {
        uint64_t v17 = [v10 asset];
        v18 = [v17 localIdentifier];
        *(_DWORD *)buf = 138412290;
        v76 = v18;
        _os_log_impl((void *)&_mh_execute_header, v15, v16, "[Face][%@] Cancelled", buf, 0xCu);
      }
      uint64_t v19 = 4294967168;
LABEL_34:

LABEL_42:
      [v10 setStatus:v19];
      goto LABEL_62;
    }
  }
  unsigned int v20 = [v10 asset];
  uint64_t v21 = [v20 adjustmentVersion];

  if (!v21)
  {
    if ((int)MediaAnalysisLogLevel() < 3)
    {
      uint64_t v19 = 4294943493;
      goto LABEL_42;
    }
    uint64_t v15 = VCPLogInstance();
    os_log_type_t v49 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v15, v49))
    {
      v50 = [v10 asset];
      v51 = [v50 localIdentifier];
      *(_DWORD *)buf = 138412290;
      v76 = v51;
      _os_log_impl((void *)&_mh_execute_header, v15, v49, "[Face][%@] Null asset adjustmentVersion", buf, 0xCu);
    }
    uint64_t v19 = 4294943493;
    goto LABEL_34;
  }
  dispatch_queue_t v22 = +[VCPWatchdog sharedWatchdog];
  [v22 pet];

  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    BOOL v23 = VCPLogInstance();
    os_log_type_t v24 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v23, v24))
    {
      unsigned int v25 = [v10 asset];
      int v26 = [v25 localIdentifier];
      id v27 = [v10 asset];
      uint64_t v28 = objc_msgSend(v27, "vcp_typeDescription");
      *(_DWORD *)buf = 138413058;
      v76 = v26;
      __int16 v77 = 2112;
      *(void *)long long v78 = v28;
      *(_WORD *)&v78[8] = 2048;
      id v79 = [v73 type];
      __int16 v80 = 2112;
      id v81 = v11;
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "[Face][%@] Analyzing %@ using resource (%lu) %@", buf, 0x2Au);
    }
  }
  long long v29 = VCPSignPostLog();
  os_signpost_id_t v30 = os_signpost_id_generate(v29);

  long long v31 = VCPSignPostLog();
  id v32 = v31;
  if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v32, OS_SIGNPOST_INTERVAL_BEGIN, v30, "VCPFaceProcessingAnalyzeAsset", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  faceAnalyzer = self->_faceAnalyzer;
  long long v34 = [v10 asset];
  id v74 = 0;
  unsigned int v35 = [(VCPFaceAnalyzer *)faceAnalyzer analyzeAsset:v34 withResource:v73 resourceURL:v11 isBestResource:v6 quickMode:0 results:&v74];
  id v36 = v74;

  if (v35 || !v36)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      os_log_type_t v52 = VCPLogInstance();
      os_log_type_t v53 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v52, v53))
      {
        dispatch_time_t v54 = [v10 asset];
        v55 = [v54 localIdentifier];
        *(_DWORD *)buf = 138412546;
        v76 = v55;
        __int16 v77 = 1024;
        *(_DWORD *)long long v78 = v35;
        _os_log_impl((void *)&_mh_execute_header, v52, v53, "[Face][%@] Failed to analyze asset (%d)", buf, 0x12u);
      }
    }
    goto LABEL_57;
  }
  v37 = [v36 objectForKeyedSubscript:@"ImageTooSmall"];
  unsigned int v38 = [v37 BOOLValue];

  if (!v38 || v6)
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v56 = VCPLogInstance();
      os_log_type_t v57 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v56, v57))
      {
        double v58 = [v10 asset];
        v59 = [v58 localIdentifier];
        *(_DWORD *)buf = 138412290;
        v76 = v59;
        _os_log_impl((void *)&_mh_execute_header, v56, v57, "[Face][%@] Analysis success", buf, 0xCu);
      }
    }
    [v10 setResults:v36];
    os_log_type_t v60 = [v36 objectForKeyedSubscript:@"VNAnimalObservationResults"];
    BOOL v61 = v60 == 0;

    if (!v61)
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        os_log_type_t v62 = VCPLogInstance();
        os_log_type_t v63 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v62, v63))
        {
          v72 = [v10 asset];
          v64 = [v72 localIdentifier];
          *(_DWORD *)buf = 138412290;
          v76 = v64;
          _os_log_impl((void *)&_mh_execute_header, v62, v63, "[Face][%@] Collecting VN animal observation results...", buf, 0xCu);
        }
      }
      v65 = [v36 objectForKeyedSubscript:@"VNAnimalObservationResults"];
      [(MADPhotosFaceAssetProcessingTask *)self _collectVNAnimalObservationResults:v65];
    }
    goto LABEL_58;
  }
  if (_os_feature_enabled_impl())
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      unsigned int v39 = VCPLogInstance();
      os_log_type_t v40 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v39, v40))
      {
        v41 = [v10 asset];
        v42 = [v41 localIdentifier];
        *(_DWORD *)buf = 138412802;
        v76 = v42;
        __int16 v77 = 1024;
        *(_DWORD *)long long v78 = 1;
        *(_WORD *)&v78[4] = 1024;
        *(_DWORD *)&v78[6] = 0;
        _os_log_impl((void *)&_mh_execute_header, v39, v40, "[Face][%@] Result needs improvement (ResourceTooSmall: %d; BestResource: %d)",
          buf,
          0x18u);
      }
    }
    [v10 setResults:v36];
    v43 = [v36 objectForKeyedSubscript:@"VNAnimalObservationResults"];
    BOOL v44 = v43 == 0;

    if (v44) {
      goto LABEL_57;
    }
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v45 = VCPLogInstance();
      os_log_type_t v46 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v45, v46))
      {
        v71 = [v10 asset];
        v47 = [v71 localIdentifier];
        *(_DWORD *)buf = 138412290;
        v76 = v47;
        _os_log_impl((void *)&_mh_execute_header, v45, v46, "[Face][%@] Collecting VN animal observation results...", buf, 0xCu);
      }
    }
    v48 = [v36 objectForKeyedSubscript:@"VNAnimalObservationResults"];
    [(MADPhotosFaceAssetProcessingTask *)self _collectVNAnimalObservationResults:v48];
    goto LABEL_56;
  }
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v48 = VCPLogInstance();
    os_log_type_t v66 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v48, v66))
    {
      unint64_t v67 = [v10 asset];
      id v68 = [v67 localIdentifier];
      *(_DWORD *)buf = 138412802;
      v76 = v68;
      __int16 v77 = 1024;
      *(_DWORD *)long long v78 = 1;
      *(_WORD *)&v78[4] = 1024;
      *(_DWORD *)&v78[6] = 0;
      _os_log_impl((void *)&_mh_execute_header, v48, v66, "[Face][%@] Results disqualified (ResourceTooSmall: %d; BestResource: %d)",
        buf,
        0x18u);
    }
LABEL_56:
  }
LABEL_57:
  [v10 setStatus:4294943494];
LABEL_58:
  os_log_type_t v69 = VCPSignPostLog();
  v70 = v69;
  if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v69))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v70, OS_SIGNPOST_INTERVAL_END, v30, "VCPFaceProcessingAnalyzeAsset", (const char *)&unk_1001F3BD3, buf, 2u);
  }

LABEL_62:
}

- (void)_dispatchAssetEntries
{
  if ([(NSMutableArray *)self->_assetEntries count])
  {
    os_signpost_id_t v3 = [(NSMutableArray *)self->_assetEntries firstObject];
    id v4 = [v3 asset];
    uint64_t v5 = [v4 photoLibrary];

    id v36 = (void *)v5;
    v37 = +[VCPPhotosFaceProcessingContext contextWithPhotoLibrary:v5];
    BOOL v6 = (VCPFaceAnalyzer *)[objc_alloc((Class)VCPFaceAnalyzer) initWithContext:v37];
    faceAnalyzer = self->_faceAnalyzer;
    self->_faceAnalyzer = v6;

    os_log_type_t v40 = +[NSMutableArray arrayWithCapacity:self->_processingQueuesCount];
    if (self->_processingQueuesCount)
    {
      unint64_t v8 = 0;
      do
      {
        id v9 = +[NSString stringWithFormat:@"com.apple.mediaanalysisd.face.processing.%lu", v8];
        id v10 = (const char *)[v9 UTF8String];
        id v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        dispatch_queue_t v12 = dispatch_queue_create(v10, v11);

        [v40 addObject:v12];
        ++v8;
      }
      while (v8 < self->_processingQueuesCount);
    }
    unint64_t v13 = 0;
    os_log_type_t type = VCPLogToOSLogType[4];
    os_log_type_t v38 = VCPLogToOSLogType[6];
    while (1)
    {
      if (v13 >= (unint64_t)[(NSMutableArray *)self->_assetEntries count])
      {

        return;
      }
      uint64_t v15 = [(NSMutableArray *)self->_assetEntries objectAtIndexedSubscript:v13];
      if ([v15 status]) {
        break;
      }
      if ([v15 isAnalysisCompleteFromComputeSync])
      {
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          os_log_type_t v16 = VCPLogInstance();
          if (os_log_type_enabled(v16, v38))
          {
            uint64_t v19 = [v15 asset];
            unsigned int v20 = [v19 localIdentifier];
            *(_DWORD *)buf = 138412290;
            v48 = v20;
            _os_log_impl((void *)&_mh_execute_header, v16, v38, "[Face][Process][%@] Analysis already complete from compute sync ingestion; skipping",
              buf,
              0xCu);
          }
LABEL_11:
        }
      }
      else
      {
        uint64_t v21 = [v15 downloadResource];
        if (!v21
          || ([v15 downloadURL],
              dispatch_queue_t v22 = objc_claimAutoreleasedReturnValue(),
              BOOL v23 = v22 == 0,
              v22,
              v21,
              v23))
        {
          int v26 = [v15 asset];
          id v27 = +[VCPFaceUtils preferredResourcesForFaceProcessingWithAsset:v26];

          if ([v15 previousAttempts] || !_os_feature_enabled_impl())
          {
            uint64_t v28 = +[VCPFaceUtils resourceForFaceProcessing:v27 allowStreaming:0];
          }
          else
          {
            uint64_t v28 = objc_msgSend(v27, "vcp_thumbnailResource");
          }
          long long v29 = (void *)v28;
          if (v28)
          {
            unsigned __int8 v30 = +[VCPFaceUtils isBestResourceForFaceProcessing:v28 fromResources:v27];
            processGroup = self->_processGroup;
            id v32 = [v40 objectAtIndexedSubscript:v13 % self->_processingQueuesCount];
            v41[0] = _NSConcreteStackBlock;
            v41[1] = 3221225472;
            v41[2] = sub_1000B36DC;
            v41[3] = &unk_10021C8E8;
            v41[4] = self;
            id v42 = v15;
            id v43 = v29;
            unsigned __int8 v44 = v30;
            dispatch_group_async(processGroup, v32, v41);
          }
          else
          {
            if ((int)MediaAnalysisLogLevel() >= 4)
            {
              long long v33 = VCPLogInstance();
              if (os_log_type_enabled(v33, type))
              {
                long long v34 = [v15 asset];
                unsigned int v35 = [v34 localIdentifier];
                *(_DWORD *)buf = 138412290;
                v48 = v35;
                _os_log_impl((void *)&_mh_execute_header, v33, type, "[Face][Process][%@] No acceptable resource available", buf, 0xCu);
              }
            }
            [v15 setStatus:4294943494];
          }
        }
        else
        {
          os_log_type_t v24 = self->_processGroup;
          unsigned int v25 = [v40 objectAtIndexedSubscript:v13 % self->_processingQueuesCount];
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1000B3608;
          block[3] = &unk_100219D70;
          block[4] = self;
          id v46 = v15;
          dispatch_group_async(v24, v25, block);
        }
      }
LABEL_32:

      ++v13;
    }
    if ((int)MediaAnalysisLogLevel() < 4) {
      goto LABEL_32;
    }
    os_log_type_t v16 = VCPLogInstance();
    if (os_log_type_enabled(v16, type))
    {
      uint64_t v17 = [v15 asset];
      v18 = [v17 localIdentifier];
      *(_DWORD *)buf = 138412290;
      v48 = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, type, "[Face][Process][%@] Asset has failure status; skipping",
        buf,
        0xCu);
    }
    goto LABEL_11;
  }
}

- (int)_process
{
  os_signpost_id_t v3 = VCPSignPostLog();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  uint64_t v5 = VCPSignPostLog();
  BOOL v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "MADPhotosFaceAssetProcessingTask_Process", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    os_log_type_t v7 = VCPLogInstance();
    os_log_type_t v8 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v7, v8))
    {
      unsigned int v9 = [(NSMutableArray *)self->_assetEntries count];
      qos_class_t v10 = qos_class_self();
      id v11 = VCPMAQoSDescription(v10);
      *(_DWORD *)buf = 67109378;
      unsigned int v28 = v9;
      __int16 v29 = 2112;
      unsigned __int8 v30 = v11;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "[Face][Process] Processing %d assets (QoS: %@)", buf, 0x12u);
    }
  }
  id v12 = objc_alloc_init((Class)VCPTimeMeasurement);
  [v12 start];
  [(MADPhotosFaceAssetProcessingTask *)self _dispatchAssetEntries];
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    unint64_t v13 = VCPLogInstance();
    os_log_type_t v14 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v13, v14))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "[Face] Waiting for detection to complete ...", buf, 2u);
    }
  }
  dispatch_group_wait((dispatch_group_t)self->_processGroup, 0xFFFFFFFFFFFFFFFFLL);
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    uint64_t v15 = VCPLogInstance();
    os_log_type_t v16 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v15, v16))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "[Face] Detection completed", buf, 2u);
    }
  }
  if ([(NSMutableArray *)self->_assetEntries count])
  {
    [v12 stop];
    if (self->_processingQueuesCount <= 1) {
      uint64_t v17 = @"Serial";
    }
    else {
      uint64_t v17 = @"Concurrent";
    }
    v18 = v17;
    uint64_t v19 = VCPTaskIDDescription(3);
    unsigned int v20 = +[NSString stringWithFormat:@"%@-%@-Analyze", v19, v18];

    [v12 elapsedTimeSeconds];
    VCPCoreAnalyticsQoSReportSpeed(v20, v21 * 1000.0 / (double)(unint64_t)[(NSMutableArray *)self->_assetEntries count]);
    dispatch_queue_t v22 = +[VCPMADCoreAnalyticsManager sharedManager];
    [v12 elapsedTimeSeconds];
    objc_msgSend(v22, "accumulateDoubleValue:forField:andEvent:", @"FaceDetectionElapsedTimeInSeconds", @"com.apple.mediaanalysisd.FaceAnalysisRunSession");

    BOOL v23 = +[VCPMADCoreAnalyticsManager sharedManager];
    [v12 elapsedTimeSeconds];
    objc_msgSend(v23, "accumulateDoubleValue:forField:andEvent:", @"TotalAnalyzingTimeInSeconds", @"com.apple.mediaanalysisd.FaceAnalysisRunSession");
  }
  os_log_type_t v24 = VCPSignPostLog();
  unsigned int v25 = v24;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v25, OS_SIGNPOST_INTERVAL_END, v4, "MADPhotosFaceAssetProcessingTask_Process", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  return 0;
}

- (void)process
{
  if (!self->_status) {
    self->_status = [(MADPhotosFaceAssetProcessingTask *)self _process];
  }
}

- (void)_publishEntry:(id)a3 faceLocalIdentifiers:(id *)a4
{
  id v94 = a3;
  os_signpost_id_t v4 = [v94 asset];
  uint64_t v5 = [v4 localIdentifier];
  v99 = +[NSString stringWithFormat:@"[FacePersist][Unified][%@]", v5];

  if (_os_feature_enabled_impl())
  {
    BOOL v6 = [v94 results];
    BOOL v7 = v6 != 0;
  }
  else
  {
    BOOL v7 = 0;
  }
  if (!v94) {
    goto LABEL_123;
  }
  if ([v94 status] && !v7) {
    goto LABEL_123;
  }
  if ([v94 isAnalysisCompleteFromComputeSync])
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      unsigned int v9 = VCPLogInstance();
      os_log_type_t v10 = VCPLogToOSLogType[6];
      id v11 = v9;
      v104 = v9;
      if (os_log_type_enabled(v9, v10))
      {
        *(_DWORD *)buf = 138412290;
        v114 = v99;
        _os_log_impl((void *)&_mh_execute_header, v11, v10, "%@ Analysis already complete from compute sync ingestion; skip publishing",
          buf,
          0xCu);
      }
      goto LABEL_122;
    }
    goto LABEL_123;
  }
  id v12 = [v94 asset];
  unint64_t v13 = [v12 photoLibrary];
  os_log_type_t v14 = [v13 librarySpecificFetchOptions];

  v104 = v14;
  [v14 setIncludeNonvisibleFaces:1];
  [v14 setIncludeTorsoOnlyDetectionData:1];
  [v14 setIncludedDetectionTypes:&off_100230428];
  uint64_t v121 = PHFacePropertySetIdentifier;
  uint64_t v15 = +[NSArray arrayWithObjects:&v121 count:1];
  [v14 setFetchPropertySets:v15];

  os_log_type_t v16 = [v94 results];
  uint64_t v17 = [v16 objectForKeyedSubscript:@"FaceResults"];
  v90 = [v17 objectForKeyedSubscript:@"FacesToDelete"];

  v89 = +[VCPFaceUtils phFacesFromVCPPhotosFaces:v90 withFetchOptions:v14];
  if ([v89 count])
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v18 = VCPLogInstance();
      os_log_type_t v19 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v18, v19))
      {
        *(_DWORD *)buf = 138412546;
        v114 = v99;
        __int16 v115 = 2048;
        CFStringRef v116 = (const __CFString *)[v89 count];
        _os_log_impl((void *)&_mh_execute_header, v18, v19, "%@ Deleting %lu faces", buf, 0x16u);
      }
    }
    +[PHFaceChangeRequest deleteFaces:v89];
  }
  id v98 = +[NSMutableArray array];
  unsigned int v20 = [v94 asset];
  v101 = +[PHAssetChangeRequest changeRequestForAsset:v20];

  double v21 = [v94 results];
  dispatch_queue_t v22 = [v21 objectForKeyedSubscript:@"FaceResults"];
  v88 = [v22 objectForKeyedSubscript:@"FacesToPersist"];

  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    BOOL v23 = VCPLogInstance();
    os_log_type_t v24 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v23, v24))
    {
      CFStringRef v25 = (const __CFString *)[v88 count];
      *(_DWORD *)buf = 138412546;
      v114 = v99;
      __int16 v115 = 2048;
      CFStringRef v116 = v25;
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "%@ Inserting/updating %lu faces ... ", buf, 0x16u);
    }
  }
  long long v110 = 0u;
  long long v111 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  id obj = v88;
  id v26 = [obj countByEnumeratingWithState:&v108 objects:v120 count:16];
  if (!v26)
  {
    uint64_t v92 = 0;
    uint64_t v93 = 0;
    uint64_t v100 = 0;
    char v96 = 0;
    uint64_t v95 = 0;
    goto LABEL_102;
  }
  uint64_t v92 = 0;
  uint64_t v93 = 0;
  uint64_t v100 = 0;
  char v96 = 0;
  uint64_t v95 = 0;
  uint64_t v106 = *(void *)v109;
  os_log_type_t type = VCPLogToOSLogType[7];
  os_log_type_t v97 = VCPLogToOSLogType[3];
  do
  {
    id v107 = v26;
    for (i = 0; i != v107; i = (char *)i + 1)
    {
      if (*(void *)v109 != v106) {
        objc_enumerationMutation(obj);
      }
      unsigned int v28 = *(void **)(*((void *)&v108 + 1) + 8 * i);
      if (_os_feature_enabled_impl())
      {
        id v29 = [v28 algorithmVersion];
        int v30 = _os_feature_enabled_impl();
        uint64_t v31 = 11;
        if (v30) {
          uint64_t v31 = 14;
        }
        if (v29 == (id)v31)
        {
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            id v32 = VCPLogInstance();
            if (os_log_type_enabled(v32, type))
            {
              long long v33 = [v28 localIdentifier];
              *(_DWORD *)buf = 138412546;
              v114 = v99;
              __int16 v115 = 2112;
              CFStringRef v116 = v33;
              _os_log_impl((void *)&_mh_execute_header, v32, type, "%@ Marking asset contains FC face %@", buf, 0x16u);
            }
          }
          char v96 = 1;
        }
      }
      long long v34 = [v28 localIdentifier];

      if (!v34)
      {
        id v36 = +[PHFaceChangeRequest creationRequestForFace];
        v37 = 0;
        if (!v36) {
          goto LABEL_55;
        }
LABEL_42:
        +[VCPFaceUtils assignPropertiesOfVCPPhotosFace:v28 toPHFaceChangeRequest:v36];
        unsigned int v38 = [v28 detectionType];
        BOOL v39 = [v28 detectionType] == 3
           || [v28 detectionType] == 4;
        if (v38 == 1)
        {
          [v28 centerX];
          if (v40 == 0.0 && ([v28 centerY], v41 == 0.0) && (objc_msgSend(v28, "size"), v42 == 0.0))
          {
            [v28 bodyCenterX];
            if (v43 == 0.0
              && ([v28 bodyCenterY], v44 == 0.0)
              && ([v28 bodyWidth], v45 == 0.0))
            {
              [v28 bodyHeight];
              BOOL v46 = v71 != 0.0;
            }
            else
            {
              BOOL v46 = 1;
            }
          }
          else
          {
            BOOL v46 = 0;
          }
          [v28 centerX];
          if (v49 == 0.0 && ([v28 centerY], v50 == 0.0) && (objc_msgSend(v28, "size"), v51 == 0.0)
            || ([v28 bodyCenterX], v52 != 0.0)
            || ([v28 bodyCenterY], v53 != 0.0)
            || ([v28 bodyWidth], v54 != 0.0))
          {
            BOOL v47 = 0;
            int v105 = 0;
            CFStringRef v48 = @"face";
            if (!v46) {
              goto LABEL_69;
            }
          }
          else
          {
            [v28 bodyHeight];
            BOOL v47 = v55 == 0.0;
            if (!v46)
            {
              int v105 = 0;
              CFStringRef v48 = @"face";
              goto LABEL_69;
            }
          }
          int v105 = 1;
          CFStringRef v48 = @"torso";
          goto LABEL_69;
        }
        BOOL v47 = 0;
        int v105 = 0;
        CFStringRef v48 = @"pet";
LABEL_69:
        if (v34)
        {
          v112 = v37;
          v56 = +[NSArray arrayWithObjects:&v112 count:1];
          [v101 addFaces:v56];

          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            os_log_type_t v57 = VCPLogInstance();
            if (os_log_type_enabled(v57, type))
            {
              double v58 = [v37 localIdentifier];
              *(_DWORD *)buf = 138412802;
              v114 = v99;
              __int16 v115 = 2112;
              CFStringRef v116 = v48;
              __int16 v117 = 2112;
              v118 = v58;
              _os_log_impl((void *)&_mh_execute_header, v57, type, "%@ Updating %@ %@", buf, 0x20u);
            }
          }
          if (v38 == 1
            || v39
            && ([v94 asset],
                v65 = objc_claimAutoreleasedReturnValue(),
                [v65 photoLibrary],
                os_log_type_t v66 = objc_claimAutoreleasedReturnValue(),
                unsigned int v67 = objc_msgSend(v66, "mad_useVUGallery"),
                v66,
                v65,
                v67))
          {
            v59 = [v37 localIdentifier];
            [v98 addObject:v59];
          }
          [v36 setClusterSequenceNumber:0];
          [v36 setVuObservationID:0];
        }
        else
        {
          os_log_type_t v60 = [v36 placeholderForCreatedFace];
          v119 = v60;
          BOOL v61 = +[NSArray arrayWithObjects:&v119 count:1];
          [v101 addFaces:v61];

          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            os_log_type_t v62 = VCPLogInstance();
            if (os_log_type_enabled(v62, type))
            {
              os_log_type_t v63 = [v60 localIdentifier];
              *(_DWORD *)buf = 138412802;
              v114 = v99;
              __int16 v115 = 2112;
              CFStringRef v116 = v48;
              __int16 v117 = 2112;
              v118 = v63;
              _os_log_impl((void *)&_mh_execute_header, v62, type, "%@ Adding %@ %@", buf, 0x20u);
            }
          }
          if (v38 == 1
            || v39
            && ([v94 asset],
                id v68 = objc_claimAutoreleasedReturnValue(),
                [v68 photoLibrary],
                os_log_type_t v69 = objc_claimAutoreleasedReturnValue(),
                unsigned int v70 = objc_msgSend(v69, "mad_useVUGallery"),
                v69,
                v68,
                v70))
          {
            v64 = [v60 localIdentifier];
            [v98 addObject:v64];
          }
        }
        if (v38 == 1)
        {
          if (v47)
          {
            ++v95;
          }
          else if (v105)
          {
            ++v92;
          }
          else
          {
            ++v93;
          }
        }
        else
        {
          ++v100;
        }
        goto LABEL_92;
      }
      uint64_t v35 = +[VCPFaceUtils phFaceFromVCPPhotosFace:v28 withFetchOptions:v104];
      if (v35)
      {
        id v36 = +[PHFaceChangeRequest changeRequestForFace:v35];
        v37 = (void *)v35;
        if (v36) {
          goto LABEL_42;
        }
      }
      else
      {
        v37 = 0;
      }
LABEL_55:
      if ((int)MediaAnalysisLogLevel() < 3) {
        goto LABEL_93;
      }
      id v36 = VCPLogInstance();
      if (os_log_type_enabled(v36, v97))
      {
        *(_DWORD *)buf = 138412290;
        v114 = v99;
        _os_log_impl((void *)&_mh_execute_header, v36, v97, "%@ Failed to retrieve faceChangeRequest; skipping",
          buf,
          0xCu);
      }
LABEL_92:

LABEL_93:
    }
    id v26 = [obj countByEnumeratingWithState:&v108 objects:v120 count:16];
  }
  while (v26);
LABEL_102:

  v72 = [v94 asset];
  id v73 = [v72 adjustmentVersion];
  [v101 setFaceAdjustmentVersion:v73];

  id v74 = [v94 results];
  v75 = [v74 objectForKeyedSubscript:@"ImageTooSmall"];
  uint64_t v76 = v75 == 0;

  if (v76)
  {
    unsigned __int8 v77 = 0;
  }
  else
  {
    id v74 = [v94 results];
    uint64_t v76 = [v74 objectForKeyedSubscript:@"ImageTooSmall"];
    unsigned __int8 v77 = [(id)v76 BOOLValue];

    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      id v74 = VCPLogInstance();
      uint64_t v76 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v74, (os_log_type_t)VCPLogToOSLogType[7]))
      {
        *(_DWORD *)buf = 138412290;
        v114 = v99;
        _os_log_impl((void *)&_mh_execute_header, v74, (os_log_type_t)v76, "%@ Marking resource is too small", buf, 0xCu);
      }
    }
  }
  if ((v96 | v77))
  {
    if (_os_feature_enabled_impl()) {
      signed __int16 v78 = 14;
    }
    else {
      signed __int16 v78 = 11;
    }
  }
  else
  {
    id v74 = [v94 asset];
    uint64_t v76 = [v74 photoLibrary];
    signed __int16 v78 = (unsigned __int16)objc_msgSend((id)v76, "mad_faceProcessingInternalVersion");
  }
  [v101 setFaceAnalysisVersion:v78];
  if (((v96 | v77) & 1) == 0)
  {
  }
  id v79 = [v94 asset];
  if (objc_msgSend(v79, "mad_isEligibleForComputeSync"))
  {
    unsigned int v80 = [v101 faceAnalysisVersion];
    id v81 = [v94 asset];
    long long v82 = [v81 photoLibrary];
    BOOL v83 = objc_msgSend(v82, "mad_faceProcessingInternalVersion") == v80;

    if (v83)
    {
      long long v84 = [v94 asset];
      id v79 = objc_msgSend(v84, "mad_refetchAsset");

      if (v79)
      {
        objc_msgSend(v101, "setLocalAnalysisStage:", objc_msgSend(v79, "mad_analysisStageAfterCompletingAnalysis:", 3));
      }
      else
      {
        v85 = [v94 asset];
        objc_msgSend(v101, "setLocalAnalysisStage:", objc_msgSend(v85, "mad_analysisStageAfterCompletingAnalysis:", 3));
      }
      goto LABEL_120;
    }
  }
  else
  {
LABEL_120:
  }
  v86 = +[VCPMADCoreAnalyticsManager sharedManager];
  [v86 accumulateInt64Value:v95 forField:@"NumberOfFacesPersisted" andEvent:@"com.apple.mediaanalysisd.FaceAnalysisRunSession"];
  [v86 accumulateInt64Value:v92 forField:@"NumberOfTorsosPersisted" andEvent:@"com.apple.mediaanalysisd.FaceAnalysisRunSession"];
  [v86 accumulateInt64Value:v93 forField:@"NumberOfFaceTorsosPersisted" andEvent:@"com.apple.mediaanalysisd.FaceAnalysisRunSession"];
  [v86 accumulateInt64Value:v100 forField:@"NumberOfPetsPersisted" andEvent:@"com.apple.mediaanalysisd.FaceAnalysisRunSession"];
  id v87 = v98;
  *a4 = v87;

LABEL_122:
LABEL_123:
}

- (int)_publish
{
  id v59 = objc_alloc_init((Class)VCPTimeMeasurement);
  [v59 start];
  v2 = VCPSignPostLog();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  os_signpost_id_t v4 = VCPSignPostLog();
  uint64_t v5 = v4;
  os_signpost_id_t spid = v3;
  unint64_t v53 = v3 - 1;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "MADPhotosFaceAssetProcessingTask_Publish", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  BOOL v6 = &OBJC_IVAR___VCPAssetAnalysisTask__types;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    BOOL v7 = VCPLogInstance();
    os_log_type_t v8 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v7, v8))
    {
      unsigned int v9 = [(NSMutableArray *)self->_assetEntries count];
      qos_class_t v10 = qos_class_self();
      id v11 = VCPMAQoSDescription(v10);
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v72 = v9;
      *(_WORD *)&v72[4] = 2112;
      *(void *)&v72[6] = v11;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "[Face] Persisting %d assets (QoS: %@)", buf, 0x12u);
    }
  }
  if ([(NSMutableArray *)self->_assetEntries count])
  {
    id v12 = +[MADStateHandler sharedStateHandler];
    objc_msgSend(v12, "addBreadcrumb:", @"[Face] Persisting %d assets to Photos", -[NSMutableArray count](self->_assetEntries, "count"));

    unint64_t v13 = +[VCPWatchdog sharedWatchdog];
    [v13 pet];

    os_log_type_t v14 = +[MADStateHandler sharedStateHandler];
    [v14 enterKnownTimeoutRisk:1];

    v69[0] = _NSConcreteStackBlock;
    v69[1] = 3221225472;
    v69[2] = sub_1000B5878;
    v69[3] = &unk_100219FC8;
    v69[4] = self;
    os_log_type_t v57 = objc_retainBlock(v69);
    uint64_t v15 = [(NSMutableArray *)self->_assetEntries firstObject];
    os_log_type_t v16 = [(id)v15 asset];
    double v58 = [v16 photoLibrary];

    uint64_t v17 = [(MADProcessingTask *)self cancelBlock];
    id v68 = 0;
    LOBYTE(v15) = objc_msgSend(v58, "mad_performChangesAndWait:cancelBlock:extendTimeoutBlock:error:", v57, v17, &stru_10021C908, &v68);
    id v61 = v68;

    v18 = +[MADStateHandler sharedStateHandler];
    [v18 exitKnownTimeoutRisk];

    os_log_type_t v19 = +[MADStateHandler sharedStateHandler];
    objc_msgSend(v19, "addBreadcrumb:", @"[Face] Finished persisting %d assets to Photos", -[NSMutableArray count](self->_assetEntries, "count"));

    if (v15)
    {
      double v55 = +[VCPMADCoreAnalyticsManager sharedManager];
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      id obj = self->_assetEntries;
      id v20 = [(NSMutableArray *)obj countByEnumeratingWithState:&v64 objects:v70 count:16];
      unsigned int v21 = 0;
      if (v20)
      {
        uint64_t v62 = *(void *)v65;
        do
        {
          id v60 = v20;
          for (i = 0; i != v60; i = (char *)i + 1)
          {
            if (*(void *)v65 != v62) {
              objc_enumerationMutation(obj);
            }
            BOOL v23 = *(void **)(*((void *)&v64 + 1) + 8 * i);
            if ([v23 status])
            {
              if ([v23 status] == -128)
              {
                id v24 = [v23 previousAttempts];
                analysisDatabase = self->_analysisDatabase;
                if (v24)
                {
                  id v26 = [v23 previousAttempts];
                  id v27 = [v23 asset];
                  id v28 = [v23 previousStatus];
                  id v29 = [v23 lastAttemptDate];
                  id v30 = (id)[(VCPDatabaseWriter *)analysisDatabase setAttempts:v26 asset:v27 taskID:3 status:v28 lastAttemptDate:v29];
                }
                else
                {
                  id v27 = [v23 asset];
                  id v29 = [v27 localIdentifier];
                  id v30 = (id)[(VCPDatabaseWriter *)analysisDatabase removeProcessingStatusForLocalIdentifier:v29 andTaskID:3];
                }

                if (v30 == -108 || v30 == -36)
                {
                  id v36 = v30;
                }
                else
                {
                  id v36 = v30;
                  if (v30 != -23) {
                    id v36 = v6;
                  }
                }
                if (v30 == -108 || v30 == -36 || v30 == -23) {
                  goto LABEL_81;
                }
                unsigned int v21 = [v23 status];
                BOOL v6 = (int *)v36;
                continue;
              }
              v37 = @"NumberOfAssetsSoftFailure";
              if ([v23 status] == -23802)
              {
                unsigned int v38 = @"NumberOfAssetsNoResource";

                uint64_t v39 = 2;
                goto LABEL_29;
              }
              if ([v23 status] == -23808)
              {
                unsigned int v38 = @"NumberOfAssetsDownloadThrottled";

                unsigned int v21 = [v23 status];
                uint64_t v39 = 7;
LABEL_29:
                v37 = v38;
              }
              else
              {
                uint64_t v39 = 3;
              }
              double v41 = [v23 asset];
              double v42 = [v23 currentAttemptDate];
              double v43 = objc_msgSend(v41, "mad_nextAttemptDateForStatus:currentAttemptDate:attemptCount:", v39, v42, (char *)objc_msgSend(v23, "previousAttempts") + 1);

              double v44 = self->_analysisDatabase;
              double v45 = [v23 asset];
              BOOL v46 = [v45 localIdentifier];
              id v47 = (id)[(VCPDatabaseWriter *)v44 updateProcessingStatus:v39 andNextAttemptDate:v43 forLocalIdentifier:v46 andTaskID:3];

              if (v47 == -108 || v47 == -36)
              {
                id v36 = v47;
              }
              else
              {
                id v36 = v47;
                if (v47 != -23) {
                  id v36 = v6;
                }
              }
              if (v47 != -108 && v47 != -36 && v47 != -23) {
                [v55 accumulateInt64Value:1 forField:v37 andEvent:@"com.apple.mediaanalysisd.FaceAnalysisRunSession"];
              }

              if (v47 == -108) {
                goto LABEL_81;
              }
              if (v47 == -36) {
                goto LABEL_81;
              }
              BOOL v6 = (int *)v36;
              if (v47 == -23) {
                goto LABEL_81;
              }
              continue;
            }
            uint64_t v31 = self->_analysisDatabase;
            id v32 = [v23 asset];
            long long v33 = [v32 localIdentifier];
            id v34 = (id)[(VCPDatabaseWriter *)v31 removeProcessingStatusForLocalIdentifier:v33 andTaskID:3];

            if (v34 == -108)
            {
              id v36 = v34;
            }
            else
            {
              BOOL v35 = v34 == -36 || v34 == -23;
              id v36 = v34;
              if (!v35) {
                id v36 = v6;
              }
            }
            if (v34 == -108) {
              goto LABEL_81;
            }
            if (v34 == -36 || v34 == -23) {
              goto LABEL_81;
            }
            [v55 accumulateInt64Value:1 forField:@"NumberOfAssetsAnalyzed" andEvent:@"com.apple.mediaanalysisd.FaceAnalysisRunSession"];
            BOOL v6 = (int *)v36;
          }
          id v20 = [(NSMutableArray *)obj countByEnumeratingWithState:&v64 objects:v70 count:16];
        }
        while (v20);
      }

      unsigned int v50 = [(VCPDatabaseWriter *)self->_analysisDatabase commit];
      if (v50 == -108 || v50 == -36)
      {
        LODWORD(v36) = v50;
      }
      else
      {
        LODWORD(v36) = v50;
        if (v50 != -23) {
          LODWORD(v36) = v6;
        }
      }
      if (v50 != -108 && v50 != -36 && v50 != -23)
      {
        double v51 = VCPSignPostLog();
        id v36 = v51;
        if (v53 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v51))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v36, OS_SIGNPOST_INTERVAL_END, spid, "MADPhotosFaceAssetProcessingTask_Publish", (const char *)&unk_1001F3BD3, buf, 2u);
        }

        [v59 stop];
        id obj = +[VCPMADCoreAnalyticsManager sharedManager];
        [v59 elapsedTimeSeconds];
        -[NSMutableArray accumulateDoubleValue:forField:andEvent:](obj, "accumulateDoubleValue:forField:andEvent:", @"TotalPublishTimeInSeconds", @"com.apple.mediaanalysisd.FaceAnalysisRunSession");
        LODWORD(v36) = v21;
LABEL_81:
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        CFStringRef v48 = VCPLogInstance();
        os_log_type_t v49 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v48, v49))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v72 = v61;
          _os_log_impl((void *)&_mh_execute_header, v48, v49, "[Face] Failed to persist Face results to Photos (%@)", buf, 0xCu);
        }
      }
      LODWORD(v36) = [v61 code];
    }
  }
  else
  {
    LODWORD(v36) = 0;
  }

  return (int)v36;
}

- (void)publish
{
  if (!self->_status) {
    self->_status = [(MADPhotosFaceAssetProcessingTask *)self _publish];
  }
}

- (void)processDeletedAssets:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000B5C20;
    v13[3] = &unk_100219D98;
    v13[4] = self;
    uint64_t v5 = objc_retainBlock(v13);
    BOOL v6 = +[MADGDUtilities sharedInstance];
    gallery = self->_gallery;
    id v12 = 0;
    unsigned __int8 v8 = [v6 removeObservationsWithAssetLocalIdentifiers:v4 gallery:gallery cancelOrExtendTimeoutBlock:v5 error:&v12];
    id v9 = v12;

    if ((v8 & 1) == 0 && (int)MediaAnalysisLogLevel() >= 3)
    {
      qos_class_t v10 = VCPLogInstance();
      os_log_type_t v11 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v10, v11))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, v11, "[Face] Failed to remove faces from Gallery - %@", buf, 0xCu);
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadStateChange, 0);
  objc_storeStrong((id *)&self->_downloadRequestIDs, 0);
  objc_storeStrong((id *)&self->_downloadStateQueue, 0);
  objc_storeStrong((id *)&self->_downloadGroup, 0);
  objc_storeStrong((id *)&self->_processGroup, 0);
  objc_storeStrong((id *)&self->_managementQueue, 0);
  objc_storeStrong((id *)&self->_gallery, 0);
  objc_storeStrong((id *)&self->_faceClusterer, 0);
  objc_storeStrong((id *)&self->_faceAnalyzer, 0);
  objc_storeStrong((id *)&self->_assetEntries, 0);
  objc_storeStrong((id *)&self->_analysisDatabase, 0);
}

@end
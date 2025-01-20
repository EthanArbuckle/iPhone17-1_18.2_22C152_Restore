@interface MADPhotosFaceTaskProvider
+ (id)name;
+ (unint64_t)taskID;
- (BOOL)shouldProcessAsset:(id)a3;
- (MADPhotosFaceTaskProvider)initWithPhotoLibrary:(id)a3 skipSyncGallery:(BOOL)a4 cancelBlock:(id)a5;
- (id)assetPriorities;
- (id)assetTaskWithAnalysisDatabase:(id)a3;
- (id)nextAssetProcessingTask;
- (id)nextClusterProcessingTask;
- (id)nextDownloadAssetProcessingTask;
- (void)dealloc;
- (void)retireTask:(id)a3;
@end

@implementation MADPhotosFaceTaskProvider

- (MADPhotosFaceTaskProvider)initWithPhotoLibrary:(id)a3 skipSyncGallery:(BOOL)a4 cancelBlock:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  id v10 = a5;
  v54.receiver = self;
  v54.super_class = (Class)MADPhotosFaceTaskProvider;
  v11 = [(MADPhotosTaskProvider *)&v54 initWithPhotoLibrary:v9 cancelBlock:v10];
  v12 = v11;
  if (!v11) {
    goto LABEL_16;
  }
  p_photoLibrary = (id *)&v11->_photoLibrary;
  objc_storeStrong((id *)&v11->_photoLibrary, a3);
  v14 = (VCPPhotosFaceProcessingContext *)[objc_alloc((Class)VCPPhotosFaceProcessingContext) initWithPhotoLibrary:v9];
  context = v12->_context;
  v12->_context = v14;

  [(VCPPhotosFaceProcessingContext *)v12->_context setSkipGallerySyncing:v6];
  v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v17 = dispatch_queue_create("com.apple.mediaanalysisd.photos.facetask.person", v16);
  managementQueue = v12->_managementQueue;
  v12->_managementQueue = (OS_dispatch_queue *)v17;

  v12->_personProcessingRequirement = 0;
  v19 = VCPTaskIDDescription([(MADTaskProvider *)v12 taskID]);
  v20 = objc_msgSend(*p_photoLibrary, "vcp_description");
  uint64_t v21 = +[NSString stringWithFormat:@"[%@][%@][Tasking]", v19, v20];
  logPrefix = v12->_logPrefix;
  v12->_logPrefix = (NSString *)v21;

  if (!objc_msgSend(*p_photoLibrary, "mad_useVUGallery"))
  {
    id v25 = objc_alloc((Class)VCPFaceClusterer);
    v26 = v12->_context;
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_10016C5C0;
    v46[3] = &unk_1002198A8;
    v47 = v10;
    v27 = (VCPFaceClusterer *)[v25 initWithPhotoLibrary:v9 context:v26 cancelOrExtendTimeoutBlock:v46];
    faceClusterer = v12->_faceClusterer;
    v12->_faceClusterer = v27;

    v24 = v47;
    goto LABEL_15;
  }
  if (objc_msgSend(v9, "vcp_isSyndicationLibrary") && !_os_feature_enabled_impl())
  {
    if ((int)MediaAnalysisLogLevel() < 7) {
      goto LABEL_16;
    }
    v24 = VCPLogInstance();
    os_log_type_t v44 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v24, v44))
    {
      v45 = v12->_logPrefix;
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v45;
      _os_log_impl((void *)&_mh_execute_header, v24, v44, "%@ Skipping Syndication Library", buf, 0xCu);
    }
LABEL_15:

LABEL_16:
    v39 = v12;
    goto LABEL_17;
  }
  if (objc_msgSend(v9, "vcp_isSyndicationLibrary"))
  {
    v23 = +[PHPhotoLibrary vcp_defaultPhotoLibrary];
    v24 = objc_msgSend(v23, "vcp_visionCacheStorageDirectoryURL");

    [sub_10016C374() syndication];
  }
  else
  {
    v24 = objc_msgSend(v9, "vcp_visionCacheStorageDirectoryURL");
    [sub_10016C374() photos];
  v29 = };
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x2050000000;
  v30 = (void *)qword_100252920;
  uint64_t v58 = qword_100252920;
  if (!qword_100252920)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_10016D640;
    v60 = &unk_10021EB68;
    v61 = &v55;
    sub_10016D640((uint64_t)buf);
    v30 = (void *)v56[3];
  }
  v31 = v30;
  _Block_object_dispose(&v55, 8);
  id v53 = 0;
  v32 = (GDVUVisualUnderstandingService *)[[v31 alloc] initWithClient:v29 version:1 url:v24 error:&v53];
  id v33 = v53;
  vuService = v12->_vuService;
  v12->_vuService = v32;

  if (v12->_vuService)
  {
    if (![(VCPPhotosFaceProcessingContext *)v12->_context skipGallerySyncing])
    {
      id v35 = objc_alloc_init((Class)VCPTimeMeasurement);
      [v35 start];
      qos_class_t v36 = qos_class_self();
      v37 = dispatch_get_global_queue(v36, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10016C458;
      block[3] = &unk_10021F190;
      v49 = v12;
      id v50 = v9;
      id v51 = v35;
      id v52 = v10;
      id v38 = v35;
      dispatch_async(v37, block);
    }
    goto LABEL_15;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v41 = VCPLogInstance();
    os_log_type_t v42 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v41, v42))
    {
      v43 = v12->_logPrefix;
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v43;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v33;
      _os_log_impl((void *)&_mh_execute_header, v41, v42, "%@ Failed to create MADGDVisualUnderstandingService instance - %@", buf, 0x16u);
    }
  }
  v39 = 0;
LABEL_17:

  return v39;
}

+ (id)name
{
  return @"Face";
}

+ (unint64_t)taskID
{
  return 3;
}

- (void)dealloc
{
  v3 = +[VNSession globalSession];
  [v3 releaseCachedResources];

  +[PHAssetResourceManager vcp_flushFileCache];
  v4.receiver = self;
  v4.super_class = (Class)MADPhotosFaceTaskProvider;
  [(MADPhotosFaceTaskProvider *)&v4 dealloc];
}

- (BOOL)shouldProcessAsset:(id)a3
{
  id v3 = a3;
  objc_super v4 = [v3 photoLibrary];
  if (!objc_msgSend(v4, "mad_pauseFCPeopleFurtherProcessing"))
  {

LABEL_12:
    unsigned __int8 v10 = objc_msgSend(v3, "vcp_needsFaceProcessing");
    goto LABEL_13;
  }
  unsigned int v5 = [v3 faceAnalysisVersion];
  if (_os_feature_enabled_impl()) {
    int v6 = 14;
  }
  else {
    int v6 = 11;
  }

  if (v6 != v5) {
    goto LABEL_12;
  }
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    v7 = VCPLogInstance();
    os_log_type_t v8 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v7, v8))
    {
      id v9 = [v3 localIdentifier];
      int v12 = 138412290;
      v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "[%@] already with FC version; skip", (uint8_t *)&v12, 0xCu);
    }
  }
  unsigned __int8 v10 = 0;
LABEL_13:

  return v10;
}

- (id)assetTaskWithAnalysisDatabase:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 photoLibrary];
  unsigned int v6 = objc_msgSend(v5, "mad_useVUGallery");

  if (v6)
  {
    v7 = [(GDVUVisualUnderstandingService *)self->_vuService gallery];
    os_log_type_t v8 = +[MADPhotosFaceAssetProcessingTask taskWithAnalysisDatabase:v4 andGallery:v7];
  }
  else
  {
    os_log_type_t v8 = +[MADPhotosFaceAssetProcessingTask taskWithAnalysisDatabase:v4 andFaceClusterer:self->_faceClusterer];
  }

  return v8;
}

- (id)assetPriorities
{
  return &off_1002307E8;
}

- (id)nextAssetProcessingTask
{
  id v3 = [(PHPhotoLibrary *)self->_photoLibrary countOfUnprocessedFaceCrops];
  if (v3 == self->_previousCountOfUnprocessedFaceCrops)
  {
    v18.receiver = self;
    v18.super_class = (Class)MADPhotosFaceTaskProvider;
    id v4 = [(MADPhotosTaskProvider *)&v18 nextAssetProcessingTask];
    managementQueue = self->_managementQueue;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10016CAD8;
    v16[3] = &unk_100219D00;
    v16[4] = self;
    id v6 = v4;
    id v17 = v6;
    dispatch_sync(managementQueue, v16);
    v7 = v17;
    id v8 = v6;
  }
  else
  {
    self->_previousCountOfUnprocessedFaceCrops = (unint64_t)v3;
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      id v9 = VCPLogInstance();
      os_log_type_t v10 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v9, v10))
      {
        logPrefix = self->_logPrefix;
        *(_DWORD *)buf = 138412290;
        v20 = logPrefix;
        _os_log_impl((void *)&_mh_execute_header, v9, v10, "%@ Scheduling face crop processing task", buf, 0xCu);
      }
    }
    unsigned int v12 = [(PHPhotoLibrary *)self->_photoLibrary mad_useVUGallery];
    photoLibrary = self->_photoLibrary;
    if (v12)
    {
      v14 = [(GDVUVisualUnderstandingService *)self->_vuService gallery];
      id v8 = +[MADPhotosFaceCropProcessingTask taskWithPhotoLibrary:photoLibrary andGallery:v14];
    }
    else
    {
      id v8 = +[MADPhotosFaceCropProcessingTask taskWithPhotoLibrary:self->_photoLibrary andFaceClusterer:self->_faceClusterer];
    }
  }
  return v8;
}

- (id)nextDownloadAssetProcessingTask
{
  v11.receiver = self;
  v11.super_class = (Class)MADPhotosFaceTaskProvider;
  id v3 = [(MADPhotosTaskProvider *)&v11 nextDownloadAssetProcessingTask];
  managementQueue = self->_managementQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10016CCA0;
  v9[3] = &unk_100219D00;
  v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  dispatch_sync(managementQueue, v9);
  id v6 = v10;
  id v7 = v5;

  return v7;
}

- (id)nextClusterProcessingTask
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_10016CE90;
  id v10 = sub_10016CEA0;
  id v11 = 0;
  managementQueue = self->_managementQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10016CEA8;
  v5[3] = &unk_10021E298;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(managementQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)retireTask:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MADPhotosFaceTaskProvider;
  [(MADPhotosTaskProvider *)&v10 retireTask:v4];
  managementQueue = self->_managementQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10016D260;
  v7[3] = &unk_100219D00;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(managementQueue, v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vuService, 0);
  objc_storeStrong((id *)&self->_logPrefix, 0);
  objc_storeStrong((id *)&self->_faceClusterer, 0);
  objc_storeStrong((id *)&self->_managementQueue, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

@end
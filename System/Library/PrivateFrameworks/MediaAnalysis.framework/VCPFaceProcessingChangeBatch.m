@interface VCPFaceProcessingChangeBatch
+ (id)batchForPhotoLibrary:(id)a3 faceClusterer:(id)a4 andContext:(id)a5;
- (BOOL)publishWithError:(id *)a3;
- (VCPFaceProcessingChangeBatch)initWithPhotoLibrary:(id)a3 faceClusterer:(id)a4 andContext:(id)a5;
- (int)updateAsset:(id)a3 withAnalysis:(id)a4;
- (void)_publishPendingChanges;
@end

@implementation VCPFaceProcessingChangeBatch

- (VCPFaceProcessingChangeBatch)initWithPhotoLibrary:(id)a3 faceClusterer:(id)a4 andContext:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    v20.receiver = self;
    v20.super_class = (Class)VCPFaceProcessingChangeBatch;
    v12 = [(VCPFaceProcessingChangeBatch *)&v20 init];
    v13 = v12;
    if (v12)
    {
      objc_storeStrong((id *)&v12->_photoLibrary, a3);
      objc_storeStrong((id *)&v13->_clusterer, a4);
      objc_storeStrong((id *)&v13->_context, a5);
      uint64_t v14 = +[NSMutableArray array];
      pendingChanges = v13->_pendingChanges;
      v13->_pendingChanges = (NSMutableArray *)v14;

      dispatch_queue_t v16 = dispatch_queue_create("com.apple.mediaanalysisd.VCPFaceProcessingChangeBatch", 0);
      publishQueue = v13->_publishQueue;
      v13->_publishQueue = (OS_dispatch_queue *)v16;
    }
    self = v13;
    v18 = self;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (id)batchForPhotoLibrary:(id)a3 faceClusterer:(id)a4 andContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [objc_alloc((Class)objc_opt_class()) initWithPhotoLibrary:v7 faceClusterer:v8 andContext:v9];

  return v10;
}

- (int)updateAsset:(id)a3 withAnalysis:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = objc_msgSend(v7, "vcp_version");
  id v9 = [v6 photoLibrary];
  unsigned int v10 = objc_msgSend(v9, "mad_faceProcessingInternalVersion");

  if (v8 == v10 && (objc_msgSend(v7, "vcp_types") & 4) != 0)
  {
    pendingChanges = self->_pendingChanges;
    v12 = objc_msgSend(v7, "vcp_results");
    v13 = +[VCPFaceProcessingChangeEntry entryWithAsset:v6 andAnalysis:v12];
    [(NSMutableArray *)pendingChanges addObject:v13];
  }
  return 0;
}

- (void)_publishPendingChanges
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = self->_pendingChanges;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v13;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v6);
        id v11 = 0;
        objc_msgSend(v7, "publish:scheduleTorsoOnlyPHFace:", &v11, -[VCPPhotosFaceProcessingContext clusterIncludeTorsoOnlyFaces](self->_context, "clusterIncludeTorsoOnlyFaces"));
        id v8 = v11;
        if (([(PHPhotoLibrary *)self->_photoLibrary vcp_isSyndicationLibrary] & 1) == 0)
        {
          clusterer = self->_clusterer;
          unsigned int v10 = +[NSSet setWithArray:v8];
          [(VCPFaceClusterer *)clusterer scheduleClusteringOfFacesWithLocalIdentifiers:v10];
        }
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
}

- (BOOL)publishWithError:(id *)a3
{
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    uint64_t v5 = VCPLogInstance();
    os_log_type_t v6 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v5, v6))
    {
      id v7 = [(NSMutableArray *)self->_pendingChanges count];
      *(_DWORD *)buf = 134217984;
      id v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "  Publishing PHAssetPropertySetFaceAnalysis for %lu assets", buf, 0xCu);
    }
  }
  publishQueue = self->_publishQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C0374;
  block[3] = &unk_10021CB30;
  block[4] = self;
  block[5] = &v12;
  block[6] = a3;
  dispatch_sync(publishQueue, block);
  char v9 = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_clusterer, 0);
  objc_storeStrong((id *)&self->_publishQueue, 0);
  objc_storeStrong((id *)&self->_pendingChanges, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

@end
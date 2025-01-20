@interface VCPMADVisualSearchAssetProcessingTask
+ (NSString)name;
+ (unint64_t)taskID;
- (BOOL)shouldProcessAsset:(id)a3;
- (VCPMADVisualSearchAssetProcessingTask)initWithLocalIdentifiers:(id)a3 fromPhotoLibraryWithURL:(id)a4 cancelBlock:(id)a5 progressHandler:(id)a6 completionHandler:(id)a7;
- (id)batchWithAnalysisDatabase:(id)a3 allowDownload:(BOOL)a4 cancelBlock:(id)a5;
- (void)dealloc;
@end

@implementation VCPMADVisualSearchAssetProcessingTask

+ (NSString)name
{
  return (NSString *)@"VisualSearch";
}

+ (unint64_t)taskID
{
  return 12;
}

- (VCPMADVisualSearchAssetProcessingTask)initWithLocalIdentifiers:(id)a3 fromPhotoLibraryWithURL:(id)a4 cancelBlock:(id)a5 progressHandler:(id)a6 completionHandler:(id)a7
{
  v13.receiver = self;
  v13.super_class = (Class)VCPMADVisualSearchAssetProcessingTask;
  v7 = [(VCPMADPhotoAssetProcessingTask *)&v13 initWithLocalIdentifiers:a3 fromPhotoLibraryWithURL:a4 cancelBlock:a5 progressHandler:a6 completionHandler:a7];
  if (v7)
  {
    uint64_t v8 = +[VCPObjectPool objectPoolWithAllocator:&stru_100219BC8];
    v9 = *(void **)(v7 + 52);
    *(void *)(v7 + 52) = v8;

    id v10 = objc_alloc_init((Class)VNSession);
    v11 = *(void **)(v7 + 60);
    *(void *)(v7 + 60) = v10;
  }
  return (VCPMADVisualSearchAssetProcessingTask *)v7;
}

- (void)dealloc
{
  v3 = +[VNSession globalSession];
  [v3 releaseCachedResources];

  v4.receiver = self;
  v4.super_class = (Class)VCPMADVisualSearchAssetProcessingTask;
  [(VCPMADVisualSearchAssetProcessingTask *)&v4 dealloc];
}

- (BOOL)shouldProcessAsset:(id)a3
{
  id v3 = a3;
  if (objc_msgSend(v3, "vcp_needsVisualSearchProcessing")) {
    unsigned __int8 v4 = 1;
  }
  else {
    unsigned __int8 v4 = objc_msgSend(v3, "vcp_needsStickerGatingProcessing");
  }

  return v4;
}

- (id)batchWithAnalysisDatabase:(id)a3 allowDownload:(BOOL)a4 cancelBlock:(id)a5
{
  return +[VCPMADVisualSearchAssetBatch batchWithServicePool:*(id *)((char *)&self->super._progressHandler + 4) visionSession:*(VCPObjectPool **)((char *)&self->_servicePool + 4) analysisDatabase:a3 cancelBlock:a5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_servicePool + 4), 0);
  objc_storeStrong((id *)((char *)&self->super._progressHandler + 4), 0);
}

@end
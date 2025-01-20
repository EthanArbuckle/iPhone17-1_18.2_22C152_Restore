@interface VCPMADVisualSearchFetchProcessingTask
+ (NSString)name;
+ (unint64_t)taskID;
- (BOOL)shouldProcessAsset:(id)a3;
- (VCPMADVisualSearchFetchProcessingTask)initWithFetchBlock:(id)a3 photoLibraryWithURL:(id)a4 cancelBlock:(id)a5 progressHandler:(id)a6 completionHandler:(id)a7;
- (id)batchWithAnalysisDatabase:(id)a3 allowDownload:(BOOL)a4 cancelBlock:(id)a5;
- (void)dealloc;
@end

@implementation VCPMADVisualSearchFetchProcessingTask

+ (NSString)name
{
  return (NSString *)@"VisualSearch";
}

+ (unint64_t)taskID
{
  return 12;
}

- (VCPMADVisualSearchFetchProcessingTask)initWithFetchBlock:(id)a3 photoLibraryWithURL:(id)a4 cancelBlock:(id)a5 progressHandler:(id)a6 completionHandler:(id)a7
{
  v13.receiver = self;
  v13.super_class = (Class)VCPMADVisualSearchFetchProcessingTask;
  v7 = [(VCPMADPhotosFetchProcessingTask *)&v13 initWithFetchBlock:a3 photoLibraryWithURL:a4 cancelBlock:a5 progressHandler:a6 completionHandler:a7];
  if (v7)
  {
    uint64_t v8 = +[VCPObjectPool objectPoolWithAllocator:&stru_10021DD00];
    v9 = *(void **)(v7 + 52);
    *(void *)(v7 + 52) = v8;

    id v10 = objc_alloc_init((Class)VNSession);
    v11 = *(void **)(v7 + 60);
    *(void *)(v7 + 60) = v10;
  }
  return (VCPMADVisualSearchFetchProcessingTask *)v7;
}

- (void)dealloc
{
  v3 = +[VNSession globalSession];
  [v3 releaseCachedResources];

  v4.receiver = self;
  v4.super_class = (Class)VCPMADVisualSearchFetchProcessingTask;
  [(VCPMADVisualSearchFetchProcessingTask *)&v4 dealloc];
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
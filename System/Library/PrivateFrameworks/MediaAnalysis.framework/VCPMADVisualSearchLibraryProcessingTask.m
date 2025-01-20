@interface VCPMADVisualSearchLibraryProcessingTask
+ (NSString)name;
+ (id)taskWithPhotoLibraries:(id)a3 cancelBlock:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6;
+ (unint64_t)taskID;
- (BOOL)shouldProcessAsset:(id)a3;
- (VCPMADVisualSearchLibraryProcessingTask)initWithPhotoLibraries:(id)a3 cancelBlock:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6;
- (id)batchWithAnalysisDatabase:(id)a3 allowDownload:(BOOL)a4 cancelBlock:(id)a5;
- (void)dealloc;
@end

@implementation VCPMADVisualSearchLibraryProcessingTask

- (VCPMADVisualSearchLibraryProcessingTask)initWithPhotoLibraries:(id)a3 cancelBlock:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6
{
  v12.receiver = self;
  v12.super_class = (Class)VCPMADVisualSearchLibraryProcessingTask;
  v6 = [(VCPMADPhotosLibraryProcessingTask *)&v12 initWithPhotoLibraries:a3 cancelBlock:a4 progressHandler:a5 andCompletionHandler:a6];
  if (v6)
  {
    uint64_t v7 = +[VCPObjectPool objectPoolWithAllocator:&stru_10021C670];
    v8 = *(void **)(v6 + 44);
    *(void *)(v6 + 44) = v7;

    id v9 = objc_alloc_init((Class)VNSession);
    v10 = *(void **)(v6 + 52);
    *(void *)(v6 + 52) = v9;
  }
  return (VCPMADVisualSearchLibraryProcessingTask *)v6;
}

+ (id)taskWithPhotoLibraries:(id)a3 cancelBlock:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [objc_alloc((Class)objc_opt_class()) initWithPhotoLibraries:v12 cancelBlock:v11 progressHandler:v10 andCompletionHandler:v9];

  return v13;
}

+ (NSString)name
{
  return (NSString *)@"VisualSearch";
}

+ (unint64_t)taskID
{
  return 12;
}

- (void)dealloc
{
  v3 = +[VNSession globalSession];
  [v3 releaseCachedResources];

  v4.receiver = self;
  v4.super_class = (Class)VCPMADVisualSearchLibraryProcessingTask;
  [(VCPMADVisualSearchLibraryProcessingTask *)&v4 dealloc];
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
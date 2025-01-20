@interface MADFullImageFetchProcessingTask
+ (NSString)name;
+ (unint64_t)taskID;
- (BOOL)shouldProcessAsset:(id)a3;
- (MADFullImageFetchProcessingTask)initWithFetchBlock:(id)a3 photoLibraryWithURL:(id)a4 cancelBlock:(id)a5 progressHandler:(id)a6 completionHandler:(id)a7;
- (id)batchWithAnalysisDatabase:(id)a3 allowDownload:(BOOL)a4 cancelBlock:(id)a5;
- (void)dealloc;
@end

@implementation MADFullImageFetchProcessingTask

- (MADFullImageFetchProcessingTask)initWithFetchBlock:(id)a3 photoLibraryWithURL:(id)a4 cancelBlock:(id)a5 progressHandler:(id)a6 completionHandler:(id)a7
{
  id v12 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MADFullImageFetchProcessingTask;
  v13 = [(VCPMADPhotosFetchProcessingTask *)&v18 initWithFetchBlock:a3 photoLibraryWithURL:v12 cancelBlock:a5 progressHandler:a6 completionHandler:a7];
  if (v13)
  {
    v14 = +[VCPPhotoLibraryManager sharedManager];
    uint64_t v15 = [v14 photoLibraryWithURL:v12];
    v16 = *(void **)(v13 + 52);
    *(void *)(v13 + 52) = v15;
  }
  return (MADFullImageFetchProcessingTask *)v13;
}

- (void)dealloc
{
  v3 = +[VNSession globalSession];
  [v3 releaseCachedResources];

  MediaAnalysisPurgeResources();
  v4.receiver = self;
  v4.super_class = (Class)MADFullImageFetchProcessingTask;
  [(MADFullImageFetchProcessingTask *)&v4 dealloc];
}

+ (NSString)name
{
  return (NSString *)@"Full|Image";
}

+ (unint64_t)taskID
{
  return 1;
}

- (BOOL)shouldProcessAsset:(id)a3
{
  id v3 = a3;
  if ([v3 mediaType] == (id)1 && (objc_msgSend(v3, "vcp_isLivePhoto") & 1) == 0) {
    unsigned __int8 v4 = objc_msgSend(v3, "vcp_needsProcessingForTask:", 1);
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (id)batchWithAnalysisDatabase:(id)a3 allowDownload:(BOOL)a4 cancelBlock:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  v9 = [[MADFullAssetBatch alloc] initWithPhotoLibrary:*(id *)((char *)&self->super._progressHandler + 4) database:v8 cancelBlock:v7];

  return v9;
}

- (void).cxx_destruct
{
}

@end
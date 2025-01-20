@interface VCPMADOCRLibraryProcessingTask
+ (NSString)name;
+ (id)taskWithPhotoLibraries:(id)a3 cancelBlock:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6;
+ (unint64_t)taskID;
- (BOOL)shouldProcessAsset:(id)a3;
- (id)assetPriorities;
- (id)batchWithAnalysisDatabase:(id)a3 allowDownload:(BOOL)a4 cancelBlock:(id)a5;
- (void)dealloc;
@end

@implementation VCPMADOCRLibraryProcessingTask

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
  return (NSString *)@"OCR";
}

+ (unint64_t)taskID
{
  return 10;
}

- (void)dealloc
{
  v3 = +[VNSession globalSession];
  [v3 releaseCachedResources];

  +[PHAssetResourceManager vcp_flushFileCache];
  v4.receiver = self;
  v4.super_class = (Class)VCPMADOCRLibraryProcessingTask;
  [(VCPMADOCRLibraryProcessingTask *)&v4 dealloc];
}

- (BOOL)shouldProcessAsset:(id)a3
{
  return objc_msgSend(a3, "vcp_needsOCRProcessing");
}

- (id)batchWithAnalysisDatabase:(id)a3 allowDownload:(BOOL)a4 cancelBlock:(id)a5
{
  return +[VCPMADOCRAssetBatch batchWithAnalysisDatabase:a3 allowDownload:a4 cancelBlock:a5];
}

- (id)assetPriorities
{
  return &off_1002305C0;
}

@end
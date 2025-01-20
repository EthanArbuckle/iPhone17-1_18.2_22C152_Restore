@interface MADPhotosOCRTaskProvider
+ (id)name;
+ (unint64_t)taskID;
- (id)assetPriorities;
- (id)assetTaskWithAnalysisDatabase:(id)a3;
- (void)dealloc;
@end

@implementation MADPhotosOCRTaskProvider

+ (id)name
{
  return @"OCR";
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
  v4.super_class = (Class)MADPhotosOCRTaskProvider;
  [(MADPhotosOCRTaskProvider *)&v4 dealloc];
}

- (id)assetTaskWithAnalysisDatabase:(id)a3
{
  return +[MADPhotosOCRAssetProcessingTask taskWithAnalysisDatabase:a3];
}

- (id)assetPriorities
{
  return &off_1002307D0;
}

@end
@interface MADPhotosVisualSearchTaskProvider
+ (id)name;
+ (unint64_t)taskID;
- (MADPhotosVisualSearchTaskProvider)initWithPhotoLibrary:(id)a3 cancelBlock:(id)a4;
- (id)assetTaskWithAnalysisDatabase:(id)a3;
@end

@implementation MADPhotosVisualSearchTaskProvider

+ (id)name
{
  return @"VisualSearch";
}

+ (unint64_t)taskID
{
  return 12;
}

- (MADPhotosVisualSearchTaskProvider)initWithPhotoLibrary:(id)a3 cancelBlock:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)MADPhotosVisualSearchTaskProvider;
  v4 = [(MADPhotosTaskProvider *)&v10 initWithPhotoLibrary:a3 cancelBlock:a4];
  if (v4)
  {
    uint64_t v5 = +[VCPObjectPool objectPoolWithAllocator:&stru_100219818];
    servicePool = v4->_servicePool;
    v4->_servicePool = (VCPObjectPool *)v5;

    v7 = (VNSession *)objc_alloc_init((Class)VNSession);
    visionSession = v4->_visionSession;
    v4->_visionSession = v7;
  }
  return v4;
}

- (id)assetTaskWithAnalysisDatabase:(id)a3
{
  return +[MADPhotosVisualSearchAssetProcessingTask taskWithServicePool:self->_servicePool visionSession:self->_visionSession analysisDatabase:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visionSession, 0);
  objc_storeStrong((id *)&self->_servicePool, 0);
}

@end
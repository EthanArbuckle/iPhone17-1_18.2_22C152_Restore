@interface MADFullAssetBatch
- (MADFullAssetBatch)initWithPhotoLibrary:(id)a3 database:(id)a4 cancelBlock:(id)a5;
- (int)prepare;
- (int)process;
- (int)publish;
- (unint64_t)count;
- (void)addPhotosAsset:(id)a3 withPreviousStatus:(unint64_t)a4 attempts:(unint64_t)a5 andAttemptDate:(id)a6;
@end

@implementation MADFullAssetBatch

- (MADFullAssetBatch)initWithPhotoLibrary:(id)a3 database:(id)a4 cancelBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MADFullAssetBatch;
  v11 = [(MADFullAssetBatch *)&v16 init];
  if (v11)
  {
    LOBYTE(v15) = 0;
    uint64_t v12 = +[MADPhotosFullAssetProcessingTask taskWithAnalysisDatabase:v9 photoLibrary:v8 progressReporter:0 mediaType:1 mediaSubtype:0 imageOnlyAnalysis:1 downloadAllowed:v15];
    task = v11->_task;
    v11->_task = (MADPhotosFullAssetProcessingTask *)v12;

    [(MADProcessingTask *)v11->_task setCancelBlock:v10];
  }

  return v11;
}

- (unint64_t)count
{
  return [(MADPhotosFullAssetProcessingTask *)self->_task count];
}

- (void)addPhotosAsset:(id)a3 withPreviousStatus:(unint64_t)a4 attempts:(unint64_t)a5 andAttemptDate:(id)a6
{
}

- (int)prepare
{
  [(MADPhotosFullAssetProcessingTask *)self->_task prepare];
  task = self->_task;
  return [(MADPhotosFullAssetProcessingTask *)task status];
}

- (int)process
{
  [(MADPhotosFullAssetProcessingTask *)self->_task process];
  task = self->_task;
  return [(MADPhotosFullAssetProcessingTask *)task status];
}

- (int)publish
{
  [(MADPhotosFullAssetProcessingTask *)self->_task publish];
  task = self->_task;
  return [(MADPhotosFullAssetProcessingTask *)task status];
}

- (void).cxx_destruct
{
}

@end
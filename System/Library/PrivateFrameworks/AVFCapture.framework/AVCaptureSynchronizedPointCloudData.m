@interface AVCaptureSynchronizedPointCloudData
- (AVPointCloudData)pointCloudData;
- (BOOL)pointCloudDataWasDropped;
- (id)_initWithPointCloudDataBuffer:(id)a3 timestamp:(id *)a4 pointCloudDataWasDropped:(BOOL)a5 droppedReason:(int64_t)a6;
- (int64_t)droppedReason;
- (void)dealloc;
@end

@implementation AVCaptureSynchronizedPointCloudData

- (id)_initWithPointCloudDataBuffer:(id)a3 timestamp:(id *)a4 pointCloudDataWasDropped:(BOOL)a5 droppedReason:(int64_t)a6
{
  v12.receiver = self;
  v12.super_class = (Class)AVCaptureSynchronizedPointCloudData;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11 = *a4;
  v9 = [(AVCaptureSynchronizedData *)&v12 _initWithTimestamp:&v11];
  if (v9)
  {
    v9[2] = a3;
    *((unsigned char *)v9 + 24) = a5;
    v9[4] = a6;
  }
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVCaptureSynchronizedPointCloudData;
  [(AVCaptureSynchronizedData *)&v3 dealloc];
}

- (AVPointCloudData)pointCloudData
{
  v2 = self->_pointCloudData;

  return v2;
}

- (BOOL)pointCloudDataWasDropped
{
  return self->_pointCloudDataWasDropped;
}

- (int64_t)droppedReason
{
  return self->_droppedReason;
}

@end
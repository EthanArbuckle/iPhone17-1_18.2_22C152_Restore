@interface CPLEngineResourceUploadTask
- (BOOL)isBackgroundTask;
- (CPLEngineTransportTask)transportTask;
- (CPLResource)cloudResource;
- (void)setBackgroundTask:(BOOL)a3;
- (void)setCloudResource:(id)a3;
- (void)setTransportTask:(id)a3;
@end

@implementation CPLEngineResourceUploadTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportTask, 0);
  objc_storeStrong((id *)&self->_cloudResource, 0);
}

- (void)setTransportTask:(id)a3
{
}

- (CPLEngineTransportTask)transportTask
{
  return self->_transportTask;
}

- (void)setBackgroundTask:(BOOL)a3
{
  self->_backgroundTask = a3;
}

- (BOOL)isBackgroundTask
{
  return self->_backgroundTask;
}

- (void)setCloudResource:(id)a3
{
}

- (CPLResource)cloudResource
{
  return self->_cloudResource;
}

@end
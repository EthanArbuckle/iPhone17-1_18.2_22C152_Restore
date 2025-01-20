@interface SGRequestContext
- (NSOperationQueue)processingQueue;
- (NSOperationQueue)storageQueue;
- (SGRequestContext)initWithServiceContext:(id)a3 concurrencyBehavior:(int)a4 backpressureHazard:(int)a5;
- (SGRequestContext)initWithServiceContext:(id)a3 concurrencyBehavior:(int)a4 backpressureHazard:(int)a5 extractionMode:(int)a6;
- (SGServiceContext)serviceContext;
- (int)backpressureHazard;
- (int)concurrencyBehavior;
- (int)extractionMode;
@end

@implementation SGRequestContext

- (void).cxx_destruct
{
}

- (int)extractionMode
{
  return self->_extractionMode;
}

- (int)backpressureHazard
{
  return self->_backpressureHazard;
}

- (int)concurrencyBehavior
{
  return self->_concurrencyBehavior;
}

- (SGServiceContext)serviceContext
{
  return self->_serviceContext;
}

- (SGRequestContext)initWithServiceContext:(id)a3 concurrencyBehavior:(int)a4 backpressureHazard:(int)a5 extractionMode:(int)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SGRequestContext;
  v12 = [(SGRequestContext *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_serviceContext, a3);
    v13->_concurrencyBehavior = a4;
    v13->_backpressureHazard = a5;
    v13->_extractionMode = a6;
  }

  return v13;
}

- (SGRequestContext)initWithServiceContext:(id)a3 concurrencyBehavior:(int)a4 backpressureHazard:(int)a5
{
  return [(SGRequestContext *)self initWithServiceContext:a3 concurrencyBehavior:*(void *)&a4 backpressureHazard:*(void *)&a5 extractionMode:0];
}

- (NSOperationQueue)storageQueue
{
  if ([(SGRequestContext *)self concurrencyBehavior])
  {
    v4 = +[SGPipeline sharedBackgroundStorageQueue];
  }
  else
  {
    v5 = self;
    objc_sync_enter(v5);
    v4 = objc_getAssociatedObject(v5, a2);
    if (!v4)
    {
      v4 = objc_opt_new();
      [v4 setMaxConcurrentOperationCount:1];
      objc_setAssociatedObject(v5, a2, v4, (void *)1);
    }
    objc_sync_exit(v5);
  }
  return (NSOperationQueue *)v4;
}

- (NSOperationQueue)processingQueue
{
  if ([(SGRequestContext *)self concurrencyBehavior])
  {
    v4 = +[SGPipeline sharedBackgroundProcessingQueue];
  }
  else
  {
    v5 = self;
    objc_sync_enter(v5);
    v4 = objc_getAssociatedObject(v5, a2);
    if (!v4)
    {
      v4 = objc_opt_new();
      [v4 setMaxConcurrentOperationCount:-1];
      objc_setAssociatedObject(v5, a2, v4, (void *)1);
    }
    objc_sync_exit(v5);
  }
  return (NSOperationQueue *)v4;
}

@end
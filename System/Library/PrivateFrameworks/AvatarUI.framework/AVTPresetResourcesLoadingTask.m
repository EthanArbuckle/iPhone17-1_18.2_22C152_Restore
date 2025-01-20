@interface AVTPresetResourcesLoadingTask
- (AVTPresetResourcesLoadingTask)initWithPresetResources:(id)a3 completionHandler:(id)a4;
- (BOOL)isCanceled;
- (NSArray)presetResources;
- (id)completionHandler;
- (void)cancel;
- (void)setCanceled:(BOOL)a3;
@end

@implementation AVTPresetResourcesLoadingTask

- (AVTPresetResourcesLoadingTask)initWithPresetResources:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AVTPresetResourcesLoadingTask;
  v9 = [(AVTPresetResourcesLoadingTask *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_presetResources, a3);
    uint64_t v11 = [v8 copy];
    id completionHandler = v10->_completionHandler;
    v10->_id completionHandler = (id)v11;
  }
  return v10;
}

- (void)cancel
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (BOOL)isCanceled
{
  return self->canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->canceled = a3;
}

- (NSArray)presetResources
{
  return self->_presetResources;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presetResources, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
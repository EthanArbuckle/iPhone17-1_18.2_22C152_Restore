@interface CPLPushToTransportSyncStep
- (BOOL)highPriority;
- (CPLPushToTransportSyncStep)initWithSyncManager:(id)a3 syncSession:(id)a4 highPriority:(BOOL)a5;
- (id)newTask;
- (void)cancelAllTasks:(BOOL)a3;
@end

@implementation CPLPushToTransportSyncStep

- (BOOL)highPriority
{
  return self->_highPriority;
}

- (id)newTask
{
  v5.receiver = self;
  v5.super_class = (Class)CPLPushToTransportSyncStep;
  id v3 = [(CPLSimpleTaskSyncStep *)&v5 newTask];
  [v3 setHighPriority:self->_highPriority];
  return v3;
}

- (void)cancelAllTasks:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CPLSimpleTaskSyncStep *)self currentTask];
  [v4 cancel:v3];
}

- (CPLPushToTransportSyncStep)initWithSyncManager:(id)a3 syncSession:(id)a4 highPriority:(BOOL)a5
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = objc_opt_class();
  v13.receiver = self;
  v13.super_class = (Class)CPLPushToTransportSyncStep;
  v11 = [(CPLSimpleTaskSyncStep *)&v13 initWithSyncManager:v9 syncSession:v8 taskClass:v10];

  if (v11) {
    v11->_highPriority = a5;
  }
  return v11;
}

@end
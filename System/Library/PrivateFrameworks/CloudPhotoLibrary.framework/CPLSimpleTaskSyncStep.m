@interface CPLSimpleTaskSyncStep
- (BOOL)containsTask:(id)a3;
- (BOOL)didFinishTask:(id)a3 withError:(id)a4 shouldStop:(BOOL *)a5;
- (BOOL)hasTasks;
- (BOOL)launchNecessaryTasks;
- (CPLEngineSyncTask)currentTask;
- (CPLSimpleTaskSyncStep)initWithSyncManager:(id)a3 syncSession:(id)a4 taskClass:(Class)a5;
- (Class)taskClass;
- (id)descriptionForTasks;
- (id)newTask;
- (void)cancelAllTasks:(BOOL)a3;
- (void)moveTasksToBackground;
@end

@implementation CPLSimpleTaskSyncStep

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTask, 0);

  objc_storeStrong((id *)&self->_taskClass, 0);
}

- (CPLEngineSyncTask)currentTask
{
  return self->_currentTask;
}

- (Class)taskClass
{
  return self->_taskClass;
}

- (BOOL)containsTask:(id)a3
{
  return self->_currentTask == a3;
}

- (BOOL)hasTasks
{
  return self->_currentTask != 0;
}

- (void)moveTasksToBackground
{
}

- (BOOL)didFinishTask:(id)a3 withError:(id)a4 shouldStop:(BOOL *)a5
{
  v9 = (CPLEngineSyncTask *)a3;
  id v10 = a4;
  if (self->_currentTask != v9)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLSyncStep.m"];
    [v15 handleFailureInMethod:a2, self, v16, 146, @"Task %@ did finish for %@ but no task has been dispatched", objc_opt_class(), self->_taskClass object file lineNumber description];

    abort();
  }
  v11 = v10;
  self->_currentTask = 0;

  if (v11) {
    [(CPLSyncStep *)self setErrorForSyncSession:v11];
  }
  v12 = [(CPLSyncStep *)self lastError];

  if (v12) {
    *a5 = 1;
  }
  BOOL v13 = self->_currentTask == 0;

  return v13;
}

- (void)cancelAllTasks:(BOOL)a3
{
}

- (BOOL)launchNecessaryTasks
{
  p_currentTask = &self->_currentTask;
  if (self->_currentTask) {
    return 0;
  }
  v5 = [(CPLSimpleTaskSyncStep *)self newTask];
  v6 = *p_currentTask;
  *p_currentTask = v5;

  return [(CPLSyncStep *)self prepareAndLaunchSyncTask:p_currentTask];
}

- (id)descriptionForTasks
{
  v3 = [(CPLEngineSyncTask *)self->_currentTask description];
  v4 = v3;
  if (v3) {
    id v5 = v3;
  }
  else {
    id v5 = (id)[[NSString alloc] initWithFormat:@"<%@ not launched>", self->_taskClass];
  }
  v6 = v5;

  return v6;
}

- (id)newTask
{
  id v3 = objc_alloc(self->_taskClass);
  v4 = [(CPLSyncStep *)self engineLibrary];
  id v5 = [(CPLSyncStep *)self syncSession];
  v6 = (void *)[v3 initWithEngineLibrary:v4 session:v5];

  return v6;
}

- (CPLSimpleTaskSyncStep)initWithSyncManager:(id)a3 syncSession:(id)a4 taskClass:(Class)a5
{
  v9.receiver = self;
  v9.super_class = (Class)CPLSimpleTaskSyncStep;
  v6 = [(CPLSyncStep *)&v9 initWithSyncManager:a3 syncSession:a4];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_taskClass, a5);
  }
  return v7;
}

@end
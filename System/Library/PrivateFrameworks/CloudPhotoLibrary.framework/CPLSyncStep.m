@interface CPLSyncStep
- (BOOL)containsTask:(id)a3;
- (BOOL)didFinishTask:(id)a3 withError:(id)a4 shouldStop:(BOOL *)a5;
- (BOOL)hasTasks;
- (BOOL)launchNecessaryTasks;
- (BOOL)prepareAndLaunchSyncTask:(id *)a3;
- (CPLEngineLibrary)engineLibrary;
- (CPLEngineStore)engineStore;
- (CPLEngineSyncManager)syncManager;
- (CPLSyncSession)syncSession;
- (CPLSyncStep)initWithSyncManager:(id)a3 syncSession:(id)a4;
- (NSError)lastError;
- (NSString)descriptionForTasks;
- (void)cancelAllTasks:(BOOL)a3;
- (void)moveTasksToBackground;
- (void)setErrorForSyncSession:(id)a3;
- (void)task:(id)a3 didFinishWithError:(id)a4;
- (void)task:(id)a3 didProgress:(float)a4 userInfo:(id)a5;
@end

@implementation CPLSyncStep

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncSession, 0);
  objc_storeStrong((id *)&self->_syncManager, 0);
}

- (CPLSyncSession)syncSession
{
  return self->_syncSession;
}

- (CPLEngineSyncManager)syncManager
{
  return self->_syncManager;
}

- (BOOL)containsTask:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLSyncStep.m"];
  [v6 handleFailureInMethod:a2 object:self file:v7 lineNumber:98 description:@"This should be implemented by subclasses"];

  abort();
}

- (BOOL)hasTasks
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  id v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLSyncStep.m"];
  [v4 handleFailureInMethod:a2 object:self file:v5 lineNumber:94 description:@"This should be implemented by subclasses"];

  abort();
}

- (NSError)lastError
{
  return (NSError *)[(CPLEngineSyncManager *)self->_syncManager lastErrorUnlocked];
}

- (void)setErrorForSyncSession:(id)a3
{
}

- (BOOL)prepareAndLaunchSyncTask:(id *)a3
{
  if (*a3)
  {
    if (-[CPLEngineSyncManager prepareAndLaunchSyncTaskUnlocked:](self->_syncManager, "prepareAndLaunchSyncTaskUnlocked:"))
    {
      return 1;
    }
    id v5 = *a3;
    *a3 = 0;
  }
  return 0;
}

- (void)task:(id)a3 didProgress:(float)a4 userInfo:(id)a5
{
}

- (void)task:(id)a3 didFinishWithError:(id)a4
{
}

- (void)moveTasksToBackground
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  id v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLSyncStep.m"];
  [v4 handleFailureInMethod:a2 object:self file:v5 lineNumber:63 description:@"This should be implemented by subclasses"];

  abort();
}

- (BOOL)didFinishTask:(id)a3 withError:(id)a4 shouldStop:(BOOL *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [MEMORY[0x1E4F28B00] currentHandler];
  v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLSyncStep.m"];
  [v10 handleFailureInMethod:a2 object:self file:v11 lineNumber:59 description:@"This should be implemented by subclasses"];

  abort();
}

- (void)cancelAllTasks:(BOOL)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLSyncStep.m"];
  [v5 handleFailureInMethod:a2 object:self file:v6 lineNumber:55 description:@"This should be implemented by subclasses"];

  abort();
}

- (BOOL)launchNecessaryTasks
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  id v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLSyncStep.m"];
  [v4 handleFailureInMethod:a2 object:self file:v5 lineNumber:50 description:@"This should be implemented by subclasses"];

  abort();
}

- (NSString)descriptionForTasks
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  id v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLSyncStep.m"];
  [v4 handleFailureInMethod:a2 object:self file:v5 lineNumber:41 description:@"This should be implemented by subclasses"];

  abort();
}

- (CPLEngineStore)engineStore
{
  v2 = [(CPLEngineSyncManager *)self->_syncManager engineLibrary];
  v3 = [v2 store];

  return (CPLEngineStore *)v3;
}

- (CPLEngineLibrary)engineLibrary
{
  return [(CPLEngineSyncManager *)self->_syncManager engineLibrary];
}

- (CPLSyncStep)initWithSyncManager:(id)a3 syncSession:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CPLSyncStep;
  id v9 = [(CPLSyncStep *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_syncManager, a3);
    objc_storeStrong((id *)&v10->_syncSession, a4);
  }

  return v10;
}

@end
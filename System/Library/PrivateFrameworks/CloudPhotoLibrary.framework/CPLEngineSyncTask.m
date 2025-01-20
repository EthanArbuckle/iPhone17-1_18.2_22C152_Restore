@interface CPLEngineSyncTask
+ (id)taskWithEngineLibrary:(id)a3 session:(id)a4;
- (BOOL)forceSync;
- (BOOL)foreground;
- (BOOL)isCancelled;
- (CPLEngineLibrary)engineLibrary;
- (CPLEngineStoreUserIdentifier)transportUserIdentifier;
- (CPLEngineSyncTask)initWithEngineLibrary:(id)a3 session:(id)a4;
- (CPLEngineSyncTaskDelegate)delegate;
- (CPLSyncSession)session;
- (NSArray)scopesForTask;
- (NSString)phaseDescription;
- (NSString)taskIdentifier;
- (id)description;
- (id)phaseDescriptionLastChangeDate:(id *)a3;
- (unint64_t)diskPressureState;
- (void)_setCancelled:(BOOL)a3;
- (void)cancel;
- (void)launch;
- (void)launchTransportTask:(id)a3 withTransportGroup:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setForceSync:(BOOL)a3;
- (void)setForeground:(BOOL)a3;
- (void)setPhaseDescription:(id)a3;
- (void)setTransportUserIdentifier:(id)a3;
- (void)taskDidFinishWithError:(id)a3;
- (void)taskDidProgress:(float)a3 userInfo:(id)a4;
@end

@implementation CPLEngineSyncTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportUserIdentifier, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_engineLibrary, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_phaseDescription, 0);
  objc_storeStrong((id *)&self->_lastChangeDateForPhaseDescription, 0);
}

- (void)_setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)setForceSync:(BOOL)a3
{
  self->_forceSync = a3;
}

- (BOOL)forceSync
{
  return self->_forceSync;
}

- (void)setForeground:(BOOL)a3
{
  self->_foreground = a3;
}

- (BOOL)foreground
{
  return self->_foreground;
}

- (void)setTransportUserIdentifier:(id)a3
{
}

- (CPLEngineStoreUserIdentifier)transportUserIdentifier
{
  return self->_transportUserIdentifier;
}

- (CPLSyncSession)session
{
  return self->_session;
}

- (CPLEngineLibrary)engineLibrary
{
  return self->_engineLibrary;
}

- (void)setDelegate:(id)a3
{
}

- (CPLEngineSyncTaskDelegate)delegate
{
  return (CPLEngineSyncTaskDelegate *)objc_getProperty(self, a2, 40, 1);
}

- (id)description
{
  id v22 = 0;
  v3 = [(CPLEngineSyncTask *)self phaseDescriptionLastChangeDate:&v22];
  id v4 = v22;
  v5 = v4;
  if (v3)
  {
    if (v4)
    {
      [v4 timeIntervalSinceNow];
      if (v6 < -10.0)
      {
        v7 = NSString;
        uint64_t v8 = objc_opt_class();
        v9 = [(CPLEngineSyncTask *)self taskIdentifier];
        v10 = +[CPLDateFormatter stringForTimeIntervalAgo:v5 now:0];
        [v7 stringWithFormat:@"<%@ %@ %@ %@>", v8, v9, v3, v10];
        v16 = LABEL_9:;

        goto LABEL_12;
      }
    }
    v11 = NSString;
    uint64_t v12 = objc_opt_class();
    v9 = [(CPLEngineSyncTask *)self taskIdentifier];
    [v11 stringWithFormat:@"<%@ %@ %@>", v12, v9, v3];
  }
  else
  {
    if (v4)
    {
      [v4 timeIntervalSinceNow];
      if (v13 < -10.0)
      {
        v14 = NSString;
        uint64_t v15 = objc_opt_class();
        v9 = [(CPLEngineSyncTask *)self taskIdentifier];
        v10 = +[CPLDateFormatter stringForTimeIntervalAgo:v5 now:0];
        [v14 stringWithFormat:@"<%@ %@ %@>", v15, v9, v10, v21];
        goto LABEL_9;
      }
    }
    v17 = NSString;
    uint64_t v18 = objc_opt_class();
    v9 = [(CPLEngineSyncTask *)self taskIdentifier];
    [v17 stringWithFormat:@"<%@ %@>", v18, v9, v20];
  v16 = };
LABEL_12:

  return v16;
}

- (void)setPhaseDescription:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  os_unfair_lock_lock(&self->_phaseDescriptionLock);
  phaseDescription = self->_phaseDescription;
  self->_phaseDescription = v4;
  double v6 = v4;

  v7 = [MEMORY[0x1E4F1C9C8] date];
  lastChangeDateForPhaseDescription = self->_lastChangeDateForPhaseDescription;
  self->_lastChangeDateForPhaseDescription = v7;

  os_unfair_lock_unlock(&self->_phaseDescriptionLock);
}

- (NSString)phaseDescription
{
  p_phaseDescriptionLock = &self->_phaseDescriptionLock;
  os_unfair_lock_lock(&self->_phaseDescriptionLock);
  id v4 = self->_phaseDescription;
  os_unfair_lock_unlock(p_phaseDescriptionLock);
  return v4;
}

- (id)phaseDescriptionLastChangeDate:(id *)a3
{
  p_phaseDescriptionLock = &self->_phaseDescriptionLock;
  os_unfair_lock_lock(&self->_phaseDescriptionLock);
  lastChangeDateForPhaseDescription = self->_lastChangeDateForPhaseDescription;
  v7 = self->_phaseDescription;
  uint64_t v8 = lastChangeDateForPhaseDescription;
  os_unfair_lock_unlock(p_phaseDescriptionLock);
  v9 = v8;
  *a3 = v9;

  return v7;
}

- (NSArray)scopesForTask
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (void)taskDidProgress:(float)a3 userInfo:(id)a4
{
  id v6 = a4;
  id v8 = [(CPLEngineSyncTask *)self delegate];
  *(float *)&double v7 = a3;
  [v8 task:self didProgress:v6 userInfo:v7];
}

- (void)taskDidFinishWithError:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (self->_hasFinishedTask)
  {
    if (!_CPLSilentLogging)
    {
      v9 = __CPLTaskOSLogDomain_14840();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        uint64_t v15 = self;
        __int16 v16 = 2112;
        v17 = v10;
        _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_ERROR, "%@ called %@ twice", buf, 0x16u);
      }
    }
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineSyncTask.m"];
    double v13 = NSStringFromSelector(a2);
    [v11 handleFailureInMethod:a2, self, v12, 80, @"%@ called %@ twice", self, v13 object file lineNumber description];

    abort();
  }
  id v6 = v5;
  self->_hasFinishedTask = 1;
  if (!v5)
  {
    if ([(CPLEngineSyncTask *)self isCancelled])
    {
      id v6 = +[CPLErrors operationCancelledError];
    }
    else
    {
      id v6 = 0;
    }
  }
  if (!_CPLSilentLogging)
  {
    double v7 = __CPLTaskOSLogDomain_14840();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v15 = self;
      __int16 v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_DEBUG, "%@ did finish with error: %@", buf, 0x16u);
    }
  }
  id v8 = [(CPLEngineSyncTask *)self delegate];
  [v8 task:self didFinishWithError:v6];

  [(CPLEngineSyncTask *)self setDelegate:0];
}

- (void)cancel
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    v3 = __CPLTaskOSLogDomain_14840();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      int v4 = 138412290;
      id v5 = self;
      _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_DEBUG, "%@ has been cancelled", (uint8_t *)&v4, 0xCu);
    }
  }
  [(CPLEngineSyncTask *)self _setCancelled:1];
}

- (void)launch
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    v3 = __CPLTaskOSLogDomain_14840();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      int v4 = 138412290;
      id v5 = self;
      _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_DEBUG, "%@ launched", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (NSString)taskIdentifier
{
  int v4 = [MEMORY[0x1E4F28B00] currentHandler];
  id v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineSyncTask.m"];
  uint64_t v6 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, v5, 66, @"%@ should be overridden by %@", v6, objc_opt_class() object file lineNumber description];

  abort();
}

- (unint64_t)diskPressureState
{
  v2 = [(CPLEngineSyncTask *)self engineLibrary];
  v3 = [v2 systemMonitor];
  unint64_t v4 = [v3 diskPressureState];

  return v4;
}

- (void)launchTransportTask:(id)a3 withTransportGroup:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  objc_msgSend(v8, "setForeground:", -[CPLEngineSyncTask foreground](self, "foreground"));
  objc_msgSend(v8, "setForcedTask:", -[CPLEngineSyncTask forceSync](self, "forceSync"));
  [v8 setTransportUserIdentifier:self->_transportUserIdentifier];
  [v8 setTransportGroup:v6];

  double v7 = [(CPLEngineSyncTask *)self session];
  [v8 runWithinSyncSession:v7];

  if ([(CPLEngineSyncTask *)self isCancelled]) {
    [v8 cancel];
  }
}

- (CPLEngineSyncTask)initWithEngineLibrary:(id)a3 session:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CPLEngineSyncTask;
  v9 = [(CPLEngineSyncTask *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_engineLibrary, a3);
    objc_storeStrong((id *)&v10->_session, a4);
    v10->_phaseDescriptionLock._os_unfair_lock_opaque = 0;
    uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
    lastChangeDateForPhaseDescription = v10->_lastChangeDateForPhaseDescription;
    v10->_lastChangeDateForPhaseDescription = (NSDate *)v11;
  }
  return v10;
}

+ (id)taskWithEngineLibrary:(id)a3 session:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithEngineLibrary:v7 session:v6];

  return v8;
}

@end
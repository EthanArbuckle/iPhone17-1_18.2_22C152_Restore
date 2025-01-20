@interface CPLSyncBubbleScheduler
- (BOOL)shouldCoalesceServerChangesNotification;
- (BOOL)shouldStartSyncSessionFromState:(unint64_t)a3;
- (id)componentName;
- (id)scheduleNextSyncSessionAtDate:(id)a3;
- (void)closeAndDeactivate:(BOOL)a3 completionHandler:(id)a4;
- (void)noteSyncSession:(id)a3 failedWithError:(id)a4;
- (void)noteSyncSessionSucceeded:(id)a3;
- (void)openWithCompletionHandler:(id)a3;
- (void)schedulePersistedSyncSessionIfAvailableWithCompletionHandler:(id)a3;
@end

@implementation CPLSyncBubbleScheduler

- (BOOL)shouldStartSyncSessionFromState:(unint64_t)a3
{
  return 1;
}

- (BOOL)shouldCoalesceServerChangesNotification
{
  return 0;
}

- (void)openWithCompletionHandler:(id)a3
{
}

- (void)closeAndDeactivate:(BOOL)a3 completionHandler:(id)a4
{
}

- (id)scheduleNextSyncSessionAtDate:(id)a3
{
  dummySession = self->_dummySession;
  if (!dummySession)
  {
    v5 = [(CPLSyncBubbleScheduler *)self abstractObject];
    id v6 = objc_alloc((Class)CPLSyncSession);
    v7 = [v5 configuration];
    v8 = (CPLSyncSession *)[v6 initWithSequenceNumber:0 expectedDate:0 scheduler:v5 configuration:v7 scopeFilter:0];
    v9 = self->_dummySession;
    self->_dummySession = v8;

    dummySession = self->_dummySession;
  }
  return dummySession;
}

- (void)noteSyncSession:(id)a3 failedWithError:(id)a4
{
}

- (void)noteSyncSessionSucceeded:(id)a3
{
}

- (id)componentName
{
  return @"scheduler.syncbubble";
}

- (void)schedulePersistedSyncSessionIfAvailableWithCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
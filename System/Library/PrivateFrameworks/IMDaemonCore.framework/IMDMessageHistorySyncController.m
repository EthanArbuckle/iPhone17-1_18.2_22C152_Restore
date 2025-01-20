@interface IMDMessageHistorySyncController
- (BOOL)ckChatSyncControllerNeedsSync;
- (BOOL)idsTransportLogNeedsSync;
- (BOOL)replayControllerNeedsSync;
- (IMDMessageHistorySyncController)initWithMessageHistorySyncTaskFactory:(id)a3;
- (IMDMessageHistorySyncTask)currentlyExecutingSyncTask;
- (IMDMessageHistorySyncTaskFactory)syncTaskFactory;
- (void)IDSTransportLogWantsToSync;
- (void)_evaluateStateAndActIfNeeded;
- (void)_scheduleNextEvaluation;
- (void)ckChatSyncControllerWantsToSync;
- (void)dealloc;
- (void)replayControllerWantsToSync;
- (void)setCkChatSyncControllerNeedsSync:(BOOL)a3;
- (void)setCurrentlyExecutingSyncTask:(id)a3;
- (void)setIdsTransportLogNeedsSync:(BOOL)a3;
- (void)setReplayControllerNeedsSync:(BOOL)a3;
- (void)setSyncTaskFactory:(id)a3;
@end

@implementation IMDMessageHistorySyncController

- (IMDMessageHistorySyncController)initWithMessageHistorySyncTaskFactory:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)IMDMessageHistorySyncController;
  v4 = [(IMDMessageHistorySyncController *)&v9 init];
  if (v4)
  {
    v4->_syncTaskFactory = (IMDMessageHistorySyncTaskFactory *)a3;
    v5 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v4 selector:sel_ckChatSyncControllerWantsToSync name:IMDMessageHistorySyncNotifyCKChatSyncControllerWantsSync object:0];
    v6 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v4 selector:sel_replayControllerWantsToSync name:IMDMessageHistorySyncNotifyReplayControllerWantsSync object:0];
    v7 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v4 selector:sel_IDSTransportLogWantsToSync name:IMDMessageHistorySyncNotifyIDSTransactionLogWantsSync object:0];
  }
  return v4;
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self);

  self->_currentlyExecutingSyncTask = 0;
  self->_syncTaskFactory = 0;
  v3.receiver = self;
  v3.super_class = (Class)IMDMessageHistorySyncController;
  [(IMDMessageHistorySyncController *)&v3 dealloc];
}

- (void)replayControllerWantsToSync
{
  if (IMOSLoggingEnabled())
  {
    objc_super v3 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "ReplayController requested a history Sync", buf, 2u);
    }
  }
  if ([(IMDMessageHistorySyncController *)self replayControllerNeedsSync]
    || (currentlyExecutingSyncTask = self->_currentlyExecutingSyncTask) != 0
    && ![(IMDMessageHistorySyncTask *)currentlyExecutingSyncTask syncTaskType])
  {
    if (IMOSLoggingEnabled())
    {
      v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "ReplayController already has sync in flight ignoring request", v6, 2u);
      }
    }
  }
  else
  {
    [(IMDMessageHistorySyncController *)self setReplayControllerNeedsSync:1];
    [(IMDMessageHistorySyncController *)self _evaluateStateAndActIfNeeded];
  }
}

- (void)IDSTransportLogWantsToSync
{
  if (IMOSLoggingEnabled())
  {
    objc_super v3 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "IDS Transport Log requested a history Sync", buf, 2u);
    }
  }
  if ([(IMDMessageHistorySyncController *)self idsTransportLogNeedsSync]
    || [(IMDMessageHistorySyncTask *)self->_currentlyExecutingSyncTask syncTaskType] == 2)
  {
    if (IMOSLoggingEnabled())
    {
      v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "IDS Transport Log already has sync in flight ignoring request", v5, 2u);
      }
    }
  }
  else
  {
    [(IMDMessageHistorySyncController *)self setIdsTransportLogNeedsSync:1];
    [(IMDMessageHistorySyncController *)self _evaluateStateAndActIfNeeded];
  }
}

- (void)ckChatSyncControllerWantsToSync
{
  if (IMOSLoggingEnabled())
  {
    objc_super v3 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Cloudkit Chat Controller requested a history Sync", buf, 2u);
    }
  }
  if ([(IMDMessageHistorySyncController *)self ckChatSyncControllerNeedsSync]
    || [(IMDMessageHistorySyncTask *)self->_currentlyExecutingSyncTask syncTaskType] == 1)
  {
    if (IMOSLoggingEnabled())
    {
      v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "Cloudkit Chat Controller  already has sync in flight ignoring request", v5, 2u);
      }
    }
  }
  else
  {
    [(IMDMessageHistorySyncController *)self setCkChatSyncControllerNeedsSync:1];
    [(IMDMessageHistorySyncController *)self _evaluateStateAndActIfNeeded];
  }
}

- (void)_evaluateStateAndActIfNeeded
{
  if (IMOSLoggingEnabled())
  {
    objc_super v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Checking if any sync task need to be started", buf, 2u);
    }
  }
  if (self->_currentlyExecutingSyncTask)
  {
    if (IMOSLoggingEnabled())
    {
      v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v5 = "Already performing a sync task, waiting for that to complete before kicking off the next task";
LABEL_8:
        _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, v5, buf, 2u);
        return;
      }
    }
    return;
  }
  if ([(IMDMessageHistorySyncController *)self replayControllerNeedsSync])
  {
    [(IMDMessageHistorySyncController *)self setReplayControllerNeedsSync:0];
    uint64_t v6 = 0;
    goto LABEL_15;
  }
  if ([(IMDMessageHistorySyncController *)self ckChatSyncControllerNeedsSync])
  {
    [(IMDMessageHistorySyncController *)self setCkChatSyncControllerNeedsSync:0];
    uint64_t v6 = 1;
    goto LABEL_15;
  }
  if ([(IMDMessageHistorySyncController *)self idsTransportLogNeedsSync])
  {
    [(IMDMessageHistorySyncController *)self setIdsTransportLogNeedsSync:0];
    uint64_t v6 = 2;
LABEL_15:
    if (IMOSLoggingEnabled())
    {
      v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Starting Sync", buf, 2u);
      }
    }
    v8 = (IMDMessageHistorySyncTask *)[(IMDMessageHistorySyncTaskFactory *)self->_syncTaskFactory newSyncTaskForType:v6];
    self->_currentlyExecutingSyncTask = v8;
    *(void *)buf = 0;
    v11 = buf;
    uint64_t v12 = 0x3052000000;
    v13 = sub_1D984168C;
    v14 = sub_1D984169C;
    v15 = self;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1D98416A8;
    v9[3] = &unk_1E6B77B98;
    v9[4] = buf;
    [(IMDMessageHistorySyncTask *)v8 startSyncTask:v9];
    _Block_object_dispose(buf, 8);
    return;
  }
  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v5 = "No Message History to sync.";
      goto LABEL_8;
    }
  }
}

- (void)_scheduleNextEvaluation
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];

  self->_currentlyExecutingSyncTask = 0;
  if (IMOSLoggingEnabled())
  {
    objc_super v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      int v7 = 4;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Will check in %u seconds if another sync needs to be done", buf, 8u);
    }
  }
  dispatch_time_t v4 = dispatch_time(0, 4000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D9841880;
  block[3] = &unk_1E6B73178;
  block[4] = self;
  dispatch_after(v4, MEMORY[0x1E4F14428], block);
}

- (BOOL)replayControllerNeedsSync
{
  return self->_replayControllerNeedsSync;
}

- (void)setReplayControllerNeedsSync:(BOOL)a3
{
  self->_replayControllerNeedsSync = a3;
}

- (BOOL)ckChatSyncControllerNeedsSync
{
  return self->_ckChatSyncControllerNeedsSync;
}

- (void)setCkChatSyncControllerNeedsSync:(BOOL)a3
{
  self->_ckChatSyncControllerNeedsSync = a3;
}

- (BOOL)idsTransportLogNeedsSync
{
  return self->_idsTransportLogNeedsSync;
}

- (void)setIdsTransportLogNeedsSync:(BOOL)a3
{
  self->_idsTransportLogNeedsSync = a3;
}

- (IMDMessageHistorySyncTask)currentlyExecutingSyncTask
{
  return self->_currentlyExecutingSyncTask;
}

- (void)setCurrentlyExecutingSyncTask:(id)a3
{
}

- (IMDMessageHistorySyncTaskFactory)syncTaskFactory
{
  return self->_syncTaskFactory;
}

- (void)setSyncTaskFactory:(id)a3
{
}

@end
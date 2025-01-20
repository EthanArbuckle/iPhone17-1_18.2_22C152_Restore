@interface IMDMessageProcessingController
- (BOOL)_pref_IMDCoreSpotlightHasMigrated;
- (IMDMessagePTaskStore)pTaskStore;
- (IMDMessageProcessingController)init;
- (IMDMessageProcessingController)initWithMessagesPTaskStore:(id)a3;
- (NSTimer)processingTimer;
- (void)_indexSpotlightIfNeedForPTask:(id)a3;
- (void)_processingTimerFired;
- (void)_scheduleDeferredProcessingWithTimeInterval:(double)a3;
- (void)_xpc_IMDCoreSpotlightAddMessageGUID:(id)a3 reason:(int64_t)a4;
- (void)dealloc;
- (void)messageProcessingTaskAdded:(id)a3;
- (void)scheduleInitialProcessingCheck;
- (void)setPTaskStore:(id)a3;
- (void)setProcessingTimer:(id)a3;
@end

@implementation IMDMessageProcessingController

- (IMDMessageProcessingController)initWithMessagesPTaskStore:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)IMDMessageProcessingController;
  v4 = [(IMDMessageProcessingController *)&v6 init];
  if (v4)
  {
    v4->_pTaskStore = (IMDMessagePTaskStore *)a3;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", v4, sel_messageProcessingTaskAdded_, @"IMDMessagePTaskStoreAddedProcessingTask", 0);
  }
  return v4;
}

- (IMDMessageProcessingController)init
{
  v3 = objc_alloc_init(IMDMessagePTaskXPCStore);
  v4 = [(IMDMessageProcessingController *)self initWithMessagesPTaskStore:v3];

  return v4;
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self);

  self->_pTaskStore = 0;
  [(NSTimer *)self->_processingTimer invalidate];

  self->_processingTimer = 0;
  v3.receiver = self;
  v3.super_class = (Class)IMDMessageProcessingController;
  [(IMDMessageProcessingController *)&v3 dealloc];
}

- (void)scheduleInitialProcessingCheck
{
}

- (void)_xpc_IMDCoreSpotlightAddMessageGUID:(id)a3 reason:(int64_t)a4
{
}

- (BOOL)_pref_IMDCoreSpotlightHasMigrated
{
  return MEMORY[0x1F4123610](self, a2);
}

- (void)_scheduleDeferredProcessingWithTimeInterval:(double)a3
{
  if (a3 > 0.0)
  {
    v10[6] = v6;
    v10[7] = v5;
    v10[10] = v3;
    v10[11] = v4;
    v9 = (void *)[MEMORY[0x1E4F29060] mainThread];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_1D96B52D4;
    v10[3] = &unk_1E6B734A8;
    *(double *)&v10[5] = a3;
    v10[4] = self;
    objc_msgSend(v9, "__im_performBlock:", v10);
  }
}

- (void)_processingTimerFired
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Checking for deferred message processing task", buf, 2u);
    }
  }
  processingTimer = self->_processingTimer;
  if (processingTimer)
  {
    [(NSTimer *)processingTimer invalidate];

    self->_processingTimer = 0;
  }
  uint64_t v5 = (void *)[(IMDMessagePTaskStore *)self->_pTaskStore loadMostRecentMessagePTasks];
  int v6 = IMOSLoggingEnabled();
  if (!v5)
  {
    if (!v6) {
      return;
    }
    v15 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO)) {
      return;
    }
    *(_WORD *)buf = 0;
    v16 = "MessageProcessing: Unable to retrieve ptask from store";
LABEL_28:
    _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, v16, buf, 2u);
    return;
  }
  if (v6)
  {
    v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = [v5 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v23 = v8;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Found %ld messages that need processing", buf, 0xCu);
    }
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v9 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v5);
        }
        [(IMDMessageProcessingController *)self _indexSpotlightIfNeedForPTask:*(void *)(*((void *)&v17 + 1) + 8 * i)];
      }
      uint64_t v9 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }
  [(IMDMessagePTaskStore *)self->_pTaskStore deleteAllCompletedTasks];
  BOOL v12 = [v5 count] == 100;
  int v13 = IMOSLoggingEnabled();
  if (!v12)
  {
    if (!v13) {
      return;
    }
    v15 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO)) {
      return;
    }
    *(_WORD *)buf = 0;
    v16 = "Finished processing deferred messages";
    goto LABEL_28;
  }
  if (v13)
  {
    v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Scheduling next batch of messages to process", buf, 2u);
    }
  }
  [(IMDMessageProcessingController *)self _scheduleDeferredProcessingWithTimeInterval:2.0];
}

- (void)_indexSpotlightIfNeedForPTask:(id)a3
{
  if ([a3 needsProccesingFor:1])
  {
    [a3 compeletedTask:1];
    [(IMDMessagePTaskStore *)self->_pTaskStore updateTaskFlagsForPTask:a3];
    if ([(IMDMessageProcessingController *)self _pref_IMDCoreSpotlightHasMigrated])
    {
      [a3 guid];
      MEMORY[0x1F4181798](self, sel__xpc_IMDCoreSpotlightAddMessageGUID_reason_);
    }
    else if (IMOSLoggingEnabled())
    {
      uint64_t v5 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)int v6 = 0;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Not indexing message, spotlight has not finished migrating yet", v6, 2u);
      }
    }
  }
}

- (void)messageProcessingTaskAdded:(id)a3
{
}

- (IMDMessagePTaskStore)pTaskStore
{
  return self->_pTaskStore;
}

- (void)setPTaskStore:(id)a3
{
}

- (NSTimer)processingTimer
{
  return self->_processingTimer;
}

- (void)setProcessingTimer:(id)a3
{
}

@end
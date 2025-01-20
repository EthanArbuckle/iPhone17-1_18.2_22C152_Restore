@interface IMDMessageHistoryCKChatSyncTask
- (IMDMessageHistoryCKChatSyncTask)initWithCKSyncController:(id)a3;
- (id)syncTaskCompletionBlock;
- (unint64_t)syncTaskType;
- (void)_startICloudSyncWithActivity:(id)a3;
- (void)dealloc;
- (void)setSyncTaskCompletionBlock:(id)a3;
- (void)startSyncTask:(id)a3;
@end

@implementation IMDMessageHistoryCKChatSyncTask

- (IMDMessageHistoryCKChatSyncTask)initWithCKSyncController:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)IMDMessageHistoryCKChatSyncTask;
  v4 = [(IMDMessageHistoryCKChatSyncTask *)&v6 init];
  if (v4) {
    v4->_ckSyncController = (IMDCKSyncController *)a3;
  }
  return v4;
}

- (void)dealloc
{
  self->_ckSyncController = 0;
  self->_syncTaskCompletionBlock = 0;
  v3.receiver = self;
  v3.super_class = (Class)IMDMessageHistoryCKChatSyncTask;
  [(IMDMessageHistoryCKChatSyncTask *)&v3 dealloc];
}

- (void)startSyncTask:(id)a3
{
  if (self->_syncTaskCompletionBlock)
  {
    if (IMOSLoggingEnabled())
    {
      objc_super v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "IMDMessageHistoryCKChatSyncTask: Start sync should not be called more than once.  Ignoring request.", v5, 2u);
      }
    }
  }
  else
  {
    [(IMDMessageHistoryCKChatSyncTask *)self setSyncTaskCompletionBlock:a3];
    MEMORY[0x1F4181798](self, sel__startICloudSyncWithActivity_);
  }
}

- (unint64_t)syncTaskType
{
  return 1;
}

- (void)_startICloudSyncWithActivity:(id)a3
{
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Back online, start syncing chats", buf, 2u);
    }
  }
  [(IMDCKSyncController *)self->_ckSyncController beginComingBackOnlineSyncWithActivity:a3];
  if (self->_syncTaskCompletionBlock)
  {
    dispatch_time_t v6 = dispatch_time(0, 3000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1D96A5D24;
    block[3] = &unk_1E6B73178;
    block[4] = self;
    dispatch_after(v6, MEMORY[0x1E4F14428], block);
  }
}

- (id)syncTaskCompletionBlock
{
  return self->_syncTaskCompletionBlock;
}

- (void)setSyncTaskCompletionBlock:(id)a3
{
}

@end
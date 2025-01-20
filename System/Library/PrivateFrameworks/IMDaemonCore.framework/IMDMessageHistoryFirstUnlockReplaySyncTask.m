@interface IMDMessageHistoryFirstUnlockReplaySyncTask
- (IMDMessageHistoryFirstUnlockReplaySyncTask)initWithReplayController:(id)a3 accountController:(id)a4;
- (unint64_t)syncTaskType;
- (void)_setupAndBeginSync;
- (void)dealloc;
@end

@implementation IMDMessageHistoryFirstUnlockReplaySyncTask

- (IMDMessageHistoryFirstUnlockReplaySyncTask)initWithReplayController:(id)a3 accountController:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)IMDMessageHistoryFirstUnlockReplaySyncTask;
  v5 = [(IMDMessageHistoryIDSTransactionLogSyncTask *)&v7 initWithAccountController:a4];
  if (v5) {
    v5->_replayController = (IMDReplayController *)a3;
  }
  return v5;
}

- (void)dealloc
{
  self->_replayController = 0;
  v3.receiver = self;
  v3.super_class = (Class)IMDMessageHistoryFirstUnlockReplaySyncTask;
  [(IMDMessageHistoryIDSTransactionLogSyncTask *)&v3 dealloc];
}

- (unint64_t)syncTaskType
{
  return 0;
}

- (void)_setupAndBeginSync
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(IMDAccountController *)[(IMDMessageHistoryIDSTransactionLogSyncTask *)self accountController] activeSessions];
  -[IMDMessageHistoryIDSTransactionLogSyncTask setTaskGroupedByServiceName:](self, "setTaskGroupedByServiceName:", objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSArray count](v3, "count")));
  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v18 = [(NSArray *)v3 count];
      _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "IMDMessageHistoryFirstUnlockReplaySyncTask: Begin replaying first unlock database for %ld services", buf, 0xCu);
    }
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v12 + 1) + 8 * v7);
        id v9 = objc_alloc_init(MEMORY[0x1E4F6ABC8]);
        id v10 = [(IMDMessageHistoryIDSTransactionLogSyncTask *)self _createProcessBatchBlockWithServiceSession:v8];
        id v11 = [(IMDMessageHistoryIDSTransactionLogSyncTask *)self _createSyncCompletionBlockForServiceSession:v8];
        [v9 setBatchProcessingBlock:v10];
        [v9 setKnownRecordIDsFromList:0];
        [v9 setCompletionBlock:v11];

        -[NSMutableDictionary setValue:forKey:](-[IMDMessageHistoryIDSTransactionLogSyncTask taskGroupedByServiceName](self, "taskGroupedByServiceName"), "setValue:forKey:", v9, objc_msgSend((id)objc_msgSend(v8, "service"), "internalName"));
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  [(IMDReplayController *)self->_replayController scheduleSyncTaskForServices:[(IMDMessageHistoryIDSTransactionLogSyncTask *)self taskGroupedByServiceName]];
}

@end
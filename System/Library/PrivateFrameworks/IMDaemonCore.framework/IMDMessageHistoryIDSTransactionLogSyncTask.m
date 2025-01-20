@interface IMDMessageHistoryIDSTransactionLogSyncTask
- (IMDAccountController)accountController;
- (IMDMessageHistoryIDSTransactionLogSyncTask)initWithAccountController:(id)a3;
- (NSMutableDictionary)taskGroupedByServiceName;
- (id)_createKnownRecordBlock;
- (id)_createProcessBatchBlockWithServiceSession:(id)a3;
- (id)_createSyncCompletionBlockForServiceSession:(id)a3;
- (id)syncTaskCompletionBlock;
- (unint64_t)syncTaskType;
- (void)_setupAndBeginSync;
- (void)dealloc;
- (void)setAccountController:(id)a3;
- (void)setSyncTaskCompletionBlock:(id)a3;
- (void)setTaskGroupedByServiceName:(id)a3;
- (void)startSyncTask:(id)a3;
@end

@implementation IMDMessageHistoryIDSTransactionLogSyncTask

- (IMDMessageHistoryIDSTransactionLogSyncTask)initWithAccountController:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)IMDMessageHistoryIDSTransactionLogSyncTask;
  v4 = [(IMDMessageHistoryIDSTransactionLogSyncTask *)&v7 init];
  if (v4)
  {
    v5 = (objc_class *)objc_opt_class();
    v4->_className = NSStringFromClass(v5);
    v4->_accountController = (IMDAccountController *)a3;
  }
  return v4;
}

- (void)dealloc
{
  self->_className = 0;
  self->_accountController = 0;

  self->_taskGroupedByServiceName = 0;
  self->_syncTaskCompletionBlock = 0;
  v3.receiver = self;
  v3.super_class = (Class)IMDMessageHistoryIDSTransactionLogSyncTask;
  [(IMDMessageHistoryIDSTransactionLogSyncTask *)&v3 dealloc];
}

- (void)startSyncTask:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_taskGroupedByServiceName)
  {
    if (IMOSLoggingEnabled())
    {
      v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        className = self->_className;
        int v6 = 138412290;
        objc_super v7 = className;
        _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "%@: Start sync should not be called more than once.  Ignoring request.", (uint8_t *)&v6, 0xCu);
      }
    }
  }
  else
  {
    [(IMDMessageHistoryIDSTransactionLogSyncTask *)self setSyncTaskCompletionBlock:a3];
    MEMORY[0x1F4181798](self, sel__setupAndBeginSync);
  }
}

- (unint64_t)syncTaskType
{
  return 2;
}

- (void)_setupAndBeginSync
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  obuint64_t j = [(IMDAccountController *)self->_accountController activeSessions];
  -[IMDMessageHistoryIDSTransactionLogSyncTask setTaskGroupedByServiceName:](self, "setTaskGroupedByServiceName:", objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSArray count](obj, "count")));
  if (IMOSLoggingEnabled())
  {
    objc_super v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      className = self->_className;
      *(_DWORD *)buf = 138412546;
      v35 = className;
      __int16 v36 = 2048;
      uint64_t v37 = [(NSArray *)obj count];
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "%@: Begin syncing IDS transaction log history for %ld services", buf, 0x16u);
    }
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v29 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v9 = objc_alloc_init(MEMORY[0x1E4F6ABC8]);
        id v10 = [(IMDMessageHistoryIDSTransactionLogSyncTask *)self _createProcessBatchBlockWithServiceSession:v8];
        id v11 = [(IMDMessageHistoryIDSTransactionLogSyncTask *)self _createKnownRecordBlock];
        id v12 = [(IMDMessageHistoryIDSTransactionLogSyncTask *)self _createSyncCompletionBlockForServiceSession:v8];
        [v9 setBatchProcessingBlock:v10];
        [v9 setKnownRecordIDsFromList:v11];
        [v9 setCompletionBlock:v12];

        -[NSMutableDictionary setValue:forKey:](self->_taskGroupedByServiceName, "setValue:forKey:", v9, objc_msgSend((id)objc_msgSend(v8, "service"), "internalName"));
      }
      uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v5);
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v13 = [(NSArray *)obj countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v13)
  {
    uint64_t v15 = *(void *)v25;
    *(void *)&long long v14 = 138412546;
    long long v22 = v14;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v24 + 1) + 8 * j);
        uint64_t v18 = -[NSMutableDictionary objectForKeyedSubscript:](self->_taskGroupedByServiceName, "objectForKeyedSubscript:", objc_msgSend((id)objc_msgSend(v17, "service", v22), "internalName"));
        if (IMOSLoggingEnabled())
        {
          v19 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            v20 = self->_className;
            uint64_t v21 = objc_msgSend((id)objc_msgSend(v17, "service"), "internalName");
            *(_DWORD *)buf = v22;
            v35 = v20;
            __int16 v36 = 2112;
            uint64_t v37 = v21;
            _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "%@: Starting sync task for %@ service ", buf, 0x16u);
          }
        }
        [v17 scheduleTransactionLogTask:v18];
      }
      uint64_t v13 = [(NSArray *)obj countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v13);
  }
}

- (id)_createProcessBatchBlockWithServiceSession:(id)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1D96A4F6C;
  v4[3] = &unk_1E6B73108;
  v4[4] = self;
  v4[5] = a3;
  return (id)[v4 copy];
}

- (id)_createKnownRecordBlock
{
  return (id)[&unk_1F33906A0 copy];
}

- (id)_createSyncCompletionBlockForServiceSession:(id)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1D96A52E8;
  v4[3] = &unk_1E6B73150;
  v4[4] = self;
  v4[5] = a3;
  return (id)[v4 copy];
}

- (IMDAccountController)accountController
{
  return self->_accountController;
}

- (void)setAccountController:(id)a3
{
}

- (NSMutableDictionary)taskGroupedByServiceName
{
  return self->_taskGroupedByServiceName;
}

- (void)setTaskGroupedByServiceName:(id)a3
{
}

- (id)syncTaskCompletionBlock
{
  return self->_syncTaskCompletionBlock;
}

- (void)setSyncTaskCompletionBlock:(id)a3
{
}

@end
@interface IMDMessageHistorySyncTaskLiveFactory
- (IMDMessageHistorySyncTaskLiveFactory)init;
- (id)_initWithCKSyncController:(id)a3 accountController:(id)a4 replayController:(id)a5;
- (id)_newFirstUnlockReplaySyncTask;
- (id)_newIDSTransactionLogSyncTask;
- (id)_newKChatSyncTask;
- (id)newSyncTaskForType:(unint64_t)a3;
- (void)dealloc;
@end

@implementation IMDMessageHistorySyncTaskLiveFactory

- (IMDMessageHistorySyncTaskLiveFactory)init
{
  +[IMDCKSyncController sharedInstance];
  +[IMDAccountController sharedInstance];
  +[IMDReplayController sharedInstance];

  return (IMDMessageHistorySyncTaskLiveFactory *)MEMORY[0x1F4181798](self, sel__initWithCKSyncController_accountController_replayController_);
}

- (void)dealloc
{
  self->_ckSyncController = 0;
  self->_accountController = 0;
  self->_replayController = 0;
  v3.receiver = self;
  v3.super_class = (Class)IMDMessageHistorySyncTaskLiveFactory;
  [(IMDMessageHistorySyncTaskLiveFactory *)&v3 dealloc];
}

- (id)_initWithCKSyncController:(id)a3 accountController:(id)a4 replayController:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)IMDMessageHistorySyncTaskLiveFactory;
  v8 = [(IMDMessageHistorySyncTaskLiveFactory *)&v10 init];
  if (v8)
  {
    v8->_ckSyncController = (IMDCKSyncController *)a3;
    v8->_accountController = (IMDAccountController *)a4;
    v8->_replayController = (IMDReplayController *)a5;
  }
  return v8;
}

- (id)newSyncTaskForType:(unint64_t)a3
{
  if (a3 == 2) {
    return (id)MEMORY[0x1F4181798](self, sel__newIDSTransactionLogSyncTask);
  }
  if (a3 == 1) {
    return (id)MEMORY[0x1F4181798](self, sel__newKChatSyncTask);
  }
  if (a3) {
    return 0;
  }
  return (id)MEMORY[0x1F4181798](self, sel__newFirstUnlockReplaySyncTask);
}

- (id)_newKChatSyncTask
{
  v2 = [IMDMessageHistoryCKChatSyncTask alloc];

  return (id)MEMORY[0x1F4181798](v2, sel_initWithCKSyncController_);
}

- (id)_newFirstUnlockReplaySyncTask
{
  v2 = [[IMDMessageHistoryFirstUnlockReplaySyncTask alloc] initWithReplayController:self->_replayController accountController:self->_accountController];
  objc_opt_isKindOfClass();
  return v2;
}

- (id)_newIDSTransactionLogSyncTask
{
  v2 = [IMDMessageHistoryIDSTransactionLogSyncTask alloc];

  return (id)MEMORY[0x1F4181798](v2, sel_initWithAccountController_);
}

@end
@interface IMDCKInitialMessageSyncController
- (BOOL)_deviceConditionsAllowsMessageSyncForActivity:(id)a3 deviceConditionsToCheck:(unint64_t)a4 currentBatchCount:(int64_t)a5 maxBatchCount:(int64_t)a6;
- (BOOL)_deviceConditionsAllowsMessageSyncForCurrentBatchCount:(int64_t)a3 maxBatchCount:(int64_t)a4;
- (BOOL)_kickOffWriteIfNeededForSyncType:(int64_t)a3 activity:(id)a4 completion:(id)a5;
- (CKServerChangeToken)syncToken;
- (id)ckUtilities;
- (id)latestSyncToken;
- (void)setSyncToken:(id)a3;
- (void)syncMessagesWithSyncType:(int64_t)a3 deviceConditionsToCheck:(unint64_t)a4 activity:(id)a5 completionBlock:(id)a6;
@end

@implementation IMDCKInitialMessageSyncController

- (void)syncMessagesWithSyncType:(int64_t)a3 deviceConditionsToCheck:(unint64_t)a4 activity:(id)a5 completionBlock:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  [(IMDCKInitialMessageSyncController *)self setSyncToken:0];
  v12.receiver = self;
  v12.super_class = (Class)IMDCKInitialMessageSyncController;
  [(IMDCKMessageSyncController *)&v12 syncMessagesWithSyncType:a3 deviceConditionsToCheck:a4 activity:v11 completionBlock:v10];
}

- (id)latestSyncToken
{
  return (id)MEMORY[0x1F4181798](self, sel_syncToken);
}

- (BOOL)_deviceConditionsAllowsMessageSyncForCurrentBatchCount:(int64_t)a3 maxBatchCount:(int64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v5 = [(IMDCKInitialMessageSyncController *)self ckUtilities];
  int v6 = [v5 cloudKitSyncingEnabled];

  v7 = [(IMDCKInitialMessageSyncController *)self ckUtilities];
  int v8 = [v7 iCloudAccountMatchesiMessageAccount];

  if (IMOSLoggingEnabled())
  {
    v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = @"NO";
      if (v6) {
        id v11 = @"YES";
      }
      else {
        id v11 = @"NO";
      }
      if (v8) {
        id v10 = @"YES";
      }
      int v13 = 138412546;
      v14 = v11;
      __int16 v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Initial sync device conditions check if CloudKit sync is enabled: %@ has accounts %@", (uint8_t *)&v13, 0x16u);
    }
  }
  return v6 & v8;
}

- (BOOL)_deviceConditionsAllowsMessageSyncForActivity:(id)a3 deviceConditionsToCheck:(unint64_t)a4 currentBatchCount:(int64_t)a5 maxBatchCount:(int64_t)a6
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  int v8 = [(IMDCKInitialMessageSyncController *)self ckUtilities];
  int v9 = [v8 cloudKitSyncingEnabled];

  id v10 = [(IMDCKInitialMessageSyncController *)self ckUtilities];
  int v11 = [v10 iCloudAccountMatchesiMessageAccount];

  if (IMOSLoggingEnabled())
  {
    objc_super v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v13 = @"NO";
      if (v9) {
        v14 = @"YES";
      }
      else {
        v14 = @"NO";
      }
      if (v11) {
        int v13 = @"YES";
      }
      int v16 = 138412546;
      uint64_t v17 = v14;
      __int16 v18 = 2112;
      v19 = v13;
      _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Initial sync device conditions check if CloudKit sync is enabled: %@, hasAccounts %@", (uint8_t *)&v16, 0x16u);
    }
  }
  return v9 & v11;
}

- (BOOL)_kickOffWriteIfNeededForSyncType:(int64_t)a3 activity:(id)a4 completion:(id)a5
{
  id v6 = a5;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1D985FF40;
  v9[3] = &unk_1E6B73A10;
  v9[4] = self;
  id v10 = v6;
  id v7 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v9);

  return 0;
}

- (id)ckUtilities
{
  return +[IMDCKUtilities sharedInstance];
}

- (CKServerChangeToken)syncToken
{
  return self->_syncToken;
}

- (void)setSyncToken:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
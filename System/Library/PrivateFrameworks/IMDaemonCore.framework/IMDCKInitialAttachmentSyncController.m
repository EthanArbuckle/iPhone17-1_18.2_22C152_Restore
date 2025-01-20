@interface IMDCKInitialAttachmentSyncController
- (BOOL)_deviceConditionsAllowsMessageSync;
- (BOOL)_deviceConditionsAllowsMessageSyncForActivity:(id)a3 deviceConditionsToCheck:(unint64_t)a4 currentBatchCount:(int64_t)a5 maxBatchCount:(int64_t)a6;
- (BOOL)_deviceConditionsAllowsMessageSyncForCurrentBatchCount:(int64_t)a3 maxBatchCount:(int64_t)a4;
- (BOOL)_deviceConditionsAllowsMessageSyncIgnoreFeatureEnabled:(BOOL)a3;
- (BOOL)_kickOffWriteIfNeededForSyncType:(int64_t)a3 activity:(id)a4 completion:(id)a5;
- (CKServerChangeToken)syncToken;
- (id)ckUtilities;
- (id)latestSyncToken;
- (void)setSyncToken:(id)a3;
@end

@implementation IMDCKInitialAttachmentSyncController

- (id)latestSyncToken
{
  return (id)MEMORY[0x1F4181798](self, sel_syncToken);
}

- (BOOL)_deviceConditionsAllowsMessageSyncForCurrentBatchCount:(int64_t)a3 maxBatchCount:(int64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v5 = [(IMDCKInitialAttachmentSyncController *)self ckUtilities];
  int v6 = [v5 cloudKitSyncingEnabled];

  v7 = [(IMDCKInitialAttachmentSyncController *)self ckUtilities];
  int v8 = [v7 iCloudAccountMatchesiMessageAccount];

  if (IMOSLoggingEnabled())
  {
    v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = @"NO";
      if (v6) {
        v11 = @"YES";
      }
      else {
        v11 = @"NO";
      }
      if (v8) {
        v10 = @"YES";
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
  int v8 = [(IMDCKInitialAttachmentSyncController *)self ckUtilities];
  int v9 = [v8 cloudKitSyncingEnabled];

  v10 = [(IMDCKInitialAttachmentSyncController *)self ckUtilities];
  int v11 = [v10 iCloudAccountMatchesiMessageAccount];

  if (IMOSLoggingEnabled())
  {
    v12 = OSLogHandleForIMFoundationCategory();
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

- (BOOL)_deviceConditionsAllowsMessageSync
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = [(IMDCKInitialAttachmentSyncController *)self ckUtilities];
  int v3 = [v2 cloudKitSyncingEnabled];

  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v6[0] = 67109120;
      v6[1] = v3;
      _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "Initial sync device conditions check if CloudKit sync is enabled: %d", (uint8_t *)v6, 8u);
    }
  }
  return v3;
}

- (BOOL)_deviceConditionsAllowsMessageSyncIgnoreFeatureEnabled:(BOOL)a3
{
  if (IMOSLoggingEnabled())
  {
    int v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Initial sync device conditions ignoring feature enabled: always TRUE", v5, 2u);
    }
  }
  return 1;
}

- (BOOL)_kickOffWriteIfNeededForSyncType:(int64_t)a3 activity:(id)a4 completion:(id)a5
{
  id v6 = a4;
  uint64_t v7 = (void (**)(id, uint64_t, void))a5;
  if (IMOSLoggingEnabled())
  {
    int v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Initial sync. Not writing up attachments", v10, 2u);
    }
  }
  if (v7) {
    v7[2](v7, 1, 0);
  }

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
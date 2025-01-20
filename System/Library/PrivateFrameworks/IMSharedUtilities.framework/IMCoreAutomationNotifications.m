@interface IMCoreAutomationNotifications
+ (id)sharedInstance;
- (IMCoreAutomationNotifications)init;
- (int64_t)attachmentsWrittenCount;
- (int64_t)chatsWrittenCount;
- (int64_t)messagesWrittenCount;
- (int64_t)recoverableMessagesWrittenCount;
- (void)addNewAttachmentsSyncedCount:(int64_t)a3;
- (void)addNewChatsSyncedCount:(int64_t)a3;
- (void)addNewMessagesSyncedCount:(int64_t)a3;
- (void)addNewRecoverableMessagesSyncedCount:(int64_t)a3;
- (void)clearSyncCounts;
- (void)postCoreAutomationNotificationFinishedPeriodicSyncNotificationWithStartTime:(id)a3 chatsDidsync:(BOOL)a4 messagesDidSync:(BOOL)a5 attachmentsDidSync:(BOOL)a6 recoverableMessagesDidSync:(BOOL)a7;
- (void)postCoreAutomationNotificationFinishedPurgingAttachments:(id)a3 withErrorString:(id)a4;
- (void)postCoreAutomationNotificationFinishedTapToDownload:(id)a3 downloadedFromCloudKitSuccessfully:(BOOL)a4;
- (void)postCoreAutomationNotificationPeriodicSyncUpdateNotification;
- (void)postCoreAutomationNotificationWithAction:(id)a3;
- (void)postCoreAutomationNotificationWithDictionary:(id)a3 withVerboseLogging:(BOOL)a4;
@end

@implementation IMCoreAutomationNotifications

+ (id)sharedInstance
{
  if (qword_1EB4A6730 != -1) {
    dispatch_once(&qword_1EB4A6730, &unk_1EF2BF960);
  }
  return (id)qword_1EB4A6698;
}

- (IMCoreAutomationNotifications)init
{
  v5.receiver = self;
  v5.super_class = (Class)IMCoreAutomationNotifications;
  v2 = [(IMCoreAutomationNotifications *)&v5 init];
  v3 = v2;
  if (v2) {
    [(IMCoreAutomationNotifications *)v2 clearSyncCounts];
  }
  return v3;
}

- (void)clearSyncCounts
{
  *(_OWORD *)&self->_attachmentsWrittenCount = 0u;
  *(_OWORD *)&self->_chatsWrittenCount = 0u;
  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1A0772000, v2, OS_LOG_TYPE_INFO, "Cleared sync counts", v3, 2u);
    }
  }
}

- (void)postCoreAutomationNotificationFinishedPeriodicSyncNotificationWithStartTime:(id)a3 chatsDidsync:(BOOL)a4 messagesDidSync:(BOOL)a5 attachmentsDidSync:(BOOL)a6 recoverableMessagesDidSync:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  BOOL v10 = a4;
  v15[10] = *MEMORY[0x1E4F143B8];
  v15[0] = @"initiatePeriodicSyncWithActivity";
  v14[0] = @"action";
  v14[1] = @"time";
  v12 = NSNumber;
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9C8], "date"), "timeIntervalSinceDate:", a3);
  v15[1] = objc_msgSend(v12, "numberWithDouble:");
  v14[2] = @"chatsDidSync";
  v15[2] = [NSNumber numberWithBool:v10];
  v14[3] = @"messagesDidSync";
  v15[3] = [NSNumber numberWithBool:v9];
  v14[4] = @"attachmentsDidSync";
  v15[4] = [NSNumber numberWithBool:v8];
  v14[5] = @"recoverableMessagesDidSync";
  v15[5] = [NSNumber numberWithBool:v7];
  v14[6] = @"chatsWrittenCount";
  v15[6] = [NSNumber numberWithInteger:self->_chatsWrittenCount];
  v14[7] = @"messagesWrittenCount";
  v15[7] = [NSNumber numberWithInteger:self->_messagesWrittenCount];
  v14[8] = @"attachmentsWrittenCount";
  v15[8] = [NSNumber numberWithInteger:self->_attachmentsWrittenCount];
  v14[9] = @"recoverablesMessagesWrittenCount";
  v15[9] = [NSNumber numberWithInteger:self->_recoverableMessagesWrittenCount];
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:10];
  [(IMCoreAutomationNotifications *)self clearSyncCounts];
  [(IMCoreAutomationNotifications *)self postCoreAutomationNotificationWithDictionary:v13 withVerboseLogging:1];
}

- (void)postCoreAutomationNotificationPeriodicSyncUpdateNotification
{
  v4[5] = *MEMORY[0x1E4F143B8];
  v4[0] = @"updatePeriodicSyncWithActivity";
  v3[0] = @"action";
  v3[1] = @"chatsWrittenCount";
  v4[1] = [NSNumber numberWithInteger:self->_chatsWrittenCount];
  v3[2] = @"attachmentsWrittenCount";
  v4[2] = [NSNumber numberWithInteger:self->_attachmentsWrittenCount];
  v3[3] = @"messagesWrittenCount";
  v4[3] = [NSNumber numberWithInteger:self->_messagesWrittenCount];
  v3[4] = @"recoverablesMessagesWrittenCount";
  v4[4] = [NSNumber numberWithInteger:self->_recoverableMessagesWrittenCount];
  -[IMCoreAutomationNotifications postCoreAutomationNotificationWithDictionary:withVerboseLogging:](self, "postCoreAutomationNotificationWithDictionary:withVerboseLogging:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:5], 1);
}

- (void)postCoreAutomationNotificationWithAction:(id)a3
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v3 = @"action";
  v4[0] = a3;
  -[IMCoreAutomationNotifications postCoreAutomationNotificationWithDictionary:withVerboseLogging:](self, "postCoreAutomationNotificationWithDictionary:withVerboseLogging:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:&v3 count:1], 1);
}

- (void)postCoreAutomationNotificationWithDictionary:(id)a3 withVerboseLogging:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (IMIsRunningInAutomation())
  {
    if (v4)
    {
      if (!IMOSLoggingEnabled()) {
        goto LABEL_13;
      }
      v6 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
        goto LABEL_13;
      }
      *(_DWORD *)BOOL v10 = 138412290;
      *(void *)&v10[4] = a3;
      BOOL v7 = "postCoreAutomationNotificationWithDictionary with userInfo %@";
    }
    else
    {
      uint64_t v8 = [a3 objectForKey:@"action"];
      if (v8) {
        BOOL v9 = (__CFString *)v8;
      }
      else {
        BOOL v9 = @"<action name not passed in>";
      }
      if (!IMOSLoggingEnabled()) {
        goto LABEL_13;
      }
      v6 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
        goto LABEL_13;
      }
      *(_DWORD *)BOOL v10 = 138412290;
      *(void *)&v10[4] = v9;
      BOOL v7 = "postCoreAutomationNotificationWithDictionary for action %@";
    }
    _os_log_impl(&dword_1A0772000, v6, OS_LOG_TYPE_INFO, v7, v10, 0xCu);
LABEL_13:
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28C40], "defaultCenter", *(_OWORD *)v10), "postNotificationName:object:userInfo:", @"com.apple.messages.coreautomationnotification", 0, a3);
  }
}

- (void)postCoreAutomationNotificationFinishedPurgingAttachments:(id)a3 withErrorString:(id)a4
{
  v11[2] = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    v10[0] = @"action";
    v10[1] = @"error";
    v11[0] = @"purgeAttachments";
    v11[1] = a4;
    objc_super v5 = (void *)MEMORY[0x1E4F1C9E8];
    v6 = v11;
    BOOL v7 = v10;
  }
  else
  {
    v8[0] = @"action";
    v8[1] = @"deletedAttachments";
    v9[0] = @"purgeAttachments";
    v9[1] = a3;
    objc_super v5 = (void *)MEMORY[0x1E4F1C9E8];
    v6 = v9;
    BOOL v7 = v8;
  }
  -[IMCoreAutomationNotifications postCoreAutomationNotificationWithDictionary:withVerboseLogging:](self, "postCoreAutomationNotificationWithDictionary:withVerboseLogging:", [v5 dictionaryWithObjects:v6 forKeys:v7 count:2], 0);
}

- (void)postCoreAutomationNotificationFinishedTapToDownload:(id)a3 downloadedFromCloudKitSuccessfully:(BOOL)a4
{
  v6[3] = *MEMORY[0x1E4F143B8];
  v5[0] = @"action";
  v5[1] = @"guid";
  v6[0] = @"tapToDownload";
  v6[1] = a3;
  v5[2] = @"downloadedFromCloudKitSuccessfully";
  v6[2] = [NSNumber numberWithBool:a4];
  -[IMCoreAutomationNotifications postCoreAutomationNotificationWithDictionary:withVerboseLogging:](self, "postCoreAutomationNotificationWithDictionary:withVerboseLogging:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:3], 0);
}

- (void)addNewChatsSyncedCount:(int64_t)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  self->_chatsWrittenCount += a3;
  if (IMOSLoggingEnabled())
  {
    BOOL v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = [NSNumber numberWithInteger:self->_chatsWrittenCount];
      int v6 = 138412290;
      uint64_t v7 = v5;
      _os_log_impl(&dword_1A0772000, v4, OS_LOG_TYPE_INFO, "Number of chats written count now is %@", (uint8_t *)&v6, 0xCu);
    }
  }
  [(IMCoreAutomationNotifications *)self postCoreAutomationNotificationPeriodicSyncUpdateNotification];
}

- (void)addNewAttachmentsSyncedCount:(int64_t)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  self->_attachmentsWrittenCount += a3;
  if (IMOSLoggingEnabled())
  {
    BOOL v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = [NSNumber numberWithInteger:self->_attachmentsWrittenCount];
      int v6 = 138412290;
      uint64_t v7 = v5;
      _os_log_impl(&dword_1A0772000, v4, OS_LOG_TYPE_INFO, "Number of attachments written count now is %@", (uint8_t *)&v6, 0xCu);
    }
  }
  [(IMCoreAutomationNotifications *)self postCoreAutomationNotificationPeriodicSyncUpdateNotification];
}

- (void)addNewMessagesSyncedCount:(int64_t)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  self->_messagesWrittenCount += a3;
  if (IMOSLoggingEnabled())
  {
    BOOL v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = [NSNumber numberWithInteger:self->_messagesWrittenCount];
      int v6 = 138412290;
      uint64_t v7 = v5;
      _os_log_impl(&dword_1A0772000, v4, OS_LOG_TYPE_INFO, "Number of messages written count now is %@", (uint8_t *)&v6, 0xCu);
    }
  }
  [(IMCoreAutomationNotifications *)self postCoreAutomationNotificationPeriodicSyncUpdateNotification];
}

- (void)addNewRecoverableMessagesSyncedCount:(int64_t)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  self->_recoverableMessagesWrittenCount += a3;
  if (IMOSLoggingEnabled())
  {
    BOOL v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = [NSNumber numberWithInteger:self->_recoverableMessagesWrittenCount];
      int v6 = 138412290;
      uint64_t v7 = v5;
      _os_log_impl(&dword_1A0772000, v4, OS_LOG_TYPE_INFO, "Number of recoverable messages written count now is %@", (uint8_t *)&v6, 0xCu);
    }
  }
  [(IMCoreAutomationNotifications *)self postCoreAutomationNotificationPeriodicSyncUpdateNotification];
}

- (int64_t)chatsWrittenCount
{
  return self->_chatsWrittenCount;
}

- (int64_t)messagesWrittenCount
{
  return self->_messagesWrittenCount;
}

- (int64_t)attachmentsWrittenCount
{
  return self->_attachmentsWrittenCount;
}

- (int64_t)recoverableMessagesWrittenCount
{
  return self->_recoverableMessagesWrittenCount;
}

@end
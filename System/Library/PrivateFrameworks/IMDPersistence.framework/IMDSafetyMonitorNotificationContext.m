@interface IMDSafetyMonitorNotificationContext
- (BOOL)canPopulateUserInfoForMessageBalloonBundleID:(id)a3;
- (id)notificationCategories;
- (void)populateUserInfoForNotificationContent:(id)a3 messageBalloonBundleID:(id)a4 payloadData:(id)a5 chatIdentifier:(id)a6 isUrgentMessageTrigger:(BOOL *)a7 shouldSuppressNotification:(BOOL *)a8;
@end

@implementation IMDSafetyMonitorNotificationContext

- (BOOL)canPopulateUserInfoForMessageBalloonBundleID:(id)a3
{
  id v3 = a3;
  v4 = IMBalloonExtensionIDWithSuffix();
  char v5 = [v3 isEqualToString:v4];

  return v5;
}

- (id)notificationCategories
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F445A0];
  uint64_t v3 = *MEMORY[0x1E4F6DEA0];
  v4 = [NSString localizedUserNotificationStringForKey:@"MADRID_MESSAGE_FORMAT" arguments:0];
  char v5 = [NSString localizedUserNotificationStringForKey:@"SINGLE_SUMMARY_FORMAT" arguments:0];
  v6 = (void *)MEMORY[0x1E4F1CBF0];
  v7 = [v2 categoryWithIdentifier:v3 actions:MEMORY[0x1E4F1CBF0] intentIdentifiers:MEMORY[0x1E4F1CBF0] hiddenPreviewsBodyPlaceholder:v4 categorySummaryFormat:v5 options:14];

  if (v7)
  {
    v9[0] = v7;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  }

  return v6;
}

- (void)populateUserInfoForNotificationContent:(id)a3 messageBalloonBundleID:(id)a4 payloadData:(id)a5 chatIdentifier:(id)a6 isUrgentMessageTrigger:(BOOL *)a7 shouldSuppressNotification:(BOOL *)a8
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  if ([(IMDSafetyMonitorNotificationContext *)self canPopulateUserInfoForMessageBalloonBundleID:v15])
  {
    v18 = IMDictionaryFromPayloadData();
    v19 = IMSanitizedURLForIMExtensionPayloadURLKey();
    if (v19)
    {
      v20 = [MEMORY[0x1E4F6E940] sharedCoordinator];
      uint64_t v21 = [v20 notificationContentForInitiator:v17 messageURL:v19 content:v14];

      if (v21 != 2)
      {
        if (v21 == 1) {
          *a7 = 1;
        }
        v22 = [v14 userInfo];
        CFMutableDictionaryRef Mutable = (CFMutableDictionaryRef)[v22 mutableCopy];

        if (!Mutable) {
          CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        }
        v24 = [v19 absoluteString];
        [(__CFDictionary *)Mutable setObject:v24 forKey:*MEMORY[0x1E4F6DE88]];

        [(__CFDictionary *)Mutable setObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F6DE98]];
        [v14 setUserInfo:Mutable];

LABEL_18:
        goto LABEL_19;
      }
    }
    else if (IMOSLoggingEnabled())
    {
      v25 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        LOWORD(v27) = 0;
        _os_log_impl(&dword_1AFB53000, v25, OS_LOG_TYPE_INFO, "Unable to extract URL from Message, supressing the notification", (uint8_t *)&v27, 2u);
      }
    }
    if (IMOSLoggingEnabled())
    {
      v26 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        int v27 = 138412290;
        v28 = v19;
        _os_log_impl(&dword_1AFB53000, v26, OS_LOG_TYPE_INFO, "Supressing the notification for %@", (uint8_t *)&v27, 0xCu);
      }
    }
    *a8 = 1;
    goto LABEL_18;
  }
LABEL_19:
}

@end
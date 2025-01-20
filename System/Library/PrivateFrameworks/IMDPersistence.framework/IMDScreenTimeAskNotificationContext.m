@interface IMDScreenTimeAskNotificationContext
- (BOOL)canPopulateUserInfoForMessageBalloonBundleID:(id)a3;
- (NSArray)actions;
- (id)notificationCategories;
- (void)populateUserInfoForNotificationContent:(id)a3 messageBalloonBundleID:(id)a4 payloadData:(id)a5;
- (void)setActions:(id)a3;
@end

@implementation IMDScreenTimeAskNotificationContext

- (NSArray)actions
{
  v23[4] = *MEMORY[0x1E4F143B8];
  actions = self->_actions;
  if (!actions)
  {
    v4 = (void *)MEMORY[0x1E4F445D8];
    uint64_t v5 = *MEMORY[0x1E4F6DFA8];
    v6 = [NSString localizedUserNotificationStringForKey:@"APPROVE_FOR_15_MINUTES" arguments:0];
    v7 = [v4 actionWithIdentifier:v5 title:v6 options:1];

    v8 = (void *)MEMORY[0x1E4F445D8];
    uint64_t v9 = *MEMORY[0x1E4F6DFB8];
    v10 = [NSString localizedUserNotificationStringForKey:@"APPROVE_FOR_AN_HOUR" arguments:0];
    v11 = [v8 actionWithIdentifier:v9 title:v10 options:1];

    v12 = (void *)MEMORY[0x1E4F445D8];
    uint64_t v13 = *MEMORY[0x1E4F6DFA0];
    v14 = [NSString localizedUserNotificationStringForKey:@"APPROVE_ALL_DAY" arguments:0];
    v15 = [v12 actionWithIdentifier:v13 title:v14 options:1];

    v16 = (void *)MEMORY[0x1E4F445D8];
    uint64_t v17 = *MEMORY[0x1E4F6DFB0];
    v18 = [NSString localizedUserNotificationStringForKey:@"DONT_APPROVE" arguments:0];
    v19 = [v16 actionWithIdentifier:v17 title:v18 options:3];

    v23[0] = v7;
    v23[1] = v11;
    v23[2] = v15;
    v23[3] = v19;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:4];
    v21 = self->_actions;
    self->_actions = v20;

    actions = self->_actions;
  }
  return actions;
}

- (BOOL)canPopulateUserInfoForMessageBalloonBundleID:(id)a3
{
  id v3 = a3;
  v4 = IMBalloonExtensionIDWithSuffix();
  char v5 = [v3 isEqualToString:v4];

  return v5;
}

- (void)populateUserInfoForNotificationContent:(id)a3 messageBalloonBundleID:(id)a4 payloadData:(id)a5
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v43 = v9;
  if ([(IMDScreenTimeAskNotificationContext *)self canPopulateUserInfoForMessageBalloonBundleID:v9])
  {
    [v8 setCategoryIdentifier:*MEMORY[0x1E4F6DEB0]];
    id v40 = v10;
    v41 = IMDictionaryFromPayloadData();
    v44 = IMSanitizedURLForIMExtensionPayloadURLKey();
    v42 = [[IMDAskToParser alloc] initWithUrl:v44];
    v11 = [(IMDAskToParser *)v42 notificationText];
    v12 = v11;
    if (v11)
    {
      id v13 = v11;
    }
    else
    {
      id v13 = [(IMDAskToParser *)v42 summary];
    }
    v14 = v13;

    v15 = [(IMDAskToParser *)v42 questionIdentifier];
    if (!v15)
    {
      if (IMOSLoggingEnabled())
      {
        v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AFB53000, v16, OS_LOG_TYPE_INFO, "Could not find request identifier using AskTo bits. Looking in URL for request identifier instead.", buf, 2u);
        }
      }
      v38 = [MEMORY[0x1E4F29088] componentsWithURL:v44 resolvingAgainstBaseURL:0];
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      uint64_t v17 = [v38 queryItems];
      v15 = (void *)[v17 countByEnumeratingWithState:&v49 objects:v56 count:16];
      if (v15)
      {
        uint64_t v18 = *(void *)v50;
        while (2)
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v50 != v18) {
              objc_enumerationMutation(v17);
            }
            v20 = *(void **)(*((void *)&v49 + 1) + 8 * i);
            v21 = [v20 name];
            int v22 = [v21 isEqualToString:@"requestID"];

            if (v22)
            {
              v15 = [v20 value];
              goto LABEL_20;
            }
          }
          v15 = (void *)[v17 countByEnumeratingWithState:&v49 objects:v56 count:16];
          if (v15) {
            continue;
          }
          break;
        }
      }
LABEL_20:
    }
    if (!v14)
    {
      v39 = [MEMORY[0x1E4F29088] componentsWithURL:v44 resolvingAgainstBaseURL:0];
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      v23 = [v39 queryItems];
      uint64_t v24 = [v23 countByEnumeratingWithState:&v45 objects:v55 count:16];
      if (v24)
      {
        uint64_t v25 = *(void *)v46;
LABEL_24:
        uint64_t v26 = 0;
        while (1)
        {
          if (*(void *)v46 != v25) {
            objc_enumerationMutation(v23);
          }
          v27 = *(void **)(*((void *)&v45 + 1) + 8 * v26);
          v28 = [v27 name];
          char v29 = [v28 isEqualToString:@"notificationCaption"];

          if (v29) {
            break;
          }
          if (v24 == ++v26)
          {
            uint64_t v24 = [v23 countByEnumeratingWithState:&v45 objects:v55 count:16];
            if (v24) {
              goto LABEL_24;
            }
            goto LABEL_30;
          }
        }
        v14 = [v27 value];

        if (v14) {
          goto LABEL_33;
        }
      }
      else
      {
LABEL_30:
      }
      v14 = IMSanitizedCaptionForIMExtensionPayloadUserInfoKey();
    }
LABEL_33:
    if ([v14 length]) {
      [v8 setBody:v14];
    }
    v30 = [v8 userInfo];
    CFMutableDictionaryRef Mutable = (CFMutableDictionaryRef)[v30 mutableCopy];

    if (!Mutable) {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    }
    if (v15)
    {
      if (IMOSLoggingEnabled())
      {
        v32 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v54 = (uint64_t)v15;
          _os_log_impl(&dword_1AFB53000, v32, OS_LOG_TYPE_INFO, "Adding request identifier to notification context: %@", buf, 0xCu);
        }
      }
      [(__CFDictionary *)Mutable setObject:v15 forKey:*MEMORY[0x1E4F6DE90]];
    }
    else if (v44)
    {
      if (IMOSLoggingEnabled())
      {
        v33 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          v34 = [v44 absoluteString];
          uint64_t v35 = [v34 lengthOfBytesUsingEncoding:4];
          *(_DWORD *)buf = 134217984;
          uint64_t v54 = v35;
          _os_log_impl(&dword_1AFB53000, v33, OS_LOG_TYPE_INFO, "Couldn't find request identifier in URL. Attaching URL itself instead. url size is %zd", buf, 0xCu);
        }
      }
      v36 = [v44 absoluteString];
      [(__CFDictionary *)Mutable setObject:v36 forKey:*MEMORY[0x1E4F6DE88]];
    }
    else
    {
      v37 = IMLogHandleForCategory();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        sub_1AFC6D0C0(v37);
      }
    }
    [(__CFDictionary *)Mutable setObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F6DE98]];
    [v8 setUserInfo:Mutable];
    [v8 setInterruptionLevel:2];

    id v10 = v40;
  }
}

- (id)notificationCategories
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F445A0];
  uint64_t v3 = *MEMORY[0x1E4F6DEB0];
  v4 = [(IMDScreenTimeAskNotificationContext *)self actions];
  char v5 = [NSString localizedUserNotificationStringForKey:@"MADRID_MESSAGE_FORMAT" arguments:0];
  v6 = [NSString localizedUserNotificationStringForKey:@"SINGLE_SUMMARY_FORMAT" arguments:0];
  v7 = (void *)MEMORY[0x1E4F1CBF0];
  id v8 = [v2 categoryWithIdentifier:v3 actions:v4 intentIdentifiers:MEMORY[0x1E4F1CBF0] hiddenPreviewsBodyPlaceholder:v5 categorySummaryFormat:v6 options:14];

  if (v8)
  {
    v10[0] = v8;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  }

  return v7;
}

- (void)setActions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
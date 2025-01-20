@interface IMDCustomPluginNotificationContext
+ (id)logger;
- (BOOL)canPopulateUserInfoForMessageBalloonBundleID:(id)a3;
- (id)logger;
- (id)notificationCategories;
- (void)populateUserInfoForNotificationContent:(id)a3 messageBalloonBundleID:(id)a4 payloadData:(id)a5;
@end

@implementation IMDCustomPluginNotificationContext

+ (id)logger
{
  if (qword_1E9AF8068 != -1) {
    dispatch_once(&qword_1E9AF8068, &unk_1F084CCA0);
  }
  v2 = (void *)qword_1E9AF8060;
  return v2;
}

- (id)logger
{
  v2 = objc_opt_class();
  return (id)[v2 logger];
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
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if ([(IMDCustomPluginNotificationContext *)self canPopulateUserInfoForMessageBalloonBundleID:a4])
  {
    [v8 setCategoryIdentifier:*MEMORY[0x1E4F6DEA0]];
    v10 = [v8 userInfo];
    CFMutableDictionaryRef Mutable = (CFMutableDictionaryRef)[v10 mutableCopy];

    if (!Mutable) {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    }
    v12 = IMDictionaryFromPayloadData();
    v13 = IMSanitizedURLForIMExtensionPayloadURLKey();
    v14 = [[IMDAskToParser alloc] initWithUrl:v13];
    v15 = [(IMDAskToParser *)v14 notificationText];
    if (!v15)
    {
      v15 = [(IMDAskToParser *)v14 summary];
      if (!v15)
      {
        v25 = v14;
        v26 = v12;
        id v27 = v9;
        [MEMORY[0x1E4F29088] componentsWithURL:v13 resolvingAgainstBaseURL:0];
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        v24 = long long v32 = 0u;
        id obj = [v24 queryItems];
        uint64_t v16 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v30;
LABEL_8:
          uint64_t v19 = 0;
          while (1)
          {
            if (*(void *)v30 != v18) {
              objc_enumerationMutation(obj);
            }
            v20 = *(void **)(*((void *)&v29 + 1) + 8 * v19);
            v21 = [v20 name];
            char v22 = [v21 isEqualToString:@"notificationCaption"];

            if (v22) {
              break;
            }
            if (v17 == ++v19)
            {
              uint64_t v17 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
              if (v17) {
                goto LABEL_8;
              }
              goto LABEL_14;
            }
          }
          v15 = [v20 value];

          v12 = v26;
          id v9 = v27;
          v14 = v25;
          if (v15) {
            goto LABEL_17;
          }
        }
        else
        {
LABEL_14:

          v12 = v26;
          id v9 = v27;
          v14 = v25;
        }
        v15 = IMSanitizedCaptionForIMExtensionPayloadUserInfoKey();
      }
    }
LABEL_17:
    if ([v15 length]) {
      [v8 setBody:v15];
    }
    if (v13)
    {
      v23 = [v13 absoluteString];
      [(__CFDictionary *)Mutable setObject:v23 forKey:*MEMORY[0x1E4F6DE88]];
    }
    [(__CFDictionary *)Mutable setObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F6DE98]];
    [v8 setUserInfo:Mutable];
    [v8 setInterruptionLevel:2];
  }
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

@end
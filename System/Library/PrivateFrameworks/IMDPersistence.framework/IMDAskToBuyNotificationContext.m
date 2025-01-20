@interface IMDAskToBuyNotificationContext
- (BOOL)canPopulateUserInfoForMessageBalloonBundleID:(id)a3;
- (NSArray)actions;
- (id)notificationCategories;
- (void)populateUserInfoForNotificationContent:(id)a3 messageBalloonBundleID:(id)a4 payloadData:(id)a5;
- (void)setActions:(id)a3;
@end

@implementation IMDAskToBuyNotificationContext

- (NSArray)actions
{
  v11[1] = *MEMORY[0x1E4F143B8];
  actions = self->_actions;
  if (!actions)
  {
    v4 = (void *)MEMORY[0x1E4F445D8];
    uint64_t v5 = *MEMORY[0x1E4F6CAA8];
    v6 = [NSString localizedUserNotificationStringForKey:@"VIEW_ATB_OPTIONS" arguments:0];
    v7 = [v4 actionWithIdentifier:v5 title:v6 options:1];

    v11[0] = v7;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    v9 = self->_actions;
    self->_actions = v8;

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
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if ([(IMDAskToBuyNotificationContext *)self canPopulateUserInfoForMessageBalloonBundleID:a4])
  {
    [v8 setCategoryIdentifier:*MEMORY[0x1E4F6DE80]];
    uint64_t v23 = IMDictionaryFromPayloadData();
    v25 = IMSanitizedURLForIMExtensionPayloadURLKey();
    objc_msgSend(MEMORY[0x1E4F29088], "componentsWithURL:resolvingAgainstBaseURL:");
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v24 = long long v29 = 0u;
    v10 = [v24 queryItems];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v27;
LABEL_4:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v26 + 1) + 8 * v14);
        v16 = [v15 name];
        char v17 = [v16 isEqualToString:@"notificationCaption"];

        if (v17) {
          break;
        }
        if (v12 == ++v14)
        {
          uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
          if (v12) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      v19 = [v15 value];

      v18 = (void *)v23;
      if (v19) {
        goto LABEL_13;
      }
    }
    else
    {
LABEL_10:

      v18 = (void *)v23;
    }
    v19 = IMSanitizedCaptionForIMExtensionPayloadUserInfoKey();
LABEL_13:
    if ([v19 length]) {
      [v8 setBody:v19];
    }
    v20 = [v8 userInfo];
    CFMutableDictionaryRef Mutable = (CFMutableDictionaryRef)[v20 mutableCopy];

    if (!Mutable) {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    }
    v22 = [v25 absoluteString];
    [(__CFDictionary *)Mutable setObject:v22 forKey:*MEMORY[0x1E4F6DE88]];

    [(__CFDictionary *)Mutable setObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F6DE98]];
    [v8 setUserInfo:Mutable];
    [v8 setInterruptionLevel:2];
  }
}

- (id)notificationCategories
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F445A0];
  uint64_t v3 = *MEMORY[0x1E4F6DE80];
  v4 = [(IMDAskToBuyNotificationContext *)self actions];
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
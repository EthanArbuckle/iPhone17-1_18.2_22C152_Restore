@interface IMDFamilyInviteNotificationContext
- (BOOL)canPopulateUserInfoForMessageBalloonBundleID:(id)a3;
- (BOOL)inviteeIsTeen;
- (NSArray)actions;
- (id)notificationCategories;
- (void)populateUserInfoForNotificationContent:(id)a3 messageBalloonBundleID:(id)a4 payloadData:(id)a5;
- (void)setActions:(id)a3;
@end

@implementation IMDFamilyInviteNotificationContext

- (BOOL)inviteeIsTeen
{
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2050000000;
  v2 = (void *)qword_1E9AF82F8;
  uint64_t v21 = qword_1E9AF82F8;
  if (!qword_1E9AF82F8)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = sub_1AFC06C40;
    v16 = &unk_1E5F8EB38;
    v17 = &v18;
    sub_1AFC06C40((uint64_t)buf);
    v2 = (void *)v19[3];
  }
  v3 = v2;
  _Block_object_dispose(&v18, 8);
  id v4 = objc_alloc_init(v3);
  [v4 setCachePolicy:1];
  id v12 = 0;
  v5 = [v4 fetchFamilyCircleWithError:&v12];
  id v6 = v12;
  if (v6)
  {
    v7 = IMLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1AFC6EF20((uint64_t)v6, v7);
    }
LABEL_6:

    goto LABEL_7;
  }
  if (!v5)
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_7;
    }
    v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AFB53000, v7, OS_LOG_TYPE_INFO, "FAFetchFamilyCircleRequest returned nil", buf, 2u);
    }
    goto LABEL_6;
  }
  uint64_t v10 = [v5 _serverResponse];
  v11 = [(id)v10 objectForKeyedSubscript:@"age-category"];

  LOBYTE(v10) = [v11 isEqualToString:@"TEEN"];
  if (v10)
  {
    BOOL v8 = 1;
    goto LABEL_8;
  }
LABEL_7:
  BOOL v8 = 0;
LABEL_8:

  return v8;
}

- (NSArray)actions
{
  v11[1] = *MEMORY[0x1E4F143B8];
  actions = self->_actions;
  if (!actions)
  {
    id v4 = (void *)MEMORY[0x1E4F445D8];
    uint64_t v5 = *MEMORY[0x1E4F6D350];
    id v6 = [NSString localizedUserNotificationStringForKey:@"VIEW_INVITATION" arguments:0];
    v7 = [v4 actionWithIdentifier:v5 title:v6 options:1];

    v11[0] = v7;
    BOOL v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    v9 = self->_actions;
    self->_actions = v8;

    actions = self->_actions;
  }
  return actions;
}

- (BOOL)canPopulateUserInfoForMessageBalloonBundleID:(id)a3
{
  id v3 = a3;
  id v4 = IMBalloonExtensionIDWithSuffix();
  char v5 = [v3 isEqualToString:v4];

  return v5;
}

- (void)populateUserInfoForNotificationContent:(id)a3 messageBalloonBundleID:(id)a4 payloadData:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![(IMDFamilyInviteNotificationContext *)self canPopulateUserInfoForMessageBalloonBundleID:v9])goto LABEL_28; {
  [v8 setCategoryIdentifier:*MEMORY[0x1E4F6DEA8]];
  }
  uint64_t v11 = IMDictionaryFromPayloadData();
  id v12 = IMSanitizedURLForIMExtensionPayloadURLKey();
  [MEMORY[0x1E4F29088] componentsWithURL:v12 resolvingAgainstBaseURL:0];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v37 = long long v41 = 0u;
  v13 = [v37 queryItems];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (!v14)
  {

    v17 = 0;
LABEL_30:
    v16 = IMSanitizedCaptionForIMExtensionPayloadUserInfoKey();
    if (!v17) {
      goto LABEL_31;
    }
    goto LABEL_21;
  }
  uint64_t v15 = v14;
  v32 = v12;
  uint64_t v33 = v11;
  id v34 = v10;
  id v35 = v9;
  id v36 = v8;
  v16 = 0;
  v17 = 0;
  uint64_t v18 = *(void *)v39;
  do
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      if (*(void *)v39 != v18) {
        objc_enumerationMutation(v13);
      }
      uint64_t v20 = *(void **)(*((void *)&v38 + 1) + 8 * i);
      if (!v16)
      {
        uint64_t v21 = [*(id *)(*((void *)&v38 + 1) + 8 * i) name];
        int v22 = [v21 isEqualToString:@"messageSubTitle"];

        if (v22)
        {
          v16 = [v20 value];
        }
        else
        {
          v16 = 0;
        }
      }
      v23 = [v20 name];
      if ([v23 isEqualToString:@"messageSubTitleTeen"])
      {
        BOOL v24 = [(IMDFamilyInviteNotificationContext *)self inviteeIsTeen];

        if (!v24) {
          goto LABEL_15;
        }
        [v20 value];
        v16 = v23 = v16;
      }

LABEL_15:
      v25 = [v20 name];
      int v26 = [v25 isEqualToString:@"messageTitle"];

      if (v26)
      {
        uint64_t v27 = [v20 value];

        v17 = (void *)v27;
      }
    }
    uint64_t v15 = [v13 countByEnumeratingWithState:&v38 objects:v42 count:16];
  }
  while (v15);

  id v9 = v35;
  id v8 = v36;
  uint64_t v11 = v33;
  id v10 = v34;
  id v12 = v32;
  if (!v16) {
    goto LABEL_30;
  }
  if (v17) {
    goto LABEL_21;
  }
LABEL_31:
  v17 = IMSanitizedAppNameForIMExtensionPayloadUserInfoKey();
LABEL_21:
  if ([v17 length]) {
    [v8 setHeader:v17];
  }
  v28 = (void *)v11;
  if ([v16 length]) {
    [v8 setBody:v16];
  }
  v29 = [v8 userInfo];
  CFMutableDictionaryRef Mutable = (CFMutableDictionaryRef)[v29 mutableCopy];

  if (!Mutable) {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  }
  v31 = [v12 absoluteString];
  [(__CFDictionary *)Mutable setObject:v31 forKey:*MEMORY[0x1E4F6DE88]];

  [(__CFDictionary *)Mutable setObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F6DE98]];
  [v8 setUserInfo:Mutable];
  [v8 setInterruptionLevel:2];

LABEL_28:
}

- (id)notificationCategories
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F445A0];
  uint64_t v3 = *MEMORY[0x1E4F6DEA8];
  id v4 = [(IMDFamilyInviteNotificationContext *)self actions];
  char v5 = [NSString localizedUserNotificationStringForKey:@"MADRID_MESSAGE_FORMAT" arguments:0];
  id v6 = [NSString localizedUserNotificationStringForKey:@"SINGLE_SUMMARY_FORMAT" arguments:0];
  v7 = (void *)MEMORY[0x1E4F1CBF0];
  id v8 = [v2 categoryWithIdentifier:v3 actions:v4 intentIdentifiers:MEMORY[0x1E4F1CBF0] hiddenPreviewsBodyPlaceholder:v5 categorySummaryFormat:v6 options:12];

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
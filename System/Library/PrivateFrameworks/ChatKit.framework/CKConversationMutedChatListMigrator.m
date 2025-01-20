@interface CKConversationMutedChatListMigrator
- (id)_dnd_deprecated_globalIdentifierForChat:(id)a3;
- (void)migrateMutedChatListInfoIfNeeded;
- (void)performMutedChatListMigrationIfNecessary;
@end

@implementation CKConversationMutedChatListMigrator

- (void)performMutedChatListMigrationIfNecessary
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"CKDNDMigrationKey", @"com.apple.MobileSMS.CKDNDList", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v4 = AppIntegerValue < 1;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    CFIndex v38 = AppIntegerValue;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v5 = +[CKConversationList sharedConversationList];
    v6 = [v5 conversations];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v44 objects:v51 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v45;
      v39 = self;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v45 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = [*(id *)(*((void *)&v44 + 1) + 8 * i) chat];
          v12 = [v11 valueForChatProperty:@"CKChatUnmuteTime"];
          v13 = v12;
          if (v12)
          {
            [v12 doubleValue];
            if (v14 > 0.0)
            {
              v15 = (void *)MEMORY[0x1E4F1C9C8];
              [v13 doubleValue];
              uint64_t v16 = objc_msgSend(v15, "dateWithTimeIntervalSince1970:");
              if (v16)
              {
                v17 = (void *)v16;
                v18 = [MEMORY[0x1E4F1CA98] null];
                [v11 setValue:v18 forChatProperty:@"CKChatUnmuteTime"];

                v19 = [MEMORY[0x1E4F6E8A8] sharedList];
                uint64_t v20 = [(CKConversationMutedChatListMigrator *)self _dnd_deprecated_globalIdentifierForChat:v11];
                v21 = (void *)v20;
                if (v20)
                {
                  uint64_t v50 = v20;
                  [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
                  uint64_t v22 = v8;
                  uint64_t v23 = v9;
                  v25 = v24 = v6;
                  [v19 muteChatWithMuteIdentifiers:v25 untilDate:v17 syncToPairedDevice:0];

                  v6 = v24;
                  uint64_t v9 = v23;
                  uint64_t v8 = v22;
                }

                self = v39;
              }
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v44 objects:v51 count:16];
      }
      while (v8);
    }

    CFIndex AppIntegerValue = v38;
  }
  if (AppIntegerValue <= 1)
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v26 = +[CKConversationList sharedConversationList];
    v27 = [v26 conversations];

    uint64_t v28 = [v27 countByEnumeratingWithState:&v40 objects:v49 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v41;
      do
      {
        for (uint64_t j = 0; j != v29; ++j)
        {
          if (*(void *)v41 != v30) {
            objc_enumerationMutation(v27);
          }
          v32 = [*(id *)(*((void *)&v40 + 1) + 8 * j) chat];
          v33 = [MEMORY[0x1E4F6E8A8] sharedList];
          v34 = [(CKConversationMutedChatListMigrator *)self _dnd_deprecated_globalIdentifierForChat:v32];
          v35 = [v33 unmuteDateForMuteIdentifier:v34];

          if (v35)
          {
            v36 = [MEMORY[0x1E4F6E8A8] sharedList];
            [v36 muteChat:v32 untilDate:v35 syncToPairedDevice:0];
          }
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v40 objects:v49 count:16];
      }
      while (v29);
    }

    CFPreferencesSetAppValue(@"CKDNDMigrationKey", &unk_1EDF16388, @"com.apple.MobileSMS.CKDNDList");
    CFPreferencesAppSynchronize(@"com.apple.MobileSMS.CKDNDList");
    v37 = [MEMORY[0x1E4F6E8A8] sharedList];
    [v37 syncToPairedDeviceIncludingVersion:1];
  }
}

- (void)migrateMutedChatListInfoIfNeeded
{
  v3 = +[CKConversationList sharedConversationList];
  BOOL v4 = [v3 conversations];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    [(CKConversationMutedChatListMigrator *)self performMutedChatListMigrationIfNecessary];
  }
}

- (id)_dnd_deprecated_globalIdentifierForChat:(id)a3
{
  id v3 = a3;
  if ([v3 chatStyle] == 45) {
    [v3 chatIdentifier];
  }
  else {
  BOOL v4 = [v3 groupID];
  }

  return v4;
}

@end
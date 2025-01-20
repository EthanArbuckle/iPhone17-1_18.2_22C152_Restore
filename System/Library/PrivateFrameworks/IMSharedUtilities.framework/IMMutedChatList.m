@interface IMMutedChatList
+ (IMMutedChatList)sharedList;
- (BOOL)isMutedChatForChatIdentifier:(id)a3 chatStyle:(unsigned __int8)a4 groupID:(id)a5 participantIDs:(id)a6 lastAddressedHandleID:(id)a7 originalGroupID:(id)a8;
- (BOOL)isMutedChatForMuteIdentifiers:(id)a3;
- (IMMutedChatList)init;
- (NPSManager)syncManager;
- (NSDictionary)mutedChatList;
- (id)groupHashForParticipantIDs:(id)a3 lastAddressedHandleID:(id)a4;
- (id)muteIdentifiersForChatStyle:(unsigned __int8)a3 groupID:(id)a4 participantIDs:(id)a5 lastAddressedHandleID:(id)a6 originalGroupID:(id)a7 chatIdentifier:(id)a8;
- (id)unmuteDateForMuteIdentifier:(id)a3;
- (id)unmuteDateForMuteIdentifiers:(id)a3;
- (void)_handleMutedChatListChanged;
- (void)_synchronizeMutedChatList:(id)a3 syncToPairedDevice:(BOOL)a4;
- (void)dealloc;
- (void)muteChatWithMuteIdentifiers:(id)a3 untilDate:(id)a4 syncToPairedDevice:(BOOL)a5;
- (void)setSyncManager:(id)a3;
- (void)syncToPairedDeviceIncludingVersion:(BOOL)a3;
- (void)unmuteChatWithMuteIdentifiers:(id)a3 syncToPairedDevice:(BOOL)a4;
@end

@implementation IMMutedChatList

- (BOOL)isMutedChatForMuteIdentifiers:(id)a3
{
  v3 = [(IMMutedChatList *)self unmuteDateForMuteIdentifiers:a3];
  if (v3)
  {
    v4 = [MEMORY[0x1E4F1C9C8] date];
    BOOL v5 = [v4 compare:v3] == -1;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)unmuteDateForMuteIdentifiers:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = -[IMMutedChatList unmuteDateForMuteIdentifier:](self, "unmuteDateForMuteIdentifier:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        if (v9)
        {
          v10 = (void *)v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (id)unmuteDateForMuteIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(IMMutedChatList *)self mutedChatList];
  uint64_t v6 = [v5 objectForKey:v4];

  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1C9C8];
    [v6 doubleValue];
    v8 = objc_msgSend(v7, "dateWithTimeIntervalSince1970:");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSDictionary)mutedChatList
{
  v2 = (void *)CFPreferencesCopyAppValue(@"CKDNDListKey", @"com.apple.MobileSMS.CKDNDList");
  if (!v2) {
    v2 = (void *)MEMORY[0x1E4F1CC08];
  }

  return (NSDictionary *)v2;
}

+ (IMMutedChatList)sharedList
{
  if (qword_1EB4A63D0 != -1) {
    dispatch_once(&qword_1EB4A63D0, &unk_1EF2BF740);
  }
  v2 = (void *)qword_1EB4A63D8;

  return (IMMutedChatList *)v2;
}

- (id)muteIdentifiersForChatStyle:(unsigned __int8)a3 groupID:(id)a4 participantIDs:(id)a5 lastAddressedHandleID:(id)a6 originalGroupID:(id)a7 chatIdentifier:(id)a8
{
  int v12 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v12 == 45)
  {
    if ([v18 length]) {
      [v19 addObject:v18];
    }
  }
  else
  {
    if ([v14 length]) {
      [v19 addObject:v14];
    }
    v20 = [(IMMutedChatList *)self groupHashForParticipantIDs:v15 lastAddressedHandleID:v16];
    if ([v20 length]) {
      [v19 addObject:v20];
    }
    if ([v17 length]) {
      [v19 addObject:v17];
    }
  }
  v21 = (void *)[v19 copy];

  return v21;
}

- (id)groupHashForParticipantIDs:(id)a3 lastAddressedHandleID:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (void *)[a3 mutableCopy];
  uint64_t v7 = v6;
  if (v5) {
    [v6 addObject:v5];
  }
  v8 = (void *)[v7 copy];
  uint64_t v9 = IMSharedHelperGroupHashForHandleIDs(v8);

  return v9;
}

- (IMMutedChatList)init
{
  v5.receiver = self;
  v5.super_class = (Class)IMMutedChatList;
  v2 = [(IMMutedChatList *)&v5 init];
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_1A081DEA0, @"com.apple.MobileSMS.CKDNDList.changed", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)IMMutedChatList;
  [(IMMutedChatList *)&v4 dealloc];
}

- (BOOL)isMutedChatForChatIdentifier:(id)a3 chatStyle:(unsigned __int8)a4 groupID:(id)a5 participantIDs:(id)a6 lastAddressedHandleID:(id)a7 originalGroupID:(id)a8
{
  v8 = self;
  uint64_t v9 = [(IMMutedChatList *)self muteIdentifiersForChatStyle:a4 groupID:a5 participantIDs:a6 lastAddressedHandleID:a7 originalGroupID:a8 chatIdentifier:a3];
  LOBYTE(v8) = [(IMMutedChatList *)v8 isMutedChatForMuteIdentifiers:v9];

  return (char)v8;
}

- (void)unmuteChatWithMuteIdentifiers:(id)a3 syncToPairedDevice:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 count])
  {
    BOOL v17 = v4;
    id v18 = v6;
    id v19 = [(IMMutedChatList *)self mutedChatList];
    uint64_t v7 = (void *)[v19 mutableCopy];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v26 count:16];
    if (!v9) {
      goto LABEL_18;
    }
    uint64_t v10 = *(void *)v21;
    while (1)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        long long v13 = [v7 objectForKey:v12];
        BOOL v14 = v13 == 0;

        if (v14)
        {
          if (!IMOSLoggingEnabled()) {
            continue;
          }
          id v15 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v25 = v12;
            _os_log_impl(&dword_1A0772000, v15, OS_LOG_TYPE_INFO, "Can't unmute chat with identifier: %@, that wasn't muted to begin with...", buf, 0xCu);
          }
        }
        else
        {
          [v7 removeObjectForKey:v12];
          if (!IMOSLoggingEnabled()) {
            continue;
          }
          id v15 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v25 = v12;
            _os_log_impl(&dword_1A0772000, v15, OS_LOG_TYPE_INFO, "Unmuting chat with identifier: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v26 count:16];
      if (!v9)
      {
LABEL_18:

        id v16 = (void *)[v7 copy];
        [(IMMutedChatList *)self _synchronizeMutedChatList:v16 syncToPairedDevice:v17];

        id v6 = v18;
        break;
      }
    }
  }
}

- (void)muteChatWithMuteIdentifiers:(id)a3 untilDate:(id)a4 syncToPairedDevice:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v26 = v8;
  if ([v8 count])
  {
    if (!v9)
    {
      [(IMMutedChatList *)self unmuteChatWithMuteIdentifiers:v8 syncToPairedDevice:v5];
      goto LABEL_27;
    }
    BOOL v25 = v5;
    id v27 = v9;
    v24 = self;
    uint64_t v10 = [(IMMutedChatList *)self mutedChatList];
    v11 = (void *)[v10 mutableCopy];
    [v9 timeIntervalSince1970];
    double v13 = v12;
    BOOL v14 = objc_msgSend(NSNumber, "numberWithDouble:");
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v15 = v8;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (!v16) {
      goto LABEL_25;
    }
    uint64_t v17 = *(void *)v29;
    while (1)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v29 != v17) {
          objc_enumerationMutation(v15);
        }
        id v19 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        long long v20 = [v10 objectForKey:v19];
        if (v20 && [v14 isEqualToNumber:v20])
        {
          if (IMOSLoggingEnabled())
          {
            long long v21 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1A0772000, v21, OS_LOG_TYPE_INFO, "Same unmute time, not updating", buf, 2u);
            }
          }
        }
        else
        {
          if (v13 <= 0.0)
          {
            [v11 removeObjectForKey:v19];
            if (!IMOSLoggingEnabled()) {
              goto LABEL_23;
            }
            long long v22 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              id v33 = v27;
              __int16 v34 = 2112;
              v35 = v19;
              _os_log_impl(&dword_1A0772000, v22, OS_LOG_TYPE_INFO, "Updating unmute time to %@ for chat with identifier: %@", buf, 0x16u);
            }
          }
          else
          {
            [v11 setObject:v14 forKey:v19];
            if (!IMOSLoggingEnabled()) {
              goto LABEL_23;
            }
            long long v22 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v33 = v19;
              _os_log_impl(&dword_1A0772000, v22, OS_LOG_TYPE_INFO, "Muting chat with identifier: %@", buf, 0xCu);
            }
          }
        }
LABEL_23:
      }
      uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v36 count:16];
      if (!v16)
      {
LABEL_25:

        long long v23 = (void *)[v11 copy];
        [(IMMutedChatList *)v24 _synchronizeMutedChatList:v23 syncToPairedDevice:v25];

        id v9 = v27;
        break;
      }
    }
  }
LABEL_27:
}

- (void)_synchronizeMutedChatList:(id)a3 syncToPairedDevice:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  CFPreferencesSetAppValue(@"CKDNDListKey", v6, @"com.apple.MobileSMS.CKDNDList");
  CFPreferencesAppSynchronize(@"com.apple.MobileSMS.CKDNDList");
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_1A0772000, v7, OS_LOG_TYPE_INFO, "Synchronized Do Not Disturb list", v9, 2u);
    }
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.MobileSMS.CKDNDList.changed", 0, 0, 2u);
  if (v4) {
    [(IMMutedChatList *)self syncToPairedDeviceIncludingVersion:0];
  }
}

- (void)_handleMutedChatListChanged
{
}

- (void)syncToPairedDeviceIncludingVersion:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(IMMutedChatList *)self syncManager];
  if (!v5)
  {
    id v5 = objc_alloc_init((Class)MEMORY[0x1A6227910](@"NPSManager", @"NanoPreferencesSync"));
    [(IMMutedChatList *)self setSyncManager:v5];
  }
  id v6 = [MEMORY[0x1E4F1CA80] setWithObject:@"CKDNDListKey"];
  uint64_t v7 = v6;
  if (v3) {
    [v6 addObject:@"CKDNDMigrationKey"];
  }
  [v5 synchronizeUserDefaultsDomain:@"com.apple.MobileSMS.CKDNDList" keys:v7];
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_1A0772000, v8, OS_LOG_TYPE_INFO, "NPSManager synchronizedNanoDomain", v9, 2u);
    }
  }
}

- (NPSManager)syncManager
{
  return self->_syncManager;
}

- (void)setSyncManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
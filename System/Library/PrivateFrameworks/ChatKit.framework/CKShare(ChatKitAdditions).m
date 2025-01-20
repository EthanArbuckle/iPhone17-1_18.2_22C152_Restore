@interface CKShare(ChatKitAdditions)
- (uint64_t)_nonOwnerInvitedParticipantsCount;
- (uint64_t)_nonOwnerParticipantsCountWithAcceptanceStatus:()ChatKitAdditions;
- (uint64_t)isCloudKitShareRemovable;
@end

@implementation CKShare(ChatKitAdditions)

- (uint64_t)isCloudKitShareRemovable
{
  if ([a1 publicPermission] != 1)
  {
    uint64_t result = IMOSLoggingEnabled();
    if (!result) {
      return result;
    }
    v5 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v6 = "CKShare is public, not removing CloudKit share";
    v7 = buf;
    goto LABEL_9;
  }
  v2 = [a1 currentUserParticipant];
  v3 = [a1 owner];

  if (v2 != v3)
  {
    uint64_t result = IMOSLoggingEnabled();
    if (!result) {
      return result;
    }
    v5 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
      goto LABEL_10;
    }
    __int16 v8 = 0;
    v6 = "Current user is not owner, not removing CloudKit share";
    v7 = (uint8_t *)&v8;
LABEL_9:
    _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, v6, v7, 2u);
LABEL_10:

    return 0;
  }
  return [a1 _nonOwnerInvitedParticipantsCount] == 0;
}

- (uint64_t)_nonOwnerInvitedParticipantsCount
{
  uint64_t v2 = [a1 _nonOwnerParticipantsCountWithAcceptanceStatus:1];
  return [a1 _nonOwnerParticipantsCountWithAcceptanceStatus:2] + v2;
}

- (uint64_t)_nonOwnerParticipantsCountWithAcceptanceStatus:()ChatKitAdditions
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = objc_msgSend(a1, "participants", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v12 = [a1 owner];
        if ([v11 isEqual:v12])
        {
        }
        else
        {
          uint64_t v13 = [v11 acceptanceStatus];

          if (v13 == a3) {
            ++v8;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

@end
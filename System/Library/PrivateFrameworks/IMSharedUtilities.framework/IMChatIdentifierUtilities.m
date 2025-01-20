@interface IMChatIdentifierUtilities
+ (id)_handleBasedPersonCentricIDWithParticipantIDs:(id)a3;
+ (id)_randomUnverifiedChatIdentifierForGroupChat;
+ (id)generateUnusedChatIdentifierForGroupChatWithServiceName:(id)a3 chatWithChatIdentifierExists:(id)a4;
+ (id)personCentricIDForChatWithGUID:(id)a3 chatIdentifier:(id)a4 chatStyle:(unsigned __int8)a5 groupID:(id)a6 displayName:(id)a7 lastKnownToBeHybrid:(BOOL)a8 mergeDisplayNames:(BOOL)a9 participantIDs:(id)a10;
@end

@implementation IMChatIdentifierUtilities

+ (id)personCentricIDForChatWithGUID:(id)a3 chatIdentifier:(id)a4 chatStyle:(unsigned __int8)a5 groupID:(id)a6 displayName:(id)a7 lastKnownToBeHybrid:(BOOL)a8 mergeDisplayNames:(BOOL)a9 participantIDs:(id)a10
{
  int v13 = a5;
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  id v19 = a7;
  id v20 = a10;
  if (v13 == 35)
  {
    id v21 = v16;
    goto LABEL_23;
  }
  id v32 = a1;
  v22 = +[IMFeatureFlags sharedFeatureFlags];
  int v23 = [v22 isTranscriptSharingEnabled];

  if (!v23 || ![v17 hasPrefix:@"tsharing:"])
  {
    if (v13 == 43)
    {
      BOOL v26 = [v19 length] == 0;
      if ([v19 length]) {
        BOOL v27 = a8 && a9;
      }
      else {
        BOOL v27 = 0;
      }
      BOOL v28 = (unint64_t)[v20 count] > 1;
      v25 = v32;
      if (!v28) {
        goto LABEL_14;
      }
    }
    else
    {
      if (v13 == 45)
      {
        BOOL v24 = [v20 count] == 1;
        v25 = v32;
        if (!v24)
        {
LABEL_14:
          [NSString stringWithFormat:@"%@-corruptChat", v17, v31];
LABEL_20:
          id v21 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_23;
        }
        goto LABEL_21;
      }
      BOOL v26 = 0;
      BOOL v27 = 0;
      v25 = v32;
    }
    if (v26 || v27)
    {
LABEL_21:
      id v21 = [v25 _handleBasedPersonCentricIDWithParticipantIDs:v20];
      goto LABEL_23;
    }
    if ([v19 length])
    {
      [NSString stringWithFormat:@"%@-%@", v18, v17];
      goto LABEL_20;
    }
  }
  id v21 = v17;
LABEL_23:
  v29 = v21;

  return v29;
}

+ (id)_handleBasedPersonCentricIDWithParticipantIDs:(id)a3
{
  v3 = (void *)[a3 mutableCopy];
  [v3 sortUsingSelector:sel_caseInsensitiveCompare_];
  v4 = [v3 componentsJoinedByString:&stru_1EF2CAD28];

  return v4;
}

+ (id)_randomUnverifiedChatIdentifierForGroupChat
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = [NSString generatedRoomNameForGroupChat];
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v5 = 138412290;
      v6 = v2;
      _os_log_impl(&dword_1A0772000, v3, OS_LOG_TYPE_INFO, "Generated random chat identifier %@", (uint8_t *)&v5, 0xCu);
    }
  }

  return v2;
}

+ (id)generateUnusedChatIdentifierForGroupChatWithServiceName:(id)a3 chatWithChatIdentifierExists:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (unsigned int (**)(id, uint64_t))a4;
  v8 = 0;
  uint64_t v9 = 3;
  *(void *)&long long v10 = 138412290;
  long long v15 = v10;
  while (1)
  {
    uint64_t v11 = objc_msgSend(a1, "_randomUnverifiedChatIdentifierForGroupChat", v15);

    v8 = (void *)v11;
    if (![v6 length]) {
      break;
    }
    if (!v7 || v7[2](v7, v11))
    {
      if (IMOSLoggingEnabled())
      {
        v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v15;
          id v17 = v8;
          _os_log_impl(&dword_1A0772000, v12, OS_LOG_TYPE_INFO, "Improbable collision has occured for group chat with chatIdentifier: %@", buf, 0xCu);
        }
      }
      if (--v9) {
        continue;
      }
    }
    goto LABEL_15;
  }
  if (IMOSLoggingEnabled())
  {
    int v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A0772000, v13, OS_LOG_TYPE_INFO, "No service provided for generateUnusedChatIdentifierForGroupChatWithAccount, can't verify there are no duplicates", buf, 2u);
    }
  }
LABEL_15:

  return v8;
}

@end
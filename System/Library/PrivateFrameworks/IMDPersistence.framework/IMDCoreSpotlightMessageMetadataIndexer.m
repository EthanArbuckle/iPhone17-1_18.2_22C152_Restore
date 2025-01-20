@interface IMDCoreSpotlightMessageMetadataIndexer
+ (BOOL)cancelIndexingForItem:(id)a3;
+ (BOOL)isMutedChatForChatDictionary:(id)a3;
+ (int)_spotlightEffectTypeForItemDictionary:(id)a3;
+ (void)indexItem:(id)a3 withChat:(id)a4 isReindexing:(BOOL)a5 metadataToUpdate:(id)a6 timingProfiler:(id)a7;
@end

@implementation IMDCoreSpotlightMessageMetadataIndexer

+ (BOOL)cancelIndexingForItem:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 objectForKey:@"associatedMessageType"];
  v5 = v4;
  if (!v4) {
    goto LABEL_13;
  }
  uint64_t v6 = [v4 integerValue];
  if (v6) {
    BOOL v7 = (v6 & 0xFFFFFFFFFFFFFFF8) == 2000;
  }
  else {
    BOOL v7 = 1;
  }
  char v8 = v7;
  if (IMOSLoggingEnabled())
  {
    v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v14 = 134217984;
      v15 = (const char *)v6;
      _os_log_impl(&dword_1AFB53000, v9, OS_LOG_TYPE_INFO, "Item is of type %ld", (uint8_t *)&v14, 0xCu);
    }
  }
  if ((v8 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = [v3 objectForKey:@"guid"];
        int v14 = 136315650;
        v15 = "+[IMDCoreSpotlightMessageMetadataIndexer cancelIndexingForItem:]";
        __int16 v16 = 2112;
        v17 = v12;
        __int16 v18 = 2048;
        uint64_t v19 = v6;
        _os_log_impl(&dword_1AFB53000, v11, OS_LOG_TYPE_INFO, "%s GUID %@ is of type %ld, not indexing", (uint8_t *)&v14, 0x20u);
      }
    }
    BOOL v10 = 1;
  }
  else
  {
LABEL_13:
    BOOL v10 = 0;
  }

  return v10;
}

+ (void)indexItem:(id)a3 withChat:(id)a4 isReindexing:(BOOL)a5 metadataToUpdate:(id)a6 timingProfiler:(id)a7
{
  v61[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v52 = a4;
  id v12 = a6;
  id v47 = a7;
  v49 = [v11 objectForKey:@"time"];
  v13 = [MEMORY[0x1E4F1C9C8] distantPast];
  int v14 = [v49 isEqualToDate:v13];

  if (v14)
  {
    v15 = IMLogHandleForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1AFC67FE0(v15);
    }
  }
  else if (v49)
  {
    [v12 setContentCreationDate:v49];
  }
  v51 = [v11 objectForKey:@"accountID"];
  if (v51) {
    [v12 setAccountIdentifier:v51];
  }
  __int16 v16 = [v52 objectForKey:@"lalh"];
  v50 = [v16 _stripFZIDPrefix];

  if (v50)
  {
    v61[0] = v50;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:1];
    [v12 setAccountHandles:v17];
  }
  __int16 v18 = [v11 objectForKey:@"flags"];
  unint64_t v19 = [v18 unsignedLongLongValue];

  uint64_t v20 = [MEMORY[0x1E4F28ED0] numberWithBool:(v19 >> 13) & 1];
  [v12 setMessageRead:v20];

  uint64_t v21 = (v19 >> 2) & 1;
  v22 = [MEMORY[0x1E4F28ED0] numberWithBool:v21];
  [v12 setIsFromMe:v22];

  v23 = [MEMORY[0x1E4F28ED0] numberWithBool:v21];
  v24 = [a1 isFromMeCustomKey];
  [v12 setValue:v23 forCustomKey:v24];

  v48 = [v52 objectForKey:@"participants"];
  BOOL v25 = (unint64_t)[v48 count] > 1;
  v26 = [MEMORY[0x1E4F28ED0] numberWithBool:v25];
  [v12 setIsGroupThread:v26];

  v27 = [v11 _numberForKey:@"isIncomingMessage"];
  uint64_t v28 = [v27 BOOLValue];

  v29 = [MEMORY[0x1E4F28ED0] numberWithBool:v28];
  [v12 setIsNew:v29];

  v30 = [v11 objectForKey:@"attributedBody"];
  v31 = _IMDCoreSpotlightTokensMentionedInMessage(v30);
  v32 = [a1 mentionedAddressesCustomKey];
  [v12 setValue:v31 forCustomKey:v32];

  uint64_t v33 = [v30 length];
  uint64_t v34 = objc_msgSend(v30, "attribute:existsInRange:", *MEMORY[0x1E4F6C218], 0, v33);
  v35 = [MEMORY[0x1E4F28ED0] numberWithBool:v34];
  [v12 setIsTwoFactorCode:v35];

  v36 = [v11 objectForKey:@"handle"];
  v37 = [MEMORY[0x1E4F28ED0] numberWithBool:MEMORY[0x1B3E899E0]()];
  v38 = [a1 isBusinessChatCustomKey];
  [v12 setValue:v37 forCustomKey:v38];

  v39 = [v11 objectForKey:@"service"];
  if (v39) {
    [v12 setMessageService:v39];
  }
  v40 = [v11 objectForKeyedSubscript:@"knownSender"];
  uint64_t v41 = [v40 BOOLValue];

  v42 = [MEMORY[0x1E4F28ED0] numberWithBool:v41];
  [v12 setIsMessageFromKnownSender:v42];

  uint64_t v43 = [a1 isMutedChatForChatDictionary:v52];
  v44 = [MEMORY[0x1E4F28ED0] numberWithBool:v43];
  v45 = [a1 isChatMutedCustomKey];
  [v12 setValue:v44 forCustomKey:v45];
  objc_msgSend(v12, "setMessageEffectType:", objc_msgSend(a1, "_spotlightEffectTypeForItemDictionary:", v11));
  if ([MEMORY[0x1E4F6E700] verboseLoggingEnabled] && IMOSLoggingEnabled())
  {
    v46 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      v54 = v49;
      __int16 v55 = 2112;
      v56 = v51;
      __int16 v57 = 2112;
      v58 = v50;
      __int16 v59 = 2112;
      v60 = v39;
      _os_log_impl(&dword_1AFB53000, v46, OS_LOG_TYPE_INFO, "setting date %@ accountID %@ lastAddressedLocalHandle %@ service %@", buf, 0x2Au);
    }
  }
}

+ (BOOL)isMutedChatForChatDictionary:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKey:@"chatIdentifier"];
  v5 = [v3 objectForKey:@"style"];
  unsigned __int8 v6 = [v5 intValue];

  BOOL v7 = [v3 objectForKey:@"groupID"];
  char v8 = [v3 objectForKey:@"participants"];
  v9 = [v8 arrayByApplyingSelector:sel__stripFZIDPrefix];
  BOOL v10 = [v3 objectForKey:@"lalh"];
  id v11 = [v10 _stripFZIDPrefix];

  id v12 = [v3 objectForKey:@"originalGroupID"];

  v13 = [MEMORY[0x1E4F6E8A8] sharedList];
  int v14 = [v13 muteIdentifiersForChatStyle:v6 groupID:v7 participantIDs:v9 lastAddressedHandleID:v11 originalGroupID:v12 chatIdentifier:v4];
  char v15 = [v13 isMutedChatForMuteIdentifiers:v14];

  return v15;
}

+ (int)_spotlightEffectTypeForItemDictionary:(id)a3
{
  id v3 = [a3 objectForKey:@"expressiveSendStyleID"];
  if ([v3 isEqualToString:*MEMORY[0x1E4F6E470]])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F6E440]])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F6E450]])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F6E478]])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F6E460]])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F6E490]])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F6E448]])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F6E488]])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F6E458]])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F6E4A0]])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F6E498]])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F6E480]])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F6E468]])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

@end
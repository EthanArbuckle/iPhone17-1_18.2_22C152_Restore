@interface IMDRelayDeletionController
- (BOOL)shouldInferRecoverableDeleteForCommandDictionary:(id)a3;
- (IMDRelayDeletionController)init;
- (IMMultiQueue)incomingMessageMultiQueue;
- (id)_chatsForDeleteAndRecoveryChatMetadataDictionary:(id)a3;
- (id)_groupChatsByService:(id)a3;
- (id)broadcasterForChatListenersForService:(id)a3;
- (id)broadcasterForChatListenersForService:(id)a3 withBlackholeStatus:(BOOL)a4;
- (id)chatRegistry;
- (id)deleteCommandDictionaryWithIncomingDictionary:(id)a3 inferredRecoverableDeleteForLegacyCommandsWithDate:(id)a4;
- (id)relayController;
- (void)_doClearChats:(id)a3;
- (void)_enqueueBlock:(id)a3 withTimeout:(double)a4;
- (void)_handleDeleteCommandWithMessageDictionary:(id)a3;
- (void)_updateLastMessageTimeStampForChat:(id)a3 broadcaster:(id)a4;
- (void)deleteChatsForCommandDictionary:(id)a3;
- (void)deleteMessagePartsForCommandDictionary:(id)a3;
- (void)deleteMessagesForCommandDictionary:(id)a3;
- (void)handler:(id)a3 deleteCommand:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 fromIDSID:(id)a8 timeStamp:(id)a9 needsDeliveryReceipt:(id)a10 deliveryContext:(id)a11 storageContext:(id)a12;
- (void)handler:(id)a3 recoverCommand:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 fromIDSID:(id)a8 timeStamp:(id)a9 needsDeliveryReceipt:(id)a10 deliveryContext:(id)a11 storageContext:(id)a12;
- (void)recoverChatsForCommandDictionary:(id)a3;
- (void)setIncomingMessageMultiQueue:(id)a3;
@end

@implementation IMDRelayDeletionController

- (IMDRelayDeletionController)init
{
  v9.receiver = self;
  v9.super_class = (Class)IMDRelayDeletionController;
  v2 = [(IMDRelayDeletionController *)&v9 init];
  if (v2)
  {
    if (IMOSLoggingEnabled())
    {
      v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Setting up deletion controller", v8, 2u);
      }
    }
    v4 = +[IMDRelayPushHandler sharedInstance];
    [v4 addListener:v2];

    v5 = +[IMDRelayPushHandler sharedInstance];
    [v5 setRegistered:1];

    if (IMOSLoggingEnabled())
    {
      v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Deletion controller created", v8, 2u);
      }
    }
  }
  return v2;
}

- (void)handler:(id)a3 deleteCommand:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 fromIDSID:(id)a8 timeStamp:(id)a9 needsDeliveryReceipt:(id)a10 deliveryContext:(id)a11 storageContext:(id)a12
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v37 = a3;
  id v18 = a4;
  id v38 = a5;
  id v39 = a6;
  id v19 = a7;
  id v20 = a8;
  id v43 = a9;
  id v40 = a10;
  id v41 = a11;
  id v42 = a12;
  v21 = [(IMDRelayDeletionController *)self relayController];
  v22 = [v21 idsDeviceFromPushToken:v19];

  if (v22
    || ([(IMDRelayDeletionController *)self relayController],
        v23 = objc_claimAutoreleasedReturnValue(),
        [v23 idsDeviceForFromID:v20],
        v22 = objc_claimAutoreleasedReturnValue(),
        v23,
        v22))
  {
    int v24 = [v22 isActive];
    v25 = [v18 objectForKey:@"chat"];
    v26 = [v25 objectAtIndex:0];
    v27 = [v26 objectForKey:@"wasReportedAsJunk"];
    int v28 = [v27 BOOLValue];

    v29 = +[IMDCKUtilities sharedInstance];
    int v30 = [v29 cloudKitSyncingEnabled];

    int v31 = IMOSLoggingEnabled();
    if (((v24 | v30) | v28))
    {
      if (v31)
      {
        v32 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138413058;
          id v47 = v18;
          __int16 v48 = 1024;
          int v49 = v30;
          __int16 v50 = 1024;
          int v51 = v28;
          __int16 v52 = 1024;
          int v53 = v24;
          _os_log_impl(&dword_1D967A000, v32, OS_LOG_TYPE_INFO, "Handling delete command: %@ (cloudKitSyncEnabled: %d, wasReportedJunk: %d, senderIsPairedWatch: %d)", buf, 0x1Eu);
        }
      }
      if ([(IMDRelayDeletionController *)self shouldInferRecoverableDeleteForCommandDictionary:v18])
      {
        v33 = objc_msgSend(MEMORY[0x1E4F1C9C8], "__im_iMessageDateFromTimeStamp:", v43);
        uint64_t v34 = [(IMDRelayDeletionController *)self deleteCommandDictionaryWithIncomingDictionary:v18 inferredRecoverableDeleteForLegacyCommandsWithDate:v33];

        id v18 = (id)v34;
      }
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = sub_1D96AB8D4;
      v44[3] = &unk_1E6B732E0;
      v44[4] = self;
      id v18 = v18;
      id v45 = v18;
      [(IMDRelayDeletionController *)self _enqueueBlock:v44 withTimeout:45.0];
    }
    else if (v31)
    {
      v35 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v47 = v18;
        _os_log_impl(&dword_1D967A000, v35, OS_LOG_TYPE_INFO, "iCloudSync not enabled and not reported as junk, dropping delete command: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v36 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v47 = v19;
        _os_log_impl(&dword_1D967A000, v36, OS_LOG_TYPE_INFO, "Received a delete command, but it was not from one of our own devices From: %@", buf, 0xCu);
      }
    }
    v22 = 0;
  }
}

- (void)handler:(id)a3 recoverCommand:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 fromIDSID:(id)a8 timeStamp:(id)a9 needsDeliveryReceipt:(id)a10 deliveryContext:(id)a11 storageContext:(id)a12
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v33 = a3;
  id v18 = a4;
  id v34 = a5;
  id v35 = a6;
  id v19 = a7;
  id v20 = a8;
  id v36 = a9;
  id v21 = a10;
  id v22 = a11;
  id v23 = a12;
  int v24 = [(IMDRelayDeletionController *)self relayController];
  v25 = [v24 idsDeviceFromPushToken:v19];

  if (v25
    || ([(IMDRelayDeletionController *)self relayController],
        v26 = objc_claimAutoreleasedReturnValue(),
        [v26 idsDeviceForFromID:v20],
        v25 = objc_claimAutoreleasedReturnValue(),
        v26,
        v25))
  {
    v27 = +[IMDCKUtilities sharedInstance];
    char v28 = [v27 cloudKitSyncingEnabled];

    int v29 = IMOSLoggingEnabled();
    if (v28)
    {
      if (v29)
      {
        int v30 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v40 = v18;
          _os_log_impl(&dword_1D967A000, v30, OS_LOG_TYPE_INFO, "Handling recover command: %@ (cloudKitSyncEnabled: YES)", buf, 0xCu);
        }
      }
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = sub_1D96ABC9C;
      v37[3] = &unk_1E6B732E0;
      v37[4] = self;
      id v38 = v18;
      [(IMDRelayDeletionController *)self _enqueueBlock:v37 withTimeout:45.0];
    }
    else if (v29)
    {
      int v31 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v40 = v18;
        _os_log_impl(&dword_1D967A000, v31, OS_LOG_TYPE_INFO, "iCloudSync not enabled, dropping recover command: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v32 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v40 = v19;
        _os_log_impl(&dword_1D967A000, v32, OS_LOG_TYPE_INFO, "Received a recover command, but it was not from one of our own devices From: %@", buf, 0xCu);
      }
    }
    v25 = 0;
  }
}

- (id)chatRegistry
{
  return +[IMDChatRegistry sharedInstance];
}

- (id)relayController
{
  return +[IMDRelayServiceController sharedInstance];
}

- (id)broadcasterForChatListenersForService:(id)a3
{
  id v3 = a3;
  v4 = +[IMDBroadcastController sharedProvider];
  v5 = [v4 broadcasterForChatListenersSupportingService:v3];

  return v5;
}

- (id)broadcasterForChatListenersForService:(id)a3 withBlackholeStatus:(BOOL)a4
{
  if (a4)
  {
    id v4 = a3;
    id v5 = +[IMDBroadcastController sharedProvider];
    v6 = [v5 broadcasterForBlackholeChatListenersSupportingService:v4];
  }
  else
  {
    id v5 = a3;
    v6 = [(IMDRelayDeletionController *)self broadcasterForChatListenersForService:v5];
  }

  return v6;
}

- (BOOL)shouldInferRecoverableDeleteForCommandDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"isPermanentDelete"];
  char v5 = [v4 BOOLValue];

  if (v5)
  {
    BOOL v6 = 0;
  }
  else
  {
    v7 = [v3 objectForKeyedSubscript:@"recoverableDeleteDate"];
    BOOL v6 = v7 == 0;
  }
  return v6;
}

- (id)deleteCommandDictionaryWithIncomingDictionary:(id)a3 inferredRecoverableDeleteForLegacyCommandsWithDate:(id)a4
{
  id v5 = a4;
  BOOL v6 = (void *)[a3 mutableCopy];
  v7 = [v6 objectForKeyedSubscript:@"permanentDeleteChatMetadataArray"];
  [v6 removeObjectForKey:@"permanentDeleteChatMetadataArray"];
  [v6 setObject:v7 forKeyedSubscript:@"chat"];
  [v6 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"isPermanentDelete"];
  [v6 setObject:v5 forKeyedSubscript:@"recoverableDeleteDate"];

  v8 = (void *)[v6 copy];

  return v8;
}

- (void)deleteChatsForCommandDictionary:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  id v4 = [v27 objectForKeyedSubscript:@"isPermanentDelete"];
  int v5 = [v4 BOOLValue];

  int v35 = v5;
  if (v5)
  {
    BOOL v6 = [v27 objectForKeyedSubscript:@"permanentDeleteChatMetadataArray"];
    id v34 = 0;
  }
  else
  {
    BOOL v6 = [v27 objectForKeyedSubscript:@"chat"];
    id v34 = [v27 objectForKeyedSubscript:@"recoverableDeleteDate"];
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = v6;
  uint64_t v30 = [obj countByEnumeratingWithState:&v43 objects:v55 count:16];
  if (v30)
  {
    v7 = @"NO";
    uint64_t v29 = *(void *)v44;
    if (v5) {
      v7 = @"YES";
    }
    v32 = v7;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v44 != v29)
        {
          uint64_t v9 = v8;
          objc_enumerationMutation(obj);
          uint64_t v8 = v9;
        }
        uint64_t v31 = v8;
        v10 = *(void **)(*((void *)&v43 + 1) + 8 * v8);
        [(IMDRelayDeletionController *)self _blocklistIfNeededForChatDict:v10];
        v11 = [(IMDRelayDeletionController *)self _chatsForDeleteAndRecoveryChatMetadataDictionary:v10];
        v12 = [v10 objectForKeyedSubscript:@"deleteIncomingMessages"];
        uint64_t v13 = [v12 BOOLValue];

        if (![v11 count] && IMOSLoggingEnabled())
        {
          v14 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            int v51 = v10;
            _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "IMDRelayDeletionController | Deletion: did not find any chats for chat metadata %@", buf, 0xCu);
          }
        }
        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id v33 = v11;
        uint64_t v15 = [v33 countByEnumeratingWithState:&v39 objects:v54 count:16];
        if (v15)
        {
          uint64_t v16 = *(void *)v40;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v40 != v16) {
                objc_enumerationMutation(v33);
              }
              id v18 = *(void **)(*((void *)&v39 + 1) + 8 * i);
              if (IMOSLoggingEnabled())
              {
                id v19 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  int v51 = v18;
                  __int16 v52 = 2112;
                  int v53 = v32;
                  _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "removing chat: %@, permanently: %@", buf, 0x16u);
                }
              }
              id v20 = [v18 guid];
              id v21 = [v18 service];
              id v22 = -[IMDRelayDeletionController broadcasterForChatListenersForService:withBlackholeStatus:](self, "broadcasterForChatListenersForService:withBlackholeStatus:", v21, [v18 isBlackholed]);

              id v23 = [(IMDRelayDeletionController *)self chatRegistry];
              if (v35)
              {
                int v49 = v20;
                int v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
                v36[0] = MEMORY[0x1E4F143A8];
                v36[1] = 3221225472;
                v36[2] = sub_1D96AC514;
                v36[3] = &unk_1E6B73308;
                id v37 = v22;
                id v38 = v20;
                [v23 permanentlyDeleteRecoverableMessagesInChatsWithGUIDs:v24 completionHandler:v36];

                v25 = v37;
              }
              else
              {
                __int16 v48 = v20;
                v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
                [v23 moveMessagesInChatsWithGUIDsToRecentlyDeleted:v26 deleteDate:v34];

                [(IMDRelayDeletionController *)self _updateLastMessageTimeStampForChat:v18 broadcaster:v22];
                id v47 = v20;
                v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
                [v22 movedMessagesToRecentlyDeletedForChatsWithGUIDs:v25 queryID:0 deletionDate:v34];
              }

              [v18 setDeletingIncomingMessages:v13];
            }
            uint64_t v15 = [v33 countByEnumeratingWithState:&v39 objects:v54 count:16];
          }
          while (v15);
        }

        uint64_t v8 = v31 + 1;
      }
      while (v31 + 1 != v30);
      uint64_t v30 = [obj countByEnumeratingWithState:&v43 objects:v55 count:16];
    }
    while (v30);
  }
}

- (void)deleteMessagesForCommandDictionary:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 objectForKeyedSubscript:@"message"];
  if (IMOSLoggingEnabled())
  {
    BOOL v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
      int v24 = 138412290;
      v25 = v7;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Deleting %@: messages", (uint8_t *)&v24, 0xCu);
    }
  }
  uint64_t v8 = [v4 objectForKeyedSubscript:@"isPermanentDelete"];
  char v9 = [v8 BOOLValue];

  v10 = +[IMDMessageStore sharedInstance];
  v11 = [v5 firstObject];
  v12 = [v10 chatForMessageGUID:v11];

  uint64_t v13 = [v12 service];
  v14 = [(IMDRelayDeletionController *)self broadcasterForChatListenersForService:v13 withBlackholeStatus:0];

  uint64_t v15 = [v12 service];
  uint64_t v16 = [(IMDRelayDeletionController *)self broadcasterForChatListenersForService:v15 withBlackholeStatus:1];

  int v17 = IMOSLoggingEnabled();
  if (v9)
  {
    if (v17)
    {
      id v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        int v24 = 138412290;
        v25 = v5;
        _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "Permanently deleting messages with GUID %@: ", (uint8_t *)&v24, 0xCu);
      }
    }
    id v19 = +[IMDMessageStore sharedInstance];
    id v20 = (id)[v19 deleteMessageGUIDs:v5];
  }
  else
  {
    if (v17)
    {
      id v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        int v24 = 138412290;
        v25 = v5;
        _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "Recoverably deleting messages with GUID %@: ", (uint8_t *)&v24, 0xCu);
      }
    }
    id v19 = [v4 objectForKeyedSubscript:@"recoverableDeleteDate"];
    if (IMOSLoggingEnabled())
    {
      id v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        int v24 = 138412290;
        v25 = v19;
        _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "Recently Deleted | messages delete date: %@", (uint8_t *)&v24, 0xCu);
      }
    }
    id v23 = [(IMDRelayDeletionController *)self chatRegistry];
    [v23 moveMessagesWithGUIDsToRecentlyDeleted:v5 deleteDate:v19];
  }
  [(IMDRelayDeletionController *)self _updateLastMessageTimeStampForChat:v12 broadcaster:v14];
  [v14 historicalMessageGUIDsDeleted:v5 chatGUIDs:0 queryID:0];
  [v16 historicalMessageGUIDsDeleted:v5 chatGUIDs:0 queryID:0];
}

- (void)deleteMessagePartsForCommandDictionary:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  uint64_t v31 = [v30 objectForKeyedSubscript:@"parts"];
  id v3 = v31;
  if ([v31 count])
  {
    id v4 = [v30 objectForKeyedSubscript:@"isPermanentDelete"];
    int v5 = [v4 BOOLValue];

    if (!v5)
    {
      v32 = [v30 objectForKeyedSubscript:@"recoverableDeleteDate"];
      if (IMOSLoggingEnabled())
      {
        v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          uint64_t v8 = [v31 count];
          char v9 = [v31 objectAtIndexedSubscript:0];
          *(_DWORD *)buf = 134218242;
          uint64_t v48 = v8;
          __int16 v49 = 2112;
          __int16 v50 = v9;
          _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Recently Deleted | Deleting message parts from %lu messages: %@", buf, 0x16u);
        }
      }
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id obj = v31;
      uint64_t v10 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
      if (v10)
      {
        uint64_t v35 = *(void *)v43;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v43 != v35) {
              objc_enumerationMutation(obj);
            }
            v12 = *(void **)(*((void *)&v42 + 1) + 8 * i);
            uint64_t v13 = [v12 objectForKeyedSubscript:@"messageGuid"];
            v14 = [v12 objectForKeyedSubscript:@"deleteSubject"];
            uint64_t v15 = [v14 BOOLValue];

            uint64_t v16 = +[IMDMessageStore sharedInstance];
            int v17 = [v16 messageWithGUID:v13];

            if (v17)
            {
              id v40 = 0;
              id v41 = 0;
              +[IMDDeletePartsHelper _convertDeletedPartsDict:v12 toIndexSet:&v41 toMap:&v40];
              id v18 = v41;
              id v19 = v40;
              if ([v18 count])
              {
                id v20 = [MEMORY[0x1E4F6E850] _messageItemWithIndexesDeleted:v18 subRangesToDeleteMapping:v19 deleteSubject:v15 deleteTransferCallback:0 createItemCallback:0 fromMessageItem:v17];
                if (IMOSLoggingEnabled())
                {
                  id v21 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412546;
                    uint64_t v48 = (uint64_t)v17;
                    __int16 v49 = 2112;
                    __int16 v50 = v20;
                    _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "Recently Deleted | Removed parts from old item %@, got new item: %@", buf, 0x16u);
                  }
                }
                id v22 = [v17 body];
                v36[0] = MEMORY[0x1E4F143A8];
                v36[1] = 3221225472;
                v36[2] = sub_1D96AD0B4;
                v36[3] = &unk_1E6B73330;
                id v37 = v18;
                id v38 = v17;
                id v39 = v32;
                objc_msgSend(v22, "__im_visitMessageParts:", v36);

                id v23 = +[IMDMessageStore sharedInstance];
                int v24 = [v23 chatForMessageGUID:v13];

                v25 = [v24 service];
                uint64_t v26 = [(IMDRelayDeletionController *)self broadcasterForChatListenersForService:v25];

                [(IMDRelayDeletionController *)self _updateLastMessageTimeStampForChat:v24 broadcaster:v26];
                id v27 = [v20 accountID];
                [v26 account:v27 chat:0 style:0 chatProperties:0 messageUpdated:v20];
              }
              else if (IMOSLoggingEnabled())
              {
                uint64_t v29 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v48 = (uint64_t)v13;
                  _os_log_impl(&dword_1D967A000, v29, OS_LOG_TYPE_INFO, "IMDRelayDeletionController: Recently Deleted | did not find indexes to delete at for GUID: %@", buf, 0xCu);
                }
              }
            }
            else if (IMOSLoggingEnabled())
            {
              char v28 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v48 = (uint64_t)v13;
                _os_log_impl(&dword_1D967A000, v28, OS_LOG_TYPE_INFO, "IMDRelayDeletionController: Recently Deleted | could not find messageItem for GUID: %@", buf, 0xCu);
              }
            }
          }
          uint64_t v10 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
        }
        while (v10);
      }

      goto LABEL_39;
    }
    id v3 = v31;
    if (IMOSLoggingEnabled())
    {
      BOOL v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "IMDRelayDeletionController: Recently Deleted | Received permanent delete command. This is unsupported", buf, 2u);
      }
LABEL_6:

LABEL_39:
      id v3 = v31;
    }
  }
  else if (IMOSLoggingEnabled())
  {
    BOOL v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "IMDRelayDeletionController: Recently Deleted | Received empty parts-mardid command", buf, 2u);
    }
    goto LABEL_6;
  }
}

- (void)_handleDeleteCommandWithMessageDictionary:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(IMDRelayDeletionController *)self deleteChatsForCommandDictionary:v4];
  int v5 = [v4 objectForKeyedSubscript:@"chat-clear"];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [(IMDRelayDeletionController *)self _chatsForDeleteAndRecoveryChatMetadataDictionary:*(void *)(*((void *)&v16 + 1) + 8 * i)];
        if ([v10 count])
        {
          v11 = (void *)MEMORY[0x1E4F1CAD0];
          v12 = [v10 arrayByApplyingSelector:sel_guid];
          uint64_t v13 = [v11 setWithArray:v12];

          [(IMDRelayDeletionController *)self _doClearChats:v13];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
  v14 = [v4 objectForKeyedSubscript:@"message"];
  if (v14) {
    [(IMDRelayDeletionController *)self deleteMessagesForCommandDictionary:v4];
  }
  uint64_t v15 = [v4 objectForKeyedSubscript:@"parts"];
  if ([v15 count]) {
    [(IMDRelayDeletionController *)self deleteMessagePartsForCommandDictionary:v4];
  }
}

- (void)recoverChatsForCommandDictionary:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  [v17 objectForKeyedSubscript:@"recoverChatMetadataArray"];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v20 = [obj countByEnumeratingWithState:&v27 objects:v34 count:16];
  if (v20)
  {
    uint64_t v19 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v28 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v6 = [(IMDRelayDeletionController *)self _chatsForDeleteAndRecoveryChatMetadataDictionary:v5];
        if ([v6 count])
        {
          uint64_t v21 = [v6 arrayByApplyingSelector:sel_guid];
          uint64_t v7 = [(IMDRelayDeletionController *)self chatRegistry];
          [v7 recoverMessagesWithChatGUIDs:v21];

          long long v25 = 0u;
          long long v26 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          id v8 = v6;
          uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (v9)
          {
            uint64_t v10 = *(void *)v24;
            do
            {
              for (uint64_t j = 0; j != v9; ++j)
              {
                if (*(void *)v24 != v10) {
                  objc_enumerationMutation(v8);
                }
                v12 = *(void **)(*((void *)&v23 + 1) + 8 * j);
                uint64_t v13 = [v12 service];
                v14 = [(IMDRelayDeletionController *)self broadcasterForChatListenersForService:v13 withBlackholeStatus:0];

                [(IMDRelayDeletionController *)self _updateLastMessageTimeStampForChat:v12 broadcaster:v14];
                [v12 setDeletingIncomingMessages:0];
              }
              uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v31 count:16];
            }
            while (v9);
          }

          uint64_t v15 = [(IMDRelayDeletionController *)self _groupChatsByService:v8];
          v22[0] = MEMORY[0x1E4F143A8];
          v22[1] = 3221225472;
          v22[2] = sub_1D96AD75C;
          v22[3] = &unk_1E6B73358;
          v22[4] = self;
          [v15 enumerateKeysAndObjectsUsingBlock:v22];
        }
        else if (IMOSLoggingEnabled())
        {
          long long v16 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v33 = v5;
            _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "IMDRelayDeletionController | Recovery: did not find any chats for chat metadata %@", buf, 0xCu);
          }
        }
      }
      uint64_t v20 = [obj countByEnumeratingWithState:&v27 objects:v34 count:16];
    }
    while (v20);
  }
}

- (id)_chatsForDeleteAndRecoveryChatMetadataDictionary:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v36 = a3;
  id v34 = [v36 objectForKeyedSubscript:@"guid"];
  uint64_t v33 = [v36 objectForKeyedSubscript:@"groupID"];
  uint64_t v35 = [v36 objectForKeyedSubscript:@"ptcpts"];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v45 = (uint64_t)v34;
      __int16 v46 = 2112;
      id v47 = v33;
      __int16 v48 = 2112;
      __int16 v49 = v35;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Finding chats for delete or recovery using guid %@ groupID %@ participants %@", buf, 0x20u);
    }
  }
  uint64_t v6 = [(IMDRelayDeletionController *)self chatRegistry];
  uint64_t v7 = [v6 existingChatWithGUID:v34];

  v32 = [v7 service];
  if (v7)
  {
    if (IMOSLoggingEnabled())
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        uint64_t v9 = [v7 guid];
        *(_DWORD *)buf = 138412290;
        uint64_t v45 = (uint64_t)v9;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Found chat with specific guid %@ for chat metadata", buf, 0xCu);
      }
    }
    uint64_t v10 = [v7 guid];
    [v4 addObject:v10];
  }
  v11 = [(IMDRelayDeletionController *)self chatRegistry];
  v12 = [v11 existingChatsWithGroupID:v33];

  if ([v12 count])
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = [v12 count];
        *(_DWORD *)buf = 134218498;
        uint64_t v45 = v14;
        __int16 v46 = 2112;
        id v47 = v33;
        __int16 v48 = 2112;
        __int16 v49 = v12;
        _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Found %llu chats with specific group ID %@ for chat metadata: %@", buf, 0x20u);
      }
    }
    uint64_t v15 = [v12 arrayByApplyingSelector:sel_guid];
    [v4 addObjectsFromArray:v15];
  }
  if ((unint64_t)[v35 count] >= 2)
  {
    long long v16 = [(IMDRelayDeletionController *)self chatRegistry];
    id v17 = [v16 existingChatsForIDs:v35 onService:v32 style:43];

    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = sub_1D96ADE7C;
    v41[3] = &unk_1E6B73380;
    id v42 = v32;
    long long v18 = objc_msgSend(v17, "__imArrayByFilteringWithBlock:", v41);

    if ([v18 count])
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v19 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          uint64_t v20 = [v18 count];
          *(_DWORD *)buf = 134218498;
          uint64_t v45 = v20;
          __int16 v46 = 2112;
          id v47 = v35;
          __int16 v48 = 2112;
          __int16 v49 = v18;
          _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "Found %llu chats with handles: %@ chats: %@", buf, 0x20u);
        }
      }
      uint64_t v21 = [v18 arrayByApplyingSelector:sel_guid];
      [v4 addObjectsFromArray:v21];
    }
  }
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v23 = v4;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v38 != v25) {
          objc_enumerationMutation(v23);
        }
        uint64_t v27 = *(void *)(*((void *)&v37 + 1) + 8 * i);
        long long v28 = [(IMDRelayDeletionController *)self chatRegistry];
        long long v29 = [v28 existingChatWithGUID:v27];

        if (v29) {
          [v22 addObject:v29];
        }
      }
      uint64_t v24 = [v23 countByEnumeratingWithState:&v37 objects:v43 count:16];
    }
    while (v24);
  }

  if (IMOSLoggingEnabled())
  {
    long long v30 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v45 = (uint64_t)v22;
      __int16 v46 = 2112;
      id v47 = v34;
      _os_log_impl(&dword_1D967A000, v30, OS_LOG_TYPE_INFO, "Found %llu chats for delete command with guid %@", buf, 0x16u);
    }
  }

  return v22;
}

- (void)_doClearChats:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v7)
  {
    uint64_t v9 = *(void *)v31;
    unsigned __int8 v10 = 45;
    *(void *)&long long v8 = 138412290;
    long long v24 = v8;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v13 = [(IMDRelayDeletionController *)self chatRegistry];
        uint64_t v14 = [v13 existingChatWithGUID:v12];

        if (v14)
        {
          uint64_t v15 = [v14 chatIdentifier];
          [v26 addObject:v15];

          long long v16 = [v14 serviceName];
          [v5 addObject:v16];

          unsigned __int8 v10 = [v14 style];
          [v6 addObject:v14];
        }
        else if (IMOSLoggingEnabled())
        {
          id v17 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v24;
            id v35 = v12;
            _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "Handling chat-clear, could not find chat by GUID: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v7);
  }
  else
  {
    unsigned __int8 v10 = 45;
  }

  if (IMOSLoggingEnabled())
  {
    long long v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v35 = v26;
      __int16 v36 = 2112;
      id v37 = v5;
      _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "clearing messages for chat IDS:%@ on services:%@", buf, 0x16u);
    }
  }
  uint64_t v19 = +[IMDMessageStore sharedInstance];
  uint64_t v20 = [v19 deleteMessagesWithChatIdentifiers:v26 style:v10 onServices:v5];

  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = sub_1D96AE3A8;
  v28[3] = &unk_1E6B73380;
  id v29 = v20;
  id v21 = v20;
  id v22 = objc_msgSend(v6, "__imArrayByFilteringWithBlock:", v28);
  id v23 = [(IMDRelayDeletionController *)self _groupChatsByService:v22];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = sub_1D96AE3F0;
  v27[3] = &unk_1E6B73358;
  v27[4] = self;
  [v23 enumerateKeysAndObjectsUsingBlock:v27];
}

- (id)_groupChatsByService:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        unsigned __int8 v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "serviceName", (void)v22);
        if (v11)
        {
          v12 = (void *)v11;
          uint64_t v13 = [v10 guid];

          if (v13)
          {
            uint64_t v14 = [v10 serviceName];
            uint64_t v15 = [v4 objectForKeyedSubscript:v14];
            long long v16 = v15;
            if (v15) {
              id v17 = v15;
            }
            else {
              id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            }
            long long v18 = v17;

            uint64_t v19 = [v10 guid];
            [v18 addObject:v19];

            uint64_t v20 = [v10 serviceName];
            [v4 setObject:v18 forKeyedSubscript:v20];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)_updateLastMessageTimeStampForChat:(id)a3 broadcaster:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    uint64_t v7 = +[IMDMessageStore sharedInstance];
    uint64_t v8 = objc_msgSend(v7, "lastMessageForChatWithRowID:", objc_msgSend(v5, "rowID"));
    [v5 setLastMessage:v8];

    uint64_t v9 = [v5 lastMessage];

    if (v9)
    {
      unsigned __int8 v10 = [v5 lastMessage];
      uint64_t v11 = [v10 time];
      [v11 timeIntervalSinceReferenceDate];
      [v5 setLastMessageTimeStampOnLoad:(uint64_t)v12];
    }
    else
    {
      [v5 setLastMessageTimeStampOnLoad:0];
    }
    uint64_t v14 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v15 = [v14 isAVLessSharePlayEnabled];

    if (v15)
    {
      long long v16 = +[IMDMessageStore sharedInstance];
      id v17 = [v16 lastTUConversationItemForChat:v5];

      if (v17)
      {
        long long v18 = [v17 time];

        if (v18)
        {
          uint64_t v19 = [v17 time];
          [v5 setLastTUConversationCreatedDate:v19];
        }
        else
        {
          uint64_t v20 = IMLogHandleForCategory();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            sub_1D98FE180((uint64_t)v17, v20);
          }
        }
      }
      else
      {
        [v5 setLastTUConversationCreatedDate:0];
      }
    }
    if (IMOSLoggingEnabled())
    {
      id v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        long long v22 = [v5 guid];
        long long v23 = NSNumber;
        long long v24 = [v5 lastMessage];
        long long v25 = [v24 time];
        [v25 timeIntervalSinceReferenceDate];
        id v26 = objc_msgSend(v23, "numberWithDouble:");
        int v28 = 138412546;
        id v29 = v22;
        __int16 v30 = 2112;
        long long v31 = v26;
        _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "Recently Deleted | IMDChat: %@, updating last message timestamp on load: %@", (uint8_t *)&v28, 0x16u);
      }
    }
    uint64_t v27 = [v5 guid];
    objc_msgSend(v6, "chat:lastMessageTimeStampOnLoadUpdated:", v27, (double)objc_msgSend(v5, "lastMessageTimeStampOnLoad"));
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      LOWORD(v28) = 0;
      _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Recently Deleted | _updateLastMessageTimeStampForChat received nil chat", (uint8_t *)&v28, 2u);
    }
  }
}

- (void)_enqueueBlock:(id)a3 withTimeout:(double)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412546;
      uint64_t v13 = @"IMDRelayDeletionController";
      __int16 v14 = 2048;
      double v15 = a4;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, " Enqueued item for key: %@    timeout: %f", (uint8_t *)&v12, 0x16u);
    }
  }
  incomingMessageMultiQueue = self->_incomingMessageMultiQueue;
  if (!incomingMessageMultiQueue)
  {
    uint64_t v9 = (IMMultiQueue *)objc_alloc_init(MEMORY[0x1E4F6C388]);
    uint64_t v11 = self->_incomingMessageMultiQueue;
    p_incomingMessageMultiQueue = &self->_incomingMessageMultiQueue;
    *p_incomingMessageMultiQueue = v9;

    incomingMessageMultiQueue = *p_incomingMessageMultiQueue;
  }
  [(IMMultiQueue *)incomingMessageMultiQueue addBlock:v6 withTimeout:@"IMDRelayDeletionController" forKey:0 description:a4];
}

- (IMMultiQueue)incomingMessageMultiQueue
{
  return self->_incomingMessageMultiQueue;
}

- (void)setIncomingMessageMultiQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
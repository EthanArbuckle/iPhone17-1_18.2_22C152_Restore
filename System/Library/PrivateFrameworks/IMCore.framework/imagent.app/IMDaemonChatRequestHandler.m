@interface IMDaemonChatRequestHandler
- (id)_chatDictionariesWithLastMessageRecordDateFromDictionaries:(id)a3;
- (id)_chatsWithIsBlackholed:(BOOL)a3 inChats:(id)a4;
- (void)_loadChat:(id)a3 completionHandler:(id)a4;
- (void)_loadChats:(id)a3 completionHandler:(id)a4;
- (void)_updateMessage:(id)a3;
- (void)chat:(id)a3 updateDisplayName:(id)a4 messageID:(id)a5;
- (void)chat:(id)a3 updateIsBlackholed:(BOOL)a4;
- (void)chat:(id)a3 updateIsDeletingIncomingMessages:(BOOL)a4;
- (void)chat:(id)a3 updateIsFiltered:(int64_t)a4;
- (void)chat:(id)a3 updateIsRecovered:(BOOL)a4;
- (void)chat:(id)a3 updateLastAddressHandle:(id)a4;
- (void)chat:(id)a3 updateLastAddressedSIMID:(id)a4;
- (void)chat:(id)a3 updateLastKnownHybridState:(BOOL)a4;
- (void)chat:(id)a3 updateProperties:(id)a4;
- (void)closeSessionChatID:(id)a3 identifier:(id)a4 didDeleteConversation:(BOOL)a5 style:(unsigned __int8)a6 account:(id)a7;
- (void)declineInvitationToChatID:(id)a3 identifier:(id)a4 style:(unsigned __int8)a5 account:(id)a6;
- (void)dismissNotice:(id)a3;
- (void)fetchCollaborationNoticesForChatGUID:(id)a3 reply:(id)a4;
- (void)fetchCommonCapabilities:(id)a3 fromChatWithGUID:(id)a4 reply:(id)a5;
- (void)leaveChatID:(id)a3 style:(unsigned __int8)a4 account:(id)a5;
- (void)loadAllChats;
- (void)loadAnyChatsContainingHandleIDsIn:(id)a3 reply:(id)a4;
- (void)loadChatWithChatIdentifier:(id)a3;
- (void)loadChatWithGUID:(id)a3 queryID:(id)a4;
- (void)loadChatWithGUID:(id)a3 reply:(id)a4;
- (void)loadChatsFilteredUsingPredicate:(id)a3 lastMessageOlderThan:(id)a4 limit:(int64_t)a5 queryID:(id)a6;
- (void)loadChatsFilteredUsingPredicate:(id)a3 lastMessageOlderThan:(id)a4 limit:(int64_t)a5 reply:(id)a6;
- (void)loadChatsFilteredUsingPredicate:(id)a3 queryID:(id)a4;
- (void)loadChatsFilteredUsingPredicate:(id)a3 reply:(id)a4;
- (void)loadChatsWithGroupID:(id)a3 queryID:(id)a4;
- (void)loadChatsWithGroupID:(id)a3 reply:(id)a4;
- (void)loadChatsWithHandleIDs:(id)a3 groupID:(id)a4 displayName:(id)a5 style:(unsigned __int8)a6 queryID:(id)a7;
- (void)loadChatsWithHandleIDs:(id)a3 groupID:(id)a4 displayName:(id)a5 style:(unsigned __int8)a6 reply:(id)a7;
- (void)loadChatsWithIdentifier:(id)a3 queryID:(id)a4;
- (void)loadChatsWithIdentifier:(id)a3 reply:(id)a4;
- (void)loadChatsWithPinningIdentifier:(id)a3 reply:(id)a4;
- (void)markChatsAsReadFilteredUsingPredicate:(id)a3;
- (void)markMessageAsCorrupt:(id)a3 setCorrupt:(BOOL)a4;
- (void)markRepliedForMessageGUID:(id)a3;
- (void)recoverChatsFromJunkContainingMessageWithGUID:(id)a3;
- (void)removeChat:(id)a3;
- (void)removeChatID:(id)a3 identifier:(id)a4 style:(unsigned __int8)a5 account:(id)a6;
- (void)requestPendingMessages;
- (void)sendBalloonPayload:(id)a3 attachments:(id)a4 withMessageGUID:(id)a5 bundleID:(id)a6;
- (void)sendCommand:(id)a3 withProperties:(id)a4 toPerson:(id)a5 account:(id)a6;
- (void)sendCommand:(id)a3 withProperties:(id)a4 toPerson:(id)a5 account:(id)a6 toChatID:(id)a7 identifier:(id)a8 style:(unsigned __int8)a9;
- (void)sendPlayedReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 account:(id)a7;
- (void)sendReadReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 account:(id)a7;
- (void)sendSavedReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 account:(id)a7;
- (void)sendStickerAtPath:(id)a3 toChatID:(id)a4 forNBubbleFromTheBottom:(int64_t)a5 atX:(id)a6 atY:(id)a7 scale:(id)a8 balloonWidth:(id)a9;
- (void)sendSyndicationAction:(id)a3 toChatsWithIdentifiers:(id)a4;
- (void)sendUpdatedCollaborationMetadata:(id)a3 toChatsWithIdentifiers:(id)a4 forMessageGUID:(id)a5;
- (void)setProperties:(id)a3 ofParticipant:(id)a4 inChatID:(id)a5 identifier:(id)a6 style:(unsigned __int8)a7 account:(id)a8;
- (void)stopTranscriptSharingWithChat:(id)a3;
- (void)storeItem:(id)a3 inChatGUID:(id)a4;
- (void)unblackholeAndLoadChatWithHandleIDs:(id)a3 reply:(id)a4;
- (void)unreadCountWithCompletion:(id)a3;
- (void)updateBalloonPayload:(id)a3 attachments:(id)a4 forMessageGUID:(id)a5;
- (void)updateMessage:(id)a3;
- (void)updateMessage:(id)a3 withIndexesOfDeletedItems:(id)a4 withIndexToRangeMapOfDeletedItems:(id)a5 deleteDate:(id)a6;
- (void)updateNotice:(id)a3;
@end

@implementation IMDaemonChatRequestHandler

- (void)requestPendingMessages
{
  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Request for pending messages no longer supported", v3, 2u);
    }
  }
}

- (void)storeItem:(id)a3 inChatGUID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (IMOSLoggingEnabled())
  {
    v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = +[IMDClientRequestContext currentContext];
      v9 = [v8 listenerID];
      int v11 = 138412802;
      v12 = v9;
      __int16 v13 = 2112;
      id v14 = v5;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Request from %@ to store item: %@  inChatGUID: %@", (uint8_t *)&v11, 0x20u);
    }
  }
  v10 = IMSingleObjectArray();
  sub_10001E054(v10, v6, 0);
}

- (void)markMessageAsCorrupt:(id)a3 setCorrupt:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = (__CFString *)a3;
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = +[IMDClientRequestContext currentContext];
      v8 = [v7 listenerID];
      CFStringRef v9 = @"NO";
      *(_DWORD *)buf = 138412802;
      CFStringRef v24 = v8;
      __int16 v25 = 2112;
      if (v4) {
        CFStringRef v9 = @"YES";
      }
      CFStringRef v26 = v5;
      __int16 v27 = 2112;
      CFStringRef v28 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Request from %@ to mark message with IDs as corrupt: %@ setCorrupt: %@", buf, 0x20u);
    }
  }
  v10 = +[IMDMessageStore sharedInstance];
  int v11 = [v10 messageWithGUID:v5 registerAttachments:0];

  if (v11)
  {
    unint64_t v12 = (unint64_t)[v11 flags];
    unsigned int v13 = [v11 isCorrupt];
    if (v4)
    {
      if ((v13 & 1) == 0)
      {
        unint64_t v14 = v12 | 0x4000000;
LABEL_17:
        [v11 setFlags:v14];
        id v16 = +[IMDMessageStore sharedInstance];
        LOBYTE(v22) = 0;
        id v17 = [v16 storeMessage:v11 forceReplace:1 modifyError:0 modifyFlags:1 flagMask:0 updateMessageCache:0 calculateUnreadCount:v22];

        goto LABEL_27;
      }
    }
    else if (v13)
    {
      unint64_t v14 = v12 & 0xFFFFFFFFFBFFFFFFLL;
      goto LABEL_17;
    }
    if (IMOSLoggingEnabled())
    {
      v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        unsigned int v19 = [v11 isCorrupt];
        CFStringRef v20 = @"NO";
        if (v19) {
          CFStringRef v21 = @"YES";
        }
        else {
          CFStringRef v21 = @"NO";
        }
        if (v4) {
          CFStringRef v20 = @"YES";
        }
        *(_DWORD *)buf = 138412546;
        CFStringRef v24 = v21;
        __int16 v25 = 2112;
        CFStringRef v26 = v20;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Tried to mark a message as corrupt whose value already matched what we wanted to set it to {[messageItem isCorrupt]: %@ value to set isCorrupt %@", buf, 0x16u);
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    __int16 v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v24 = v5;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "We didn't have a message to mark as corrupt for guid %@ ", buf, 0xCu);
    }
  }
LABEL_27:
}

- (void)removeChat:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[IMDChatRegistry sharedInstance];
  id v5 = [v4 existingChatWithGUID:v3];

  id v6 = [v5 serviceName];
  unsigned int v7 = [v6 isEqualToString:IMServiceNameSMS];

  if (v7) {
    IMGreenTeaMessageDeleteLog();
  }
  if (IMOSLoggingEnabled())
  {
    v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v33 = v3;
      __int16 v34 = 2112;
      v35 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Remove guid: %@  chat: %@", buf, 0x16u);
    }
  }
  int v9 = IMOSLoggingEnabled();
  if (v5)
  {
    if (v9)
    {
      v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v33 = v5;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Removing chat from registry: %@", buf, 0xCu);
      }
    }
    int v11 = [v5 serviceName];
    unsigned int v12 = [v11 isEqualToString:IMServiceNameSMS];

    unsigned int v13 = +[IMDAccountController sharedInstance];
    unint64_t v14 = v13;
    __int16 v15 = &IMServiceNameiMessage;
    if (v12) {
      __int16 v15 = &IMServiceNameSMS;
    }
    id v16 = [v13 anySessionForServiceName:*v15];

    v31[0] = v3;
    v30[0] = IMDCommandChatGUIDKey;
    v30[1] = IMDCommandChatGroupIDKey;
    id v17 = [v5 groupID];
    v31[1] = v17;
    v30[2] = IMDCommandChatParticipantsKey;
    v18 = [v5 participantHandles];
    v31[2] = v18;
    v30[3] = IMDChatWasReportedAsJunkKey;
    unsigned int v19 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v5 wasReportedAsJunk]);
    v31[3] = v19;
    CFStringRef v20 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:4];

    __int16 v27 = v20;
    v28[0] = IMDPermanentDeleteCommandChatMetadataArrayKey;
    CFStringRef v21 = +[NSArray arrayWithObjects:&v27 count:1];
    v28[1] = IMDDeleteCommandIsPermanentDeleteKey;
    v29[0] = v21;
    v29[1] = &__kCFBooleanTrue;
    uint64_t v22 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];

    [v16 sendDeleteCommand:v22 forChatGUID:v3];
    [v16 willRemoveChat:v5];
    v23 = +[IMDChatRegistry sharedInstance];
    [v23 removeChat:v5];

    CFStringRef v24 = +[IMDBroadcastController sharedProvider];
    __int16 v25 = objc_msgSend(v24, "broadcasterForChatListenersUsingBlackholeRegistry:", objc_msgSend(v5, "isBlackholed"));
    [v25 leftChat:v3];
  }
  else if (v9)
  {
    CFStringRef v26 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v3;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "No chat found for GUID: %@", buf, 0xCu);
    }
  }
}

- (void)chat:(id)a3 updateDisplayName:(id)a4 messageID:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = +[IMDChatRegistry sharedInstance];
  int v11 = [v10 existingChatWithGUID:v7];

  if (IMOSLoggingEnabled())
  {
    unsigned int v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v19 = v7;
      __int16 v20 = 2112;
      CFStringRef v21 = v11;
      __int16 v22 = 2112;
      id v23 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Chat Identifier: %@  Chat: %@  Update display name: %@", buf, 0x20u);
    }
  }
  if (v11)
  {
    unsigned int v13 = [v11 displayName];
    unint64_t v14 = [v11 lastAddressedLocalHandle];
    __int16 v15 = [v11 serviceSession];
    id v16 = [v11 guid];
    id v17 = [v11 chatIdentifier];
    objc_msgSend(v15, "updateDisplayName:fromDisplayName:fromID:forChatID:identifier:style:messageID:", v8, v13, v14, v16, v17, objc_msgSend(v11, "style"), v9);
  }
}

- (void)chat:(id)a3 updateIsFiltered:(int64_t)a4
{
  id v5 = a3;
  id v6 = +[IMDChatRegistry sharedInstance];
  id v7 = [v6 existingChatWithGUID:v5];

  if (v7)
  {
    id v8 = [v7 unreadCount];
    if (IMOSLoggingEnabled())
    {
      id v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        CFStringRef v10 = @"YES";
        *(_DWORD *)unsigned int v13 = 67109890;
        *(_DWORD *)&v13[4] = a4;
        if (!v8) {
          CFStringRef v10 = @"NO";
        }
        *(_WORD *)&v13[8] = 2112;
        *(void *)&v13[10] = v10;
        __int16 v14 = 2112;
        id v15 = v5;
        __int16 v16 = 2112;
        id v17 = v7;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Updating isFiltered to %d (recalculate unread: %@) for chat: %@: %@", v13, 0x26u);
      }
    }
    objc_msgSend(v7, "updateIsFiltered:", a4, *(void *)v13);
    if (v8)
    {
      int v11 = +[IMDChatRegistry sharedInstance];
      [v11 updateStateForChat:v7 forcePost:1 shouldRebuildFailedMessageDate:0 shouldCalculateUnreadCount:1];
    }
  }
  else if (IMOSLoggingEnabled())
  {
    unsigned int v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)unsigned int v13 = 138412290;
      *(void *)&v13[4] = v5;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "No chat found for GUID: %@", v13, 0xCu);
    }
  }
}

- (void)chat:(id)a3 updateIsBlackholed:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = +[IMDChatRegistry sharedInstance];
  id v7 = [v6 existingChatWithGUID:v5];

  int v8 = IMOSLoggingEnabled();
  if (v7)
  {
    if (v8)
    {
      id v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        CFStringRef v10 = @"NO";
        *(_DWORD *)unsigned int v12 = 138412802;
        if (v4) {
          CFStringRef v10 = @"YES";
        }
        *(void *)&v12[4] = v10;
        __int16 v13 = 2112;
        id v14 = v5;
        __int16 v15 = 2112;
        __int16 v16 = v7;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Updating isBlackholed to %@ chat from for chat: %@: %@", v12, 0x20u);
      }
    }
    objc_msgSend(v7, "updateIsBlackholed:", v4, *(void *)v12);
  }
  else if (v8)
  {
    int v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)unsigned int v12 = 138412290;
      *(void *)&v12[4] = v5;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "No chat found for GUID: %@", v12, 0xCu);
    }
  }
}

- (void)chat:(id)a3 updateIsRecovered:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = +[IMDChatRegistry sharedInstance];
  id v7 = [v6 existingChatWithGUID:v5];

  int v8 = IMOSLoggingEnabled();
  if (v7)
  {
    if (v8)
    {
      id v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        CFStringRef v10 = @"NO";
        *(_DWORD *)unsigned int v12 = 138412802;
        if (v4) {
          CFStringRef v10 = @"YES";
        }
        *(void *)&v12[4] = v10;
        __int16 v13 = 2112;
        id v14 = v5;
        __int16 v15 = 2112;
        __int16 v16 = v7;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Updating isRecovered to %@ chat from for chat: %@: %@", v12, 0x20u);
      }
    }
    objc_msgSend(v7, "updateIsRecovered:", v4, *(void *)v12);
  }
  else if (v8)
  {
    int v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)unsigned int v12 = 138412290;
      *(void *)&v12[4] = v5;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "No chat found for GUID: %@", v12, 0xCu);
    }
  }
}

- (void)chat:(id)a3 updateLastKnownHybridState:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = +[IMDChatRegistry sharedInstance];
  id v7 = [v6 existingChatWithGUID:v5];

  int v8 = IMOSLoggingEnabled();
  if (v7)
  {
    if (v8)
    {
      id v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        CFStringRef v10 = @"NO";
        *(_DWORD *)unsigned int v12 = 136315650;
        *(void *)&v12[4] = "-[IMDaemonChatRequestHandler chat:updateLastKnownHybridState:]";
        *(_WORD *)&unsigned char v12[12] = 2112;
        *(void *)&v12[14] = v5;
        if (v4) {
          CFStringRef v10 = @"YES";
        }
        *(_WORD *)&v12[22] = 2112;
        CFStringRef v13 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s %@ %@", v12, 0x20u);
      }
    }
    objc_msgSend(v7, "updateLastKnownHybridStateAndRemergeIfAppropriate:", v4, *(_OWORD *)v12, *(void *)&v12[16]);
  }
  else if (v8)
  {
    int v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)unsigned int v12 = 136315394;
      *(void *)&v12[4] = "-[IMDaemonChatRequestHandler chat:updateLastKnownHybridState:]";
      *(_WORD *)&unsigned char v12[12] = 2112;
      *(void *)&v12[14] = v5;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s No chat found for GUID: %@", v12, 0x16u);
    }
  }
}

- (void)chat:(id)a3 updateIsDeletingIncomingMessages:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = +[IMDChatRegistry sharedInstance];
  id v7 = [v6 existingChatWithGUID:v5];

  int v8 = IMOSLoggingEnabled();
  if (v7)
  {
    if (v8)
    {
      id v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        CFStringRef v10 = @"NO";
        *(_DWORD *)unsigned int v12 = 138412802;
        if (v4) {
          CFStringRef v10 = @"YES";
        }
        *(void *)&v12[4] = v10;
        __int16 v13 = 2112;
        id v14 = v5;
        __int16 v15 = 2112;
        __int16 v16 = v7;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Updating isDeletingIncomingMessages to %@ chat from for chat: %@: %@", v12, 0x20u);
      }
    }
    objc_msgSend(v7, "updateIsDeletingIncomingMessages:", v4, *(void *)v12);
  }
  else if (v8)
  {
    int v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)unsigned int v12 = 138412290;
      *(void *)&v12[4] = v5;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "No chat found for GUID: %@", v12, 0xCu);
    }
  }
}

- (void)chat:(id)a3 updateProperties:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[IMDChatRegistry sharedInstance];
  int v8 = [v7 existingChatWithGUID:v5];

  if (IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412802;
      id v14 = v5;
      __int16 v15 = 2112;
      __int16 v16 = v8;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Chat Identifier: %@  Chat: %@  Update properties: %@", (uint8_t *)&v13, 0x20u);
    }
  }
  if (v8 && [v6 count])
  {
    [v8 updateProperties:v6];
    CFStringRef v10 = +[IMDBroadcastController sharedProvider];
    int v11 = objc_msgSend(v10, "broadcasterForChatListenersUsingBlackholeRegistry:", objc_msgSend(v8, "isBlackholed"));
    unsigned int v12 = [v8 properties];
    [v11 chat:v5 propertiesUpdated:v12];
  }
}

- (void)chat:(id)a3 updateLastAddressHandle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[IMDChatRegistry sharedInstance];
  int v8 = [v7 existingChatWithGUID:v5];

  if (IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412802;
      id v13 = v5;
      __int16 v14 = 2112;
      __int16 v15 = v8;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Chat Identifier: %@  Chat: %@  Update last addressed handle: %@", (uint8_t *)&v12, 0x20u);
    }
  }
  if (v8)
  {
    [v8 updateLastAddressedHandle:v6];
    CFStringRef v10 = +[IMDBroadcastController sharedProvider];
    int v11 = objc_msgSend(v10, "broadcasterForChatListenersUsingBlackholeRegistry:", objc_msgSend(v8, "isBlackholed"));
    [v11 chat:v5 lastAddressedHandleUpdated:v6];
  }
}

- (void)chat:(id)a3 updateLastAddressedSIMID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[IMDChatRegistry sharedInstance];
  int v8 = [v7 existingChatWithGUID:v5];

  if (IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412802;
      id v13 = v5;
      __int16 v14 = 2112;
      __int16 v15 = v8;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Chat Identifier: %@  Chat: %@  Update last addressed unique ID: %@", (uint8_t *)&v12, 0x20u);
    }
  }
  if (v8)
  {
    [v8 updateLastAddressedSIMID:v6];
    CFStringRef v10 = +[IMDBroadcastController sharedProvider];
    int v11 = objc_msgSend(v10, "broadcasterForChatListenersUsingBlackholeRegistry:", objc_msgSend(v8, "isBlackholed"));
    [v11 chat:v5 lastAddressedSIMIDUpdated:v6];
  }
}

- (void)updateMessage:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = +[IMDClientRequestContext currentContext];
      id v7 = [v6 listenerID];
      int v8 = 138412546;
      id v9 = v7;
      __int16 v10 = 2112;
      id v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Request from %@ to update messages: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  [(IMDaemonChatRequestHandler *)self _updateMessage:v4];
}

- (void)_updateMessage:(id)a3
{
  id v3 = a3;
  id v4 = +[IMDMessageStore sharedInstance];
  id v5 = [v3 guid];
  id v6 = [v4 messageWithGUID:v5];

  id v7 = +[IMDMessageStore sharedInstance];
  int v8 = [v3 guid];
  id v9 = [v7 chatForMessageGUID:v8];

  __int16 v10 = [v9 serviceName];
  LODWORD(v8) = [v10 isEqualToString:IMServiceNameSMS];

  if (v8) {
    IMGreenTeaMessageDeleteLog();
  }
  if (v6)
  {
    id v11 = +[IMDMessageStore sharedInstance];
    LOBYTE(v19) = 1;
    int v12 = [v11 storeMessage:v3 forceReplace:0 modifyError:1 modifyFlags:1 flagMask:1638400 updateMessageCache:1 calculateUnreadCount:v19];

    unsigned int v13 = [v12 isEqual:v3];
    if (IMOSLoggingEnabled())
    {
      __int16 v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        CFStringRef v15 = @"YES";
        if (v13) {
          CFStringRef v15 = @"NO";
        }
        *(_DWORD *)buf = 138412546;
        CFStringRef v21 = v12;
        __int16 v22 = 2112;
        CFStringRef v23 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "   updated message: %@   changed? %@", buf, 0x16u);
      }
    }
    if ((v13 & 1) == 0)
    {
      __int16 v16 = +[IMDBroadcastController sharedProvider];
      id v17 = [v16 broadcasterForChatListeners];
      id v18 = [v12 accountID];
      [v17 account:v18 chat:0 style:0 chatProperties:0 messageUpdated:v12];
    }
  }
}

- (void)updateMessage:(id)a3 withIndexesOfDeletedItems:(id)a4 withIndexToRangeMapOfDeletedItems:(id)a5 deleteDate:(id)a6
{
  id v9 = (__CFString *)a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (IMOSLoggingEnabled())
  {
    unsigned int v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      __int16 v14 = +[IMDClientRequestContext currentContext];
      CFStringRef v15 = [v14 listenerID];
      *(_DWORD *)buf = 138412546;
      id v48 = v15;
      __int16 v49 = 2112;
      CFStringRef v50 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Request from %@ to update messages: %@", buf, 0x16u);
    }
  }
  __int16 v16 = +[IMDMessageStore sharedInstance];
  id v17 = [(__CFString *)v9 guid];
  id v18 = [v16 messageWithGUID:v17];

  uint64_t v19 = +[IMDMessageStore sharedInstance];
  __int16 v20 = [(__CFString *)v9 guid];
  CFStringRef v21 = [v19 chatForMessageGUID:v20];

  __int16 v22 = [v21 serviceName];
  LODWORD(v20) = [v22 isEqualToString:IMServiceNameSMS];

  if (v20) {
    IMGreenTeaMessageDeleteLog();
  }
  if (v18)
  {
    CFStringRef v23 = +[IMDMessageStore sharedInstance];
    LOBYTE(v42) = 1;
    CFStringRef v24 = [v23 storeMessage:v9 forceReplace:0 modifyError:1 modifyFlags:1 flagMask:1638400 updateMessageCache:1 calculateUnreadCount:v42];

    unsigned int v25 = [v24 isEqual:v9];
    if (IMOSLoggingEnabled())
    {
      CFStringRef v26 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        CFStringRef v27 = @"YES";
        if (v25) {
          CFStringRef v27 = @"NO";
        }
        *(_DWORD *)buf = 138412546;
        id v48 = v24;
        __int16 v49 = 2112;
        CFStringRef v50 = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "   updated message: %@   hasChanged? %@", buf, 0x16u);
      }
    }
    if ((v25 & 1) == 0)
    {
      CFStringRef v28 = +[IMDBroadcastController sharedProvider];
      v29 = [v28 broadcasterForChatListeners];
      v30 = [v24 accountID];
      [v29 account:v30 chat:0 style:0 chatProperties:0 messageUpdated:v24];

      if (v10)
      {
        if ([v10 count])
        {
          if (v12)
          {
            if (IMOSLoggingEnabled())
            {
              v31 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                id v48 = v11;
                __int16 v49 = 2112;
                CFStringRef v50 = v18;
                _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Recently Deleted | Recoverably deleting indexes %@ from message: %@", buf, 0x16u);
              }
            }
            v32 = [(__CFString *)v18 body];
            v43[0] = _NSConcreteStackBlock;
            v43[1] = 3221225472;
            v43[2] = sub_10000EE84;
            v43[3] = &unk_100071710;
            id v44 = v10;
            v45 = v18;
            id v46 = v12;
            objc_msgSend(v32, "__im_visitMessageParts:", v43);
          }
          if (IMOSLoggingEnabled())
          {
            id v33 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v48 = v21;
              _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "Sending delete-parts command to other devices: %@", buf, 0xCu);
            }
          }
          __int16 v34 = [(__CFString *)v9 guid];
          v35 = +[IMDDeletePartsHelper _makeDeletePartsDictFor:v34 withIndexes:v10 withIndexToRangeMap:v11 deleteDate:v12];

          v36 = [v21 serviceName];
          LODWORD(v34) = [v36 isEqualToString:IMServiceNameSMS];

          v37 = +[IMDAccountController sharedInstance];
          v38 = v37;
          v39 = &IMServiceNameiMessage;
          if (v34) {
            v39 = &IMServiceNameSMS;
          }
          v40 = [v37 anySessionForServiceName:*v39];

          v41 = [v21 guid];
          [v40 sendDeleteCommand:v35 forChatGUID:v41];
        }
      }
    }
  }
}

- (void)markRepliedForMessageGUID:(id)a3
{
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = +[IMDClientRequestContext currentContext];
      id v6 = [v5 listenerID];
      *(_DWORD *)buf = 138412546;
      v36 = v6;
      __int16 v37 = 2112;
      id v38 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Request from %@ to mark message as replied with GUID: %@", buf, 0x16u);
    }
  }
  if ([v3 length])
  {
    id v7 = +[IMDMessageStore sharedInstance];
    int v8 = [v7 chatsForMessageGUID:v3];

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v9 = v8;
    id v10 = [v9 countByEnumeratingWithState:&v31 objects:v41 count:16];
    if (v10)
    {
      uint64_t v12 = *(void *)v32;
      uint64_t v30 = IMChipListCharacterString;
      *(void *)&long long v11 = 138412802;
      long long v28 = v11;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v32 != v12) {
            objc_enumerationMutation(v9);
          }
          __int16 v14 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          CFStringRef v15 = objc_msgSend(v14, "serviceName", v28);
          if (v15)
          {
            __int16 v16 = [v14 chatIdentifier];
            BOOL v17 = v16 == 0;

            if (!v17)
            {
              id v18 = +[IMDMessageStore sharedInstance];
              uint64_t v19 = [v18 messageWithGUID:v3];

              if (v19)
              {
                __int16 v20 = [v19 body];
                CFStringRef v21 = [v20 string];
                __int16 v22 = objc_msgSend(v21, "substringFromIndex:", (char *)objc_msgSend(v20, "length") - 1);
                unsigned int v23 = [v22 isEqualToString:v30];

                if (v23)
                {
                  id v24 = [v19 copyAsReplied];
                  [(IMDaemonChatRequestHandler *)self updateMessage:v24];
                }
              }
              else if (IMOSLoggingEnabled())
              {
                unsigned int v25 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
                {
                  id v26 = [v14 chatIdentifier];
                  CFStringRef v27 = [v14 serviceName];
                  *(_DWORD *)buf = v28;
                  v36 = v14;
                  __int16 v37 = 2112;
                  id v38 = v26;
                  __int16 v39 = 2112;
                  v40 = v27;
                  _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Empty ID or service for chat: %@ (ID: %@  Service: %@)", buf, 0x20u);
                }
              }
            }
          }
        }
        id v10 = [v9 countByEnumeratingWithState:&v31 objects:v41 count:16];
      }
      while (v10);
    }
  }
}

- (id)_chatsWithIsBlackholed:(BOOL)a3 inChats:(id)a4
{
  int v4 = a3;
  id v5 = a4;
  id v6 = objc_alloc_init((Class)NSMutableArray);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v7);
        }
        long long v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v11, "isBlackholed", (void)v17) == v4) {
          [v6 addObject:v11];
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v17 objects:v27 count:16];
    }
    while (v8);
  }

  if (IMOSLoggingEnabled())
  {
    uint64_t v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = [v7 count];
      id v14 = [v6 count];
      CFStringRef v15 = @"NO";
      *(_DWORD *)buf = 134218498;
      id v22 = v13;
      if (v4) {
        CFStringRef v15 = @"YES";
      }
      __int16 v23 = 2048;
      id v24 = v14;
      __int16 v25 = 2112;
      CFStringRef v26 = v15;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Filtered %llu chats to %llu with isBlackholed: %@", buf, 0x20u);
    }
  }

  return v6;
}

- (void)_loadChat:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    id v10 = v6;
    id v8 = a4;
    id v9 = +[NSArray arrayWithObjects:&v10 count:1];
    -[IMDaemonChatRequestHandler _loadChats:completionHandler:](self, "_loadChats:completionHandler:", v9, v8, v10);
  }
  else
  {
    id v9 = a4;
    [(IMDaemonChatRequestHandler *)self _loadChats:&__NSArray0__struct completionHandler:v9];
  }
}

- (void)_loadChats:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = +[IMDClientRequestContext currentContext];
  unint64_t v9 = (unint64_t)[v8 capabilities];
  int v10 = v9;
  uint64_t v11 = (v9 >> 26) & 1;

  uint64_t v12 = [(IMDaemonChatRequestHandler *)self _chatsWithIsBlackholed:v11 inChats:v6];
  id v13 = +[IMDChatRegistry sharedInstance];
  id v14 = [v13 _chatInfoForChats:v12];

  if (IMOSLoggingEnabled())
  {
    CFStringRef v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = [v12 count];
      CFStringRef v17 = @"NO";
      if ((v10 & 0x4000000) != 0) {
        CFStringRef v17 = @"YES";
      }
      int v18 = 134218242;
      id v19 = v16;
      __int16 v20 = 2112;
      CFStringRef v21 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Prepared %llu loaded chats (blackholed: %@)", (uint8_t *)&v18, 0x16u);
    }
  }
  if (v7) {
    v7[2](v7, v14);
  }
}

- (void)loadChatWithChatIdentifier:(id)a3
{
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    int v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Request to load chat with identifier %@", buf, 0xCu);
    }
  }
  if (v3 && [v3 length])
  {
    if (IMOSLoggingEnabled())
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        id v6 = +[IMDClientRequestContext currentContext];
        id v7 = [v6 listenerID];
        *(_DWORD *)buf = 138412290;
        id v27 = v7;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Request from listener %@", buf, 0xCu);
      }
    }
    id v8 = (__CFArray *)objc_alloc_init((Class)NSMutableArray);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    unint64_t v9 = +[IMDChatRegistry sharedInstance];
    int v10 = [v9 chats];

    id v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v22;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v10);
          }
          id v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          CFStringRef v15 = [v14 chatIdentifier];
          if ([v15 isEqualToIgnoringCase:v3])
          {
            id v16 = [v14 dictionaryRepresentationIncludingLastMessage];
            if (v16) {
              BOOL v17 = v8 != 0;
            }
            else {
              BOOL v17 = 0;
            }
            if (v17) {
              CFArrayAppendValue(v8, v16);
            }
          }
        }
        id v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v11);
    }

    int v18 = +[IMDClientRequestContext currentContext];
    id v19 = [v18 replyProxy];
    [v19 chatLoadedWithChatIdentifier:v3 chats:v8];
  }
  else if (IMOSLoggingEnabled())
  {
    __int16 v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Invalid chat identifier. Bailing!", buf, 2u);
    }
  }
}

- (void)loadAllChats
{
  v2 = +[IMDChatRegistry sharedInstance];
  id v5 = [v2 _allChatInfo];

  id v3 = +[IMDBroadcastController sharedProvider];
  int v4 = [v3 broadcasterForChatListeners];
  [v4 loadedChats:v5];
}

- (void)loadChatWithGUID:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Request to load chat with guid: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  unint64_t v9 = +[IMDChatRegistry sharedInstance];
  int v10 = [v9 existingChatWithGUID:v6];

  [(IMDaemonChatRequestHandler *)self _loadChat:v10 completionHandler:v7];
}

- (void)loadChatWithGUID:(id)a3 queryID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[IMDClientRequestContext currentContext];
  unint64_t v9 = [v8 replyProxy];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000FDEC;
  v12[3] = &unk_100071738;
  id v13 = v9;
  id v14 = v6;
  id v10 = v6;
  id v11 = v9;
  [(IMDaemonChatRequestHandler *)self loadChatWithGUID:v7 reply:v12];
}

- (void)loadChatsFilteredUsingPredicate:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      CFStringRef v9 = @"YES";
      if (!v6) {
        CFStringRef v9 = @"NO";
      }
      int v12 = 138412290;
      CFStringRef v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Request to load chats with predicate: %@", (uint8_t *)&v12, 0xCu);
    }
  }
  id v10 = +[IMDChatRegistry sharedInstance];
  id v11 = [v10 existingChatsFilteredUsingPredicate:v6];

  [(IMDaemonChatRequestHandler *)self _loadChats:v11 completionHandler:v7];
}

- (void)loadChatsFilteredUsingPredicate:(id)a3 queryID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[IMDClientRequestContext currentContext];
  CFStringRef v9 = [v8 replyProxy];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100010040;
  v12[3] = &unk_100071738;
  id v13 = v9;
  id v14 = v6;
  id v10 = v6;
  id v11 = v9;
  [(IMDaemonChatRequestHandler *)self loadChatsFilteredUsingPredicate:v7 reply:v12];
}

- (void)loadChatsFilteredUsingPredicate:(id)a3 lastMessageOlderThan:(id)a4 limit:(int64_t)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (IMOSLoggingEnabled())
  {
    id v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      CFStringRef v14 = @"YES";
      *(_DWORD *)buf = 138412802;
      if (!v10) {
        CFStringRef v14 = @"NO";
      }
      CFStringRef v21 = v14;
      __int16 v22 = 2112;
      id v23 = v11;
      __int16 v24 = 2048;
      int64_t v25 = a5;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Request to load chats with predicate: %@ older than: %@ limit: %llu", buf, 0x20u);
    }
  }
  CFStringRef v15 = +[IMDChatRegistry sharedInstance];
  id v16 = [v15 existingChatsFilteredUsingPredicate:v10 sortedUsingLastMessageDateAscending:0 olderThan:v11 limit:a5];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100010230;
  v18[3] = &unk_100071760;
  v18[4] = self;
  id v19 = v12;
  id v17 = v12;
  [(IMDaemonChatRequestHandler *)self _loadChats:v16 completionHandler:v18];
}

- (id)_chatDictionariesWithLastMessageRecordDateFromDictionaries:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v21;
    uint64_t v17 = IMMessagePropertyDate;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(obj);
        }
        CFStringRef v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v10 = [v9 mutableCopy];
        id v11 = [v9 objectForKeyedSubscript:@"guid"];
        if ([v11 length])
        {
          id v12 = +[NSSortDescriptor sortDescriptorWithKey:v17 ascending:0];
          id v13 = +[IMDDatabase synchronousDatabase];
          __int16 v24 = v12;
          CFStringRef v14 = +[NSArray arrayWithObjects:&v24 count:1];
          v18[0] = _NSConcreteStackBlock;
          v18[1] = 3221225472;
          v18[2] = sub_1000104FC;
          v18[3] = &unk_100071788;
          id v19 = v10;
          [v13 fetchMessageRecordsForChatRecordWithGUID:v11 filteredUsingPredicate:0 sortedUsingDescriptors:v14 limit:1 completionHandler:v18];
        }
        [v4 addObject:v10];
      }
      id v6 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v6);
  }

  return v4;
}

- (void)loadChatsFilteredUsingPredicate:(id)a3 lastMessageOlderThan:(id)a4 limit:(int64_t)a5 queryID:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = +[IMDClientRequestContext currentContext];
  CFStringRef v14 = [v13 replyProxy];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10001068C;
  v17[3] = &unk_100071738;
  id v18 = v14;
  id v19 = v10;
  id v15 = v10;
  id v16 = v14;
  [(IMDaemonChatRequestHandler *)self loadChatsFilteredUsingPredicate:v12 lastMessageOlderThan:v11 limit:a5 reply:v17];
}

- (void)loadChatsWithIdentifier:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Request to load chats with identifier: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  CFStringRef v9 = +[IMDChatRegistry sharedInstance];
  id v10 = [v9 allExistingChatsWithIdentifier:v6];

  [(IMDaemonChatRequestHandler *)self _loadChats:v10 completionHandler:v7];
}

- (void)loadChatsWithIdentifier:(id)a3 queryID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[IMDClientRequestContext currentContext];
  CFStringRef v9 = [v8 replyProxy];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000108C8;
  v12[3] = &unk_100071738;
  id v13 = v9;
  id v14 = v6;
  id v10 = v6;
  id v11 = v9;
  [(IMDaemonChatRequestHandler *)self loadChatsWithIdentifier:v7 reply:v12];
}

- (void)loadChatsWithGroupID:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Request to load chats with groupID: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  CFStringRef v9 = +[IMDChatRegistry sharedInstance];
  id v10 = [v9 existingChatsWithGroupID:v6];

  [(IMDaemonChatRequestHandler *)self _loadChats:v10 completionHandler:v7];
}

- (void)loadChatsWithGroupID:(id)a3 queryID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[IMDClientRequestContext currentContext];
  CFStringRef v9 = [v8 replyProxy];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100010B04;
  v12[3] = &unk_100071738;
  id v13 = v9;
  id v14 = v6;
  id v10 = v6;
  id v11 = v9;
  [(IMDaemonChatRequestHandler *)self loadChatsWithGroupID:v7 reply:v12];
}

- (void)loadChatsWithHandleIDs:(id)a3 groupID:(id)a4 displayName:(id)a5 style:(unsigned __int8)a6 reply:(id)a7
{
  uint64_t v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if (IMOSLoggingEnabled())
  {
    id v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v19 = 138413058;
      id v20 = v13;
      __int16 v21 = 2112;
      id v22 = v14;
      __int16 v23 = 1024;
      int v24 = (char)v8;
      __int16 v25 = 2112;
      id v26 = v12;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Request to load chats with groupID: %@ displayName: %@ style: %c handles: %@", (uint8_t *)&v19, 0x26u);
    }
  }
  uint64_t v17 = +[IMDChatRegistry sharedInstance];
  id v18 = [v17 existingChatsForIDs:v12 displayName:v14 groupID:v13 style:v8];

  [(IMDaemonChatRequestHandler *)self _loadChats:v18 completionHandler:v15];
}

- (void)loadChatsWithHandleIDs:(id)a3 groupID:(id)a4 displayName:(id)a5 style:(unsigned __int8)a6 queryID:(id)a7
{
  uint64_t v7 = a6;
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = +[IMDClientRequestContext currentContext];
  uint64_t v17 = [v16 replyProxy];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100010DD4;
  v20[3] = &unk_100071738;
  id v21 = v17;
  id v22 = v12;
  id v18 = v12;
  id v19 = v17;
  [(IMDaemonChatRequestHandler *)self loadChatsWithHandleIDs:v15 groupID:v14 displayName:v13 style:v7 reply:v20];
}

- (void)unblackholeAndLoadChatWithHandleIDs:(id)a3 reply:(id)a4
{
  id v34 = a3;
  long long v33 = (void (**)(id, void *))a4;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = [v34 count];
      uint64_t v7 = +[IMDClientRequestContext currentContext];
      uint64_t v8 = [v7 listenerID];
      *(_DWORD *)buf = 138412802;
      id v47 = v34;
      __int16 v48 = 2048;
      id v49 = v6;
      __int16 v50 = 2112;
      v51 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Request to load chat with handleIDs array %@ of count %lu from %@", buf, 0x20u);
    }
  }
  if (v34 && [v34 count])
  {
    id v37 = [objc_alloc((Class)NSSet) initWithArray:v34];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    CFStringRef v9 = +[IMDChatRegistry sharedInstance];
    id obj = [v9 blackholedChats];

    id v10 = 0;
    id v11 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v11)
    {
      uint64_t v36 = *(void *)v41;
      *(void *)&long long v12 = 138412290;
      long long v32 = v12;
LABEL_9:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v41 != v36) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v40 + 1) + 8 * v13);
        id v15 = objc_msgSend(v14, "participants", v32);
        id v16 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v15, "count"));
        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472;
        v38[2] = sub_100011310;
        v38[3] = &unk_1000717B0;
        id v17 = v16;
        id v39 = v17;
        [v15 enumerateObjectsUsingBlock:v38];
        unsigned int v18 = [v17 isEqualToSet:v37];
        char v19 = v18;
        if (v18)
        {
          uint64_t v20 = [v14 dictionaryRepresentationIncludingLastMessage];

          [v14 updateIsBlackholed:0];
          if (IMOSLoggingEnabled())
          {
            id v21 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              id v22 = [v14 chatIdentifier];
              *(_DWORD *)buf = v32;
              id v47 = v22;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Concluded search. Found existing chat (%@) with target participant list.", buf, 0xCu);
            }
          }
          __int16 v23 = [v14 participants];
          BOOL v24 = [v23 count] == (id)1;

          __int16 v25 = +[IMMetricsCollector sharedInstance];
          id v26 = v25;
          if (v24) {
            uint64_t v27 = 22;
          }
          else {
            uint64_t v27 = 23;
          }
          [v25 trackSpamEvent:v27];

          id v10 = (void *)v20;
        }

        if (v19) {
          break;
        }
        if (v11 == (id)++v13)
        {
          id v11 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
          if (v11) {
            goto LABEL_9;
          }
          break;
        }
      }
    }

    long long v28 = +[IMDBroadcastController sharedProvider];
    v29 = [v28 broadcasterForChatListeners];
    [v29 previouslyBlackholedChatLoadedWithHandleIDs:v34 chat:v10];

    if (v10)
    {
      id v44 = v10;
      uint64_t v30 = +[NSArray arrayWithObjects:&v44 count:1];
      v33[2](v33, v30);
    }
    else
    {
      ((void (*)(void))v33[2])();
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      long long v31 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Invalid handleIDs array. Bailing!", buf, 2u);
      }
    }
    v33[2](v33, &__NSArray0__struct);
  }
}

- (void)sendStickerAtPath:(id)a3 toChatID:(id)a4 forNBubbleFromTheBottom:(int64_t)a5 atX:(id)a6 atY:(id)a7 scale:(id)a8 balloonWidth:(id)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v64 = a7;
  id v63 = a8;
  id v62 = a9;
  id v17 = +[IMDAccountController sharedAccountController];
  v58 = [v17 anySessionForServiceName:IMServiceNameiMessage];

  unsigned int v18 = +[IMDChatRegistry sharedInstance];
  v60 = v15;
  char v19 = [v18 existingChatWithGUID:v15];

  uint64_t v20 = +[NSMutableArray array];
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  v57 = v19;
  id v21 = [v19 participants];
  id v22 = [v21 countByEnumeratingWithState:&v65 objects:v74 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v66;
    do
    {
      __int16 v25 = 0;
      do
      {
        if (*(void *)v66 != v24) {
          objc_enumerationMutation(v21);
        }
        id v26 = [*(id *)(*((void *)&v65 + 1) + 8 * (void)v25) ID];
        [v20 addObject:v26];

        __int16 v25 = (char *)v25 + 1;
      }
      while (v23 != v25);
      id v23 = [v21 countByEnumeratingWithState:&v65 objects:v74 count:16];
    }
    while (v23);
  }

  uint64_t v27 = +[IMDMessageStore sharedInstance];
  uint64_t v73 = IMServiceNameiMessage;
  long long v28 = +[NSArray arrayWithObjects:&v73 count:1];
  v29 = [v27 itemsWithHandles:v20 onServices:v28 messageGUID:0 limit:20];

  uint64_t v30 = objc_msgSend(v29, "__imArrayByFilteringWithBlock:", &stru_1000717F0);

  v56 = v30;
  if ((unint64_t)[v30 count] <= a5) {
    [v30 lastObject];
  }
  else {
  long long v31 = objc_msgSend(v30, "objectAtIndex:", (char *)objc_msgSend(v30, "count") - a5);
  }
  v61 = v14;
  long long v32 = +[NSURL fileURLWithPath:v14];
  long long v33 = +[IMDFileTransferCenter sharedInstance];
  id v34 = [v33 createNewOutgoingTransferWithLocalFileURL:v32];

  v35 = +[IMDFileTransferCenter sharedInstance];
  uint64_t v36 = [v35 transferForGUID:v34];

  id v37 = [v32 path];
  uint64_t v38 = IMSharedHelperMD5HashOfFileAtPath();

  v52 = (void *)v38;
  v72[0] = v38;
  v71[0] = IMStickerUserInfoStickerHashKey;
  v71[1] = IMStickerUserInfoStickerGUIDKey;
  v54 = v32;
  id v39 = [v32 lastPathComponent];
  v72[1] = v39;
  v72[2] = @"0";
  v71[2] = IMStickerUserInfoAssociatedLayoutIntentKey;
  v71[3] = IMStickerUserInfoLayoutIntentKey;
  v72[3] = @"0";
  v72[4] = v62;
  v71[4] = IMStickerUserInfoParentPreviewWidthKey;
  v71[5] = IMStickerUserInfoRotationKey;
  v72[5] = @"0.0";
  v72[6] = v63;
  v71[6] = IMStickerUserInfoScaleKey;
  v71[7] = IMStickerUserInfoXScalarKey;
  v71[8] = IMStickerUserInfoYScalarKey;
  v72[7] = v16;
  v72[8] = v64;
  long long v40 = +[NSDictionary dictionaryWithObjects:v72 forKeys:v71 count:9];
  [v36 setStickerUserInfo:v40];

  v53 = v36;
  [v36 setIsSticker:1];
  v70 = v34;
  long long v41 = +[NSArray arrayWithObjects:&v70 count:1];
  long long v42 = +[NSAttributedString __im_attributedStringWithFileTransfers:v41];

  long long v43 = objc_msgSend(v42, "__im_attributedStringByAssigningMessagePartNumbers");
  id v44 = objc_alloc((Class)IMAssociatedMessageItem);
  v45 = +[NSDate date];
  v59 = v16;
  if (v34)
  {
    v69 = v34;
    id v46 = +[NSArray arrayWithObjects:&v69 count:1];
  }
  else
  {
    id v46 = 0;
  }
  id v47 = +[NSString stringGUID];
  __int16 v48 = [v31 guid];
  v55 = v31;
  id v49 = [v31 threadIdentifier];
  id v50 = objc_msgSend(v44, "initWithSender:time:body:attributes:fileTransferGUIDs:flags:error:guid:associatedMessageGUID:associatedMessageType:associatedMessageRange:messageSummaryInfo:threadIdentifier:", 0, v45, v43, 0, v46, 5, 0, v47, v48, 1000, 0, 0x7FFFFFFFFFFFFFFFLL, 0, v49);

  if (v34) {
  v51 = [v57 chatIdentifier];
  }
  objc_msgSend(v58, "sendMessage:toChatID:identifier:style:", v50, v60, v51, objc_msgSend(v57, "style"));
}

- (void)sendReadReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 account:(id)a7
{
  unsigned int v23 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a7;
  id v14 = +[IMDAccountController sharedAccountController];
  id v15 = [v14 sessionForAccount:v13];

  if (v15) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled())
  {
    id v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v13;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@", buf, 0xCu);
    }
  }
  id v17 = +[IMDAccountController sharedAccountController];
  unsigned int v18 = +[IMDAccountController sharedAccountController];
  char v19 = [v18 accountForAccountID:v13];
  uint64_t v20 = [v19 service];
  id v21 = [v20 internalName];
  id v15 = [v17 anySessionForServiceName:v21];

  if (v15)
  {
LABEL_7:
    [v15 sendReadReceiptForMessage:v10 toChatID:v11 identifier:v12 style:v23];
  }
  else if (IMOSLoggingEnabled())
  {
    id v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v13;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "FIND_SESSION: No session ever found for account: %@", buf, 0xCu);
    }
  }
}

- (void)sendPlayedReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 account:(id)a7
{
  unsigned int v23 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a7;
  id v14 = +[IMDAccountController sharedAccountController];
  id v15 = [v14 sessionForAccount:v13];

  if (v15) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled())
  {
    id v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v13;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@", buf, 0xCu);
    }
  }
  id v17 = +[IMDAccountController sharedAccountController];
  unsigned int v18 = +[IMDAccountController sharedAccountController];
  char v19 = [v18 accountForAccountID:v13];
  uint64_t v20 = [v19 service];
  id v21 = [v20 internalName];
  id v15 = [v17 anySessionForServiceName:v21];

  if (v15)
  {
LABEL_7:
    [v15 sendPlayedReceiptForMessage:v10 toChatID:v11 identifier:v12 style:v23];
  }
  else if (IMOSLoggingEnabled())
  {
    id v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v13;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "FIND_SESSION: No session ever found for account: %@", buf, 0xCu);
    }
  }
}

- (void)sendSavedReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 account:(id)a7
{
  unsigned int v23 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a7;
  id v14 = +[IMDAccountController sharedAccountController];
  id v15 = [v14 sessionForAccount:v13];

  if (v15) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled())
  {
    id v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v13;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@", buf, 0xCu);
    }
  }
  id v17 = +[IMDAccountController sharedAccountController];
  unsigned int v18 = +[IMDAccountController sharedAccountController];
  char v19 = [v18 accountForAccountID:v13];
  uint64_t v20 = [v19 service];
  id v21 = [v20 internalName];
  id v15 = [v17 anySessionForServiceName:v21];

  if (v15)
  {
LABEL_7:
    [v15 sendSavedReceiptForMessage:v10 toChatID:v11 identifier:v12 style:v23];
  }
  else if (IMOSLoggingEnabled())
  {
    id v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v13;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "FIND_SESSION: No session ever found for account: %@", buf, 0xCu);
    }
  }
}

- (void)sendSyndicationAction:(id)a3 toChatsWithIdentifiers:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = +[IMDAccountController sharedAccountController];
  id v8 = [v7 anySessionForServiceName:IMServiceNameiMessage];

  [v8 sendSyndicationAction:v6 toChatsWithIdentifiers:v5];
}

- (void)sendUpdatedCollaborationMetadata:(id)a3 toChatsWithIdentifiers:(id)a4 forMessageGUID:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[IMDAccountController sharedAccountController];
  id v11 = [v10 anySessionForServiceName:IMServiceNameiMessage];

  [v11 sendUpdatedCollaborationMetadata:v9 toChatsWithIdentifiers:v8 forMessageGUID:v7];
}

- (void)sendBalloonPayload:(id)a3 attachments:(id)a4 withMessageGUID:(id)a5 bundleID:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = +[IMDAccountController sharedAccountController];
  id v14 = [v13 anySessionForServiceName:IMServiceNameiMessage];

  [v14 sendBalloonPayload:v12 attachments:v11 withMessageGUID:v10 bundleID:v9];
}

- (void)updateBalloonPayload:(id)a3 attachments:(id)a4 forMessageGUID:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[IMDAccountController sharedAccountController];
  id v11 = [v10 anySessionForServiceName:IMServiceNameiMessage];

  [v11 updateBalloonPayload:v9 attachments:v8 forMessageGUID:v7];
}

- (void)setProperties:(id)a3 ofParticipant:(id)a4 inChatID:(id)a5 identifier:(id)a6 style:(unsigned __int8)a7 account:(id)a8
{
  unsigned int v25 = a7;
  id v26 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a8;
  id v16 = +[IMDAccountController sharedAccountController];
  id v17 = [v16 sessionForAccount:v15];

  if (v17) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled())
  {
    unsigned int v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v15;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@", buf, 0xCu);
    }
  }
  char v19 = +[IMDAccountController sharedAccountController];
  uint64_t v20 = +[IMDAccountController sharedAccountController];
  id v21 = [v20 accountForAccountID:v15];
  id v22 = [v21 service];
  unsigned int v23 = [v22 internalName];
  id v17 = [v19 anySessionForServiceName:v23];

  if (v17)
  {
LABEL_7:
    [v17 setProperties:v26 ofParticipant:v12 inChatID:v13 identifier:v14 style:v25];
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v24 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v15;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "FIND_SESSION: No session ever found for account: %@", buf, 0xCu);
    }
  }
}

- (void)leaveChatID:(id)a3 style:(unsigned __int8)a4 account:(id)a5
{
  uint64_t v6 = a4;
  id v7 = a3;
  id v8 = a5;
  id v9 = +[IMDAccountController sharedAccountController];
  id v10 = [v9 sessionForAccount:v8];

  if (v10) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled())
  {
    id v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v18 = 138412290;
      id v19 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@", (uint8_t *)&v18, 0xCu);
    }
  }
  id v12 = +[IMDAccountController sharedAccountController];
  id v13 = +[IMDAccountController sharedAccountController];
  id v14 = [v13 accountForAccountID:v8];
  id v15 = [v14 service];
  id v16 = [v15 internalName];
  id v10 = [v12 anySessionForServiceName:v16];

  if (v10)
  {
LABEL_7:
    [v10 leaveChat:v7 style:v6];
  }
  else if (IMOSLoggingEnabled())
  {
    id v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v18 = 138412290;
      id v19 = v8;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "FIND_SESSION: No session ever found for account: %@", (uint8_t *)&v18, 0xCu);
    }
  }
}

- (void)removeChatID:(id)a3 identifier:(id)a4 style:(unsigned __int8)a5 account:(id)a6
{
  uint64_t v7 = a5;
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = +[IMDAccountController sharedAccountController];
  id v13 = [v12 sessionForAccount:v11];

  if (v13) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled())
  {
    id v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v21 = 138412290;
      id v22 = v11;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@", (uint8_t *)&v21, 0xCu);
    }
  }
  id v15 = +[IMDAccountController sharedAccountController];
  id v16 = +[IMDAccountController sharedAccountController];
  id v17 = [v16 accountForAccountID:v11];
  int v18 = [v17 service];
  id v19 = [v18 internalName];
  id v13 = [v15 anySessionForServiceName:v19];

  if (v13)
  {
LABEL_7:
    [v13 removeChatID:v9 identifier:v10 style:v7];
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      int v21 = 138412290;
      id v22 = v11;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "FIND_SESSION: No session ever found for account: %@", (uint8_t *)&v21, 0xCu);
    }
  }
}

- (void)declineInvitationToChatID:(id)a3 identifier:(id)a4 style:(unsigned __int8)a5 account:(id)a6
{
  uint64_t v7 = a5;
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = +[IMDAccountController sharedAccountController];
  id v13 = [v12 sessionForAccount:v11];

  if (v13) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled())
  {
    id v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v21 = 138412290;
      id v22 = v11;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@", (uint8_t *)&v21, 0xCu);
    }
  }
  id v15 = +[IMDAccountController sharedAccountController];
  id v16 = +[IMDAccountController sharedAccountController];
  id v17 = [v16 accountForAccountID:v11];
  int v18 = [v17 service];
  id v19 = [v18 internalName];
  id v13 = [v15 anySessionForServiceName:v19];

  if (v13)
  {
LABEL_7:
    [v13 declineInvitationToChatID:v9 identifier:v10 style:v7];
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      int v21 = 138412290;
      id v22 = v11;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "FIND_SESSION: No session ever found for account: %@", (uint8_t *)&v21, 0xCu);
    }
  }
}

- (void)sendCommand:(id)a3 withProperties:(id)a4 toPerson:(id)a5 account:(id)a6 toChatID:(id)a7 identifier:(id)a8 style:(unsigned __int8)a9
{
  id v27 = a3;
  id v28 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  int v18 = +[IMDAccountController sharedAccountController];
  id v19 = [v18 sessionForAccount:v15];

  if (v19) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v15;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@", buf, 0xCu);
    }
  }
  int v21 = +[IMDAccountController sharedAccountController];
  id v22 = +[IMDAccountController sharedAccountController];
  unsigned int v23 = [v22 accountForAccountID:v15];
  uint64_t v24 = [v23 service];
  unsigned int v25 = [v24 internalName];
  id v19 = [v21 anySessionForServiceName:v25];

  if (v19)
  {
LABEL_7:
    objc_msgSend(v19, "sendCommand:withProperties:toPerson:toChatID:identifier:style:", v27, v28, v14, v16, v17, a9, v27);
  }
  else if (IMOSLoggingEnabled())
  {
    id v26 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v15;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "FIND_SESSION: No session ever found for account: %@", buf, 0xCu);
    }
  }
}

- (void)sendCommand:(id)a3 withProperties:(id)a4 toPerson:(id)a5 account:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = +[IMDAccountController sharedAccountController];
  id v14 = [v13 sessionForAccount:v12];

  if (v14) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled())
  {
    id v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v22 = 138412290;
      id v23 = v12;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@", (uint8_t *)&v22, 0xCu);
    }
  }
  id v16 = +[IMDAccountController sharedAccountController];
  id v17 = +[IMDAccountController sharedAccountController];
  int v18 = [v17 accountForAccountID:v12];
  id v19 = [v18 service];
  uint64_t v20 = [v19 internalName];
  id v14 = [v16 anySessionForServiceName:v20];

  if (v14)
  {
LABEL_7:
    [v14 sendCommand:v9 withProperties:v10 toPerson:v11];
  }
  else if (IMOSLoggingEnabled())
  {
    int v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      int v22 = 138412290;
      id v23 = v12;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "FIND_SESSION: No session ever found for account: %@", (uint8_t *)&v22, 0xCu);
    }
  }
}

- (void)stopTranscriptSharingWithChat:(id)a3
{
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315138;
      id v10 = "-[IMDaemonChatRequestHandler stopTranscriptSharingWithChat:]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Stop transcript sharing for %s", (uint8_t *)&v9, 0xCu);
    }
  }
  id v5 = +[IMDChatRegistry sharedInstance];
  uint64_t v6 = [v5 allExistingChatsWithIdentifier:v3];

  uint64_t v7 = +[IMDChorosController sharedController];
  id v8 = [v6 firstObject];
  [v7 stopTranscriptSharingWithChat:v8];
}

- (void)fetchCommonCapabilities:(id)a3 fromChatWithGUID:(id)a4 reply:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = +[IMDChatRegistry sharedInstance];
  id v11 = [v10 existingChatWithGUID:v9];

  if (v11)
  {
    id v12 = [v11 participants];
    id v13 = [v12 arrayByApplyingSelector:"ID"];

    id v14 = [v11 lastAddressedLocalHandle];
    if ([v14 length])
    {
      uint64_t v15 = [v13 arrayByAddingObject:v14];

      id v13 = (void *)v15;
    }
    id v16 = [v13 _URIsFromIDs];

    id v17 = objc_msgSend(v16, "__im_canonicalIDSIDsFromAddresses");
    int v18 = IMServiceNameForCanonicalIDSAddresses();
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000134C0;
    v19[3] = &unk_100071818;
    id v20 = v8;
    +[IMIDSUtilities findCommonCapabilitiesAcrossRecipients:v16 serviceName:v18 capsToCheck:v7 completion:v19];
  }
  else
  {
    (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);
  }
}

- (void)recoverChatsFromJunkContainingMessageWithGUID:(id)a3
{
  uint64_t v4 = sub_10004D210();
  unint64_t v6 = v5;
  id v7 = self;
  _sSo26IMDaemonChatRequestHandlerC7imagentE37recoverChatsFromJunkContainingMessage8withGUIDySS_tF_0(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)fetchCollaborationNoticesForChatGUID:(id)a3 reply:(id)a4
{
  unint64_t v5 = _Block_copy(a4);
  uint64_t v6 = sub_10004D210();
  unint64_t v8 = v7;
  _Block_copy(v5);
  id v9 = self;
  sub_10003CCF8(v6, v8, (uint64_t)v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)dismissNotice:(id)a3
{
  id v4 = a3;
  unint64_t v5 = self;
  sub_10003CFD4(v4, "Handling CollaborationNotice dismiss request for notice: %@", (SEL *)&selRef_dismissNotice_);
}

- (void)updateNotice:(id)a3
{
  id v4 = a3;
  unint64_t v5 = self;
  sub_10003CFD4(v4, "Updating CollaborationNotice: %@", (SEL *)&selRef_updateNotice_);
}

- (void)loadChatsWithPinningIdentifier:(id)a3 reply:(id)a4
{
  unint64_t v5 = _Block_copy(a4);
  uint64_t v6 = sub_10004D210();
  uint64_t v8 = v7;
  _Block_copy(v5);
  id v9 = self;
  sub_10004446C(v6, v8, (uint64_t)v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)loadAnyChatsContainingHandleIDsIn:(id)a3 reply:(id)a4
{
  unint64_t v5 = _Block_copy(a4);
  unint64_t v6 = sub_10004D250();
  _Block_copy(v5);
  uint64_t v7 = self;
  sub_1000445F0(v6, (void (**)(void, void))v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)closeSessionChatID:(id)a3 identifier:(id)a4 didDeleteConversation:(BOOL)a5 style:(unsigned __int8)a6 account:(id)a7
{
  int v7 = a6;
  BOOL v8 = a5;
  uint64_t v10 = sub_10004D210();
  uint64_t v12 = v11;
  uint64_t v13 = sub_10004D210();
  uint64_t v15 = v14;
  uint64_t v16 = sub_10004D210();
  unint64_t v18 = v17;
  id v19 = self;
  _sSo26IMDaemonChatRequestHandlerC7imagentE012closeSessionB2ID_10identifier21didDeleteConversation5style7accountySS_SSSbSo11IMChatStyleVSStF_0(v10, v12, v13, v15, v8, v7, v16, v18);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)unreadCountWithCompletion:(id)a3
{
  id v4 = (void (**)(void *, id))_Block_copy(a3);
  unint64_t v5 = self;
  BOOL v8 = self;
  id v6 = [v5 sharedInstance];
  id v7 = [v6 unreadMessagesCount];

  v4[2](v4, v7);
  _Block_release(v4);
}

- (void)markChatsAsReadFilteredUsingPredicate:(id)a3
{
}

@end
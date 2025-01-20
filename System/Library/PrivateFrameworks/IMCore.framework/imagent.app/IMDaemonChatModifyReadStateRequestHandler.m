@interface IMDaemonChatModifyReadStateRequestHandler
- (void)markHasHadSuccessfulQueryForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5;
- (void)markPlayedExpressiveSendForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 message:(id)a6;
- (void)markReadForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 messages:(id)a6 clientUnreadCount:(int64_t)a7;
- (void)markReadForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 messages:(id)a6 clientUnreadCount:(int64_t)a7 setUnreadCountToZero:(BOOL)a8;
- (void)markSavedForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 message:(id)a6;
- (void)markSavedForMessageGUID:(id)a3;
- (void)sendNotifyRecipientCommandForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 message:(id)a6;
@end

@implementation IMDaemonChatModifyReadStateRequestHandler

- (void)markReadForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 messages:(id)a6 clientUnreadCount:(int64_t)a7
{
}

- (void)markReadForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 messages:(id)a6 clientUnreadCount:(int64_t)a7 setUnreadCountToZero:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v12 = a4;
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  if (IMOSLoggingEnabled())
  {
    v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = +[IMDClientRequestContext currentContext];
      v18 = [v17 listenerID];
      int v19 = 138413058;
      v20 = v18;
      __int16 v21 = 2112;
      id v22 = v13;
      __int16 v23 = 2112;
      id v24 = v14;
      __int16 v25 = 2048;
      int64_t v26 = a7;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Request from %@ to mark messages as read with IDs: %@  services: %@ clientUnreadCount: %lu", (uint8_t *)&v19, 0x2Au);
    }
  }
  sub_10001FFE0(v13, v12, v14, v15, (void *)a7, v8);
}

- (void)markPlayedExpressiveSendForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 message:(id)a6
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a6;
  if (IMOSLoggingEnabled())
  {
    v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = +[IMDClientRequestContext currentContext];
      id v13 = [v12 listenerID];
      int v28 = 138412802;
      id v29 = v13;
      __int16 v30 = 2112;
      id v31 = v8;
      __int16 v32 = 2112;
      id v33 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Request from %@ to mark message as played expressive send with IDs: %@  services: %@", (uint8_t *)&v28, 0x20u);
    }
  }
  if ([v8 count] && objc_msgSend(v9, "count"))
  {
    id v14 = [v8 count];
    if (v14 == [v9 count])
    {
      id v15 = +[IMDMessageStore sharedInstance];
      v16 = [v10 guid];
      v17 = [v15 messageWithGUID:v16];

      if (v17)
      {
        v18 = +[NSDate date];
        [v17 setTimeExpressiveSendPlayed:v18];

        int v19 = +[IMDMessageStore sharedInstance];
        v20 = [v19 storeMessage:v17 forceReplace:1 modifyError:0 modifyFlags:0 flagMask:0];
      }
      else
      {
        v20 = 0;
      }
      id v22 = +[IMDMessageStore sharedInstance];
      __int16 v23 = [v20 guid];
      id v10 = [v22 messageWithGUID:v23];

      id v24 = [v10 accountID];
      __int16 v25 = +[IMDBroadcastController sharedProvider];
      int64_t v26 = [v25 broadcasterForChatListeners];

      if (IMOSLoggingEnabled())
      {
        v27 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          int v28 = 138412290;
          id v29 = v10;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Notifying about message: %@", (uint8_t *)&v28, 0xCu);
        }
      }
      [v26 account:v24 chat:0 style:0 chatProperties:0 messageUpdated:v10];
    }
    else if (IMOSLoggingEnabled())
    {
      __int16 v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        int v28 = 138412546;
        id v29 = v8;
        __int16 v30 = 2112;
        id v31 = v9;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Mismatched IDs and serviceNames array to mark as played expressive send (IDs: %@   Service names: %@)", (uint8_t *)&v28, 0x16u);
      }
    }
  }
}

- (void)markHasHadSuccessfulQueryForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = +[IMDClientRequestContext currentContext];
      id v10 = [v9 listenerID];
      *(_DWORD *)buf = 138412802;
      id v31 = v10;
      __int16 v32 = 2112;
      id v33 = v6;
      __int16 v34 = 2112;
      id v35 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Request from %@ to mark chat as had successful ID query for IDs: %@  services: %@", buf, 0x20u);
    }
  }
  if ([v6 count] && objc_msgSend(v7, "count"))
  {
    id v11 = [v6 count];
    if (v11 == [v7 count])
    {
      id v12 = objc_alloc_init((Class)NSMutableSet);
      if ([v6 count])
      {
        unint64_t v13 = 0;
        do
        {
          id v14 = [v6 objectAtIndex:v13];
          id v15 = [v7 objectAtIndex:v13];
          v16 = (void *)IMCopyGUIDForChat();

          [v12 addObject:v16];
          ++v13;
        }
        while (v13 < (unint64_t)[v6 count]);
      }
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v17 = v12;
      id v18 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v26;
        do
        {
          v20 = 0;
          do
          {
            if (*(void *)v26 != v19) {
              objc_enumerationMutation(v17);
            }
            uint64_t v21 = *(void *)(*((void *)&v25 + 1) + 8 * (void)v20);
            id v22 = +[IMDChatRegistry sharedInstance];
            __int16 v23 = [v22 existingChatWithGUID:v21];

            [v23 updateHasHadSuccessfulQuery:1];
            v20 = (char *)v20 + 1;
          }
          while (v18 != v20);
          id v18 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v18);
      }
    }
    else if (IMOSLoggingEnabled())
    {
      id v24 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v31 = v6;
        __int16 v32 = 2112;
        id v33 = v7;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Mismatched IDs and serviceNames array to mark chat as had successful ID query (IDs: %@   Service names: %@)", buf, 0x16u);
      }
    }
  }
}

- (void)sendNotifyRecipientCommandForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 message:(id)a6
{
  id v59 = a3;
  id v58 = a5;
  id v56 = a6;
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = +[IMDClientRequestContext currentContext];
      id v10 = [v9 listenerID];
      *(_DWORD *)buf = 138412802;
      id v67 = v10;
      __int16 v68 = 2112;
      id v69 = v59;
      __int16 v70 = 2112;
      id v71 = v58;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Request from %@ to send notify recipient command with IDs: %@  services: %@", buf, 0x20u);
    }
  }
  if ([v59 count] && objc_msgSend(v58, "count"))
  {
    id v11 = [v59 count];
    if (v11 == [v58 count])
    {
      id v12 = +[IMDMessageStore sharedInstance];
      unint64_t v13 = [v56 guid];
      id v14 = [v12 messageWithGUID:v13];

      if (v14)
      {
        objc_msgSend(v14, "setFlags:", (unint64_t)objc_msgSend(v14, "flags") | 0x800000000);
        id v15 = +[IMDMessageStore sharedInstance];
        id v56 = [v15 storeMessage:v14 forceReplace:0 modifyError:0 modifyFlags:1 flagMask:0x800000000];
      }
      else
      {
        id v56 = 0;
      }
      if (IMOSLoggingEnabled())
      {
        id v17 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v67 = v56;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Found message to mark as notified recipient: %@", buf, 0xCu);
        }
      }
      id v57 = objc_alloc_init((Class)NSMutableSet);
      if ([v59 count])
      {
        unint64_t v18 = 0;
        do
        {
          uint64_t v19 = [v59 objectAtIndex:v18];
          v20 = [v58 objectAtIndex:v18];
          uint64_t v21 = (void *)IMCopyGUIDForChat();

          [v57 addObject:v21];
          ++v18;
        }
        while (v18 < (unint64_t)[v59 count]);
      }
      if (v56)
      {
        id v22 = +[IMDMessageStore sharedInstance];
        v60 = [v22 chatForMessage:v56];

        BOOL v23 = [v60 style] == 45;
        id v24 = [v59 count];
        if (v23)
        {
          if (v24)
          {
            unint64_t v25 = 0;
            do
            {
              long long v26 = [v59 objectAtIndex:v25];
              long long v27 = [v58 objectAtIndex:v25];
              long long v28 = +[IMDChatStore sharedInstance];
              id v29 = [v28 chatsWithHandle:v26 onService:v27];

              __int16 v30 = [v29 arrayByApplyingSelector:"guid"];
              [v57 addObjectsFromArray:v30];

              ++v25;
            }
            while (v25 < (unint64_t)[v59 count]);
          }
        }
        else if (v24)
        {
          unint64_t v31 = 0;
          do
          {
            __int16 v32 = [v59 objectAtIndex:v31];
            id v33 = [v58 objectAtIndex:v31];
            __int16 v34 = +[IMDChatStore sharedInstance];
            id v35 = [v34 chatsWithRoomname:v32 onService:v33];

            v36 = [v35 arrayByApplyingSelector:"guid"];
            [v57 addObjectsFromArray:v36];

            ++v31;
          }
          while (v31 < (unint64_t)[v59 count]);
        }
        v37 = [v56 guid];
        long long v63 = 0u;
        long long v64 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        id v38 = v57;
        id v39 = [v38 countByEnumeratingWithState:&v61 objects:v65 count:16];
        if (v39)
        {
          uint64_t v40 = *(void *)v62;
          do
          {
            v41 = 0;
            do
            {
              if (*(void *)v62 != v40) {
                objc_enumerationMutation(v38);
              }
              uint64_t v42 = *(void *)(*((void *)&v61 + 1) + 8 * (void)v41);
              v43 = +[IMDChatRegistry sharedInstance];
              v44 = [v43 existingChatWithGUID:v42];

              v45 = [v44 lastMessage];
              v46 = [v45 guid];
              LODWORD(v43) = [v46 isEqualToString:v37];

              if (v43)
              {
                v47 = +[IMDChatRegistry sharedInstance];
                [v47 updateStateForChat:v60 hintMessage:0 shouldRebuildFailedMessageDate:0];
              }
              v41 = (char *)v41 + 1;
            }
            while (v39 != v41);
            id v39 = [v38 countByEnumeratingWithState:&v61 objects:v65 count:16];
          }
          while (v39);
        }

        v48 = [v56 accountID];
        v49 = +[IMDAccountController sharedInstance];
        v50 = [v49 sessionForAccount:v48];

        if (IMOSLoggingEnabled())
        {
          v51 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v67 = v56;
            _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_INFO, "Sending notifiy recipient command for: %@", buf, 0xCu);
          }
        }
        v52 = [v60 chatIdentifier];
        objc_msgSend(v50, "sendNotifyRecipientCommandForMessage:toChatGuid:identifier:style:", v56, 0, v52, objc_msgSend(v60, "style"));

        v53 = +[IMDBroadcastController sharedProvider];
        v54 = [v53 broadcasterForChatListeners];

        if (IMOSLoggingEnabled())
        {
          v55 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v67 = v56;
            _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_INFO, "Notifying about message: %@", buf, 0xCu);
          }
        }
        [v54 account:v48 chat:0 style:0 chatProperties:0 messageUpdated:v56];
      }
    }
    else if (IMOSLoggingEnabled())
    {
      v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v67 = v59;
        __int16 v68 = 2112;
        id v69 = v58;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Mismatched IDs and serviceNames array to notify recipient (IDs: %@   Service names: %@)", buf, 0x16u);
      }
    }
  }
}

- (void)markSavedForMessageGUID:(id)a3
{
  id v23 = a3;
  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = +[IMDClientRequestContext currentContext];
      id v6 = [v5 listenerID];
      *(_DWORD *)buf = 138412546;
      id v29 = v6;
      __int16 v30 = 2112;
      id v31 = v23;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Request from %@ to mark message as saved with GUID: %@", buf, 0x16u);
    }
  }
  if ([v23 length])
  {
    id v7 = +[IMDMessageStore sharedInstance];
    id v8 = [v7 chatsForMessageGUID:v23];

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v9 = v8;
    id v10 = [v9 countByEnumeratingWithState:&v24 objects:v34 count:16];
    if (v10)
    {
      uint64_t v12 = *(void *)v25;
      *(void *)&long long v11 = 138412802;
      long long v22 = v11;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          id v15 = objc_msgSend(v14, "chatIdentifier", v22);
          v16 = IMSingleObjectArray();

          id v17 = [v14 serviceName];
          unint64_t v18 = IMSingleObjectArray();

          if ([v18 count] && objc_msgSend(v16, "count"))
          {
            uint64_t v19 = +[IMDMessageStore sharedInstance];
            v20 = [v19 messageWithGUID:v23];

            -[IMDaemonChatModifyReadStateRequestHandler markSavedForIDs:style:onServices:message:](self, "markSavedForIDs:style:onServices:message:", v16, [v14 style], v18, v20);
          }
          else if (IMOSLoggingEnabled())
          {
            uint64_t v21 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v22;
              id v29 = v14;
              __int16 v30 = 2112;
              id v31 = v16;
              __int16 v32 = 2112;
              id v33 = v18;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Empty IDs or services for chat: %@ (IDs: %@  Services: %@)", buf, 0x20u);
            }
          }
        }
        id v10 = [v9 countByEnumeratingWithState:&v24 objects:v34 count:16];
      }
      while (v10);
    }
  }
}

- (void)markSavedForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 message:(id)a6
{
  id v63 = a3;
  id v62 = a5;
  id v59 = a6;
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = +[IMDClientRequestContext currentContext];
      id v10 = [v9 listenerID];
      *(_DWORD *)buf = 138412802;
      uint64_t v71 = (uint64_t)v10;
      __int16 v72 = 2112;
      id v73 = v63;
      __int16 v74 = 2112;
      id v75 = v62;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Request from %@ to mark message as saved with IDs: %@  services: %@", buf, 0x20u);
    }
  }
  if (objc_msgSend(v63, "count", v59) && objc_msgSend(v62, "count"))
  {
    id v11 = [v63 count];
    if (v11 == [v62 count])
    {
      uint64_t v12 = [v60 guid];
      if ([v12 length])
      {
        unint64_t v13 = +[IMDMessageStore sharedInstance];
        id v14 = [v13 messageWithGUID:v12];

        if (v14)
        {
          [v14 setExpireState:3];
          id v15 = +[IMDMessageStore sharedInstance];
          uint64_t v61 = [v15 storeMessage:v14 forceReplace:0 modifyError:1 modifyFlags:0 flagMask:0];

          if (IMOSLoggingEnabled())
          {
            v16 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v71 = v61;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Found message to mark as saved: %@", buf, 0xCu);
            }
          }
          id v17 = objc_alloc_init((Class)NSMutableSet);
          if ([v63 count])
          {
            unint64_t v18 = 0;
            do
            {
              uint64_t v19 = objc_msgSend(v63, "objectAtIndex:", v18, v61);
              v20 = [v62 objectAtIndex:v18];
              uint64_t v21 = (void *)IMCopyGUIDForChat();

              [v17 addObject:v21];
              ++v18;
            }
            while (v18 < (unint64_t)[v63 count]);
          }
          long long v22 = +[IMDMessageStore sharedInstance];
          long long v64 = [v22 chatForMessage:v60];

          BOOL v23 = [v64 style] == 45;
          id v24 = [v63 count];
          if (v23)
          {
            if (v24)
            {
              unint64_t v25 = 0;
              do
              {
                long long v26 = [v63 objectAtIndex:v25];
                long long v27 = [v62 objectAtIndex:v25];
                long long v28 = +[IMDChatStore sharedInstance];
                id v29 = [v28 chatsWithHandle:v26 onService:v27];

                __int16 v30 = [v29 arrayByApplyingSelector:"guid"];
                [v17 addObjectsFromArray:v30];

                ++v25;
              }
              while (v25 < (unint64_t)[v63 count]);
            }
          }
          else if (v24)
          {
            unint64_t v34 = 0;
            do
            {
              id v35 = [v63 objectAtIndex:v34];
              v36 = [v62 objectAtIndex:v34];
              v37 = +[IMDChatStore sharedInstance];
              id v38 = [v37 chatsWithRoomname:v35 onService:v36];

              id v39 = [v38 arrayByApplyingSelector:"guid"];
              [v17 addObjectsFromArray:v39];

              ++v34;
            }
            while (v34 < (unint64_t)[v63 count]);
          }
          long long v67 = 0u;
          long long v68 = 0u;
          long long v65 = 0u;
          long long v66 = 0u;
          id v40 = v17;
          id v41 = [v40 countByEnumeratingWithState:&v65 objects:v69 count:16];
          if (v41)
          {
            uint64_t v42 = *(void *)v66;
            do
            {
              v43 = 0;
              do
              {
                if (*(void *)v66 != v42) {
                  objc_enumerationMutation(v40);
                }
                uint64_t v44 = *(void *)(*((void *)&v65 + 1) + 8 * (void)v43);
                v45 = +[IMDChatRegistry sharedInstance];
                v46 = [v45 existingChatWithGUID:v44];

                v47 = [v46 lastMessage];
                v48 = [v47 guid];
                unsigned int v49 = [v48 isEqualToString:v12];

                if (v49)
                {
                  v50 = +[IMDChatRegistry sharedInstance];
                  [v50 updateStateForChat:v64 hintMessage:0 shouldRebuildFailedMessageDate:0];
                }
                v43 = (char *)v43 + 1;
              }
              while (v41 != v43);
              id v41 = [v40 countByEnumeratingWithState:&v65 objects:v69 count:16];
            }
            while (v41);
          }

          v51 = [v60 accountID];
          v52 = +[IMDAccountController sharedInstance];
          v53 = [v52 sessionForAccount:v51];

          if (IMOSLoggingEnabled())
          {
            v54 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v71 = (uint64_t)v60;
              _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_INFO, "Sending saved receipt for: %@", buf, 0xCu);
            }
          }
          v55 = [v64 chatIdentifier];
          objc_msgSend(v53, "sendSavedReceiptForMessage:toChatID:identifier:style:", v60, 0, v55, objc_msgSend(v64, "style"));

          id v56 = +[IMDBroadcastController sharedProvider];
          id v57 = [v56 broadcasterForChatListeners];

          if (IMOSLoggingEnabled())
          {
            id v58 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v71 = (uint64_t)v60;
              _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_INFO, "Notifying about message: %@", buf, 0xCu);
            }
          }
          [v57 account:v51 chat:0 style:0 chatProperties:0 messageUpdated:v60];
        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            id v33 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v71 = (uint64_t)v12;
              _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "No message found for message guid: %@", buf, 0xCu);
            }
          }
          v60 = 0;
        }
      }
      else
      {
        __int16 v32 = IMLogHandleForCategory();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          sub_10004CB18((uint64_t)v60, v32);
        }
      }
    }
    else if (IMOSLoggingEnabled())
    {
      id v31 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v71 = (uint64_t)v63;
        __int16 v72 = 2112;
        id v73 = v62;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Mismatched IDs and serviceNames array to mark as saved (IDs: %@   Service names: %@)", buf, 0x16u);
      }
    }
  }
}

@end
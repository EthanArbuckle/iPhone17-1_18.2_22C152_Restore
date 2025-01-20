@interface IMReadReceiptProcessingPipelineComponent
- (IMReadReceiptProcessingPipelineComponent)initWithMessageStore:(id)a3 chatRegistry:(id)a4 recents:(id)a5 IDSService:(id)a6;
- (id)_markMessagesUpToGUID:(id)a3 forChat:(id)a4 isFromMe:(BOOL)a5 date:(id)a6;
- (id)runIndividuallyWithInput:(id)a3;
- (void)_donateReadEventForChat:(id)a3;
@end

@implementation IMReadReceiptProcessingPipelineComponent

- (IMReadReceiptProcessingPipelineComponent)initWithMessageStore:(id)a3 chatRegistry:(id)a4 recents:(id)a5 IDSService:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)IMReadReceiptProcessingPipelineComponent;
  v15 = [(IMReadReceiptProcessingPipelineComponent *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_messageStore, a3);
    objc_storeStrong((id *)&v16->_chatRegistry, a4);
    objc_storeStrong((id *)&v16->_recents, a5);
    objc_storeStrong((id *)&v16->_service, a6);
  }

  return v16;
}

- (id)runIndividuallyWithInput:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v48 = a3;
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = [v48 GUID];
      *(_DWORD *)buf = 138412290;
      uint64_t v61 = (uint64_t)v4;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "<IMReadReceiptProcessingPipelineComponent> Started processing for Message GUID: %@", buf, 0xCu);
    }
  }
  if (IMGetCachedDomainBoolForKey())
  {
    if (IMOSLoggingEnabled())
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = [v48 GUID];
        *(_DWORD *)buf = 138412290;
        uint64_t v61 = (uint64_t)v6;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "    Ignoring read receipt for message: %@", buf, 0xCu);
      }
    }
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithValue:v48];
  }
  else
  {
    int v8 = [v48 isFromDefaultPairedDevice];
    int v46 = [v48 isFromMe];
    if (IMOSLoggingEnabled())
    {
      v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = [v48 GUID];
        id v11 = (void *)v10;
        id v12 = @"NO";
        if (v46) {
          id v13 = @"YES";
        }
        else {
          id v13 = @"NO";
        }
        *(_DWORD *)buf = 138412802;
        uint64_t v61 = v10;
        __int16 v62 = 2112;
        v63 = v13;
        if (v8) {
          id v12 = @"YES";
        }
        __int16 v64 = 2112;
        v65 = v12;
        _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Received read receipt for: %@ from me: %@ isDefaultPairedDevice: %@", buf, 0x20u);
      }
    }
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v15 = [v48 GUID];
    v47 = [(IMDMessageStore *)self->_messageStore chatsForMessageGUID:v15];
    if ([v47 count])
    {
      v16 = (void *)MEMORY[0x1E4F1C9C8];
      v17 = [v48 timestamp];
      objc_super v18 = objc_msgSend(v16, "__im_iMessageDateFromTimeStamp:", v17);

      if (v46)
      {
        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        id v19 = v47;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v54 objects:v59 count:16];
        if (v20)
        {
          uint64_t v21 = *(void *)v55;
          while (2)
          {
            for (uint64_t i = 0; i != v20; ++i)
            {
              if (*(void *)v55 != v21) {
                objc_enumerationMutation(v19);
              }
              v23 = *(__CFString **)(*((void *)&v54 + 1) + 8 * i);
              if (IMOSLoggingEnabled())
              {
                v24 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  uint64_t v61 = (uint64_t)v15;
                  __int16 v62 = 2112;
                  v63 = v23;
                  _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, "Found chat to mark as read for messageID: %@ chat: %@", buf, 0x16u);
                }
              }
              v25 = [(IMReadReceiptProcessingPipelineComponent *)self _markMessagesUpToGUID:v15 forChat:v23 isFromMe:0 date:v18];
              [v14 addObjectsFromArray:v25];

              if (![v14 count]
                && ![(IMDMessageStore *)self->_messageStore hasStoredMessageWithGUID:v15])
              {
                [(IDSService *)self->_service _IMDTrackMetric:10401 ForMessageGUID:v15];
                [(IMDMessageStore *)self->_messageStore addMissingMessageReadReceipt:v15];
                id v43 = objc_alloc(MEMORY[0x1E4F28C58]);
                v44 = (void *)[v43 initWithDomain:*MEMORY[0x1E4F6BE88] code:5 userInfo:0];
                v7 = (void *)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithError:v44];

                goto LABEL_59;
              }
            }
            uint64_t v20 = [v19 countByEnumeratingWithState:&v54 objects:v59 count:16];
            if (v20) {
              continue;
            }
            break;
          }
        }
      }
      else
      {
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        id v28 = v47;
        uint64_t v29 = [v28 countByEnumeratingWithState:&v50 objects:v58 count:16];
        if (v29)
        {
          uint64_t v30 = *(void *)v51;
          do
          {
            for (uint64_t j = 0; j != v29; ++j)
            {
              if (*(void *)v51 != v30) {
                objc_enumerationMutation(v28);
              }
              v32 = *(__CFString **)(*((void *)&v50 + 1) + 8 * j);
              if (IMOSLoggingEnabled())
              {
                v33 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  uint64_t v61 = (uint64_t)v15;
                  __int16 v62 = 2112;
                  v63 = v32;
                  _os_log_impl(&dword_1D967A000, v33, OS_LOG_TYPE_INFO, "Found chat to mark as read for messageID: %@ chat: %@", buf, 0x16u);
                }
              }
              v34 = [(IMReadReceiptProcessingPipelineComponent *)self _markMessagesUpToGUID:v15 forChat:v32 isFromMe:1 date:v18];
              [v14 addObjectsFromArray:v34];
            }
            uint64_t v29 = [v28 countByEnumeratingWithState:&v50 objects:v58 count:16];
          }
          while (v29);
        }

        id v19 = [v48 fromPushID];
        v35 = [v48 fromIdentifier];
        v36 = v35;
        if (v19 && v35)
        {
          recents = self->_recents;
          v38 = [v35 _stripFZIDPrefix];
          [(IMDRecentsController *)recents updateLatestActiveDestination:v19 ForHandle:v38 incomingType:1];

          v39 = self->_recents;
          v40 = IMSingleObjectArray();
          [(IMDRecentsController *)v39 noteRecentMessageForPeople:v40];
        }
      }

      [v48 setMessageItems:v14];
      v41 = [v47 firstObject];
      [v48 setChat:v41];

      if (v46)
      {
        [(IDSService *)self->_service _IMDTrackMetric:10400 ForMessageGUID:v15];
        v42 = [v47 firstObject];
        [(IMReadReceiptProcessingPipelineComponent *)self _donateReadEventForChat:v42];
      }
      v7 = (void *)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithValue:v48];
    }
    else
    {
      if (v46 && ![(IMDMessageStore *)self->_messageStore hasStoredMessageWithGUID:v15])
      {
        [(IDSService *)self->_service _IMDTrackMetric:10401 ForMessageGUID:v15];
        [(IMDMessageStore *)self->_messageStore addMissingMessageReadReceipt:v15];
      }
      id v26 = objc_alloc(MEMORY[0x1E4F28C58]);
      v27 = (void *)[v26 initWithDomain:*MEMORY[0x1E4F6BE88] code:8 userInfo:0];
      v7 = (void *)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithError:v27];
    }
LABEL_59:
  }

  return v7;
}

- (id)_markMessagesUpToGUID:(id)a3 forChat:(id)a4 isFromMe:(BOOL)a5 date:(id)a6
{
  BOOL v7 = a5;
  v53[1] = *MEMORY[0x1E4F143B8];
  id v35 = a3;
  id v10 = a4;
  id v11 = a6;
  v36 = v10;
  if (!v10)
  {
    obuint64_t j = 0;
    goto LABEL_41;
  }
  v39 = self;
  id v38 = v11;
  messageStore = self->_messageStore;
  id v13 = [v10 guid];
  v53[0] = v13;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:1];
  v37 = [(IMDMessageStore *)messageStore markMessagesAsReadWithChatGUIDs:v14 upToGUID:v35 readDate:v38 fromMe:v7];

  if (IMOSLoggingEnabled())
  {
    v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      long long v52 = v37;
      _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "Found messages guids to mark as read: %@", buf, 0xCu);
    }
  }
  if ([v37 count])
  {
    [(IMDMessageStore *)self->_messageStore retractPostedNotificationsForMessageGUIDs:v37];
    [(IMDMessageStore *)self->_messageStore messagesWithGUIDs:v37];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
    if (v16)
    {
      uint64_t v17 = 0;
      objc_super v18 = 0;
      char v19 = 0;
      uint64_t v20 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v46 != v20) {
            objc_enumerationMutation(obj);
          }
          v22 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          if (v7)
          {
            v23 = [*(id *)(*((void *)&v45 + 1) + 8 * i) timeDelivered];
            BOOL v24 = v23 == 0;

            if (v24)
            {
              if (v38)
              {
                objc_msgSend(v22, "setTimeDelivered:");
              }
              else
              {
                v25 = [MEMORY[0x1E4F1C9C8] date];
                [v22 setTimeDelivered:v25];
              }
              char v19 = 1;
            }
          }
          if ([v22 errorCode])
          {
            [v22 setErrorCode:0];
            char v19 = 1;
          }
          id v26 = [v22 timeRead];
          uint64_t v27 = objc_msgSend(v26, "__im_nanosecondTimeInterval");

          if (v27 >= v17)
          {
            uint64_t v28 = [v22 guid];

            uint64_t v17 = v27;
            objc_super v18 = (void *)v28;
          }
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
      }
      while (v16);

      if ((v19 & 1) == 0) {
        goto LABEL_37;
      }
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v29 = obj;
      uint64_t v30 = [v29 countByEnumeratingWithState:&v41 objects:v49 count:16];
      if (v30)
      {
        uint64_t v31 = *(void *)v42;
        do
        {
          for (uint64_t j = 0; j != v30; ++j)
          {
            if (*(void *)v42 != v31) {
              objc_enumerationMutation(v29);
            }
            id v33 = [(IMDMessageStore *)v39->_messageStore storeMessage:*(void *)(*((void *)&v41 + 1) + 8 * j) forceReplace:0 modifyError:1 modifyFlags:0 flagMask:0];
          }
          uint64_t v30 = [v29 countByEnumeratingWithState:&v41 objects:v49 count:16];
        }
        while (v30);
      }
    }
    else
    {
      objc_super v18 = 0;
      uint64_t v17 = 0;
    }

LABEL_37:
    if (!v7)
    {
      [v36 updateLastReadMessageTimeStampIfNeeded:v17];
      [v36 updateLastSeenMessageGuidIfNeeded:v18];
    }
    [(IMDChatRegistry *)v39->_chatRegistry updateStateForChat:v36 hintMessage:0 shouldRebuildFailedMessageDate:0 shouldCalculateUnreadCount:1];

    goto LABEL_40;
  }
  obuint64_t j = 0;
LABEL_40:

  id v11 = v38;
LABEL_41:

  return obj;
}

- (void)_donateReadEventForChat:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = [v3 chatIdentifier];
    v6 = (void *)[v5 copy];

    if ([v6 length])
    {
      BOOL v7 = IMBiomeQueue();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1D96C74B0;
      block[3] = &unk_1E6B73268;
      id v12 = v6;
      dispatch_async(v7, block);
    }
    else if (IMOSLoggingEnabled())
    {
      v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        id v10 = [v4 guid];
        *(_DWORD *)buf = 138412290;
        id v14 = v10;
        _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Cannot donate read receipt due to nil chat identifier for chat %@", buf, 0xCu);
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    int v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Cannot donate read receipt due to nil chat", buf, 2u);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_recents, 0);
  objc_storeStrong((id *)&self->_chatRegistry, 0);

  objc_storeStrong((id *)&self->_messageStore, 0);
}

@end
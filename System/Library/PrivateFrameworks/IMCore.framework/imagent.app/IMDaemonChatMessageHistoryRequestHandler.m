@interface IMDaemonChatMessageHistoryRequestHandler
- (id)_serializedFileTransfersForItems:(id)a3;
- (void)_populateParentMessagesIfNeeded:(id)a3;
- (void)_updateLastMessageTimeStampForChat:(id)a3;
- (void)cleanupAttachments;
- (void)clearHistoryForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 beforeGUID:(id)a6 afterGUID:(id)a7 chatID:(id)a8 queryID:(id)a9;
- (void)deleteMessageWithGUIDs:(id)a3 queryID:(id)a4;
- (void)fetchEarliestMessageDateForChatsWithGUIDs:(id)a3 completion:(id)a4;
- (void)fetchIncomingPendingMessagesOverSatelliteForChatsWithIDs:(id)a3 services:(id)a4;
- (void)fetchMessageHistorySummaryForDateInterval:(id)a3 chatIdentifiers:(id)a4 chatStyle:(unsigned __int8)a5 services:(id)a6 reply:(id)a7;
- (void)fetchOldestMessageDateForChatIdentifiers:(id)a3 chatStyle:(unsigned __int8)a4 services:(id)a5 reply:(id)a6;
- (void)loadAttachmentsForChatWithGUID:(id)a3 chatIdentifiers:(id)a4 style:(unsigned __int8)a5 services:(id)a6 reply:(id)a7;
- (void)loadAttachmentsForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 chatID:(id)a6 queryID:(id)a7;
- (void)loadFrequentRepliesForChatWithGUID:(id)a3 chatIdentifiers:(id)a4 style:(unsigned __int8)a5 services:(id)a6 limit:(int64_t)a7 reply:(id)a8;
- (void)loadFrequentRepliesForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 limit:(int64_t)a6 chatID:(id)a7 queryID:(id)a8;
- (void)loadHistoryForChatWithGUID:(id)a3 chatIdentifiers:(id)a4 style:(unsigned __int8)a5 services:(id)a6 limit:(int64_t)a7 beforeGUID:(id)a8 afterGUID:(id)a9 threadIdentifier:(id)a10 reply:(id)a11;
- (void)loadHistoryForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 limit:(int64_t)a6 beforeGUID:(id)a7 afterGUID:(id)a8 threadIdentifier:(id)a9 chatID:(id)a10 queryID:(id)a11;
- (void)loadItemWithGUID:(id)a3 queryID:(id)a4;
- (void)loadMessageItemWithGUID:(id)a3 queryID:(id)a4;
- (void)loadMessageWithGUID:(id)a3 queryID:(id)a4;
- (void)loadPagedHistoryAroundMessageWithGUID:(id)a3 chatGUID:(id)a4 chatIdentifiers:(id)a5 style:(unsigned __int8)a6 services:(id)a7 numberOfMessagesBefore:(int64_t)a8 numberOfMessagesAfter:(int64_t)a9 threadIdentifier:(id)a10 reply:(id)a11;
- (void)loadPagedHistoryForGUID:(id)a3 chatIdentifiers:(id)a4 style:(unsigned __int8)a5 onServices:(id)a6 numberOfMessagesBefore:(int64_t)a7 numberOfMessagesAfter:(int64_t)a8 threadIdentifier:(id)a9 chatID:(id)a10 queryID:(id)a11;
- (void)loadRecoverableMessagesMetadataWithQueryID:(id)a3;
- (void)loadUncachedAttachmentCountForChatWithGUID:(id)a3 chatIdentifiers:(id)a4 style:(unsigned __int8)a5 services:(id)a6 reply:(id)a7;
- (void)loadUncachedAttachmentCountForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 chatID:(id)a6 queryID:(id)a7;
- (void)loadUnreadForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 limit:(int64_t)a6 fallbackGUID:(id)a7 chatId:(id)a8 queryID:(id)a9;
- (void)loadUnreadHistoryForChatWithGUID:(id)a3 chatIdentifiers:(id)a4 style:(unsigned __int8)a5 services:(id)a6 limit:(int64_t)a7 fallbackMessageGUID:(id)a8 reply:(id)a9;
- (void)markAsSpamForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 chatID:(id)a6 queryID:(id)a7 autoReport:(BOOL)a8;
- (void)markChatAsSpamWithGUID:(id)a3 chatIdentifiers:(id)a4 style:(unsigned __int8)a5 services:(id)a6 isAutoReport:(BOOL)a7 isJunkReportedToCarrier:(BOOL)a8 reply:(id)a9;
- (void)markChatAsSpamWithGUID:(id)a3 chatIdentifiers:(id)a4 style:(unsigned __int8)a5 services:(id)a6 isAutoReport:(BOOL)a7 isJunkReportedToCarrier:(BOOL)a8 reportReason:(unint64_t)a9 reply:(id)a10;
- (void)moveMessagesInChatsWithGUIDsToRecentlyDeleted:(id)a3 deleteDate:(id)a4 queryID:(id)a5;
- (void)moveMessagesWithGUIDsToRecentlyDeleted:(id)a3 deleteDate:(id)a4 queryID:(id)a5;
- (void)permanentlyDeleteRecoverableMessagesInChatsWithGUIDs:(id)a3 queryID:(id)a4;
- (void)purgeAttachmentsForChatGUID:(id)a3;
- (void)recoverMessagesWithChatGUIDs:(id)a3 queryID:(id)a4;
- (void)retractNotificationsForReadMessagesWithGUIDs:(id)a3;
- (void)updateChatsUsingMessageGUIDsAndSummaries:(id)a3;
- (void)updatePluginMessageWithGUID:(id)a3 newPayloadData:(id)a4 completion:(id)a5;
- (void)updateUnformattedID:(id)a3 forBuddyID:(id)a4 onService:(id)a5;
- (void)upgradeCompleteMyMomentLinkToStackWithMessageGUID:(id)a3 chatGUID:(id)a4;
@end

@implementation IMDaemonChatMessageHistoryRequestHandler

- (void)loadRecoverableMessagesMetadataWithQueryID:(id)a3
{
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Recently Deleted | Will retrieve recoverable message count", buf, 2u);
    }
  }
  v5 = +[IMDChatRegistry sharedInstance];
  v6 = [v5 recoverableMessagesMetadata];

  v7 = +[IMDClientRequestContext currentContext];
  v8 = [v7 replyProxy];

  [v8 loadedRecoverableMessagesMetadata:v6 queryID:v3];
  if (IMOSLoggingEnabled())
  {
    v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Recently Deleted | Finished retrieving recoverable message count", v10, 2u);
    }
  }
}

- (void)loadMessageWithGUID:(id)a3 queryID:(id)a4
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
      int v20 = 138412546;
      v21 = v9;
      __int16 v22 = 2112;
      id v23 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Request from %@ to load message with guid: %@", (uint8_t *)&v20, 0x16u);
    }
  }
  v10 = +[IMDMessageStore sharedInstance];
  v11 = [v10 messageWithGUID:v5];

  v12 = +[IMDMessageStore sharedInstance];
  v13 = [v12 chatForMessageGUID:v5];

  if (IMOSLoggingEnabled())
  {
    v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v20 = 138412290;
      v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "   Resulting message: %@", (uint8_t *)&v20, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v20 = 138412290;
      v21 = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "      Resulting chat: %@", (uint8_t *)&v20, 0xCu);
    }
  }
  v16 = +[IMDClientRequestContext currentContext];
  v17 = [v16 replyProxy];
  v18 = [v13 guid];
  v19 = IMSingleObjectArray();
  [v17 messageQuery:v6 finishedWithResult:v11 chatGUIDs:v19];
}

- (void)loadMessageItemWithGUID:(id)a3 queryID:(id)a4
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
      int v20 = 138412546;
      v21 = v9;
      __int16 v22 = 2112;
      id v23 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Request from %@ to load message item with guid: %@", (uint8_t *)&v20, 0x16u);
    }
  }
  v10 = +[IMDMessageStore sharedInstance];
  v11 = [v10 messageWithGUID:v5];

  v12 = +[IMDMessageStore sharedInstance];
  v13 = [v12 chatForMessageGUID:v5];

  if (IMOSLoggingEnabled())
  {
    v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v20 = 138412290;
      v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "   Resulting message: %@", (uint8_t *)&v20, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v20 = 138412290;
      v21 = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "      Resulting chat: %@", (uint8_t *)&v20, 0xCu);
    }
  }
  v16 = +[IMDClientRequestContext currentContext];
  v17 = [v16 replyProxy];

  v18 = [v13 guid];
  v19 = IMSingleObjectArray();
  [v17 messageItemQuery:v6 finishedWithResult:v11 chatGUIDs:v19];
}

- (void)loadHistoryForChatWithGUID:(id)a3 chatIdentifiers:(id)a4 style:(unsigned __int8)a5 services:(id)a6 limit:(int64_t)a7 beforeGUID:(id)a8 afterGUID:(id)a9 threadIdentifier:(id)a10 reply:(id)a11
{
  int v14 = a5;
  id v43 = a3;
  id v16 = a4;
  id v17 = a6;
  id v45 = a8;
  id v44 = a9;
  id v46 = a10;
  v18 = (void (**)(id, void *, void *))a11;
  if (IMOSLoggingEnabled())
  {
    v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      int v20 = +[IMDClientRequestContext currentContext];
      v21 = [v20 listenerID];
      *(_DWORD *)buf = 138413826;
      *(void *)v53 = v21;
      *(_WORD *)&v53[8] = 2112;
      *(void *)&v53[10] = v16;
      __int16 v54 = 2112;
      int64_t v55 = (int64_t)v17;
      __int16 v56 = 1024;
      int v57 = a7;
      __int16 v58 = 2112;
      id v59 = v45;
      __int16 v60 = 2112;
      id v61 = v44;
      __int16 v62 = 2112;
      id v63 = v46;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Request from %@ to load messages with chat ID: %@  service: %@  limit: %d  beforeGUID: %@ aferGUID: %@ threadIdentifier: %@", buf, 0x44u);
    }
  }
  if ([v16 count] && objc_msgSend(v17, "count"))
  {
    __int16 v22 = +[IMDMessageStore sharedInstance];
    id v23 = v22;
    if (v14 == 45) {
      [v22 itemsWithHandles:v16 onServices:v17 messageGUID:v45 threadIdentifier:v46 limit:a7];
    }
    else {
    v25 = [v22 itemsWithRoomNames:v16 onServices:v17 messageGUID:v45 threadIdentifier:v46 limit:a7];
    }

    if ([v25 count] == (id)a7)
    {
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v26 = v25;
      uint64_t v27 = 0;
      id v28 = [v26 countByEnumeratingWithState:&v47 objects:v51 count:16];
      if (v28)
      {
        uint64_t v29 = *(void *)v48;
        do
        {
          for (i = 0; i != v28; i = (char *)i + 1)
          {
            if (*(void *)v48 != v29) {
              objc_enumerationMutation(v26);
            }
            v27 += [*(id *)(*((void *)&v47 + 1) + 8 * i) isAssociatedMessageItem] ^ 1;
          }
          id v28 = [v26 countByEnumeratingWithState:&v47 objects:v51 count:16];
        }
        while (v28);
      }

      if (a7 >= 0) {
        int64_t v31 = a7;
      }
      else {
        int64_t v31 = a7 + 1;
      }
      if (v27 >= v31 >> 1)
      {
        v25 = v26;
      }
      else
      {
        BOOL v32 = v14 == 45;
        v33 = +[IMDMessageStore sharedInstance];
        v34 = v33;
        if (v32) {
          [v33 itemsWithHandles:v16 onServices:v17 messageGUID:v45 threadIdentifier:v46 limit:2 * a7];
        }
        else {
        v25 = [v33 itemsWithRoomNames:v16 onServices:v17 messageGUID:v45 threadIdentifier:v46 limit:2 * a7];
        }

        if (IMOSLoggingEnabled())
        {
          v35 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218496;
            *(void *)v53 = 2 * a7;
            *(_WORD *)&v53[8] = 2048;
            *(void *)&v53[10] = v27;
            __int16 v54 = 2048;
            int64_t v55 = a7;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "   Requeried for %ld messages since we only loaded %ld of %ld top level messages", buf, 0x20u);
          }
        }
      }
    }
    if (IMOSLoggingEnabled())
    {
      v36 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        unsigned int v37 = [v25 count];
        v38 = [v25 arrayByApplyingSelector:"guid"];
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v53 = v37;
        *(_WORD *)&v53[4] = 2112;
        *(void *)&v53[6] = v38;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "   Resulting messages (%d): %@", buf, 0x12u);
      }
    }
    v39 = +[IMDMessageStore sharedInstance];
    [v39 loadConsumedSessionPayloadsForItems:v25];

    v40 = (void *)IMCreateSerializedItemsFromArray();
    v41 = [(IMDaemonChatMessageHistoryRequestHandler *)self _serializedFileTransfersForItems:v25];
    v18[2](v18, v40, v41);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v24 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Request to load history with empty IDs and Services", buf, 2u);
      }
    }
    v18[2](v18, &__NSArray0__struct, &__NSArray0__struct);
  }
}

- (void)loadHistoryForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 limit:(int64_t)a6 beforeGUID:(id)a7 afterGUID:(id)a8 threadIdentifier:(id)a9 chatID:(id)a10 queryID:(id)a11
{
  unsigned int v32 = a4;
  id v33 = a3;
  id v15 = a5;
  id v34 = a7;
  id v35 = a8;
  id v16 = a9;
  id v17 = a10;
  id v18 = a11;
  v19 = +[IMDClientRequestContext currentContext];
  int v20 = [v19 replyProxy];

  v21 = +[IMDClientRequestContext currentContext];
  __int16 v22 = [v21 listenerID];

  if (IMOSLoggingEnabled())
  {
    id v23 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = +[IMDClientRequestContext currentContext];
      v25 = [v24 listenerID];
      *(_DWORD *)buf = 138414082;
      id v44 = v25;
      __int16 v45 = 2112;
      id v46 = v33;
      __int16 v47 = 2112;
      id v48 = v15;
      __int16 v49 = 1024;
      int v50 = a6;
      __int16 v51 = 2112;
      id v52 = v34;
      __int16 v53 = 2112;
      id v54 = v35;
      __int16 v55 = 2112;
      id v56 = v16;
      __int16 v57 = 2112;
      id v58 = v18;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Legacy request from %@ to load messages with chat ID: %@  service: %@  limit: %d  beforeGUID: %@ aferGUID: %@ threadIdentifier: %@ queryID: %@", buf, 0x4Eu);
    }
  }
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_10002CE70;
  v36[3] = &unk_100071E38;
  id v37 = v20;
  id v38 = v18;
  id v39 = v17;
  id v40 = v15;
  id v41 = v22;
  int64_t v42 = a6;
  id v26 = v22;
  id v27 = v15;
  id v28 = v17;
  id v29 = v18;
  id v30 = v20;
  [(IMDaemonChatMessageHistoryRequestHandler *)self loadHistoryForChatWithGUID:v28 chatIdentifiers:v33 style:v32 services:v27 limit:a6 beforeGUID:v34 afterGUID:v35 threadIdentifier:v16 reply:v36];
}

- (void)loadPagedHistoryAroundMessageWithGUID:(id)a3 chatGUID:(id)a4 chatIdentifiers:(id)a5 style:(unsigned __int8)a6 services:(id)a7 numberOfMessagesBefore:(int64_t)a8 numberOfMessagesAfter:(int64_t)a9 threadIdentifier:(id)a10 reply:(id)a11
{
  id v15 = a3;
  id v29 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a10;
  id v19 = a11;
  if (IMOSLoggingEnabled())
  {
    int v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = +[IMDClientRequestContext currentContext];
      __int16 v22 = [v21 listenerID];
      *(_DWORD *)buf = 138413570;
      unsigned int v32 = v22;
      __int16 v33 = 2112;
      id v34 = v16;
      __int16 v35 = 2112;
      id v36 = v15;
      __int16 v37 = 2112;
      id v38 = v17;
      __int16 v39 = 1024;
      int v40 = a8;
      __int16 v41 = 1024;
      int v42 = a9;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Request from %@ to load paged history with chat ID: %@  for messageGUID: %@ service: %@  numberOfMessagesBefore: %d numberOfMessagesAfter: %d", buf, 0x36u);
    }
  }
  if ([v16 count] && objc_msgSend(v17, "count"))
  {
    buf[0] = 1;
    unsigned __int8 v30 = 1;
    id v23 = +[IMDMessageStore sharedInstance];
    v24 = [v23 itemsWithHandles:v16 onServices:v17 messageGUID:v15 numberOfMessagesBefore:a8 numberOfMessagesAfter:a9 threadIdentifier:v18 hasMessagesBefore:buf hasMessagesAfter:&v30];

    v25 = +[IMDMessageStore sharedInstance];
    [v25 loadConsumedSessionPayloadsForItems:v24];

    id v26 = (void *)IMCreateSerializedItemsFromArray();
    id v27 = [(IMDaemonChatMessageHistoryRequestHandler *)self _serializedFileTransfersForItems:v24];
    (*((void (**)(id, void *, void *, void, void))v19 + 2))(v19, v26, v27, buf[0], v30);
  }
  else
  {
    (*((void (**)(id, void *, void *, void, void))v19 + 2))(v19, &__NSArray0__struct, &__NSArray0__struct, 0, 0);
  }
}

- (void)loadPagedHistoryForGUID:(id)a3 chatIdentifiers:(id)a4 style:(unsigned __int8)a5 onServices:(id)a6 numberOfMessagesBefore:(int64_t)a7 numberOfMessagesAfter:(int64_t)a8 threadIdentifier:(id)a9 chatID:(id)a10 queryID:(id)a11
{
  unsigned int v30 = a5;
  id v31 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a9;
  id v18 = a10;
  id v19 = a11;
  if (IMOSLoggingEnabled())
  {
    int v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = +[IMDClientRequestContext currentContext];
      __int16 v22 = [v21 listenerID];
      *(_DWORD *)buf = 138413570;
      int v40 = v22;
      __int16 v41 = 2112;
      id v42 = v15;
      __int16 v43 = 2112;
      id v44 = v31;
      __int16 v45 = 2112;
      id v46 = v16;
      __int16 v47 = 1024;
      int v48 = a7;
      __int16 v49 = 1024;
      int v50 = a8;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Legacy request from %@ to load paged history with chat ID: %@  for messageGUID: %@ service: %@  numberOfMessagesBefore: %d numberOfMessagesAfter: %d", buf, 0x36u);
    }
  }
  id v23 = +[IMDClientRequestContext currentContext];
  v24 = [v23 replyProxy];

  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10002D4D4;
  v32[3] = &unk_100071E60;
  id v33 = v24;
  id v34 = v19;
  id v35 = v18;
  id v36 = v16;
  int64_t v37 = a7;
  int64_t v38 = a8;
  id v25 = v16;
  id v26 = v18;
  id v27 = v19;
  id v28 = v24;
  [(IMDaemonChatMessageHistoryRequestHandler *)self loadPagedHistoryAroundMessageWithGUID:v31 chatGUID:v26 chatIdentifiers:v15 style:v30 services:v25 numberOfMessagesBefore:a7 numberOfMessagesAfter:a8 threadIdentifier:v17 reply:v32];
}

- (void)fetchMessageHistorySummaryForDateInterval:(id)a3 chatIdentifiers:(id)a4 chatStyle:(unsigned __int8)a5 services:(id)a6 reply:(id)a7
{
  uint64_t v9 = a5;
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  int v14 = (void (**)(id, void *))a7;
  if (IMOSLoggingEnabled())
  {
    id v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = +[IMDClientRequestContext currentContext];
      id v17 = [v16 listenerID];
      int v20 = 138413058;
      v21 = v17;
      __int16 v22 = 2112;
      id v23 = v12;
      __int16 v24 = 2112;
      id v25 = v13;
      __int16 v26 = 2112;
      id v27 = v11;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Request from %@ to fetch message history with chatIDs: %@ services: %@ dateInterval: %@", (uint8_t *)&v20, 0x2Au);
    }
  }
  id v18 = +[IMDMessageStore sharedInstance];
  id v19 = [v18 messageHistorySummaryForDateInterval:v11 chatIdentifiers:v12 chatStyle:v9 services:v13];
  v14[2](v14, v19);
}

- (void)fetchOldestMessageDateForChatIdentifiers:(id)a3 chatStyle:(unsigned __int8)a4 services:(id)a5 reply:(id)a6
{
  uint64_t v8 = a4;
  id v9 = a3;
  id v10 = a5;
  id v11 = (void (**)(id, void *))a6;
  if (IMOSLoggingEnabled())
  {
    id v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = +[IMDClientRequestContext currentContext];
      int v14 = [v13 listenerID];
      int v17 = 138412802;
      id v18 = v14;
      __int16 v19 = 2112;
      id v20 = v9;
      __int16 v21 = 2112;
      id v22 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Request from %@ to fetch oldest message date with chatIDs: %@ services: %@", (uint8_t *)&v17, 0x20u);
    }
  }
  id v15 = +[IMDMessageStore sharedInstance];
  id v16 = [v15 oldestMessageDateForChatIdentifiers:v9 chatStyle:v8 services:v10];
  v11[2](v11, v16);
}

- (void)loadAttachmentsForChatWithGUID:(id)a3 chatIdentifiers:(id)a4 style:(unsigned __int8)a5 services:(id)a6 reply:(id)a7
{
  int v9 = a5;
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  int v14 = (void (**)(id, void *))a7;
  if (IMOSLoggingEnabled())
  {
    id v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = +[IMDClientRequestContext currentContext];
      int v17 = [v16 listenerID];
      int v24 = 138412802;
      id v25 = v17;
      __int16 v26 = 2112;
      id v27 = v12;
      __int16 v28 = 2112;
      id v29 = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Request from %@ to load media attachment filenames with chat ID: %@  service: %@", (uint8_t *)&v24, 0x20u);
    }
  }
  if ([v12 count] && objc_msgSend(v13, "count"))
  {
    id v18 = +[IMDMessageStore sharedInstance];
    __int16 v19 = v18;
    if (v9 == 45) {
      [v18 attachmentsWithHandles:v12 onServices:v13];
    }
    else {
    __int16 v21 = [v18 attachmentsWithRoomNames:v12 onServices:v13];
    }

    if (IMOSLoggingEnabled())
    {
      id v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        unsigned int v23 = [v21 count];
        int v24 = 67109120;
        LODWORD(v25) = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "   Resulting attachments (%d)", (uint8_t *)&v24, 8u);
      }
    }
    v14[2](v14, v21);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        int v24 = 138412546;
        id v25 = v12;
        __int16 v26 = 2112;
        id v27 = v13;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, " No IDs: %@ or serviceNames: %@, empty results being returned", (uint8_t *)&v24, 0x16u);
      }
    }
    v14[2](v14, &__NSArray0__struct);
  }
}

- (void)loadAttachmentsForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 chatID:(id)a6 queryID:(id)a7
{
  uint64_t v9 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = a3;
  id v16 = +[IMDClientRequestContext currentContext];
  int v17 = [v16 replyProxy];

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10002DD9C;
  v22[3] = &unk_100071E88;
  id v23 = v17;
  id v24 = v14;
  id v25 = v13;
  id v26 = v12;
  id v18 = v12;
  id v19 = v13;
  id v20 = v14;
  id v21 = v17;
  [(IMDaemonChatMessageHistoryRequestHandler *)self loadAttachmentsForChatWithGUID:v19 chatIdentifiers:v15 style:v9 services:v18 reply:v22];
}

- (id)_serializedFileTransfersForItems:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v11 = +[IMDFileTransferCenter sharedInstance];
        id v12 = [v10 copyFileTransferDictionaryRepresentationsFromCenter:v11];

        [v4 addObjectsFromArray:v12];
      }
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  id v13 = [v4 copy];

  return v13;
}

- (void)deleteMessageWithGUIDs:(id)a3 queryID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = +[IMDClientRequestContext currentContext];
      uint64_t v9 = [v8 listenerID];
      *(_DWORD *)buf = 138412546;
      unsigned int v30 = v9;
      __int16 v31 = 2112;
      id v32 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Request from %@ to delete messages with guids: %@", buf, 0x16u);
    }
  }
  id v10 = +[IMDMessageStore sharedInstance];
  id v11 = [v5 firstObject];
  id v12 = [v10 chatForMessageGUID:v11];

  id v13 = [v12 serviceName];
  LODWORD(v11) = [v13 isEqualToString:IMServiceNameSMS];

  if (v11) {
    IMGreenTeaMessageDeleteLog();
  }
  id v14 = +[IMDMessageStore sharedInstance];
  long long v15 = [v14 deleteMessageGUIDs:v5];

  if (IMOSLoggingEnabled())
  {
    long long v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      unsigned int v30 = v15;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "   deleted messages: %@", buf, 0xCu);
    }
  }
  if ([v15 count])
  {
    long long v17 = [v12 serviceName];
    unsigned int v18 = [v17 isEqualToString:IMServiceNameSMS];

    id v19 = +[IMDAccountController sharedInstance];
    id v20 = v19;
    id v21 = &IMServiceNameiMessage;
    if (v18) {
      id v21 = &IMServiceNameSMS;
    }
    id v22 = [v19 anySessionForServiceName:*v21];

    CFStringRef v27 = @"message";
    id v28 = v5;
    id v23 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    id v24 = [v12 guid];
    [v22 sendDeleteCommand:v23 forChatGUID:v24];

    id v25 = +[IMDBroadcastController sharedProvider];
    id v26 = objc_msgSend(v25, "broadcasterForChatListenersUsingBlackholeRegistry:", objc_msgSend(v12, "isBlackholed"));
    [v26 historicalMessageGUIDsDeleted:v15 chatGUIDs:0 queryID:v6];
  }
}

- (void)clearHistoryForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 beforeGUID:(id)a6 afterGUID:(id)a7 chatID:(id)a8 queryID:(id)a9
{
  uint64_t v13 = a4;
  id v14 = a3;
  id v60 = a5;
  id v55 = a6;
  id v56 = a7;
  id v59 = a8;
  id v57 = a9;
  if (IMOSLoggingEnabled())
  {
    long long v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      long long v16 = +[IMDClientRequestContext currentContext];
      long long v17 = [v16 listenerID];
      *(_DWORD *)buf = 138412802;
      v78 = v17;
      __int16 v79 = 2112;
      id v80 = v14;
      __int16 v81 = 2112;
      id v82 = v60;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Request from %@ to delete messages with destination IDs: %@  service: %@", buf, 0x20u);
    }
  }
  if ([v14 count] && objc_msgSend(v60, "count"))
  {
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v18 = v60;
    id v19 = [v18 countByEnumeratingWithState:&v62 objects:v76 count:16];
    if (v19)
    {
      int v20 = 0;
      uint64_t v21 = *(void *)v63;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v63 != v21) {
            objc_enumerationMutation(v18);
          }
          v20 |= [*(id *)(*((void *)&v62 + 1) + 8 * i) isEqualToString:IMServiceNameSMS];
        }
        id v19 = [v18 countByEnumeratingWithState:&v62 objects:v76 count:16];
      }
      while (v19);

      if (v20) {
        IMGreenTeaMessageDeleteLog();
      }
    }
    else
    {
    }
    id v23 = +[IMDChatRegistry sharedInstance];
    id v58 = [v23 existingChatWithGUID:v59];

    if (v58)
    {
      id v24 = +[IMDAccountController sharedInstance];
      id v25 = [v58 serviceName];
      id v26 = [v24 anySessionForServiceName:v25];

      [v26 willRemoveChat:v58];
    }
    CFStringRef v27 = +[IMDMessageStore sharedInstance];
    __int16 v53 = [v27 deleteMessagesWithChatIdentifiers:v14 style:v13 onServices:v18];

    if (IMOSLoggingEnabled())
    {
      id v28 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v78 = v53;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "   deleted messages: %@", buf, 0xCu);
      }
    }
    if (objc_msgSend(v53, "count", v53, v55, v56))
    {
      id v61 = objc_alloc_init((Class)NSMutableArray);
      id v29 = objc_alloc_init((Class)NSMutableArray);
      id v30 = objc_alloc_init((Class)NSMutableArray);
      if ([v14 count])
      {
        unint64_t v31 = 0;
        do
        {
          id v32 = [v18 objectAtIndex:v31];
          id v33 = [v14 objectAtIndex:v31];
          id v34 = (void *)IMCopyGUIDForChat();

          if ([v34 length]
            && (unsigned __int8 v35 = [v32 isEqualToString:IMServiceNameSMS], v36 = v61,
                                                                                                (v35 & 1) != 0)
            || (id v37 = [v34 length], v36 = v29, v37))
          {
            [v36 addObject:v34];
            [v30 addObject:v34];
          }

          ++v31;
        }
        while (v31 < (unint64_t)[v14 count]);
      }
      if (v58)
      {
        if ([v29 count])
        {
          int64_t v38 = +[IMDAccountController sharedInstance];
          __int16 v39 = [v38 anySessionForServiceName:IMServiceNameiMessage];

          CFStringRef v74 = @"chat-clear";
          v71[1] = @"groupID";
          v72[0] = v29;
          v71[0] = @"guids";
          int v40 = [v58 groupID];
          v72[1] = v40;
          __int16 v41 = +[NSDictionary dictionaryWithObjects:v72 forKeys:v71 count:2];
          v73 = v41;
          id v42 = +[NSArray arrayWithObjects:&v73 count:1];
          v75 = v42;
          __int16 v43 = +[NSDictionary dictionaryWithObjects:&v75 forKeys:&v74 count:1];
          [v39 sendDeleteCommand:v43 forChatGUID:v59];
        }
        if ([v61 count])
        {
          id v44 = +[IMDAccountController sharedInstance];
          __int16 v45 = [v44 anySessionForServiceName:IMServiceNameSMS];

          CFStringRef v69 = @"chat-clear";
          v67[0] = v61;
          v66[0] = @"guids";
          v66[1] = @"groupID";
          id v46 = [v58 groupID];
          v67[1] = v46;
          v66[2] = @"ptcpts";
          __int16 v47 = [v58 participantHandles];
          v67[2] = v47;
          int v48 = +[NSDictionary dictionaryWithObjects:v67 forKeys:v66 count:3];
          v68 = v48;
          __int16 v49 = +[NSArray arrayWithObjects:&v68 count:1];
          v70 = v49;
          int v50 = +[NSDictionary dictionaryWithObjects:&v70 forKeys:&v69 count:1];
          [v45 sendDeleteCommand:v50 forChatGUID:v59];
        }
      }
      __int16 v51 = +[IMDBroadcastController sharedProvider];
      id v52 = objc_msgSend(v51, "broadcasterForChatListenersUsingBlackholeRegistry:", objc_msgSend(v58, "isBlackholed"));
      [v52 historicalMessageGUIDsDeleted:v54 chatGUIDs:v30 queryID:v57];
    }
  }
}

- (void)markChatAsSpamWithGUID:(id)a3 chatIdentifiers:(id)a4 style:(unsigned __int8)a5 services:(id)a6 isAutoReport:(BOOL)a7 isJunkReportedToCarrier:(BOOL)a8 reportReason:(unint64_t)a9 reply:(id)a10
{
  BOOL v11 = a7;
  uint64_t v13 = a5;
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = (void (**)(id, id))a10;
  if (IMOSLoggingEnabled())
  {
    id v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      int v20 = +[IMDClientRequestContext currentContext];
      uint64_t v21 = [v20 listenerID];
      CFStringRef v22 = @"NO";
      *(_DWORD *)buf = 138413314;
      CFStringRef v27 = v21;
      if (v11) {
        CFStringRef v22 = @"YES";
      }
      __int16 v28 = 2112;
      id v29 = v16;
      __int16 v30 = 2112;
      id v31 = v17;
      __int16 v32 = 2112;
      CFStringRef v33 = v22;
      __int16 v34 = 2112;
      id v35 = v15;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Request from %@ to mark IDs as spam: %@  service: %@ autoReport %@ chatGUID %@", buf, 0x34u);
    }
  }
  id v23 = +[IMDChatRegistry sharedInstance];
  LOBYTE(v25) = a8;
  id v24 = [v23 markAsSpamForIDs:v16 style:v13 onServices:v17 chatID:v15 queryID:0 autoReport:v11 isJunkReportedToCarrier:v25 reportReason:a9];

  v18[2](v18, v24);
}

- (void)markChatAsSpamWithGUID:(id)a3 chatIdentifiers:(id)a4 style:(unsigned __int8)a5 services:(id)a6 isAutoReport:(BOOL)a7 isJunkReportedToCarrier:(BOOL)a8 reply:(id)a9
{
}

- (void)markAsSpamForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 chatID:(id)a6 queryID:(id)a7 autoReport:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v11 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a3;
  id v18 = +[IMDClientRequestContext currentContext];
  id v19 = [v18 replyProxy];

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10002ECF4;
  v24[3] = &unk_100071EB0;
  BOOL v29 = v8;
  id v25 = v16;
  id v26 = v19;
  id v27 = v15;
  id v28 = v14;
  id v20 = v14;
  id v21 = v15;
  id v22 = v19;
  id v23 = v16;
  [(IMDaemonChatMessageHistoryRequestHandler *)self markChatAsSpamWithGUID:v21 chatIdentifiers:v17 style:v11 services:v20 isAutoReport:v8 isJunkReportedToCarrier:0 reportReason:0 reply:v24];
}

- (void)retractNotificationsForReadMessagesWithGUIDs:(id)a3
{
}

- (void)cleanupAttachments
{
  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      id v3 = +[IMDClientRequestContext currentContext];
      id v4 = [v3 listenerID];
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Request from %@ to clean up attachments", (uint8_t *)&v6, 0xCu);
    }
  }
  id v5 = +[IMDMessageStore sharedInstance];
  [v5 cleanseAttachments];
}

- (void)loadFrequentRepliesForChatWithGUID:(id)a3 chatIdentifiers:(id)a4 style:(unsigned __int8)a5 services:(id)a6 limit:(int64_t)a7 reply:(id)a8
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = (void (**)(id, void *))a8;
  if (IMOSLoggingEnabled())
  {
    id v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = +[IMDClientRequestContext currentContext];
      id v18 = [v17 listenerID];
      int v24 = 138413058;
      *(void *)id v25 = v18;
      *(_WORD *)&v25[8] = 2112;
      *(void *)&v25[10] = v13;
      __int16 v26 = 2112;
      id v27 = v14;
      __int16 v28 = 1024;
      int v29 = a7;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Request from %@ to find frequent replies with chat ID: %@  service: %@  limit: %d", (uint8_t *)&v24, 0x26u);
    }
  }
  if ([v13 count] && objc_msgSend(v14, "count"))
  {
    id v19 = +[IMDMessageStore sharedInstance];
    id v20 = [v19 frequentRepliesForForChatIdentifiers:v13 onServices:v14 limit:a7];

    if (IMOSLoggingEnabled())
    {
      id v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        unsigned int v22 = [v20 count];
        int v24 = 67109378;
        *(_DWORD *)id v25 = v22;
        *(_WORD *)&v25[4] = 2112;
        *(void *)&v25[6] = v20;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "   Resulting frequent replies (%d): %@", (uint8_t *)&v24, 0x12u);
      }
    }
    if (v20) {
      id v23 = v20;
    }
    else {
      id v23 = &__NSArray0__struct;
    }
    v15[2](v15, v23);
  }
}

- (void)loadFrequentRepliesForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 limit:(int64_t)a6 chatID:(id)a7 queryID:(id)a8
{
  uint64_t v11 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = a8;
  id v17 = a3;
  id v18 = +[IMDClientRequestContext currentContext];
  id v19 = [v18 replyProxy];

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10002F294;
  v24[3] = &unk_100071ED8;
  id v25 = v19;
  id v26 = v16;
  id v27 = v15;
  id v28 = v14;
  int64_t v29 = a6;
  id v20 = v14;
  id v21 = v15;
  id v22 = v16;
  id v23 = v19;
  [(IMDaemonChatMessageHistoryRequestHandler *)self loadFrequentRepliesForChatWithGUID:v21 chatIdentifiers:v17 style:v11 services:v20 limit:a6 reply:v24];
}

- (void)loadUnreadHistoryForChatWithGUID:(id)a3 chatIdentifiers:(id)a4 style:(unsigned __int8)a5 services:(id)a6 limit:(int64_t)a7 fallbackMessageGUID:(id)a8 reply:(id)a9
{
  int v12 = a5;
  id v33 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a8;
  id v18 = (void (**)(id, void *, void *))a9;
  if (IMOSLoggingEnabled())
  {
    id v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      id v20 = +[IMDClientRequestContext currentContext];
      id v21 = [v20 listenerID];
      *(_DWORD *)buf = 138413058;
      id v35 = v21;
      __int16 v36 = 2112;
      id v37 = v15;
      __int16 v38 = 2112;
      id v39 = v16;
      __int16 v40 = 1024;
      int v41 = a7;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Request from %@ to load latest unread messages with chat ID: %@  services: %@  limit: %d", buf, 0x26u);
    }
  }
  if ([v15 count] && objc_msgSend(v16, "count"))
  {
    BOOL v22 = v12 == 45;
    id v23 = +[IMDMessageStore sharedInstance];
    int v24 = v23;
    if (v22) {
      [v23 unreadMessagesWithHandles:v15 onServices:v16 limit:a7 fallbackGUID:v17];
    }
    else {
    id v25 = [v23 unreadMessagesWithRoomNames:v15 onServices:v16 limit:a7 fallbackGUID:v17];
    }
    id v26 = [v25 mutableCopy];

    if (IMOSLoggingEnabled())
    {
      id v27 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        unsigned int v28 = [v26 count];
        *(_DWORD *)buf = 67109120;
        LODWORD(v35) = v28;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "  Unread query Resulting messages (%d)", buf, 8u);
      }
    }
    [(IMDaemonChatMessageHistoryRequestHandler *)self _populateParentMessagesIfNeeded:v26];
    if (IMOSLoggingEnabled())
    {
      int64_t v29 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        unsigned int v30 = [v26 count];
        *(_DWORD *)buf = 67109120;
        LODWORD(v35) = v30;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "   Resulting messages (%d)", buf, 8u);
      }
    }
    id v31 = (void *)IMCreateSerializedItemsFromArray();
    __int16 v32 = [(IMDaemonChatMessageHistoryRequestHandler *)self _serializedFileTransfersForItems:v26];
    v18[2](v18, v31, v32);
  }
  else
  {
    v18[2](v18, &__NSArray0__struct, &__NSArray0__struct);
  }
}

- (void)loadUnreadForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 limit:(int64_t)a6 fallbackGUID:(id)a7 chatId:(id)a8 queryID:(id)a9
{
  unsigned int v25 = a4;
  id v14 = a5;
  id v15 = a8;
  id v16 = a9;
  id v17 = a7;
  id v18 = a3;
  id v19 = +[IMDClientRequestContext currentContext];
  id v20 = [v19 replyProxy];

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10002F7B0;
  v26[3] = &unk_100071F00;
  id v27 = v20;
  id v28 = v16;
  id v29 = v15;
  id v30 = v14;
  int64_t v31 = a6;
  id v21 = v14;
  id v22 = v15;
  id v23 = v16;
  id v24 = v20;
  [(IMDaemonChatMessageHistoryRequestHandler *)self loadUnreadHistoryForChatWithGUID:v22 chatIdentifiers:v18 style:v25 services:v21 limit:a6 fallbackMessageGUID:v17 reply:v26];
}

- (void)_populateParentMessagesIfNeeded:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(v3, "__imArrayByApplyingBlock:", &stru_100071F40);
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v43 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "allUnreadGUIDs %@", buf, 0xCu);
    }
  }
  int v6 = objc_msgSend(v3, "__imArrayByFilteringWithBlock:", &stru_100071F80);
  if ([v6 count] && IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      BOOL v8 = [v6 arrayByApplyingSelector:"guid"];
      *(_DWORD *)buf = 138412290;
      id v43 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Resulting ack or ack sticker guids %@", buf, 0xCu);
    }
  }
  id v9 = objc_alloc_init((Class)NSMutableSet);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v10 = v6;
  id v11 = [v10 countByEnumeratingWithState:&v37 objects:v46 count:16];
  if (v11)
  {
    uint64_t v13 = *(void *)v38;
    *(void *)&long long v12 = 138412546;
    long long v32 = v12;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v38 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        id v16 = objc_msgSend(v15, "associatedMessageGUID", v32);
        id v17 = IMAssociatedMessageDecodeGUID();

        if (v17)
        {
          unsigned int v18 = [v4 containsObject:v17];
          int v19 = IMOSLoggingEnabled();
          if (v18)
          {
            if (!v19) {
              goto LABEL_30;
            }
            id v20 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              id v21 = [v15 guid];
              *(_DWORD *)buf = v32;
              id v43 = v17;
              __int16 v44 = 2112;
              __int16 v45 = v21;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "associateMessageGUID %@ for message guid %@ is already in unread list. Not adding again", buf, 0x16u);
            }
            goto LABEL_20;
          }
          if (v19)
          {
            id v23 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v43 = v17;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Adding associateMessageGUID %@", buf, 0xCu);
            }
          }
          [v9 addObject:v17];
        }
        else if (IMOSLoggingEnabled())
        {
          id v20 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            id v22 = [v15 associatedMessageGUID];
            *(_DWORD *)buf = 138412290;
            id v43 = v22;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "History [item associatedMessageGUID] is nil %@ ", buf, 0xCu);
          }
LABEL_20:
        }
LABEL_30:
      }
      id v11 = [v10 countByEnumeratingWithState:&v37 objects:v46 count:16];
    }
    while (v11);
  }

  if (IMOSLoggingEnabled())
  {
    id v24 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v43 = v9;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Parent GUID set %@", buf, 0xCu);
    }
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v25 = v9;
  id v26 = [v25 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v26)
  {
    uint64_t v27 = *(void *)v34;
    do
    {
      for (j = 0; j != v26; j = (char *)j + 1)
      {
        if (*(void *)v34 != v27) {
          objc_enumerationMutation(v25);
        }
        uint64_t v29 = *(void *)(*((void *)&v33 + 1) + 8 * (void)j);
        id v30 = +[IMDMessageStore sharedInstance];
        int64_t v31 = [v30 messageWithGUID:v29];

        if (v31) {
          [v3 insertObject:v31 atIndex:0];
        }
      }
      id v26 = [v25 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v26);
  }
}

- (void)loadUncachedAttachmentCountForChatWithGUID:(id)a3 chatIdentifiers:(id)a4 style:(unsigned __int8)a5 services:(id)a6 reply:(id)a7
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = (void (**)(id, void))a7;
  if (IMOSLoggingEnabled())
  {
    id v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = +[IMDClientRequestContext currentContext];
      id v16 = [v15 listenerID];
      int v22 = 138412802;
      id v23 = v16;
      __int16 v24 = 2112;
      id v25 = v11;
      __int16 v26 = 2112;
      id v27 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Request from %@ to load uncached media attachment count with chat ID: %@  service: %@", (uint8_t *)&v22, 0x20u);
    }
  }
  if (![v11 count] || !objc_msgSend(v12, "count"))
  {
    if (IMOSLoggingEnabled())
    {
      id v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        int v22 = 138412546;
        id v23 = v11;
        __int16 v24 = 2112;
        id v25 = v12;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, " No IDs: %@ or serviceNames: %@, empty results being returned", (uint8_t *)&v22, 0x16u);
      }
    }
    goto LABEL_18;
  }
  id v17 = +[IMDCKUtilities sharedInstance];
  unsigned int v18 = [v17 cloudKitSyncingEnabled];

  if (!v18)
  {
    if (IMOSLoggingEnabled())
    {
      id v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        LOWORD(v22) = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, " Service does not support a database OR MIC disabled, empty results being returned", (uint8_t *)&v22, 2u);
      }
    }
LABEL_18:
    v13[2](v13, 0);
    goto LABEL_19;
  }
  int v19 = +[IMDCKAttachmentSyncController sharedInstance];
  ((void (**)(id, id))v13)[2](v13, [v19 purgedAttachmentsCountForChatsWithChatIdentifiers:v11 services:v12]);

LABEL_19:
}

- (void)loadUncachedAttachmentCountForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 chatID:(id)a6 queryID:(id)a7
{
  uint64_t v9 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = a3;
  id v16 = +[IMDClientRequestContext currentContext];
  id v17 = [v16 replyProxy];

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10003020C;
  v22[3] = &unk_100071FA8;
  id v23 = v17;
  id v24 = v14;
  id v25 = v13;
  id v26 = v12;
  id v18 = v12;
  id v19 = v13;
  id v20 = v14;
  id v21 = v17;
  [(IMDaemonChatMessageHistoryRequestHandler *)self loadUncachedAttachmentCountForChatWithGUID:v19 chatIdentifiers:v15 style:v9 services:v18 reply:v22];
}

- (void)purgeAttachmentsForChatGUID:(id)a3
{
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Purging attachments for chat: %@", (uint8_t *)&v5, 0xCu);
    }
  }
  IMDChatRecordPurgeAttachments();
}

- (void)updateUnformattedID:(id)a3 forBuddyID:(id)a4 onService:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (([v8 hasPrefix:@"+"] & 1) != 0
    || [v8 hasPrefix:@"P:"])
  {
    if (IMOSLoggingEnabled())
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v13 = 138412802;
        id v14 = v7;
        __int16 v15 = 2112;
        id v16 = v8;
        __int16 v17 = 2112;
        id v18 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Ignoring request from client to update unformatted ID %@->%@  on service: %@", (uint8_t *)&v13, 0x20u);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v13 = 138412802;
        id v14 = v7;
        __int16 v15 = 2112;
        id v16 = v8;
        __int16 v17 = 2112;
        id v18 = v9;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Request from client to update unformatted ID %@->%@  on service: %@", (uint8_t *)&v13, 0x20u);
      }
    }
    id v12 = +[IMDMessageStore sharedInstance];
    [v12 updateUnformattedID:v7 forBuddyID:v8 onService:v9];
  }
}

- (void)moveMessagesWithGUIDsToRecentlyDeleted:(id)a3 deleteDate:(id)a4 queryID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v32 = a5;
  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v38 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Recently Deleted | Will move messages to recently deleted: %@", buf, 0xCu);
    }
  }
  id v11 = +[IMDMessageStore sharedInstance];
  id v12 = [v8 firstObject];
  int v13 = [v11 chatForMessageGUID:v12];

  if (+[IMGenerativeModelsAvailabilityProvider messageSummarizationEnabled])
  {
    uint64_t v35 = IMChatPropertyChatSummaryDictionary;
    id v14 = +[NSNull null];
    long long v36 = v14;
    __int16 v15 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    [v13 updateProperties:v15];
  }
  id v16 = +[IMDChatRegistry sharedInstance];
  [v16 moveMessagesWithGUIDsToRecentlyDeleted:v8 deleteDate:v9];

  __int16 v17 = +[IMDMessageStore sharedInstance];
  [v17 updateStamp];

  id v18 = +[IMINInteractionUtilities sharedInstance];
  [v18 deleteInteractionsWithMessageGUIDs:v8];

  [(IMDaemonChatMessageHistoryRequestHandler *)self _updateLastMessageTimeStampForChat:v13];
  id v19 = [v13 serviceName];
  unsigned int v20 = [v19 isEqualToString:IMServiceNameSMS];
  id v21 = (id *)&IMServiceNameiMessage;
  if (v20) {
    id v21 = (id *)&IMServiceNameSMS;
  }
  id v22 = *v21;

  id v23 = +[IMDAccountController sharedInstance];
  id v24 = [v23 anySessionForServiceName:v22];

  v33[0] = IMDDeleteCommandMessageGUIDArrayKey;
  v33[1] = IMDDeleteCommandIsPermanentDeleteKey;
  v34[0] = v8;
  v34[1] = &__kCFBooleanFalse;
  v33[2] = IMDDeleteCommandRecoverableDeleteDateKey;
  v34[2] = v9;
  id v25 = +[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:3];
  id v26 = [v13 guid];
  [v24 sendDeleteCommand:v25 forChatGUID:v26];

  id v27 = +[IMDClientRequestContext currentContext];
  id v28 = [v27 replyProxy];

  [v28 movedMessagesToRecentlyDeletedWithQueryID:v32];
  uint64_t v29 = +[IMDMessageStore sharedInstance];
  [v29 retractPostedNotificationsForMessageGUIDs:v8];

  id v30 = +[IMDChatRegistry sharedInstance];
  [v30 updateStateForChat:v13 hintMessage:0 shouldRebuildFailedMessageDate:1 shouldCalculateUnreadCount:1];

  if (IMOSLoggingEnabled())
  {
    int64_t v31 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v38 = v8;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Recently Deleted | Finished moving messages to recently deleted: %@", buf, 0xCu);
    }
  }
}

- (void)moveMessagesInChatsWithGUIDsToRecentlyDeleted:(id)a3 deleteDate:(id)a4 queryID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (IMOSLoggingEnabled())
  {
    id v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v35 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Recently Deleted | Will move messages to recently deleted for chatGUIDs: %@", buf, 0xCu);
    }
  }
  id v12 = +[IMDChatRegistry sharedInstance];
  [v12 moveMessagesInChatsWithGUIDsToRecentlyDeleted:v8 deleteDate:v9];

  int v13 = +[IMDMessageStore sharedInstance];
  [v13 updateStamp];

  id v14 = +[IMINInteractionUtilities sharedInstance];
  [v14 deleteInteractionsWithChatGUIDs:v8];

  __int16 v15 = +[IMDAccountController sharedInstance];
  id v16 = [v15 anySessionForServiceName:IMServiceNameSMS];

  __int16 v17 = +[IMDAccountController sharedInstance];
  id v18 = [v17 anySessionForServiceName:IMServiceNameiMessage];

  id v26 = _NSConcreteStackBlock;
  uint64_t v27 = 3221225472;
  id v28 = sub_100030C8C;
  uint64_t v29 = &unk_100071FD0;
  id v30 = self;
  id v19 = v16;
  id v31 = v19;
  id v20 = v18;
  id v32 = v20;
  id v21 = v9;
  id v33 = v21;
  [v8 enumerateObjectsUsingBlock:&v26];
  id v22 = +[IMDBroadcastController sharedProvider];
  id v23 = [v22 broadcasterForChatListeners];

  [v23 movedMessagesToRecentlyDeletedForChatsWithGUIDs:v8 queryID:v10 deletionDate:v21];
  id v24 = +[IMDMessageStore sharedInstance];
  [v24 retractPostedNotificationsForMessagesMatchingChatGUIDs:v8];

  if (IMOSLoggingEnabled())
  {
    id v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v35 = v8;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Recently Deleted | Finished moving messages to recently deleted for chatGUIDs: %@", buf, 0xCu);
    }
  }
}

- (void)recoverMessagesWithChatGUIDs:(id)a3 queryID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Recently Deleted | Will recover messages for chatGUIDs: %@", buf, 0xCu);
    }
  }
  id v9 = +[IMDChatRegistry sharedInstance];
  [v9 recoverMessagesWithChatGUIDs:v6];

  id v10 = +[IMDMessageStore sharedInstance];
  [v10 updateStamp];

  id v11 = +[IMDAccountController sharedInstance];
  id v12 = [v11 anySessionForServiceName:IMServiceNameSMS];

  int v13 = +[IMDAccountController sharedInstance];
  id v14 = [v13 anySessionForServiceName:IMServiceNameiMessage];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000314CC;
  v20[3] = &unk_100071FF8;
  v20[4] = self;
  id v15 = v12;
  id v21 = v15;
  id v16 = v14;
  id v22 = v16;
  [v6 enumerateObjectsUsingBlock:v20];
  __int16 v17 = +[IMDBroadcastController sharedProvider];
  id v18 = [v17 broadcasterForChatListeners];

  [v18 recoveredMessagesWithChatGUIDs:v6 queryID:v7];
  if (IMOSLoggingEnabled())
  {
    id v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v6;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Recently Deleted | Finished recovering messages for chatGUIDs: %@", buf, 0xCu);
    }
  }
}

- (void)permanentlyDeleteRecoverableMessagesInChatsWithGUIDs:(id)a3 queryID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Recently Deleted | Will permanently delete recently deleted messages for chatGUIDS: %@", buf, 0xCu);
    }
  }
  [v5 enumerateObjectsUsingBlock:&stru_100072038];
  id v8 = +[IMDChatRegistry sharedInstance];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100031CD0;
  v10[3] = &unk_100071788;
  id v11 = v6;
  id v9 = v6;
  [v8 permanentlyDeleteRecoverableMessagesInChatsWithGUIDs:v5 completionHandler:v10];
}

- (void)_updateLastMessageTimeStampForChat:(id)a3
{
  id v3 = a3;
  id v4 = +[IMDMessageStore sharedInstance];
  id v5 = objc_msgSend(v4, "lastMessageForChatWithRowID:", objc_msgSend(v3, "rowID"));
  [v3 setLastMessage:v5];

  id v6 = [v3 lastMessage];

  if (v6)
  {
    id v7 = [v3 lastMessage];
    id v8 = [v7 time];
    [v8 timeIntervalSinceReferenceDate];
    [v3 setLastMessageTimeStampOnLoad:(uint64_t)v9];
  }
  else
  {
    [v3 setLastMessageTimeStampOnLoad:0];
  }
  id v10 = +[IMFeatureFlags sharedFeatureFlags];
  unsigned int v11 = [v10 isAVLessSharePlayEnabled];

  if (v11)
  {
    id v12 = +[IMDMessageStore sharedInstance];
    id v13 = [v12 lastTUConversationItemForChat:v3];

    if (v13)
    {
      id v14 = [v13 time];

      if (v14)
      {
        id v15 = [v13 time];
        [v3 setLastTUConversationCreatedDate:v15];
      }
      else
      {
        id v16 = IMLogHandleForCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_10004CDB8((uint64_t)v13, v16);
        }
      }
    }
    else
    {
      [v3 setLastTUConversationCreatedDate:0];
    }
  }
  if (IMOSLoggingEnabled())
  {
    __int16 v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = [v3 guid];
      id v19 = [v3 lastMessage];
      id v20 = [v19 time];
      [v20 timeIntervalSinceReferenceDate];
      id v21 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      id v22 = [v3 lastTUConversationCreatedDate];
      id v23 = [v3 lastScheduledMessageCreatedDate];
      int v27 = 138413058;
      id v28 = v18;
      __int16 v29 = 2112;
      id v30 = v21;
      __int16 v31 = 2112;
      id v32 = v22;
      __int16 v33 = 2112;
      long long v34 = v23;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Recently Deleted | IMChat: %@, updating last message timestamp on load: %@ lastTUConversationCreatedDate %@ lastScheduledMessageCreatedDate: %@", (uint8_t *)&v27, 0x2Au);
    }
  }
  id v24 = +[IMDBroadcastController sharedProvider];
  id v25 = [v24 broadcasterForChatListeners];

  id v26 = [v3 guid];
  objc_msgSend(v25, "chat:lastMessageTimeStampOnLoadUpdated:", v26, (double)(uint64_t)objc_msgSend(v3, "lastMessageTimeStampOnLoad"));
}

- (void)loadItemWithGUID:(id)a3 queryID:(id)a4
{
}

- (void)fetchEarliestMessageDateForChatsWithGUIDs:(id)a3 completion:(id)a4
{
  id v5 = _Block_copy(a4);
  uint64_t v6 = sub_10004D250();
  _Block_copy(v5);
  id v7 = self;
  sub_10004AC14(v6, (uint64_t)v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)upgradeCompleteMyMomentLinkToStackWithMessageGUID:(id)a3 chatGUID:(id)a4
{
}

- (void)updatePluginMessageWithGUID:(id)a3 newPayloadData:(id)a4 completion:(id)a5
{
  id v7 = _Block_copy(a5);
  uint64_t v8 = sub_10004D210();
  id v10 = v9;
  id v11 = a4;
  id v12 = self;
  uint64_t v13 = sub_10004CEB0();
  unint64_t v15 = v14;

  _Block_copy(v7);
  sub_10004B28C(v8, v10, v13, v15, v7);
  _Block_release(v7);
  _Block_release(v7);
  sub_10004C9A8(v13, v15);

  swift_bridgeObjectRelease();
}

- (void)updateChatsUsingMessageGUIDsAndSummaries:(id)a3
{
  sub_100039670(0, &qword_10007D1B0);
  sub_10004D1E0();
  id v4 = self;
  id v5 = self;
  id v6 = [v4 sharedInstance];
  Class isa = sub_10004D1C0().super.isa;
  [v6 updateChatsUsingMessageGUIDsAndSummaries:isa];

  swift_bridgeObjectRelease();
}

- (void)fetchIncomingPendingMessagesOverSatelliteForChatsWithIDs:(id)a3 services:(id)a4
{
  id v5 = (void *)sub_10004D250();
  uint64_t v6 = sub_10004D250();
  id v7 = self;
  _sSo40IMDaemonChatMessageHistoryRequestHandlerC7imagentE49fetchIncomingPendingMessagesOverSatelliteForChats7withIDs8servicesySaySSG_AGtF_0(v5, v6);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end
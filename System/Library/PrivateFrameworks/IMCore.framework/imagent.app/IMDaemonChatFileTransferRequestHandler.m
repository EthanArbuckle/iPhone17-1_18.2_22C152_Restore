@interface IMDaemonChatFileTransferRequestHandler
- (void)loadIsDownloadingPurgedAttachmentsForChatWithGUID:(id)a3 chatIdentifiers:(id)a4 style:(unsigned __int8)a5 services:(id)a6 reply:(id)a7;
- (void)loadIsDownloadingPurgedAttachmentsForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 chatID:(id)a6 queryID:(id)a7;
@end

@implementation IMDaemonChatFileTransferRequestHandler

- (void)loadIsDownloadingPurgedAttachmentsForChatWithGUID:(id)a3 chatIdentifiers:(id)a4 style:(unsigned __int8)a5 services:(id)a6 reply:(id)a7
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = (void (**)(id, void))a7;
  if (IMOSLoggingEnabled())
  {
    v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = +[IMDClientRequestContext currentContext];
      v16 = [v15 listenerID];
      int v22 = 138412802;
      id v23 = v16;
      __int16 v24 = 2112;
      id v25 = v11;
      __int16 v26 = 2112;
      id v27 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Request from %@ to check if downloading purged assets with chat ID: %@  service: %@", (uint8_t *)&v22, 0x20u);
    }
  }
  if (![v11 count] || !objc_msgSend(v12, "count"))
  {
    if (IMOSLoggingEnabled())
    {
      v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        int v22 = 138412546;
        id v23 = v11;
        __int16 v24 = 2112;
        id v25 = v12;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, " No IDs: %@ or serviceNames: %@, empty results being returned", (uint8_t *)&v22, 0x16u);
      }
    }
    v13[2](v13, 0);
  }
  v18 = +[IMDChatUtilities _stringForChatIDs:v11 onServices:v12];
  if (v18)
  {
    v19 = +[IMDChatUtilities sharedUtilities];
    v20 = [v19 currentlyDownloadingSet];
    id v21 = [v20 containsObject:v18];
  }
  else
  {
    id v21 = 0;
  }
  ((void (**)(id, id))v13)[2](v13, v21);
}

- (void)loadIsDownloadingPurgedAttachmentsForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 chatID:(id)a6 queryID:(id)a7
{
  uint64_t v9 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = a3;
  v16 = +[IMDClientRequestContext currentContext];
  v17 = [v16 replyProxy];

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100021F10;
  v22[3] = &unk_1000719B0;
  id v23 = v17;
  id v24 = v14;
  id v25 = v13;
  id v26 = v12;
  id v18 = v12;
  id v19 = v13;
  id v20 = v14;
  id v21 = v17;
  [(IMDaemonChatFileTransferRequestHandler *)self loadIsDownloadingPurgedAttachmentsForChatWithGUID:v19 chatIdentifiers:v15 style:v9 services:v18 reply:v22];
}

@end
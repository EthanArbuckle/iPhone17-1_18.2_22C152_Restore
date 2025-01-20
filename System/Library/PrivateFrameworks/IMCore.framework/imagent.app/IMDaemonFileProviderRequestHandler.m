@interface IMDaemonFileProviderRequestHandler
- (BOOL)isListeningForExplicitDownloadFileTransferNotifications;
- (id)_retrieveLocalFileURLForFileTransferWithGUID:(id)a3 options:(int64_t)a4 outTransfer:(id *)a5;
- (void)_handleExplicitDownloadCompletedNotification:(id)a3;
- (void)_setupFileTransferExplicitDownloadNotificationListenersIfNecessary;
- (void)downloadFileTransferWithLocalURL:(id)a3;
- (void)retrieveLocalFileURLForFileTransferWithGUID:(id)a3 options:(int64_t)a4;
- (void)retrieveLocalFileURLForFileTransferWithGUIDs:(id)a3 options:(int64_t)a4;
- (void)setListeningForExplicitDownloadFileTransferNotifications:(BOOL)a3;
@end

@implementation IMDaemonFileProviderRequestHandler

- (void)_setupFileTransferExplicitDownloadNotificationListenersIfNecessary
{
  if (!self->_listeningForExplicitDownloadFileTransferNotifications)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:self selector:"_handleExplicitDownloadCompletedNotification:" name:IMDFileTransferExplicitDownloadCompletedNotification object:0];

    self->_listeningForExplicitDownloadFileTransferNotifications = 1;
  }
}

- (void)retrieveLocalFileURLForFileTransferWithGUID:(id)a3 options:(int64_t)a4
{
  id v6 = a3;
  id v12 = 0;
  v7 = [(IMDaemonFileProviderRequestHandler *)self _retrieveLocalFileURLForFileTransferWithGUID:v6 options:a4 outTransfer:&v12];
  id v8 = v12;
  if ([v7 length] && v8)
  {
    v9 = +[IMDFileTransferCenter sharedInstance];
    v10 = [v8 localPath];
    [v9 _handleFileTransfer:v7 acceptedWithPath:v10 autoRename:1 overwrite:0 options:a4 postNotification:1];
  }
  if (IMOSLoggingEnabled())
  {
    v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[IMDaemonFileProviderRequestHandler retrieveLocalFileURLForFileTransferWithGUID:options:]";
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s Successfully started explicit download for local file url retrieval of transfer with GUID %@", buf, 0x16u);
    }
  }
}

- (id)_retrieveLocalFileURLForFileTransferWithGUID:(id)a3 options:(int64_t)a4 outTransfer:(id *)a5
{
  id v8 = a3;
  [(IMDaemonFileProviderRequestHandler *)self _setupFileTransferExplicitDownloadNotificationListenersIfNecessary];
  v9 = +[IMDFileTransferCenter sharedInstance];
  id v20 = 0;
  v10 = [v9 _retrieveLocalFileURLForFileTransferWithGUID:v8 options:a4 outTransfer:a5 outError:&v20];
  id v11 = v20;

  if (v11)
  {
    id v12 = +[IMDBroadcastController sharedProvider];
    v13 = [v12 broadcasterForFileProviderListeners];
    [v13 fileTransferExplicitDownloadFailed:v8 suggestedRetryGUID:v10 error:v11];

    id v14 = 0;
  }
  else
  {
    if (a5 && [*a5 existsAtLocalPath])
    {
      __int16 v15 = +[IMDBroadcastController sharedProvider];
      id v16 = [v15 broadcasterForFileProviderListeners];
      v17 = [*a5 localPath];
      v18 = [*a5 createAndPersistLivePhotoBundleIfNecessary];
      [v16 fileTransfer:v8 explicitDownloadSucceededWithPath:v17 livePhotoBundlePath:v18];
    }
    id v14 = v10;
  }

  return v14;
}

- (void)retrieveLocalFileURLForFileTransferWithGUIDs:(id)a3 options:(int64_t)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v20;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * (void)v11);
        id v18 = 0;
        v13 = [(IMDaemonFileProviderRequestHandler *)self _retrieveLocalFileURLForFileTransferWithGUID:v12 options:a4 outTransfer:&v18];
        id v14 = v18;
        if ([v13 length]) {
          BOOL v15 = v14 == 0;
        }
        else {
          BOOL v15 = 1;
        }
        if (!v15) {
          [v7 setObject:v14 forKeyedSubscript:v13];
        }

        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v9);
  }

  if ([v7 count])
  {
    id v16 = +[IMDFileTransferCenter sharedInstance];
    [v16 _handleFileTransfers:v7 autoRename:1 overwrite:0 options:a4 postNotification:1];

    if (IMOSLoggingEnabled())
    {
      v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v24 = "-[IMDaemonFileProviderRequestHandler retrieveLocalFileURLForFileTransferWithGUIDs:options:]";
        __int16 v25 = 2112;
        id v26 = v7;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s Successfully started explicit download for local file url retrieval of transfer with GUIDs %@", buf, 0x16u);
      }
    }
  }
}

- (void)_handleExplicitDownloadCompletedNotification:(id)a3
{
  id v3 = a3;
  v4 = [v3 userInfo];
  v5 = [v4 objectForKey:IMDFileTransferExplicitDownloadCompletedSuccessKey];

  if (!v5 && IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(v20) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Unable to determine if file transfer explicit download succeeded from notification. Assuming the explicit download failed.", (uint8_t *)&v20, 2u);
    }
  }
  unsigned int v7 = [v5 BOOLValue];
  id v8 = [v3 object];
  id v9 = [v8 guid];
  uint64_t v10 = [v3 userInfo];
  id v11 = v10;
  if (v7)
  {
    uint64_t v12 = [v10 objectForKey:IMDFileTransferExplicitDownloadCompletedFileURLKey];

    if (!v12 && IMOSLoggingEnabled())
    {
      v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        LOWORD(v20) = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "File transfer URL could not be derived from IMDFileTransferExplicitDownloadCompletedNotification.", (uint8_t *)&v20, 2u);
      }
    }
    id v14 = [v12 path];
    if (IMOSLoggingEnabled())
    {
      BOOL v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        int v20 = 138412546;
        long long v21 = v9;
        __int16 v22 = 2112;
        v23 = v14;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Explicit download succeeded for GUID %@, located at path %@", (uint8_t *)&v20, 0x16u);
      }
    }
    id v16 = +[IMDBroadcastController sharedProvider];
    v17 = [v16 broadcasterForFileProviderListeners];
    id v18 = [v8 createAndPersistLivePhotoBundleIfNecessary];
    [v17 fileTransfer:v9 explicitDownloadSucceededWithPath:v14 livePhotoBundlePath:v18];
  }
  else
  {
    uint64_t v12 = [v10 objectForKey:IMDFileTransferExplicitDownloadCompletedErrorKey];

    if (IMOSLoggingEnabled())
    {
      long long v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        int v20 = 138412546;
        long long v21 = v9;
        __int16 v22 = 2112;
        v23 = v12;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Explicit download failed for transfer with GUID %@. error: %@", (uint8_t *)&v20, 0x16u);
      }
    }
    id v14 = +[IMDBroadcastController sharedProvider];
    id v16 = [v14 broadcasterForFileProviderListeners];
    [v16 fileTransferExplicitDownloadFailed:v9 suggestedRetryGUID:0 error:v12];
  }
}

- (void)downloadFileTransferWithLocalURL:(id)a3
{
  id v24 = a3;
  v4 = [v24 absoluteString];
  __int16 v25 = +[NSPredicate predicateWithFormat:@"%K = %@", @"filename", v4];

  v5 = +[IMDAttachmentStore sharedInstance];
  id v6 = [v5 attachmentsFilteredUsingPredicate:v25 limit:1];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v27;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if ([v11 existsAtLocalPath])
        {
          if (IMOSLoggingEnabled())
          {
            long long v21 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              v31 = "-[IMDaemonFileProviderRequestHandler downloadFileTransferWithLocalURL:]";
              __int16 v32 = 2112;
              id v33 = v24;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "%s local file at path %@ already downloaded", buf, 0x16u);
            }
          }
          __int16 v22 = +[IMDBroadcastController sharedProvider];
          v23 = [v22 broadcasterForFileProviderListeners];
          [v23 fileTransferDownloadedSucceededWithLocalURL:v24];

          goto LABEL_21;
        }
        [(IMDaemonFileProviderRequestHandler *)self _setupFileTransferExplicitDownloadNotificationListenersIfNecessary];
        uint64_t v12 = +[IMDFileTransferCenter sharedInstance];
        v13 = [v11 guid];
        id v14 = [v12 transferForGUID:v13];
        BOOL v15 = v14 == 0;

        if (v15)
        {
          id v16 = [v11 guid];
          [v12 _addTransfer:v11 forGUID:v16 shouldNotify:0];
        }
        [v12 addHubbleRequestedTransfer:v11];
        v17 = [v11 guid];
        id v18 = [v11 localPath];
        [v12 _handleFileTransfer:v17 acceptedWithPath:v18 autoRename:1 overwrite:0 options:0 postNotification:1];

        if (IMOSLoggingEnabled())
        {
          long long v19 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            int v20 = [v11 guid];
            *(_DWORD *)buf = 136315394;
            v31 = "-[IMDaemonFileProviderRequestHandler downloadFileTransferWithLocalURL:]";
            __int16 v32 = 2112;
            id v33 = v20;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s Successfully started explicit download for local file url retrieval of transfer with GUID %@", buf, 0x16u);
          }
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v26 objects:v34 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_21:
}

- (BOOL)isListeningForExplicitDownloadFileTransferNotifications
{
  return self->_listeningForExplicitDownloadFileTransferNotifications;
}

- (void)setListeningForExplicitDownloadFileTransferNotifications:(BOOL)a3
{
  self->_listeningForExplicitDownloadFileTransferNotifications = a3;
}

@end
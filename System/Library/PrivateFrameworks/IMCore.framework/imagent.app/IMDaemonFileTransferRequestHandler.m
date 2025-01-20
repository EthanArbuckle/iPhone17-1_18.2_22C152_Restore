@interface IMDaemonFileTransferRequestHandler
- (void)createItemForPHAssetWithUUID:(id)a3 parentChatItemGUID:(id)a4 chatGUID:(id)a5;
- (void)deleteFileTransferWithGUID:(id)a3;
- (void)downloadHighQualityVariantOfFileTransferWithGUID:(id)a3;
- (void)failTransferPreviewGeneration:(id)a3;
- (void)fileTransfer:(id)a3 acceptedWithPath:(id)a4 autoRename:(BOOL)a5 overwrite:(BOOL)a6 options:(int64_t)a7;
- (void)fileTransfer:(id)a3 createdWithProperties:(id)a4;
- (void)fileTransfer:(id)a3 updatedWithProperties:(id)a4;
- (void)fileTransferRemoved:(id)a3;
- (void)fileTransferStopped:(id)a3;
- (void)fileTransfersRecoverablyDeleted:(id)a3;
- (void)markAttachment:(id)a3 sender:(id)a4 recipients:(id)a5 isIncoming:(BOOL)a6;
- (void)successfullyGeneratedPreviewForTransfer:(id)a3;
- (void)successfullyGeneratedPreviewForTransfer:(id)a3 withPreviewSize:(CGSize)a4;
@end

@implementation IMDaemonFileTransferRequestHandler

- (void)deleteFileTransferWithGUID:(id)a3
{
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Deleting attachment with guid %@", (uint8_t *)&v7, 0xCu);
    }
  }
  if ([v3 length])
  {
    v5 = +[IMDAttachmentStore sharedInstance];
    v6 = IMSingleObjectArray();
    [v5 deleteAttachmentsWithGUIDs:v6];
  }
}

- (void)fileTransfer:(id)a3 createdWithProperties:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (IMOSLoggingEnabled())
  {
    int v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v5;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "File transfer: %@   created with properties: %@", buf, 0x16u);
    }
  }
  if ([v5 length])
  {
    memset(buf, 0, 32);
    id v8 = +[IMDClientRequestContext currentContext];
    v9 = v8;
    if (v8) {
      [v8 auditToken];
    }
    else {
      memset(buf, 0, 32);
    }

    v11 = +[IMDFileTransferCenter sharedInstance];
    v12[0] = *(_OWORD *)buf;
    v12[1] = *(_OWORD *)&buf[16];
    [v11 _handleFileTransfer:v5 createdWithProperties:v6 withAuditToken:v12];
  }
  else if (IMOSLoggingEnabled())
  {
    v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Empty guid passed to: fileTransfer:createdWithProperties:", buf, 2u);
    }
  }
}

- (void)fileTransfer:(id)a3 updatedWithProperties:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length])
  {
    int v7 = +[IMDFileTransferCenter sharedInstance];
    [v7 _handleFileTransfer:v5 updatedWithProperties:v6];
  }
  else
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_4;
    }
    int v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Empty guid passed to: fileTransfer:updatedWithProperties:", v8, 2u);
    }
  }

LABEL_4:
}

- (void)fileTransfer:(id)a3 acceptedWithPath:(id)a4 autoRename:(BOOL)a5 overwrite:(BOOL)a6 options:(int64_t)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v11 = a3;
  id v12 = a4;
  if ([v11 length])
  {
    v13 = +[IMDFileTransferCenter sharedInstance];
    [v13 _handleFileTransfer:v11 acceptedWithPath:v12 autoRename:v9 overwrite:v8 options:a7 postNotification:1];
  }
  else if (IMOSLoggingEnabled())
  {
    v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Empty guid passed to: acceptedWithPath:", v15, 2u);
    }
  }
}

- (void)fileTransferStopped:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    v4 = +[IMDFileTransferCenter sharedInstance];
    [v4 _handleFileTransferStopped:v3];
  }
  else
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_4;
    }
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Empty guid passed to: fileTransferStopped:", v5, 2u);
    }
  }

LABEL_4:
}

- (void)fileTransferRemoved:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    v4 = +[IMDFileTransferCenter sharedInstance];
    [v4 _handleFileTransferRemoved:v3];
  }
  else
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_4;
    }
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Empty guid passed to: fileTransferRemoved:", v5, 2u);
    }
  }

LABEL_4:
}

- (void)fileTransfersRecoverablyDeleted:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    v4 = +[IMDDatabase database];
    id v5 = [v3 allObjects];
    [v4 coreSpotlightDeleteAttachmentGUIDs:v5 reason:1005];
  }
  else
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_4;
    }
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Empty guid passed to: fileTransfersRecoverabyDeleted:", v6, 2u);
    }
  }

LABEL_4:
}

- (void)markAttachment:(id)a3 sender:(id)a4 recipients:(id)a5 isIncoming:(BOOL)a6
{
  uint64_t v6 = a6;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = +[IMDFileTransferCenter sharedInstance];
  LOBYTE(v6) = [v12 markAttachment:v9 sender:v10 recipients:v11 isIncoming:v6];

  if ((v6 & 1) == 0 && IMOSLoggingEnabled())
  {
    v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412290;
      id v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Failed to mark attachment %@", (uint8_t *)&v14, 0xCu);
    }
  }
}

- (void)createItemForPHAssetWithUUID:(id)a3 parentChatItemGUID:(id)a4 chatGUID:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = +[IMDChatStore sharedInstance];
  id v11 = [v10 chatWithGUID:v9];

  id v12 = +[IMDMessageStore sharedInstance];
  v13 = [v12 messageWithGUID:v8 registerAttachments:0];

  if (v11 && v13)
  {
    int v14 = +[IMDMomentShareManager sharedInstance];
    [v14 regenerateTransfersForMessage:v13 inChat:v11 addingAssetWithUUID:v7];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        int v17 = 138412290;
        v18 = v11;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Failure to regenerate transfers for chat: %@", (uint8_t *)&v17, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        int v17 = 138412290;
        v18 = v13;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Failure to regenerate transfers for message: %@", (uint8_t *)&v17, 0xCu);
      }
    }
  }
}

- (void)downloadHighQualityVariantOfFileTransferWithGUID:(id)a3
{
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "This feature is unimplemented", v5, 2u);
    }
  }
}

- (void)failTransferPreviewGeneration:(id)a3
{
}

- (void)successfullyGeneratedPreviewForTransfer:(id)a3 withPreviewSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  sub_10004D210();
  id v7 = self;
  id v8 = self;
  id v9 = [v7 sharedInstance];
  if (v9)
  {
    id v10 = v9;
    id v11 = sub_10004D200();
    objc_msgSend(v10, "successfullyGeneratedPreviewForTransfer:withPreviewSize:", v11, width, height);

    swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

- (void)successfullyGeneratedPreviewForTransfer:(id)a3
{
}

@end
@interface LegacySMSAttachmentController
- (BOOL)shouldSendLowResolutionOnly;
- (LegacySMSAttachmentController)initWithSession:(id)a3;
- (LegacySMSServiceSession)session;
- (NSMutableSet)pendingRemoteFileRequests;
- (id)_existingStoredMessageWithCompletedTransfersForMessageGUID:(id)a3;
- (id)_plainTextPartWithString:(id)a3 index:(int64_t)a4;
- (unint64_t)maxTransferAudioFileSizeForWifi:(unint64_t *)a3 cell:(unint64_t *)a4;
- (unint64_t)maxTransferVideoFileSizeForWifi:(unint64_t *)a3 cell:(unint64_t *)a4;
- (void)_sendFileURL:(id)a3 forMessageGUID:(id)a4 attachmentIndex:(int64_t)a5;
- (void)_sizeLimitsForTransfer:(id)a3 bigSize:(unint64_t *)a4 smallSize:(unint64_t *)a5;
- (void)dealloc;
- (void)maxTransferFileSizeForWifi:(unint64_t *)a3 cell:(unint64_t *)a4;
- (void)processAttachmentsForMessage:(id)a3 generateTextParts:(BOOL)a4 lastAddressedHandle:(id)a5 lastAddressedSIMID:(id)a6 completionBlock:(id)a7;
- (void)processAttachmentsForPeerRelayForMessage:(id)a3 lastAddressHandle:(id)a4 lastAddressedSIMID:(id)a5 completionBlock:(id)a6 uploadFailureBlock:(id)a7;
- (void)remoteFileResponse:(id)a3;
- (void)remotefileRequest:(id)a3 attempts:(int64_t)a4;
- (void)retrieveAttachmentsForMessage:(id)a3 ignoreStoredTransfers:(BOOL)a4 displayID:(id)a5 token:(id)a6 completionBlock:(id)a7;
- (void)retrieveLocalFileTransfer:(id)a3 attachmentIndex:(unint64_t)a4 path:(id)a5 requestURLString:(id)a6 ownerID:(id)a7 signature:(id)a8 decryptionKey:(id)a9 requestedSize:(id)a10 fileSize:(unint64_t)a11 progressBlock:(id)a12 completionBlock:(id)aBlock;
- (void)setPendingRemoteFileRequests:(id)a3;
@end

@implementation LegacySMSAttachmentController

- (LegacySMSAttachmentController)initWithSession:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)LegacySMSAttachmentController;
  v4 = [(LegacySMSAttachmentController *)&v7 init];
  v5 = v4;
  if (v4) {
    objc_storeWeak((id *)&v4->_session, a3);
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)LegacySMSAttachmentController;
  [(LegacySMSAttachmentController *)&v3 dealloc];
}

- (BOOL)shouldSendLowResolutionOnly
{
  return _IMiMessageShouldSendLowResolutionOnly(self, a2);
}

- (void)maxTransferFileSizeForWifi:(unint64_t *)a3 cell:(unint64_t *)a4
{
  id v6 = +[IDSServerBag sharedInstanceForBagType:1];

  +[IMCTSMSUtilities IMiMessageMaxTransferFileSizeForWifiForPhoneNumber:a3 cellSize:a4 serverConfigurationBag:v6 phoneNumber:0 simID:0];
}

- (unint64_t)maxTransferAudioFileSizeForWifi:(unint64_t *)a3 cell:(unint64_t *)a4
{
  id v6 = +[IDSServerBag sharedInstanceForBagType:1];

  return (unint64_t)+[IMCTSMSUtilities IMiMessageMaxTransferAudioFileSizeForWifiForPhoneNumber:a3 cellSize:a4 serverConfigurationBag:v6 phoneNumber:0 simID:0];
}

- (unint64_t)maxTransferVideoFileSizeForWifi:(unint64_t *)a3 cell:(unint64_t *)a4
{
  id v6 = +[IDSServerBag sharedInstanceForBagType:1];

  return (unint64_t)+[IMCTSMSUtilities IMiMessageMaxTransferVideoFileSizeForWifiForPhoneNumber:a3 cellSize:a4 serverConfigurationBag:v6 phoneNumber:0 simID:0];
}

- (void)_sizeLimitsForTransfer:(id)a3 bigSize:(unint64_t *)a4 smallSize:(unint64_t *)a5
{
  id v7 = [a3 type];
  id v8 = +[IDSServerBag sharedInstanceForBagType:1];

  _IMiMessageSizeLimitsForTransferType(v7, a4, a5, v8);
}

- (void)processAttachmentsForMessage:(id)a3 generateTextParts:(BOOL)a4 lastAddressedHandle:(id)a5 lastAddressedSIMID:(id)a6 completionBlock:(id)a7
{
  BOOL v55 = a4;
  group = dispatch_group_create();
  id v65 = a3;
  signed int v10 = objc_msgSend(objc_msgSend(a3, "fileTransferGUIDs"), "count");
  if (v10)
  {
    int v11 = (int)((double)(int)+[IMCTSMSUtilities IMMMSMaximumMessageByteCountForPhoneNumber:a5 simID:a6]* 0.92);
    if (IMOSLoggingEnabled())
    {
      v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v11;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "   Maximum byte length for attachments is: %d", buf, 8u);
      }
    }
    int v13 = v11 / v10;
    if (IMOSLoggingEnabled())
    {
      v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)&buf[4] = v10;
        LOWORD(v84) = 1024;
        *(_DWORD *)((char *)&v84 + 2) = v13;
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "     Part byte length for %d attachments will be: %d", buf, 0xEu);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "     There are no attachments to consider", buf, 2u);
      }
    }
    int v13 = 0;
  }
  uint64_t v72 = 0;
  v73 = &v72;
  uint64_t v74 = 0x2020000000;
  char v75 = 0;
  *(void *)buf = 0;
  v84 = buf;
  uint64_t v85 = 0x3052000000;
  v86 = sub_55E34;
  v87 = sub_55E44;
  id v88 = 0;
  id v88 = objc_alloc_init((Class)NSMutableArray);
  id v16 = [v65 body];
  if (IMOSLoggingEnabled())
  {
    v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      [v65 body];
      uint64_t v18 = MarcoLoggingStringForMessageData();
      *(_DWORD *)v77 = 138412290;
      uint64_t v78 = v18;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "Enumerating parts in body %@", v77, 0xCu);
    }
  }
  if (objc_msgSend(+[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags"), "isPriusCompatibilityEnabled")&& objc_msgSend(objc_msgSend(v65, "threadIdentifier"), "length")&& v55)
  {
    if (IMOSLoggingEnabled())
    {
      v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        id v21 = [v65 guid];
        *(_DWORD *)v77 = 138412290;
        uint64_t v78 = (uint64_t)v21;
        _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "Prepending reply compatibility text message part for message %@", v77, 0xCu);
      }
    }
    id v22 = [(id)IMSharedUtilitiesFrameworkBundle() localizedStringForKey:@"REPLIED_BACKWARD_COMPATIBILITY" value:&stru_8F4F0 table:@"IMSharedUtilities"];
    id v19 = -[LegacySMSAttachmentController _plainTextPartWithString:index:](self, "_plainTextPartWithString:index:", v22, [*((id *)v84 + 5) count]);
    if (v19) {
      [*((id *)v84 + 5) addObject:v19];
    }
  }
  v71[0] = _NSConcreteStackBlock;
  v71[1] = 3221225472;
  v71[2] = sub_55E50;
  v71[3] = &unk_8E008;
  v71[4] = +[IMDFileTransferCenter sharedInstance];
  id v23 = objc_alloc_init((Class)NSMutableArray);
  id v59 = a6;
  id value = a5;
  id v61 = objc_alloc_init((Class)NSMutableArray);
  id v24 = [v16 length];
  v69[0] = _NSConcreteStackBlock;
  v69[1] = 3221225472;
  v69[2] = sub_55E5C;
  v69[3] = &unk_8E050;
  v69[8] = buf;
  v69[4] = v16;
  v69[5] = v23;
  BOOL v70 = v55;
  v69[6] = v61;
  v69[7] = v71;
  objc_msgSend(v16, "enumerateAttribute:inRange:options:usingBlock:", IMMessagePartAttributeName, 0, v24, 0, v69);
  if (!v55)
  {
    v68[0] = _NSConcreteStackBlock;
    v68[1] = 3221225472;
    v68[2] = sub_562F0;
    v68[3] = &unk_8E078;
    v68[6] = buf;
    v68[4] = v23;
    v68[5] = v61;
    objc_msgSend(v16, "__im_enumerateAdaptiveImageGlyphFileTransfersUsingFileTransferProvider:block:", v71, v68);
  }
  unint64_t v25 = 0;
  char v26 = 0;
  key = (void *)IMTranscoderUserInfoSenderHandleKey;
  v56 = (void *)IMTranscoderUserInfoSenderSIMIDKey;
  double v27 = (double)v13 * 0.92;
  id v58 = v23;
  while (v25 < (unint64_t)[v23 count])
  {
    id v28 = objc_msgSend(objc_msgSend(v23, "objectAtIndexedSubscript:", v25), "integerValue");
    id v29 = [v61 objectAtIndexedSubscript:v25];
    v30 = +[IMDFileTransferCenter sharedInstance];
    id v31 = [(IMDFileTransferCenter *)v30 transferForGUID:v29];
    [(IMDFileTransferCenter *)v30 startTransfer:v29];
    [(IMDFileTransferCenter *)v30 endTransfer:v29];
    id v32 = [v65 accountID];
    if ([v65 handle]) {
      id v33 = [v65 handle];
    }
    else {
      id v33 = 0;
    }
    [(IMDFileTransferCenter *)v30 assignTransfer:v29 toAccount:v32 otherPerson:v33];
    id v34 = [v31 localPath];
    id v35 = [v31 type];
    if (IMOSLoggingEnabled())
    {
      v36 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v77 = 138412290;
        uint64_t v78 = (uint64_t)v34;
        _os_log_impl(&dword_0, v36, OS_LOG_TYPE_INFO, "Found path for attachment part: %@", v77, 0xCu);
      }
    }
    if (![v34 length])
    {
      *((unsigned char *)v73 + 24) = 1;
      v50 = +[NSError errorWithDomain:IMTranscodeErrorDomain code:-2 userInfo:0];
      if (IMOSLoggingEnabled())
      {
        v51 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v77 = 138412802;
          uint64_t v78 = (uint64_t)v34;
          __int16 v79 = 2112;
          id v80 = v31;
          __int16 v81 = 2112;
          v82 = v50;
          _os_log_impl(&dword_0, v51, OS_LOG_TYPE_INFO, "Invalid path %@ for file transfer: %@   error: %@", v77, 0x20u);
        }
      }
      [(IMDFileTransferCenter *)v30 failTransfer:v29 error:v50];
      goto LABEL_69;
    }
    dispatch_group_enter(group);
    v37 = +[NSURL fileURLWithPath:v34];
    if (![(NSString *)[(NSURL *)v37 pathExtension] length])
    {
      id v39 = objc_msgSend(+[IMFileManager defaultHFSFileManager](IMFileManager, "defaultHFSFileManager"), "pathExtensionForUTIType:", objc_msgSend(v31, "type"));
      if (![v39 length]) {
        id v39 = objc_msgSend(+[IMFileManager defaultHFSFileManager](IMFileManager, "defaultHFSFileManager"), "pathExtensionForMIMEType:", objc_msgSend(v31, "mimeType"));
      }
      if ([v39 length])
      {
        v40 = [[(NSString *)[(NSURL *)v37 absoluteString] stringByDeletingPathExtension] stringByAppendingPathExtension:v39];
        if ([(NSString *)v40 length]) {
          v37 = +[NSURL fileURLWithPath:v40];
        }
      }
    }
    unint64_t v62 = v25;
    id v63 = v28;
    if (v37) {
      v38 = (NSURL *)[+[NSFileManager defaultManager] im_generateCopyForURL:v37];
    }
    else {
      v38 = 0;
    }
    Mutable = (__CFDictionary *)objc_msgSend(objc_msgSend(v31, "transcoderUserInfo"), "mutableCopy");
    if (!Mutable) {
      Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    }
    if (value) {
      CFDictionarySetValue(Mutable, key, value);
    }
    if (v59) {
      CFDictionarySetValue(Mutable, v56, v59);
    }
    v42 = +[IMTranscodeController sharedInstance];
    if (v38) {
      v37 = v38;
    }
    id v43 = [v31 isSticker];
    v44 = +[NSArray arrayWithObjects:@"public.3gpp", @"public.3gp", @"public.png", @"public.jpg", @"public.jpeg", 0];
    v76 = +[NSNumber numberWithDouble:v27];
    v45 = +[NSArray arrayWithObjects:&v76 count:1];
    v67[0] = _NSConcreteStackBlock;
    v67[1] = 3221225472;
    v67[2] = sub_56384;
    v67[3] = &unk_8E0A0;
    v67[4] = Mutable;
    v67[5] = v35;
    v67[6] = v31;
    v67[7] = v30;
    v67[8] = v29;
    v67[9] = v65;
    v67[12] = buf;
    v67[13] = &v72;
    v67[14] = v63;
    v67[10] = v38;
    v67[11] = group;
    LOBYTE(v52) = 0;
    [(IMTranscodeController *)v42 transcodeFileTransferContents:v37 utiType:v35 isSticker:v43 allowUnfilteredUTIs:v44 target:1 sizes:v45 commonCapabilities:0 maxDimension:-1 transcoderUserInfo:Mutable representations:0 isLQMEnabled:v52 completionBlock:v67];
    unint64_t v25 = v62 + 1;
    char v26 = 1;
    id v23 = v58;
  }

  if (objc_msgSend(objc_msgSend(v65, "expressiveSendStyleID"), "length")
    && [*((id *)v84 + 5) count]
    && v55)
  {
    if (IMOSLoggingEnabled())
    {
      v46 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        id v47 = [v65 guid];
        *(_DWORD *)v77 = 138412290;
        uint64_t v78 = (uint64_t)v47;
        _os_log_impl(&dword_0, v46, OS_LOG_TYPE_INFO, "Appending expressive send style message part for message %@", v77, 0xCu);
      }
    }
    id v48 = [v65 _localizedBackwardsCompatibleExpressiveSendText];
    id v49 = -[LegacySMSAttachmentController _plainTextPartWithString:index:](self, "_plainTextPartWithString:index:", v48, [*((id *)v84 + 5) count]);
    if (v49) {
      [*((id *)v84 + 5) addObject:v49];
    }
  }
  if (v26)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_5716C;
    block[3] = &unk_8E0C8;
    block[7] = &v72;
    block[8] = buf;
    block[4] = v65;
    block[5] = group;
    block[6] = a7;
    dispatch_group_notify(group, (dispatch_queue_t)&_dispatch_main_q, block);
    goto LABEL_70;
  }
  if (a7) {
    (*((void (**)(id, id, BOOL, void, void))a7 + 2))(a7, v65, *((unsigned char *)v73 + 24) == 0, *((void *)v84 + 5), 0);
  }

LABEL_69:
  dispatch_release(group);
LABEL_70:
  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v72, 8);
}

- (id)_plainTextPartWithString:(id)a3 index:(int64_t)a4
{
  id result = [a3 length];
  if (result)
  {
    id v7 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    CFDictionarySetValue(v7, @"Type", @"text/plain");
    id v8 = [a3 dataUsingEncoding:4];
    if (v8) {
      CFDictionarySetValue(v7, @"Data", v8);
    }
    if (@"text") {
      CFDictionarySetValue(v7, @"Tag", @"text");
    }
    v9 = +[NSString stringWithFormat:@"text_%d.txt", a4];
    if (v9) {
      CFDictionarySetValue(v7, @"Path", v9);
    }
    return v7;
  }
  return result;
}

- (void)processAttachmentsForPeerRelayForMessage:(id)a3 lastAddressHandle:(id)a4 lastAddressedSIMID:(id)a5 completionBlock:(id)a6 uploadFailureBlock:(id)a7
{
  if (IMOSLoggingEnabled())
  {
    int v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "AttachmentController: Told To Transcode and upload Parts of a Message to MMCS ", buf, 2u);
    }
  }
  id v37 = objc_alloc_init((Class)NSMutableArray);
  id obj = [a3 fileTransferGUIDs];
  if ([obj count])
  {
    signed int v12 = objc_msgSend(objc_msgSend(a3, "fileTransferGUIDs"), "count");
    int v13 = (int)((double)(int)+[IMCTSMSUtilities IMMMSMaximumMessageByteCountForPhoneNumber:a4 simID:a5]* 0.92);
    if (IMOSLoggingEnabled())
    {
      v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v13;
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "   Maximum byte length for attachments is: %d", buf, 8u);
      }
    }
    int v34 = v13 / v12;
    if (IMOSLoggingEnabled())
    {
      v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)&buf[4] = v12;
        *(_WORD *)&uint8_t buf[8] = 1024;
        *(_DWORD *)&buf[10] = v13 / v12;
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "     Part byte length for %d attachments will be: %d", buf, 0xEu);
      }
    }
    id v16 = [a6 copy];
    v17 = +[IMDFileTransferCenter sharedInstance];
    uint64_t v66 = 0;
    v67 = &v66;
    uint64_t v68 = 0x2020000000;
    char v69 = 1;
    uint64_t v62 = 0;
    id v63 = &v62;
    uint64_t v64 = 0x2020000000;
    int v65 = 0;
    uint64_t v18 = dispatch_group_create();
    id v36 = objc_alloc_init((Class)NSFileCoordinator);
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v19 = [obj countByEnumeratingWithState:&v58 objects:v74 count:16];
    if (!v19) {
      goto LABEL_37;
    }
    id v32 = v16;
    char v20 = 0;
    uint64_t v38 = *(void *)v59;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v59 != v38) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = *(void *)(*((void *)&v58 + 1) + 8 * i);
        id v23 = [(IMDFileTransferCenter *)v17 transferForGUID:v22];
        if (v23)
        {
          dispatch_group_enter(v18);
          [v23 _setNeedsWrapper:0];
          [(IMDFileTransferCenter *)v17 startTransfer:v22];
          [(IMDFileTransferCenter *)v17 endTransfer:v22];
          id v24 = [a3 accountID];
          if ([a3 handle]) {
            id v25 = [a3 handle];
          }
          else {
            id v25 = 0;
          }
          [(IMDFileTransferCenter *)v17 assignTransfer:v22 toAccount:v24 otherPerson:v25];
          uint64_t v56 = 0;
          uint64_t v57 = 0;
          [(LegacySMSAttachmentController *)self _sizeLimitsForTransfer:v23 bigSize:&v57 smallSize:&v56];
          if (IMOSLoggingEnabled())
          {
            double v27 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&buf[4] = v57;
              *(_WORD *)&uint8_t buf[8] = 1024;
              *(_DWORD *)&buf[10] = v56;
              _os_log_impl(&dword_0, v27, OS_LOG_TYPE_INFO, "Big size: %d    Small Size: %d", buf, 0xEu);
            }
          }
          v42[0] = _NSConcreteStackBlock;
          v42[1] = 3221225472;
          id v43 = sub_57C40;
          v44 = &unk_8E1B8;
          int v55 = v34;
          id v45 = v23;
          v46 = self;
          id v47 = v17;
          uint64_t v48 = v22;
          v53 = &v62;
          v54 = &v66;
          id v49 = v18;
          id v50 = a3;
          id v51 = v37;
          id v52 = a7;
          uint64_t v41 = 0;
          objc_msgSend(v36, "coordinateReadingItemAtURL:options:error:byAccessor:", objc_msgSend(v23, "localURL"), 0, &v41, v42);
          if (v41)
          {
            if (IMOSLoggingEnabled())
            {
              id v28 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
              {
                id v29 = [v23 localURL];
                *(_DWORD *)buf = 138412546;
                *(void *)&buf[4] = v29;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v41;
                _os_log_impl(&dword_0, v28, OS_LOG_TYPE_INFO, "Failed coordinated read of: %@  (Error: %@)", buf, 0x16u);
              }
            }
            v30 = (NSURL *)[v23 localURL];
            v43((uint64_t)v42, v30);
          }
          char v20 = 1;
        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            char v26 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&buf[4] = v22;
              _os_log_impl(&dword_0, v26, OS_LOG_TYPE_INFO, "No transfer found for guid: %@", buf, 0xCu);
            }
          }
          *((unsigned char *)v67 + 24) = 0;
          *((_DWORD *)v63 + 6) = 34;
        }
      }
      id v19 = [obj countByEnumeratingWithState:&v58 objects:v74 count:16];
    }
    while (v19);
    if (v20)
    {
      *(void *)buf = 0;
      *(void *)&uint8_t buf[8] = buf;
      *(void *)&buf[16] = 0x3052000000;
      v71 = sub_55E34;
      uint64_t v72 = sub_55E44;
      id v73 = 0;
      id v73 = [objc_alloc((Class)IMPowerAssertion) initWithIdentifier:@"OutgoingMessagesPowerAssertion" timeout:120.0];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_594E4;
      block[3] = &unk_8E1E0;
      block[4] = obj;
      block[5] = v37;
      block[8] = &v66;
      void block[9] = &v62;
      block[10] = buf;
      block[6] = v18;
      block[7] = v32;
      dispatch_group_notify(v18, (dispatch_queue_t)&_dispatch_main_q, block);
      _Block_object_dispose(buf, 8);
    }
    else
    {
LABEL_37:
      dispatch_release(v18);
    }

    _Block_object_dispose(&v62, 8);
    _Block_object_dispose(&v66, 8);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v31 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v31, OS_LOG_TYPE_INFO, "AttachmentController: Told To Transcode but the message had no parts, don't wake me up. ", buf, 2u);
      }
    }
    if (a6) {
      (*((void (**)(id, id, uint64_t, void))a6 + 2))(a6, v37, 1, 0);
    }
  }
}

- (void)retrieveAttachmentsForMessage:(id)a3 ignoreStoredTransfers:(BOOL)a4 displayID:(id)a5 token:(id)a6 completionBlock:(id)a7
{
  if (objc_msgSend(objc_msgSend(a3, "fileTransferGUIDs"), "count"))
  {
    signed int v12 = (void (**)(id, id, id, uint64_t, void))[a7 copy];
    if (a4)
    {
      if (!IMOSLoggingEnabled()) {
        goto LABEL_20;
      }
      int v13 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
        goto LABEL_20;
      }
      *(_WORD *)buf = 0;
      v14 = "   Ignoring existing transfers.";
LABEL_19:
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, v14, buf, 2u);
LABEL_20:
      if (IMOSLoggingEnabled())
      {
        id v19 = OSLogHandleForIMEventCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, "Starting network availablity check...", buf, 2u);
        }
      }
      if ([+[IMSystemMonitor sharedInstance] isScreenLit])uint64_t v20 = 0; {
      else
      }
        uint64_t v20 = 9;
      *(void *)buf = 0;
      id v24 = buf;
      uint64_t v25 = 0x3052000000;
      char v26 = sub_55E34;
      double v27 = sub_55E44;
      uint64_t v28 = 0;
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_59994;
      v22[3] = &unk_8E258;
      v22[4] = a3;
      v22[5] = a5;
      v22[6] = v12;
      v22[7] = buf;
      id v21 = [objc_alloc((Class)IMNetworkAvailability) initWithFlags:3 options:v20 timeout:v22 wifiTimeout:20.0 completionBlock:5.0];
      *((void *)v24 + 5) = v21;
      [v21 start];

      _Block_object_dispose(buf, 8);
      return;
    }
    id v16 = -[LegacySMSAttachmentController _existingStoredMessageWithCompletedTransfersForMessageGUID:](self, "_existingStoredMessageWithCompletedTransfersForMessageGUID:", [a3 guid]);
    int v17 = IMOSLoggingEnabled();
    if (!v16)
    {
      if (!v17) {
        goto LABEL_20;
      }
      int v13 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
        goto LABEL_20;
      }
      *(_WORD *)buf = 0;
      v14 = "   We don't have all the attachments yet, we'll just re-download.";
      goto LABEL_19;
    }
    if (v17)
    {
      uint64_t v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "   We already have all these transfers, just moving along as a success!", buf, 2u);
      }
    }
    if (v12) {
      v12[2](v12, v16, a5, 1, 0);
    }
  }
  else if (a7)
  {
    v15 = (void (*)(id, id, id, uint64_t, void))*((void *)a7 + 2);
    v15(a7, a3, a5, 1, 0);
  }
}

- (id)_existingStoredMessageWithCompletedTransfersForMessageGUID:(id)a3
{
  id result = [+[IMDMessageStore sharedInstance] messageWithGUID:a3];
  if (result)
  {
    v4 = (__CFString *)result;
    if (IMOSLoggingEnabled())
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v28 = v4;
        _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Found already stored message: %@", buf, 0xCu);
      }
    }
    id v21 = v4;
    id v6 = objc_msgSend(-[__CFString fileTransferGUIDs](v4, "fileTransferGUIDs"), "count");
    BOOL v7 = v6 != 0;
    if (IMOSLoggingEnabled())
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        CFStringRef v9 = @"NO";
        if (v6) {
          CFStringRef v9 = @"YES";
        }
        *(_DWORD *)buf = 138412290;
        CFStringRef v28 = v9;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "   ==> Has attachments present: %@", buf, 0xCu);
      }
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v10 = [(__CFString *)v4 fileTransferGUIDs];
    id v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v23;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v10);
          }
          CFStringRef v14 = *(const __CFString **)(*((void *)&v22 + 1) + 8 * i);
          id v15 = [+[IMDFileTransferCenter sharedInstance] transferForGUID:v14];
          if (!v15)
          {
            if (IMOSLoggingEnabled())
            {
              uint64_t v20 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                CFStringRef v28 = v14;
                uint64_t v18 = v20;
                id v19 = "   ==> Missing a transfer for guid: %@";
LABEL_24:
                _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, v19, buf, 0xCu);
              }
            }
LABEL_25:
            BOOL v7 = 0;
            continue;
          }
          id v16 = (__CFString *)[v15 localURL];
          if (!v16
            || ![+[NSFileManager defaultManager] fileExistsAtPath:[(__CFString *)v16 path]])
          {
            if (IMOSLoggingEnabled())
            {
              int v17 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                CFStringRef v28 = v16;
                uint64_t v18 = v17;
                id v19 = "   ==> Missing an attachment at path: %@";
                goto LABEL_24;
              }
            }
            goto LABEL_25;
          }
        }
        id v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v11);
    }
    if (v7) {
      return v21;
    }
    else {
      return 0;
    }
  }
  return result;
}

- (void)retrieveLocalFileTransfer:(id)a3 attachmentIndex:(unint64_t)a4 path:(id)a5 requestURLString:(id)a6 ownerID:(id)a7 signature:(id)a8 decryptionKey:(id)a9 requestedSize:(id)a10 fileSize:(unint64_t)a11 progressBlock:(id)a12 completionBlock:(id)aBlock
{
  if (IMOSLoggingEnabled())
  {
    id v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = a3;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, " Requesting file attachments for transfer %@", buf, 0xCu);
    }
  }
  v30[0] = a3;
  v29[0] = @"message-guid";
  v29[1] = @"attachment-index";
  v30[1] = +[NSNumber numberWithUnsignedInteger:a4];
  v29[2] = @"supports-direct-mmcs-download";
  v30[2] = &__kCFBooleanTrue;
  +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:3];
  id v17 = [(id)JWEncodeDictionary() _FTCopyGzippedData];
  uint64_t v18 = +[NSDictionary dictionaryWithObjectsAndKeys:@"remote-file-request", @"local-type", v17, @"dict", 0];

  id v19 = +[IMDAccountController sharedAccountController];
  id v20 = [v19 anySessionForServiceName:IMServiceNameSMS];
  if (IMOSLoggingEnabled())
  {
    id v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      id v22 = objc_msgSend(objc_msgSend(v20, "service"), "internalName");
      *(_DWORD *)buf = 138412546;
      id v26 = v20;
      __int16 v27 = 2112;
      id v28 = v22;
      _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "We have the sms service session %@ %@", buf, 0x16u);
    }
  }
  if ([v20 sendToLocalPeers:v18])
  {
    if (!self->_peerCompletionBlocks) {
      self->_peerCompletionBlocks = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    }
    long long v23 = _Block_copy(aBlock);
    -[NSMutableDictionary setObject:forKey:](self->_peerCompletionBlocks, "setObject:forKey:", v23, objc_msgSend(a3, "stringByAppendingFormat:", @"_%lu", a4));
    _Block_release(v23);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      long long v24 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = a3;
        _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, " Failed to send message to local device for Transfer %@, Failing", buf, 0xCu);
      }
    }
    (*((void (**)(id, id, unint64_t, void, void, void, void))aBlock + 2))(aBlock, a3, a4, 0, 0, 0, 0);
  }
}

- (void)_sendFileURL:(id)a3 forMessageGUID:(id)a4 attachmentIndex:(int64_t)a5
{
  uint64_t v8 = (uint64_t)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[NSFileManager attributesOfItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "attributesOfItemAtPath:error:", objc_msgSend(a3, "path"), 0), "objectForKeyedSubscript:", NSFileSize), "longValue");
  if (v8 <= 0x100000) {
    CFStringRef v9 = +[NSData dataWithContentsOfURL:a3];
  }
  else {
    CFStringRef v9 = +[NSData data];
  }
  id v10 = v9;
  if (IMOSLoggingEnabled())
  {
    id v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v29 = a4;
      __int16 v30 = 2048;
      int64_t v31 = a5;
      __int16 v32 = 2112;
      id v33 = a3;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "Forwarding Attachment (%@, %ld) to local peer. Filepath %@", buf, 0x20u);
    }
  }
  v27[0] = a4;
  v26[0] = @"message-guid";
  v26[1] = @"attachment-index";
  v27[1] = +[NSNumber numberWithInteger:a5];
  v26[2] = @"message-data";
  if (!v10) {
    id v10 = +[NSData data];
  }
  v27[2] = v10;
  +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:3];
  id v12 = [(id)JWEncodeDictionary() _FTCopyGzippedData];
  v24[0] = @"dict";
  v24[1] = @"local-type";
  v25[0] = v12;
  v25[1] = @"remote-file-response";
  int v13 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];

  id v14 = +[IMDAccountController sharedAccountController];
  id v15 = [v14 anySessionForServiceName:IMServiceNameSMS];
  if (IMOSLoggingEnabled())
  {
    id v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = objc_msgSend(objc_msgSend(v15, "service"), "internalName");
      *(_DWORD *)buf = 138412546;
      id v29 = v15;
      __int16 v30 = 2112;
      int64_t v31 = (int64_t)v17;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "We have the sms service session %@ %@", buf, 0x16u);
    }
  }
  int v18 = IMOSLoggingEnabled();
  if (v8 <= 0x100000)
  {
    if (v18)
    {
      id v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "Using legacy api to send attachment", buf, 2u);
      }
    }
    unsigned int v21 = [v15 sendToLocalPeers:v13];
    if (IMOSLoggingEnabled())
    {
      id v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        CFStringRef v23 = @"NO";
        if (v21) {
          CFStringRef v23 = @"YES";
        }
        *(_DWORD *)buf = 138412290;
        id v29 = (id)v23;
        _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "Got success? %@", buf, 0xCu);
      }
    }
  }
  else
  {
    if (v18)
    {
      id v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, "Sending attachment with file url api", buf, 2u);
      }
    }
    [v15 sendFileToLocalPeers:a3 metadata:v13];
  }
}

- (void)remotefileRequest:(id)a3 attempts:(int64_t)a4
{
  id v7 = [a3 objectForKey:@"message-guid"];
  id v8 = objc_msgSend(objc_msgSend(a3, "objectForKey:", @"attachment-index"), "unsignedIntegerValue");
  unsigned int v9 = objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"supports-direct-mmcs-download"), "BOOLValue");
  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v7;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v8;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "Attempting to locate message with Message Guid %@ and index %lu", buf, 0x16u);
    }
  }
  id v11 = [+[IMDMessageStore sharedInstance] messageWithGUID:v7];
  int v12 = IMOSLoggingEnabled();
  if (!v11)
  {
    if (!v12) {
      return;
    }
    long long v24 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO)) {
      return;
    }
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v7;
    long long v25 = "Unable To locate Message with GUID %@, adding to pending requests to retry later";
    goto LABEL_48;
  }
  if (v12)
  {
    int v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v7;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "Located Mesage with Message Guid %@", buf, 0xCu);
    }
  }
  [(NSMutableSet *)[(LegacySMSAttachmentController *)self pendingRemoteFileRequests] removeObject:a3];
  if (![(NSMutableSet *)[(LegacySMSAttachmentController *)self pendingRemoteFileRequests] count])[(LegacySMSAttachmentController *)self setPendingRemoteFileRequests:0]; {
  if (([v11 isFinished] & 1) == 0)
  }
  {
    int v26 = IMOSLoggingEnabled();
    if (a4 < 40)
    {
      if (v26)
      {
        __int16 v27 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v7;
          _os_log_impl(&dword_0, v27, OS_LOG_TYPE_INFO, "Message with Guid  is unfinished %@, Retrying it a bit ", buf, 0xCu);
        }
      }
      v40[7] = _NSConcreteStackBlock;
      v40[8] = 3221225472;
      v40[9] = sub_5BFEC;
      v40[10] = &unk_8E280;
      v40[11] = self;
      v40[12] = a3;
      v40[13] = a4;
      im_dispatch_after();
      return;
    }
    if (!v26) {
      return;
    }
    long long v24 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO)) {
      return;
    }
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v7;
    long long v25 = "Message with Guid is unfinished %@, No retried remain ";
LABEL_48:
    id v28 = v24;
    uint32_t v29 = 12;
    goto LABEL_49;
  }
  BOOL v14 = [v11 fileTransferGUIDs] == 0;
  int v15 = IMOSLoggingEnabled();
  if (v14)
  {
    if (!v15) {
      return;
    }
    long long v24 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO)) {
      return;
    }
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v11;
    long long v25 = "We have the message but no transfer guids - %@";
    goto LABEL_48;
  }
  if (v15)
  {
    id v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v7;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "Located message with guid %@ attachments,  ", buf, 0xCu);
    }
  }
  if (v8 < objc_msgSend(objc_msgSend(v11, "fileTransferGUIDs"), "count"))
  {
    id v17 = objc_msgSend(objc_msgSend(v11, "fileTransferGUIDs"), "objectAtIndex:", v8);
    if (IMOSLoggingEnabled())
    {
      int v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v17;
        _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "Attempting to locate file transfer with guid %@ ", buf, 0xCu);
      }
    }
    id v19 = [+[IMDFileTransferCenter sharedInstance] transferForGUID:v17];
    if (v19)
    {
      id v36 = v17;
      if (IMOSLoggingEnabled())
      {
        id v20 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v36;
          _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "Located Transfer with Guid %@ ", buf, 0xCu);
        }
      }
      if ([v19 isFinished])
      {
        if (IMOSLoggingEnabled())
        {
          unsigned int v21 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v36;
            _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "Located Completed transfer with %@ ", buf, 0xCu);
          }
        }
        if (v9)
        {
          id v22 = +[UTType typeWithIdentifier:](UTType, "typeWithIdentifier:", [v19 type]);
          if ([(UTType *)v22 conformsToType:UTTypeImage]
            && ([v19 localURL], (IMFileURLIsActuallyAnimated() & 1) == 0))
          {
            uint64_t v42 = 0;
            memset(buf, 0, sizeof(buf));
            IMPreviewConstraintsZero();
            *(_OWORD *)buf = xmmword_68EF0;
            *(_OWORD *)&buf[16] = xmmword_68F00;
            LOBYTE(v42) = [v19 isSticker];
            BYTE2(v42) = [v19 isAdaptiveImageGlyph];
            BYTE1(v42) = 0;
            id v33 = +[IMTranscodeController sharedInstance];
            id v34 = [v19 localURL];
            v40[0] = _NSConcreteStackBlock;
            v40[1] = 3221225472;
            v40[2] = sub_5C000;
            v40[3] = &unk_8E2A8;
            v40[4] = self;
            v40[5] = v11;
            v40[6] = v8;
            v38[0] = *(_OWORD *)buf;
            v38[1] = *(_OWORD *)&buf[16];
            uint64_t v39 = v42;
            [(IMTranscodeController *)v33 generateSafeRender:v34 constraints:v38 completionBlock:v40];
          }
          else
          {
            if (IMOSLoggingEnabled())
            {
              CFStringRef v23 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v22;
                _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, "File safe render failed for Peer Relay because the filetype was not supported: %@", buf, 0xCu);
              }
            }
            -[LegacySMSAttachmentController _sendFileURL:forMessageGUID:attachmentIndex:](self, "_sendFileURL:forMessageGUID:attachmentIndex:", [v19 localURL], objc_msgSend(v11, "guid"), v8);
          }
        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            id v35 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_0, v35, OS_LOG_TYPE_INFO, "Request is from an old watch, so we need to transcode", buf, 2u);
            }
          }
          v37[0] = _NSConcreteStackBlock;
          v37[1] = 3221225472;
          v37[2] = sub_5C180;
          v37[3] = &unk_8E2D0;
          v37[4] = v36;
          v37[5] = v11;
          v37[6] = v8;
          -[LegacySMSRelayTranscodeController transcodeFileTransferContents:utiType:transcoderUserInfo:highQualityMaxByteSize:lowQualityMaxByteSize:representations:completionBlock:](+[LegacySMSRelayTranscodeController sharedInstance](LegacySMSRelayTranscodeController, "sharedInstance"), "transcodeFileTransferContents:utiType:transcoderUserInfo:highQualityMaxByteSize:lowQualityMaxByteSize:representations:completionBlock:", [v19 localURL], objc_msgSend(v19, "type"), objc_msgSend(v19, "transcoderUserInfo"), 0x80000, 0x80000, 0, v37);
        }
        return;
      }
      int v30 = IMOSLoggingEnabled();
      if (a4 < 40)
      {
        if (v30)
        {
          int64_t v31 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v36;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v7;
            _os_log_impl(&dword_0, v31, OS_LOG_TYPE_INFO, "Transfer Guid %@ for Message with %@ is not yet complete, Retrying it a bit ", buf, 0x16u);
          }
        }
        im_dispatch_after();
        return;
      }
      if (!v30) {
        return;
      }
      __int16 v32 = OSLogHandleForIMEventCategory();
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_INFO)) {
        return;
      }
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v36;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v7;
      long long v25 = "Transfer Guid %@ for Message with %@ is not yet complete, no retries remain ";
      id v28 = v32;
      uint32_t v29 = 22;
LABEL_49:
      _os_log_impl(&dword_0, v28, OS_LOG_TYPE_INFO, v25, buf, v29);
    }
  }
}

- (void)remoteFileResponse:(id)a3
{
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = a3;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Received remote file response message %@", buf, 0xCu);
    }
  }
  id v6 = [a3 objectForKey:@"message-guid"];
  id v7 = objc_msgSend(objc_msgSend(a3, "objectForKey:", @"attachment-index"), "unsignedIntegerValue");
  id v8 = [a3 objectForKey:@"message-data"];
  if ([v6 length])
  {
    if (IMOSLoggingEnabled())
    {
      unsigned int v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v18 = v6;
        __int16 v19 = 2048;
        id v20 = v7;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, " Incomming response for message %@ attachment index %lu ", buf, 0x16u);
      }
    }
    id v10 = objc_msgSend(v6, "stringByAppendingFormat:", @"_%lu", v7);
    id v11 = [(NSMutableDictionary *)self->_peerCompletionBlocks objectForKey:v10];
    int v12 = IMOSLoggingEnabled();
    if (v11)
    {
      if (v12)
      {
        int v13 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, " Found completion block for attachment", buf, 2u);
        }
      }
      (*((void (**)(id, id, id, void, id, uint64_t, void))v11 + 2))(v11, v6, v7, 0, v8, 1, 0);
      [(NSMutableDictionary *)self->_peerCompletionBlocks removeObjectForKey:v10];
    }
    else
    {
      if (v12)
      {
        BOOL v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v18 = v10;
          _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, " No completion block for attachment found: %@", buf, 0xCu);
        }
      }
      if (IMOSLoggingEnabled())
      {
        int v15 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          id v16 = [(NSMutableDictionary *)self->_peerCompletionBlocks allKeys];
          *(_DWORD *)buf = 138412290;
          id v18 = v16;
          _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "     In list of blocks: %@", buf, 0xCu);
        }
      }
    }
    if (![(NSMutableDictionary *)self->_peerCompletionBlocks count])
    {

      self->_peerCompletionBlocks = 0;
    }
  }
}

- (NSMutableSet)pendingRemoteFileRequests
{
  return self->_pendingRemoteFileRequests;
}

- (void)setPendingRemoteFileRequests:(id)a3
{
}

- (LegacySMSServiceSession)session
{
  return (LegacySMSServiceSession *)objc_loadWeak((id *)&self->_session);
}

- (void).cxx_destruct
{
}

@end
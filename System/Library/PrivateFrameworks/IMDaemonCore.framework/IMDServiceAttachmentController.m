@interface IMDServiceAttachmentController
- (BOOL)_receiveFileTransfer:(id)a3 transferID:(id)a4 balloonBundleID:(id)a5 senderContext:(id)a6 progressBlock:(id)a7 completionBlock:(id)a8;
- (BOOL)acceptFileTransfer:(id)a3;
- (BOOL)hasLocalDevice;
- (BOOL)sendToLocalPeers:(id)a3;
- (BOOL)sendToLocalPeersFile:(id)a3 dictionary:(id)a4;
- (IMDServiceAttachmentController)initWithSession:(id)a3;
- (IMDServiceSession)session;
- (NSMutableSet)pendingRemoteFileRequests;
- (id)localDeviceProductVersion;
- (void)_sendAttachmentToPeerDevice:(unint64_t)a3 fileTransferGUID:(id)a4 messageGuid:(id)a5 fileURL:(id)a6 useLocalPeersFileAPI:(BOOL)a7 error:(int64_t)a8;
- (void)remoteFileResponse:(id)a3;
- (void)remotefileRequest:(id)a3 attempts:(int64_t)a4 shouldRetry:(BOOL)a5;
- (void)retrieveLocalFileTransfer:(id)a3 attachmentIndex:(unint64_t)a4 path:(id)a5 requestURLString:(id)a6 ownerID:(id)a7 signature:(id)a8 decryptionKey:(id)a9 requestedSize:(id)a10 fileSize:(unint64_t)a11 progressBlock:(id)a12 completionBlock:(id)a13;
- (void)setPendingRemoteFileRequests:(id)a3;
@end

@implementation IMDServiceAttachmentController

- (IMDServiceAttachmentController)initWithSession:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IMDServiceAttachmentController;
  v5 = [(IMDServiceAttachmentController *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_session, v4);
  }

  return v6;
}

- (BOOL)hasLocalDevice
{
  return 0;
}

- (BOOL)acceptFileTransfer:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = IMOSLoggingEnabled();
  if (v4)
  {
    if (v5)
    {
      v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v31 = v4;
        _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Accepting file transfer: %@", buf, 0xCu);
      }
    }
    v20 = [v4 guid];
    v7 = [v4 filename];
    v21 = [v7 lastPathComponent];

    objc_super v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    v9 = objc_msgSend(v8, "im_randomTemporaryFileURLWithFileName:", v21);

    BOOL v22 = v9 != 0;
    if (v9)
    {
      v10 = [v9 path];
      v11 = +[IMDFileTransferCenter sharedInstance];
      BOOL v12 = [(IMDServiceAttachmentController *)self hasLocalDevice];
      v13 = +[IMDStickerRegistry sharedInstance];
      v14 = [v4 stickerUserInfo];
      uint64_t v15 = [v4 isAdaptiveImageGlyph];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = sub_1D9713D38;
      v23[3] = &unk_1E6B74EE0;
      id v24 = v4;
      id v25 = v11;
      BOOL v29 = v12;
      id v26 = v10;
      id v27 = v20;
      v28 = self;
      id v16 = v10;
      v17 = v11;
      [v13 retrieveStickerWithProperties:v14 isAdaptiveImageGlyph:v15 completionBlock:v23];
    }
    else
    {
      v17 = IMLogHandleForCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_1D98FFF70();
      }
    }
  }
  else
  {
    if (v5)
    {
      v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "Not accepting, empty transfer supplied", buf, 2u);
      }
    }
    BOOL v22 = 0;
  }

  return v22;
}

- (BOOL)_receiveFileTransfer:(id)a3 transferID:(id)a4 balloonBundleID:(id)a5 senderContext:(id)a6 progressBlock:(id)a7 completionBlock:(id)a8
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v59 = a4;
  id v55 = a5;
  id v56 = a6;
  id v54 = a7;
  id v15 = a8;
  id v16 = [MEMORY[0x1E4F6C360] sharedInstance];
  if (![v16 isInternalInstall])
  {

LABEL_8:
    v19 = [v14 userInfo];
    v53 = [v19 objectForKey:@"service"];
    v21 = [v14 originalFilename];
    v57 = [v21 lastPathComponent];

    BOOL v22 = [MEMORY[0x1E4F28CB8] defaultManager];
    v58 = objc_msgSend(v22, "im_randomTemporaryFileURLWithFileName:", v57);

    if (!v58)
    {
      BOOL v29 = IMLogHandleForCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        sub_1D9900040();
      }

      if (v15)
      {
        v52 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.Messages.AttachmentControllerErrorDomain" code:3 userInfo:0];
        (*((void (**)(id, id, void, void, void, void *, void, double, double))v15 + 2))(v15, v59, 0, 0, 0, v52, 0, 0.0, 0.0);
        BOOL v20 = 0;
      }
      else
      {
        BOOL v20 = 0;
      }
      goto LABEL_54;
    }
    if ([(id)*MEMORY[0x1E4F6E198] isEqualToString:v53])
    {
      v51 = [v19 objectForKey:@"simID"];
      v23 = [v19 objectForKey:@"file"];
      id v24 = [v23 objectForKey:@"url"];
      id v25 = [MEMORY[0x1E4F1CB10] URLWithString:v24];
      if (IMOSLoggingEnabled())
      {
        id v26 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v26, OS_LOG_TYPE_INFO, "Attempting download from RCS", buf, 2u);
        }
      }
      uint64_t v27 = [v14 thumbnailMode];
      if (v27) {
        [v14 setThumbnailMode:2];
      }
      v28 = [MEMORY[0x1E4F6EBE8] sharedInstance];
      v91[0] = MEMORY[0x1E4F143A8];
      v91[1] = 3221225472;
      v91[2] = sub_1D9715B80;
      v91[3] = &unk_1E6B74F30;
      id v92 = v14;
      id v93 = v55;
      id v94 = v56;
      id v97 = v15;
      uint64_t v98 = v27;
      v95 = self;
      id v96 = v59;
      [v28 downloadRCSTransferOnSimID:v51 transferURL:v25 destURL:v58 completion:v91];

      BOOL v20 = 1;
      goto LABEL_53;
    }
    v51 = [v14 guid];
    uint64_t v85 = 0;
    v86 = &v85;
    uint64_t v87 = 0x3032000000;
    v88 = sub_1D97162DC;
    v89 = sub_1D97162EC;
    id v90 = 0;
    uint64_t v79 = 0;
    v80 = &v79;
    uint64_t v81 = 0x3032000000;
    v82 = sub_1D97162DC;
    v83 = sub_1D97162EC;
    id v84 = 0;
    uint64_t v73 = 0;
    v74 = &v73;
    uint64_t v75 = 0x3032000000;
    v76 = sub_1D97162DC;
    v77 = sub_1D97162EC;
    id v78 = 0;
    uint64_t v67 = 0;
    v68 = &v67;
    uint64_t v69 = 0x3032000000;
    v70 = sub_1D97162DC;
    v71 = sub_1D97162EC;
    id v72 = 0;
    uint64_t v61 = 0;
    v62 = &v61;
    uint64_t v63 = 0x3032000000;
    v64 = sub_1D97162DC;
    v65 = sub_1D97162EC;
    id v66 = 0;
    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = sub_1D97162F4;
    v60[3] = &unk_1E6B74F58;
    v60[4] = &v85;
    v60[5] = &v79;
    v60[6] = &v73;
    v60[7] = &v67;
    v60[8] = &v61;
    objc_msgSend(v19, "__message_defaultFileTransferEnforceMaxFileSize:withCompletion:", 1, v60);
    uint64_t v30 = v86[5];
    BOOL v20 = v30 != 0;
    if (v30)
    {
      if (IMOSLoggingEnabled())
      {
        id v31 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          uint64_t v32 = (void *)v80[5];
          *(_DWORD *)buf = 138412290;
          id v100 = v32;
          _os_log_impl(&dword_1D967A000, v31, OS_LOG_TYPE_INFO, " => Settled on signature: %@", buf, 0xCu);
        }
      }
      if (IMOSLoggingEnabled())
      {
        v33 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v100 = v14;
          _os_log_impl(&dword_1D967A000, v33, OS_LOG_TYPE_INFO, " transfer: %@", buf, 0xCu);
        }
      }
      if (IMOSLoggingEnabled())
      {
        v34 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v100 = v19;
          _os_log_impl(&dword_1D967A000, v34, OS_LOG_TYPE_INFO, "    user info: %@", buf, 0xCu);
        }
      }
      if (IMOSLoggingEnabled())
      {
        v35 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          v36 = (void *)v86[5];
          uint64_t v37 = v74[5];
          uint64_t v38 = v80[5];
          uint64_t v39 = v62[5];
          uint64_t v40 = v68[5];
          *(_DWORD *)buf = 138413314;
          id v100 = v36;
          __int16 v101 = 2112;
          uint64_t v102 = v37;
          __int16 v103 = 2112;
          uint64_t v104 = v38;
          __int16 v105 = 2112;
          uint64_t v106 = v39;
          __int16 v107 = 2112;
          uint64_t v108 = v40;
          _os_log_impl(&dword_1D967A000, v35, OS_LOG_TYPE_INFO, " urlString: %@   owner: %@    signature: %@  key: %@  fileSizeString: %@", buf, 0x34u);
        }
      }
      if (IMOSLoggingEnabled())
      {
        v41 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v41, OS_LOG_TYPE_INFO, "Attempting download from MMCS", buf, 2u);
        }
      }
      v42 = [MEMORY[0x1E4F6EBF8] sharedInstance];
      v43 = [v58 path];
      uint64_t v44 = v86[5];
      uint64_t v45 = v74[5];
      v46 = [(id)v80[5] _FTDataFromHexString];
      v47 = [(id)v62[5] _FTDataFromHexString];
      uint64_t v48 = [(id)v68[5] integerValue];
      [v42 receiveFileTransfer:v59 transferGUID:v51 topic:*MEMORY[0x1E4F6AA78] path:v43 requestURLString:v44 ownerID:v45 signature:v46 decryptionKey:v47 fileSize:v48 balloonBundleID:v55 senderContext:v56 progressBlock:v54 completionBlock:v15];
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v49 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v49, OS_LOG_TYPE_INFO, " => No signature found, nothing to download here", buf, 2u);
        }
      }
      if (!v15) {
        goto LABEL_52;
      }
      v42 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.Messages.AttachmentControllerErrorDomain" code:2 userInfo:0];
      (*((void (**)(id, id, void, void, void, void *, void, double, double))v15 + 2))(v15, v59, 0, 0, 0, v42, 0, 0.0, 0.0);
    }

LABEL_52:
    _Block_object_dispose(&v61, 8);

    _Block_object_dispose(&v67, 8);
    _Block_object_dispose(&v73, 8);

    _Block_object_dispose(&v79, 8);
    _Block_object_dispose(&v85, 8);

LABEL_53:
LABEL_54:

    goto LABEL_55;
  }
  int v17 = IMGetCachedDomainBoolForKey();

  if (!v17) {
    goto LABEL_8;
  }
  v18 = IMLogHandleForCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    sub_1D98FFFD8();
  }

  if (v15)
  {
    v19 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.Messages.AttachmentControllerErrorDomain" code:15 userInfo:0];
    (*((void (**)(id, id, void, void, void, void *, void, double, double))v15 + 2))(v15, v59, 0, 0, 0, v19, 0, 0.0, 0.0);
    BOOL v20 = 0;
LABEL_55:

    goto LABEL_56;
  }
  BOOL v20 = 0;
LABEL_56:

  return v20;
}

- (void)retrieveLocalFileTransfer:(id)a3 attachmentIndex:(unint64_t)a4 path:(id)a5 requestURLString:(id)a6 ownerID:(id)a7 signature:(id)a8 decryptionKey:(id)a9 requestedSize:(id)a10 fileSize:(unint64_t)a11 progressBlock:(id)a12 completionBlock:(id)a13
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v37 = a5;
  id v38 = a6;
  id v39 = a7;
  id v40 = a8;
  id v19 = a9;
  id v20 = a10;
  id v21 = a12;
  id v22 = a13;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL || ![v18 length])
  {
    if (IMOSLoggingEnabled())
    {
      v33 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v50 = a4;
        *(_WORD *)&v50[4] = 2112;
        *(void *)&v50[6] = v18;
        _os_log_impl(&dword_1D967A000, v33, OS_LOG_TYPE_INFO, "Trying to retrieve attachment at index: %u for transfer ID: %@, failing", buf, 0x12u);
      }
    }
    (*((void (**)(id, id, unint64_t, void, void, void, void))v22 + 2))(v22, v18, a4, 0, 0, 0, 0);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v23 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v50 = v18;
        _os_log_impl(&dword_1D967A000, v23, OS_LOG_TYPE_INFO, " Requesting file attachments for transfer %@", buf, 0xCu);
      }
    }
    v48[0] = v18;
    v47[0] = IMDRelayLocalMessageDictionaryGUIDKey;
    v47[1] = IMDRelayLocalMessageDictionaryAttachmentIndexKey;
    id v24 = [NSNumber numberWithUnsignedInteger:a4];
    v48[1] = v24;
    v47[2] = IMDRelayLocalMessageDictionarySupportsDirectMMCSDownloadKey;
    v48[2] = MEMORY[0x1E4F1CC38];
    v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:3];

    v45[0] = IMDRelayLocalMessageDictionaryTypeKey;
    v45[1] = IMDRelayLocalMessageDictionaryDictKey;
    v46[0] = IMDRelayLocalMessageTypeRemoteFileRequest;
    v46[1] = v35;
    id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:2];
    if ([(IMDServiceAttachmentController *)self sendToLocalPeers:v25])
    {
      if (!qword_1EA8CA460)
      {
        CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        uint64_t v27 = (void *)qword_1EA8CA460;
        qword_1EA8CA460 = (uint64_t)Mutable;
      }
      v28 = objc_msgSend(v18, "stringByAppendingFormat:", @"_%lu", a4);
      BOOL v29 = (void *)qword_1EA8CA460;
      uint64_t v30 = _Block_copy(v22);
      [v29 setObject:v30 forKey:v28];

      dispatch_time_t v31 = dispatch_time(0, 600000000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1D9716A10;
      block[3] = &unk_1E6B74108;
      id v42 = v28;
      id v43 = v18;
      unint64_t v44 = a4;
      id v32 = v28;
      dispatch_after(v31, MEMORY[0x1E4F14428], block);
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v34 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v50 = v18;
          _os_log_impl(&dword_1D967A000, v34, OS_LOG_TYPE_INFO, " Failed to send message to local device for Transfer %@, Failing", buf, 0xCu);
        }
      }
      (*((void (**)(id, id, unint64_t, void, void, void, void))v22 + 2))(v22, v18, a4, 0, 0, 0, 0);
    }
  }
}

- (void)remoteFileResponse:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v3;
      _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, " Incomming response for file attachment %@ ", buf, 0xCu);
    }
  }
  int v5 = [v3 objectForKeyedSubscript:IMDRelayLocalMessageDictionaryGUIDKey];
  v6 = [v3 objectForKeyedSubscript:IMDRelayLocalMessageDictionaryAttachmentIndexKey];
  uint64_t v7 = [v6 unsignedIntegerValue];

  objc_super v8 = [v3 objectForKeyedSubscript:IMDRelayLocalMessageDictionaryFileDataKey];
  v9 = [v3 objectForKeyedSubscript:@"error-code"];
  uint64_t v10 = [v9 integerValue];

  v11 = 0;
  if (v10) {
    BOOL v12 = v10 == 5;
  }
  else {
    BOOL v12 = 1;
  }
  uint64_t v13 = v12;
  if (v10 && v10 != 5)
  {
    v11 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F6DEF8] code:v10 userInfo:0];
  }
  if ([v5 length])
  {
    if (IMOSLoggingEnabled())
    {
      id v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        uint64_t v15 = [v8 length];
        *(_DWORD *)buf = 138413058;
        id v25 = v5;
        __int16 v26 = 2048;
        uint64_t v27 = v7;
        __int16 v28 = 2048;
        uint64_t v29 = v15;
        __int16 v30 = 2048;
        uint64_t v31 = v10;
        _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, " Incomming response for message %@ attachmentIndex %lu data of length %lu errorCode %lu", buf, 0x2Au);
      }
    }
    id v16 = objc_msgSend(v5, "stringByAppendingFormat:", @"_%lu", v7);
    int v17 = [(id)qword_1EA8CA460 objectForKey:v16];
    int v18 = IMOSLoggingEnabled();
    if (v17)
    {
      if (v18)
      {
        id v19 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, " Found completion block for attachment", buf, 2u);
        }
      }
      ((void (**)(void, void *, uint64_t, void, void *, uint64_t, void *))v17)[2](v17, v5, v7, 0, v8, v13, v11);
      [(id)qword_1EA8CA460 removeObjectForKey:v16];
    }
    else
    {
      if (v18)
      {
        id v20 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v25 = v16;
          _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, " No completion block for attachment found: %@", buf, 0xCu);
        }
      }
      if (IMOSLoggingEnabled())
      {
        id v21 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          id v22 = [(id)qword_1EA8CA460 allKeys];
          *(_DWORD *)buf = 138412290;
          id v25 = v22;
          _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "     In list of blocks: %@", buf, 0xCu);
        }
      }
    }
    if (![(id)qword_1EA8CA460 count])
    {
      v23 = (void *)qword_1EA8CA460;
      qword_1EA8CA460 = 0;
    }
  }
}

- (void)_sendAttachmentToPeerDevice:(unint64_t)a3 fileTransferGUID:(id)a4 messageGuid:(id)a5 fileURL:(id)a6 useLocalPeersFileAPI:(BOOL)a7 error:(int64_t)a8
{
  BOOL v9 = a7;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v30 = a4;
  id v32 = a5;
  id v13 = a6;
  if (IMOSLoggingEnabled())
  {
    id v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v38 = v30;
      __int16 v39 = 2048;
      int64_t v40 = a8;
      __int16 v41 = 2112;
      id v42 = v13;
      _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Forwarding Attachment with guid %@ to local peer. Error: %lu. fileURL %@", buf, 0x20u);
    }
  }
  uint64_t v15 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v16 = [v13 path];
  int v17 = [v15 attributesOfItemAtPath:v16 error:0];

  int v18 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F28390]];
  uint64_t v19 = [v18 longValue];

  int v20 = v19 > 0x100000 || v9;
  if (v20) {
    [MEMORY[0x1E4F1C9B8] data];
  }
  else {
  id v21 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v13];
  }
  v36[0] = v32;
  v35[0] = IMDRelayLocalMessageDictionaryGUIDKey;
  v35[1] = IMDRelayLocalMessageDictionaryAttachmentIndexKey;
  id v22 = [NSNumber numberWithUnsignedInteger:a3];
  v36[1] = v22;
  v35[2] = IMDRelayLocalMessageDictionaryFileDataKey;
  v23 = v21;
  if (!v21)
  {
    v23 = [MEMORY[0x1E4F1C9B8] data];
  }
  v36[2] = v23;
  v35[3] = @"error-code";
  id v24 = [NSNumber numberWithInteger:a8];
  v36[3] = v24;
  id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:4];

  if (!v21) {
  v33[0] = IMDRelayLocalMessageDictionaryDictKey;
  }
  v33[1] = IMDRelayLocalMessageDictionaryTypeKey;
  v34[0] = v25;
  v34[1] = IMDRelayLocalMessageTypeRemoteFileResponse;
  __int16 v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];
  if (v20)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v27 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v27, OS_LOG_TYPE_INFO, "Sending attachment with file url api", buf, 2u);
      }
    }
    [(IMDServiceAttachmentController *)self sendToLocalPeersFile:v13 dictionary:v26];
  }
  else
  {
    __int16 v28 = [(IMDServiceAttachmentController *)self localDeviceProductVersion];
    if (IMOSLoggingEnabled())
    {
      uint64_t v29 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v38 = v28;
        _os_log_impl(&dword_1D967A000, v29, OS_LOG_TYPE_INFO, "Using legacy api to send attachment running on product version: %@", buf, 0xCu);
      }
    }
    [(IMDServiceAttachmentController *)self sendToLocalPeers:v26];
  }
}

- (void)remotefileRequest:(id)a3 attempts:(int64_t)a4 shouldRetry:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v114 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  BOOL v9 = [v8 objectForKeyedSubscript:IMDRelayLocalMessageDictionaryGUIDKey];
  uint64_t v10 = [v8 objectForKeyedSubscript:IMDRelayLocalMessageDictionaryAttachmentIndexKey];
  unint64_t v83 = [v10 unsignedIntegerValue];

  uint64_t v108 = 0;
  uint64_t v109 = &v108;
  uint64_t v110 = 0x2020000000;
  char v111 = 0;
  v11 = [v8 objectForKeyedSubscript:@"send-file-url"];
  char v12 = [v11 BOOLValue];

  char v111 = v12;
  id v13 = [v8 objectForKeyedSubscript:IMDRelayLocalMessageDictionarySupportsDirectMMCSDownloadKey];
  int v14 = [v13 BOOLValue];

  if (IMOSLoggingEnabled())
  {
    uint64_t v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = @"NO";
      if (v5) {
        id v16 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v9;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v16;
      _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "Attempting to locate message with Message Guid %@ shouldRetry %@", buf, 0x16u);
    }
  }
  int v17 = +[IMDMessageStore sharedInstance];
  int v18 = [v17 itemWithGUID:v9];

  if (!v18)
  {
    if (IMOSLoggingEnabled())
    {
      id v24 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v9;
        _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, "Unable To locate Message with GUID %@, adding to pending requests to retry later", buf, 0xCu);
      }
    }
    id v23 = [(IMDServiceAttachmentController *)self pendingRemoteFileRequests];
    if (!v23)
    {
      id v23 = [MEMORY[0x1E4F1CA80] set];
      [(IMDServiceAttachmentController *)self setPendingRemoteFileRequests:v23];
    }
    [v23 addObject:v8];
    if (v5)
    {
      if (a4 <= 39)
      {
        if (IMOSLoggingEnabled())
        {
          id v25 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v9;
            _os_log_impl(&dword_1D967A000, v25, OS_LOG_TYPE_INFO, "Message with Guid  is not found %@, Retrying it a bit ", buf, 0xCu);
          }
        }
        id v84 = v8;
        im_dispatch_after();

        goto LABEL_88;
      }
      if (IMOSLoggingEnabled())
      {
        id v59 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v9;
          _os_log_impl(&dword_1D967A000, v59, OS_LOG_TYPE_INFO, "Message with Guid is not found %@, No retried remain ", buf, 0xCu);
        }
      }
    }
    uint64_t v55 = 1;
    goto LABEL_133;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v9;
      _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "Located Mesage with Message Guid %@", buf, 0xCu);
    }
  }
  int v20 = [(IMDServiceAttachmentController *)self pendingRemoteFileRequests];
  [v20 removeObject:v8];

  id v21 = [(IMDServiceAttachmentController *)self pendingRemoteFileRequests];
  BOOL v22 = [v21 count] == 0;

  if (v22) {
    [(IMDServiceAttachmentController *)self setPendingRemoteFileRequests:0];
  }
  if (![v18 type])
  {
    id v23 = v18;
    if ([v23 isFinished]) {
      goto LABEL_30;
    }
    if (a4 > 39)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v61 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v9;
          _os_log_impl(&dword_1D967A000, v61, OS_LOG_TYPE_INFO, "Message with Guid is unfinished %@, No retried remain ", buf, 0xCu);
        }
      }
      uint64_t v55 = 2;
      goto LABEL_133;
    }
    if (IMOSLoggingEnabled())
    {
      v58 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v9;
        _os_log_impl(&dword_1D967A000, v58, OS_LOG_TYPE_INFO, "Message with Guid  is unfinished %@, Retrying it a bit ", buf, 0xCu);
      }
    }
    uint64_t v101 = MEMORY[0x1E4F143A8];
    uint64_t v102 = 3221225472;
    __int16 v103 = sub_1D9718870;
    uint64_t v104 = &unk_1E6B74108;
    __int16 v105 = self;
    id v106 = v8;
    int64_t v107 = a4;
    im_dispatch_after();

LABEL_88:
    uint64_t v55 = 0;
    goto LABEL_133;
  }
  id v23 = 0;
LABEL_30:
  __int16 v26 = [v18 fileTransferGUIDs];

  if (!v26)
  {
    uint64_t v55 = 3;
    goto LABEL_133;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v27 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v9;
      _os_log_impl(&dword_1D967A000, v27, OS_LOG_TYPE_INFO, "Located message with guid %@ attachments,  ", buf, 0xCu);
    }
  }
  __int16 v28 = [v18 fileTransferGUIDs];
  BOOL v29 = v83 < [v28 count];

  if (v29)
  {
    id v30 = [v18 fileTransferGUIDs];
    uint64_t v81 = [v30 objectAtIndex:v83];

    if (IMOSLoggingEnabled())
    {
      uint64_t v31 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v81;
        _os_log_impl(&dword_1D967A000, v31, OS_LOG_TYPE_INFO, "Attempting to locate file transfer with guid %@ ", buf, 0xCu);
      }
    }
    id v32 = +[IMDFileTransferCenter sharedInstance];
    v82 = [v32 transferForGUID:v81];

    if (!v82)
    {
      if (IMOSLoggingEnabled())
      {
        v33 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v33, OS_LOG_TYPE_INFO, "Transfer not found in transfer center, checking attachment store", buf, 2u);
        }
      }
      v34 = +[IMDAttachmentStore sharedInstance];
      v82 = [v34 attachmentWithGUID:v81];

      if (!v82)
      {
        if (IMOSLoggingEnabled())
        {
          v70 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v9;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v81;
            _os_log_impl(&dword_1D967A000, v70, OS_LOG_TYPE_INFO, "Did not find file transfer for message GUID %@ transfer guid %@", buf, 0x16u);
          }
        }
        uint64_t v55 = 3;

        goto LABEL_132;
      }
    }
    if (IMOSLoggingEnabled())
    {
      v35 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v81;
        _os_log_impl(&dword_1D967A000, v35, OS_LOG_TYPE_INFO, "Located Transfer with Guid %@ ", buf, 0xCu);
      }
    }
    if (![v82 isFinished])
    {
      if (a4 > 39)
      {
        if (IMOSLoggingEnabled())
        {
          v62 = OSLogHandleForIMEventCategory();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v81;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v9;
            _os_log_impl(&dword_1D967A000, v62, OS_LOG_TYPE_INFO, "Transfer Guid %@ for Message with %@ is not yet complete, no retries remain ", buf, 0x16u);
          }
        }
        uint64_t v55 = 4;
        goto LABEL_131;
      }
      if (IMOSLoggingEnabled())
      {
        v60 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v81;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v9;
          _os_log_impl(&dword_1D967A000, v60, OS_LOG_TYPE_INFO, "Transfer Guid %@ for Message with %@ is not yet complete, Retrying it a bit ", buf, 0x16u);
        }
      }
      id v85 = v8;
      im_dispatch_after();

LABEL_130:
      uint64_t v55 = 0;
LABEL_131:

LABEL_132:
      goto LABEL_133;
    }
    if (IMOSLoggingEnabled())
    {
      v36 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v81;
        _os_log_impl(&dword_1D967A000, v36, OS_LOG_TYPE_INFO, "Located Completed transfer with %@ ", buf, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      id v37 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v37, OS_LOG_TYPE_INFO, "Attempting to transcode attachment for peer relay", buf, 2u);
      }
    }
    id v38 = +[IMDChatStore sharedInstance];
    __int16 v39 = [v38 chatsGUIDsForMessageWithGUID:v9];
    uint64_t v79 = [v39 lastObject];

    int64_t v40 = +[IMDChatStore sharedInstance];
    id v78 = [v40 chatWithGUID:v79];

    uint64_t v41 = [v78 isFiltered];
    uint64_t v42 = v14 ^ 1u;
    if (v41) {
      int v43 = v14 ^ 1;
    }
    else {
      int v43 = 1;
    }
    if (v43 == 1)
    {
      if (IMOSLoggingEnabled())
      {
        unint64_t v44 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          uint64_t v45 = [NSNumber numberWithBool:v41 == 0];
          v46 = [NSNumber numberWithBool:v42];
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v45;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v46;
          _os_log_impl(&dword_1D967A000, v44, OS_LOG_TYPE_INFO, "Attempting to transcode attachment for peer relay, this is a known sender (%@) or old watch (%@)", buf, 0x16u);
        }
      }
      inUTI = [v82 type];
      v47 = [v82 transcoderUserInfo];
      CFMutableDictionaryRef Mutable = (CFMutableDictionaryRef)[v47 mutableCopy];

      if (UTTypeConformsTo(inUTI, (CFStringRef)*MEMORY[0x1E4F22548]))
      {
        if (!Mutable) {
          CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        }
        if (IMOSLoggingEnabled())
        {
          v49 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D967A000, v49, OS_LOG_TYPE_INFO, "Found an a/v type, adding transcoder options to remove alpha and check for hevc+alpha", buf, 2u);
          }
        }
        v50 = [NSNumber numberWithBool:1];
        [(__CFDictionary *)Mutable setObject:v50 forKey:*MEMORY[0x1E4F6D3B0]];

        uint64_t v51 = [NSNumber numberWithBool:1];
        [(__CFDictionary *)Mutable setObject:v51 forKey:*MEMORY[0x1E4F6D378]];
      }
      BOOL v77 = +[IMDAttachmentUtilities shouldEnablePreviewTranscodingQualityForTransfer:v82 isSending:1];
      v52 = +[IMDAttachmentUtilities messageAttachmentSendableUTIs];
      v53 = [MEMORY[0x1E4F6EBE0] sharedInstance];
      id v54 = [v82 localURL];
      unsigned int v76 = [v82 isSticker];
      v94[0] = MEMORY[0x1E4F143A8];
      v94[1] = 3221225472;
      v94[2] = sub_1D9718888;
      v94[3] = &unk_1E6B74F80;
      id v95 = v82;
      id v96 = self;
      v99 = &v108;
      unint64_t v100 = v83;
      id v97 = v81;
      id v98 = v9;
      LOBYTE(v75) = v77;
      [v53 transcodeFileTransferContents:v54 utiType:inUTI isSticker:v76 allowUnfilteredUTIs:v52 target:0 sizes:&unk_1F33C5FB8 commonCapabilities:0 maxDimension:-1 transcoderUserInfo:Mutable representations:0 isLQMEnabled:v75 completionBlock:v94];

      goto LABEL_129;
    }
    uint64_t v63 = [v82 type];
    BOOL v64 = v63 == 0;

    if (v64) {
      goto LABEL_139;
    }
    v65 = (void *)MEMORY[0x1E4F442D8];
    id v66 = [v82 type];
    inUTI = [v65 typeWithIdentifier:v66];

    if ([(__CFString *)inUTI conformsToType:*MEMORY[0x1E4F44400]])
    {
      uint64_t v67 = [v82 localURL];
      char v68 = IMFileURLIsActuallyAnimated();

      if ((v68 & 1) == 0)
      {
        uint64_t v113 = 0;
        memset(buf, 0, sizeof(buf));
        IMPreviewConstraintsZero();
        *(_OWORD *)buf = xmmword_1D991CE10;
        *(_OWORD *)&buf[16] = xmmword_1D991CE20;
        LOBYTE(v113) = [v82 isSticker];
        BYTE2(v113) = [v82 isAdaptiveImageGlyph];
        BYTE1(v113) = 0;
        uint64_t v73 = [MEMORY[0x1E4F6EBE0] sharedInstance];
        v74 = [v82 localURL];
        v88[0] = MEMORY[0x1E4F143A8];
        v88[1] = 3221225472;
        v88[2] = sub_1D9718D94;
        v88[3] = &unk_1E6B74FA8;
        v88[4] = self;
        unint64_t v93 = v83;
        id v89 = v81;
        id v90 = v9;
        id v92 = &v108;
        id v91 = v82;
        v86[0] = *(_OWORD *)buf;
        v86[1] = *(_OWORD *)&buf[16];
        uint64_t v87 = v113;
        [v73 generateSafeRender:v74 constraints:v86 completionBlock:v88];

        goto LABEL_129;
      }
    }
    if (!inUTI)
    {
LABEL_139:
      if (IMOSLoggingEnabled())
      {
        v71 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v71, OS_LOG_TYPE_INFO, "File safe render failed for Peer Relay because the filetype was not found", buf, 2u);
        }
      }
      inUTI = 0;
    }
    else if (IMOSLoggingEnabled())
    {
      uint64_t v69 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = inUTI;
        _os_log_impl(&dword_1D967A000, v69, OS_LOG_TYPE_INFO, "File safe render failed for Peer Relay because the filetype was not supported: %@", buf, 0xCu);
      }
    }
    id v72 = [v82 localURL];
    [(IMDServiceAttachmentController *)self _sendAttachmentToPeerDevice:v83 fileTransferGUID:v81 messageGuid:v9 fileURL:v72 useLocalPeersFileAPI:*((unsigned __int8 *)v109 + 24) error:5];

LABEL_129:
    goto LABEL_130;
  }
  if (IMOSLoggingEnabled())
  {
    id v56 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
    {
      v57 = [v18 fileTransferGUIDs];
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = v83;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v57;
      _os_log_impl(&dword_1D967A000, v56, OS_LOG_TYPE_INFO, "Attachment index out of bounds. attachment index: %lu file transfer guids: %@", buf, 0x16u);
    }
  }
  uint64_t v55 = 6;
LABEL_133:

  if (v55) {
    [(IMDServiceAttachmentController *)self _sendAttachmentToPeerDevice:v83 fileTransferGUID:0 messageGuid:v9 fileURL:0 useLocalPeersFileAPI:*((unsigned __int8 *)v109 + 24) error:v55];
  }

  _Block_object_dispose(&v108, 8);
}

- (BOOL)sendToLocalPeers:(id)a3
{
  return 0;
}

- (BOOL)sendToLocalPeersFile:(id)a3 dictionary:(id)a4
{
  return 0;
}

- (id)localDeviceProductVersion
{
  return @"unknown";
}

- (IMDServiceSession)session
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);

  return (IMDServiceSession *)WeakRetained;
}

- (NSMutableSet)pendingRemoteFileRequests
{
  return self->_pendingRemoteFileRequests;
}

- (void)setPendingRemoteFileRequests:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingRemoteFileRequests, 0);

  objc_destroyWeak((id *)&self->_session);
}

@end
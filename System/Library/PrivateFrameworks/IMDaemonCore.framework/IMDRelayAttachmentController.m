@interface IMDRelayAttachmentController
- (BOOL)shouldSendLowResolutionOnly;
- (IMDRelayAttachmentController)initWithSession:(id)a3;
- (IMDServiceSession)session;
- (NSMutableDictionary)peerCompletionBlocks;
- (NSMutableSet)pendingRemoteFileRequests;
- (id)_existingStoredMessageWithCompletedTransfersForMessageGUID:(id)a3;
- (id)_plainTextPartWithString:(id)a3 index:(int64_t)a4;
- (int64_t)transcodeTargetType;
- (void)_sendFileURL:(id)a3 forMessageGUID:(id)a4 attachmentIndex:(int64_t)a5;
- (void)_sizeLimitsForTransfer:(id)a3 bigSize:(unint64_t *)a4 smallSize:(unint64_t *)a5;
- (void)processAttachmentsForMessage:(id)a3 generateTextParts:(BOOL)a4 lastAddressedHandle:(id)a5 lastAddressedSIMID:(id)a6 completionBlock:(id)a7;
- (void)processAttachmentsForPeerRelayForMessage:(id)a3 lastAddressHandle:(id)a4 lastAddressedSIMID:(id)a5 completionBlock:(id)a6 uploadFailureBlock:(id)a7;
- (void)remoteFileResponse:(id)a3;
- (void)remotefileRequest:(id)a3 attempts:(int64_t)a4;
- (void)retrieveAttachmentsForMessage:(id)a3 ignoreStoredTransfers:(BOOL)a4 displayID:(id)a5 token:(id)a6 completionBlock:(id)a7;
- (void)retrieveLocalFileTransfer:(id)a3 attachmentIndex:(unint64_t)a4 path:(id)a5 requestURLString:(id)a6 ownerID:(id)a7 signature:(id)a8 decryptionKey:(id)a9 requestedSize:(id)a10 fileSize:(unint64_t)a11 progressBlock:(id)a12 completionBlock:(id)a13;
- (void)setPeerCompletionBlocks:(id)a3;
- (void)setPendingRemoteFileRequests:(id)a3;
@end

@implementation IMDRelayAttachmentController

- (int64_t)transcodeTargetType
{
  v2 = [(IMDRelayAttachmentController *)self session];
  v3 = [v2 service];
  int64_t v4 = [v3 transcodeTarget];

  return v4;
}

- (void)processAttachmentsForMessage:(id)a3 generateTextParts:(BOOL)a4 lastAddressedHandle:(id)a5 lastAddressedSIMID:(id)a6 completionBlock:(id)a7
{
  BOOL v73 = a4;
  v139[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v79 = a5;
  id v83 = a6;
  id v72 = a7;
  group = dispatch_group_create();
  v91 = v10;
  v11 = [v10 fileTransferGUIDs];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    v13 = [(IMDRelayAttachmentController *)self session];
    uint64_t v14 = [v13 maxSizePerAttachmentWithCount:v12 lastAddressedHandle:v79 lastAddressedSIMID:v83];
  }
  else
  {
    if (_IMWillLog()) {
      _IMAlwaysLog();
    }
    uint64_t v14 = 0;
  }
  uint64_t v135 = 0;
  v136 = &v135;
  uint64_t v137 = 0x2020000000;
  char v138 = 0;
  uint64_t v129 = 0;
  v130 = &v129;
  uint64_t v131 = 0x3032000000;
  v132 = sub_1D96C0F1C;
  v133 = sub_1D96C0F2C;
  id v134 = 0;
  id v134 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v15 = [v10 body];
  if (_IMWillLog()) {
    _IMAlwaysLog();
  }
  v16 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v17 = [v16 isPriusCompatibilityEnabled];

  if (v17)
  {
    v18 = [v91 threadIdentifier];
    BOOL v19 = [v18 length] && v73;

    if (v19)
    {
      if (_IMWillLog())
      {
        v67 = [v91 guid];
        _IMAlwaysLog();
      }
      v20 = IMSharedUtilitiesFrameworkBundle();
      v21 = [v20 localizedStringForKey:@"REPLIED_BACKWARD_COMPATIBILITY" value:&stru_1F3398578 table:@"IMSharedUtilities"];

      v22 = -[IMDRelayAttachmentController _plainTextPartWithString:index:](self, "_plainTextPartWithString:index:", v21, [(id)v130[5] count]);
      if (v22) {
        [(id)v130[5] addObject:v22];
      }
    }
  }
  v23 = +[IMDFileTransferCenter sharedInstance];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1D96C0F34;
  aBlock[3] = &unk_1E6B73628;
  id v69 = v23;
  id v128 = v69;
  v24 = _Block_copy(aBlock);
  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v27 = [v15 length];
  uint64_t v28 = *MEMORY[0x1E4F6C1F8];
  v120[0] = MEMORY[0x1E4F143A8];
  v120[1] = 3221225472;
  v120[2] = sub_1D96C0F40;
  v120[3] = &unk_1E6B73670;
  id v121 = v15;
  v125 = &v129;
  id v29 = v25;
  id v122 = v29;
  id v80 = v26;
  id v123 = v80;
  BOOL v126 = v73;
  id v70 = v121;
  id v71 = v24;
  id v124 = v71;
  objc_msgSend(v121, "enumerateAttribute:inRange:options:usingBlock:", v28, 0, v27, 0, v120);
  if (!v73)
  {
    v116[0] = MEMORY[0x1E4F143A8];
    v116[1] = 3221225472;
    v116[2] = sub_1D96C13C0;
    v116[3] = &unk_1E6B73698;
    v119 = &v129;
    id v117 = v29;
    id v118 = v80;
    objc_msgSend(v70, "__im_enumerateAdaptiveImageGlyphFileTransfersUsingFileTransferProvider:block:", v71, v116);
  }
  char v30 = 0;
  unint64_t v31 = 0;
  key = (void *)*MEMORY[0x1E4F6E430];
  v76 = (void *)*MEMORY[0x1E4F6E438];
  v74 = (void *)*MEMORY[0x1E4F6D460];
  double v32 = (double)v14 * 0.92;
  uint64_t v75 = *MEMORY[0x1E4F6EBD8];
  while (v31 < [v29 count])
  {
    v33 = [v29 objectAtIndexedSubscript:v31];
    uint64_t v84 = [v33 integerValue];

    v34 = [v80 objectAtIndexedSubscript:v31];
    v35 = +[IMDFileTransferCenter sharedInstance];
    v94 = [v35 transferForGUID:v34];
    [v35 startTransfer:v34];
    [v35 endTransfer:v34];
    v36 = [v91 accountID];
    v37 = [v91 handle];
    if (v37)
    {
      v87 = [v91 handle];
      v38 = v87;
    }
    else
    {
      v38 = 0;
    }
    [v35 assignTransfer:v34 toAccount:v36 otherPerson:v38];
    if (v37) {

    }
    v93 = [v94 localPath];
    v89 = [v94 type];
    if (_IMWillLog())
    {
      v68 = v93;
      _IMAlwaysLog();
    }
    uint64_t v88 = objc_msgSend(v93, "length", v68);
    if (v88)
    {
      dispatch_group_enter(group);
      v90 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v93];
      v39 = [v90 pathExtension];
      if ([v39 length])
      {
        v82 = v39;
      }
      else
      {
        v41 = [MEMORY[0x1E4F6C348] defaultHFSFileManager];
        v42 = [v94 type];
        v43 = [v41 pathExtensionForUTIType:v42];

        if ([v43 length])
        {
          v44 = v43;
        }
        else
        {
          v45 = [MEMORY[0x1E4F6C348] defaultHFSFileManager];
          v46 = [v94 mimeType];
          uint64_t v47 = [v45 pathExtensionForMIMEType:v46];

          v44 = (void *)v47;
        }
        v82 = v44;
        if ([v44 length])
        {
          v48 = [v90 absoluteString];
          v49 = [v48 stringByDeletingPathExtension];

          v50 = [v49 stringByAppendingPathExtension:v82];

          if ([v50 length])
          {
            uint64_t v51 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v50];

            v90 = (void *)v51;
          }
        }
      }
      if (v90)
      {
        v52 = [MEMORY[0x1E4F28CB8] defaultManager];
        v53 = objc_msgSend(v52, "im_generateCopyForURL:", v90);
      }
      else
      {
        v53 = 0;
      }
      v54 = [v94 transcoderUserInfo];
      theDict = (__CFDictionary *)[v54 mutableCopy];

      if (!theDict) {
        theDict = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      }
      id v55 = v79;
      if (v79) {
        CFDictionarySetValue(theDict, key, v55);
      }

      id v56 = v83;
      if (v83) {
        CFDictionarySetValue(theDict, v76, v56);
      }

      v85 = v35;
      v86 = v34;
      if ([v94 isAdaptiveImageGlyph]) {
        CFDictionarySetValue(theDict, v74, MEMORY[0x1E4F1CC38]);
      }
      v57 = v90;
      if (v53) {
        v57 = v53;
      }
      id v58 = v57;
      v59 = [NSNumber numberWithDouble:v32];
      v139[0] = v59;
      v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:v139 count:1];

      v61 = [MEMORY[0x1E4F6EBE0] sharedInstance];
      uint64_t v62 = [v94 isSticker];
      v63 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"public.3gpp", @"public.3gp", @"public.png", @"public.jpg", @"public.jpeg", 0);
      int64_t v64 = [(IMDRelayAttachmentController *)self transcodeTargetType];
      uint64_t v100 = MEMORY[0x1E4F143A8];
      uint64_t v101 = 3221225472;
      v102 = sub_1D96C1478;
      v103 = &unk_1E6B736C0;
      id v104 = v58;
      id v105 = v60;
      id v106 = v89;
      uint64_t v115 = v84;
      id v107 = v94;
      v113 = &v129;
      id v108 = v85;
      id v109 = v86;
      id v110 = v91;
      v114 = &v135;
      id v111 = v53;
      v112 = group;
      v68 = 0;
      objc_msgSend(v61, "transcodeFileTransferContents:utiType:isSticker:allowUnfilteredUTIs:target:sizes:commonCapabilities:maxDimension:transcoderUserInfo:representations:isLQMEnabled:completionBlock:", v104, v106, v62, v63, v64, v105);

      v35 = v85;
      v34 = v86;

      char v30 = 1;
      v40 = v90;
    }
    else
    {
      *((unsigned char *)v136 + 24) = 1;
      v40 = [MEMORY[0x1E4F28C58] errorWithDomain:v75 code:-2 userInfo:0];
      _IMWarn();
      objc_msgSend(v35, "failTransfer:error:", v34, v40, v93, v94, v40);
    }

    ++v31;
    if (!v88) {
      goto LABEL_69;
    }
  }
  v65 = [v91 expressiveSendStyleID];
  if ([v65 length] && objc_msgSend((id)v130[5], "count"))
  {

    if (!v73) {
      goto LABEL_65;
    }
    if (_IMWillLog())
    {
      v68 = [v91 guid];
      _IMAlwaysLog();
    }
    v65 = objc_msgSend(v91, "_localizedBackwardsCompatibleExpressiveSendText", v68);
    v66 = -[IMDRelayAttachmentController _plainTextPartWithString:index:](self, "_plainTextPartWithString:index:", v65, [(id)v130[5] count]);
    if (v66) {
      [(id)v130[5] addObject:v66];
    }
  }
LABEL_65:
  if (v30)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1D96C1F04;
    block[3] = &unk_1E6B736E8;
    id v96 = v91;
    v98 = &v135;
    id v97 = v72;
    v99 = &v129;
    dispatch_group_notify(group, MEMORY[0x1E4F14428], block);
  }
  else if (v72)
  {
    (*((void (**)(id, void *, BOOL, uint64_t, void))v72 + 2))(v72, v91, *((unsigned char *)v136 + 24) == 0, v130[5], 0);
  }
LABEL_69:

  _Block_object_dispose(&v129, 8);
  _Block_object_dispose(&v135, 8);
}

- (id)_plainTextPartWithString:(id)a3 index:(int64_t)a4
{
  id v5 = a3;
  if ([v5 length])
  {
    v6 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    CFDictionarySetValue(v6, @"Type", @"text/plain");
    v7 = [v5 dataUsingEncoding:4];
    if (v7) {
      CFDictionarySetValue(v6, @"Data", v7);
    }

    if (@"text") {
      CFDictionarySetValue(v6, @"Tag", @"text");
    }
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"text_%d.txt", a4);
    if (v8) {
      CFDictionarySetValue(v6, @"Path", v8);
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (IMDRelayAttachmentController)initWithSession:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMDRelayAttachmentController;
  v6 = [(IMDRelayAttachmentController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_session, a3);
  }

  return v7;
}

- (BOOL)shouldSendLowResolutionOnly
{
  return MEMORY[0x1F4123B38](self, a2);
}

- (void)_sizeLimitsForTransfer:(id)a3 bigSize:(unint64_t *)a4 smallSize:(unint64_t *)a5
{
  id v6 = [a3 type];
  id v5 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:1];
  IMiMessageSizeLimitsForTransferType();
}

- (void)processAttachmentsForPeerRelayForMessage:(id)a3 lastAddressHandle:(id)a4 lastAddressedSIMID:(id)a5 completionBlock:(id)a6 uploadFailureBlock:(id)a7
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v35 = a4;
  id v36 = a5;
  id v37 = a6;
  id v42 = a7;
  if (IMOSLoggingEnabled())
  {
    uint64_t v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "AttachmentController: Told To Transcode and upload Parts of a Message to MMCS ", buf, 2u);
    }
  }
  id v43 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v38 = [v11 fileTransferGUIDs];
  if ([v38 count])
  {
    v13 = [v11 fileTransferGUIDs];
    uint64_t v14 = [v13 count];

    v15 = [(IMDRelayAttachmentController *)self session];
    uint64_t v40 = [v15 maxSizePerAttachmentWithCount:v14 lastAddressedHandle:v35 lastAddressedSIMID:v36];

    v16 = +[IMDFileTransferCenter sharedInstance];
    uint64_t v78 = 0;
    id v79 = &v78;
    uint64_t v80 = 0x2020000000;
    char v81 = 1;
    uint64_t v74 = 0;
    uint64_t v75 = &v74;
    uint64_t v76 = 0x2020000000;
    int v77 = 0;
    group = dispatch_group_create();
    id v41 = objc_alloc_init(MEMORY[0x1E4F28CA0]);
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id obj = v38;
    uint64_t v17 = [obj countByEnumeratingWithState:&v70 objects:v86 count:16];
    if (v17)
    {
      char v18 = 0;
      uint64_t v44 = *(void *)v71;
      do
      {
        uint64_t v45 = v17;
        for (uint64_t i = 0; i != v45; ++i)
        {
          if (*(void *)v71 != v44) {
            objc_enumerationMutation(obj);
          }
          uint64_t v20 = *(void *)(*((void *)&v70 + 1) + 8 * i);
          v21 = objc_msgSend(v16, "transferForGUID:", v20, v35);
          if (v21)
          {
            dispatch_group_enter(group);
            [v21 _setNeedsWrapper:0];
            [v16 startTransfer:v20];
            [v16 endTransfer:v20];
            v22 = [v11 accountID];
            v23 = [v11 handle];
            if (v23)
            {
              a4 = [v11 handle];
              id v24 = a4;
            }
            else
            {
              id v24 = 0;
            }
            [v16 assignTransfer:v20 toAccount:v22 otherPerson:v24];
            if (v23) {

            }
            uint64_t v68 = 0;
            uint64_t v69 = 0;
            [(IMDRelayAttachmentController *)self _sizeLimitsForTransfer:v21 bigSize:&v69 smallSize:&v68];
            if (IMOSLoggingEnabled())
            {
              id v26 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&buf[4] = v69;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v68;
                _os_log_impl(&dword_1D967A000, v26, OS_LOG_TYPE_INFO, "Big size: %d    Small Size: %d", buf, 0xEu);
              }
            }
            aBlock[0] = MEMORY[0x1E4F143A8];
            aBlock[1] = 3221225472;
            aBlock[2] = sub_1D96E1484;
            aBlock[3] = &unk_1E6B74040;
            id v27 = v21;
            id v57 = v27;
            id v58 = self;
            uint64_t v67 = v40;
            id v59 = v16;
            uint64_t v60 = v20;
            v65 = &v74;
            v66 = &v78;
            v61 = group;
            id v64 = v42;
            id v62 = v11;
            id v63 = v43;
            uint64_t v28 = (void (**)(void *, void *))_Block_copy(aBlock);
            id v29 = [v27 localURL];
            id v55 = 0;
            [v41 coordinateReadingItemAtURL:v29 options:0 error:&v55 byAccessor:v28];
            id v30 = v55;

            if (v30)
            {
              if (IMOSLoggingEnabled())
              {
                unint64_t v31 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
                {
                  double v32 = [v27 localURL];
                  *(_DWORD *)buf = 138412546;
                  *(void *)&buf[4] = v32;
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v30;
                  _os_log_impl(&dword_1D967A000, v31, OS_LOG_TYPE_INFO, "Failed coordinated read of: %@  (Error: %@)", buf, 0x16u);
                }
              }
              v33 = [v27 localURL];
              v28[2](v28, v33);
            }
            char v18 = 1;
          }
          else
          {
            if (IMOSLoggingEnabled())
            {
              id v25 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&buf[4] = v20;
                _os_log_impl(&dword_1D967A000, v25, OS_LOG_TYPE_INFO, "No transfer found for guid: %@", buf, 0xCu);
              }
            }
            *((unsigned char *)v79 + 24) = 0;
            *((_DWORD *)v75 + 6) = 34;
          }
        }
        uint64_t v17 = [obj countByEnumeratingWithState:&v70 objects:v86 count:16];
      }
      while (v17);

      if (v18)
      {
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        id v83 = sub_1D96E34AC;
        uint64_t v84 = sub_1D96E34BC;
        id v85 = 0;
        id v85 = (id)[objc_alloc(MEMORY[0x1E4F6C3B0]) initWithIdentifier:@"OutgoingMessagesPowerAssertion" timeout:120.0];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = sub_1D96E34C4;
        block[3] = &unk_1E6B74068;
        id v49 = obj;
        v52 = &v78;
        id v51 = v37;
        id v50 = v43;
        v53 = &v74;
        v54 = buf;
        dispatch_group_notify(group, MEMORY[0x1E4F14428], block);

        _Block_object_dispose(buf, 8);
      }
    }
    else
    {
    }
    _Block_object_dispose(&v74, 8);
    _Block_object_dispose(&v78, 8);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v34 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v34, OS_LOG_TYPE_INFO, "AttachmentController: Told To Transcode but the message had no parts, don't wake me up. ", buf, 2u);
      }
    }
    if (v37) {
      (*((void (**)(id, id, uint64_t, void))v37 + 2))(v37, v43, 1, 0);
    }
  }
}

- (void)retrieveAttachmentsForMessage:(id)a3 ignoreStoredTransfers:(BOOL)a4 displayID:(id)a5 token:(id)a6 completionBlock:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v16 = [v12 fileTransferGUIDs];
  uint64_t v17 = [v16 count];

  if (v17)
  {
    if (a4)
    {
      if (IMOSLoggingEnabled())
      {
        char v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          BOOL v19 = "   Ignoring existing transfers.";
LABEL_19:
          _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, v19, buf, 2u);
          goto LABEL_20;
        }
        goto LABEL_20;
      }
      goto LABEL_21;
    }
    uint64_t v20 = [v12 guid];
    v21 = [(IMDRelayAttachmentController *)self _existingStoredMessageWithCompletedTransfersForMessageGUID:v20];

    int v22 = IMOSLoggingEnabled();
    if (!v21)
    {
      if (v22)
      {
        char v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          BOOL v19 = "   We don't have all the attachments yet, we'll just re-download.";
          goto LABEL_19;
        }
LABEL_20:
      }
LABEL_21:
      if (IMOSLoggingEnabled())
      {
        id v24 = OSLogHandleForIMEventCategory();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, "Starting network availablity check...", buf, 2u);
        }
      }
      id v25 = [MEMORY[0x1E4F6C3E0] sharedInstance];
      if ([v25 isScreenLit]) {
        uint64_t v26 = 0;
      }
      else {
        uint64_t v26 = 9;
      }

      *(void *)buf = 0;
      v39 = buf;
      uint64_t v40 = 0x3032000000;
      id v41 = sub_1D96E34AC;
      id v42 = sub_1D96E34BC;
      id v43 = 0;
      id v27 = objc_alloc(MEMORY[0x1E4F6C390]);
      uint64_t v30 = MEMORY[0x1E4F143A8];
      uint64_t v31 = 3221225472;
      double v32 = sub_1D96E3A0C;
      v33 = &unk_1E6B740E0;
      id v37 = buf;
      id v34 = v12;
      id v35 = v13;
      id v36 = v15;
      uint64_t v28 = [v27 initWithFlags:3 options:v26 timeout:&v30 wifiTimeout:20.0 completionBlock:5.0];
      id v29 = (void *)*((void *)v39 + 5);
      *((void *)v39 + 5) = v28;

      objc_msgSend(*((id *)v39 + 5), "start", v30, v31, v32, v33);
      _Block_object_dispose(buf, 8);

      goto LABEL_29;
    }
    if (v22)
    {
      v23 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v23, OS_LOG_TYPE_INFO, "   We already have all these transfers, just moving along as a success!", buf, 2u);
      }
    }
    if (v15) {
      (*((void (**)(id, void *, id, uint64_t, void))v15 + 2))(v15, v21, v13, 1, 0);
    }
  }
  else if (v15)
  {
    (*((void (**)(id, id, id, uint64_t, void))v15 + 2))(v15, v12, v13, 1, 0);
  }
LABEL_29:
}

- (id)_existingStoredMessageWithCompletedTransfersForMessageGUID:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v26 = a3;
  v3 = +[IMDMessageStore sharedInstance];
  id v27 = [v3 messageWithGUID:v26];

  int64_t v4 = v27;
  if (v27)
  {
    if (IMOSLoggingEnabled())
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v35 = v27;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Found already stored message: %@", buf, 0xCu);
      }

      int64_t v4 = v27;
    }
    id v6 = [(__CFString *)v4 fileTransferGUIDs];
    uint64_t v7 = [v6 count];
    BOOL v8 = v7 != 0;

    if (IMOSLoggingEnabled())
    {
      objc_super v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        id v10 = @"NO";
        if (v7) {
          id v10 = @"YES";
        }
        *(_DWORD *)buf = 138412290;
        id v35 = v10;
        _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "   ==> Has attachments present: %@", buf, 0xCu);
      }
    }
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id obj = [(__CFString *)v27 fileTransferGUIDs];
    uint64_t v11 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v30 != v12) {
            objc_enumerationMutation(obj);
          }
          id v14 = *(__CFString **)(*((void *)&v29 + 1) + 8 * i);
          id v15 = +[IMDFileTransferCenter sharedInstance];
          v16 = [v15 transferForGUID:v14];

          if (v16)
          {
            uint64_t v17 = [v16 localURL];
            if (!v17
              || ([MEMORY[0x1E4F28CB8] defaultManager],
                  char v18 = objc_claimAutoreleasedReturnValue(),
                  [(__CFString *)v17 path],
                  BOOL v19 = objc_claimAutoreleasedReturnValue(),
                  char v20 = [v18 fileExistsAtPath:v19],
                  v19,
                  v18,
                  (v20 & 1) == 0))
            {
              if (IMOSLoggingEnabled())
              {
                v21 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  id v35 = v17;
                  _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "   ==> Missing an attachment at path: %@", buf, 0xCu);
                }
              }
              BOOL v8 = 0;
            }
          }
          else
          {
            if (IMOSLoggingEnabled())
            {
              int v22 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                id v35 = v14;
                _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "   ==> Missing a transfer for guid: %@", buf, 0xCu);
              }
            }
            BOOL v8 = 0;
          }
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v11);
    }

    int64_t v4 = v27;
    if (v8) {
      v23 = v27;
    }
    else {
      v23 = 0;
    }
    id v24 = v23;
  }
  else
  {
    id v24 = 0;
  }

  return v24;
}

- (void)retrieveLocalFileTransfer:(id)a3 attachmentIndex:(unint64_t)a4 path:(id)a5 requestURLString:(id)a6 ownerID:(id)a7 signature:(id)a8 decryptionKey:(id)a9 requestedSize:(id)a10 fileSize:(unint64_t)a11 progressBlock:(id)a12 completionBlock:(id)a13
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v43 = a3;
  id v36 = a5;
  id v37 = a6;
  id v38 = a7;
  id v39 = a8;
  unint64_t v19 = a4;
  id v40 = a9;
  id v41 = a10;
  id v42 = a12;
  id v20 = a13;
  if (IMOSLoggingEnabled())
  {
    v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v49 = v43;
      _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, " Requesting file attachments for transfer %@", buf, 0xCu);
    }
  }
  v47[0] = v43;
  v46[0] = IMDRelayLocalMessageDictionaryGUIDKey;
  v46[1] = IMDRelayLocalMessageDictionaryAttachmentIndexKey;
  int v22 = [NSNumber numberWithUnsignedInteger:a4];
  v47[1] = v22;
  v46[2] = IMDRelayLocalMessageDictionarySupportsDirectMMCSDownloadKey;
  v47[2] = MEMORY[0x1E4F1CC38];
  v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:3];

  id v24 = JWEncodeDictionary();
  id v25 = (void *)[v24 _FTCopyGzippedData];
  v44[0] = IMDRelayLocalMessageDictionaryTypeKey;
  v44[1] = IMDRelayLocalMessageDictionaryDictKey;
  v45[0] = IMDRelayLocalMessageTypeRemoteFileRequest;
  v45[1] = v25;
  id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:2];
  id v27 = +[IMDRelayServiceController sharedInstance];
  int v28 = [v27 sendToLocalPeers:v26];

  if (v28)
  {
    peerCompletionBlocks = self->_peerCompletionBlocks;
    if (!peerCompletionBlocks)
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      long long v32 = self->_peerCompletionBlocks;
      p_peerCompletionBlocks = &self->_peerCompletionBlocks;
      *p_peerCompletionBlocks = (NSMutableDictionary *)Mutable;

      peerCompletionBlocks = *p_peerCompletionBlocks;
    }
    v33 = _Block_copy(v20);
    id v34 = objc_msgSend(v43, "stringByAppendingFormat:", @"_%lu", v19);
    [(NSMutableDictionary *)peerCompletionBlocks setObject:v33 forKey:v34];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v35 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v49 = v43;
        _os_log_impl(&dword_1D967A000, v35, OS_LOG_TYPE_INFO, " Failed to send message to local device for Transfer %@, Failing", buf, 0xCu);
      }
    }
    (*((void (**)(id, id, unint64_t, void, void, void, void))v20 + 2))(v20, v43, v19, 0, 0, 0, 0);
  }
}

- (void)_sendFileURL:(id)a3 forMessageGUID:(id)a4 attachmentIndex:(int64_t)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  BOOL v8 = (__CFString *)a4;
  objc_super v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v10 = [v7 path];
  uint64_t v11 = [v9 attributesOfItemAtPath:v10 error:0];

  uint64_t v12 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F28390]];
  uint64_t v13 = [v12 longValue];

  if (v13 > 0x100000) {
    [MEMORY[0x1E4F1C9B8] data];
  }
  else {
  id v14 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v7];
  }
  if (IMOSLoggingEnabled())
  {
    id v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v36 = v8;
      __int16 v37 = 2048;
      int64_t v38 = a5;
      __int16 v39 = 2112;
      id v40 = v7;
      _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "Forwarding Attachment (%@, %ld) to local peer. Filepath %@", buf, 0x20u);
    }
  }
  v34[0] = v8;
  v33[0] = IMDRelayLocalMessageDictionaryGUIDKey;
  v33[1] = IMDRelayLocalMessageDictionaryAttachmentIndexKey;
  v16 = [NSNumber numberWithInteger:a5];
  v34[1] = v16;
  v33[2] = IMDRelayLocalMessageDictionaryFileDataKey;
  uint64_t v17 = v14;
  if (!v14)
  {
    uint64_t v17 = [MEMORY[0x1E4F1C9B8] data];
  }
  v34[2] = v17;
  char v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:3];
  if (!v14) {

  }
  BOOL v19 = v13 <= 0x100000;
  id v20 = JWEncodeDictionary();
  v21 = (void *)[v20 _FTCopyGzippedData];
  v31[0] = IMDRelayLocalMessageDictionaryDictKey;
  v31[1] = IMDRelayLocalMessageDictionaryTypeKey;
  v32[0] = v21;
  v32[1] = IMDRelayLocalMessageTypeRemoteFileResponse;
  int v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];
  int v23 = IMOSLoggingEnabled();
  if (v19)
  {
    if (v23)
    {
      id v24 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, "Using legacy api to send attachment", buf, 2u);
      }
    }
    id v25 = +[IMDRelayServiceController sharedInstance];
    int v26 = [v25 sendToLocalPeers:v22];

    if (IMOSLoggingEnabled())
    {
      id v27 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        int v28 = @"NO";
        if (v26) {
          int v28 = @"YES";
        }
        *(_DWORD *)buf = 138412290;
        id v36 = v28;
        _os_log_impl(&dword_1D967A000, v27, OS_LOG_TYPE_INFO, "Got success? %@", buf, 0xCu);
      }
    }
  }
  else
  {
    if (v23)
    {
      long long v29 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v29, OS_LOG_TYPE_INFO, "Sending attachment with file url api", buf, 2u);
      }
    }
    long long v30 = +[IMDRelayServiceController sharedInstance];
    [v30 sendFileToLocalPeers:v7 metadata:v22];
  }
}

- (void)remotefileRequest:(id)a3 attempts:(int64_t)a4
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 objectForKeyedSubscript:IMDRelayLocalMessageDictionaryGUIDKey];
  BOOL v8 = [v6 objectForKeyedSubscript:IMDRelayLocalMessageDictionaryAttachmentIndexKey];
  unint64_t v9 = [v8 unsignedIntegerValue];

  id v10 = [v6 objectForKeyedSubscript:IMDRelayLocalMessageDictionarySupportsDirectMMCSDownloadKey];
  int v11 = [v10 BOOLValue];

  if (IMOSLoggingEnabled())
  {
    uint64_t v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v7;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v9;
      _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Attempting to locate message with Message Guid %@ and index %lu", buf, 0x16u);
    }
  }
  uint64_t v13 = +[IMDMessageStore sharedInstance];
  id v14 = [v13 messageWithGUID:v7];

  int v15 = IMOSLoggingEnabled();
  if (!v14)
  {
    if (!v15) {
      goto LABEL_82;
    }
    __int16 v39 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v7;
      _os_log_impl(&dword_1D967A000, v39, OS_LOG_TYPE_INFO, "Unable To locate Message with GUID %@, adding to pending requests to retry later", buf, 0xCu);
    }
    goto LABEL_58;
  }
  if (v15)
  {
    v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v7;
      _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Located Mesage with Message Guid %@", buf, 0xCu);
    }
  }
  uint64_t v17 = [(IMDRelayAttachmentController *)self pendingRemoteFileRequests];
  [v17 removeObject:v6];

  char v18 = [(IMDRelayAttachmentController *)self pendingRemoteFileRequests];
  BOOL v19 = [v18 count] == 0;

  if (v19) {
    [(IMDRelayAttachmentController *)self setPendingRemoteFileRequests:0];
  }
  if ([v14 isFinished])
  {
    id v20 = [v14 fileTransferGUIDs];

    int v21 = IMOSLoggingEnabled();
    if (v20)
    {
      if (v21)
      {
        int v22 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v7;
          _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "Located message with guid %@ attachments,  ", buf, 0xCu);
        }
      }
      int v23 = [v14 fileTransferGUIDs];
      BOOL v24 = v9 < [v23 count];

      if (v24)
      {
        id v25 = [v14 fileTransferGUIDs];
        id v59 = [v25 objectAtIndex:v9];

        if (IMOSLoggingEnabled())
        {
          int v26 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v59;
            _os_log_impl(&dword_1D967A000, v26, OS_LOG_TYPE_INFO, "Attempting to locate file transfer with guid %@ ", buf, 0xCu);
          }
        }
        id v27 = +[IMDFileTransferCenter sharedInstance];
        int v28 = [v27 transferForGUID:v59];

        if (v28)
        {
          if (IMOSLoggingEnabled())
          {
            long long v29 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v59;
              _os_log_impl(&dword_1D967A000, v29, OS_LOG_TYPE_INFO, "Located Transfer with Guid %@ ", buf, 0xCu);
            }
          }
          if ([v28 isFinished])
          {
            if (IMOSLoggingEnabled())
            {
              long long v30 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v59;
                _os_log_impl(&dword_1D967A000, v30, OS_LOG_TYPE_INFO, "Located Completed transfer with %@ ", buf, 0xCu);
              }
            }
            if (v11)
            {
              long long v31 = (void *)MEMORY[0x1E4F442D8];
              long long v32 = [v28 type];
              v33 = [v31 typeWithIdentifier:v32];

              if ([v33 conformsToType:*MEMORY[0x1E4F44400]]
                && ([v28 localURL],
                    id v34 = objc_claimAutoreleasedReturnValue(),
                    char v35 = IMFileURLIsActuallyAnimated(),
                    v34,
                    (v35 & 1) == 0))
              {
                uint64_t v78 = 0;
                memset(buf, 0, sizeof(buf));
                IMPreviewConstraintsZero();
                *(_OWORD *)buf = xmmword_1D991CE10;
                *(_OWORD *)&buf[16] = xmmword_1D991CE20;
                LOBYTE(v78) = [v28 isSticker];
                BYTE2(v78) = [v28 isAdaptiveImageGlyph];
                BYTE1(v78) = 0;
                uint64_t v45 = [MEMORY[0x1E4F6EBE0] sharedInstance];
                v46 = [v28 localURL];
                v67[0] = MEMORY[0x1E4F143A8];
                v67[1] = 3221225472;
                v67[2] = sub_1D96E6800;
                v67[3] = &unk_1E6B74130;
                v67[4] = self;
                id v68 = v14;
                unint64_t v69 = v9;
                v65[0] = *(_OWORD *)buf;
                v65[1] = *(_OWORD *)&buf[16];
                uint64_t v66 = v78;
                [v45 generateSafeRender:v46 constraints:v65 completionBlock:v67];
              }
              else
              {
                if (IMOSLoggingEnabled())
                {
                  id v36 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(void *)&uint8_t buf[4] = v33;
                    _os_log_impl(&dword_1D967A000, v36, OS_LOG_TYPE_INFO, "File safe render failed for Peer Relay because the filetype was not supported: %@", buf, 0xCu);
                  }
                }
                __int16 v37 = [v28 localURL];
                int64_t v38 = [v14 guid];
                [(IMDRelayAttachmentController *)self _sendFileURL:v37 forMessageGUID:v38 attachmentIndex:v9];
              }
            }
            else
            {
              if (IMOSLoggingEnabled())
              {
                uint64_t v47 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1D967A000, v47, OS_LOG_TYPE_INFO, "Request is from an old watch, so we need to transcode", buf, 2u);
                }
              }
              id v58 = [v28 transcoderUserInfo];
              if ([v28 isAdaptiveImageGlyph])
              {
                if (v58) {
                  id v48 = (id)[v58 mutableCopy];
                }
                else {
                  id v48 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                }
                id v49 = v48;
                [v48 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F6D460]];
                uint64_t v50 = [v49 copy];

                id v58 = (void *)v50;
              }
              id v55 = +[IMDRelayTranscodeController sharedInstance];
              id v57 = [v28 localURL];
              id v56 = [v28 type];
              id v51 = [(IMDRelayAttachmentController *)self session];
              v52 = [v51 service];
              uint64_t v53 = [v52 transcodeTarget];
              uint64_t v54 = [v28 isSticker];
              v61[0] = MEMORY[0x1E4F143A8];
              v61[1] = 3221225472;
              v61[2] = sub_1D96E69C0;
              v61[3] = &unk_1E6B74158;
              id v62 = v59;
              id v63 = v14;
              unint64_t v64 = v9;
              [v55 transcodeFileTransferContents:v57 utiType:v56 target:v53 transcoderUserInfo:v58 isSticker:v54 highQualityMaxByteSize:0x80000 lowQualityMaxByteSize:0x80000 representations:0 completionBlock:v61];
            }
          }
          else
          {
            int v42 = IMOSLoggingEnabled();
            if (a4 >= 40)
            {
              if (v42)
              {
                uint64_t v44 = OSLogHandleForIMEventCategory();
                if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  *(void *)&uint8_t buf[4] = v59;
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v7;
                  _os_log_impl(&dword_1D967A000, v44, OS_LOG_TYPE_INFO, "Transfer Guid %@ for Message with %@ is not yet complete, no retries remain ", buf, 0x16u);
                }
              }
            }
            else
            {
              if (v42)
              {
                id v43 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  *(void *)&uint8_t buf[4] = v59;
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v7;
                  _os_log_impl(&dword_1D967A000, v43, OS_LOG_TYPE_INFO, "Transfer Guid %@ for Message with %@ is not yet complete, Retrying it a bit ", buf, 0x16u);
                }
              }
              id v60 = v6;
              im_dispatch_after();
            }
          }
        }
      }
      goto LABEL_82;
    }
    if (!v21) {
      goto LABEL_82;
    }
    __int16 v39 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v14;
      _os_log_impl(&dword_1D967A000, v39, OS_LOG_TYPE_INFO, "We have the message but no transfer guids - %@", buf, 0xCu);
    }
LABEL_58:

    goto LABEL_82;
  }
  int v40 = IMOSLoggingEnabled();
  if (a4 >= 40)
  {
    if (!v40) {
      goto LABEL_82;
    }
    __int16 v39 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v7;
      _os_log_impl(&dword_1D967A000, v39, OS_LOG_TYPE_INFO, "Message with Guid is unfinished %@, No retried remain ", buf, 0xCu);
    }
    goto LABEL_58;
  }
  if (v40)
  {
    uint64_t v41 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v7;
      _os_log_impl(&dword_1D967A000, v41, OS_LOG_TYPE_INFO, "Message with Guid  is unfinished %@, Retrying it a bit ", buf, 0xCu);
    }
  }
  uint64_t v70 = MEMORY[0x1E4F143A8];
  uint64_t v71 = 3221225472;
  long long v72 = sub_1D96E67EC;
  long long v73 = &unk_1E6B74108;
  uint64_t v74 = self;
  id v75 = v6;
  int64_t v76 = a4;
  im_dispatch_after();

LABEL_82:
}

- (void)remoteFileResponse:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v4;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Received remote file response message %@", buf, 0xCu);
    }
  }
  id v6 = [v4 objectForKeyedSubscript:IMDRelayLocalMessageDictionaryGUIDKey];
  id v7 = [v4 objectForKeyedSubscript:IMDRelayLocalMessageDictionaryAttachmentIndexKey];
  uint64_t v8 = [v7 unsignedIntegerValue];

  unint64_t v9 = [v4 objectForKeyedSubscript:IMDRelayLocalMessageDictionaryFileDataKey];
  if ([v6 length])
  {
    if (IMOSLoggingEnabled())
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v20 = v6;
        __int16 v21 = 2048;
        uint64_t v22 = v8;
        _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, " Incomming response for message %@ attachment index %lu ", buf, 0x16u);
      }
    }
    int v11 = objc_msgSend(v6, "stringByAppendingFormat:", @"_%lu", v8);
    uint64_t v12 = [(NSMutableDictionary *)self->_peerCompletionBlocks objectForKey:v11];
    int v13 = IMOSLoggingEnabled();
    if (v12)
    {
      if (v13)
      {
        id v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, " Found completion block for attachment", buf, 2u);
        }
      }
      ((void (**)(void, void *, uint64_t, void, void *, uint64_t, void))v12)[2](v12, v6, v8, 0, v9, 1, 0);
      [(NSMutableDictionary *)self->_peerCompletionBlocks removeObjectForKey:v11];
    }
    else
    {
      if (v13)
      {
        int v15 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v20 = v11;
          _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, " No completion block for attachment found: %@", buf, 0xCu);
        }
      }
      if (IMOSLoggingEnabled())
      {
        v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          uint64_t v17 = [(NSMutableDictionary *)self->_peerCompletionBlocks allKeys];
          *(_DWORD *)buf = 138412290;
          id v20 = v17;
          _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "     In list of blocks: %@", buf, 0xCu);
        }
      }
    }
    if (![(NSMutableDictionary *)self->_peerCompletionBlocks count])
    {
      peerCompletionBlocks = self->_peerCompletionBlocks;
      self->_peerCompletionBlocks = 0;
    }
  }
}

- (IMDServiceSession)session
{
  return self->_session;
}

- (NSMutableDictionary)peerCompletionBlocks
{
  return self->_peerCompletionBlocks;
}

- (void)setPeerCompletionBlocks:(id)a3
{
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
  objc_storeStrong((id *)&self->_peerCompletionBlocks, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

@end
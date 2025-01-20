@interface IMTransferAgentController
+ (id)sharedInstance;
- (BOOL)_isAllowlistedURL:(id)a3;
- (BOOL)_shouldRetryUploadGivenMMCSError:(id)a3 retryAttemptCount:(unint64_t)a4;
- (MMCSController)controller;
- (id)_defaultMMCSAllowlist;
- (void)_receiveFileTransfer:(id)a3 topic:(id)a4 path:(id)a5 requestURLString:(id)a6 ownerID:(id)a7 signature:(id)a8 allowReauthorize:(BOOL)a9 fileSize:(unint64_t)a10 sourceAppID:(id)a11 progressBlock:(id)a12 completionBlock:(id)a13;
- (void)_sendFilePath:(id)a3 topic:(id)a4 transferID:(id)a5 sourceAppID:(id)a6 retryAttemptCount:(unint64_t)a7 userInfo:(id)a8 progressBlock:(id)a9 completionBlock:(id)a10;
- (void)cancelSendTransferID:(id)a3;
- (void)dealloc;
- (void)ensureSafeAttachment:(id)a3 topic:(id)a4 withCompletionBlock:(id)a5;
- (void)receiveFileTransfer:(id)a3 topic:(id)a4 path:(id)a5 requestURLString:(id)a6 ownerID:(id)a7 signature:(id)a8 fileSize:(unint64_t)a9 decryptionKey:(id)a10 sourceAppID:(id)a11 progressBlock:(id)a12 completionBlock:(id)a13;
- (void)sendFilePath:(id)a3 encrypt:(BOOL)a4 topic:(id)a5 transferID:(id)a6 sourceAppID:(id)a7 userInfo:(id)a8 progressBlock:(id)a9 completionBlock:(id)a10;
- (void)setController:(id)a3;
- (void)warm;
@end

@implementation IMTransferAgentController

+ (id)sharedInstance
{
  if (qword_26AF3FDC0 != -1) {
    dispatch_once(&qword_26AF3FDC0, &unk_26F0B8E48);
  }
  v2 = (void *)qword_26AF3FDE8;
  return v2;
}

- (void)dealloc
{
  [(IMTransferAgentController *)self setController:0];
  v3.receiver = self;
  v3.super_class = (Class)IMTransferAgentController;
  [(IMTransferAgentController *)&v3 dealloc];
}

- (BOOL)_shouldRetryUploadGivenMMCSError:(id)a3 retryAttemptCount:(unint64_t)a4
{
  id v5 = a3;
  im_assert_primary_queue();
  if (!v5) {
    goto LABEL_10;
  }
  v6 = [v5 domain];
  if (([v6 isEqualToString:*MEMORY[0x263F534D8]] & 1) == 0)
  {

    goto LABEL_10;
  }
  uint64_t v7 = [v5 code];

  if (v7 != 4)
  {
LABEL_10:
    char v9 = 1;
    goto LABEL_11;
  }
  if (IMOSLoggingEnabled())
  {
    v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_23CAED000, v8, OS_LOG_TYPE_INFO, "We will not try to re-upload as the transfer was explicitly cancelled", v12, 2u);
    }
  }
  char v9 = 0;
LABEL_11:
  if (a4 < 3) {
    BOOL v10 = v9;
  }
  else {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)_sendFilePath:(id)a3 topic:(id)a4 transferID:(id)a5 sourceAppID:(id)a6 retryAttemptCount:(unint64_t)a7 userInfo:(id)a8 progressBlock:(id)a9 completionBlock:(id)a10
{
  uint64_t v99 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v62 = a4;
  id v17 = a5;
  id v18 = a6;
  id v58 = a8;
  id v19 = a9;
  id v60 = a10;
  im_assert_primary_queue();
  v20 = self;
  if (!self->_controller)
  {
    id v21 = objc_alloc(MEMORY[0x263F535A0]);
    v22 = im_primary_queue();
    v23 = (MMCSController *)[v21 initWithQueue:v22];
    controller = self->_controller;
    self->_controller = v23;
  }
  id v25 = objc_alloc_init(MEMORY[0x263F535B0]);
  IMSingleObjectArray();
  id val = (id)objc_claimAutoreleasedReturnValue();
  v26 = [NSString stringGUID];
  [v25 setGuid:v26];

  v27 = [v16 stringByResolvingAndStandardizingPath];
  [v25 setLocalPath:v27];

  [v25 setEncryptionBehavior:1];
  v91[0] = MEMORY[0x263EF8330];
  v91[1] = 3221225472;
  v91[2] = sub_23CAF217C;
  v91[3] = &unk_264E80CA0;
  id v28 = v17;
  id v92 = v28;
  id v29 = v19;
  id v93 = v29;
  [v25 setProgressUpdateBlock:v91];
  int v64 = IMOptOutOfOptimizedMadridAttachmentUploadPath();
  if (v64 && IMOSLoggingEnabled())
  {
    v30 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      v31 = [v25 guid];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v31;
      _os_log_impl(&dword_23CAED000, v30, OS_LOG_TYPE_INFO, "Opting upload with GUID %@ out of optimized AuthPut flow.", (uint8_t *)&buf, 0xCu);
    }
  }
  id location = 0;
  objc_initWeak(&location, val);
  v81[0] = MEMORY[0x263EF8330];
  v81[1] = 3221225472;
  v81[2] = sub_23CAF22AC;
  v81[3] = &unk_264E80CF0;
  objc_copyWeak(v89, &location);
  v81[4] = self;
  v89[1] = (id)a7;
  id v57 = v28;
  id v82 = v57;
  id v32 = v16;
  id v83 = v32;
  id v33 = v62;
  id v84 = v33;
  id v34 = v18;
  id v85 = v34;
  id v35 = v58;
  id v86 = v35;
  id v59 = v29;
  id v87 = v59;
  id v61 = v60;
  id v88 = v61;
  [v25 setCompletionBlock:v81];
  v36 = NSString;
  v37 = [v25 guid];
  v38 = [v36 stringWithFormat:@"Upload-transfer-%@-mmcs-registration", v37];

  v39 = NSString;
  v40 = [v25 guid];
  v41 = [v39 stringWithFormat:@"Upload-transfer-%@-preauth", v40];

  v42 = NSString;
  v43 = [v25 guid];
  v63 = [v42 stringWithFormat:@"Upload-transfer-%@-mmcs-upload", v43];

  v44 = v32;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v95 = 0x3032000000;
  v96 = sub_23CAF2950;
  v97 = sub_23CAF2960;
  id v98 = 0;
  v45 = v34;
  id v98 = objc_alloc_init(MEMORY[0x263F4A870]);
  [*(id *)(*((void *)&buf + 1) + 40) startTimingForKey:v38];
  uint64_t v46 = v64 ^ 1u;
  v47 = v20->_controller;
  v67[0] = MEMORY[0x263EF8330];
  v67[1] = 3221225472;
  v67[2] = sub_23CAF2968;
  v67[3] = &unk_264E80D68;
  id v65 = v25;
  id v68 = v65;
  p_long long buf = &buf;
  id v48 = v38;
  id v69 = v48;
  char v80 = v46;
  id v56 = v33;
  id v70 = v56;
  v71 = v20;
  id v49 = v35;
  id v72 = v49;
  id v50 = v41;
  id v73 = v50;
  id v55 = v44;
  id v74 = v55;
  id v51 = v63;
  id v75 = v51;
  id v52 = val;
  id v76 = v52;
  id v53 = v57;
  id v77 = v53;
  id v54 = v45;
  id v78 = v54;
  [(MMCSController *)v47 registerFilesForUpload:v52 withPreauthentication:v46 completionBlock:v67];

  _Block_object_dispose(&buf, 8);
  objc_destroyWeak(v89);
  objc_destroyWeak(&location);
}

- (void)warm
{
  im_assert_primary_queue();
  if (!self->_controller)
  {
    id v3 = objc_alloc(MEMORY[0x263F535A0]);
    v4 = im_primary_queue();
    id v5 = (MMCSController *)[v3 initWithQueue:v4];
    controller = self->_controller;
    self->_controller = v5;
  }
  [(IMTransferAgentController *)self _isAllowlistedURL:0];
  uint64_t v7 = MEMORY[0x263F535A0];
  MEMORY[0x270F9A6D0](v7, sel_preMMCSWarm);
}

- (void)sendFilePath:(id)a3 encrypt:(BOOL)a4 topic:(id)a5 transferID:(id)a6 sourceAppID:(id)a7 userInfo:(id)a8 progressBlock:(id)a9 completionBlock:(id)a10
{
  BOOL v14 = a4;
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v37 = a5;
  id v38 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  im_assert_primary_queue();
  if (v16)
  {
    id v21 = [MEMORY[0x263F08850] defaultManager];
    v22 = [v21 attributesOfItemAtPath:v16 error:0];

    v23 = [v22 objectForKeyedSubscript:*MEMORY[0x263F080B8]];
    unint64_t v24 = [v23 unsignedIntegerValue];
  }
  else
  {
    unint64_t v24 = 0;
  }
  id v25 = +[IMTransferAgentIDSInterface sharedInstance];
  v26 = [v25 localCompanionDevice];

  if (IMOSLoggingEnabled())
  {
    v27 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412546;
      id v53 = v26;
      __int16 v54 = 2048;
      unint64_t v55 = v24;
      _os_log_impl(&dword_23CAED000, v27, OS_LOG_TYPE_INFO, "local device: %@ file size: %lu", buf, 0x16u);
    }
  }
  if (v24 < 0x6400001)
  {
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = sub_23CAF5788;
    v41[3] = &unk_264E80DB8;
    id v48 = v20;
    BOOL v51 = v14;
    id v42 = v26;
    unint64_t v50 = v24;
    id v43 = v37;
    id v44 = v38;
    id v45 = v17;
    uint64_t v46 = self;
    id v47 = v18;
    id v49 = v19;
    v30 = (void (**)(void, void, void))MEMORY[0x23ECF1F70](v41);
    if (IMOSLoggingEnabled())
    {
      v31 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_23CAED000, v31, OS_LOG_TYPE_INFO, " => File passes file size restrictions", buf, 2u);
      }
    }
    int v32 = IMOSLoggingEnabled();
    if (v14)
    {
      if (v32)
      {
        id v33 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_23CAED000, v33, OS_LOG_TYPE_INFO, "Encrypting file", buf, 2u);
        }
      }
      id v34 = +[IMTransferEncryptionController sharedInstance];
      id v35 = [NSURL fileURLWithPath:v16];
      v39[0] = MEMORY[0x263EF8330];
      v39[1] = 3221225472;
      v39[2] = sub_23CAF5B3C;
      v39[3] = &unk_264E80DE0;
      v40 = v30;
      [v34 encryptURL:v35 completionBlock:v39];
    }
    else
    {
      if (v32)
      {
        v36 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_23CAED000, v36, OS_LOG_TYPE_INFO, "Not encrypting file", buf, 2u);
        }
      }
      ((void (**)(void, id, void))v30)[2](v30, v16, 0);
    }

    id v29 = v48;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v28 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 67109120;
        LODWORD(v53) = 104857600;
        _os_log_impl(&dword_23CAED000, v28, OS_LOG_TYPE_INFO, "  ** File is too large - failing, over max size of: %d", buf, 8u);
      }
    }
    id v29 = [MEMORY[0x263F087E8] errorWithDomain:@"IMTransferServicesErrorDomain" code:-6 userInfo:0];
    (*((void (**)(id, void, id, unint64_t, void, void, void, void, void *, void))v20 + 2))(v20, 0, v16, v24, 0, 0, 0, 0, v29, 0);
  }
}

- (void)cancelSendTransferID:(id)a3
{
  id v4 = a3;
  im_assert_primary_queue();
  [(MMCSController *)self->_controller cancelPutRequestID:v4];
}

- (id)_defaultMMCSAllowlist
{
  return &unk_26F0BAF40;
}

- (BOOL)_isAllowlistedURL:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  im_assert_primary_queue();
  id v5 = [MEMORY[0x263F4A0B8] sharedInstanceForBagType:1];
  v6 = [v5 objectForKey:@"mmcs-whitelist"];

  if ([v6 count])
  {
    id v7 = v6;
  }
  else
  {
    id v7 = [(IMTransferAgentController *)self _defaultMMCSAllowlist];
    if (IMOSLoggingEnabled())
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_23CAED000, v8, OS_LOG_TYPE_INFO, "Server bag does not have allowlisted urls. Resorting to defaults", buf, 2u);
      }
    }
  }
  if (IMOSLoggingEnabled())
  {
    char v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412546;
      id v24 = v4;
      __int16 v25 = 2112;
      id v26 = v7;
      _os_log_impl(&dword_23CAED000, v9, OS_LOG_TYPE_INFO, "Checking URL %@ with domains %@", buf, 0x16u);
    }
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v10);
        }
        if (objc_msgSend(v4, "__im_conformsToDomain:domainExtension:", *(void *)(*((void *)&v18 + 1) + 8 * i), @"com", (void)v18))
        {
          if (IMOSLoggingEnabled())
          {
            id v16 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)long long buf = 138412290;
              id v24 = v4;
              _os_log_impl(&dword_23CAED000, v16, OS_LOG_TYPE_INFO, "URL is allowlisted %@", buf, 0xCu);
            }
          }
          BOOL v15 = 1;
          goto LABEL_29;
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  if (IMOSLoggingEnabled())
  {
    BOOL v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v24 = v4;
      _os_log_impl(&dword_23CAED000, v14, OS_LOG_TYPE_INFO, "MMCS: Invalid URL %@", buf, 0xCu);
    }
  }
  BOOL v15 = 0;
LABEL_29:

  return v15;
}

- (void)_receiveFileTransfer:(id)a3 topic:(id)a4 path:(id)a5 requestURLString:(id)a6 ownerID:(id)a7 signature:(id)a8 allowReauthorize:(BOOL)a9 fileSize:(unint64_t)a10 sourceAppID:(id)a11 progressBlock:(id)a12 completionBlock:(id)a13
{
  uint64_t v122 = *MEMORY[0x263EF8340];
  id v19 = a3;
  id v20 = a4;
  long long v21 = self;
  id v22 = v20;
  id v72 = a5;
  id v23 = a6;
  id v68 = a7;
  id v71 = a8;
  id v69 = a11;
  id v70 = a12;
  id v73 = a13;
  im_assert_primary_queue();
  id v74 = v23;
  if (!v21->_controller)
  {
    id v24 = objc_alloc(MEMORY[0x263F535A0]);
    __int16 v25 = im_primary_queue();
    uint64_t v26 = [v24 initWithQueue:v25];
    controller = v21->_controller;
    v21->_controller = (MMCSController *)v26;
  }
  id v28 = [NSURL URLWithString:v23];
  BOOL v29 = [(IMTransferAgentController *)v21 _isAllowlistedURL:v28];

  if (v29)
  {
    id v30 = objc_alloc_init(MEMORY[0x263F535A8]);
    id location = 0;
    objc_initWeak(&location, v30);
    v31 = IMSingleObjectArray();
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v118 = 0x3032000000;
    v119 = sub_23CAF2950;
    v120 = sub_23CAF2960;
    id v121 = 0;
    id v32 = v31;
    id v121 = v32;
    if (v23)
    {
      v67 = objc_msgSend(NSURL, "URLWithString:");
    }
    else
    {
      v67 = 0;
    }
    [v30 setSignature:v71];
    [v30 setGuid:v19];
    id v35 = [v72 stringByResolvingAndStandardizingPath];
    [v30 setLocalPath:v35];

    [v30 setRequestURL:v67];
    [v30 setProtocolFileSize:a10];
    v108[0] = MEMORY[0x263EF8330];
    v108[1] = 3221225472;
    v108[2] = sub_23CAF6984;
    v108[3] = &unk_264E80E08;
    id v36 = v19;
    id v109 = v36;
    id v37 = v70;
    id v110 = v37;
    [v30 setProgressUpdateBlock:v108];
    if (IMOSLoggingEnabled())
    {
      id v38 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        LODWORD(v112) = 138412290;
        *(void *)((char *)&v112 + 4) = v30;
        _os_log_impl(&dword_23CAED000, v38, OS_LOG_TYPE_INFO, "Created get file request: %@", (uint8_t *)&v112, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      v39 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        v40 = [MEMORY[0x263F4A880] sharedInstance];
        int v41 = [v40 linkQualityValueForInterfaceType:3];
        LODWORD(v112) = 67109120;
        DWORD1(v112) = v41;
        _os_log_impl(&dword_23CAED000, v39, OS_LOG_TYPE_INFO, "  Cell Link Quality: %d", (uint8_t *)&v112, 8u);
      }
    }
    if (IMOSLoggingEnabled())
    {
      id v42 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        id v43 = [MEMORY[0x263F4A880] sharedInstance];
        int v44 = [v43 linkQualityValueForInterfaceType:2];
        LODWORD(v112) = 67109120;
        DWORD1(v112) = v44;
        _os_log_impl(&dword_23CAED000, v42, OS_LOG_TYPE_INFO, "  WiFi Link Quality: %d", (uint8_t *)&v112, 8u);
      }
    }
    v106[0] = 0;
    v106[1] = v106;
    v106[2] = 0x2020000000;
    int v107 = 0;
    v91[0] = MEMORY[0x263EF8330];
    v91[1] = 3221225472;
    v91[2] = sub_23CAF6AB4;
    v91[3] = &unk_264E80EA8;
    objc_copyWeak(v104, &location);
    id v65 = v32;
    v102 = v106;
    BOOL v105 = a9;
    id v45 = v36;
    id v92 = v45;
    id v93 = v21;
    v66 = v21;
    id v62 = v22;
    id v46 = v22;
    id v94 = v46;
    id v64 = v72;
    id v95 = v64;
    id v47 = v74;
    id v96 = v47;
    id v48 = v68;
    id v97 = v48;
    id v49 = v71;
    id v98 = v49;
    v104[1] = (id)a10;
    id v63 = v69;
    id v99 = v63;
    id v100 = v37;
    id v101 = v73;
    p_long long buf = &buf;
    [v30 setCompletionBlock:v91];
    id v61 = v19;
    unint64_t v50 = [NSString stringWithFormat:@"download-transfer-%@-mmcs-registration", v45];
    BOOL v51 = [NSString stringWithFormat:@"download-transfer-%@-preauth", v45];
    uint64_t v52 = [NSString stringWithFormat:@"download-transfer-%@-mmcs-upload", v45];
    id v53 = v47;
    *(void *)&long long v112 = 0;
    *((void *)&v112 + 1) = &v112;
    uint64_t v113 = 0x3032000000;
    v114 = sub_23CAF2950;
    v115 = sub_23CAF2960;
    id v116 = 0;
    __int16 v54 = (void *)v52;
    id v116 = objc_alloc_init(MEMORY[0x263F4A870]);
    [*(id *)(*((void *)&v112 + 1) + 40) startTimingForKey:v50];
    unint64_t v55 = v66->_controller;
    v75[0] = MEMORY[0x263EF8330];
    v75[1] = 3221225472;
    v75[2] = sub_23CAF75F0;
    v75[3] = &unk_264E80F20;
    v90 = &v112;
    id v56 = v50;
    id v76 = v56;
    id v77 = v46;
    id v78 = v48;
    id v79 = v49;
    id v80 = v45;
    v81 = v66;
    id v57 = v67;
    id v82 = v57;
    id v58 = v51;
    id v83 = v58;
    id v84 = v53;
    id v34 = v30;
    id v85 = v34;
    id v86 = v64;
    id v59 = v54;
    id v87 = v59;
    id v60 = v65;
    id v88 = v60;
    id v89 = v63;
    [(MMCSController *)v55 registerFilesForDownload:v60 completionBlock:v75];

    id v19 = v61;
    id v22 = v62;

    _Block_object_dispose(&v112, 8);
    objc_destroyWeak(v104);
    _Block_object_dispose(v106, 8);

    _Block_object_dispose(&buf, 8);
    objc_destroyWeak(&location);
    goto LABEL_26;
  }
  if (IMOSLoggingEnabled())
  {
    id v33 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v23;
      _os_log_impl(&dword_23CAED000, v33, OS_LOG_TYPE_INFO, "MMCS failing transfer invalid url %@", (uint8_t *)&buf, 0xCu);
    }
  }
  if (v73)
  {
    id v34 = [MEMORY[0x263F087E8] errorWithDomain:@"IMTransferAgentErrorDomain" code:10 userInfo:0];
    (*((void (**)(id, id, id, void, id, __CFString *))v73 + 2))(v73, v19, v72, 0, v34, @"Invalid url");
LABEL_26:
  }
}

- (void)receiveFileTransfer:(id)a3 topic:(id)a4 path:(id)a5 requestURLString:(id)a6 ownerID:(id)a7 signature:(id)a8 fileSize:(unint64_t)a9 decryptionKey:(id)a10 sourceAppID:(id)a11 progressBlock:(id)a12 completionBlock:(id)a13
{
  id v45 = a3;
  id v46 = a4;
  id v47 = a5;
  id v44 = a6;
  id v19 = a7;
  id v43 = a8;
  id v20 = a10;
  id v21 = a11;
  id v22 = a12;
  id v23 = a13;
  im_assert_primary_queue();
  id v42 = v22;
  if (IMGetCachedDomainBoolForKey())
  {
    id v24 = v20;
    uint64_t v26 = v44;
    __int16 v25 = v45;
    uint64_t v27 = v43;
    if (IMOSLoggingEnabled())
    {
      id v28 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_23CAED000, v28, OS_LOG_TYPE_INFO, "************* Failed attachment download is on ***********************", buf, 2u);
      }
    }
    if (IMOSLoggingEnabled())
    {
      BOOL v29 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_23CAED000, v29, OS_LOG_TYPE_INFO, "************* Failed attachment download is on ***********************", buf, 2u);
      }
    }
    id v30 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.private.IMTransferAgentForcedFailure" code:0 userInfo:0];
    (*((void (**)(id, id, id, void, id, void))v23 + 2))(v23, v45, v47, 0, v30, 0);
    v31 = v46;
    id v32 = v42;
  }
  else
  {
    id v33 = v20;
    id v41 = v19;
    if ([v20 length])
    {
      id v34 = [MEMORY[0x263F08850] defaultManager];
      id v35 = v47;
      id v30 = [v34 _randomSimilarFilePathAsPath:v47];
    }
    else
    {
      id v35 = v47;
      id v30 = v47;
    }
    v53[0] = MEMORY[0x263EF8330];
    v53[1] = 3221225472;
    v53[2] = sub_23CAF9B94;
    v53[3] = &unk_264E80F70;
    v53[4] = self;
    id v36 = v46;
    id v54 = v36;
    id v55 = v23;
    id v37 = (void *)MEMORY[0x23ECF1F70](v53);
    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 3221225472;
    v48[2] = sub_23CAF9E40;
    v48[3] = &unk_264E80FC0;
    id v49 = v33;
    id v50 = v35;
    id v52 = v37;
    id v24 = v33;
    __int16 v25 = v45;
    id v51 = v45;
    id v38 = v37;
    id v32 = v42;
    LOBYTE(v40) = 1;
    id v39 = v36;
    uint64_t v27 = v43;
    uint64_t v26 = v44;
    [(IMTransferAgentController *)self _receiveFileTransfer:v51 topic:v39 path:v30 requestURLString:v44 ownerID:v41 signature:v43 allowReauthorize:v40 fileSize:a9 sourceAppID:v21 progressBlock:v42 completionBlock:v48];

    id v19 = v41;
    v31 = v46;
  }
}

- (void)ensureSafeAttachment:(id)a3 topic:(id)a4 withCompletionBlock:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  im_assert_primary_queue();
  if ([MEMORY[0x263F4AF78] deviceIsLockedDown]
    && ([v7 path],
        id v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = IMTransferRequestIsForMessages(v8, v10),
        v10,
        v11))
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        id v23 = v7;
        _os_log_impl(&dword_23CAED000, v12, OS_LOG_TYPE_INFO, "Lockdown mode enabled, generating safe render for attachment: %@", buf, 0xCu);
      }
    }
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    long long v18 = sub_23CAFA490;
    id v19 = &unk_264E80FE8;
    id v13 = v7;
    id v20 = v13;
    id v21 = v9;
    BOOL v14 = (void *)MEMORY[0x23ECF1F70](&v16);
    BOOL v15 = objc_msgSend(MEMORY[0x263F4B100], "sharedInstance", v16, v17, v18, v19);
    [v15 generateSafeRender:v13 completionBlock:v14];
  }
  else
  {
    (*((void (**)(id, uint64_t, id, void))v9 + 2))(v9, 1, v7, 0);
  }
}

- (MMCSController)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
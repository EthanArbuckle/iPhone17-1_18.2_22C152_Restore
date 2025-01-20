@interface IMTransferServicesController
+ (id)sharedInstance;
- (void)_receiveFileTransfer:(id)a3 topic:(id)a4 path:(id)a5 requestURLString:(id)a6 ownerID:(id)a7 sourceAppID:(id)a8 signature:(id)a9 decryptionKey:(id)a10 retries:(int)a11 fileSize:(unint64_t)value progressBlock:(id)a13 completionBlock:(id)a14;
- (void)_sendFilePath:(id)a3 topic:(id)a4 userInfo:(id)a5 transferID:(id)a6 sourceAppID:(id)a7 encryptFile:(BOOL)a8 retries:(int)a9 progressBlock:(id)a10 completionBlock:(id)a11;
- (void)cancelSendTransferID:(id)a3;
- (void)deleteAllPersonalNicknamesWithCompletion:(id)a3;
- (void)getNicknameWithRecordID:(id)a3 decryptionKey:(id)a4 completionBlock:(id)a5;
- (void)getNicknameWithRecordID:(id)a3 decryptionKey:(id)a4 wallpaperDataTag:(id)a5 wallpaperLowResDataTag:(id)a6 wallpaperMetadataTag:(id)a7 completionBlock:(id)a8;
- (void)getNicknameWithRecordID:(id)a3 decryptionKey:(id)a4 wallpaperDataTag:(id)a5 wallpaperLowResDataTag:(id)a6 wallpaperMetadataTag:(id)a7 isKnownSender:(BOOL)a8 completionBlock:(id)a9;
- (void)getNicknameWithRecordID:(id)a3 decryptionKey:(id)a4 wallpaperDataTag:(id)a5 wallpaperLowResDataTag:(id)a6 wallpaperMetadataTag:(id)a7 isKnownSender:(BOOL)a8 shouldDecodeImageFields:(BOOL)a9 completionBlock:(id)a10;
- (void)preWarmMMCSForOwnerID:(id)a3;
- (void)receiveFileTransfer:(id)a3 topic:(id)a4 path:(id)a5 requestURLString:(id)a6 ownerID:(id)a7 signature:(id)a8 decryptionKey:(id)a9 fileSize:(unint64_t)a10 progressBlock:(id)a11 completionBlock:(id)a12;
- (void)receiveFileTransfer:(id)a3 topic:(id)a4 path:(id)a5 requestURLString:(id)a6 ownerID:(id)a7 sourceAppID:(id)a8 signature:(id)a9 decryptionKey:(id)a10 fileSize:(unint64_t)a11 progressBlock:(id)a12 completionBlock:(id)a13;
- (void)sendFilePath:(id)a3 topic:(id)a4 transferID:(id)a5 encryptFile:(BOOL)a6 progressBlock:(id)a7 completionBlock:(id)a8;
- (void)sendFilePath:(id)a3 topic:(id)a4 userInfo:(id)a5 transferID:(id)a6 encryptFile:(BOOL)a7 progressBlock:(id)a8 completionBlock:(id)a9;
- (void)sendFilePath:(id)a3 topic:(id)a4 userInfo:(id)a5 transferID:(id)a6 sourceAppID:(id)a7 encryptFile:(BOOL)a8 progressBlock:(id)a9 completionBlock:(id)a10;
- (void)setPersonalNickname:(id)a3 oldRecordID:(id)a4 completionBlock:(id)a5;
- (void)setPersonalNickname:(id)a3 oldRecordID:(id)a4 completionBlockWithWallpaperTags:(id)a5;
@end

@implementation IMTransferServicesController

+ (id)sharedInstance
{
  if (qword_26ACD2D40 != -1) {
    dispatch_once(&qword_26ACD2D40, &unk_26C3CBE60);
  }
  return (id)qword_26ACD2D50;
}

- (void)_sendFilePath:(id)a3 topic:(id)a4 userInfo:(id)a5 transferID:(id)a6 sourceAppID:(id)a7 encryptFile:(BOOL)a8 retries:(int)a9 progressBlock:(id)a10 completionBlock:(id)a11
{
  BOOL v142 = a8;
  uint64_t v167 = *MEMORY[0x263EF8340];
  if (IMOSLoggingEnabled())
  {
    v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = a3;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = a6;
      *(_WORD *)&buf[22] = 2112;
      id v164 = a7;
      _os_log_impl(&dword_2129EB000, v22, OS_LOG_TYPE_INFO, "TransferServices received request to transfer %@  ID: %@ sourceAppID: %@", buf, 0x20u);
    }
  }
  uint64_t v158 = 0;
  v23 = NSURL;
  v24 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v15, v16, v17, v18, v19, v20, v21);
  uint64_t v32 = objc_msgSend_pathExtension(a3, v25, v26, v27, v28, v29, v30, v31);
  uint64_t v39 = objc_msgSend__randomTemporaryPathWithSuffix_(v24, v33, v32, v34, v35, v36, v37, v38);
  v46 = objc_msgSend_fileURLWithPath_(v23, v40, v39, v41, v42, v43, v44, v45);
  if (IMOSLoggingEnabled())
  {
    v54 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = a3;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v46;
      _os_log_impl(&dword_2129EB000, v54, OS_LOG_TYPE_INFO, "Attempting to clone current transfer URL %@ to new URL %@", buf, 0x16u);
    }
  }
  uint64_t v55 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v47, v48, v49, v50, v51, v52, v53);
  uint64_t v62 = objc_msgSend_fileURLWithPath_(NSURL, v56, (uint64_t)a3, v57, v58, v59, v60, v61);
  LOBYTE(v55) = objc_msgSend_copyItemAtURL_toURL_error_((void *)v55, v63, v62, (uint64_t)v46, (uint64_t)&v158, v64, v65, v66);
  int v67 = IMOSLoggingEnabled();
  if (v55)
  {
    if (v67)
    {
      v72 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2129EB000, v72, OS_LOG_TYPE_INFO, "Connecting to transfer agent", buf, 2u);
      }
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3052000000;
    id v164 = sub_2129ECFF4;
    v165 = sub_2129ED004;
    uint64_t v166 = 0xAAAAAAAAAAAAAAAALL;
    im_primary_queue();
    uint64_t v166 = IMXPCCreateConnectionForServiceWithQueue();
    if (*(void *)(*(void *)&buf[8] + 40))
    {
      uint64_t v153 = MEMORY[0x263EF8330];
      uint64_t v154 = 3221225472;
      v155 = sub_2129ED010;
      v156 = &unk_2641981F8;
      v157 = buf;
      uint64_t v147 = MEMORY[0x263EF8330];
      uint64_t v148 = 3221225472;
      v149 = sub_2129ED0CC;
      v150 = &unk_264198220;
      id v151 = a10;
      v152 = buf;
      IMXPCConfigureConnection();
      xpc_object_t v73 = xpc_dictionary_create(0, 0, 0);
      v81 = objc_msgSend_path(v46, v74, v75, v76, v77, v78, v79, v80);
      uint64_t v89 = objc_msgSend_UTF8String(v81, v82, v83, v84, v85, v86, v87, v88);
      uint64_t v140 = objc_msgSend_UTF8String(a6, v90, v91, v92, v93, v94, v95, v96);
      IMInsertStringsToXPCDictionary();
      uint64_t v139 = objc_msgSend_UTF8String(a4, v97, v98, v99, v100, v101, v102, v103, v89, "transferID", v140, 0);
      IMInsertStringsToXPCDictionary();
      objc_msgSend_UTF8String(a7, v104, v105, v106, v107, v108, v109, v110, v139, 0);
      IMInsertStringsToXPCDictionary();
      IMInsertBoolsToXPCDictionary();
      IMInsertDictionariesToXPCDictionary();
      v118 = objc_msgSend_path(v46, v111, v112, v113, v114, v115, v116, v117, a5, 0, v142, 0);
      objc_msgSend_UTF8String(v118, v119, v120, v121, v122, v123, v124, v125);
      v126 = (void *)sandbox_extension_issue_file();
      if (v126)
      {
        IMInsertStringsToXPCDictionary();
        free(v126);
      }
      else if (IMOSLoggingEnabled())
      {
        v135 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v135, OS_LOG_TYPE_INFO))
        {
          int v136 = *__error();
          *(_DWORD *)v159 = 138412546;
          v160 = v46;
          __int16 v161 = 1024;
          int v162 = v136;
          _os_log_impl(&dword_2129EB000, v135, OS_LOG_TYPE_INFO, "Unable to grant access to path (sandbox extension is NULL) (file path: %@) errno %d", v159, 0x12u);
        }
      }
      v137 = *(_xpc_connection_s **)(*(void *)&buf[8] + 40);
      v138 = im_primary_queue();
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = sub_2129ED26C;
      handler[3] = &unk_264198248;
      int v145 = a9;
      handler[4] = self;
      handler[5] = a3;
      handler[6] = a4;
      handler[7] = a5;
      handler[8] = a6;
      handler[9] = a7;
      BOOL v146 = v142;
      handler[10] = v46;
      handler[11] = a10;
      handler[12] = a11;
      handler[13] = buf;
      xpc_connection_send_message_with_reply(v137, v73, v138, handler);
      xpc_release(v73);
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v133 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v133, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v159 = 0;
          _os_log_impl(&dword_2129EB000, v133, OS_LOG_TYPE_INFO, "Unable to connect to transfer service", v159, 2u);
        }
      }
      if (a11)
      {
        uint64_t v134 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v129, @"IMTransferServicesErrorDomain", -3, 0, v130, v131, v132);
        (*((void (**)(id, id, void, uint64_t, void, void, void, void, void, void))a11 + 2))(a11, a3, 0, v134, 0, 0, 0, 0, 0, 0);
      }
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (v67)
    {
      v127 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v127, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v158;
        _os_log_impl(&dword_2129EB000, v127, OS_LOG_TYPE_INFO, "Cloning failed with error %@, giving up since we're not guaranteed to get a file", buf, 0xCu);
      }
    }
    if (a11)
    {
      uint64_t v128 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v68, @"IMTransferServicesErrorDomain", -2, 0, v69, v70, v71);
      (*((void (**)(id, id, void, uint64_t, void, void, void, void, void, void))a11 + 2))(a11, a3, 0, v128, 0, 0, 0, 0, 0, 0);
    }
  }
}

- (void)sendFilePath:(id)a3 topic:(id)a4 transferID:(id)a5 encryptFile:(BOOL)a6 progressBlock:(id)a7 completionBlock:(id)a8
{
  int v8 = 0;
  objc_msgSend__sendFilePath_topic_userInfo_transferID_sourceAppID_encryptFile_retries_progressBlock_completionBlock_(self, a2, (uint64_t)a3, (uint64_t)a4, 0, (uint64_t)a5, 0, a6, v8, a7, a8);
}

- (void)sendFilePath:(id)a3 topic:(id)a4 userInfo:(id)a5 transferID:(id)a6 encryptFile:(BOOL)a7 progressBlock:(id)a8 completionBlock:(id)a9
{
  int v9 = 0;
  objc_msgSend__sendFilePath_topic_userInfo_transferID_sourceAppID_encryptFile_retries_progressBlock_completionBlock_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, 0, a7, v9, a8, a9);
}

- (void)sendFilePath:(id)a3 topic:(id)a4 userInfo:(id)a5 transferID:(id)a6 sourceAppID:(id)a7 encryptFile:(BOOL)a8 progressBlock:(id)a9 completionBlock:(id)a10
{
  int v10 = 0;
  objc_msgSend__sendFilePath_topic_userInfo_transferID_sourceAppID_encryptFile_retries_progressBlock_completionBlock_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, a8, v10, a9, a10);
}

- (void)_receiveFileTransfer:(id)a3 topic:(id)a4 path:(id)a5 requestURLString:(id)a6 ownerID:(id)a7 sourceAppID:(id)a8 signature:(id)a9 decryptionKey:(id)a10 retries:(int)a11 fileSize:(unint64_t)value progressBlock:(id)a13 completionBlock:(id)a14
{
  uint64_t v134 = *MEMORY[0x263EF8340];
  if (IMOSLoggingEnabled())
  {
    uint64_t v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = a5;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = a3;
      *(_WORD *)&buf[22] = 2112;
      id v131 = a8;
      _os_log_impl(&dword_2129EB000, v18, OS_LOG_TYPE_INFO, "TransferServices received request to receive transfer %@  ID: %@ sourceAppID: %@", buf, 0x20u);
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3052000000;
  id v131 = sub_2129ECFF4;
  uint64_t v132 = sub_2129ED004;
  uint64_t v133 = 0xAAAAAAAAAAAAAAAALL;
  im_primary_queue();
  uint64_t v133 = IMXPCCreateConnectionForServiceWithQueue();
  if (*(void *)(*(void *)&buf[8] + 40))
  {
    v125[7] = MEMORY[0x263EF8330];
    v125[8] = 3221225472;
    v125[9] = sub_2129EDF58;
    v125[10] = &unk_2641981F8;
    v125[11] = buf;
    v125[1] = MEMORY[0x263EF8330];
    v125[2] = 3221225472;
    v125[3] = sub_2129EE014;
    v125[4] = &unk_264198220;
    v125[5] = a13;
    v125[6] = buf;
    IMXPCConfigureConnection();
    xpc_object_t v19 = xpc_dictionary_create(0, 0, 0);
    uint64_t v117 = objc_msgSend_UTF8String(a4, v20, v21, v22, v23, v24, v25, v26);
    IMInsertStringsToXPCDictionary();
    objc_msgSend_UTF8String(a5, v27, v28, v29, v30, v31, v32, v33, v117, 0);
    objc_msgSend_UTF8String(a3, v34, v35, v36, v37, v38, v39, v40);
    uint64_t v48 = objc_msgSend_UTF8String(a7, v41, v42, v43, v44, v45, v46, v47);
    uint64_t v119 = objc_msgSend_UTF8String(a6, v49, v50, v51, v52, v53, v54, v55);
    IMInsertStringsToXPCDictionary();
    IMInsertDatasToXPCDictionary();
    IMInsertBoolsToXPCDictionary();
    uint64_t v118 = objc_msgSend_UTF8String(a8, v56, v57, v58, v59, v60, v61, v62, 0, 0, a10, 0, v48, "urlString", v119, 0);
    IMInsertStringsToXPCDictionary();
    xpc_dictionary_set_uint64(v19, "file-size", value);
    if (a5)
    {
      uint64_t v69 = objc_msgSend_fileURLWithPath_(NSURL, v63, (uint64_t)a5, v64, v65, v66, v67, v68, v118, 0);
      PathComponent = objc_msgSend_URLByDeletingLastPathComponent(v69, v70, v71, v72, v73, v74, v75, v76);
      v125[0] = 0;
      uint64_t v85 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v78, v79, v80, v81, v82, v83, v84);
      if ((objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(v85, v86, (uint64_t)PathComponent, 1, 0, (uint64_t)v125, v87, v88) & 1) == 0)
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v96 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v126 = 138412546;
            v127 = PathComponent;
            __int16 v128 = 2112;
            uint64_t v129 = v125[0];
            _os_log_impl(&dword_2129EB000, v96, OS_LOG_TYPE_INFO, "Unable to create containing directory (%@) with error: %@", v126, 0x16u);
          }
        }
      }
      v97 = objc_msgSend_path(PathComponent, v89, v90, v91, v92, v93, v94, v95);
      objc_msgSend_UTF8String(v97, v98, v99, v100, v101, v102, v103, v104);
      uint64_t v105 = (void *)sandbox_extension_issue_file();
      if (v105)
      {
        IMInsertStringsToXPCDictionary();
        free(v105);
      }
      else if (IMOSLoggingEnabled())
      {
        uint64_t v113 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v113, OS_LOG_TYPE_INFO))
        {
          int v114 = *__error();
          *(_DWORD *)v126 = 138412546;
          v127 = PathComponent;
          __int16 v128 = 1024;
          LODWORD(v129) = v114;
          _os_log_impl(&dword_2129EB000, v113, OS_LOG_TYPE_INFO, "Unable to grant access to path (sandbox extension is NULL) (file path: %@) errno %d", v126, 0x12u);
        }
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v112 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v112, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v126 = 0;
          _os_log_impl(&dword_2129EB000, v112, OS_LOG_TYPE_INFO, "TransferServices received request to receive transfer but the receivePath was NULL", v126, 2u);
        }
      }
      IMReportAutoBugCapture();
    }
    uint64_t v115 = *(_xpc_connection_s **)(*(void *)&buf[8] + 40);
    uint64_t v116 = im_primary_queue();
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = sub_2129EE1B4;
    handler[3] = &unk_264198270;
    int v124 = a11;
    handler[4] = self;
    handler[5] = a3;
    handler[6] = a4;
    handler[7] = a5;
    handler[8] = a6;
    handler[9] = a7;
    handler[10] = a8;
    handler[11] = a9;
    handler[12] = a10;
    handler[13] = a13;
    void handler[14] = a14;
    handler[15] = buf;
    handler[16] = value;
    xpc_connection_send_message_with_reply(v115, v19, v116, handler);
    xpc_release(v19);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v110 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v126 = 0;
        _os_log_impl(&dword_2129EB000, v110, OS_LOG_TYPE_INFO, "Unable to connect to transfer service", v126, 2u);
      }
    }
    if (a14)
    {
      uint64_t v111 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v106, @"IMTransferServicesErrorDomain", -3, 0, v107, v108, v109);
      (*((void (**)(id, id, id, void, uint64_t, void))a14 + 2))(a14, a3, a5, 0, v111, 0);
    }
  }
  _Block_object_dispose(buf, 8);
}

- (void)receiveFileTransfer:(id)a3 topic:(id)a4 path:(id)a5 requestURLString:(id)a6 ownerID:(id)a7 signature:(id)a8 decryptionKey:(id)a9 fileSize:(unint64_t)a10 progressBlock:(id)a11 completionBlock:(id)a12
{
  int v12 = 0;
  objc_msgSend__receiveFileTransfer_topic_path_requestURLString_ownerID_sourceAppID_signature_decryptionKey_retries_fileSize_progressBlock_completionBlock_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, 0, a8, a9, v12, a10, a11, a12);
}

- (void)receiveFileTransfer:(id)a3 topic:(id)a4 path:(id)a5 requestURLString:(id)a6 ownerID:(id)a7 sourceAppID:(id)a8 signature:(id)a9 decryptionKey:(id)a10 fileSize:(unint64_t)a11 progressBlock:(id)a12 completionBlock:(id)a13
{
  int v13 = 0;
  objc_msgSend__receiveFileTransfer_topic_path_requestURLString_ownerID_sourceAppID_signature_decryptionKey_retries_fileSize_progressBlock_completionBlock_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, (uint64_t)a8, a9, a10, v13, a11, a12, a13);
}

- (void)cancelSendTransferID:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = a3;
      _os_log_impl(&dword_2129EB000, v4, OS_LOG_TYPE_INFO, "TransferServices received request to cancel send: %@", (uint8_t *)&buf, 0xCu);
    }
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v22 = 0x3052000000;
  uint64_t v23 = sub_2129ECFF4;
  uint64_t v24 = sub_2129ED004;
  uint64_t v25 = 0xAAAAAAAAAAAAAAAALL;
  im_primary_queue();
  uint64_t v25 = IMXPCCreateConnectionForServiceWithQueue();
  if (*(void *)(*((void *)&buf + 1) + 40))
  {
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    uint64_t v18 = sub_2129EE890;
    xpc_object_t v19 = &unk_2641981F8;
    p_long long buf = &buf;
    IMXPCConfigureConnection();
    xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
    IMInsertBoolsToXPCDictionary();
    objc_msgSend_UTF8String(a3, v6, v7, v8, v9, v10, v11, v12, 1, 0);
    IMInsertStringsToXPCDictionary();
    xpc_connection_send_message(*(xpc_connection_t *)(*((void *)&buf + 1) + 40), v5);
    xpc_release(v5);
    int v13 = *(_xpc_connection_s **)(*((void *)&buf + 1) + 40);
    if (v13)
    {
      xpc_connection_cancel(v13);
      xpc_release(*(xpc_object_t *)(*((void *)&buf + 1) + 40));
      *(void *)(*((void *)&buf + 1) + 40) = 0;
    }
  }
  else if (IMOSLoggingEnabled())
  {
    v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_2129EB000, v14, OS_LOG_TYPE_INFO, "Unable to connect to transfer service", v15, 2u);
    }
  }
  _Block_object_dispose(&buf, 8);
}

- (void)preWarmMMCSForOwnerID:(id)a3
{
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_2129EB000, v3, OS_LOG_TYPE_INFO, "TransferServices received request to prewarm MMCS connection", buf, 2u);
    }
  }
  *(void *)long long buf = 0;
  uint64_t v20 = buf;
  uint64_t v21 = 0x3052000000;
  uint64_t v22 = sub_2129ECFF4;
  uint64_t v23 = sub_2129ED004;
  uint64_t v24 = 0xAAAAAAAAAAAAAAAALL;
  im_primary_queue();
  uint64_t v24 = IMXPCCreateConnectionForServiceWithQueue();
  if (*((void *)v20 + 5))
  {
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    uint64_t v16 = sub_2129EEBF8;
    uint64_t v17 = &unk_2641981F8;
    uint64_t v18 = buf;
    uint64_t v9 = MEMORY[0x263EF8330];
    uint64_t v10 = 3221225472;
    uint64_t v11 = sub_2129EEC48;
    uint64_t v12 = &unk_2641982B8;
    int v13 = buf;
    IMXPCConfigureConnection();
    xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
    IMInsertBoolsToXPCDictionary();
    IMInsertStringsToXPCDictionary();
    xpc_connection_send_message(*((xpc_connection_t *)v20 + 5), v4);
    if (IMOSLoggingEnabled())
    {
      xpc_object_t v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v8 = 0;
        _os_log_impl(&dword_2129EB000, v5, OS_LOG_TYPE_INFO, "send prewarm message to transfer agent", v8, 2u);
      }
    }
    xpc_release(v4);
    v6 = (_xpc_connection_s *)*((void *)v20 + 5);
    if (v6)
    {
      xpc_connection_cancel(v6);
      xpc_release(*((xpc_object_t *)v20 + 5));
      *((void *)v20 + 5) = 0;
    }
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_2129EB000, v7, OS_LOG_TYPE_INFO, "Unable to connect to transfer service", v8, 2u);
    }
  }
  _Block_object_dispose(buf, 8);
}

- (void)getNicknameWithRecordID:(id)a3 decryptionKey:(id)a4 completionBlock:(id)a5
{
}

- (void)getNicknameWithRecordID:(id)a3 decryptionKey:(id)a4 wallpaperDataTag:(id)a5 wallpaperLowResDataTag:(id)a6 wallpaperMetadataTag:(id)a7 completionBlock:(id)a8
{
}

- (void)getNicknameWithRecordID:(id)a3 decryptionKey:(id)a4 wallpaperDataTag:(id)a5 wallpaperLowResDataTag:(id)a6 wallpaperMetadataTag:(id)a7 isKnownSender:(BOOL)a8 completionBlock:(id)a9
{
  char v9 = 1;
  objc_msgSend_getNicknameWithRecordID_decryptionKey_wallpaperDataTag_wallpaperLowResDataTag_wallpaperMetadataTag_isKnownSender_shouldDecodeImageFields_completionBlock_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, a8, v9, a9);
}

- (void)getNicknameWithRecordID:(id)a3 decryptionKey:(id)a4 wallpaperDataTag:(id)a5 wallpaperLowResDataTag:(id)a6 wallpaperMetadataTag:(id)a7 isKnownSender:(BOOL)a8 shouldDecodeImageFields:(BOOL)a9 completionBlock:(id)a10
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  if (IMOSLoggingEnabled())
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = a3;
      _os_log_impl(&dword_2129EB000, v11, OS_LOG_TYPE_INFO, "TransferServices received request to get nickname with record ID %@", (uint8_t *)&buf, 0xCu);
    }
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v42 = 0x3052000000;
  uint64_t v43 = sub_2129ECFF4;
  uint64_t v44 = sub_2129ED004;
  uint64_t v45 = 0xAAAAAAAAAAAAAAAALL;
  im_primary_queue();
  uint64_t v45 = IMXPCCreateConnectionForServiceWithQueue();
  if (*(void *)(*((void *)&buf + 1) + 40))
  {
    uint64_t v36 = MEMORY[0x263EF8330];
    uint64_t v37 = 3221225472;
    uint64_t v38 = sub_2129EF270;
    uint64_t v39 = &unk_2641981F8;
    p_long long buf = &buf;
    uint64_t v31 = MEMORY[0x263EF8330];
    uint64_t v32 = 3221225472;
    uint64_t v33 = sub_2129EF2C0;
    uint64_t v34 = &unk_2641982B8;
    uint64_t v35 = &buf;
    IMXPCConfigureConnection();
    xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
    IMInsertBoolsToXPCDictionary();
    objc_msgSend_UTF8String(a3, v13, v14, v15, v16, v17, v18, v19, 1, 0);
    IMInsertStringsToXPCDictionary();
    IMInsertDatasToXPCDictionary();
    IMInsertDatasToXPCDictionary();
    IMInsertDatasToXPCDictionary();
    IMInsertDatasToXPCDictionary();
    IMInsertBoolsToXPCDictionary();
    IMInsertBoolsToXPCDictionary();
    if (IMOSLoggingEnabled())
    {
      uint64_t v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v30 = 0;
        _os_log_impl(&dword_2129EB000, v20, OS_LOG_TYPE_INFO, "Sending get nickname message to transfer agent", v30, 2u);
      }
    }
    uint64_t v21 = *(_xpc_connection_s **)(*((void *)&buf + 1) + 40);
    uint64_t v22 = im_primary_queue();
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = sub_2129EF3EC;
    handler[3] = &unk_2641982E0;
    handler[4] = a10;
    handler[5] = &buf;
    xpc_connection_send_message_with_reply(v21, v12, v22, handler);
    xpc_release(v12);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v27 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v30 = 0;
        _os_log_impl(&dword_2129EB000, v27, OS_LOG_TYPE_INFO, "Unable to connect to transfer service", v30, 2u);
      }
    }
    uint64_t v28 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v23, @"IMTransferServicesErrorDomain", -3, 0, v24, v25, v26);
    if (a10) {
      (*((void (**)(id, void, uint64_t))a10 + 2))(a10, 0, v28);
    }
  }
  _Block_object_dispose(&buf, 8);
}

- (void)setPersonalNickname:(id)a3 oldRecordID:(id)a4 completionBlock:(id)a5
{
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_2129EF77C;
  v8[3] = &unk_264198308;
  v8[4] = a5;
  objc_msgSend_setPersonalNickname_oldRecordID_completionBlockWithWallpaperTags_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)v8, v5, v6, v7);
}

- (void)setPersonalNickname:(id)a3 oldRecordID:(id)a4 completionBlockWithWallpaperTags:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412546;
      *(void *)&buf[4] = a3;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = a4;
      _os_log_impl(&dword_2129EB000, v8, OS_LOG_TYPE_INFO, "TransferServices received request to upload new personal nickname: %@ and delete record with ID: %@", buf, 0x16u);
    }
  }
  *(void *)long long buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&buf[16] = 0x3052000000;
  uint64_t v32 = sub_2129ECFF4;
  uint64_t v33 = sub_2129ED004;
  uint64_t v34 = 0xAAAAAAAAAAAAAAAALL;
  im_primary_queue();
  uint64_t v34 = IMXPCCreateConnectionForServiceWithQueue();
  if (*(void *)(*(void *)&buf[8] + 40))
  {
    uint64_t v26 = MEMORY[0x263EF8330];
    uint64_t v27 = 3221225472;
    uint64_t v28 = sub_2129EFBB8;
    uint64_t v29 = &unk_2641981F8;
    uint64_t v30 = buf;
    uint64_t v21 = MEMORY[0x263EF8330];
    uint64_t v22 = 3221225472;
    uint64_t v23 = sub_2129EFC08;
    uint64_t v24 = &unk_2641982B8;
    uint64_t v25 = buf;
    IMXPCConfigureConnection();
    xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
    IMInsertBoolsToXPCDictionary();
    IMInsertKeyedCodableObjectsToXPCDictionary();
    IMInsertNSStringsToXPCDictionary();
    if (IMOSLoggingEnabled())
    {
      uint64_t v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v20 = 0;
        _os_log_impl(&dword_2129EB000, v10, OS_LOG_TYPE_INFO, "Sending upload nickname message to transfer agent", v20, 2u);
      }
    }
    uint64_t v11 = *(_xpc_connection_s **)(*(void *)&buf[8] + 40);
    xpc_object_t v12 = im_primary_queue();
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = sub_2129EFD34;
    handler[3] = &unk_2641982E0;
    handler[4] = a5;
    handler[5] = buf;
    xpc_connection_send_message_with_reply(v11, v9, v12, handler);
    xpc_release(v9);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v20 = 0;
        _os_log_impl(&dword_2129EB000, v17, OS_LOG_TYPE_INFO, "Unable to connect to transfer service", v20, 2u);
      }
    }
    uint64_t v18 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v13, @"IMTransferServicesErrorDomain", -3, 0, v14, v15, v16);
    if (a5) {
      (*((void (**)(id, void, void, void, void, void, void, void, uint64_t))a5 + 2))(a5, 0, 0, 0, 0, 0, 0, 0, v18);
    }
  }
  _Block_object_dispose(buf, 8);
}

- (void)deleteAllPersonalNicknamesWithCompletion:(id)a3
{
  if (IMOSLoggingEnabled())
  {
    xpc_object_t v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_2129EB000, v4, OS_LOG_TYPE_INFO, "TransferServices received requestd to delete all nicknames", buf, 2u);
    }
  }
  *(void *)long long buf = 0;
  uint64_t v28 = buf;
  uint64_t v29 = 0x3052000000;
  uint64_t v30 = sub_2129ECFF4;
  uint64_t v31 = sub_2129ED004;
  uint64_t v32 = 0xAAAAAAAAAAAAAAAALL;
  im_primary_queue();
  uint64_t v32 = IMXPCCreateConnectionForServiceWithQueue();
  if (*((void *)v28 + 5))
  {
    uint64_t v22 = MEMORY[0x263EF8330];
    uint64_t v23 = 3221225472;
    uint64_t v24 = sub_2129F04AC;
    uint64_t v25 = &unk_2641981F8;
    uint64_t v26 = buf;
    uint64_t v17 = MEMORY[0x263EF8330];
    uint64_t v18 = 3221225472;
    uint64_t v19 = sub_2129F04FC;
    uint64_t v20 = &unk_2641982B8;
    uint64_t v21 = buf;
    IMXPCConfigureConnection();
    xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
    IMInsertBoolsToXPCDictionary();
    if (IMOSLoggingEnabled())
    {
      uint64_t v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v16 = 0;
        _os_log_impl(&dword_2129EB000, v6, OS_LOG_TYPE_INFO, "Sending delete all nicknames message to transfer agent", v16, 2u);
      }
    }
    uint64_t v7 = (_xpc_connection_s *)*((void *)v28 + 5);
    uint64_t v8 = im_primary_queue();
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = sub_2129F0628;
    handler[3] = &unk_2641982E0;
    handler[4] = a3;
    handler[5] = buf;
    xpc_connection_send_message_with_reply(v7, v5, v8, handler);
    xpc_release(v5);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      int v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v16 = 0;
        _os_log_impl(&dword_2129EB000, v13, OS_LOG_TYPE_INFO, "Unable to connect to transfer service", v16, 2u);
      }
    }
    uint64_t v14 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v9, @"IMTransferServicesErrorDomain", -3, 0, v10, v11, v12);
    if (a3) {
      (*((void (**)(id, void, uint64_t))a3 + 2))(a3, 0, v14);
    }
  }
  _Block_object_dispose(buf, 8);
}

@end
@interface IMSnapshotTranscoder
+ (void)generateSnapshotForMessageGUID:(id)a3 payloadURL:(id)a4 balloonBundleID:(id)a5 senderContext:(id)a6 completionBlock:(id)a7;
@end

@implementation IMSnapshotTranscoder

+ (void)generateSnapshotForMessageGUID:(id)a3 payloadURL:(id)a4 balloonBundleID:(id)a5 senderContext:(id)a6 completionBlock:(id)a7
{
  uint64_t v106 = *MEMORY[0x263EF8340];
  uint64_t v12 = IMBalloonExtensionIDWithSuffix();
  if (objc_msgSend_isEqualToString_(a5, v13, v12, v14, v15, v16, v17))
  {
    uint64_t v18 = MEMORY[0x230F43EE0](@"PKPeerPaymentBubbleView", @"PassKitUI");
    v19 = (void *)MEMORY[0x230F43EE0](@"CKUIBehavior", @"ChatKit");
    v26 = objc_msgSend_sharedBehaviors(v19, v20, v21, v22, v23, v24, v25);
    uint64_t v33 = objc_msgSend_isFromMe(a6, v27, v28, v29, v30, v31, v32);
    objc_msgSend_pluginBalloonInsetsForMessageFromMe_(v26, v34, v33, v35, v36, v37, v38);
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v102 = 0x3052000000;
    v103 = sub_22B29817C;
    v104 = sub_22B29818C;
    uint64_t v105 = 0;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_22B298198;
    block[3] = &unk_26488EA80;
    block[4] = v18;
    block[5] = a4;
    block[8] = v39;
    block[9] = v40;
    block[10] = v41;
    block[11] = v42;
    block[6] = a6;
    block[7] = &buf;
    dispatch_sync(MEMORY[0x263EF83A0], block);
    if (objc_msgSend_length(*(void **)(*((void *)&buf + 1) + 40), v43, v44, v45, v46, v47, v48))
    {
      v49 = (void *)IMPluginSnapshotCachesFileURL();
      uint64_t PathComponent = objc_msgSend_URLByDeletingLastPathComponent(v49, v50, v51, v52, v53, v54, v55);
      uint64_t v93 = 0;
      if (PathComponent)
      {
        v63 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v56, v57, v58, v59, v60, v61);
        if (objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(v63, v64, PathComponent, 1, 0, (uint64_t)&v93, v65))
        {
          uint64_t v92 = 0;
          uint64_t v69 = objc_msgSend_writeToURL_options_error_(*(void **)(*((void *)&buf + 1) + 40), v66, (uint64_t)v49, 0, (uint64_t)&v92, v67, v68);
          if (v69)
          {
            uint64_t v70 = 0;
          }
          else
          {
            if (IMOSLoggingEnabled())
            {
              v91 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)v95 = 138412546;
                id v96 = a3;
                __int16 v97 = 2112;
                uint64_t v98 = v92;
                _os_log_impl(&dword_22B280000, v91, OS_LOG_TYPE_INFO, "Failed to write snapshot for message %@ Error: %@", v95, 0x16u);
              }
            }
            uint64_t v70 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v88, @"__kIMTranscodeErrorDomain", -10, 0, v89, v90);
          }
          goto LABEL_20;
        }
      }
      if (IMOSLoggingEnabled())
      {
        v79 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v95 = 138412802;
          id v96 = a3;
          __int16 v97 = 2112;
          uint64_t v98 = PathComponent;
          __int16 v99 = 2112;
          uint64_t v100 = v93;
          _os_log_impl(&dword_22B280000, v79, OS_LOG_TYPE_INFO, "Failed to create snapshot directory for message %@ with url %@ Error: %@", v95, 0x20u);
        }
      }
      uint64_t v80 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v76, @"__kIMTranscodeErrorDomain", -12, 0, v77, v78);
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v84 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
        {
          uint64_t v85 = *(void *)(*((void *)&buf + 1) + 40);
          *(_DWORD *)v95 = 138412546;
          id v96 = a3;
          __int16 v97 = 2112;
          uint64_t v98 = v85;
          _os_log_impl(&dword_22B280000, v84, OS_LOG_TYPE_INFO, "Failed to generate snapshot for message %@ %@", v95, 0x16u);
        }
      }
      uint64_t v80 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v81, @"__kIMTranscodeErrorDomain", -9, 0, v82, v83);
    }
    uint64_t v70 = v80;
    uint64_t v69 = 0;
LABEL_20:
    if (IMOSLoggingEnabled())
    {
      v86 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
      {
        uint64_t v87 = *(void *)(*((void *)&buf + 1) + 40);
        *(_DWORD *)v95 = 138412546;
        id v96 = a3;
        __int16 v97 = 2112;
        uint64_t v98 = v87;
        _os_log_impl(&dword_22B280000, v86, OS_LOG_TYPE_INFO, "Generated snapshot for message %@ %@", v95, 0x16u);
      }
    }

    (*((void (**)(id, uint64_t, uint64_t))a7 + 2))(a7, v69, v70);
    _Block_object_dispose(&buf, 8);
    return;
  }
  if (IMOSLoggingEnabled())
  {
    v74 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = a5;
      _os_log_impl(&dword_22B280000, v74, OS_LOG_TYPE_INFO, "Transcoder snapshot request for an unsupported plugin bundle: %@", (uint8_t *)&buf, 0xCu);
    }
  }
  uint64_t v75 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v71, @"__kIMTranscodeErrorDomain", -1, 0, v72, v73);
  (*((void (**)(id, void, uint64_t))a7 + 2))(a7, 0, v75);
}

@end
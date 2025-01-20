@interface IMFallbackTranscoder
- (IMFallbackTranscoder_AudioMessage)audioTranscoder;
- (id)_findPluginFallbackEncoder:(id)a3 withBalloonBundleID:(id)a4;
- (void)_transcodeAudioMessageContents:(id)a3 utiType:(id)a4 completionBlock:(id)a5;
- (void)_transcodeAutoloopContents:(id)a3 utiType:(id)a4 completionBlock:(id)a5;
- (void)dealloc;
- (void)setAudioTranscoder:(id)a3;
- (void)transcodeFileTransferContents:(id)a3 utiType:(id)a4 transcoderUserInfo:(id)a5 completionBlock:(id)a6;
- (void)transcodeFileTransferData:(id)a3 balloonBundleID:(id)a4 attachments:(id)a5 inFileURL:(id)a6 fallBack:(BOOL)a7 completionBlock:(id)a8;
@end

@implementation IMFallbackTranscoder

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)IMFallbackTranscoder;
  [(IMFallbackTranscoder *)&v3 dealloc];
}

- (id)_findPluginFallbackEncoder:(id)a3 withBalloonBundleID:(id)a4
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  uint64_t v73 = *MEMORY[0x263F4A9E8];
  uint64_t v9 = objc_msgSend_rangeOfString_(a4, a2, *MEMORY[0x263F4A9E8], (uint64_t)a4, v4, v5, v6);
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v10, (uint64_t)&v74, (uint64_t)v82, 16, v11, v12);
  if (v18)
  {
    uint64_t v19 = *(void *)v75;
    while (2)
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v75 != v19) {
          objc_enumerationMutation(a3);
        }
        uint64_t v21 = objc_msgSend_fileURLWithPath_(NSURL, v13, *(void *)(*((void *)&v74 + 1) + 8 * v20), v14, v15, v16, v17);
        id v22 = objc_alloc(MEMORY[0x263F086E0]);
        id v28 = (id)objc_msgSend_initWithURL_(v22, v23, v21, v24, v25, v26, v27);
        v35 = objc_msgSend_bundleIdentifier(v28, v29, v30, v31, v32, v33, v34);
        if ((objc_msgSend_isEqualToString_(v35, v36, (uint64_t)a4, v37, v38, v39, v40) & 1) != 0
          || !v9 && objc_msgSend_isEqualToString_(v35, v13, v73, v14, v15, v16, v17))
        {
          v42 = objc_msgSend_infoDictionary(v28, v13, v41, v14, v15, v16, v17);
          v48 = (NSString *)objc_msgSend_objectForKey_(v42, v43, @"CKFallbackClass", v44, v45, v46, v47);
          if (objc_msgSend_length(v48, v49, v50, v51, v52, v53, v54))
          {
            objc_msgSend_load(v28, v13, v55, v14, v15, v16, v17);
            v56 = NSClassFromString(v48);
            uint64_t v57 = IMBalloonExtensionIDWithSuffix();
            if (objc_msgSend_isEqualToString_(a4, v58, v57, v59, v60, v61, v62)) {
              v56 = NSClassFromString(&cfstr_Msphotosextens.isa);
            }
            id v63 = objc_alloc_init(v56);
            if (objc_msgSend_conformsToProtocol_(v63, v64, (uint64_t)&unk_26DE8E2E0, v65, v66, v67, v68))
            {
              if (IMOSLoggingEnabled())
              {
                v71 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  id v79 = a4;
                  __int16 v80 = 2112;
                  id v81 = v63;
                  _os_log_impl(&dword_22B280000, v71, OS_LOG_TYPE_INFO, "Found encoder to get bundle for identifier %@, encoder %@", buf, 0x16u);
                }
              }
              return v63;
            }
          }
        }
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v13, (uint64_t)&v74, (uint64_t)v82, 16, v16, v17);
      if (v18) {
        continue;
      }
      break;
    }
  }
  if (IMOSLoggingEnabled())
  {
    v69 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v79 = a4;
      _os_log_impl(&dword_22B280000, v69, OS_LOG_TYPE_INFO, "Failed to get bundle for identifier %@", buf, 0xCu);
    }
  }
  return 0;
}

- (void)transcodeFileTransferData:(id)a3 balloonBundleID:(id)a4 attachments:(id)a5 inFileURL:(id)a6 fallBack:(BOOL)a7 completionBlock:(id)a8
{
  BOOL v9 = a7;
  uint64_t v52 = *MEMORY[0x263EF8340];
  uint64_t v15 = IMBalloonProviderBundlePaths();
  PluginFallbackEncoder_withBalloonBundleID = objc_msgSend__findPluginFallbackEncoder_withBalloonBundleID_(self, v16, v15, (uint64_t)a4, v17, v18, v19);
  if (PluginFallbackEncoder_withBalloonBundleID)
  {
    uint64_t v21 = PluginFallbackEncoder_withBalloonBundleID;
    id v22 = PluginFallbackEncoder_withBalloonBundleID;
    if (v9)
    {
      if (objc_opt_respondsToSelector())
      {
        uint64_t v28 = objc_msgSend___imArrayByApplyingBlock_(a5, v23, (uint64_t)&unk_26DE875F8, v24, v25, v26, v27);
        v45[0] = MEMORY[0x263EF8330];
        v45[1] = 3221225472;
        v45[2] = sub_22B298A2C;
        v45[3] = &unk_26488EAC8;
        v45[4] = a3;
        v45[5] = a6;
        v45[7] = v21;
        v45[8] = a8;
        v45[6] = a5;
        objc_msgSend_fallbackForData_attachments_inFileURL_completionBlockWithText_(v21, v29, (uint64_t)a3, v28, (uint64_t)a6, (uint64_t)v45, v30);
      }
      else
      {
        v44[0] = MEMORY[0x263EF8330];
        v44[1] = 3221225472;
        v44[2] = sub_22B298BE8;
        v44[3] = &unk_26488EAF0;
        v44[4] = a3;
        v44[5] = a6;
        v44[7] = v21;
        v44[8] = a8;
        v44[6] = a5;
        objc_msgSend_fallbackForData_inFileURL_completionBlock_(v21, v23, (uint64_t)a3, (uint64_t)a6, (uint64_t)v44, v26, v27);
      }
    }
    else if (objc_opt_respondsToSelector())
    {
      if (IMOSLoggingEnabled())
      {
        v35 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          id v47 = v21;
          __int16 v48 = 2080;
          v49 = "Dec  6 2024";
          __int16 v50 = 2080;
          uint64_t v51 = "18:52:34";
          _os_log_impl(&dword_22B280000, v35, OS_LOG_TYPE_INFO, "******** found encoder ******** %@ that responds to fullQualityForData %s %s", buf, 0x20u);
        }
      }
      v43[0] = MEMORY[0x263EF8330];
      v43[1] = 3221225472;
      v43[2] = sub_22B298D98;
      v43[3] = &unk_26488EB18;
      v43[4] = v21;
      v43[5] = a8;
      objc_msgSend_fullQualityForData_inFileURL_completionBlock_(v21, v32, (uint64_t)a3, (uint64_t)a6, (uint64_t)v43, v33, v34);
    }
    else
    {
      char v36 = objc_opt_respondsToSelector();
      int v37 = IMOSLoggingEnabled();
      if (v36)
      {
        if (v37)
        {
          uint64_t v40 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412802;
            id v47 = v21;
            __int16 v48 = 2080;
            v49 = "Dec  6 2024";
            __int16 v50 = 2080;
            uint64_t v51 = "18:52:34";
            _os_log_impl(&dword_22B280000, v40, OS_LOG_TYPE_INFO, "******** found encoder ******** %@ that responds to fullQualityForData:attachments:inFileURL:completionBlock: %s %s", buf, 0x20u);
          }
        }
        v42[0] = MEMORY[0x263EF8330];
        v42[1] = 3221225472;
        v42[2] = sub_22B298F04;
        v42[3] = &unk_26488EB40;
        v42[4] = v21;
        v42[5] = a8;
        objc_msgSend_fullQualityForData_attachments_inFileURL_completionBlock_(v21, v38, (uint64_t)a3, 0, (uint64_t)a6, (uint64_t)v42, v39);
      }
      else
      {
        if (v37)
        {
          uint64_t v41 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v47 = v21;
            _os_log_impl(&dword_22B280000, v41, OS_LOG_TYPE_INFO, "******* did NOT ****** find encoder %@ that responds to fullQualityForData", buf, 0xCu);
          }
        }
        (*((void (**)(id, void, void, void, uint64_t, void))a8 + 2))(a8, 0, 0, 0, 1, 0);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v31 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v47 = a4;
        _os_log_impl(&dword_22B280000, v31, OS_LOG_TYPE_INFO, "IMTranscoding. No encoder found for balloon id %@", buf, 0xCu);
      }
    }
    (*((void (**)(id, void, void, void, uint64_t, void))a8 + 2))(a8, 0, 0, 0, 1, 0);
  }
}

- (void)transcodeFileTransferContents:(id)a3 utiType:(id)a4 transcoderUserInfo:(id)a5 completionBlock:(id)a6
{
  uint64_t v11 = objc_msgSend_objectForKey_(a5, a2, *MEMORY[0x263F4ABC8], (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, v6);
  if (objc_msgSend_BOOLValue(v11, v12, v13, v14, v15, v16, v17))
  {
    MEMORY[0x270F9A6D0](self, sel__transcodeAudioMessageContents_utiType_completionBlock_, a3, a4, a6, v18, v19);
  }
  else
  {
    MEMORY[0x270F9A6D0](self, sel__transcodeAutoloopContents_utiType_completionBlock_, a3, a4, a6, v18, v19);
  }
}

- (void)_transcodeAutoloopContents:(id)a3 utiType:(id)a4 completionBlock:(id)a5
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  BOOL v9 = objc_msgSend_defaultManager(MEMORY[0x263F08850], a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, v5, v6);
  PathComponent = objc_msgSend_lastPathComponent(a3, v10, v11, v12, v13, v14, v15);
  uint64_t v23 = objc_msgSend_stringByDeletingPathExtension(PathComponent, v17, v18, v19, v20, v21, v22);
  uint64_t v28 = objc_msgSend__randomTemporaryPathWithSuffix_fileName_(v9, v24, @"gif", v23, v25, v26, v27);
  uint64_t v34 = objc_msgSend_fileURLWithPath_(NSURL, v29, v28, v30, v31, v32, v33);
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3052000000;
  v38[3] = sub_22B2993B8;
  v38[4] = sub_22B2993C8;
  v38[5] = 0;
  if (qword_2683E9598 != -1) {
    dispatch_once(&qword_2683E9598, &unk_26DE876B8);
  }
  if (off_2683E9590)
  {
    if (IMOSLoggingEnabled())
    {
      v35 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v40 = a3;
        __int16 v41 = 2112;
        uint64_t v42 = v34;
        _os_log_impl(&dword_22B280000, v35, OS_LOG_TYPE_INFO, "Transcoding GIF {source: %@, target: %@}", buf, 0x16u);
      }
    }
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = sub_22B299504;
    v37[3] = &unk_26488EB88;
    v37[4] = v34;
    v37[5] = a5;
    v37[6] = v38;
    off_2683E9590(a3, v34, &unk_26DE876D8, v37);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      char v36 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22B280000, v36, OS_LOG_TYPE_INFO, "IMTranscoding. PFCreateGIFFromVideoURL function not available", buf, 2u);
      }
    }
    (*((void (**)(id, void, void, void, void, void))a5 + 2))(a5, 0, 0, 0, 0, 0);
  }
  _Block_object_dispose(v38, 8);
}

- (void)_transcodeAudioMessageContents:(id)a3 utiType:(id)a4 completionBlock:(id)a5
{
  uint64_t v9 = objc_msgSend_audioTranscoder(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, v5, v6);
  MEMORY[0x270F9A6D0](v9, sel_transcodeOpusFile_completionBlock_, a3, a5, v10, v11, v12);
}

- (IMFallbackTranscoder_AudioMessage)audioTranscoder
{
  result = self->_audioTranscoder;
  if (!result)
  {
    result = objc_alloc_init(IMFallbackTranscoder_AudioMessage);
    self->_audioTranscoder = result;
  }
  return result;
}

- (void)setAudioTranscoder:(id)a3
{
}

@end
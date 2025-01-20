@interface IMTransferServicesCompressionController
+ (id)sharedInstance;
- (void)_mapCopier:(id)a3 toBlock:(id)a4;
- (void)_unmapCopier:(id)a3;
- (void)compressFileTransfer:(id)a3 completionBlock:(id)a4;
- (void)fileCopierDidFinish:(id)a3;
- (void)fileCopierDidStart:(id)a3;
@end

@implementation IMTransferServicesCompressionController

+ (id)sharedInstance
{
  if (qword_26ACD2D38 != -1) {
    dispatch_once(&qword_26ACD2D38, &unk_26C3CBE40);
  }
  return (id)qword_26ACD2D48;
}

- (void)_mapCopier:(id)a3 toBlock:(id)a4
{
  if (a3 && a4)
  {
    blockMap = self->_blockMap;
    if (!blockMap)
    {
      blockMap = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      self->_blockMap = blockMap;
    }
    id v12 = (id)objc_msgSend_copy(a4, a2, (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7);
    uint64_t v20 = objc_msgSend_identifier(a3, v13, v14, v15, v16, v17, v18, v19);
    MEMORY[0x270F9A6D0](blockMap, sel_setObject_forKey_, v12, v20, v21, v22, v23, v24);
  }
}

- (void)_unmapCopier:(id)a3
{
  if (a3 && objc_msgSend_identifier(a3, a2, (uint64_t)a3, v3, v4, v5, v6, v7))
  {
    blockMap = self->_blockMap;
    uint64_t v18 = objc_msgSend_identifier(a3, v10, v11, v12, v13, v14, v15, v16);
    objc_msgSend_removeObjectForKey_(blockMap, v19, v18, v20, v21, v22, v23, v24);
    if (!objc_msgSend_count(self->_blockMap, v25, v26, v27, v28, v29, v30, v31))
    {

      self->_blockMap = 0;
    }
  }
}

- (void)compressFileTransfer:(id)a3 completionBlock:(id)a4
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  if (a4)
  {
    if (a3)
    {
      char v54 = 0;
      uint64_t v11 = objc_msgSend_defaultManager(MEMORY[0x263F08850], a2, (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7);
      uint64_t v19 = objc_msgSend_path(a3, v12, v13, v14, v15, v16, v17, v18);
      if (objc_msgSend_fileExistsAtPath_isDirectory_(v11, v20, v19, (uint64_t)&v54, v21, v22, v23, v24))
      {
        if (v54)
        {
          id v25 = objc_alloc(MEMORY[0x263F4A828]);
          uint64_t v33 = objc_msgSend_stringGUID(NSString, v26, v27, v28, v29, v30, v31, v32);
          v36 = objc_msgSend_initWithInputURL_outputURL_identifier_operation_delegate_(v25, v34, (uint64_t)a3, 0, v33, 0, (uint64_t)self, v35);
          objc_msgSend__mapCopier_toBlock_(self, v37, (uint64_t)v36, (uint64_t)a4, v38, v39, v40, v41);
          if (IMOSLoggingEnabled())
          {
            v49 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
            {
              int v55 = 138412290;
              id v56 = a3;
              _os_log_impl(&dword_2129EB000, v49, OS_LOG_TYPE_INFO, "Starting compression for URL: %@", (uint8_t *)&v55, 0xCu);
            }
          }
          objc_msgSend_start(v36, v42, v43, v44, v45, v46, v47, v48);
        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            v53 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
            {
              int v55 = 138412290;
              id v56 = a3;
              _os_log_impl(&dword_2129EB000, v53, OS_LOG_TYPE_INFO, "URL supplied (%@) is not a directory, marking as not needed", (uint8_t *)&v55, 0xCu);
            }
          }
          (*((void (**)(id, id, id, void, uint64_t, void))a4 + 2))(a4, a3, a3, 0, 1, 0);
        }
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          v52 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
          {
            int v55 = 138412290;
            id v56 = a3;
            _os_log_impl(&dword_2129EB000, v52, OS_LOG_TYPE_INFO, "File doesn't exist at source path (%@), failing compression", (uint8_t *)&v55, 0xCu);
          }
        }
        (*((void (**)(id, id, id, void, void, void))a4 + 2))(a4, a3, a3, 0, 0, 0);
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v51 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        {
          LOWORD(v55) = 0;
          _os_log_impl(&dword_2129EB000, v51, OS_LOG_TYPE_INFO, "No transfer URL supplied, failing", (uint8_t *)&v55, 2u);
        }
      }
      (*((void (**)(id, void, void, void, void, void))a4 + 2))(a4, 0, 0, 0, 0, 0);
    }
  }
  else if (IMOSLoggingEnabled())
  {
    v50 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
    {
      LOWORD(v55) = 0;
      _os_log_impl(&dword_2129EB000, v50, OS_LOG_TYPE_INFO, "No input block for transfer URL, failing", (uint8_t *)&v55, 2u);
    }
  }
}

- (void)fileCopierDidStart:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (IMOSLoggingEnabled())
  {
    uint64_t v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412546;
      id v13 = a3;
      __int16 v14 = 2112;
      uint64_t v15 = objc_msgSend_inputURL(a3, v5, v6, v7, v8, v9, v10, v11);
      _os_log_impl(&dword_2129EB000, v4, OS_LOG_TYPE_INFO, "Copier started: %@  (URL: %@)", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (void)fileCopierDidFinish:(id)a3
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  uint64_t v10 = objc_msgSend__blockForCopier_(self, a2, (uint64_t)a3, v3, v4, v5, v6, v7);
  if (IMOSLoggingEnabled())
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v64 = 138412546;
      uint64_t v65 = (uint64_t)a3;
      __int16 v66 = 2112;
      uint64_t v67 = objc_msgSend_inputURL(a3, v12, v13, v14, v15, v16, v17, v18);
      _os_log_impl(&dword_2129EB000, v11, OS_LOG_TYPE_INFO, "Copier completed: %@  (URL: %@)", (uint8_t *)&v64, 0x16u);
    }
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v27 = objc_msgSend_inputURL(a3, v20, v21, v22, v23, v24, v25, v26);
      int v64 = 138412290;
      uint64_t v65 = v27;
      _os_log_impl(&dword_2129EB000, v19, OS_LOG_TYPE_INFO, "    Input URL: %@", (uint8_t *)&v64, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v28 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      uint64_t v36 = objc_msgSend_outputURL(a3, v29, v30, v31, v32, v33, v34, v35);
      int v64 = 138412290;
      uint64_t v65 = v36;
      _os_log_impl(&dword_2129EB000, v28, OS_LOG_TYPE_INFO, "   Output URL: %@", (uint8_t *)&v64, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v44 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      int v45 = objc_msgSend_didErrorOccur(a3, v37, v38, v39, v40, v41, v42, v43);
      uint64_t v46 = @"YES";
      if (v45) {
        uint64_t v46 = @"NO";
      }
      int v64 = 138412290;
      uint64_t v65 = (uint64_t)v46;
      _os_log_impl(&dword_2129EB000, v44, OS_LOG_TYPE_INFO, "      Success: %@", (uint8_t *)&v64, 0xCu);
    }
  }
  if (v10)
  {
    uint64_t v47 = objc_msgSend_inputURL(a3, v37, v38, v39, v40, v41, v42, v43);
    uint64_t v55 = objc_msgSend_outputURL(a3, v48, v49, v50, v51, v52, v53, v54);
    int v63 = objc_msgSend_didErrorOccur(a3, v56, v57, v58, v59, v60, v61, v62);
    (*(void (**)(uint64_t, uint64_t, uint64_t, void, void, uint64_t))(v10 + 16))(v10, v47, v55, 0, v63 ^ 1u, 1);
  }
  objc_msgSend__unmapCopier_(self, v37, (uint64_t)a3, v39, v40, v41, v42, v43);
}

@end
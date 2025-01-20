@interface MTRDownload
- (BOOL)matches:(id)a3 fabricIndex:(id)a4 nodeID:(id)a5;
- (MTRDownload)initWithType:(int64_t)a3 fabricIndex:(id)a4 nodeID:(id)a5 queue:(id)a6 completion:(id)a7 done:(id)a8;
- (NSFileHandle)fileHandle;
- (NSNumber)fabricIndex;
- (NSNumber)nodeID;
- (NSString)fileDesignator;
- (NSURL)fileURL;
- (id)_toFileDesignatorString:(int64_t)a3 nodeID:(id)a4;
- (id)_toFileURL:(int64_t)a3 nodeID:(id)a4;
- (id)_toNodeIDString:(id)a3;
- (id)_toTypeString:(int64_t)a3;
- (id)abortHandler;
- (id)finalize;
- (void)checkInteractionModelResponse:(id)a3 error:(id)a4;
- (void)createFile:(id *)a3;
- (void)deleteFile;
- (void)failure:(id)a3;
- (void)setAbortHandler:(id)a3;
- (void)setFabricIndex:(id)a3;
- (void)setFileDesignator:(id)a3;
- (void)setFileHandle:(id)a3;
- (void)setFileURL:(id)a3;
- (void)setFinalize:(id)a3;
- (void)setNodeID:(id)a3;
- (void)success;
- (void)writeToFile:(id)a3 error:(id *)a4;
@end

@implementation MTRDownload

- (MTRDownload)initWithType:(int64_t)a3 fabricIndex:(id)a4 nodeID:(id)a5 queue:(id)a6 completion:(id)a7 done:(id)a8
{
  id v39 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v40 = a8;
  v48.receiver = self;
  v48.super_class = (Class)MTRDownload;
  v18 = [(MTRDownload *)&v48 init];
  v20 = v18;
  if (v18)
  {
    id v21 = v15;
    id v38 = v15;
    objc_msgSend__toFileDesignatorString_nodeID_(v18, v19, a3, v15);
    v22 = (NSString *)objc_claimAutoreleasedReturnValue();
    v23 = v17;
    id v24 = v16;
    v26 = objc_msgSend__toFileURL_nodeID_(v20, v25, a3, v21);
    objc_initWeak(&location, v20);
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = sub_2447A50B4;
    v41[3] = &unk_265194D88;
    id v42 = v16;
    objc_copyWeak(&v46, &location);
    id v44 = v23;
    v27 = v26;
    v43 = v27;
    id v45 = v40;
    v28 = (void *)MEMORY[0x2456969D0](v41);
    fileDesignator = v20->_fileDesignator;
    v20->_fileDesignator = v22;
    v30 = v22;

    objc_storeStrong((id *)&v20->_fabricIndex, a4);
    objc_storeStrong((id *)&v20->_nodeID, a5);
    fileURL = v20->_fileURL;
    v20->_fileURL = v27;
    v32 = v27;
    id v16 = v24;
    id v17 = v23;
    v33 = v32;

    fileHandle = v20->_fileHandle;
    v20->_fileHandle = 0;

    uint64_t v35 = MEMORY[0x2456969D0](v28);
    id finalize = v20->_finalize;
    v20->_id finalize = (id)v35;

    objc_destroyWeak(&v46);
    objc_destroyWeak(&location);
    id v15 = v38;
  }

  return v20;
}

- (void)checkInteractionModelResponse:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v9 = a4;
  if (!v9)
  {
    v10 = objc_msgSend_status(v6, v7, v8);
    if (objc_msgSend_isEqual_(v10, v11, (uint64_t)&unk_26F9C85A8))
    {
      LODWORD(v30) = 219;
      *((void *)&v30 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/C"
                              "HIP/MTRDiagnosticLogsDownloader.mm";
      int v31 = 196;
      sub_244B26908((uint64_t)MTRError, &v30);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_failure_(self, v14, (uint64_t)v13);
    }
    else if (objc_msgSend_isEqual_(v10, v12, (uint64_t)&unk_26F9C85C0))
    {
      LODWORD(v28) = 165;
      *((void *)&v28 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/C"
                              "HIP/MTRDiagnosticLogsDownloader.mm";
      int v29 = 197;
      sub_244B26908((uint64_t)MTRError, &v28);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_failure_(self, v16, (uint64_t)v13);
    }
    else if (objc_msgSend_isEqual_(v10, v15, (uint64_t)&unk_26F9C85D8))
    {
      LODWORD(v26) = 216;
      *((void *)&v26 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/C"
                              "HIP/MTRDiagnosticLogsDownloader.mm";
      int v27 = 198;
      sub_244B26908((uint64_t)MTRError, &v26);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_failure_(self, v18, (uint64_t)v13);
    }
    else
    {
      if (!objc_msgSend_isEqual_(v10, v17, (uint64_t)&unk_26F9C85F0))
      {
LABEL_14:

        goto LABEL_15;
      }
      id v21 = objc_msgSend_logContent(v6, v19, v20);
      id v25 = 0;
      objc_msgSend_writeToFile_error_(self, v22, (uint64_t)v21, &v25);
      id v13 = v25;

      if (v13) {
        objc_msgSend_failure_(self, v23, (uint64_t)v13);
      }
      else {
        objc_msgSend_success(self, v23, v24);
      }
    }

    goto LABEL_14;
  }
  objc_msgSend_failure_(self, v7, (uint64_t)v9);
LABEL_15:
}

- (void)createFile:(id *)a3
{
  p_fileHandle = &self->_fileHandle;
  if (!self->_fileHandle)
  {
    id v6 = objc_msgSend_defaultManager(MEMORY[0x263F08850], a2, (uint64_t)a3);
    id v8 = (id)objc_msgSend_URLForDirectory_inDomain_appropriateForURL_create_error_(v6, v7, 99, 1, self->_fileURL, 1, a3);
    if (!*a3)
    {
      v11 = objc_msgSend_path(self->_fileURL, v9, v10);
      char FileAtPath_contents_attributes = objc_msgSend_createFileAtPath_contents_attributes_(v6, v12, (uint64_t)v11, 0, 0);

      if (FileAtPath_contents_attributes)
      {
        id v15 = objc_msgSend_fileHandleForWritingToURL_error_(MEMORY[0x263F08840], v14, (uint64_t)self->_fileURL, a3);
        if (!*a3) {
          objc_storeStrong((id *)p_fileHandle, v15);
        }
      }
      else
      {
        LODWORD(v16) = 172;
        *((void *)&v16 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework"
                                "/CHIP/MTRDiagnosticLogsDownloader.mm";
        int v17 = 227;
        sub_244B26908((uint64_t)MTRError, &v16);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
  }
}

- (void)deleteFile
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (self->_fileHandle)
  {
    v4 = objc_msgSend_defaultManager(MEMORY[0x263F08850], a2, v2);
    v7 = objc_msgSend_path(self->_fileURL, v5, v6);
    id v12 = 0;
    objc_msgSend_removeItemAtPath_error_(v4, v8, (uint64_t)v7, &v12);
    id v9 = v12;

    if (v9)
    {
      uint64_t v10 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        fileURL = self->_fileURL;
        *(_DWORD *)buf = 138412546;
        v14 = fileURL;
        __int16 v15 = 2112;
        id v16 = v9;
        _os_log_impl(&dword_2446BD000, v10, OS_LOG_TYPE_ERROR, "Error trying to delete the log file: %@. Error: %@", buf, 0x16u);
      }

      if (sub_244CC4E58(1u)) {
        sub_244CC4DE0(0, 1);
      }
    }
  }
}

- (void)writeToFile:(id)a3 error:(id *)a4
{
  id v10 = a3;
  objc_msgSend_createFile_(self, v6, (uint64_t)a4);
  objc_msgSend_seekToEndOfFile(self->_fileHandle, v7, v8);
  objc_msgSend_writeData_error_(self->_fileHandle, v9, (uint64_t)v10, a4);
}

- (BOOL)matches:(id)a3 fabricIndex:(id)a4 nodeID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (objc_msgSend_isEqualToString_(self->_fileDesignator, v11, (uint64_t)v8)
    && objc_msgSend_isEqualToNumber_(self->_fabricIndex, v12, (uint64_t)v9))
  {
    char isEqualToNumber = objc_msgSend_isEqualToNumber_(self->_nodeID, v13, (uint64_t)v10);
  }
  else
  {
    char isEqualToNumber = 0;
  }

  return isEqualToNumber;
}

- (void)failure:(id)a3
{
}

- (void)success
{
}

- (id)_toFileURL:(int64_t)a3 nodeID:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263F08790]);
  objc_msgSend_setDateFormat_(v7, v8, @"yyyy-MM-dd_HH:mm:ss.SSSZZZ");
  v11 = objc_msgSend_now(MEMORY[0x263EFF910], v9, v10);
  id v13 = objc_msgSend_stringFromDate_(v7, v12, (uint64_t)v11);

  __int16 v15 = objc_msgSend__toNodeIDString_(self, v14, (uint64_t)v6);
  uint64_t v17 = objc_msgSend__toTypeString_(self, v16, a3);
  v19 = objc_msgSend_stringWithFormat_(NSString, v18, @"%@_%@_%@", v13, v15, v17);
  uint64_t v20 = NSURL;
  id v21 = NSTemporaryDirectory();
  v23 = objc_msgSend_stringByAppendingPathComponent_(v21, v22, (uint64_t)v19);
  id v25 = objc_msgSend_fileURLWithPath_isDirectory_(v20, v24, (uint64_t)v23, 1);

  return v25;
}

- (id)_toFileDesignatorString:(int64_t)a3 nodeID:(id)a4
{
  id v6 = objc_msgSend__toNodeIDString_(self, a2, (uint64_t)a4);
  id v8 = objc_msgSend__toTypeString_(self, v7, a3);
  uint64_t v10 = objc_msgSend_stringWithFormat_(NSString, v9, @"bdx://%@/%@", v6, v8);
  unint64_t v13 = objc_msgSend_length(v10, v11, v12);
  if (v13 >= 0x20) {
    objc_msgSend_substringToIndex_(v10, v14, 32);
  }
  else {
  __int16 v15 = objc_msgSend_substringToIndex_(v10, v14, v13);
  }

  return v15;
}

- (id)_toNodeIDString:(id)a3
{
  id v3 = a3;
  v4 = NSString;
  uint64_t v7 = objc_msgSend_unsignedLongLongValue(v3, v5, v6);
  id v9 = objc_msgSend_stringWithFormat_(v4, v8, @"%016llX", v7);

  return v9;
}

- (id)_toTypeString:(int64_t)a3
{
  if ((unint64_t)a3 >= 3) {
    sub_24479F5F0();
  }
  return off_265194E68[a3];
}

- (NSString)fileDesignator
{
  return self->_fileDesignator;
}

- (void)setFileDesignator:(id)a3
{
}

- (NSNumber)fabricIndex
{
  return self->_fabricIndex;
}

- (void)setFabricIndex:(id)a3
{
}

- (NSNumber)nodeID
{
  return self->_nodeID;
}

- (void)setNodeID:(id)a3
{
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
}

- (NSFileHandle)fileHandle
{
  return self->_fileHandle;
}

- (void)setFileHandle:(id)a3
{
}

- (id)abortHandler
{
  return self->_abortHandler;
}

- (void)setAbortHandler:(id)a3
{
}

- (id)finalize
{
  return self->_finalize;
}

- (void)setFinalize:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_finalize, 0);
  objc_storeStrong(&self->_abortHandler, 0);
  objc_storeStrong((id *)&self->_fileHandle, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_nodeID, 0);
  objc_storeStrong((id *)&self->_fabricIndex, 0);

  objc_storeStrong((id *)&self->_fileDesignator, 0);
}

@end
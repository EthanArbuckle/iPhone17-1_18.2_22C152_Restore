@interface CKAssetDownloadStagingManager
- (BOOL)finishWithAssetDownloadStagingInfo:(id)a3 fileURL:(id *)a4 fileHandle:(id *)a5 error:(id *)a6;
- (BOOL)keepInflightFilesOpen;
- (BOOL)openWithAssetDownloadStagingInfo:(id)a3 fileDescriptor:(int *)a4 closeOnDealloc:(BOOL *)a5 error:(id *)a6;
- (CKAssetDownloadStagingManager)initWithDirectory:(id)a3;
- (NSMutableDictionary)fileHandlesForInflightLastPathComponent;
- (NSString)description;
- (NSString)fileProtectionType;
- (NSURL)directory;
- (NSURL)finishedDownloadDirectory;
- (NSURL)inflightDownloadDirectory;
- (id)finishedURLWithInfo:(id)a3;
- (id)inflightLastPathComponentWithInfo:(id)a3;
- (id)inflightURLWithLastPathComponent:(id)a3;
- (id)redactedDescription;
- (void)CKDescribePropertiesUsing:(id)a3;
- (void)setFileHandlesForInflightLastPathComponent:(id)a3;
- (void)setFileProtectionType:(id)a3;
- (void)setKeepInflightFilesOpen:(BOOL)a3;
@end

@implementation CKAssetDownloadStagingManager

- (CKAssetDownloadStagingManager)initWithDirectory:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v23 = [CKException alloc];
    v25 = objc_msgSend_initWithCode_format_(v23, v24, 12, @"Missing root directory");
    goto LABEL_14;
  }
  v8 = v5;
  v9 = objc_msgSend_URLByAppendingPathComponent_(v5, v6, @"inflight", v7);
  if (!v9)
  {
    v26 = [CKException alloc];
    v25 = objc_msgSend_initWithCode_format_(v26, v27, 12, @"Unable to create inflight file URL");
    goto LABEL_14;
  }
  v12 = v9;
  if ((CKCreateDirectoryAtURL(v9, 0, v10, v11) & 1) == 0)
  {
    v28 = [CKException alloc];
    v25 = objc_msgSend_initWithCode_format_(v28, v29, 12, @"Unable to initialize inflight file directory");
    goto LABEL_14;
  }
  v15 = objc_msgSend_URLByAppendingPathComponent_(v8, v13, @"finished", v14);
  if (!v15)
  {
    v30 = [CKException alloc];
    v25 = objc_msgSend_initWithCode_format_(v30, v31, 12, @"Unable to create finished file URL");
    goto LABEL_14;
  }
  v18 = v15;
  if ((CKCreateDirectoryAtURL(v15, 0, v16, v17) & 1) == 0)
  {
    v32 = [CKException alloc];
    v25 = objc_msgSend_initWithCode_format_(v32, v33, 12, @"Unable to initialize finished file directory");
LABEL_14:
    objc_exception_throw(v25);
  }
  v34.receiver = self;
  v34.super_class = (Class)CKAssetDownloadStagingManager;
  v19 = [(CKAssetDownloadStagingManager *)&v34 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_directory, a3);
    objc_storeStrong((id *)&v20->_inflightDownloadDirectory, v12);
    objc_storeStrong((id *)&v20->_finishedDownloadDirectory, v18);
    fileHandlesForInflightLastPathComponent = v20->_fileHandlesForInflightLastPathComponent;
    v20->_fileHandlesForInflightLastPathComponent = 0;

    objc_storeStrong((id *)&v20->_fileProtectionType, (id)*MEMORY[0x1E4F28358]);
  }

  return v20;
}

- (BOOL)keepInflightFilesOpen
{
  v2 = self;
  objc_sync_enter(v2);
  v6 = objc_msgSend_fileHandlesForInflightLastPathComponent(v2, v3, v4, v5);
  BOOL v7 = v6 != 0;

  objc_sync_exit(v2);
  return v7;
}

- (void)setKeepInflightFilesOpen:(BOOL)a3
{
  BOOL v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  if (v3)
  {
    BOOL v7 = objc_msgSend_fileHandlesForInflightLastPathComponent(obj, v4, v5, v6);

    if (!v7)
    {
      v8 = objc_opt_new();
      objc_msgSend_setFileHandlesForInflightLastPathComponent_(obj, v9, (uint64_t)v8, v10);
    }
  }
  else
  {
    objc_msgSend_setFileHandlesForInflightLastPathComponent_(obj, v4, 0, v6);
  }
  objc_sync_exit(obj);
}

- (BOOL)openWithAssetDownloadStagingInfo:(id)a3 fileDescriptor:(int *)a4 closeOnDealloc:(BOOL *)a5 error:(id *)a6
{
  v110[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v13 = objc_msgSend_inflightLastPathComponentWithInfo_(self, v9, (uint64_t)v8, v10);
  if (v13)
  {
    uint64_t v14 = objc_msgSend_inflightURLWithLastPathComponent_(self, v11, (uint64_t)v13, v12);
    if (v14)
    {
      v15 = self;
      objc_sync_enter(v15);
      v19 = objc_msgSend_fileHandlesForInflightLastPathComponent(v15, v16, v17, v18);

      if (v19
        && (objc_msgSend_fileHandlesForInflightLastPathComponent(v15, v20, v21, v22),
            v23 = objc_claimAutoreleasedReturnValue(),
            objc_msgSend_objectForKeyedSubscript_(v23, v24, (uint64_t)v13, v25),
            v26 = objc_claimAutoreleasedReturnValue(),
            v23,
            v26))
      {
        unsigned int v27 = objc_msgSend_fileDescriptor(v26, v20, v21, v22);

        BOOL v101 = 0;
        unsigned int v102 = v27;
        if ((v27 & 0x80000000) == 0)
        {
          unsigned int v28 = 2;
          goto LABEL_19;
        }
      }
      else
      {
        BOOL v101 = 1;
      }
      v32 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v20, v21, v22);
      v36 = objc_msgSend_path(v14, v33, v34, v35);
      int v39 = objc_msgSend_fileExistsAtPath_(v32, v37, (uint64_t)v36, v38);

      if (v39) {
        unsigned int v28 = 2;
      }
      else {
        unsigned int v28 = 514;
      }
      id v40 = v14;
      v44 = (const char *)objc_msgSend_fileSystemRepresentation(v40, v41, v42, v43);
      unsigned int v102 = open(v44, v28, 384);
      v45 = __error();
      if ((v102 & 0x80000000) == 0)
      {
        v49 = objc_msgSend_fileHandlesForInflightLastPathComponent(v15, v46, v47, v48);

        if (v49)
        {
          id v50 = objc_alloc(MEMORY[0x1E4F28CB0]);
          v52 = objc_msgSend_initWithFileDescriptor_closeOnDealloc_(v50, v51, v102, 1);
          v56 = objc_msgSend_fileHandlesForInflightLastPathComponent(v15, v53, v54, v55);
          objc_msgSend_setObject_forKeyedSubscript_(v56, v57, (uint64_t)v52, (uint64_t)v13);

          BOOL v101 = 0;
        }
LABEL_19:
        uint64_t v58 = objc_msgSend_fileProtectionType(v15, v20, v21, v22);
        v62 = (void *)v58;
        int v63 = 0;
        if (v28 < 0x200 || !v58) {
          goto LABEL_51;
        }
        v64 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v59, v60, v61);
        uint64_t v109 = *MEMORY[0x1E4F28370];
        v110[0] = v62;
        v66 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v65, (uint64_t)v110, (uint64_t)&v109, 1);
        v70 = objc_msgSend_path(v14, v67, v68, v69);
        id v106 = 0;
        char v72 = objc_msgSend_setAttributes_ofItemAtPath_error_(v64, v71, (uint64_t)v66, (uint64_t)v70, &v106);
        id v100 = v106;
        if (v100) {
          char v72 = 0;
        }

        if (v72)
        {
          int v63 = 0;
LABEL_51:

LABEL_52:
          objc_sync_exit(v15);

          if (!v63)
          {
            if (a4) {
              *a4 = v102;
            }
            if (a5) {
              *a5 = v101;
            }
            BOOL v31 = 1;
            goto LABEL_59;
          }
          goto LABEL_53;
        }
        if (ck_log_initialization_predicate != -1) {
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        }
        v81 = ck_log_facility_ck;
        if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v108 = v100;
          _os_log_error_impl(&dword_18AF10000, v81, OS_LOG_TYPE_ERROR, "Failed to set fileProtectionType for inflightFile with error %@", buf, 0xCu);
          if (!a6) {
            goto LABEL_41;
          }
        }
        else if (!a6)
        {
LABEL_41:
          v85 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v82, v83, v84);
          id v105 = 0;
          char v87 = objc_msgSend_removeItemAtURL_error_(v85, v86, (uint64_t)v14, (uint64_t)&v105);
          id v88 = v105;
          if (v88) {
            char v87 = 0;
          }

          if ((v87 & 1) == 0)
          {
            if (ck_log_initialization_predicate != -1) {
              dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
            }
            v92 = ck_log_facility_ck;
            if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v108 = v88;
              _os_log_error_impl(&dword_18AF10000, v92, OS_LOG_TYPE_ERROR, "Failed to remove inflightFile with error %@", buf, 0xCu);
            }
          }
          v93 = objc_msgSend_fileHandlesForInflightLastPathComponent(v15, v89, v90, v91);

          if (v93)
          {
            v97 = objc_msgSend_fileHandlesForInflightLastPathComponent(v15, v94, v95, v96);
            objc_msgSend_setObject_forKeyedSubscript_(v97, v98, 0, (uint64_t)v13);
          }
          int v63 = 1;
          goto LABEL_51;
        }
        objc_msgSend_errorWithDomain_code_error_format_(CKPrettyError, v82, @"CKInternalErrorDomain", 1000, v100, @"Failed to set fileProtectionType for inflightFile");
        *a6 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_41;
      }
      uint64_t v75 = *v45;
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      v76 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v108) = v75;
        _os_log_error_impl(&dword_18AF10000, v76, OS_LOG_TYPE_ERROR, "open failed with errno:%d", buf, 8u);
        if (!a6) {
          goto LABEL_35;
        }
      }
      else if (!a6)
      {
LABEL_35:
        int v63 = 1;
        goto LABEL_52;
      }
      int v79 = objc_msgSend_errorCodeFromPOSIXCode_(CKAsset, v77, v75, v78);
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v80, @"CKInternalErrorDomain", v79, @"open failed with errno:%d", v75);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_35;
    }
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v73 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18AF10000, v73, OS_LOG_TYPE_ERROR, "Failed to create inflightFileURL.", buf, 2u);
      if (a6) {
        goto LABEL_29;
      }
    }
    else if (a6)
    {
LABEL_29:
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v74, @"CKInternalErrorDomain", 1000, @"Failed to create inflightFileURL.");
      BOOL v31 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_59:

      goto LABEL_60;
    }
LABEL_53:
    BOOL v31 = 0;
    goto LABEL_59;
  }
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v29 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_18AF10000, v29, OS_LOG_TYPE_ERROR, "Failed to create inflightLastPathComponent.", buf, 2u);
    if (a6) {
      goto LABEL_11;
    }
LABEL_62:
    BOOL v31 = 0;
    goto LABEL_60;
  }
  if (!a6) {
    goto LABEL_62;
  }
LABEL_11:
  objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v30, @"CKInternalErrorDomain", 1000, @"Failed to create inflightLastPathComponent.");
  BOOL v31 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_60:

  return v31;
}

- (BOOL)finishWithAssetDownloadStagingInfo:(id)a3 fileURL:(id *)a4 fileHandle:(id *)a5 error:(id *)a6
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  v15 = objc_msgSend_inflightLastPathComponentWithInfo_(self, v11, (uint64_t)v10, v12);
  if (v15)
  {
    uint64_t v18 = objc_msgSend_inflightURLWithLastPathComponent_(self, v13, (uint64_t)v15, v14);
    if (v18)
    {
      uint64_t v22 = objc_msgSend_finishedURLWithInfo_(self, v16, (uint64_t)v10, v17);
      if (v22)
      {
        v23 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v19, v20, v21);
        id v55 = 0;
        char v25 = objc_msgSend_moveItemAtURL_toURL_error_(v23, v24, (uint64_t)v18, (uint64_t)v22, &v55);
        id v54 = v55;
        if (v54) {
          char v25 = 0;
        }

        if (v25)
        {
          v26 = self;
          objc_sync_enter(v26);
          v30 = objc_msgSend_fileHandlesForInflightLastPathComponent(v26, v27, v28, v29);

          if (v30)
          {
            uint64_t v34 = objc_msgSend_fileHandlesForInflightLastPathComponent(v26, v31, v32, v33);
            v37 = objc_msgSend_objectForKeyedSubscript_(v34, v35, (uint64_t)v15, v36);

            v41 = objc_msgSend_fileHandlesForInflightLastPathComponent(v26, v38, v39, v40);
            objc_msgSend_setObject_forKeyedSubscript_(v41, v42, 0, (uint64_t)v15);

            objc_msgSend_seekToFileOffset_(v37, v43, 0, v44);
          }
          else
          {
            v37 = 0;
          }
          objc_sync_exit(v26);

          if (a4) {
            *a4 = v22;
          }
          if (a5) {
            *a5 = v37;
          }

          goto LABEL_35;
        }
        if (ck_log_initialization_predicate != -1) {
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        }
        v51 = ck_log_facility_ck;
        if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          v57 = v18;
          __int16 v58 = 2112;
          v59 = v22;
          __int16 v60 = 2112;
          id v61 = v54;
          _os_log_error_impl(&dword_18AF10000, v51, OS_LOG_TYPE_ERROR, "Failed to move existing item at path %@ to path %@ with error %@", buf, 0x20u);
          if (!a6) {
            goto LABEL_35;
          }
        }
        else if (!a6)
        {
LABEL_35:

          goto LABEL_36;
        }
        objc_msgSend_errorWithDomain_code_error_format_(CKPrettyError, v52, @"CKInternalErrorDomain", 1000, v54, @"Failed to move existing item at path %@ to path %@", v18, v22);
        *a6 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_35;
      }
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      v49 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_18AF10000, v49, OS_LOG_TYPE_ERROR, "Failed to create finishedFileURL.", buf, 2u);
        if (a6) {
          goto LABEL_23;
        }
      }
      else if (a6)
      {
LABEL_23:
        objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v50, @"CKInternalErrorDomain", 1000, @"Failed to create finishedFileURL.");
        char v25 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_36:

        goto LABEL_37;
      }
      char v25 = 0;
      goto LABEL_36;
    }
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v47 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18AF10000, v47, OS_LOG_TYPE_ERROR, "Failed to create inflightFileURL.", buf, 2u);
      if (a6) {
        goto LABEL_18;
      }
    }
    else if (a6)
    {
LABEL_18:
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v48, @"CKInternalErrorDomain", 1000, @"Failed to create inflightFileURL.");
      char v25 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_37:

      goto LABEL_38;
    }
    char v25 = 0;
    goto LABEL_37;
  }
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v45 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_18AF10000, v45, OS_LOG_TYPE_ERROR, "Failed to create inflightLastPathComponent.", buf, 2u);
    if (a6) {
      goto LABEL_13;
    }
LABEL_40:
    char v25 = 0;
    goto LABEL_38;
  }
  if (!a6) {
    goto LABEL_40;
  }
LABEL_13:
  objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v46, @"CKInternalErrorDomain", 1000, @"Failed to create inflightLastPathComponent.");
  char v25 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_38:

  return v25;
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v18 = a3;
  BOOL v7 = objc_msgSend_directory(self, v4, v5, v6);
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v18, v8, @"directory", (uint64_t)v7, 1);

  uint64_t v12 = objc_msgSend_fileProtectionType(self, v9, v10, v11);
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v18, v13, @"fileProtectionType", (uint64_t)v12, 0);

  if (objc_msgSend_keepInflightFilesOpen(self, v14, v15, v16)) {
    objc_msgSend_addPropertyIfExists_value_shouldRedact_(v18, v17, @"keepInflightFilesOpen", @"true", 0);
  }
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKAssetDownloadStagingManager *, char *))MEMORY[0x1F4181798])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKAssetDownloadStagingManager *, char *))MEMORY[0x1F4181798])(self, sel_CKRedactedDescription);
}

- (id)inflightLastPathComponentWithInfo:(id)a3
{
  id v3 = a3;
  BOOL v7 = objc_msgSend_itemID(v3, v4, v5, v6);
  uint64_t v11 = v7;
  if (v7)
  {
    uint64_t v12 = NSString;
    uint64_t v13 = objc_msgSend_longLongValue(v7, v8, v9, v10);
    v19 = objc_msgSend_stringWithFormat_(v12, v14, @"%llu", v15, v13);
    if (v19)
    {
      v23 = objc_msgSend_signature(v3, v16, v17, v18);
      if (v23)
      {
        v24 = objc_msgSend_signature(v3, v20, v21, v22);
        char v25 = CKStringWithData(v24);

        id v26 = [NSString alloc];
        uint64_t v29 = objc_msgSend_initWithFormat_(v26, v27, @"%@.%@", v28, v19, v25);
        v30 = v29;
        if (v29)
        {
          id v31 = v29;
        }
        else
        {
          if (ck_log_initialization_predicate != -1) {
            dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
          }
          uint64_t v35 = ck_log_facility_ck;
          if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v37 = 0;
            _os_log_error_impl(&dword_18AF10000, v35, OS_LOG_TYPE_ERROR, "Failed to create inflightLastPathComponent.", v37, 2u);
          }
        }
      }
      else
      {
        if (ck_log_initialization_predicate != -1) {
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        }
        uint64_t v34 = ck_log_facility_ck;
        if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)uint64_t v38 = 0;
          _os_log_error_impl(&dword_18AF10000, v34, OS_LOG_TYPE_ERROR, "Missing signature.", v38, 2u);
        }
        v30 = 0;
      }
    }
    else
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      uint64_t v33 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v39 = 0;
        _os_log_error_impl(&dword_18AF10000, v33, OS_LOG_TYPE_ERROR, "Failed to create inflightLastPathComponent.", v39, 2u);
      }
      v30 = 0;
    }
  }
  else
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v32 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18AF10000, v32, OS_LOG_TYPE_ERROR, "Missing itemID.", buf, 2u);
    }
    v30 = 0;
  }

  return v30;
}

- (id)inflightURLWithLastPathComponent:(id)a3
{
  id v8 = a3;
  if (!v8)
  {
    uint64_t v13 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6, v7);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v13, v14, (uint64_t)a2, (uint64_t)self, @"CKAssetDownloadStagingManager.m", 227, @"Missing inflightLastPathComponent.");
  }
  uint64_t v9 = objc_msgSend_inflightDownloadDirectory(self, v5, v6, v7);
  uint64_t v11 = objc_msgSend_URLByAppendingPathComponent_isDirectory_(v9, v10, (uint64_t)v8, 0);

  return v11;
}

- (id)finishedURLWithInfo:(id)a3
{
  id v4 = a3;
  uint64_t v11 = objc_msgSend_trackingUUID(v4, v5, v6, v7);
  if (v11)
  {
    uint64_t v15 = objc_msgSend_signature(v4, v8, v9, v10);
    if (v15)
    {
      uint64_t v16 = objc_msgSend_signature(v4, v12, v13, v14);
      uint64_t v17 = CKStringWithData(v16);

      id v18 = [NSString alloc];
      v24 = objc_msgSend_initWithFormat_(v18, v19, @"%@.%@", v20, v11, v17);
      if (v24)
      {
        char v25 = objc_msgSend_finishedDownloadDirectory(self, v21, v22, v23);
        unsigned int v27 = objc_msgSend_URLByAppendingPathComponent_isDirectory_(v25, v26, (uint64_t)v24, 0);
      }
      else
      {
        if (ck_log_initialization_predicate != -1) {
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        }
        v30 = ck_log_facility_ck;
        if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)uint64_t v32 = 0;
          _os_log_error_impl(&dword_18AF10000, v30, OS_LOG_TYPE_ERROR, "Failed to create finishedLastPathComponent.", v32, 2u);
        }
        unsigned int v27 = 0;
      }
    }
    else
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      uint64_t v29 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v33 = 0;
        _os_log_error_impl(&dword_18AF10000, v29, OS_LOG_TYPE_ERROR, "Missing signature.", v33, 2u);
      }
      unsigned int v27 = 0;
    }
  }
  else
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v28 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18AF10000, v28, OS_LOG_TYPE_ERROR, "Missing trackingUUID.", buf, 2u);
    }
    unsigned int v27 = 0;
  }

  return v27;
}

- (NSURL)directory
{
  return self->_directory;
}

- (NSString)fileProtectionType
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFileProtectionType:(id)a3
{
}

- (NSMutableDictionary)fileHandlesForInflightLastPathComponent
{
  return self->_fileHandlesForInflightLastPathComponent;
}

- (void)setFileHandlesForInflightLastPathComponent:(id)a3
{
}

- (NSURL)inflightDownloadDirectory
{
  return self->_inflightDownloadDirectory;
}

- (NSURL)finishedDownloadDirectory
{
  return self->_finishedDownloadDirectory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishedDownloadDirectory, 0);
  objc_storeStrong((id *)&self->_inflightDownloadDirectory, 0);
  objc_storeStrong((id *)&self->_fileHandlesForInflightLastPathComponent, 0);
  objc_storeStrong((id *)&self->_fileProtectionType, 0);

  objc_storeStrong((id *)&self->_directory, 0);
}

@end
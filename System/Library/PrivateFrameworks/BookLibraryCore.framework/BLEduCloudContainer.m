@interface BLEduCloudContainer
+ (id)sharedEduCloudContainer;
- (BLEduCloudContainer)init;
- (BOOL)_addOrUpdateCloudEntryWithDictionary:(id)a3 error:(id *)a4;
- (BOOL)_coordinatedReadOfPromisesWithError:(id *)a3;
- (BOOL)_writePlist:(id)a3 toURL:(id)a4 error:(id *)a5;
- (BOOL)addBookItem:(id)a3 error:(id *)a4;
- (BOOL)isSignedIn;
- (BOOL)removeBookItem:(id)a3 error:(id *)a4;
- (BOOL)updateBookItem:(id)a3 error:(id *)a4;
- (NSURL)containerURL;
- (NSURL)documentsURL;
- (OS_dispatch_queue)containerQueue;
- (id)allBookItems;
- (id)bookItemForPermlink:(id)a3;
- (id)bookItemForURL:(id)a3;
- (id)bookItemsForPermlinks:(id)a3;
- (id)cloudToken;
- (id)cloudUrlForPermlink:(id)a3;
- (id)dictionaryAsBookItem:(id)a3 path:(id)a4;
- (id)fileNameForPermlink:(id)a3;
- (id)performMetadataActionOnCloudURL:(id)a3 action:(id)a4;
- (void)setCloudToken:(id)a3;
- (void)setContainerQueue:(id)a3;
- (void)setContainerURL:(id)a3;
@end

@implementation BLEduCloudContainer

+ (id)sharedEduCloudContainer
{
  if (qword_267D25398 != -1) {
    dispatch_once(&qword_267D25398, &unk_26CED3C50);
  }
  v2 = (void *)qword_267D253A0;

  return v2;
}

- (BLEduCloudContainer)init
{
  v25.receiver = self;
  v25.super_class = (Class)BLEduCloudContainer;
  v2 = [(BLEduCloudContainer *)&v25 init];
  if (!v2) {
    return 0;
  }
  v3 = v2;
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.iBooks.BLEduCloudContainer.containerQueue", 0);
  containerQueue = v3->_containerQueue;
  v3->_containerQueue = (OS_dispatch_queue *)v4;

  v9 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v6, v7, v8);
  uint64_t v13 = objc_msgSend_ubiquityIdentityToken(v9, v10, v11, v12);
  id cloudToken = v3->_cloudToken;
  v3->_id cloudToken = (id)v13;

  id v15 = v3->_cloudToken;
  v16 = BLDefaultLog();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);
  if (v15)
  {
    if (v17)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21DFE3000, v16, OS_LOG_TYPE_DEBUG, "Obtained cloud token.", buf, 2u);
    }

    v18 = v3->_containerQueue;
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = sub_21DFF0C78;
    v21[3] = &unk_26448B6E0;
    v19 = v3;
    v22 = v19;
    id v23 = v9;
    dispatch_async(v18, v21);

    v3 = v22;
  }
  else
  {
    if (v17)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21DFE3000, v16, OS_LOG_TYPE_DEBUG, "Not signed in to iCloud. No edu cloud support available.", buf, 2u);
    }

    v19 = 0;
  }

  return v19;
}

- (BOOL)isSignedIn
{
  return self->_cloudToken != 0;
}

- (NSURL)documentsURL
{
  documentsURL = self->_documentsURL;
  if (!documentsURL)
  {
    v6 = objc_msgSend_containerQueue(self, a2, v2, v3);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_21DFF0D80;
    block[3] = &unk_26448B708;
    block[4] = self;
    dispatch_sync(v6, block);

    documentsURL = self->_documentsURL;
  }

  return documentsURL;
}

- (id)dictionaryAsBookItem:(id)a3 path:(id)a4
{
  dispatch_queue_t v4 = a3;
  if (a3)
  {
    id v5 = a4;
    id v6 = v4;
    uint64_t v7 = [BLBookItem alloc];
    dispatch_queue_t v4 = objc_msgSend_initWithEduCloudData_path_(v7, v8, (uint64_t)v6, (uint64_t)v5);
  }

  return v4;
}

- (id)fileNameForPermlink:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v7 = objc_msgSend_pathExtension(v3, v4, v5, v6);
  uint64_t v8 = NSString;
  uint64_t v12 = objc_msgSend_identifierFromPermlink(v3, v9, v10, v11);
  id v15 = objc_msgSend_stringWithFormat_(v8, v13, @"%@", v14, v12);

  if (v7)
  {
    v18 = objc_msgSend_stringByAppendingPathExtension_(v15, v16, (uint64_t)v7, v17);

    id v15 = v18;
    objc_msgSend_stringByAppendingPathExtension_(v18, v19, @"cloudItem", v20);
  }
  else
  {
    v21 = BLDefaultLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v3;
      _os_log_impl(&dword_21DFE3000, v21, OS_LOG_TYPE_ERROR, "Warning. Unable to determine path extension from permlink {%@}", buf, 0xCu);
    }

    objc_msgSend_stringByAppendingPathExtension_(v15, v22, @"cloudItem", v23);
  v24 = };

  return v24;
}

- (id)cloudUrlForPermlink:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_documentsURL(self, v5, v6, v7);
  uint64_t v11 = objc_msgSend_fileNameForPermlink_(self, v9, (uint64_t)v4, v10);

  uint64_t v14 = objc_msgSend_URLByAppendingPathComponent_(v8, v12, (uint64_t)v11, v13);

  return v14;
}

- (BOOL)_writePlist:(id)a3 toURL:(id)a4 error:(id *)a5
{
  id v7 = a4;
  v9 = objc_msgSend_dataWithPropertyList_format_options_error_(MEMORY[0x263F08AC0], v8, (uint64_t)a3, 200, 0, a5);
  uint64_t v11 = v9;
  if (v9) {
    char v12 = objc_msgSend_writeToURL_options_error_(v9, v10, (uint64_t)v7, 1, a5);
  }
  else {
    char v12 = 0;
  }

  return v12;
}

- (BOOL)_addOrUpdateCloudEntryWithDictionary:(id)a3 error:(id *)a4
{
  uint64_t v107 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v97 = 0;
  v98 = &v97;
  uint64_t v99 = 0x2020000000;
  char v100 = 0;
  uint64_t v91 = 0;
  v92 = &v91;
  uint64_t v93 = 0x3032000000;
  v94 = sub_21DFF16E0;
  v95 = sub_21DFF16F0;
  id v96 = 0;
  char v12 = objc_msgSend_objectForKeyedSubscript_(v6, v7, @"permlink", v8);
  if (v12)
  {
    uint64_t v13 = objc_msgSend_URLWithString_(NSURL, v9, (uint64_t)v12, v11);
  }
  else
  {
    uint64_t v13 = 0;
  }
  uint64_t v17 = objc_msgSend_cloudToken(self, v9, v10, v11);
  if (!v17
    || ((objc_msgSend_documentsURL(self, v14, v15, v16), (v18 = objc_claimAutoreleasedReturnValue()) != 0)
      ? (BOOL v19 = v13 == 0)
      : (BOOL v19 = 1),
        v19 ? (int v20 = 0) : (int v20 = 1),
        v18,
        v17,
        !v20))
  {
    uint64_t v40 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v14, *MEMORY[0x263F07F70], 4, 0);
    uint64_t v23 = (void *)v92[5];
    v92[5] = v40;
    goto LABEL_31;
  }
  uint64_t v23 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v14, v21, v22);
  v26 = objc_msgSend_cloudUrlForPermlink_(self, v24, (uint64_t)v13, v25);
  if (objc_msgSend_isUbiquitousItemAtURL_(v23, v27, (uint64_t)v26, v28))
  {
    id v31 = objc_alloc(MEMORY[0x263F08830]);
    v34 = objc_msgSend_initWithFilePresenter_(v31, v32, 0, v33);
    id v90 = 0;
    v86[0] = MEMORY[0x263EF8330];
    v86[1] = 3221225472;
    v86[2] = sub_21DFF16F8;
    v86[3] = &unk_26448B730;
    v88 = &v97;
    v87 = v6;
    v89 = &v91;
    v83 = v34;
    objc_msgSend_coordinateWritingItemAtURL_options_error_byAccessor_(v34, v35, (uint64_t)v26, 0, &v90, v86);
    id v36 = v90;
    if (!*((unsigned char *)v98 + 24))
    {
      v37 = BLDefaultLog();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        uint64_t v38 = v92[5];
        *(_DWORD *)buf = 138412546;
        v104 = v26;
        __int16 v105 = 2112;
        uint64_t v106 = v38;
        _os_log_impl(&dword_21DFE3000, v37, OS_LOG_TYPE_ERROR, "Failed to write plist to %@. Error: %@", buf, 0x16u);
      }
    }
    v39 = v87;
    goto LABEL_26;
  }
  v83 = objc_msgSend_fileNameForPermlink_(self, v29, (uint64_t)v13, v30);
  v41 = NSTemporaryDirectory();
  objc_msgSend_stringByAppendingPathComponent_(v41, v42, (uint64_t)v83, v43);
  id v36 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_removeItemAtPath_error_(v23, v44, (uint64_t)v36, 0);
  v47 = objc_msgSend_fileURLWithPath_(NSURL, v45, (uint64_t)v36, v46);
  v48 = (id *)(v92 + 5);
  id obj = (id)v92[5];
  int v50 = objc_msgSend__writePlist_toURL_error_(self, v49, (uint64_t)v6, (uint64_t)v47, &obj);
  objc_storeStrong(v48, obj);

  if (v50)
  {
    v53 = objc_msgSend_fileURLWithPath_(NSURL, v51, (uint64_t)v36, v52);
    v54 = (id *)(v92 + 5);
    id v84 = (id)v92[5];
    char v56 = objc_msgSend_setUbiquitous_itemAtURL_destinationURL_error_(v23, v55, 1, (uint64_t)v53, v26, &v84);
    objc_storeStrong(v54, v84);
    *((unsigned char *)v98 + 24) = v56;

    if (*((unsigned char *)v98 + 24)) {
      goto LABEL_27;
    }
    v39 = BLDefaultLog();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      uint64_t v57 = v92[5];
      *(_DWORD *)buf = 138412546;
      v104 = v26;
      __int16 v105 = 2112;
      uint64_t v106 = v57;
      v58 = "Failed to add cloud item at %@. Error:  %@";
LABEL_25:
      _os_log_impl(&dword_21DFE3000, v39, OS_LOG_TYPE_ERROR, v58, buf, 0x16u);
    }
  }
  else
  {
    v39 = BLDefaultLog();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      uint64_t v59 = v92[5];
      *(_DWORD *)buf = 138412546;
      v104 = v26;
      __int16 v105 = 2112;
      uint64_t v106 = v59;
      v58 = "Failed to write plist to %@. Error:  %@";
      goto LABEL_25;
    }
  }
LABEL_26:

LABEL_27:
  v63 = objc_msgSend_path(v26, v60, v61, v62);
  v65 = objc_msgSend_attributesOfItemAtPath_error_(v23, v64, (uint64_t)v63, 0);

  if (v65)
  {
    v69 = objc_msgSend_fileOwnerAccountName(v65, v66, v67, v68);
    char isEqualToString = objc_msgSend_isEqualToString_(v69, v70, @"mobile", v71);

    if ((isEqualToString & 1) == 0)
    {
      uint64_t v74 = *MEMORY[0x263F08028];
      v101[0] = *MEMORY[0x263F08060];
      v101[1] = v74;
      v102[0] = @"mobile";
      v102[1] = @"mobile";
      v75 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v73, (uint64_t)v102, (uint64_t)v101, 2);
      v79 = objc_msgSend_path(v26, v76, v77, v78);
      objc_msgSend_setAttributes_ofItemAtPath_error_(v23, v80, (uint64_t)v75, (uint64_t)v79, 0);
    }
  }

LABEL_31:
  if (a4) {
    *a4 = (id) v92[5];
  }
  BOOL v81 = *((unsigned char *)v98 + 24) != 0;

  _Block_object_dispose(&v91, 8);
  _Block_object_dispose(&v97, 8);

  return v81;
}

- (BOOL)_coordinatedReadOfPromisesWithError:(id *)a3
{
  id v4 = a3;
  uint64_t v83 = *MEMORY[0x263EF8340];
  id v6 = objc_msgSend_defaultManager(MEMORY[0x263F08850], a2, (uint64_t)a3, v3);
  uint64_t v10 = objc_msgSend_documentsURL(self, v7, v8, v9);
  uint64_t v14 = objc_msgSend_path(v10, v11, v12, v13);
  id v76 = 0;
  uint64_t v16 = objc_msgSend_contentsOfDirectoryAtPath_error_(v6, v15, (uint64_t)v14, (uint64_t)&v76);
  id v17 = v76;

  if (v16) {
    BOOL v21 = v17 == 0;
  }
  else {
    BOOL v21 = 0;
  }
  BOOL v22 = v21;
  if (v21)
  {
    BOOL v62 = v22;
    id v64 = v17;
    v65 = v6;
    v66 = v4;
    uint64_t v23 = objc_msgSend_array(MEMORY[0x263EFF980], v18, v19, v20);
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    v63 = v16;
    id v24 = v16;
    uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v72, (uint64_t)v82, 16);
    if (v26)
    {
      uint64_t v30 = v26;
      uint64_t v31 = *(void *)v73;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v73 != v31) {
            objc_enumerationMutation(v24);
          }
          uint64_t v33 = *(void **)(*((void *)&v72 + 1) + 8 * i);
          v34 = objc_msgSend_pathExtension(v33, v27, v28, v29);
          int isEqualToString = objc_msgSend_isEqualToString_(v34, v35, @"cloudItem", v36);

          if (isEqualToString)
          {
            uint64_t v38 = objc_msgSend_documentsURL(self, v27, v28, v29);
            v41 = objc_msgSend_URLByAppendingPathComponent_(v38, v39, (uint64_t)v33, v40);

            objc_msgSend_addObject_(v23, v42, (uint64_t)v41, v43);
          }
        }
        uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v27, (uint64_t)&v72, (uint64_t)v82, 16);
      }
      while (v30);
    }

    if (objc_msgSend_count(v23, v44, v45, v46))
    {
      id v47 = objc_alloc(MEMORY[0x263F08830]);
      int v50 = objc_msgSend_initWithFilePresenter_(v47, v48, 0, v49);
      long long v68 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      id v51 = v23;
      uint64_t v53 = objc_msgSend_countByEnumeratingWithState_objects_count_(v51, v52, (uint64_t)&v68, (uint64_t)v81, 16);
      if (v53)
      {
        uint64_t v55 = v53;
        uint64_t v56 = *(void *)v69;
        do
        {
          for (uint64_t j = 0; j != v55; ++j)
          {
            if (*(void *)v69 != v56) {
              objc_enumerationMutation(v51);
            }
            uint64_t v58 = *(void *)(*((void *)&v68 + 1) + 8 * j);
            id v67 = 0;
            objc_msgSend_coordinateReadingItemAtURL_options_error_byAccessor_(v50, v54, v58, 1, &v67, &unk_26CED3C70);
            id v59 = v67;
            if (v59)
            {
              v60 = BLDefaultLog();
              if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                id v78 = v51;
                __int16 v79 = 2112;
                id v80 = v59;
                _os_log_impl(&dword_21DFE3000, v60, OS_LOG_TYPE_ERROR, "Encountered error doing a coordinated read of %@. Error:  %@", buf, 0x16u);
              }
            }
          }
          uint64_t v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(v51, v54, (uint64_t)&v68, (uint64_t)v81, 16);
        }
        while (v55);
      }
    }
    id v6 = v65;
    id v4 = v66;
    uint64_t v16 = v63;
    id v17 = v64;
    BOOL v22 = v62;
  }
  if (v4) {
    *id v4 = v17;
  }

  return v22;
}

- (BOOL)removeBookItem:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v10 = objc_msgSend_fileURL(v6, v7, v8, v9);

  if (v10)
  {
    uint64_t v14 = objc_msgSend_fileURL(v6, v11, v12, v13);
    uint64_t v15 = deleteItemAtURLCoordinated(v14);
  }
  else
  {
    v18 = objc_msgSend_permlink(v6, v11, v12, v13);

    if (v18)
    {
      BOOL v22 = objc_msgSend_permlink(v6, v19, v20, v21);
      uint64_t v25 = objc_msgSend_cloudUrlForPermlink_(self, v23, (uint64_t)v22, v24);

      uint64_t v15 = deleteItemAtURLCoordinated(v25);
    }
    else
    {
      uint64_t v15 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v19, *MEMORY[0x263F07F70], 4, 0);
    }
  }
  objc_msgSend__setCloudCoverImageData_(v6, v16, 0, v17);
  if (a4) {
    *a4 = v15;
  }

  return v15 == 0;
}

- (BOOL)addBookItem:(id)a3 error:(id *)a4
{
  id v4 = a4;
  id v6 = objc_msgSend__cloudDictionaryRepresentation(a3, a2, (uint64_t)a3, (uint64_t)a4);
  LOBYTE(v4) = objc_msgSend__addOrUpdateCloudEntryWithDictionary_error_(self, v7, (uint64_t)v6, (uint64_t)v4);

  return (char)v4;
}

- (BOOL)updateBookItem:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_msgSend__coordinatedReadOfPromisesWithError_(self, v7, 0, v8);
  uint64_t v12 = objc_msgSend__cloudDictionaryRepresentation(v6, v9, v10, v11);

  LOBYTE(a4) = objc_msgSend__addOrUpdateCloudEntryWithDictionary_error_(self, v13, (uint64_t)v12, (uint64_t)a4);
  return (char)a4;
}

- (id)allBookItems
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend_defaultManager(MEMORY[0x263F08850], a2, v2, v3);
  id v64 = objc_msgSend_array(MEMORY[0x263EFF980], v6, v7, v8);
  uint64_t v12 = objc_msgSend_cloudToken(self, v9, v10, v11);

  if (v12)
  {
    id v70 = 0;
    char v15 = objc_msgSend__coordinatedReadOfPromisesWithError_(self, v13, (uint64_t)&v70, v14);
    id v19 = v70;
    if ((v15 & 1) == 0)
    {
      uint64_t v20 = BLDefaultLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v73 = v19;
        _os_log_impl(&dword_21DFE3000, v20, OS_LOG_TYPE_ERROR, "Failed to read cloud container with error:  %@", buf, 0xCu);
      }
    }
    if (v19)
    {
      uint64_t v21 = 0;
    }
    else
    {
      BOOL v22 = objc_msgSend_documentsURL(self, v16, v17, v18);
      uint64_t v26 = objc_msgSend_path(v22, v23, v24, v25);
      id v69 = 0;
      uint64_t v21 = objc_msgSend_contentsOfDirectoryAtPath_error_(v5, v27, (uint64_t)v26, (uint64_t)&v69);
      id v19 = v69;

      if (!v19)
      {
        if (!objc_msgSend_count(v21, v28, v29, v30)) {
          goto LABEL_12;
        }
        long long v67 = 0u;
        long long v68 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        uint64_t v31 = v21;
        uint64_t v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v34, (uint64_t)&v65, (uint64_t)v71, 16);
        if (v35)
        {
          uint64_t v38 = v35;
          v63 = v5;
          uint64_t v39 = *(void *)v66;
          do
          {
            for (uint64_t i = 0; i != v38; ++i)
            {
              if (*(void *)v66 != v39) {
                objc_enumerationMutation(v31);
              }
              v41 = *(void **)(*((void *)&v65 + 1) + 8 * i);
              if (objc_msgSend_hasSuffix_(v41, v36, @"cloudItem", v37))
              {
                uint64_t v43 = objc_msgSend_documentsURL(self, v36, v42, v37);
                uint64_t v46 = objc_msgSend_URLByAppendingPathComponent_(v43, v44, (uint64_t)v41, v45);

                id v47 = NSDictionary;
                id v51 = objc_msgSend_path(v46, v48, v49, v50);
                v54 = objc_msgSend_dictionaryWithContentsOfFile_(v47, v52, (uint64_t)v51, v53);

                uint64_t v58 = objc_msgSend_path(v46, v55, v56, v57);
                v60 = objc_msgSend_dictionaryAsBookItem_path_(self, v59, (uint64_t)v54, (uint64_t)v58);

                if (v60) {
                  objc_msgSend_addObject_(v64, v61, (uint64_t)v60, v62);
                }
              }
            }
            uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v36, (uint64_t)&v65, (uint64_t)v71, 16);
          }
          while (v38);
          uint64_t v21 = v31;
          id v19 = 0;
          uint64_t v5 = v63;
        }
        else
        {
          uint64_t v21 = v31;
        }
LABEL_11:

LABEL_12:
        goto LABEL_13;
      }
    }
    uint64_t v31 = BLDefaultLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v73 = v19;
      _os_log_impl(&dword_21DFE3000, v31, OS_LOG_TYPE_ERROR, "Failed to get contents of cloud documents directory. Error:  %@", buf, 0xCu);
    }
    goto LABEL_11;
  }
LABEL_13:
  v32 = objc_msgSend_arrayWithArray_(MEMORY[0x263EFF8C0], v13, (uint64_t)v64, v14);

  return v32;
}

- (id)performMetadataActionOnCloudURL:(id)a3 action:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *))a4;
  uint64_t v11 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v8, v9, v10);
  char v15 = objc_msgSend_path(v6, v12, v13, v14);
  int v18 = objc_msgSend_fileExistsAtPath_(v11, v16, (uint64_t)v15, v17);

  if (v18)
  {
    BOOL v22 = NSDictionary;
    uint64_t v23 = objc_msgSend_path(v6, v19, v20, v21);
    uint64_t v26 = objc_msgSend_dictionaryWithContentsOfFile_(v22, v24, (uint64_t)v23, v25);

    uint64_t v30 = objc_msgSend_mutableCopy(v26, v27, v28, v29);
    uint64_t v34 = objc_msgSend_hash(v30, v31, v32, v33);
    v7[2](v7, v30);
    if (objc_msgSend_hash(v30, v35, v36, v37) == v34)
    {
      id v39 = 0;
    }
    else
    {
      id v41 = 0;
      objc_msgSend__addOrUpdateCloudEntryWithDictionary_error_(self, v38, (uint64_t)v30, (uint64_t)&v41);
      id v39 = v41;
    }
  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v19, *MEMORY[0x263F07F70], 4, 0);
    id v39 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v39;
}

- (id)bookItemForURL:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = sub_21DFF16E0;
  id v27 = sub_21DFF16F0;
  id v28 = 0;
  uint64_t v5 = BLDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v30 = v4;
    _os_log_impl(&dword_21DFE3000, v5, OS_LOG_TYPE_DEBUG, "bookItemForURL: %@", buf, 0xCu);
  }

  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = sub_21DFF2654;
  v22[3] = &unk_26448B7C8;
  v22[4] = self;
  v22[5] = &v23;
  id v6 = (void *)MEMORY[0x223C1EDC0](v22);
  if (objc_msgSend_isUbiquitous(v4, v7, v8, v9))
  {
    id v10 = objc_alloc(MEMORY[0x263F08830]);
    uint64_t v13 = objc_msgSend_initWithFilePresenter_(v10, v11, 0, v12);
    id v21 = 0;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = sub_21DFF2798;
    v18[3] = &unk_26448B7F0;
    id v19 = 0;
    id v20 = v6;
    objc_msgSend_coordinateReadingItemAtURL_options_error_byAccessor_(v13, v14, (uint64_t)v4, 1, &v21, v18);
    id v15 = v21;
  }
  else
  {
    uint64_t v13 = BLDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v4;
      _os_log_impl(&dword_21DFE3000, v13, OS_LOG_TYPE_ERROR, "Expected to have a ubiquitous URL but instead got %@", buf, 0xCu);
    }
  }

  id v16 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  return v16;
}

- (id)bookItemForPermlink:(id)a3
{
  id v4 = a3;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = sub_21DFF16E0;
  id v27 = sub_21DFF16F0;
  id v28 = 0;
  uint64_t v7 = objc_msgSend_cloudUrlForPermlink_(self, v5, (uint64_t)v4, v6);
  id v8 = objc_alloc(MEMORY[0x263F08830]);
  uint64_t v11 = objc_msgSend_initWithFilePresenter_(v8, v9, 0, v10);
  id v22 = 0;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_21DFF2AA4;
  v17[3] = &unk_26448B818;
  id v18 = 0;
  id v19 = self;
  id v12 = v7;
  id v20 = v12;
  id v21 = &v23;
  objc_msgSend_coordinateReadingItemAtURL_options_error_byAccessor_(v11, v13, (uint64_t)v12, 1, &v22, v17);
  id v14 = v22;
  id v15 = (id)v24[5];

  _Block_object_dispose(&v23, 8);

  return v15;
}

- (id)bookItemsForPermlinks:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v8 = objc_msgSend_array(MEMORY[0x263EFF980], v5, v6, v7);
  id v12 = objc_msgSend_allBookItems(self, v9, v10, v11);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v28, (uint64_t)v32, 16);
  if (v14)
  {
    uint64_t v18 = v14;
    uint64_t v19 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v29 != v19) {
          objc_enumerationMutation(v12);
        }
        id v21 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v22 = objc_msgSend_permlink(v21, v15, v16, v17);
        if (objc_msgSend_containsObject_(v4, v23, (uint64_t)v22, v24)) {
          objc_msgSend_addObject_(v8, v25, (uint64_t)v21, v26);
        }
      }
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v28, (uint64_t)v32, 16);
    }
    while (v18);
  }

  return v8;
}

- (id)cloudToken
{
  return self->_cloudToken;
}

- (void)setCloudToken:(id)a3
{
}

- (NSURL)containerURL
{
  return self->_containerURL;
}

- (void)setContainerURL:(id)a3
{
}

- (OS_dispatch_queue)containerQueue
{
  return self->_containerQueue;
}

- (void)setContainerQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerQueue, 0);
  objc_storeStrong((id *)&self->_containerURL, 0);
  objc_storeStrong(&self->_cloudToken, 0);

  objc_storeStrong((id *)&self->_documentsURL, 0);
}

@end
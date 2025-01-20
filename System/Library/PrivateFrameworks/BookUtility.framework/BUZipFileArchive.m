@interface BUZipFileArchive
+ (BOOL)extractArchiveFromURL:(id)a3 toURL:(id)a4 options:(unint64_t)a5 error:(id *)a6;
+ (BOOL)isZipArchiveAtFD:(int)a3;
+ (BOOL)isZipArchiveAtURL:(id)a3 error:(id *)a4;
+ (id)zipArchiveFromURL:(id)a3 options:(unint64_t)a4 error:(id *)a5;
+ (void)readArchiveFromURL:(id)a3 options:(unint64_t)a4 queue:(id)a5 completion:(id)a6;
- (BOOL)copyToTemporaryLocationRelativeToURL:(id)a3 error:(id *)a4;
- (BOOL)isValid;
- (BOOL)openWithURL:(id)a3 error:(id *)a4;
- (BOOL)reopenWithTemporaryURL:(id)a3 error:(id *)a4;
- (BUZipFileArchive)initWithWriter:(id)a3 forReadingFromURL:(id)a4 options:(unint64_t)a5 error:(id *)a6;
- (BUZipFileDescriptorWrapper)fdWrapper;
- (NSURL)URL;
- (NSURL)temporaryDirectoryURL;
- (OS_dispatch_queue)accessQueue;
- (id)debugDescription;
- (id)initForReadingFromURL:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)newArchiveReadChannel;
- (unint64_t)archiveLength;
- (void)createTemporaryDirectoryRelativeToURL:(id)a3;
- (void)dealloc;
- (void)removeTemporaryDirectory;
- (void)setAccessQueue:(id)a3;
- (void)setFdWrapper:(id)a3;
- (void)setTemporaryDirectoryURL:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation BUZipFileArchive

+ (BOOL)isZipArchiveAtURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v9 = objc_msgSend_path(v6, v7, v8);
  if (objc_msgSend_length(v9, v10, v11))
  {
    objc_msgSend_path(v6, v12, v13);
    id v14 = objc_claimAutoreleasedReturnValue();
    v17 = (const char *)objc_msgSend_fileSystemRepresentation(v14, v15, v16);
    uint64_t v18 = open(v17, 0, 0);

    if ((v18 & 0x80000000) != 0)
    {
      v22 = (void *)MEMORY[0x263F087E8];
      v23 = __error();
      v21 = objc_msgSend_bu_fileReadPOSIXErrorWithNumber_userInfo_(v22, v24, *v23, 0);
      char isZipArchiveAtFD = 0;
      if (!a4) {
        goto LABEL_12;
      }
      goto LABEL_8;
    }
    char isZipArchiveAtFD = objc_msgSend_isZipArchiveAtFD_(a1, v19, v18);
    close(v18);
  }
  else
  {
    char isZipArchiveAtFD = 0;
  }
  v21 = 0;
  if (!a4) {
    goto LABEL_12;
  }
LABEL_8:
  if ((isZipArchiveAtFD & 1) == 0)
  {
    if (v21)
    {
      *a4 = v21;
    }
    else
    {
      objc_msgSend_bu_fileReadUnknownErrorWithUserInfo_(MEMORY[0x263F087E8], v12, 0);
      id v25 = objc_claimAutoreleasedReturnValue();
      *a4 = v25;
    }
  }
LABEL_12:

  return isZipArchiveAtFD;
}

+ (BOOL)isZipArchiveAtFD:(int)a3
{
  off_t v4 = lseek(a3, 0, 1);
  off_t v5 = v4;
  if ((unint64_t)(v4 - 1) > 0xFFFFFFFFFFFFFFFDLL)
  {
    if (v4 == -1) {
      return 0;
    }
  }
  else if (lseek(a3, 0, 0) == -1)
  {
    goto LABEL_12;
  }
  if (read(a3, &v9, 4uLL) == 4)
  {
    BOOL v7 = v9 == 67324752 || v9 == 101010256;
    return lseek(a3, v5, 0) != -1 && v7;
  }
LABEL_12:
  BOOL v7 = 0;
  return lseek(a3, v5, 0) != -1 && v7;
}

- (NSURL)URL
{
  return self->_URL;
}

+ (void)readArchiveFromURL:(id)a3 options:(unint64_t)a4 queue:(id)a5 completion:(id)a6
{
  id v10 = a6;
  uint64_t v11 = a5;
  id v12 = a3;
  id v13 = objc_alloc((Class)a1);
  id v21 = 0;
  v15 = objc_msgSend_initForReadingFromURL_options_error_(v13, v14, (uint64_t)v12, a4, &v21);

  id v17 = v21;
  if (v15)
  {
    objc_msgSend_readArchiveWithQueue_completion_(v15, v16, (uint64_t)v11, v10);
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_21E1D88B8;
    block[3] = &unk_26449D6A0;
    v20 = v10;
    id v19 = v17;
    dispatch_async(v11, block);

    uint64_t v11 = v20;
  }
}

+ (id)zipArchiveFromURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = sub_21E1D8BA8;
  v35 = sub_21E1D8BB8;
  id v36 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = sub_21E1D8BA8;
  v29 = sub_21E1D8BB8;
  id v30 = 0;
  id obj = 0;
  int isZipArchiveAtURL_error = objc_msgSend_isZipArchiveAtURL_error_(a1, v9, (uint64_t)v8, &obj);
  objc_storeStrong(&v30, obj);
  if (isZipArchiveAtURL_error)
  {
    id v12 = dispatch_group_create();
    dispatch_group_enter(v12);
    id v13 = dispatch_get_global_queue(0, 0);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = sub_21E1D8BC0;
    v20[3] = &unk_26449DBB8;
    v22 = &v31;
    v23 = &v25;
    id v14 = v12;
    id v21 = v14;
    objc_msgSend_readArchiveFromURL_options_queue_completion_(a1, v15, (uint64_t)v8, a4, v13, v20);
    dispatch_group_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
  }
  if (a5 && !v32[5])
  {
    uint64_t v16 = (void *)v26[5];
    if (v16)
    {
      *a5 = v16;
    }
    else
    {
      objc_msgSend_bu_fileReadUnknownErrorWithUserInfo_(MEMORY[0x263F087E8], v11, 0);
      id v17 = objc_claimAutoreleasedReturnValue();
      *a5 = v17;
    }
  }
  id v18 = (id)v32[5];
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);

  return v18;
}

- (id)initForReadingFromURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BUZipFileArchive;
  int v9 = [(BUZipArchive *)&v15 initWithOptions:a4];
  if (v9)
  {
    id v10 = BUZipLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_21E1F0FD4((uint64_t)v9, v8, (uint64_t)v10);
    }

    dispatch_queue_t v11 = dispatch_queue_create("BUZipFileArchive.Access", 0);
    accessQueue = v9->_accessQueue;
    v9->_accessQueue = (OS_dispatch_queue *)v11;

    if ((objc_msgSend_openWithURL_error_(v9, v13, (uint64_t)v8, a5) & 1) == 0)
    {

      int v9 = 0;
    }
  }

  return v9;
}

- (BOOL)openWithURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = BUZipLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_21E1F114C((uint64_t)self, v6, (uint64_t)v7);
  }

  id v10 = (NSURL *)objc_msgSend_copy(v6, v8, v9);
  URL = self->_URL;
  self->_URL = v10;

  uint64_t v12 = *MEMORY[0x263EFF688];
  objc_msgSend_removeCachedResourceValueForKey_(v6, v13, *MEMORY[0x263EFF688]);
  id v43 = 0;
  id v44 = 0;
  int ResourceValue_forKey_error = objc_msgSend_getResourceValue_forKey_error_(v6, v14, (uint64_t)&v44, v12, &v43);
  id v16 = v44;
  id v19 = v43;
  if (!ResourceValue_forKey_error)
  {
    v35 = BUZipLog();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      sub_21E1F1068((uint64_t)v6, v19, v35);
    }
LABEL_15:

    BOOL v34 = 0;
    if (!a4) {
      goto LABEL_18;
    }
    goto LABEL_16;
  }
  self->_archiveLength = objc_msgSend_unsignedLongLongValue(v16, v17, v18);
  objc_msgSend_path(v6, v20, v21);
  id v22 = objc_claimAutoreleasedReturnValue();
  uint64_t v25 = (const char *)objc_msgSend_fileSystemRepresentation(v22, v23, v24);
  uint64_t v26 = open(v25, 0, 0);

  if ((v26 & 0x80000000) != 0)
  {
    id v36 = (void *)MEMORY[0x263F087E8];
    v37 = __error();
    uint64_t v39 = objc_msgSend_bu_fileReadPOSIXErrorWithNumber_userInfo_(v36, v38, *v37, 0);
LABEL_14:
    v35 = v19;
    id v19 = v39;
    goto LABEL_15;
  }
  uint64_t v27 = [BUZipFileDescriptorWrapper alloc];
  v29 = (BUZipFileDescriptorWrapper *)objc_msgSend_initWithFileDescriptor_queue_(v27, v28, v26, self->_accessQueue);
  fdWrapper = self->_fdWrapper;
  self->_fdWrapper = v29;

  if (!self->_fdWrapper)
  {
    uint64_t v39 = objc_msgSend_bu_fileReadUnknownErrorWithUserInfo_(MEMORY[0x263F087E8], v31, 0);
    goto LABEL_14;
  }
  v32 = objc_opt_class();
  if ((objc_msgSend_isZipArchiveAtFD_(v32, v33, v26) & 1) == 0)
  {
    v40 = self->_fdWrapper;
    self->_fdWrapper = 0;

    uint64_t v39 = objc_msgSend_bu_fileReadCorruptedFileErrorWithUserInfo_(MEMORY[0x263F087E8], v41, 0);
    goto LABEL_14;
  }
  BOOL v34 = 1;
  if (!a4) {
    goto LABEL_18;
  }
LABEL_16:
  if (v19) {
    *a4 = v19;
  }
LABEL_18:

  return v34;
}

- (BUZipFileArchive)initWithWriter:(id)a3 forReadingFromURL:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  uint64_t v13 = objc_msgSend_initForReadingFromURL_options_error_(self, v12, (uint64_t)v11, a5, a6);
  if (v13)
  {
    id v14 = (void *)v13;
    objc_super v15 = BUZipLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v37 = v14;
      __int16 v38 = 2112;
      uint64_t v39 = (uint64_t)v10;
      __int16 v40 = 2112;
      uint64_t v41 = (uint64_t)v11;
      _os_log_debug_impl(&dword_21E1C7000, v15, OS_LOG_TYPE_DEBUG, "%@: initWithWriter: %@, atURL: %@", buf, 0x20u);
    }

    uint64_t v18 = objc_msgSend_archiveLength(v14, v16, v17);
    if (v18 == objc_msgSend_archiveLength(v10, v19, v20))
    {
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = sub_21E1D91B0;
      v34[3] = &unk_26449DBE0;
      uint64_t v21 = v14;
      v35 = v21;
      objc_msgSend_enumerateEntriesUsingBlock_(v10, v22, (uint64_t)v34);
      id v14 = v35;
    }
    else
    {
      v23 = BUZipLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        uint64_t v27 = objc_msgSend_path(v11, v24, v25);
        uint64_t v30 = objc_msgSend_archiveLength(v14, v28, v29);
        uint64_t v33 = objc_msgSend_archiveLength(v10, v31, v32);
        *(_DWORD *)buf = 138412802;
        v37 = v27;
        __int16 v38 = 2048;
        uint64_t v39 = v30;
        __int16 v40 = 2048;
        uint64_t v41 = v33;
        _os_log_error_impl(&dword_21E1C7000, v23, OS_LOG_TYPE_ERROR, "Length of archive at %@ doesn't match archive length of writer. %llu != %llu", buf, 0x20u);
      }
      uint64_t v21 = 0;
    }
  }
  else
  {
    uint64_t v21 = 0;
  }

  return v21;
}

- (void)dealloc
{
  self->_archiveLength = 0;
  fdWrapper = self->_fdWrapper;
  self->_fdWrapper = 0;

  objc_msgSend_removeTemporaryDirectory(self, v4, v5);
  v6.receiver = self;
  v6.super_class = (Class)BUZipFileArchive;
  [(BUZipFileArchive *)&v6 dealloc];
}

- (void)createTemporaryDirectoryRelativeToURL:(id)a3
{
  id v4 = a3;
  if (!self->_temporaryDirectoryURL)
  {
    id v20 = v4;
    if (!v4) {
      goto LABEL_4;
    }
    BOOL v7 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v5, v6);
    objc_msgSend_URLForDirectory_inDomain_appropriateForURL_create_error_(v7, v8, 99, 1, v20, 1, 0);
    uint64_t v9 = (NSURL *)objc_claimAutoreleasedReturnValue();
    temporaryDirectoryURL = self->_temporaryDirectoryURL;
    self->_temporaryDirectoryURL = v9;

    id v4 = v20;
    if (!self->_temporaryDirectoryURL)
    {
LABEL_4:
      id v11 = [BUTemporaryDirectory alloc];
      uint64_t v13 = objc_msgSend_initWithSignature_error_(v11, v12, @"ZipFile", 0);
      objc_msgSend_leakTemporaryDirectory(v13, v14, v15);
      objc_msgSend_URL(v13, v16, v17);
      uint64_t v18 = (NSURL *)objc_claimAutoreleasedReturnValue();
      id v19 = self->_temporaryDirectoryURL;
      self->_temporaryDirectoryURL = v18;

      id v4 = v20;
    }
  }
}

- (void)removeTemporaryDirectory
{
  if (self->_temporaryDirectoryURL)
  {
    id v4 = objc_msgSend_defaultManager(MEMORY[0x263F08850], a2, v2);
    temporaryDirectoryURL = self->_temporaryDirectoryURL;
    id v12 = 0;
    char v7 = objc_msgSend_removeItemAtURL_error_(v4, v6, (uint64_t)temporaryDirectoryURL, &v12);
    id v8 = v12;

    if ((v7 & 1) == 0)
    {
      BUZipLog();
      uint64_t v9 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR)) {
        sub_21E1F11E0(v8, v9, v10);
      }
    }
    id v11 = self->_temporaryDirectoryURL;
    self->_temporaryDirectoryURL = 0;
  }
}

- (BOOL)reopenWithTemporaryURL:(id)a3 error:(id *)a4
{
  unint64_t archiveLength = self->_archiveLength;
  p_fdWrapper = (id *)&self->_fdWrapper;
  fdWrapper = self->_fdWrapper;
  uint64_t v10 = fdWrapper;
  self->_unint64_t archiveLength = 0;
  id v11 = *p_fdWrapper;
  id *p_fdWrapper = 0;
  id v12 = a3;

  char v14 = objc_msgSend_openWithURL_error_(self, v13, (uint64_t)v12, a4);
  if ((v14 & 1) == 0)
  {
    self->_unint64_t archiveLength = archiveLength;
    objc_storeStrong(p_fdWrapper, fdWrapper);
  }

  return v14;
}

- (BOOL)copyToTemporaryLocationRelativeToURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = sub_21E1D8BA8;
  uint64_t v26 = sub_21E1D8BB8;
  id v27 = 0;
  accessQueue = self->_accessQueue;
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  id v16 = sub_21E1D9634;
  uint64_t v17 = &unk_26449DC58;
  uint64_t v18 = self;
  id v8 = v6;
  id v19 = v8;
  id v20 = &v22;
  uint64_t v21 = &v28;
  dispatch_sync(accessQueue, &v14);
  if (a4 && !*((unsigned char *)v29 + 24))
  {
    uint64_t v10 = (void *)v23[5];
    if (v10)
    {
      *a4 = v10;
    }
    else
    {
      objc_msgSend_bu_fileReadUnknownErrorWithUserInfo_(MEMORY[0x263F087E8], v9, 0, v14, v15, v16, v17, v18);
      id v11 = objc_claimAutoreleasedReturnValue();
      *a4 = v11;
    }
  }
  char v12 = *((unsigned char *)v29 + 24);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v12;
}

- (unint64_t)archiveLength
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  id v4 = objc_msgSend_accessQueue(self, a2, v2);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_21E1D9D08;
  v7[3] = &unk_26449D600;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  unint64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (id)newArchiveReadChannel
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_21E1D8BA8;
  uint64_t v10 = sub_21E1D8BB8;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_21E1D9E0C;
  v5[3] = &unk_26449D8D0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)isValid
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_21E1DA058;
  v5[3] = &unk_26449D8D0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)debugDescription
{
  uint64_t v3 = objc_opt_class();
  unint64_t v5 = objc_msgSend_descriptionWithObject_class_(BUDescription, v4, (uint64_t)self, v3);
  char v7 = objc_msgSend_stringWithFormat_(NSString, v6, @"%qu", self->_archiveLength);
  objc_msgSend_addField_value_(v5, v8, @"archiveLength", v7);

  v15.receiver = self;
  v15.super_class = (Class)BUZipFileArchive;
  char v9 = [(BUZipArchive *)&v15 debugDescription];
  objc_msgSend_addFieldValue_(v5, v10, (uint64_t)v9);

  uint64_t v13 = objc_msgSend_descriptionString(v5, v11, v12);

  return v13;
}

+ (BOOL)extractArchiveFromURL:(id)a3 toURL:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  id v9 = a4;
  id v19 = 0;
  id v11 = objc_msgSend_zipArchiveFromURL_options_error_(BUZipFileArchive, v10, (uint64_t)a3, a5, &v19);
  id v12 = v19;
  if (v11) {
    BOOL v14 = v12 == 0;
  }
  else {
    BOOL v14 = 0;
  }
  if (!v14)
  {
    id v15 = v12;
    char v16 = 0;
    if (!a6) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  id v18 = 0;
  char v16 = objc_msgSend_extractToURL_error_(v11, v13, (uint64_t)v9, &v18);
  id v15 = v18;
  if (a6) {
LABEL_8:
  }
    *a6 = v15;
LABEL_9:

  return v16;
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
}

- (BUZipFileDescriptorWrapper)fdWrapper
{
  return self->_fdWrapper;
}

- (void)setFdWrapper:(id)a3
{
}

- (NSURL)temporaryDirectoryURL
{
  return self->_temporaryDirectoryURL;
}

- (void)setTemporaryDirectoryURL:(id)a3
{
}

- (void)setURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_temporaryDirectoryURL, 0);
  objc_storeStrong((id *)&self->_fdWrapper, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
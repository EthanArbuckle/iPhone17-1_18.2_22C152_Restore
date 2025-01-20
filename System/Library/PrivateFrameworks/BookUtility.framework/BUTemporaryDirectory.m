@interface BUTemporaryDirectory
- (BOOL)_createDirectoryWithSignature:(id)a3 subdirectory:(id)a4 error:(id *)a5;
- (BUTemporaryDirectory)init;
- (BUTemporaryDirectory)initWithError:(id *)a3;
- (BUTemporaryDirectory)initWithSignature:(id)a3 error:(id *)a4;
- (BUTemporaryDirectory)initWithSignature:(id)a3 subdirectory:(id)a4 error:(id *)a5;
- (id)URL;
- (id)initForWritingToURL:(id)a3 error:(id *)a4;
- (id)path;
- (void)dealloc;
- (void)leakTemporaryDirectory;
@end

@implementation BUTemporaryDirectory

- (BUTemporaryDirectory)init
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  v4 = objc_msgSend_stringWithFormat_(NSString, a2, @"%@: %s", @"Do not call method", "-[BUTemporaryDirectory init]");
  objc_msgSend_exceptionWithName_reason_userInfo_(v2, v5, v3, v4, 0);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (BUTemporaryDirectory)initWithError:(id *)a3
{
  return (BUTemporaryDirectory *)MEMORY[0x270F9A6D0](self, sel_initWithSignature_subdirectory_error_, &stru_26CF11AD8);
}

- (BUTemporaryDirectory)initWithSignature:(id)a3 error:(id *)a4
{
  return (BUTemporaryDirectory *)MEMORY[0x270F9A6D0](self, sel_initWithSignature_subdirectory_error_, a3);
}

- (BUTemporaryDirectory)initWithSignature:(id)a3 subdirectory:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BUTemporaryDirectory;
  v10 = [(BUTemporaryDirectory *)&v14 init];
  v12 = v10;
  if (v10 && (objc_msgSend__createDirectoryWithSignature_subdirectory_error_(v10, v11, (uint64_t)v8, v9, a5) & 1) == 0)
  {

    v12 = 0;
  }

  return v12;
}

- (id)initForWritingToURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)BUTemporaryDirectory;
  id v9 = [(BUTemporaryDirectory *)&v18 init];
  if (v9)
  {
    v10 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v7, v8);
    v12 = objc_msgSend_URLForDirectory_inDomain_appropriateForURL_create_error_(v10, v11, 99, 1, v6, 1, a4);

    uint64_t v15 = objc_msgSend_path(v12, v13, v14);
    path = v9->_path;
    v9->_path = (NSString *)v15;

    if (!v12)
    {

      id v9 = 0;
    }
  }
  return v9;
}

- (void)dealloc
{
  if (!self->_leak)
  {
    v4 = objc_msgSend_defaultManager(MEMORY[0x263F08850], a2, v2);
    path = self->_path;
    id v14 = 0;
    char v7 = objc_msgSend_removeItemAtPath_error_(v4, v6, (uint64_t)path, &v14);
    id v8 = v14;
    v11 = v8;
    if ((v7 & 1) == 0)
    {
      char isNoSuchFileError = objc_msgSend_bu_isNoSuchFileError(v8, v9, v10);

      if (isNoSuchFileError)
      {
LABEL_7:

        goto LABEL_8;
      }
      v4 = BUZipLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        sub_21E1F091C((uint64_t)v11, (uint64_t *)&self->_path, v4);
      }
    }

    goto LABEL_7;
  }
LABEL_8:
  v13.receiver = self;
  v13.super_class = (Class)BUTemporaryDirectory;
  [(BUTemporaryDirectory *)&v13 dealloc];
}

- (id)path
{
  return self->_path;
}

- (id)URL
{
  return (id)objc_msgSend_fileURLWithPath_isDirectory_(NSURL, a2, (uint64_t)self->_path, 1);
}

- (void)leakTemporaryDirectory
{
  self->_leak = 1;
}

- (BOOL)_createDirectoryWithSignature:(id)a3 subdirectory:(id)a4 error:(id *)a5
{
  id v8 = (__CFString *)a3;
  id v9 = a4;
  if (v8) {
    uint64_t v10 = v8;
  }
  else {
    uint64_t v10 = &stru_26CF11AD8;
  }
  if (qword_267D29868 != -1) {
    dispatch_once(&qword_267D29868, &unk_26CF10810);
  }
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  objc_super v13 = objc_msgSend_stringByAppendingFormat_((void *)qword_267D29860, v12, @"_%@_%d_%d", v10, (int)Current, atomic_fetch_add(dword_267D29870, 1u) + 1);
  if ((unint64_t)objc_msgSend_length(v13, v14, v15) >= 0x100)
  {
    uint64_t v17 = objc_msgSend_substringToIndex_(v13, v16, 255);

    objc_super v13 = (void *)v17;
  }
  objc_super v18 = NSTemporaryDirectory();
  v20 = v18;
  if (v9)
  {
    uint64_t v21 = objc_msgSend_stringByAppendingPathComponent_(v18, v19, (uint64_t)v9);

    v20 = (void *)v21;
  }
  v22 = objc_msgSend_stringByAppendingPathComponent_(v20, v19, (uint64_t)v13);
  v25 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v23, v24);
  id v32 = 0;
  char v27 = objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v25, v26, (uint64_t)v22, 1, 0, &v32);
  id v28 = v32;

  objc_storeStrong((id *)&self->_path, v22);
  if (a5 && (v27 & 1) == 0)
  {
    if (v28)
    {
      *a5 = v28;
    }
    else
    {
      objc_msgSend_bu_fileWriteUnknownErrorWithUserInfo_(MEMORY[0x263F087E8], v29, 0);
      id v30 = objc_claimAutoreleasedReturnValue();
      *a5 = v30;
    }
  }

  return v27;
}

- (void).cxx_destruct
{
}

@end
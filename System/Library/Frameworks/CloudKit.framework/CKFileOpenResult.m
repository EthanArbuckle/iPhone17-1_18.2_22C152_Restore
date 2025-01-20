@interface CKFileOpenResult
+ (BOOL)supportsSecureCoding;
- (CKFileOpenResult)initWithCoder:(id)a3;
- (CKFileOpenResult)initWithFileHandle:(id)a3 fileSize:(id)a4;
- (CKFileOpenResult)initWithMobileKeyBagHandle:(_mkbbackupref *)a3 path:(id)a4 error:(id *)a5;
- (NSFileHandle)encryptedFileHandle;
- (NSFileHandle)fileHandle;
- (NSNumber)fileSize;
- (_mkbbackupref)handle;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKFileOpenResult

- (CKFileOpenResult)initWithFileHandle:(id)a3 fileSize:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CKFileOpenResult;
  v9 = [(CKFileOpenResult *)&v17 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fileHandle, a3);
    uint64_t v14 = objc_msgSend_copy(v8, v11, v12, v13);
    fileSize = v10->_fileSize;
    v10->_fileSize = (NSNumber *)v14;
  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v20 = a3;
  v4 = (void *)MEMORY[0x18C12ADA0]();
  id v8 = objc_msgSend_fileHandle(self, v5, v6, v7);
  objc_msgSend_encodeObject_forKey_(v20, v9, (uint64_t)v8, @"fileHandle");

  uint64_t v13 = objc_msgSend_encryptedFileHandle(self, v10, v11, v12);
  objc_msgSend_encodeObject_forKey_(v20, v14, (uint64_t)v13, @"encryptedFileHandle");

  v18 = objc_msgSend_fileSize(self, v15, v16, v17);
  objc_msgSend_encodeObject_forKey_(v20, v19, (uint64_t)v18, @"fileSize");
}

- (CKFileOpenResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CKFileOpenResult;
  v5 = [(CKFileOpenResult *)&v20 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x18C12ADA0]();
    uint64_t v7 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, @"fileHandle");
    fileHandle = v5->_fileHandle;
    v5->_fileHandle = (NSFileHandle *)v9;

    uint64_t v11 = objc_opt_class();
    uint64_t v13 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, @"encryptedFileHandle");
    encryptedFileHandle = v5->_encryptedFileHandle;
    v5->_encryptedFileHandle = (NSFileHandle *)v13;

    uint64_t v15 = objc_opt_class();
    uint64_t v17 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, @"fileSize");
    fileSize = v5->_fileSize;
    v5->_fileSize = (NSNumber *)v17;
  }

  return v5;
}

- (CKFileOpenResult)initWithMobileKeyBagHandle:(_mkbbackupref *)a3 path:(id)a4 error:(id *)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  uint64_t v12 = objc_msgSend_init(self, v9, v10, v11);
  if (!v12) {
    goto LABEL_30;
  }
  uint64_t FileDescriptors = MKBBackupGetFileDescriptors();
  if (!FileDescriptors)
  {
    uint64_t v18 = fcntl(-1, 63);
    if ((v18 & 0x80000000) != 0)
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      v22 = (void *)ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      {
        v40 = v22;
        int v41 = *__error();
        v46.st_dev = 138543618;
        *(void *)&v46.st_mode = v8;
        WORD2(v46.st_ino) = 1024;
        *(_DWORD *)((char *)&v46.st_ino + 6) = v41;
        _os_log_error_impl(&dword_18AF10000, v40, OS_LOG_TYPE_ERROR, "could not get protection class of file %{public}@: %{errno}d\n", (uint8_t *)&v46, 0x12u);
      }
    }
    else
    {
      uint64_t v19 = v18;
      if ((v18 - 1) >= 3)
      {
        if (ck_log_initialization_predicate != -1) {
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        }
        v38 = ck_log_facility_ck;
        if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
        {
          v46.st_dev = 138543618;
          *(void *)&v46.st_mode = v8;
          WORD2(v46.st_ino) = 1024;
          *(_DWORD *)((char *)&v46.st_ino + 6) = v19;
          _os_log_error_impl(&dword_18AF10000, v38, OS_LOG_TYPE_ERROR, "attempting to open unprotected file \"%{public}@\": %d", (uint8_t *)&v46, 0x12u);
          if (!a5) {
            goto LABEL_9;
          }
        }
        else if (!a5)
        {
          goto LABEL_9;
        }
        objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v39, @"CKInternalErrorDomain", 1017, @"Attempted to open raw encrypted bytes of unprotected file %@ with class:%d", v8, v19);
        goto LABEL_8;
      }
      memset(&v46, 0, sizeof(v46));
      if (!fstat(-1, &v46) && (v46.st_flags & 0x20) != 0)
      {
        if (ck_log_initialization_predicate != -1) {
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        }
        objc_super v20 = ck_log_facility_ck;
        if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          id v43 = v8;
          __int16 v44 = 1024;
          int v45 = v19;
          _os_log_error_impl(&dword_18AF10000, v20, OS_LOG_TYPE_ERROR, "attempting to open compressed file \"%{public}@\" with class %d", buf, 0x12u);
          if (ck_log_initialization_predicate != -1) {
            dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
          }
        }
        v21 = ck_log_facility_ck;
        if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_18AF10000, v21, OS_LOG_TYPE_ERROR, "sleeping for 10", buf, 2u);
        }
        sleep(0xAu);
        __assert_rtn("-[CKFileOpenResult initWithMobileKeyBagHandle:path:error:]", "CKFileOpenResult.m", 99, "\"attempting to open compressed file\" && 0");
      }
    }
    id v23 = objc_alloc(MEMORY[0x1E4F28CB0]);
    uint64_t v25 = objc_msgSend_initWithFileDescriptor_closeOnDealloc_(v23, v24, 0xFFFFFFFFLL, 0);
    v26 = (void *)v12[1];
    v12[1] = v25;

    id v27 = objc_alloc(MEMORY[0x1E4F28CB0]);
    uint64_t v29 = objc_msgSend_initWithFileDescriptor_closeOnDealloc_(v27, v28, 0xFFFFFFFFLL, 0);
    v30 = (void *)v12[2];
    v12[2] = v29;

    uint64_t v31 = MKBBackupSize();
    uint64_t v34 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v32, v31, v33);
    v35 = (void *)v12[3];
    v12[3] = v34;

    v12[4] = a3;
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v36 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v46.st_dev = 138544130;
      *(void *)&v46.st_mode = v8;
      WORD2(v46.st_ino) = 1024;
      *(_DWORD *)((char *)&v46.st_ino + 6) = -1;
      HIWORD(v46.st_uid) = 1024;
      v46.st_gid = -1;
      LOWORD(v46.st_rdev) = 2048;
      *(void *)((char *)&v46.st_rdev + 2) = v31;
      _os_log_debug_impl(&dword_18AF10000, v36, OS_LOG_TYPE_DEBUG, "MKBBackupGetFileDescriptors succeeded at \"%{public}@\" - fd:%d, efd:%d, size:%llu", (uint8_t *)&v46, 0x22u);
    }
LABEL_30:
    uint64_t v17 = v12;
    goto LABEL_31;
  }
  uint64_t v14 = FileDescriptors;
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v15 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
  {
    v46.st_dev = 138543618;
    *(void *)&v46.st_mode = v8;
    WORD2(v46.st_ino) = 1024;
    *(_DWORD *)((char *)&v46.st_ino + 6) = v14;
    _os_log_error_impl(&dword_18AF10000, v15, OS_LOG_TYPE_ERROR, "MKBBackupGetFileDescriptors failed at \"%{public}@\": %d", (uint8_t *)&v46, 0x12u);
    if (!a5) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  if (a5)
  {
LABEL_7:
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v16, @"CKInternalErrorDomain", 3001, @"MKBBackupGetFileDescriptors failed with rc:%d", v14);
LABEL_8:
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_9:
  uint64_t v17 = 0;
LABEL_31:

  return v17;
}

- (void)dealloc
{
  if (self->_handle) {
    MKBBackupClose();
  }
  v3.receiver = self;
  v3.super_class = (Class)CKFileOpenResult;
  [(CKFileOpenResult *)&v3 dealloc];
}

- (NSFileHandle)fileHandle
{
  return self->_fileHandle;
}

- (NSFileHandle)encryptedFileHandle
{
  return self->_encryptedFileHandle;
}

- (NSNumber)fileSize
{
  return self->_fileSize;
}

- (_mkbbackupref)handle
{
  return self->_handle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileSize, 0);
  objc_storeStrong((id *)&self->_encryptedFileHandle, 0);

  objc_storeStrong((id *)&self->_fileHandle, 0);
}

@end
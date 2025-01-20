@interface CKDSStorageFile
- (BOOL)isOwned;
- (CKDSStorageFile)initWithURL:(id)a3 isOwned:(BOOL)a4;
- (NSURL)URL;
- (void)dealloc;
@end

@implementation CKDSStorageFile

- (CKDSStorageFile)initWithURL:(id)a3 isOwned:(BOOL)a4
{
  id v10 = a3;
  if (!v10)
  {
    v14 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v8, v9);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v14, v15, (uint64_t)a2, self, @"CKDSUtils.m", 25, @"Unexpected arguments");
  }
  v16.receiver = self;
  v16.super_class = (Class)CKDSStorageFile;
  v11 = [(CKDSStorageFile *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_URL, a3);
    v12->_isOwned = a4;
  }

  return v12;
}

- (void)dealloc
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend_URL(self, a2, v2);
  if (v4)
  {
    v7 = (void *)v4;
    int isOwned = objc_msgSend_isOwned(self, v5, v6);

    if (isOwned)
    {
      v11 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v9, v10);
      v14 = objc_msgSend_URL(self, v12, v13);
      id v24 = 0;
      char v16 = objc_msgSend_removeItemAtURL_error_(v11, v15, (uint64_t)v14, &v24);
      id v17 = v24;

      if ((v16 & 1) == 0)
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v18 = (void *)*MEMORY[0x1E4F1A510];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A510], OS_LOG_TYPE_ERROR))
        {
          v19 = v18;
          v22 = objc_msgSend_URL(self, v20, v21);
          *(_DWORD *)buf = 138412546;
          v26 = v22;
          __int16 v27 = 2112;
          id v28 = v17;
          _os_log_error_impl(&dword_1DD237000, v19, OS_LOG_TYPE_ERROR, "Could not delete temporary file %@: %@", buf, 0x16u);
        }
      }
    }
  }
  v23.receiver = self;
  v23.super_class = (Class)CKDSStorageFile;
  [(CKDSStorageFile *)&v23 dealloc];
}

- (NSURL)URL
{
  return self->_URL;
}

- (BOOL)isOwned
{
  return self->_isOwned;
}

- (void).cxx_destruct
{
}

@end
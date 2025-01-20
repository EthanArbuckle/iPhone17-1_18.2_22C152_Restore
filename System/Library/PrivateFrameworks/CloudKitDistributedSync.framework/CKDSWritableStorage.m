@interface CKDSWritableStorage
- (CKDSWritableStorage)initWithFileURL:(id)a3;
- (CKDSWritableStorage)initWithTemporaryFile:(id *)a3;
- (id)initInMemory;
- (id)readableStorage;
@end

@implementation CKDSWritableStorage

- (CKDSWritableStorage)initWithFileURL:(id)a3
{
  id v4 = a3;
  v5 = [CKDSStorageFile alloc];
  isOwned = objc_msgSend_initWithURL_isOwned_(v5, v6, (uint64_t)v4, 0);

  v9 = (CKDSWritableStorage *)objc_msgSend_initForWriting_withFile_orData_(self, v8, 1, isOwned, 0);
  return v9;
}

- (id)initInMemory
{
  v3 = objc_msgSend_dataWithCapacity_(MEMORY[0x1E4F1CA58], a2, 2048);
  v5 = objc_msgSend_initForWriting_withFile_orData_(self, v4, 1, 0, v3);

  return v5;
}

- (CKDSWritableStorage)initWithTemporaryFile:(id *)a3
{
  v38[2] = *MEMORY[0x1E4F143B8];
  v5 = (void *)MEMORY[0x1E4F1CB10];
  v6 = NSTemporaryDirectory();
  v38[0] = v6;
  v38[1] = @"CloudKitDistributedSync";
  v8 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v7, (uint64_t)v38, 2);
  v10 = objc_msgSend_fileURLWithPathComponents_(v5, v9, (uint64_t)v8);

  v13 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v11, v12);
  id v35 = 0;
  char v15 = objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(v13, v14, (uint64_t)v10, 1, 0, &v35);
  id v16 = v35;

  if (v15)
  {
    v19 = NSString;
    v20 = objc_msgSend_UUID(MEMORY[0x1E4F29128], v17, v18);
    v23 = objc_msgSend_UUIDString(v20, v21, v22);
    v25 = objc_msgSend_stringWithFormat_(v19, v24, @"%@.batch", v23);

    v27 = objc_msgSend_URLByAppendingPathComponent_(v10, v26, (uint64_t)v25);
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v28 = *MEMORY[0x1E4F1A510];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A510], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v27;
      _os_log_debug_impl(&dword_1DD237000, v28, OS_LOG_TYPE_DEBUG, "Using temporary file %@", buf, 0xCu);
    }
    v29 = [CKDSStorageFile alloc];
    isOwned = objc_msgSend_initWithURL_isOwned_(v29, v30, (uint64_t)v27, 1);
    self = (CKDSWritableStorage *)(id)objc_msgSend_initForWriting_withFile_orData_(self, v32, 1, isOwned, 0);

    v33 = self;
  }
  else
  {
    v33 = 0;
    if (a3) {
      *a3 = v16;
    }
  }

  return v33;
}

- (id)readableStorage
{
  v3 = [CKDSReadableStorage alloc];
  v6 = objc_msgSend_file(self, v4, v5);
  v9 = objc_msgSend_data(self, v7, v8);
  v11 = objc_msgSend_initForWriting_withFile_orData_(v3, v10, 0, v6, v9);

  return v11;
}

@end
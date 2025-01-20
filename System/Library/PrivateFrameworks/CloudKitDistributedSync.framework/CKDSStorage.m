@interface CKDSStorage
- (BOOL)isEqual:(id)a3;
- (BOOL)size:(unint64_t *)a3 error:(id *)a4;
- (BOOL)writable;
- (CKDSStorageFile)file;
- (NSData)data;
- (NSURL)fileURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dataWithError:(id *)a3;
- (id)description;
- (id)initForWriting:(BOOL)a3 withFile:(id)a4 orData:(id)a5;
- (void)setWritable:(BOOL)a3;
@end

@implementation CKDSStorage

- (id)initForWriting:(BOOL)a3 withFile:(id)a4 orData:(id)a5
{
  unint64_t v10 = (unint64_t)a4;
  unint64_t v13 = (unint64_t)a5;
  if (!(v10 | v13))
  {
    v21 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v11, v12);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v21, v22, (uint64_t)a2, self, @"CKDSUtils.m", 56, @"Unexpected arguments");
  }
  v23.receiver = self;
  v23.super_class = (Class)CKDSStorage;
  v14 = [(CKDSStorage *)&v23 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_file, a4);
    if (a3) {
      uint64_t v18 = objc_msgSend_mutableCopy((void *)v13, v16, v17);
    }
    else {
      uint64_t v18 = objc_msgSend_copy((void *)v13, v16, v17);
    }
    data = v15->_data;
    v15->_data = (NSData *)v18;

    v15->_writable = a3;
  }

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  uint64_t v7 = objc_msgSend_writable(self, v5, v6);
  unint64_t v10 = objc_msgSend_file(self, v8, v9);
  unint64_t v13 = objc_msgSend_data(self, v11, v12);
  v15 = objc_msgSend_initForWriting_withFile_orData_(v4, v14, v7, v10, v13);

  return v15;
}

- (NSURL)fileURL
{
  v3 = objc_msgSend_file(self, a2, v2);
  uint64_t v6 = objc_msgSend_URL(v3, v4, v5);

  return (NSURL *)v6;
}

- (BOOL)size:(unint64_t *)a3 error:(id *)a4
{
  v39[2] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 1;
  }
  uint64_t v7 = objc_msgSend_data(self, a2, (uint64_t)a3);

  if (v7)
  {
    unint64_t v10 = objc_msgSend_data(self, v8, v9);
    *a3 = objc_msgSend_length(v10, v11, v12);

    return 1;
  }
  v15 = objc_msgSend_fileURL(self, v8, v9);

  if (!v15)
  {
    *a3 = 0;
    return 1;
  }
  uint64_t v18 = objc_msgSend_fileURL(self, v16, v17);
  id v37 = 0;
  uint64_t v19 = *MEMORY[0x1E4F1C5F8];
  id v36 = 0;
  char ResourceValue_forKey_error = objc_msgSend_getResourceValue_forKey_error_(v18, v20, (uint64_t)&v37, v19, &v36);
  id v21 = v37;
  id v22 = v36;

  if (ResourceValue_forKey_error)
  {
    unint64_t v25 = objc_msgSend_unsignedIntegerValue(v21, v23, v24);
  }
  else
  {
    if (a4)
    {
      v26 = (void *)MEMORY[0x1E4F28C58];
      v38[0] = *MEMORY[0x1E4F28568];
      v27 = NSString;
      v28 = objc_msgSend_fileURL(self, v23, v24);
      v30 = objc_msgSend_stringWithFormat_(v27, v29, @"Error reading file %@", v28);
      v38[1] = *MEMORY[0x1E4F28A50];
      v39[0] = v30;
      v39[1] = v22;
      v32 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v31, (uint64_t)v39, v38, 2);
      v34 = objc_msgSend_errorWithDomain_code_userInfo_(v26, v33, @"CKDSErrorDomain", 5, v32);

      id v35 = v34;
      *a4 = v35;
    }
    unint64_t v25 = 0;
  }
  *a3 = v25;

  return ResourceValue_forKey_error;
}

- (id)dataWithError:(id *)a3
{
  v26[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_data(self, a2, (uint64_t)a3);

  if (v5)
  {
    uint64_t v8 = objc_msgSend_data(self, v6, v7);
    if (v8)
    {
      uint64_t v9 = (void *)v8;
      id v10 = 0;
      goto LABEL_10;
    }
LABEL_6:
    v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = *MEMORY[0x1E4F28568];
    v15 = NSString;
    v16 = (objc_class *)objc_opt_class();
    uint64_t v17 = NSStringFromClass(v16);
    uint64_t v19 = objc_msgSend_stringWithFormat_(v15, v18, @"%@ was improperly initialized", v17);
    v26[0] = v19;
    id v21 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v20, (uint64_t)v26, &v25, 1);
    objc_msgSend_errorWithDomain_code_userInfo_(v14, v22, @"CKDSErrorDomain", 1, v21);
    id v10 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  v11 = (void *)MEMORY[0x1E4F1C9B8];
  uint64_t v12 = objc_msgSend_fileURL(self, v6, v7);
  id v24 = 0;
  uint64_t v9 = objc_msgSend_dataWithContentsOfURL_options_error_(v11, v13, (uint64_t)v12, 0, &v24);
  id v10 = v24;

  if (v9) {
    goto LABEL_10;
  }
  if (!v10) {
    goto LABEL_6;
  }
LABEL_7:
  if (a3)
  {
    id v10 = v10;
    uint64_t v9 = 0;
    *a3 = v10;
  }
  else
  {
    uint64_t v9 = 0;
  }
LABEL_10:

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (CKDSStorage *)a3;
  if (self == v5)
  {
    char isEqual = 1;
  }
  else
  {
    uint64_t v6 = objc_opt_class();
    if (objc_msgSend_isMemberOfClass_(v5, v7, v6))
    {
      uint64_t v8 = v5;
      v11 = objc_msgSend_data(self, v9, v10);
      v16 = objc_msgSend_data(v8, v12, v13);
      if (v11 != v16)
      {
        uint64_t v17 = objc_msgSend_data(self, v14, v15);
        v3 = objc_msgSend_data(v8, v18, v19);
        if (!objc_msgSend_isEqual_(v17, v20, (uint64_t)v3))
        {
          char isEqual = 0;
LABEL_13:

LABEL_14:
          goto LABEL_15;
        }
        v34 = v17;
      }
      id v22 = objc_msgSend_fileURL(self, v14, v15);
      v27 = objc_msgSend_fileURL(v8, v23, v24);
      if (v22 == v27)
      {
        char isEqual = 1;
      }
      else
      {
        v28 = objc_msgSend_fileURL(self, v25, v26);
        v31 = objc_msgSend_fileURL(v8, v29, v30);
        char isEqual = objc_msgSend_isEqual_(v28, v32, (uint64_t)v31);
      }
      uint64_t v17 = v34;
      if (v11 == v16) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
    char isEqual = 0;
  }
LABEL_15:

  return isEqual;
}

- (id)description
{
  v3 = objc_opt_new();
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  objc_msgSend_appendFormat_(v3, v6, @"<%@: %p; ", v5, self);

  uint64_t v9 = objc_msgSend_file(self, v7, v8);

  if (v9)
  {
    uint64_t v12 = objc_msgSend_file(self, v10, v11);
    int isOwned = objc_msgSend_isOwned(v12, v13, v14);

    if (isOwned) {
      objc_msgSend_appendFormat_(v3, v16, @"type=ownedFile, ");
    }
    else {
      objc_msgSend_appendFormat_(v3, v16, @"type=file, ");
    }
    uint64_t v19 = objc_msgSend_file(self, v17, v18);
    id v22 = objc_msgSend_URL(v19, v20, v21);
    objc_msgSend_appendFormat_(v3, v23, @"URL=%@", v22);
  }
  else
  {
    objc_msgSend_appendFormat_(v3, v10, @"type=data");
  }
  objc_msgSend_appendFormat_(v3, v24, @">");
  return v3;
}

- (NSData)data
{
  return self->_data;
}

- (CKDSStorageFile)file
{
  return self->_file;
}

- (BOOL)writable
{
  return self->_writable;
}

- (void)setWritable:(BOOL)a3
{
  self->_writable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_file, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
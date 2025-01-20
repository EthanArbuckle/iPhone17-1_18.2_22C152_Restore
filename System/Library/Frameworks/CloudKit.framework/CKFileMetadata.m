@interface CKFileMetadata
+ (BOOL)supportsSecureCoding;
- (CKFileMetadata)initWithCoder:(id)a3;
- (CKFileMetadata)initWithDeviceID:(id)a3 fileID:(id)a4 generationID:(id)a5 modTimeInSeconds:(id)a6 fileSize:(id)a7;
- (CKFileMetadata)initWithFileSize:(id)a3;
- (NSNumber)deviceID;
- (NSNumber)fileID;
- (NSNumber)fileSize;
- (NSNumber)generationID;
- (NSNumber)modTimeInSeconds;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKFileMetadata

- (CKFileMetadata)initWithDeviceID:(id)a3 fileID:(id)a4 generationID:(id)a5 modTimeInSeconds:(id)a6 fileSize:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v44.receiver = self;
  v44.super_class = (Class)CKFileMetadata;
  v20 = [(CKFileMetadata *)&v44 init];
  if (v20)
  {
    uint64_t v21 = objc_msgSend_copy(v12, v17, v18, v19);
    deviceID = v20->_deviceID;
    v20->_deviceID = (NSNumber *)v21;

    uint64_t v26 = objc_msgSend_copy(v13, v23, v24, v25);
    fileID = v20->_fileID;
    v20->_fileID = (NSNumber *)v26;

    uint64_t v31 = objc_msgSend_copy(v14, v28, v29, v30);
    generationID = v20->_generationID;
    v20->_generationID = (NSNumber *)v31;

    uint64_t v36 = objc_msgSend_copy(v15, v33, v34, v35);
    modTimeInSeconds = v20->_modTimeInSeconds;
    v20->_modTimeInSeconds = (NSNumber *)v36;

    uint64_t v41 = objc_msgSend_copy(v16, v38, v39, v40);
    fileSize = v20->_fileSize;
    v20->_fileSize = (NSNumber *)v41;
  }
  return v20;
}

- (CKFileMetadata)initWithFileSize:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CKFileMetadata;
  v8 = [(CKFileMetadata *)&v12 init];
  if (v8)
  {
    uint64_t v9 = objc_msgSend_copy(v4, v5, v6, v7);
    fileSize = v8->_fileSize;
    v8->_fileSize = (NSNumber *)v9;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v30 = a3;
  id v4 = (void *)MEMORY[0x18C12ADA0]();
  v8 = objc_msgSend_deviceID(self, v5, v6, v7);
  objc_msgSend_encodeObject_forKey_(v30, v9, (uint64_t)v8, @"DeviceID");

  id v13 = objc_msgSend_fileID(self, v10, v11, v12);
  objc_msgSend_encodeObject_forKey_(v30, v14, (uint64_t)v13, @"FileID");

  uint64_t v18 = objc_msgSend_generationID(self, v15, v16, v17);
  objc_msgSend_encodeObject_forKey_(v30, v19, (uint64_t)v18, @"GenerationID");

  v23 = objc_msgSend_modTimeInSeconds(self, v20, v21, v22);
  objc_msgSend_encodeObject_forKey_(v30, v24, (uint64_t)v23, @"ModTimeInSeconds");

  v28 = objc_msgSend_fileSize(self, v25, v26, v27);
  objc_msgSend_encodeObject_forKey_(v30, v29, (uint64_t)v28, @"FileSize");
}

- (CKFileMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CKFileMetadata;
  v5 = [(CKFileMetadata *)&v28 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x18C12ADA0]();
    uint64_t v7 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, @"DeviceID");
    deviceID = v5->_deviceID;
    v5->_deviceID = (NSNumber *)v9;

    uint64_t v11 = objc_opt_class();
    uint64_t v13 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, @"FileID");
    fileID = v5->_fileID;
    v5->_fileID = (NSNumber *)v13;

    uint64_t v15 = objc_opt_class();
    uint64_t v17 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, @"GenerationID");
    generationID = v5->_generationID;
    v5->_generationID = (NSNumber *)v17;

    uint64_t v19 = objc_opt_class();
    uint64_t v21 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v20, v19, @"ModTimeInSeconds");
    modTimeInSeconds = v5->_modTimeInSeconds;
    v5->_modTimeInSeconds = (NSNumber *)v21;

    uint64_t v23 = objc_opt_class();
    uint64_t v25 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v24, v23, @"FileSize");
    fileSize = v5->_fileSize;
    v5->_fileSize = (NSNumber *)v25;
  }

  return v5;
}

- (NSNumber)deviceID
{
  return self->_deviceID;
}

- (NSNumber)fileID
{
  return self->_fileID;
}

- (NSNumber)generationID
{
  return self->_generationID;
}

- (NSNumber)modTimeInSeconds
{
  return self->_modTimeInSeconds;
}

- (NSNumber)fileSize
{
  return self->_fileSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileSize, 0);
  objc_storeStrong((id *)&self->_modTimeInSeconds, 0);
  objc_storeStrong((id *)&self->_generationID, 0);
  objc_storeStrong((id *)&self->_fileID, 0);

  objc_storeStrong((id *)&self->_deviceID, 0);
}

@end
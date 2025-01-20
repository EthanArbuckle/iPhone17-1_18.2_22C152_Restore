@interface CKFileOpenInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)shouldReadRawEncryptedData;
- (CKAssetDownloadStagingInfo)assetDownloadStagingInfo;
- (CKAssetDownloadStagingManager)assetDownloadStagingManager;
- (CKFileOpenInfo)initWithCoder:(id)a3;
- (CKFileOpenInfo)initWithPath:(id)a3;
- (CKFileOpenInfo)initWithUUID:(id)a3 path:(id)a4 deviceID:(id)a5 fileID:(id)a6 generationID:(id)a7 shouldReadRawEncryptedData:(BOOL)a8 fileHandle:(id)a9 assetDownloadStagingInfo:(id)a10;
- (NSFileHandle)fileHandle;
- (NSNumber)deviceID;
- (NSNumber)fileID;
- (NSNumber)generationID;
- (NSString)UUID;
- (NSString)path;
- (id)CKPropertiesDescription;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAssetDownloadStagingManager:(id)a3;
@end

@implementation CKFileOpenInfo

- (CKFileOpenInfo)initWithUUID:(id)a3 path:(id)a4 deviceID:(id)a5 fileID:(id)a6 generationID:(id)a7 shouldReadRawEncryptedData:(BOOL)a8 fileHandle:(id)a9 assetDownloadStagingInfo:(id)a10
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a9;
  id v21 = a10;
  v50.receiver = self;
  v50.super_class = (Class)CKFileOpenInfo;
  v25 = [(CKFileOpenInfo *)&v50 init];
  if (v25)
  {
    uint64_t v26 = objc_msgSend_copy(v15, v22, v23, v24);
    UUID = v25->_UUID;
    v25->_UUID = (NSString *)v26;

    uint64_t v31 = objc_msgSend_copy(v16, v28, v29, v30);
    path = v25->_path;
    v25->_path = (NSString *)v31;

    uint64_t v36 = objc_msgSend_copy(v17, v33, v34, v35);
    deviceID = v25->_deviceID;
    v25->_deviceID = (NSNumber *)v36;

    uint64_t v41 = objc_msgSend_copy(v18, v38, v39, v40);
    fileID = v25->_fileID;
    v25->_fileID = (NSNumber *)v41;

    uint64_t v46 = objc_msgSend_copy(v19, v43, v44, v45);
    generationID = v25->_generationID;
    v25->_generationID = (NSNumber *)v46;

    v25->_shouldReadRawEncryptedData = a8;
    objc_storeStrong((id *)&v25->_fileHandle, a9);
    objc_storeStrong((id *)&v25->_assetDownloadStagingInfo, a10);
  }

  return v25;
}

- (CKFileOpenInfo)initWithPath:(id)a3
{
  return (CKFileOpenInfo *)objc_msgSend_initWithUUID_path_deviceID_fileID_generationID_shouldReadRawEncryptedData_fileHandle_assetDownloadStagingInfo_(self, a2, 0, (uint64_t)a3, 0, 0, 0, 0, 0, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v40 = a3;
  v4 = (void *)MEMORY[0x18C12ADA0]();
  v8 = objc_msgSend_UUID(self, v5, v6, v7);
  objc_msgSend_encodeObject_forKey_(v40, v9, (uint64_t)v8, @"UUID");

  v13 = objc_msgSend_path(self, v10, v11, v12);
  objc_msgSend_encodeObject_forKey_(v40, v14, (uint64_t)v13, @"path");

  id v18 = objc_msgSend_deviceID(self, v15, v16, v17);
  objc_msgSend_encodeObject_forKey_(v40, v19, (uint64_t)v18, @"deviceID");

  uint64_t v23 = objc_msgSend_fileID(self, v20, v21, v22);
  objc_msgSend_encodeObject_forKey_(v40, v24, (uint64_t)v23, @"fileID");

  v28 = objc_msgSend_generationID(self, v25, v26, v27);
  objc_msgSend_encodeObject_forKey_(v40, v29, (uint64_t)v28, @"generationID");

  uint64_t RawEncryptedData = objc_msgSend_shouldReadRawEncryptedData(self, v30, v31, v32);
  objc_msgSend_encodeBool_forKey_(v40, v34, RawEncryptedData, @"shouldReadRawEncryptedData");
  v38 = objc_msgSend_assetDownloadStagingInfo(self, v35, v36, v37);
  objc_msgSend_encodeObject_forKey_(v40, v39, (uint64_t)v38, @"AssetDownloadStagingInfo");
}

- (CKFileOpenInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)CKFileOpenInfo;
  v5 = [(CKFileOpenInfo *)&v34 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x18C12ADA0]();
    uint64_t v7 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, @"UUID");
    UUID = v5->_UUID;
    v5->_UUID = (NSString *)v9;

    uint64_t v11 = objc_opt_class();
    uint64_t v13 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, @"path");
    path = v5->_path;
    v5->_path = (NSString *)v13;

    uint64_t v15 = objc_opt_class();
    uint64_t v17 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, @"deviceID");
    deviceID = v5->_deviceID;
    v5->_deviceID = (NSNumber *)v17;

    uint64_t v19 = objc_opt_class();
    uint64_t v21 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v20, v19, @"fileID");
    fileID = v5->_fileID;
    v5->_fileID = (NSNumber *)v21;

    uint64_t v23 = objc_opt_class();
    uint64_t v25 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v24, v23, @"generationID");
    generationID = v5->_generationID;
    v5->_generationID = (NSNumber *)v25;

    v5->_shouldReaduint64_t RawEncryptedData = objc_msgSend_decodeBoolForKey_(v4, v27, @"shouldReadRawEncryptedData", v28);
    uint64_t v29 = objc_opt_class();
    uint64_t v31 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v30, v29, @"AssetDownloadStagingInfo");
    assetDownloadStagingInfo = v5->_assetDownloadStagingInfo;
    v5->_assetDownloadStagingInfo = (CKAssetDownloadStagingInfo *)v31;
  }

  return v5;
}

- (id)CKPropertiesDescription
{
  id v4 = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], a2, 6, v2);
  v5 = NSString;
  uint64_t v9 = objc_msgSend_UUID(self, v6, v7, v8);
  uint64_t v12 = objc_msgSend_stringWithFormat_(v5, v10, @"UUID=%@", v11, v9);
  objc_msgSend_addObject_(v4, v13, (uint64_t)v12, v14);

  id v18 = objc_msgSend_deviceID(self, v15, v16, v17);

  if (v18)
  {
    uint64_t v22 = NSString;
    uint64_t v23 = objc_msgSend_deviceID(self, v19, v20, v21);
    uint64_t v26 = objc_msgSend_stringWithFormat_(v22, v24, @"deviceID=%@", v25, v23);
    objc_msgSend_addObject_(v4, v27, (uint64_t)v26, v28);
  }
  uint64_t v29 = objc_msgSend_fileID(self, v19, v20, v21);

  if (v29)
  {
    v33 = NSString;
    objc_super v34 = objc_msgSend_fileID(self, v30, v31, v32);
    uint64_t v37 = objc_msgSend_stringWithFormat_(v33, v35, @"fileID=%@", v36, v34);
    objc_msgSend_addObject_(v4, v38, (uint64_t)v37, v39);
  }
  id v40 = objc_msgSend_generationID(self, v30, v31, v32);

  if (v40)
  {
    uint64_t v44 = NSString;
    uint64_t v45 = objc_msgSend_generationID(self, v41, v42, v43);
    v48 = objc_msgSend_stringWithFormat_(v44, v46, @"generationID=%@", v47, v45);
    objc_msgSend_addObject_(v4, v49, (uint64_t)v48, v50);
  }
  v51 = objc_msgSend_path(self, v41, v42, v43);

  if (v51)
  {
    v55 = NSString;
    v56 = objc_msgSend_path(self, v52, v53, v54);
    v60 = objc_msgSend_CKSanitizedPath(v56, v57, v58, v59);
    v63 = objc_msgSend_stringWithFormat_(v55, v61, @"path=\"%@\"", v62, v60);
    objc_msgSend_addObject_(v4, v64, (uint64_t)v63, v65);
  }
  v66 = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], v52, 1, v54);
  if (objc_msgSend_shouldReadRawEncryptedData(self, v67, v68, v69)) {
    objc_msgSend_addObject_(v66, v70, @"read-encrypted", v72);
  }
  if (objc_msgSend_count(v66, v70, v71, v72))
  {
    v75 = NSString;
    v76 = objc_msgSend_componentsJoinedByString_(v66, v73, @"|", v74);
    v79 = objc_msgSend_stringWithFormat_(v75, v77, @"flags=%@", v78, v76);
    objc_msgSend_addObject_(v4, v80, (uint64_t)v79, v81);
  }
  v82 = objc_msgSend_componentsJoinedByString_(v4, v73, @", ", v74);

  return v82;
}

- (id)description
{
  return (id)((uint64_t (*)(CKFileOpenInfo *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (NSString)UUID
{
  return self->_UUID;
}

- (NSString)path
{
  return self->_path;
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

- (BOOL)shouldReadRawEncryptedData
{
  return self->_shouldReadRawEncryptedData;
}

- (NSFileHandle)fileHandle
{
  return self->_fileHandle;
}

- (CKAssetDownloadStagingInfo)assetDownloadStagingInfo
{
  return self->_assetDownloadStagingInfo;
}

- (CKAssetDownloadStagingManager)assetDownloadStagingManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_assetDownloadStagingManager);

  return (CKAssetDownloadStagingManager *)WeakRetained;
}

- (void)setAssetDownloadStagingManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_assetDownloadStagingManager);
  objc_storeStrong((id *)&self->_assetDownloadStagingInfo, 0);
  objc_storeStrong((id *)&self->_fileHandle, 0);
  objc_storeStrong((id *)&self->_generationID, 0);
  objc_storeStrong((id *)&self->_fileID, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_path, 0);

  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
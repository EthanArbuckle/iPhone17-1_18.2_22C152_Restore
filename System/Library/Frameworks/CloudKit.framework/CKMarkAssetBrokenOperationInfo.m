@interface CKMarkAssetBrokenOperationInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)bypassPCSEncryptionForTouchRepairZone;
- (BOOL)simulateCorruptAsset;
- (BOOL)touchRepairZone;
- (BOOL)writeRepairRecord;
- (CKMarkAssetBrokenOperationInfo)init;
- (CKMarkAssetBrokenOperationInfo)initWithCoder:(id)a3;
- (CKRecordID)recordID;
- (CKUploadRequestConfiguration)uploadRequestConfiguration;
- (NSString)field;
- (int64_t)listIndex;
- (void)encodeWithCoder:(id)a3;
- (void)setBypassPCSEncryptionForTouchRepairZone:(BOOL)a3;
- (void)setField:(id)a3;
- (void)setListIndex:(int64_t)a3;
- (void)setRecordID:(id)a3;
- (void)setSimulateCorruptAsset:(BOOL)a3;
- (void)setTouchRepairZone:(BOOL)a3;
- (void)setUploadRequestConfiguration:(id)a3;
- (void)setWriteRepairRecord:(BOOL)a3;
@end

@implementation CKMarkAssetBrokenOperationInfo

- (CKMarkAssetBrokenOperationInfo)init
{
  v3.receiver = self;
  v3.super_class = (Class)CKMarkAssetBrokenOperationInfo;
  result = [(CKOperationInfo *)&v3 init];
  if (result)
  {
    result->_touchRepairZone = 1;
    result->_simulateCorruptAsset = 1;
    result->_writeRepairRecord = 1;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x18C12ADA0]();
  v54.receiver = self;
  v54.super_class = (Class)CKMarkAssetBrokenOperationInfo;
  [(CKDatabaseOperationInfo *)&v54 encodeWithCoder:v4];
  v9 = objc_msgSend_recordID(self, v6, v7, v8);
  v10 = NSStringFromSelector(sel_recordID);
  objc_msgSend_encodeObject_forKey_(v4, v11, (uint64_t)v9, (uint64_t)v10);

  v15 = objc_msgSend_field(self, v12, v13, v14);
  v16 = NSStringFromSelector(sel_field);
  objc_msgSend_encodeObject_forKey_(v4, v17, (uint64_t)v15, (uint64_t)v16);

  uint64_t v21 = objc_msgSend_listIndex(self, v18, v19, v20);
  v22 = NSStringFromSelector(sel_listIndex);
  objc_msgSend_encodeInteger_forKey_(v4, v23, v21, (uint64_t)v22);

  uint64_t v27 = objc_msgSend_touchRepairZone(self, v24, v25, v26);
  v28 = NSStringFromSelector(sel_touchRepairZone);
  objc_msgSend_encodeBool_forKey_(v4, v29, v27, (uint64_t)v28);

  uint64_t v33 = objc_msgSend_simulateCorruptAsset(self, v30, v31, v32);
  v34 = NSStringFromSelector(sel_simulateCorruptAsset);
  objc_msgSend_encodeBool_forKey_(v4, v35, v33, (uint64_t)v34);

  uint64_t v39 = objc_msgSend_bypassPCSEncryptionForTouchRepairZone(self, v36, v37, v38);
  v40 = NSStringFromSelector(sel_bypassPCSEncryptionForTouchRepairZone);
  objc_msgSend_encodeBool_forKey_(v4, v41, v39, (uint64_t)v40);

  uint64_t v45 = objc_msgSend_writeRepairRecord(self, v42, v43, v44);
  v46 = NSStringFromSelector(sel_writeRepairRecord);
  objc_msgSend_encodeBool_forKey_(v4, v47, v45, (uint64_t)v46);

  v51 = objc_msgSend_uploadRequestConfiguration(self, v48, v49, v50);
  v52 = NSStringFromSelector(sel_uploadRequestConfiguration);
  objc_msgSend_encodeObject_forKey_(v4, v53, (uint64_t)v51, (uint64_t)v52);
}

- (CKMarkAssetBrokenOperationInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)CKMarkAssetBrokenOperationInfo;
  v5 = [(CKDatabaseOperationInfo *)&v38 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x18C12ADA0]();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = NSStringFromSelector(sel_recordID);
    uint64_t v10 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v9, v7, (uint64_t)v8);
    recordID = v5->_recordID;
    v5->_recordID = (CKRecordID *)v10;

    uint64_t v12 = objc_opt_class();
    uint64_t v13 = NSStringFromSelector(sel_field);
    uint64_t v15 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v12, (uint64_t)v13);
    field = v5->_field;
    v5->_field = (NSString *)v15;

    v17 = NSStringFromSelector(sel_listIndex);
    v5->_listIndex = objc_msgSend_decodeIntegerForKey_(v4, v18, (uint64_t)v17, v19);

    uint64_t v20 = NSStringFromSelector(sel_touchRepairZone);
    v5->_touchRepairZone = objc_msgSend_decodeBoolForKey_(v4, v21, (uint64_t)v20, v22);

    v23 = NSStringFromSelector(sel_simulateCorruptAsset);
    v5->_simulateCorruptAsset = objc_msgSend_decodeBoolForKey_(v4, v24, (uint64_t)v23, v25);

    uint64_t v26 = NSStringFromSelector(sel_bypassPCSEncryptionForTouchRepairZone);
    v5->_bypassPCSEncryptionForTouchRepairZone = objc_msgSend_decodeBoolForKey_(v4, v27, (uint64_t)v26, v28);

    v29 = NSStringFromSelector(sel_writeRepairRecord);
    v5->_writeRepairRecord = objc_msgSend_decodeBoolForKey_(v4, v30, (uint64_t)v29, v31);

    uint64_t v32 = objc_opt_class();
    uint64_t v33 = NSStringFromSelector(sel_uploadRequestConfiguration);
    uint64_t v35 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v34, v32, (uint64_t)v33);
    uploadRequestConfiguration = v5->_uploadRequestConfiguration;
    v5->_uploadRequestConfiguration = (CKUploadRequestConfiguration *)v35;
  }

  return v5;
}

- (CKUploadRequestConfiguration)uploadRequestConfiguration
{
  return self->_uploadRequestConfiguration;
}

- (void)setUploadRequestConfiguration:(id)a3
{
}

- (CKRecordID)recordID
{
  return self->_recordID;
}

- (void)setRecordID:(id)a3
{
}

- (NSString)field
{
  return self->_field;
}

- (void)setField:(id)a3
{
}

- (int64_t)listIndex
{
  return self->_listIndex;
}

- (void)setListIndex:(int64_t)a3
{
  self->_listIndex = a3;
}

- (BOOL)touchRepairZone
{
  return self->_touchRepairZone;
}

- (void)setTouchRepairZone:(BOOL)a3
{
  self->_touchRepairZone = a3;
}

- (BOOL)bypassPCSEncryptionForTouchRepairZone
{
  return self->_bypassPCSEncryptionForTouchRepairZone;
}

- (void)setBypassPCSEncryptionForTouchRepairZone:(BOOL)a3
{
  self->_bypassPCSEncryptionForTouchRepairZone = a3;
}

- (BOOL)simulateCorruptAsset
{
  return self->_simulateCorruptAsset;
}

- (void)setSimulateCorruptAsset:(BOOL)a3
{
  self->_simulateCorruptAsset = a3;
}

- (BOOL)writeRepairRecord
{
  return self->_writeRepairRecord;
}

- (void)setWriteRepairRecord:(BOOL)a3
{
  self->_writeRepairRecord = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_field, 0);
  objc_storeStrong((id *)&self->_recordID, 0);

  objc_storeStrong((id *)&self->_uploadRequestConfiguration, 0);
}

@end
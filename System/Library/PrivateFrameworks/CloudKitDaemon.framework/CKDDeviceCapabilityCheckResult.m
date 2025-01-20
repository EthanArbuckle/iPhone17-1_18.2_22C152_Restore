@interface CKDDeviceCapabilityCheckResult
- (BOOL)canValidateWithKT;
- (BOOL)isSupported;
- (CKRecordID)shareID;
- (NSArray)publicKeys;
- (NSString)userID;
- (id)initNotSupportedWithUserID:(id)a3 publicKeys:(id)a4 canValidateWithKT:(BOOL)a5 shareID:(id)a6;
- (id)initSupported;
- (id)makeClientResult;
@end

@implementation CKDDeviceCapabilityCheckResult

- (id)initNotSupportedWithUserID:(id)a3 publicKeys:(id)a4 canValidateWithKT:(BOOL)a5 shareID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v28.receiver = self;
  v28.super_class = (Class)CKDDeviceCapabilityCheckResult;
  v13 = [(CKDDeviceCapabilityCheckResult *)&v28 init];
  v16 = v13;
  if (v13)
  {
    v13->_isSupported = 0;
    uint64_t v17 = objc_msgSend_copy(v10, v14, v15);
    userID = v16->_userID;
    v16->_userID = (NSString *)v17;

    uint64_t v21 = objc_msgSend_copy(v11, v19, v20);
    publicKeys = v16->_publicKeys;
    v16->_publicKeys = (NSArray *)v21;

    v16->_canValidateWithKT = a5;
    uint64_t v25 = objc_msgSend_copy(v12, v23, v24);
    shareID = v16->_shareID;
    v16->_shareID = (CKRecordID *)v25;
  }
  return v16;
}

- (id)initSupported
{
  v3.receiver = self;
  v3.super_class = (Class)CKDDeviceCapabilityCheckResult;
  id result = [(CKDDeviceCapabilityCheckResult *)&v3 init];
  if (result) {
    *((unsigned char *)result + 8) = 1;
  }
  return result;
}

- (id)makeClientResult
{
  id v3 = objc_alloc(MEMORY[0x1E4F19F60]);
  uint64_t isSupported = objc_msgSend_isSupported(self, v4, v5);
  v8 = objc_msgSend_initWithIsSupported_(v3, v7, isSupported);
  return v8;
}

- (BOOL)isSupported
{
  return self->_isSupported;
}

- (NSString)userID
{
  return self->_userID;
}

- (NSArray)publicKeys
{
  return self->_publicKeys;
}

- (BOOL)canValidateWithKT
{
  return self->_canValidateWithKT;
}

- (CKRecordID)shareID
{
  return self->_shareID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareID, 0);
  objc_storeStrong((id *)&self->_publicKeys, 0);
  objc_storeStrong((id *)&self->_userID, 0);
}

@end
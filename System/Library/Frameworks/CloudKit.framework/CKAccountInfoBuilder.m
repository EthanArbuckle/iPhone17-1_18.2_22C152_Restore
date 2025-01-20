@interface CKAccountInfoBuilder
- (BOOL)bypassPCSEncryption;
- (BOOL)hasValidCredentials;
- (BOOL)needsToVerifyTerms;
- (CKAccountInfoBuilder)init;
- (id)build;
- (int64_t)accountAccessAuthorization;
- (int64_t)accountPartition;
- (int64_t)accountStatus;
- (int64_t)deviceToDeviceEncryptionAvailability;
- (int64_t)walrusStatus;
- (void)setAccountAccessAuthorization:(int64_t)a3;
- (void)setAccountPartition:(int64_t)a3;
- (void)setAccountStatus:(int64_t)a3;
- (void)setBypassPCSEncryption:(BOOL)a3;
- (void)setDeviceToDeviceEncryptionAvailability:(int64_t)a3;
- (void)setHasValidCredentials:(BOOL)a3;
- (void)setNeedsToVerifyTerms:(BOOL)a3;
- (void)setWalrusStatus:(int64_t)a3;
@end

@implementation CKAccountInfoBuilder

- (void)setHasValidCredentials:(BOOL)a3
{
  self->_hasValidCredentials = a3;
}

- (void)setWalrusStatus:(int64_t)a3
{
  self->_walrusStatus = a3;
}

- (void)setNeedsToVerifyTerms:(BOOL)a3
{
  self->_needsToVerifyTerms = a3;
}

- (void)setDeviceToDeviceEncryptionAvailability:(int64_t)a3
{
  self->_deviceToDeviceEncryptionAvailability = a3;
}

- (void)setBypassPCSEncryption:(BOOL)a3
{
  self->_bypassPCSEncryption = a3;
}

- (void)setAccountStatus:(int64_t)a3
{
  self->_accountStatus = a3;
}

- (void)setAccountPartition:(int64_t)a3
{
  self->_accountPartition = a3;
}

- (void)setAccountAccessAuthorization:(int64_t)a3
{
  self->_accountAccessAuthorization = a3;
}

- (CKAccountInfoBuilder)init
{
  v9.receiver = self;
  v9.super_class = (Class)CKAccountInfoBuilder;
  v2 = [(CKAccountInfoBuilder *)&v9 init];
  v3 = v2;
  if (v2)
  {
    if (!byte_1E9124EF0)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = sub_18AF261AC;
      v7[3] = &unk_1E545FF68;
      v8 = v2;
      objc_msgSend_performAtomicDefaultsOperation_(CKUserDefaults, v4, (uint64_t)v7, v5);
    }
    *(_OWORD *)&v3->_accountStatus = xmmword_18B1F1E70;
    *(_WORD *)&v3->_hasValidCredentials = 0;
    v3->_needsToVerifyTerms = 0;
    v3->_walrusStatus = 0;
    v3->_accountAccessAuthorization = 0;
    v3->_deviceToDeviceEncryptionAvailability = 0;
  }
  return v3;
}

- (id)build
{
  v6 = [CKAccountInfo alloc];
  if (self) {
    int64_t validationCounter = self->_validationCounter;
  }
  else {
    int64_t validationCounter = 0;
  }
  uint64_t v8 = objc_msgSend_accountStatus(self, v3, v4, v5);
  uint64_t v12 = objc_msgSend_accountPartition(self, v9, v10, v11);
  uint64_t hasValidCredentials = objc_msgSend_hasValidCredentials(self, v13, v14, v15);
  uint64_t v20 = objc_msgSend_bypassPCSEncryption(self, v17, v18, v19);
  uint64_t v24 = objc_msgSend_deviceToDeviceEncryptionAvailability(self, v21, v22, v23);
  uint64_t v28 = objc_msgSend_walrusStatus(self, v25, v26, v27);
  char v32 = objc_msgSend_needsToVerifyTerms(self, v29, v30, v31);
  uint64_t v36 = objc_msgSend_accountAccessAuthorization(self, v33, v34, v35);
  hasValidCredentials_bypassPCSEncryption_deviceToDeviceEncryptionAvailability_walrusStatus_needsToVerifyTerms_accountAccessAuthorization = objc_msgSend_initWithValidationCounter_accountStatus_accountPartition_hasValidCredentials_bypassPCSEncryption_deviceToDeviceEncryptionAvailability_walrusStatus_needsToVerifyTerms_accountAccessAuthorization_(v6, v37, validationCounter, v8, v12, hasValidCredentials, v20, v24, v28, v32, v36);

  return hasValidCredentials_bypassPCSEncryption_deviceToDeviceEncryptionAvailability_walrusStatus_needsToVerifyTerms_accountAccessAuthorization;
}

- (int64_t)accountStatus
{
  return self->_accountStatus;
}

- (BOOL)bypassPCSEncryption
{
  return self->_bypassPCSEncryption;
}

- (int64_t)walrusStatus
{
  return self->_walrusStatus;
}

- (BOOL)needsToVerifyTerms
{
  return self->_needsToVerifyTerms;
}

- (BOOL)hasValidCredentials
{
  return self->_hasValidCredentials;
}

- (int64_t)deviceToDeviceEncryptionAvailability
{
  return self->_deviceToDeviceEncryptionAvailability;
}

- (int64_t)accountPartition
{
  return self->_accountPartition;
}

- (int64_t)accountAccessAuthorization
{
  return self->_accountAccessAuthorization;
}

@end
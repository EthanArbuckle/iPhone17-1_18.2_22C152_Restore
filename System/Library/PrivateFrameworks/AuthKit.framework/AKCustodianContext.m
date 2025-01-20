@interface AKCustodianContext
+ (BOOL)supportsSecureCoding;
- (AKCustodianContext)initWithCoder:(id)a3;
- (BOOL)_cliMode;
- (BOOL)cliMode;
- (BOOL)isCustodianSyncAction;
- (BOOL)ownerDevice;
- (NSArray)beneficiaryContacts;
- (NSArray)beneficiaryUUIDs;
- (NSArray)custodianContacts;
- (NSArray)custodianUUIDs;
- (NSData)aaData;
- (NSData)encryptedPRKC;
- (NSData)idmsData;
- (NSData)wrappingKeyRKC;
- (NSDate)lastDataSyncTimestamp;
- (NSString)_heartbeatToken;
- (NSString)_identityToken;
- (NSString)altDSID;
- (NSString)custodianRecoveryToken;
- (NSString)custodianSetupToken;
- (NSString)description;
- (NSString)ownerAppleID;
- (NSString)ownerCustodianAltDSID;
- (NSString)pushToken;
- (NSString)recordBuildVersion;
- (NSString)recoverySessionID;
- (NSString)recoveryStep;
- (NSString)transactionID;
- (NSUUID)_identifier;
- (NSUUID)custodianUUID;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)clientErrorCode;
- (int64_t)notificationAction;
- (void)_setHeartbeatToken:(id)a3;
- (void)_setIdentityToken:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAaData:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setBeneficiaryContacts:(id)a3;
- (void)setBeneficiaryUUIDs:(id)a3;
- (void)setCliMode:(BOOL)a3;
- (void)setClientErrorCode:(int64_t)a3;
- (void)setCustodianContacts:(id)a3;
- (void)setCustodianRecoveryToken:(id)a3;
- (void)setCustodianSetupToken:(id)a3;
- (void)setCustodianSyncAction:(BOOL)a3;
- (void)setCustodianUUID:(id)a3;
- (void)setCustodianUUIDs:(id)a3;
- (void)setEncryptedPRKC:(id)a3;
- (void)setIdmsData:(id)a3;
- (void)setLastDataSyncTimestamp:(id)a3;
- (void)setNotificationAction:(int64_t)a3;
- (void)setOwnerAppleID:(id)a3;
- (void)setOwnerCustodianAltDSID:(id)a3;
- (void)setOwnerDevice:(BOOL)a3;
- (void)setPushToken:(id)a3;
- (void)setRecordBuildVersion:(id)a3;
- (void)setRecoverySessionID:(id)a3;
- (void)setRecoveryStep:(id)a3;
- (void)setTransactionID:(id)a3;
- (void)setWrappingKeyRKC:(id)a3;
- (void)set_cliMode:(BOOL)a3;
@end

@implementation AKCustodianContext

- (AKCustodianContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AKCustodianContext *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_custodianUUID"];
    custodianUUID = v5->_custodianUUID;
    v5->_custodianUUID = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_altDSID"];
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_wrappingKeyRKC"];
    wrappingKeyRKC = v5->_wrappingKeyRKC;
    v5->_wrappingKeyRKC = (NSData *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_recordBuildVersion"];
    recordBuildVersion = v5->_recordBuildVersion;
    v5->_recordBuildVersion = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_ownerAppleID"];
    ownerAppleID = v5->_ownerAppleID;
    v5->_ownerAppleID = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_ownerCustodianAltDSID"];
    ownerCustodianAltDSID = v5->_ownerCustodianAltDSID;
    v5->_ownerCustodianAltDSID = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_custodianSetupToken"];
    custodianSetupToken = v5->_custodianSetupToken;
    v5->_custodianSetupToken = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_pushToken"];
    pushToken = v5->_pushToken;
    v5->_pushToken = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_recoverySessionID"];
    recoverySessionID = v5->_recoverySessionID;
    v5->_recoverySessionID = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_custodianRecoveryToken"];
    custodianRecoveryToken = v5->_custodianRecoveryToken;
    v5->_custodianRecoveryToken = (NSString *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_aaData"];
    aaData = v5->_aaData;
    v5->_aaData = (NSData *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_idmsData"];
    idmsData = v5->_idmsData;
    v5->_idmsData = (NSData *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_encryptedPRKC"];
    encryptedPRKC = v5->_encryptedPRKC;
    v5->_encryptedPRKC = (NSData *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_recoveryStep"];
    recoveryStep = v5->_recoveryStep;
    v5->_recoveryStep = (NSString *)v32;

    v5->_ownerDevice = [v4 decodeBoolForKey:@"_ownerDevice"];
    v5->_clientErrorCode = [v4 decodeIntegerForKey:@"_errorCode"];
    v5->_cliMode = [v4 decodeBoolForKey:@"_cliMode"];
    v5->__cliMode = [v4 decodeBoolForKey:@"__cliMode"];
    v5->_notificationAction = [v4 decodeIntegerForKey:@"_notificationAction"];
    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_transactionID"];
    transactionID = v5->_transactionID;
    v5->_transactionID = (NSString *)v34;

    v36 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v37 = objc_opt_class();
    v38 = objc_msgSend(v36, "setWithObjects:", v37, objc_opt_class(), 0);
    uint64_t v39 = [v4 decodeObjectOfClasses:v38 forKey:@"_custodianUUIDs"];
    custodianUUIDs = v5->_custodianUUIDs;
    v5->_custodianUUIDs = (NSArray *)v39;

    uint64_t v41 = [v4 decodeObjectOfClasses:v38 forKey:@"_beneficiaryUUIDs"];
    beneficiaryUUIDs = v5->_beneficiaryUUIDs;
    v5->_beneficiaryUUIDs = (NSArray *)v41;

    uint64_t v43 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_lastDataSyncTimestamp"];
    lastDataSyncTimestamp = v5->_lastDataSyncTimestamp;
    v5->_lastDataSyncTimestamp = (NSDate *)v43;

    v45 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v46 = objc_opt_class();
    v47 = objc_msgSend(v45, "setWithObjects:", v46, objc_opt_class(), 0);
    uint64_t v48 = [v4 decodeObjectOfClasses:v47 forKey:@"_custodianContacts"];
    custodianContacts = v5->_custodianContacts;
    v5->_custodianContacts = (NSArray *)v48;

    uint64_t v50 = [v4 decodeObjectOfClasses:v47 forKey:@"_beneficiaryContacts"];
    beneficiaryContacts = v5->_beneficiaryContacts;
    v5->_beneficiaryContacts = (NSArray *)v50;

    v5->_custodianSyncAction = [v4 decodeBoolForKey:@"_isCustodianSyncAction"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  custodianUUID = self->_custodianUUID;
  id v5 = a3;
  [v5 encodeObject:custodianUUID forKey:@"_custodianUUID"];
  [v5 encodeObject:self->_altDSID forKey:@"_altDSID"];
  [v5 encodeObject:self->_wrappingKeyRKC forKey:@"_wrappingKeyRKC"];
  [v5 encodeObject:self->_recordBuildVersion forKey:@"_recordBuildVersion"];
  [v5 encodeObject:self->_ownerAppleID forKey:@"_ownerAppleID"];
  [v5 encodeObject:self->_ownerCustodianAltDSID forKey:@"_ownerCustodianAltDSID"];
  [v5 encodeObject:self->_custodianSetupToken forKey:@"_custodianSetupToken"];
  [v5 encodeObject:self->_pushToken forKey:@"_pushToken"];
  [v5 encodeObject:self->_recoverySessionID forKey:@"_recoverySessionID"];
  [v5 encodeObject:self->_custodianRecoveryToken forKey:@"_custodianRecoveryToken"];
  [v5 encodeObject:self->_aaData forKey:@"_aaData"];
  [v5 encodeObject:self->_idmsData forKey:@"_idmsData"];
  [v5 encodeObject:self->_encryptedPRKC forKey:@"_encryptedPRKC"];
  [v5 encodeObject:self->_recoveryStep forKey:@"_recoveryStep"];
  [v5 encodeBool:self->_ownerDevice forKey:@"_ownerDevice"];
  [v5 encodeInteger:self->_clientErrorCode forKey:@"_errorCode"];
  [v5 encodeBool:self->_cliMode forKey:@"_cliMode"];
  [v5 encodeBool:self->__cliMode forKey:@"__cliMode"];
  [v5 encodeInteger:self->_notificationAction forKey:@"_notificationAction"];
  [v5 encodeObject:self->_transactionID forKey:@"_transactionID"];
  [v5 encodeObject:self->_custodianUUIDs forKey:@"_custodianUUIDs"];
  [v5 encodeObject:self->_beneficiaryUUIDs forKey:@"_beneficiaryUUIDs"];
  [v5 encodeObject:self->_lastDataSyncTimestamp forKey:@"_lastDataSyncTimestamp"];
  [v5 encodeObject:self->_custodianContacts forKey:@"_custodianContacts"];
  [v5 encodeObject:self->_beneficiaryContacts forKey:@"_beneficiaryContacts"];
  [v5 encodeBool:self->_custodianSyncAction forKey:@"_isCustodianSyncAction"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSUUID *)self->_custodianUUID copy];
  uint64_t v6 = *(void **)(v4 + 64);
  *(void *)(v4 + 64) = v5;

  uint64_t v7 = [(NSString *)self->_altDSID copy];
  uint64_t v8 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v7;

  uint64_t v9 = [(NSData *)self->_wrappingKeyRKC copy];
  uint64_t v10 = *(void **)(v4 + 72);
  *(void *)(v4 + 72) = v9;

  uint64_t v11 = [(NSString *)self->_recordBuildVersion copy];
  uint64_t v12 = *(void **)(v4 + 80);
  *(void *)(v4 + 80) = v11;

  uint64_t v13 = [(NSString *)self->_ownerAppleID copy];
  uint64_t v14 = *(void **)(v4 + 48);
  *(void *)(v4 + 48) = v13;

  uint64_t v15 = [(NSString *)self->_ownerCustodianAltDSID copy];
  uint64_t v16 = *(void **)(v4 + 56);
  *(void *)(v4 + 56) = v15;

  uint64_t v17 = [(NSString *)self->_custodianSetupToken copy];
  uint64_t v18 = *(void **)(v4 + 88);
  *(void *)(v4 + 88) = v17;

  uint64_t v19 = [(NSString *)self->_pushToken copy];
  uint64_t v20 = *(void **)(v4 + 96);
  *(void *)(v4 + 96) = v19;

  uint64_t v21 = [(NSString *)self->_recoverySessionID copy];
  uint64_t v22 = *(void **)(v4 + 104);
  *(void *)(v4 + 104) = v21;

  uint64_t v23 = [(NSString *)self->_custodianRecoveryToken copy];
  uint64_t v24 = *(void **)(v4 + 112);
  *(void *)(v4 + 112) = v23;

  uint64_t v25 = [(NSData *)self->_aaData copy];
  uint64_t v26 = *(void **)(v4 + 120);
  *(void *)(v4 + 120) = v25;

  uint64_t v27 = [(NSData *)self->_idmsData copy];
  uint64_t v28 = *(void **)(v4 + 128);
  *(void *)(v4 + 128) = v27;

  uint64_t v29 = [(NSData *)self->_encryptedPRKC copy];
  uint64_t v30 = *(void **)(v4 + 136);
  *(void *)(v4 + 136) = v29;

  uint64_t v31 = [(NSString *)self->_recoveryStep copy];
  uint64_t v32 = *(void **)(v4 + 144);
  *(void *)(v4 + 144) = v31;

  *(unsigned char *)(v4 + 10) = self->_ownerDevice;
  *(void *)(v4 + 152) = self->_clientErrorCode;
  *(unsigned char *)(v4 + 9) = self->_cliMode;
  *(unsigned char *)(v4 + 8) = self->__cliMode;
  *(void *)(v4 + 160) = self->_notificationAction;
  uint64_t v33 = [(NSString *)self->_transactionID copy];
  uint64_t v34 = *(void **)(v4 + 168);
  *(void *)(v4 + 168) = v33;

  uint64_t v35 = [(NSArray *)self->_custodianUUIDs copy];
  v36 = *(void **)(v4 + 176);
  *(void *)(v4 + 176) = v35;

  uint64_t v37 = [(NSArray *)self->_beneficiaryUUIDs copy];
  v38 = *(void **)(v4 + 184);
  *(void *)(v4 + 184) = v37;

  uint64_t v39 = [(NSDate *)self->_lastDataSyncTimestamp copy];
  v40 = *(void **)(v4 + 192);
  *(void *)(v4 + 192) = v39;

  uint64_t v41 = [(NSArray *)self->_custodianContacts copy];
  v42 = *(void **)(v4 + 200);
  *(void *)(v4 + 200) = v41;

  uint64_t v43 = [(NSArray *)self->_beneficiaryContacts copy];
  v44 = *(void **)(v4 + 208);
  *(void *)(v4 + 208) = v43;

  *(unsigned char *)(v4 + 11) = self->_custodianSyncAction;
  return (id)v4;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@: %p> with \nCustodianUUID: %@ \naltDSID: %@ \nOwnerAppleID: %@ \nownerCustodianAltDSID: %@ \nwrappingKeyRKC: %@ \npushToken: %@ \nsessionID: %@ \ncustodianRecoveryToken: %@ \nrecoveryStep: %@ \ncliMode: %i \n custodianContacts: %@ \n beneficiaryContacts: %@ \n isCustodianSyncAction: %d \nrecordBuildVersion: %@", objc_opt_class(), self, self->_custodianUUID, self->_altDSID, self->_ownerAppleID, self->_ownerCustodianAltDSID, self->_wrappingKeyRKC, self->_pushToken, self->_recoverySessionID, self->_custodianRecoveryToken, self->_recoveryStep, self->_cliMode, self->_custodianContacts, self->_beneficiaryContacts, self->_custodianSyncAction, self->_recordBuildVersion];
}

- (NSUUID)_identifier
{
  return self->_identifier;
}

- (BOOL)cliMode
{
  return self->__cliMode;
}

- (void)setCliMode:(BOOL)a3
{
  self->__cliMode = a3;
}

- (BOOL)_cliMode
{
  return self->_cliMode;
}

- (void)set_cliMode:(BOOL)a3
{
  self->_cliMode = a3;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (NSString)_identityToken
{
  return self->_identityToken;
}

- (void)_setIdentityToken:(id)a3
{
}

- (NSString)_heartbeatToken
{
  return self->_heartbeatToken;
}

- (void)_setHeartbeatToken:(id)a3
{
}

- (NSString)ownerAppleID
{
  return self->_ownerAppleID;
}

- (void)setOwnerAppleID:(id)a3
{
}

- (NSString)ownerCustodianAltDSID
{
  return self->_ownerCustodianAltDSID;
}

- (void)setOwnerCustodianAltDSID:(id)a3
{
}

- (NSUUID)custodianUUID
{
  return self->_custodianUUID;
}

- (void)setCustodianUUID:(id)a3
{
}

- (NSData)wrappingKeyRKC
{
  return self->_wrappingKeyRKC;
}

- (void)setWrappingKeyRKC:(id)a3
{
}

- (NSString)recordBuildVersion
{
  return self->_recordBuildVersion;
}

- (void)setRecordBuildVersion:(id)a3
{
}

- (NSString)custodianSetupToken
{
  return self->_custodianSetupToken;
}

- (void)setCustodianSetupToken:(id)a3
{
}

- (NSString)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
}

- (NSString)recoverySessionID
{
  return self->_recoverySessionID;
}

- (void)setRecoverySessionID:(id)a3
{
}

- (NSString)custodianRecoveryToken
{
  return self->_custodianRecoveryToken;
}

- (void)setCustodianRecoveryToken:(id)a3
{
}

- (NSData)aaData
{
  return self->_aaData;
}

- (void)setAaData:(id)a3
{
}

- (NSData)idmsData
{
  return self->_idmsData;
}

- (void)setIdmsData:(id)a3
{
}

- (NSData)encryptedPRKC
{
  return self->_encryptedPRKC;
}

- (void)setEncryptedPRKC:(id)a3
{
}

- (NSString)recoveryStep
{
  return self->_recoveryStep;
}

- (void)setRecoveryStep:(id)a3
{
}

- (BOOL)ownerDevice
{
  return self->_ownerDevice;
}

- (void)setOwnerDevice:(BOOL)a3
{
  self->_ownerDevice = a3;
}

- (int64_t)clientErrorCode
{
  return self->_clientErrorCode;
}

- (void)setClientErrorCode:(int64_t)a3
{
  self->_clientErrorCode = a3;
}

- (int64_t)notificationAction
{
  return self->_notificationAction;
}

- (void)setNotificationAction:(int64_t)a3
{
  self->_notificationAction = a3;
}

- (NSString)transactionID
{
  return self->_transactionID;
}

- (void)setTransactionID:(id)a3
{
}

- (NSArray)custodianUUIDs
{
  return self->_custodianUUIDs;
}

- (void)setCustodianUUIDs:(id)a3
{
}

- (NSArray)beneficiaryUUIDs
{
  return self->_beneficiaryUUIDs;
}

- (void)setBeneficiaryUUIDs:(id)a3
{
}

- (NSDate)lastDataSyncTimestamp
{
  return self->_lastDataSyncTimestamp;
}

- (void)setLastDataSyncTimestamp:(id)a3
{
}

- (NSArray)custodianContacts
{
  return self->_custodianContacts;
}

- (void)setCustodianContacts:(id)a3
{
}

- (NSArray)beneficiaryContacts
{
  return self->_beneficiaryContacts;
}

- (void)setBeneficiaryContacts:(id)a3
{
}

- (BOOL)isCustodianSyncAction
{
  return self->_custodianSyncAction;
}

- (void)setCustodianSyncAction:(BOOL)a3
{
  self->_custodianSyncAction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_beneficiaryContacts, 0);
  objc_storeStrong((id *)&self->_custodianContacts, 0);
  objc_storeStrong((id *)&self->_lastDataSyncTimestamp, 0);
  objc_storeStrong((id *)&self->_beneficiaryUUIDs, 0);
  objc_storeStrong((id *)&self->_custodianUUIDs, 0);
  objc_storeStrong((id *)&self->_transactionID, 0);
  objc_storeStrong((id *)&self->_recoveryStep, 0);
  objc_storeStrong((id *)&self->_encryptedPRKC, 0);
  objc_storeStrong((id *)&self->_idmsData, 0);
  objc_storeStrong((id *)&self->_aaData, 0);
  objc_storeStrong((id *)&self->_custodianRecoveryToken, 0);
  objc_storeStrong((id *)&self->_recoverySessionID, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_custodianSetupToken, 0);
  objc_storeStrong((id *)&self->_recordBuildVersion, 0);
  objc_storeStrong((id *)&self->_wrappingKeyRKC, 0);
  objc_storeStrong((id *)&self->_custodianUUID, 0);
  objc_storeStrong((id *)&self->_ownerCustodianAltDSID, 0);
  objc_storeStrong((id *)&self->_ownerAppleID, 0);
  objc_storeStrong((id *)&self->_heartbeatToken, 0);
  objc_storeStrong((id *)&self->_identityToken, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
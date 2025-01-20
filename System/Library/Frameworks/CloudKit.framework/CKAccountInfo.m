@interface CKAccountInfo
+ (BOOL)supportsSecureCoding;
+ (id)new;
+ (int64_t)invalidateCachedAccountInfo;
+ (int64_t)validAccountInfoValidationCounterValue;
+ (void)initialize;
+ (void)setValidAccountInfoValidationCounterValue:(int64_t)a3;
- (BOOL)bypassPCSEncryption;
- (BOOL)hasEncryptionIdentity;
- (BOOL)hasValidCredentials;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFromCache;
- (BOOL)needsToVerifyTerms;
- (BOOL)supportsDeviceToDeviceEncryption;
- (CKAccountInfo)init;
- (CKAccountInfo)initWithCoder:(id)a3;
- (CKAccountInfo)initWithValidationCounter:(unint64_t)a3 accountStatus:(int64_t)a4 accountPartition:(int64_t)a5 hasValidCredentials:(BOOL)a6 bypassPCSEncryption:(BOOL)a7 deviceToDeviceEncryptionAvailability:(int64_t)a8 walrusStatus:(int64_t)a9 needsToVerifyTerms:(BOOL)a10 accountAccessAuthorization:(int64_t)a11;
- (id)CKPropertiesDescription;
- (id)copyWithFakeDeviceToDeviceEncryptionAvailability:(int64_t)a3;
- (id)description;
- (int64_t)accountPartition;
- (int64_t)accountStatus;
- (int64_t)deviceToDeviceEncryptionAvailability;
- (int64_t)walrusStatus;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountPartition:(int64_t)a3;
- (void)setAccountStatus:(int64_t)a3;
- (void)setAsCachedAccountInfoForSetupInfoHash:(id)a3;
- (void)setBypassPCSEncryption:(BOOL)a3;
- (void)setDeviceToDeviceEncryptionAvailability:(int64_t)a3;
- (void)setHasEncryptionIdentity:(BOOL)a3;
- (void)setHasValidCredentials:(BOOL)a3;
- (void)setIsFromCache:(BOOL)a3;
- (void)setSupportsDeviceToDeviceEncryption:(BOOL)a3;
@end

@implementation CKAccountInfo

- (CKAccountInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CKAccountInfo;
  v7 = [(CKAccountInfo *)&v25 init];
  if (v7)
  {
    v7->_accountStatus = objc_msgSend_decodeIntegerForKey_(v4, v5, @"AccountStatus", v6);
    v7->_accountPartition = objc_msgSend_decodeIntegerForKey_(v4, v8, @"AccountPartition", v9);
    v7->_bypassPCSEncryption = objc_msgSend_decodeBoolForKey_(v4, v10, @"BypassPCSEncryption", v11);
    v7->_deviceToDeviceEncryptionAvailability = objc_msgSend_decodeIntegerForKey_(v4, v12, @"DeviceToDeviceEncryptionAvailability", v13);
    v7->_hasValidCredentials = objc_msgSend_decodeBoolForKey_(v4, v14, @"HasValidCredentials", v15);
    v7->_validationCounter = objc_msgSend_decodeIntegerForKey_(v4, v16, @"AccountInfoValidationCounter", v17);
    v7->_walrusStatus = objc_msgSend_decodeIntegerForKey_(v4, v18, @"WalrusStatus", v19);
    v7->_accountAccessAuthorization = objc_msgSend_decodeIntegerForKey_(v4, v20, @"AccountAccessAuthorization", v21);
    if (!v7->_accountPartition) {
      v7->_accountPartition = 1;
    }
    v7->_needsToVerifyTerms = objc_msgSend_decodeBoolForKey_(v4, v22, @"NeedsToVerifyTerms", v23);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)((uint64_t (*)(CKAccountInfo *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (BOOL)supportsDeviceToDeviceEncryption
{
  return ((unint64_t)objc_msgSend_deviceToDeviceEncryptionAvailability(self, a2, v2, v3) >> 1) & 1;
}

- (CKAccountInfo)initWithValidationCounter:(unint64_t)a3 accountStatus:(int64_t)a4 accountPartition:(int64_t)a5 hasValidCredentials:(BOOL)a6 bypassPCSEncryption:(BOOL)a7 deviceToDeviceEncryptionAvailability:(int64_t)a8 walrusStatus:(int64_t)a9 needsToVerifyTerms:(BOOL)a10 accountAccessAuthorization:(int64_t)a11
{
  v18.receiver = self;
  v18.super_class = (Class)CKAccountInfo;
  result = [(CKAccountInfo *)&v18 init];
  if (result)
  {
    result->_hasValidCredentials = a6;
    result->_accountPartition = a5;
    result->_deviceToDeviceEncryptionAvailability = a8;
    result->_bypassPCSEncryption = a7;
    result->_needsToVerifyTerms = a10;
    result->_walrusStatus = a9;
    result->_accountAccessAuthorization = a11;
    result->_validationCounter = a3;
    result->_accountStatus = a4;
  }
  return result;
}

- (void)setAsCachedAccountInfoForSetupInfoHash:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (byte_1E9124EF0)
  {
    v5 = objc_opt_class();
    objc_sync_enter(v5);
    id v36 = 0;
    v7 = objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E4F28DB0], v6, (uint64_t)self, 1, &v36);
    uint64_t v11 = (CKAccountInfo *)v36;
    if (v11)
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      v12 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v38 = v11;
        _os_log_error_impl(&dword_18AF10000, v12, OS_LOG_TYPE_ERROR, "Failed to archive account info cache: %@", buf, 0xCu);
      }
    }
    else
    {
      v35 = objc_msgSend_standardUserDefaults(MEMORY[0x1E4F1CB18], v8, v9, v10);
      uint64_t v15 = objc_msgSend_objectForKey_(v35, v13, @"CloudKitAccountInfoCache", v14);
      v20 = objc_msgSend_mutableCopy(v15, v16, v17, v18);
      if (!v20) {
        v20 = objc_opt_new();
      }
      objc_msgSend_setObject_forKey_(v20, v19, (uint64_t)v7, (uint64_t)v4);
      id v21 = v20;
      self;
      v22 = objc_opt_class();
      objc_sync_enter(v22);
      uint64_t v26 = objc_msgSend_copy(v21, v23, v24, v25);
      v27 = (void *)qword_1EB279A78;
      qword_1EB279A78 = v26;

      uid_t v28 = geteuid();
      if (v28 == 501 || !v28)
      {
        v32 = objc_msgSend_standardUserDefaults(MEMORY[0x1E4F1CB18], v29, v30, v31);
        objc_msgSend_setObject_forKey_(v32, v33, qword_1EB279A78, @"CloudKitAccountInfoCache");
      }
      objc_sync_exit(v22);

      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      v34 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v38 = self;
        _os_log_impl(&dword_18AF10000, v34, OS_LOG_TYPE_INFO, "Set cached account info: %@", buf, 0xCu);
      }
    }
    objc_sync_exit(v5);
  }
}

+ (int64_t)validAccountInfoValidationCounterValue
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_18AF25A18;
  v5[3] = &unk_1E545FF18;
  v5[4] = &v6;
  objc_msgSend_performAtomicDefaultsOperation_(CKUserDefaults, a2, (uint64_t)v5, v2);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setIsFromCache:(BOOL)a3
{
  self->_isFromCache = a3;
}

- (id)CKPropertiesDescription
{
  id v4 = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], a2, 8, v2);
  v5 = NSString;
  unint64_t v9 = objc_msgSend_accountStatus(self, v6, v7, v8);
  uint64_t v10 = CKStringFromAccountStatus(v9);
  uint64_t v13 = objc_msgSend_stringWithFormat_(v5, v11, @"accountStatus=%@", v12, v10);
  objc_msgSend_addObject_(v4, v14, (uint64_t)v13, v15);

  v16 = NSString;
  uint64_t v20 = objc_msgSend_accountPartition(self, v17, v18, v19);
  uint64_t v23 = @"Unknown Partition Type";
  if (v20 == 1) {
    uint64_t v23 = @"Prod";
  }
  if (v20 == 2) {
    uint64_t v23 = @"Carry";
  }
  uint64_t v24 = objc_msgSend_stringWithFormat_(v16, v21, @"accountPartition=%@", v22, v23);
  objc_msgSend_addObject_(v4, v25, (uint64_t)v24, v26);

  if (objc_msgSend_bypassPCSEncryption(self, v27, v28, v29))
  {
    objc_msgSend_addObject_(v4, v30, @"deviceToDeviceEncryptionAvailability=(bypassPCSEncryption)", v32);
  }
  else
  {
    id v36 = NSString;
    uint64_t v37 = objc_msgSend_deviceToDeviceEncryptionAvailability(self, v30, v31, v32);
    v38 = CKStringFromDeviceToDeviceEncryptionStatus(v37);
    v41 = objc_msgSend_stringWithFormat_(v36, v39, @"deviceToDeviceEncryptionAvailability=%@", v40, v38);
    objc_msgSend_addObject_(v4, v42, (uint64_t)v41, v43);
  }
  v44 = NSString;
  if (objc_msgSend_hasValidCredentials(self, v33, v34, v35)) {
    objc_msgSend_stringWithFormat_(v44, v45, @"hasValidCredentials=%@", v46, @"true");
  }
  else {
  v47 = objc_msgSend_stringWithFormat_(v44, v45, @"hasValidCredentials=%@", v46, @"false");
  }
  objc_msgSend_addObject_(v4, v48, (uint64_t)v47, v49);

  if (objc_msgSend_bypassPCSEncryption(self, v50, v51, v52))
  {
    objc_msgSend_addObject_(v4, v53, @"walrus=bypassPCSEncryption", v55);
  }
  else
  {
    v59 = NSString;
    unint64_t v60 = objc_msgSend_walrusStatus(self, v53, v54, v55);
    if (v60 > 2) {
      objc_msgSend_stringWithFormat_(v59, v61, @"walrus=%@", v62, @"Unknown");
    }
    else {
    v63 = objc_msgSend_stringWithFormat_(v59, v61, @"walrus=%@", v62, off_1E545FFC8[v60]);
    }
    objc_msgSend_addObject_(v4, v64, (uint64_t)v63, v65);
  }
  v66 = NSString;
  if (objc_msgSend_needsToVerifyTerms(self, v56, v57, v58)) {
    objc_msgSend_stringWithFormat_(v66, v67, @"needsToVerifyTerms=%@", v68, @"true");
  }
  else {
  v69 = objc_msgSend_stringWithFormat_(v66, v67, @"needsToVerifyTerms=%@", v68, @"false");
  }
  objc_msgSend_addObject_(v4, v70, (uint64_t)v69, v71);

  v72 = NSString;
  if (self) {
    int64_t accountAccessAuthorization = self->_accountAccessAuthorization;
  }
  else {
    int64_t accountAccessAuthorization = 0;
  }
  v74 = CKTernaryDescription(accountAccessAuthorization);
  v77 = objc_msgSend_stringWithFormat_(v72, v75, @"accountAccessAuthorization=%@", v76, v74);
  objc_msgSend_addObject_(v4, v78, (uint64_t)v77, v79);

  if (self) {
    objc_msgSend_stringWithFormat_(NSString, v80, @"validationCounter=%zu", v81, self->_validationCounter);
  }
  else {
  v82 = objc_msgSend_stringWithFormat_(NSString, v80, @"validationCounter=%zu", v81, 0);
  }
  objc_msgSend_addObject_(v4, v83, (uint64_t)v82, v84);

  v87 = objc_msgSend_componentsJoinedByString_(v4, v85, @", ", v86);

  return v87;
}

- (BOOL)bypassPCSEncryption
{
  return self->_bypassPCSEncryption;
}

- (void)encodeWithCoder:(id)a3
{
  id v52 = a3;
  uint64_t v7 = objc_msgSend_accountStatus(self, v4, v5, v6);
  objc_msgSend_encodeInteger_forKey_(v52, v8, v7, @"AccountStatus");
  uint64_t v12 = objc_msgSend_accountPartition(self, v9, v10, v11);
  objc_msgSend_encodeInteger_forKey_(v52, v13, v12, @"AccountPartition");
  uint64_t v17 = objc_msgSend_bypassPCSEncryption(self, v14, v15, v16);
  objc_msgSend_encodeBool_forKey_(v52, v18, v17, @"BypassPCSEncryption");
  uint64_t v22 = objc_msgSend_deviceToDeviceEncryptionAvailability(self, v19, v20, v21);
  objc_msgSend_encodeInteger_forKey_(v52, v23, v22, @"DeviceToDeviceEncryptionAvailability");
  uint64_t hasValidCredentials = objc_msgSend_hasValidCredentials(self, v24, v25, v26);
  objc_msgSend_encodeBool_forKey_(v52, v28, hasValidCredentials, @"HasValidCredentials");
  if (self)
  {
    objc_msgSend_encodeInteger_forKey_(v52, v29, self->_validationCounter, @"AccountInfoValidationCounter");
    uint64_t v33 = objc_msgSend_walrusStatus(self, v30, v31, v32);
    objc_msgSend_encodeInteger_forKey_(v52, v34, v33, @"WalrusStatus");
    uint64_t v38 = objc_msgSend_needsToVerifyTerms(self, v35, v36, v37);
    objc_msgSend_encodeBool_forKey_(v52, v39, v38, @"NeedsToVerifyTerms");
    objc_msgSend_encodeInteger_forKey_(v52, v40, self->_accountAccessAuthorization, @"AccountAccessAuthorization");
  }
  else
  {
    objc_msgSend_encodeInteger_forKey_(v52, v29, 0, @"AccountInfoValidationCounter");
    uint64_t v44 = objc_msgSend_walrusStatus(0, v41, v42, v43);
    objc_msgSend_encodeInteger_forKey_(v52, v45, v44, @"WalrusStatus");
    uint64_t v49 = objc_msgSend_needsToVerifyTerms(0, v46, v47, v48);
    objc_msgSend_encodeBool_forKey_(v52, v50, v49, @"NeedsToVerifyTerms");
    objc_msgSend_encodeInteger_forKey_(v52, v51, 0, @"AccountAccessAuthorization");
  }
}

- (int64_t)deviceToDeviceEncryptionAvailability
{
  return self->_deviceToDeviceEncryptionAvailability;
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

- (int64_t)accountPartition
{
  return self->_accountPartition;
}

- (int64_t)accountStatus
{
  return self->_accountStatus;
}

+ (void)initialize
{
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = self;

  sub_18AF14F44(v3, v2, 0, 0, 0);
}

+ (void)setValidAccountInfoValidationCounterValue:(int64_t)a3
{
  uid_t v4 = geteuid();
  if (v4)
  {
    if (v4 != 501)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = sub_18B002CB8;
      v7[3] = &unk_1E545FEF0;
      v7[4] = a3;
      objc_msgSend_performAtomicDefaultsOperation_(CKUserDefaults, v5, (uint64_t)v7, v6);
    }
  }
}

+ (int64_t)invalidateCachedAccountInfo
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  if (byte_1E9124EF0)
  {
    uint64_t v3 = objc_opt_class();
    objc_sync_enter(v3);
    uid_t v4 = geteuid();
    if (v4 == 501 || !v4)
    {
      uint64_t v8 = objc_msgSend_standardUserDefaults(MEMORY[0x1E4F1CB18], v5, v6, v7);
      uint64_t v11 = objc_msgSend_objectForKey_(v8, v9, @"CloudKitAccountInfoCache", v10);

      if (v11)
      {
        objc_msgSend_setObject_forKey_(v8, v12, 0, @"CloudKitAccountInfoCache");
        if (ck_log_initialization_predicate != -1) {
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        }
        uint64_t v13 = ck_log_facility_ck;
        if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint64_t v17 = 0;
          _os_log_impl(&dword_18AF10000, v13, OS_LOG_TYPE_INFO, "Cleared account info cache.", v17, 2u);
        }
      }
    }
    uint64_t v14 = (void *)qword_1EB279A78;
    qword_1EB279A78 = 0;

    objc_sync_exit(v3);
  }
  else
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_18B003060;
    v18[3] = &unk_1E545FF18;
    v18[4] = &v19;
    objc_msgSend_performAtomicDefaultsOperation_(CKUserDefaults, a2, (uint64_t)v18, v2);
  }
  int64_t v15 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v15;
}

- (id)copyWithFakeDeviceToDeviceEncryptionAvailability:(int64_t)a3
{
  id v8 = objc_alloc((Class)objc_opt_class());
  if (self) {
    int64_t validationCounter = self->_validationCounter;
  }
  else {
    int64_t validationCounter = 0;
  }
  uint64_t v10 = objc_msgSend_accountStatus(self, v5, v6, v7);
  uint64_t v14 = objc_msgSend_accountPartition(self, v11, v12, v13);
  uint64_t hasValidCredentials = objc_msgSend_hasValidCredentials(self, v15, v16, v17);
  uint64_t v22 = objc_msgSend_walrusStatus(self, v19, v20, v21);
  char v26 = objc_msgSend_needsToVerifyTerms(self, v23, v24, v25);
  if (self) {
    int64_t accountAccessAuthorization = self->_accountAccessAuthorization;
  }
  else {
    int64_t accountAccessAuthorization = 0;
  }
  return (id)objc_msgSend_initWithValidationCounter_accountStatus_accountPartition_hasValidCredentials_bypassPCSEncryption_deviceToDeviceEncryptionAvailability_walrusStatus_needsToVerifyTerms_accountAccessAuthorization_(v8, v27, validationCounter, v10, v14, hasValidCredentials, 0, a3, v22, v26, accountAccessAuthorization);
}

- (BOOL)isEqual:(id)a3
{
  uid_t v4 = (CKAccountInfo *)a3;
  if (self == v4)
  {
    BOOL v55 = 1;
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v55 = 0;
    goto LABEL_14;
  }
  uint64_t v5 = v4;
  uint64_t v9 = objc_msgSend_accountStatus(self, v6, v7, v8);
  if (v9 == objc_msgSend_accountStatus(v5, v10, v11, v12))
  {
    uint64_t v16 = objc_msgSend_accountPartition(self, v13, v14, v15);
    if (v16 == objc_msgSend_accountPartition(v5, v17, v18, v19))
    {
      int v23 = objc_msgSend_bypassPCSEncryption(self, v20, v21, v22);
      if (v23 == objc_msgSend_bypassPCSEncryption(v5, v24, v25, v26))
      {
        uint64_t v30 = objc_msgSend_deviceToDeviceEncryptionAvailability(self, v27, v28, v29);
        if (v30 == objc_msgSend_deviceToDeviceEncryptionAvailability(v5, v31, v32, v33))
        {
          int hasValidCredentials = objc_msgSend_hasValidCredentials(self, v34, v35, v36);
          if (hasValidCredentials == objc_msgSend_hasValidCredentials(v5, v38, v39, v40))
          {
            uint64_t v44 = objc_msgSend_walrusStatus(self, v41, v42, v43);
            if (v44 == objc_msgSend_walrusStatus(v5, v45, v46, v47))
            {
              int v51 = objc_msgSend_needsToVerifyTerms(self, v48, v49, v50);
              if (v51 == objc_msgSend_needsToVerifyTerms(v5, v52, v53, v54))
              {
                if (self)
                {
                  int64_t accountAccessAuthorization = self->_accountAccessAuthorization;
                  if (v5)
                  {
LABEL_17:
                    int64_t v58 = v5->_accountAccessAuthorization;
LABEL_18:
                    BOOL v55 = accountAccessAuthorization == v58;
                    goto LABEL_11;
                  }
                }
                else
                {
                  int64_t accountAccessAuthorization = 0;
                  if (v5) {
                    goto LABEL_17;
                  }
                }
                int64_t v58 = 0;
                goto LABEL_18;
              }
            }
          }
        }
      }
    }
  }
  BOOL v55 = 0;
LABEL_11:

LABEL_14:
  return v55;
}

- (unint64_t)hash
{
  uint64_t v5 = objc_msgSend_accountStatus(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_accountPartition(self, v6, v7, v8);
  int hasValidCredentials = objc_msgSend_hasValidCredentials(self, v10, v11, v12);
  uint64_t v17 = objc_msgSend_deviceToDeviceEncryptionAvailability(self, v14, v15, v16);
  uint64_t v21 = objc_msgSend_walrusStatus(self, v18, v19, v20);
  int v25 = objc_msgSend_needsToVerifyTerms(self, v22, v23, v24);
  if (self) {
    int64_t v29 = self->_accountAccessAuthorization << 8;
  }
  else {
    int64_t v29 = 0;
  }
  uint64_t v30 = 16;
  if (!hasValidCredentials) {
    uint64_t v30 = 0;
  }
  uint64_t v31 = v5 ^ (4 * v9) ^ v30 ^ (32 * v17) ^ (v21 << 6);
  uint64_t v32 = 128;
  if (!v25) {
    uint64_t v32 = 0;
  }
  uint64_t v33 = v32 ^ v29;
  int v34 = objc_msgSend_bypassPCSEncryption(self, v26, v27, v28);
  uint64_t v35 = 512;
  if (!v34) {
    uint64_t v35 = 0;
  }
  return v31 ^ v33 ^ v35;
}

- (CKAccountInfo)init
{
  uint64_t v3 = objc_opt_new();
  uint64_t v7 = v3;
  if (v3) {
    uint64_t v8 = v3[7];
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = objc_msgSend_accountStatus(v3, v4, v5, v6);
  uint64_t v13 = objc_msgSend_accountPartition(v7, v10, v11, v12);
  uint64_t hasValidCredentials = objc_msgSend_hasValidCredentials(v7, v14, v15, v16);
  uint64_t v21 = objc_msgSend_bypassPCSEncryption(v7, v18, v19, v20);
  uint64_t v25 = objc_msgSend_deviceToDeviceEncryptionAvailability(v7, v22, v23, v24);
  uint64_t v29 = objc_msgSend_walrusStatus(v7, v26, v27, v28);
  char v33 = objc_msgSend_needsToVerifyTerms(v7, v30, v31, v32);
  uint64_t v37 = objc_msgSend_accountAccessAuthorization(v7, v34, v35, v36);
  hasValidCredentials_bypassPCSEncryption_deviceToDeviceEncryptionAvailability_walrusStatus_needsToVerifyTerms_int64_t accountAccessAuthorization = (CKAccountInfo *)objc_msgSend_initWithValidationCounter_accountStatus_accountPartition_hasValidCredentials_bypassPCSEncryption_deviceToDeviceEncryptionAvailability_walrusStatus_needsToVerifyTerms_accountAccessAuthorization_(self, v38, v8, v9, v13, hasValidCredentials, v21, v25, v29, v33, v37);

  return hasValidCredentials_bypassPCSEncryption_deviceToDeviceEncryptionAvailability_walrusStatus_needsToVerifyTerms_accountAccessAuthorization;
}

+ (id)new
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___CKAccountInfo;
  return objc_msgSendSuper2(&v3, "new");
}

- (void)setSupportsDeviceToDeviceEncryption:(BOOL)a3
{
  if (a3) {
    objc_msgSend_setDeviceToDeviceEncryptionAvailability_(self, a2, 3, v3);
  }
  else {
    objc_msgSend_setDeviceToDeviceEncryptionAvailability_(self, a2, 0, v3);
  }

  objc_msgSend_setBypassPCSEncryption_(self, v5, 0, v6);
}

- (void)setAccountStatus:(int64_t)a3
{
  self->_accountStatus = a3;
}

- (void)setAccountPartition:(int64_t)a3
{
  self->_accountPartition = a3;
}

- (void)setDeviceToDeviceEncryptionAvailability:(int64_t)a3
{
  self->_deviceToDeviceEncryptionAvailability = a3;
}

- (void)setHasValidCredentials:(BOOL)a3
{
  self->_uint64_t hasValidCredentials = a3;
}

- (BOOL)isFromCache
{
  return self->_isFromCache;
}

- (void)setBypassPCSEncryption:(BOOL)a3
{
  self->_bypassPCSEncryption = a3;
}

- (BOOL)hasEncryptionIdentity
{
  return self->_hasEncryptionIdentity;
}

- (void)setHasEncryptionIdentity:(BOOL)a3
{
  self->_hasEncryptionIdentity = a3;
}

@end
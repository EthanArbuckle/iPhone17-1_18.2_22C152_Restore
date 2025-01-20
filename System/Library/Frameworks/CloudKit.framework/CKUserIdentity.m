@interface CKUserIdentity
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
- (BOOL)hasiCloudAccount;
- (BOOL)isCached;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEquivalentToUserIdentity:(id)a3;
- (BOOL)isEquivalentToUserIdentityOrPublicKey:(id)a3;
- (BOOL)isOutOfNetwork;
- (CKRecordID)userRecordID;
- (CKUserIdentity)initWithCoder:(id)a3;
- (CKUserIdentity)initWithUserRecordID:(id)a3;
- (CKUserIdentityLookupInfo)lookupInfo;
- (NSArray)contactIdentifiers;
- (NSData)encryptedPersonalInfo;
- (NSData)outOfNetworkPrivateKey;
- (NSData)publicSharingKey;
- (NSPersonNameComponents)nameComponents;
- (NSString)description;
- (NSString)firstName;
- (NSString)lastName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initInternal;
- (id)redactedDescription;
- (unint64_t)hash;
- (unint64_t)publicKeyVersion;
- (void)CKDescribePropertiesUsing:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setContactIdentifiers:(id)a3;
- (void)setEncryptedPersonalInfo:(id)a3;
- (void)setHasiCloudAccount:(BOOL)a3;
- (void)setIsCached:(BOOL)a3;
- (void)setLookupInfo:(id)a3;
- (void)setNameComponents:(id)a3;
- (void)setOutOfNetworkPrivateKey:(id)a3;
- (void)setPublicKeyVersion:(unint64_t)a3;
- (void)setPublicSharingKey:(id)a3;
- (void)setUserRecordID:(id)a3;
@end

@implementation CKUserIdentity

+ (void)initialize
{
  v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = self;

  sub_18AF14F44(v3, v2, 0, 0, 0);
}

- (id)initInternal
{
  v7.receiver = self;
  v7.super_class = (Class)CKUserIdentity;
  v2 = [(CKUserIdentity *)&v7 init];
  uint64_t v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_hasiCloudAccount = 1;
    v4 = (NSPersonNameComponents *)objc_alloc_init(MEMORY[0x1E4F28F30]);
    nameComponents = v3->_nameComponents;
    v3->_nameComponents = v4;

    v3->_publicKeyVersion = 2;
  }
  return v3;
}

- (CKUserIdentity)initWithUserRecordID:(id)a3
{
  id v4 = a3;
  inited = (CKUserIdentity *)objc_msgSend_initInternal(self, v5, v6, v7);
  if (inited)
  {
    uint64_t v12 = objc_msgSend_copy(v4, v8, v9, v10);
    userRecordID = inited->_userRecordID;
    inited->_userRecordID = (CKRecordID *)v12;

    inited->_publicKeyVersion = 2;
  }

  return inited;
}

- (CKUserIdentityLookupInfo)lookupInfo
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_lookupInfo;
  objc_sync_exit(v2);

  return v3;
}

- (void)setLookupInfo:(id)a3
{
  id v22 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  v11 = objc_msgSend_userRecordID(v22, v5, v6, v7);
  if (v11)
  {
    uint64_t v12 = objc_msgSend_userRecordID(v4, v8, v9, v10);

    if (!v12)
    {
      v13 = objc_msgSend_userRecordID(v22, v8, v9, v10);
      v17 = objc_msgSend_copy(v13, v14, v15, v16);
      objc_msgSend_setUserRecordID_(v4, v18, (uint64_t)v17, v19);
    }
  }
  uint64_t v20 = objc_msgSend_copy(v22, v8, v9, v10);
  lookupInfo = v4->_lookupInfo;
  v4->_lookupInfo = (CKUserIdentityLookupInfo *)v20;

  objc_sync_exit(v4);
}

- (BOOL)isOutOfNetwork
{
  if (!objc_msgSend_hasiCloudAccount(self, a2, v2, v3)) {
    return 1;
  }
  v8 = objc_msgSend_publicSharingKey(self, v5, v6, v7);
  BOOL v9 = v8 == 0;

  return v9;
}

- (NSArray)contactIdentifiers
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  contactIdentifiers = v2->_contactIdentifiers;
  if (!contactIdentifiers) {
    contactIdentifiers = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  id v4 = contactIdentifiers;
  objc_sync_exit(v2);

  return v4;
}

- (void)setContactIdentifiers:(id)a3
{
  id v10 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v8 = objc_msgSend_CKDeepCopy(v10, v5, v6, v7);
  contactIdentifiers = v4->_contactIdentifiers;
  v4->_contactIdentifiers = (NSArray *)v8;

  objc_sync_exit(v4);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    BOOL v9 = objc_msgSend_userRecordID(self, v6, v7, v8);
    v13 = objc_msgSend_userRecordID(v5, v10, v11, v12);
    if (CKObjectsAreBothNilOrEqual(v9, v13))
    {
      v17 = objc_msgSend_nameComponents(self, v14, v15, v16);
      v21 = objc_msgSend_nameComponents(v5, v18, v19, v20);
      if (CKObjectsAreBothNilOrEqual(v17, v21))
      {
        v25 = objc_msgSend_publicSharingKey(self, v22, v23, v24);
        v29 = objc_msgSend_publicSharingKey(v5, v26, v27, v28);
        if (CKObjectsAreBothNilOrEqual(v25, v29))
        {
          v33 = objc_msgSend_outOfNetworkPrivateKey(self, v30, v31, v32);
          v48 = objc_msgSend_outOfNetworkPrivateKey(v5, v34, v35, v36);
          if (CKObjectsAreBothNilOrEqual(v33, v48))
          {
            v46 = objc_msgSend_lookupInfo(self, v37, v38, v39);
            objc_msgSend_lookupInfo(v5, v40, v41, v42);
            v43 = v47 = v33;
            char v44 = CKObjectsAreBothNilOrEqual(v46, v43);

            v33 = v47;
          }
          else
          {
            char v44 = 0;
          }
        }
        else
        {
          char v44 = 0;
        }
      }
      else
      {
        char v44 = 0;
      }
    }
    else
    {
      char v44 = 0;
    }
  }
  else
  {
    char v44 = 0;
  }

  return v44;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  uint64_t v8 = objc_msgSend_userRecordID(self, v5, v6, v7);
  uint64_t v11 = objc_msgSend_initWithUserRecordID_(v4, v9, (uint64_t)v8, v10);

  uint64_t v15 = objc_msgSend_lookupInfo(self, v12, v13, v14);
  uint64_t v19 = objc_msgSend_copy(v15, v16, v17, v18);
  uint64_t v20 = *(void **)(v11 + 16);
  *(void *)(v11 + 16) = v19;

  uint64_t v24 = objc_msgSend_nameComponents(self, v21, v22, v23);
  uint64_t v28 = objc_msgSend_copy(v24, v25, v26, v27);
  v29 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v28;

  v33 = objc_msgSend_userRecordID(self, v30, v31, v32);
  uint64_t v37 = objc_msgSend_copy(v33, v34, v35, v36);
  uint64_t v38 = *(void **)(v11 + 32);
  *(void *)(v11 + 32) = v37;

  uint64_t v42 = objc_msgSend_contactIdentifiers(self, v39, v40, v41);
  uint64_t v46 = objc_msgSend_CKDeepCopy(v42, v43, v44, v45);
  v47 = *(void **)(v11 + 24);
  *(void *)(v11 + 24) = v46;

  *(unsigned char *)(v11 + 8) = objc_msgSend_hasiCloudAccount(self, v48, v49, v50);
  *(unsigned char *)(v11 + 9) = objc_msgSend_isCached(self, v51, v52, v53);
  v57 = objc_msgSend_publicSharingKey(self, v54, v55, v56);
  uint64_t v61 = objc_msgSend_copy(v57, v58, v59, v60);
  v62 = *(void **)(v11 + 48);
  *(void *)(v11 + 48) = v61;

  v66 = objc_msgSend_outOfNetworkPrivateKey(self, v63, v64, v65);
  uint64_t v70 = objc_msgSend_copy(v66, v67, v68, v69);
  v71 = *(void **)(v11 + 64);
  *(void *)(v11 + 64) = v70;

  v75 = objc_msgSend_encryptedPersonalInfo(self, v72, v73, v74);
  uint64_t v79 = objc_msgSend_copy(v75, v76, v77, v78);
  v80 = *(void **)(v11 + 72);
  *(void *)(v11 + 72) = v79;

  *(void *)(v11 + 56) = objc_msgSend_publicKeyVersion(self, v81, v82, v83);
  return (id)v11;
}

- (unint64_t)hash
{
  id v5 = objc_msgSend_nameComponents(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_hash(v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_userRecordID(self, v10, v11, v12);
  unint64_t v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;

  return v17;
}

- (BOOL)isEquivalentToUserIdentity:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_userRecordID(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_userRecordID(v4, v9, v10, v11);
  char isEqual = objc_msgSend_isEqual_(v8, v13, (uint64_t)v12, v14);

  if (isEqual)
  {
    char v19 = 1;
  }
  else
  {
    uint64_t v20 = objc_msgSend_lookupInfo(self, v16, v17, v18);
    uint64_t v24 = objc_msgSend_lookupInfo(v4, v21, v22, v23);
    char v19 = objc_msgSend_isEqual_(v20, v25, (uint64_t)v24, v26);
  }
  return v19;
}

- (BOOL)isEquivalentToUserIdentityOrPublicKey:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_publicSharingKey(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_publicSharingKey(v4, v9, v10, v11);
  char isEqual = objc_msgSend_isEqual_(v8, v13, (uint64_t)v12, v14);

  if (isEqual) {
    char isEquivalentToUserIdentity = 1;
  }
  else {
    char isEquivalentToUserIdentity = objc_msgSend_isEquivalentToUserIdentity_(self, v16, (uint64_t)v4, v17);
  }

  return isEquivalentToUserIdentity;
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v42 = a3;
  uint64_t v7 = objc_msgSend_userRecordID(self, v4, v5, v6);
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v42, v8, @"userID", (uint64_t)v7, 0);

  uint64_t v12 = objc_msgSend_nameComponents(self, v9, v10, v11);
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v42, v13, @"nameComponents", (uint64_t)v12, 1);

  uint64_t v17 = objc_msgSend_contactIdentifiers(self, v14, v15, v16);
  uint64_t v21 = objc_msgSend_count(v17, v18, v19, v20);

  if (v21)
  {
    v25 = objc_msgSend_contactIdentifiers(self, v22, v23, v24);
    objc_msgSend_addProperty_value_shouldRedact_(v42, v26, @"contactIdentifiers", (uint64_t)v25, 0);
  }
  uint64_t v27 = objc_msgSend_lookupInfo(self, v22, v23, v24);
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v42, v28, @"lookupInfo", (uint64_t)v27, 0);

  if (objc_msgSend_isCached(self, v29, v30, v31)) {
    objc_msgSend_addProperty_value_shouldRedact_(v42, v32, @"cached", @"true", 0);
  }
  else {
    objc_msgSend_addProperty_value_shouldRedact_(v42, v32, @"cached", @"false", 0);
  }
  uint64_t v36 = NSNumber;
  uint64_t v37 = objc_msgSend_publicKeyVersion(self, v33, v34, v35);
  uint64_t v40 = objc_msgSend_numberWithUnsignedInteger_(v36, v38, v37, v39);
  objc_msgSend_addProperty_value_shouldRedact_(v42, v41, @"publicKeyVersion", (uint64_t)v40, 0);
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKUserIdentity *, char *))MEMORY[0x1F4181798])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKUserIdentity *, char *))MEMORY[0x1F4181798])(self, sel_CKRedactedDescription);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v55 = a3;
  id v4 = (void *)MEMORY[0x18C12ADA0]();
  uint64_t v8 = objc_msgSend_userRecordID(self, v5, v6, v7);
  objc_msgSend_encodeObject_forKey_(v55, v9, (uint64_t)v8, @"UserRecordID");

  uint64_t v13 = objc_msgSend_nameComponents(self, v10, v11, v12);
  objc_msgSend_encodeObject_forKey_(v55, v14, (uint64_t)v13, @"NameComponents");

  uint64_t v18 = objc_msgSend_lookupInfo(self, v15, v16, v17);
  objc_msgSend_encodeObject_forKey_(v55, v19, (uint64_t)v18, @"LookupInfo");

  uint64_t v23 = objc_msgSend_contactIdentifiers(self, v20, v21, v22);
  objc_msgSend_encodeObject_forKey_(v55, v24, (uint64_t)v23, @"ContactIdentifiers");

  uint64_t v28 = objc_msgSend_publicSharingKey(self, v25, v26, v27);
  objc_msgSend_encodeObject_forKey_(v55, v29, (uint64_t)v28, @"ProtectionData");

  v33 = objc_msgSend_outOfNetworkPrivateKey(self, v30, v31, v32);
  objc_msgSend_encodeObject_forKey_(v55, v34, (uint64_t)v33, @"OONProtectionData");

  uint64_t isCached = objc_msgSend_isCached(self, v35, v36, v37);
  objc_msgSend_encodeBool_forKey_(v55, v39, isCached, @"IsCached");
  uint64_t v43 = objc_msgSend_hasiCloudAccount(self, v40, v41, v42);
  objc_msgSend_encodeBool_forKey_(v55, v44, v43, @"HasICloudAccount");
  v48 = objc_msgSend_encryptedPersonalInfo(self, v45, v46, v47);
  objc_msgSend_encodeObject_forKey_(v55, v49, (uint64_t)v48, @"EncryptedPersonalInfo");

  uint64_t v53 = objc_msgSend_publicKeyVersion(self, v50, v51, v52);
  objc_msgSend_encodeInt64_forKey_(v55, v54, v53, @"PublicKeyVersion");
}

- (CKUserIdentity)initWithCoder:(id)a3
{
  v50[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  inited = (CKUserIdentity *)objc_msgSend_initInternal(self, v5, v6, v7);
  if (inited)
  {
    uint64_t v9 = (void *)MEMORY[0x18C12ADA0]();
    uint64_t v10 = objc_opt_class();
    uint64_t v12 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, @"UserRecordID");
    userRecordID = inited->_userRecordID;
    inited->_userRecordID = (CKRecordID *)v12;

    uint64_t v14 = objc_opt_class();
    uint64_t v16 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, @"NameComponents");
    nameComponents = inited->_nameComponents;
    inited->_nameComponents = (NSPersonNameComponents *)v16;

    uint64_t v18 = objc_opt_class();
    uint64_t v20 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v19, v18, @"LookupInfo");
    lookupInfo = inited->_lookupInfo;
    inited->_lookupInfo = (CKUserIdentityLookupInfo *)v20;

    uint64_t v22 = (void *)MEMORY[0x1E4F1CAD0];
    v50[0] = objc_opt_class();
    v50[1] = objc_opt_class();
    uint64_t v24 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v23, (uint64_t)v50, 2);
    uint64_t v27 = objc_msgSend_setWithArray_(v22, v25, (uint64_t)v24, v26);
    uint64_t v29 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v28, (uint64_t)v27, @"ContactIdentifiers");
    contactIdentifiers = inited->_contactIdentifiers;
    inited->_contactIdentifiers = (NSArray *)v29;

    uint64_t v31 = objc_opt_class();
    uint64_t v33 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v32, v31, @"ProtectionData");
    publicSharingKey = inited->_publicSharingKey;
    inited->_publicSharingKey = (NSData *)v33;

    uint64_t v35 = objc_opt_class();
    uint64_t v37 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v36, v35, @"OONProtectionData");
    outOfNetworkPrivateKey = inited->_outOfNetworkPrivateKey;
    inited->_outOfNetworkPrivateKey = (NSData *)v37;

    inited->_uint64_t isCached = objc_msgSend_decodeBoolForKey_(v4, v39, @"IsCached", v40);
    inited->_hasiCloudAccount = objc_msgSend_decodeBoolForKey_(v4, v41, @"HasICloudAccount", v42);
    uint64_t v43 = objc_opt_class();
    uint64_t v45 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v44, v43, @"EncryptedPersonalInfo");
    encryptedPersonalInfo = inited->_encryptedPersonalInfo;
    inited->_encryptedPersonalInfo = (NSData *)v45;

    inited->_publicKeyVersion = objc_msgSend_decodeInt64ForKey_(v4, v47, @"PublicKeyVersion", v48);
  }

  return inited;
}

- (CKRecordID)userRecordID
{
  return (CKRecordID *)objc_getProperty(self, a2, 32, 1);
}

- (void)setUserRecordID:(id)a3
{
}

- (NSPersonNameComponents)nameComponents
{
  return (NSPersonNameComponents *)objc_getProperty(self, a2, 40, 1);
}

- (void)setNameComponents:(id)a3
{
}

- (BOOL)hasiCloudAccount
{
  return self->_hasiCloudAccount;
}

- (void)setHasiCloudAccount:(BOOL)a3
{
  self->_hasiCloudAccount = a3;
}

- (BOOL)isCached
{
  return self->_isCached;
}

- (void)setIsCached:(BOOL)a3
{
  self->_uint64_t isCached = a3;
}

- (NSData)publicSharingKey
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPublicSharingKey:(id)a3
{
}

- (unint64_t)publicKeyVersion
{
  return self->_publicKeyVersion;
}

- (void)setPublicKeyVersion:(unint64_t)a3
{
  self->_publicKeyVersion = a3;
}

- (NSData)outOfNetworkPrivateKey
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (void)setOutOfNetworkPrivateKey:(id)a3
{
}

- (NSData)encryptedPersonalInfo
{
  return (NSData *)objc_getProperty(self, a2, 72, 1);
}

- (void)setEncryptedPersonalInfo:(id)a3
{
}

- (NSString)firstName
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (NSString)lastName
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_encryptedPersonalInfo, 0);
  objc_storeStrong((id *)&self->_outOfNetworkPrivateKey, 0);
  objc_storeStrong((id *)&self->_publicSharingKey, 0);
  objc_storeStrong((id *)&self->_nameComponents, 0);
  objc_storeStrong((id *)&self->_userRecordID, 0);
  objc_storeStrong((id *)&self->_contactIdentifiers, 0);

  objc_storeStrong((id *)&self->_lookupInfo, 0);
}

@end
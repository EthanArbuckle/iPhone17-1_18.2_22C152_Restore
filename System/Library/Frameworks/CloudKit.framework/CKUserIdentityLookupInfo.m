@interface CKUserIdentityLookupInfo
+ (BOOL)supportsSecureCoding;
+ (NSArray)lookupInfosWithEmails:(NSArray *)emails;
+ (NSArray)lookupInfosWithPhoneNumbers:(NSArray *)phoneNumbers;
+ (NSArray)lookupInfosWithRecordIDs:(NSArray *)recordIDs;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldReportMissingIdentity;
- (CKRecordID)userRecordID;
- (CKRoughlyEquivalentProperties)equivalencyProperties;
- (CKUserIdentityLookupInfo)initWithCoder:(id)a3;
- (CKUserIdentityLookupInfo)initWithEmailAddress:(NSString *)emailAddress;
- (CKUserIdentityLookupInfo)initWithPhoneNumber:(NSString *)phoneNumber;
- (CKUserIdentityLookupInfo)initWithUserRecordID:(CKRecordID *)userRecordID;
- (NSData)encryptedPersonalInfo;
- (NSString)description;
- (NSString)emailAddress;
- (NSString)phoneNumber;
- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5;
- (id)ckShortDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initInternal;
- (id)lookupValue;
- (id)redactedDescription;
- (int64_t)lookupField;
- (unint64_t)hash;
- (void)CKDescribePropertiesUsing:(id)a3;
- (void)_stripPersonalInfo;
- (void)encodeWithCoder:(id)a3;
- (void)setEmailAddress:(id)a3;
- (void)setEncryptedPersonalInfo:(id)a3;
- (void)setPhoneNumber:(id)a3;
- (void)setShouldReportMissingIdentity:(BOOL)a3;
- (void)setUserRecordID:(id)a3;
@end

@implementation CKUserIdentityLookupInfo

+ (void)initialize
{
  v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = self;

  sub_18AF14F44(v3, v2, 0, 0, 0);
}

- (id)initInternal
{
  v3.receiver = self;
  v3.super_class = (Class)CKUserIdentityLookupInfo;
  return [(CKUserIdentityLookupInfo *)&v3 init];
}

- (CKUserIdentityLookupInfo)initWithEmailAddress:(NSString *)emailAddress
{
  v8 = emailAddress;
  if (!v8)
  {
    v16 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6, v7);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v16, v17, (uint64_t)a2, (uint64_t)self, @"CKUserIdentityLookupInfo.m", 36, @"Invalid parameter not satisfying: %@", @"emailAddress != nil");
  }
  inited = (CKUserIdentityLookupInfo *)objc_msgSend_initInternal(self, v5, v6, v7);
  if (inited)
  {
    uint64_t v13 = objc_msgSend_copy(v8, v9, v10, v11);
    v14 = inited->_emailAddress;
    inited->_emailAddress = (NSString *)v13;

    inited->_shouldReportMissingIdentity = 1;
  }

  return inited;
}

- (CKUserIdentityLookupInfo)initWithUserRecordID:(CKRecordID *)userRecordID
{
  v8 = userRecordID;
  if (!v8)
  {
    v16 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6, v7);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v16, v17, (uint64_t)a2, (uint64_t)self, @"CKUserIdentityLookupInfo.m", 45, @"Invalid parameter not satisfying: %@", @"recordID != nil");
  }
  inited = (CKUserIdentityLookupInfo *)objc_msgSend_initInternal(self, v5, v6, v7);
  if (inited)
  {
    uint64_t v13 = objc_msgSend_copy(v8, v9, v10, v11);
    v14 = inited->_userRecordID;
    inited->_userRecordID = (CKRecordID *)v13;

    inited->_shouldReportMissingIdentity = 1;
  }

  return inited;
}

- (CKUserIdentityLookupInfo)initWithPhoneNumber:(NSString *)phoneNumber
{
  v8 = phoneNumber;
  if (!v8)
  {
    v16 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6, v7);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v16, v17, (uint64_t)a2, (uint64_t)self, @"CKUserIdentityLookupInfo.m", 54, @"Invalid parameter not satisfying: %@", @"phoneNumber != nil");
  }
  inited = (CKUserIdentityLookupInfo *)objc_msgSend_initInternal(self, v5, v6, v7);
  if (inited)
  {
    uint64_t v13 = objc_msgSend_copy(v8, v9, v10, v11);
    v14 = inited->_phoneNumber;
    inited->_phoneNumber = (NSString *)v13;

    inited->_shouldReportMissingIdentity = 1;
  }

  return inited;
}

- (CKRoughlyEquivalentProperties)equivalencyProperties
{
  objc_super v3 = objc_opt_new();
  uint64_t v7 = objc_msgSend_emailAddress(self, v4, v5, v6);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)v7, @"emailAddress");

  v12 = objc_msgSend_phoneNumber(self, v9, v10, v11);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v13, (uint64_t)v12, @"phoneNumber");

  v17 = objc_msgSend_userRecordID(self, v14, v15, v16);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v18, (uint64_t)v17, @"userRecordID");

  v22 = objc_msgSend_properties(v3, v19, v20, v21);

  return (CKRoughlyEquivalentProperties *)v22;
}

- (int64_t)lookupField
{
  uint64_t v5 = objc_msgSend_emailAddress(self, a2, v2, v3);

  if (v5) {
    return 1;
  }
  uint64_t v10 = objc_msgSend_userRecordID(self, v6, v7, v8);

  if (v10) {
    return 2;
  }
  v14 = objc_msgSend_phoneNumber(self, v11, v12, v13);

  if (v14) {
    return 3;
  }
  else {
    return 0;
  }
}

- (id)lookupValue
{
  uint64_t v5 = objc_msgSend_emailAddress(self, a2, v2, v3);
  v9 = v5;
  if (v5)
  {
    id v10 = v5;
  }
  else
  {
    uint64_t v11 = objc_msgSend_userRecordID(self, v6, v7, v8);
    uint64_t v15 = v11;
    if (v11)
    {
      id v10 = v11;
    }
    else
    {
      uint64_t v16 = objc_msgSend_phoneNumber(self, v12, v13, v14);
      id v10 = v16;
      if (v16) {
        id v17 = v16;
      }
    }
  }

  return v10;
}

- (void)_stripPersonalInfo
{
  objc_msgSend_setEmailAddress_(self, a2, 0, v2);

  MEMORY[0x1F4181798](self, sel_setPhoneNumber_, 0, v4);
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKUserIdentityLookupInfo *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKUserIdentityLookupInfo *, char *))MEMORY[0x1F4181798])(self, sel_CKRedactedDescription);
}

- (id)ckShortDescription
{
  uint64_t v5 = objc_msgSend_emailAddress(self, a2, v2, v3);
  v9 = objc_msgSend_phoneNumber(self, v6, v7, v8);
  uint64_t v13 = objc_msgSend_userRecordID(self, v10, v11, v12);
  if (objc_msgSend_length(v5, v14, v15, v16))
  {
    objc_msgSend_stringWithFormat_(NSString, v17, @"email=%@", v19, v5);
LABEL_7:
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (objc_msgSend_length(v9, v17, v18, v19))
  {
    objc_msgSend_stringWithFormat_(NSString, v20, @"phone=%@", v21, v9);
    goto LABEL_7;
  }
  if (v13)
  {
    objc_msgSend_stringWithFormat_(NSString, v20, @"userID=%@", v21, v13);
    goto LABEL_7;
  }
  v22 = @"empty";
LABEL_8:

  return v22;
}

- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v11 = objc_msgSend_dictionaryWithCapacity_(MEMORY[0x1E4F1CA60], a2, 1, a4);
  if (v6)
  {
    uint64_t v12 = objc_msgSend_emailAddress(self, v8, v9, v10);
    uint64_t v16 = objc_msgSend_phoneNumber(self, v13, v14, v15);
    uint64_t v20 = objc_msgSend_userRecordID(self, v17, v18, v19);
    if (objc_msgSend_length(v12, v21, v22, v23))
    {
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v24, @"email", (uint64_t)v12);
    }
    else if (objc_msgSend_length(v16, v24, v25, v26))
    {
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v27, @"phone", (uint64_t)v16);
    }
    else if (v20)
    {
      if (v5)
      {
        v29 = objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(v20, v27, 1, 1, 1);
        objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v30, @"userID", (uint64_t)v29);
      }
      else
      {
        objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v27, @"userID", (uint64_t)v20);
      }
    }
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  inited = objc_msgSend_initInternal(v4, v5, v6, v7);
  uint64_t v12 = objc_msgSend_emailAddress(self, v9, v10, v11);
  uint64_t v16 = objc_msgSend_copy(v12, v13, v14, v15);
  id v17 = (void *)inited[2];
  inited[2] = v16;

  uint64_t v21 = objc_msgSend_userRecordID(self, v18, v19, v20);
  uint64_t v25 = objc_msgSend_copy(v21, v22, v23, v24);
  uint64_t v26 = (void *)inited[4];
  inited[4] = v25;

  v30 = objc_msgSend_phoneNumber(self, v27, v28, v29);
  uint64_t v34 = objc_msgSend_copy(v30, v31, v32, v33);
  v35 = (void *)inited[3];
  inited[3] = v34;

  v39 = objc_msgSend_encryptedPersonalInfo(self, v36, v37, v38);
  uint64_t v43 = objc_msgSend_copy(v39, v40, v41, v42);
  v44 = (void *)inited[5];
  inited[5] = v43;

  return inited;
}

- (unint64_t)hash
{
  BOOL v5 = objc_msgSend_emailAddress(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_hash(v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_userRecordID(self, v10, v11, v12);
  uint64_t v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;
  uint64_t v21 = objc_msgSend_phoneNumber(self, v18, v19, v20);
  unint64_t v25 = v17 ^ objc_msgSend_hash(v21, v22, v23, v24);

  return v25;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v9 = objc_msgSend_emailAddress(self, v6, v7, v8);
    uint64_t v13 = objc_msgSend_emailAddress(v5, v10, v11, v12);
    if (CKObjectsAreBothNilOrEqual(v9, v13))
    {
      uint64_t v17 = objc_msgSend_phoneNumber(self, v14, v15, v16);
      uint64_t v21 = objc_msgSend_phoneNumber(v5, v18, v19, v20);
      if (CKObjectsAreBothNilOrEqual(v17, v21))
      {
        unint64_t v25 = objc_msgSend_userRecordID(self, v22, v23, v24);
        uint64_t v29 = objc_msgSend_userRecordID(v5, v26, v27, v28);
        char v30 = CKObjectsAreBothNilOrEqual(v25, v29);
      }
      else
      {
        char v30 = 0;
      }
    }
    else
    {
      char v30 = 0;
    }
  }
  else
  {
    char v30 = 0;
  }

  return v30;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v33 = a3;
  id v4 = (void *)MEMORY[0x18C12ADA0]();
  uint64_t v8 = objc_msgSend_phoneNumber(self, v5, v6, v7);
  objc_msgSend_encodeObject_forKey_(v33, v9, (uint64_t)v8, @"PhoneNumber");

  uint64_t v13 = objc_msgSend_emailAddress(self, v10, v11, v12);
  objc_msgSend_encodeObject_forKey_(v33, v14, (uint64_t)v13, @"EmailAddress");

  uint64_t v18 = objc_msgSend_userRecordID(self, v15, v16, v17);
  objc_msgSend_encodeObject_forKey_(v33, v19, (uint64_t)v18, @"RecordID");

  if ((objc_msgSend_ck_isCodingForCKSQLiteDatabase(v33, v20, v21, v22) & 1) == 0)
  {
    uint64_t shouldReportMissingIdentity = objc_msgSend_shouldReportMissingIdentity(self, v23, v24, v25);
    objc_msgSend_encodeBool_forKey_(v33, v27, shouldReportMissingIdentity, @"ReportsMissing");
    v31 = objc_msgSend_encryptedPersonalInfo(self, v28, v29, v30);
    objc_msgSend_encodeObject_forKey_(v33, v32, (uint64_t)v31, @"EncryptedPersonalInfo");
  }
}

- (CKUserIdentityLookupInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CKUserIdentityLookupInfo;
  id v5 = [(CKUserIdentityLookupInfo *)&v28 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"EmailAddress");
    emailAddress = v5->_emailAddress;
    v5->_emailAddress = (NSString *)v8;

    uint64_t v10 = objc_opt_class();
    uint64_t v12 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, @"PhoneNumber");
    phoneNumber = v5->_phoneNumber;
    v5->_phoneNumber = (NSString *)v12;

    uint64_t v14 = objc_opt_class();
    uint64_t v16 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, @"RecordID");
    userRecordID = v5->_userRecordID;
    v5->_userRecordID = (CKRecordID *)v16;

    if ((objc_msgSend_ck_isDecodingForCKSQLiteDatabase(v4, v18, v19, v20) & 1) == 0)
    {
      v5->_uint64_t shouldReportMissingIdentity = objc_msgSend_decodeBoolForKey_(v4, v21, @"ReportsMissing", v22);
      uint64_t v23 = objc_opt_class();
      uint64_t v25 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v24, v23, @"EncryptedPersonalInfo");
      encryptedPersonalInfo = v5->_encryptedPersonalInfo;
      v5->_encryptedPersonalInfo = (NSData *)v25;
    }
  }

  return v5;
}

+ (NSArray)lookupInfosWithEmails:(NSArray *)emails
{
  return (NSArray *)objc_msgSend_CKMap_(emails, a2, (uint64_t)&unk_1ED7EF1F8, v3);
}

+ (NSArray)lookupInfosWithRecordIDs:(NSArray *)recordIDs
{
  return (NSArray *)objc_msgSend_CKMap_(recordIDs, a2, (uint64_t)&unk_1ED7F0658, v3);
}

+ (NSArray)lookupInfosWithPhoneNumbers:(NSArray *)phoneNumbers
{
  return (NSArray *)objc_msgSend_CKMap_(phoneNumbers, a2, (uint64_t)&unk_1ED7F0718, v3);
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_emailAddress(self, v5, v6, v7);
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v4, v9, @"emailAddress", (uint64_t)v8, 1);

  uint64_t v13 = objc_msgSend_phoneNumber(self, v10, v11, v12);
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v4, v14, @"phoneNumber", (uint64_t)v13, 1);

  objc_msgSend_userRecordID(self, v15, v16, v17);
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v4, v18, @"userRecordID", (uint64_t)v19, 0);
}

- (NSString)emailAddress
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEmailAddress:(id)a3
{
}

- (NSString)phoneNumber
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPhoneNumber:(id)a3
{
}

- (CKRecordID)userRecordID
{
  return (CKRecordID *)objc_getProperty(self, a2, 32, 1);
}

- (void)setUserRecordID:(id)a3
{
}

- (BOOL)shouldReportMissingIdentity
{
  return self->_shouldReportMissingIdentity;
}

- (void)setShouldReportMissingIdentity:(BOOL)a3
{
  self->_uint64_t shouldReportMissingIdentity = a3;
}

- (NSData)encryptedPersonalInfo
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setEncryptedPersonalInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptedPersonalInfo, 0);
  objc_storeStrong((id *)&self->_userRecordID, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);

  objc_storeStrong((id *)&self->_emailAddress, 0);
}

@end
@interface CKFetchRecordZoneChangesConfiguration
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
- (BOOL)fetchChangesMadeByThisDevice;
- (BOOL)fetchNewestChangesFirst;
- (CKFetchRecordZoneChangesConfiguration)init;
- (CKFetchRecordZoneChangesConfiguration)initWithCoder:(id)a3;
- (CKServerChangeToken)previousServerChangeToken;
- (NSArray)desiredKeys;
- (NSUInteger)resultsLimit;
- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDesiredKeys:(NSArray *)desiredKeys;
- (void)setFetchChangesMadeByThisDevice:(BOOL)a3;
- (void)setFetchNewestChangesFirst:(BOOL)a3;
- (void)setPreviousServerChangeToken:(CKServerChangeToken *)previousServerChangeToken;
- (void)setResultsLimit:(NSUInteger)resultsLimit;
@end

@implementation CKFetchRecordZoneChangesConfiguration

+ (void)initialize
{
  v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = self;

  sub_18AF14F44(v3, v2, 0, 0, 0);
}

- (CKFetchRecordZoneChangesConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)CKFetchRecordZoneChangesConfiguration;
  result = [(CKFetchRecordZoneChangesConfiguration *)&v3 init];
  if (result) {
    result->_fetchChangesMadeByThisDevice = 1;
  }
  return result;
}

- (id)description
{
  return (id)((uint64_t (*)(CKFetchRecordZoneChangesConfiguration *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  v8 = objc_msgSend_desiredKeys(self, a2, a3, a4, a5);
  v14 = objc_msgSend_dictionaryWithCapacity_(MEMORY[0x1E4F1CA60], v9, 5, v10);
  if (v5)
  {
    v15 = objc_msgSend_previousServerChangeToken(self, v11, v12, v13);
    objc_msgSend_CKAddPropertySafelyForKey_value_(v14, v16, @"previousChangeToken", (uint64_t)v15);

    if (objc_msgSend_count(v8, v17, v18, v19)) {
      objc_msgSend_CKAddPropertySafelyForKey_value_(v14, v11, @"desiredKeys", (uint64_t)v8);
    }
  }
  if (v6)
  {
    v20 = NSNumber;
    uint64_t v21 = objc_msgSend_resultsLimit(self, v11, v12, v13);
    v24 = objc_msgSend_numberWithUnsignedInteger_(v20, v22, v21, v23);
    objc_msgSend_CKAddPropertySafelyForKey_value_(v14, v25, @"resultsLimit", (uint64_t)v24);

    if (v8)
    {
      if (!objc_msgSend_count(v8, v26, v27, v28)) {
        objc_msgSend_CKAddPropertySafelyForKey_value_(v14, v29, @"desiredKeys", @"[system fields only]");
      }
    }
    else
    {
      objc_msgSend_CKAddPropertySafelyForKey_value_(v14, v26, @"desiredKeys", @"[all keys]");
    }
    if (objc_msgSend_fetchNewestChangesFirst(self, v29, v30, v31)) {
      objc_msgSend_CKAddPropertySafelyForKey_value_(v14, v32, @"fetchNewestChangesFirst", @"true");
    }
    if (objc_msgSend_fetchChangesMadeByThisDevice(self, v32, v33, v34)) {
      objc_msgSend_CKAddPropertySafelyForKey_value_(v14, v35, @"fetchChangesMadeByThisDevice", @"true");
    }
  }

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(CKFetchRecordZoneChangesConfiguration);
  v8 = objc_msgSend_previousServerChangeToken(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_copy(v8, v9, v10, v11);
  previousServerChangeToken = v4->_previousServerChangeToken;
  v4->_previousServerChangeToken = (CKServerChangeToken *)v12;

  v4->_resultsLimit = objc_msgSend_resultsLimit(self, v14, v15, v16);
  v20 = objc_msgSend_desiredKeys(self, v17, v18, v19);
  uint64_t v24 = objc_msgSend_CKDeepCopy(v20, v21, v22, v23);
  desiredKeys = v4->_desiredKeys;
  v4->_desiredKeys = (NSArray *)v24;

  v4->_fetchNewestChangesFirst = objc_msgSend_fetchNewestChangesFirst(self, v26, v27, v28);
  v4->_fetchChangesMadeByThisDevice = objc_msgSend_fetchChangesMadeByThisDevice(self, v29, v30, v31);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v30 = a3;
  v4 = (void *)MEMORY[0x18C12ADA0]();
  v8 = objc_msgSend_previousServerChangeToken(self, v5, v6, v7);
  objc_msgSend_encodeObject_forKey_(v30, v9, (uint64_t)v8, @"previousServerChangeToken");

  uint64_t v13 = objc_msgSend_desiredKeys(self, v10, v11, v12);
  objc_msgSend_encodeObject_forKey_(v30, v14, (uint64_t)v13, @"desiredKeys");

  uint64_t v18 = objc_msgSend_resultsLimit(self, v15, v16, v17);
  objc_msgSend_encodeInteger_forKey_(v30, v19, v18, @"resultsLimit");
  uint64_t NewestChangesFirst = objc_msgSend_fetchNewestChangesFirst(self, v20, v21, v22);
  objc_msgSend_encodeBool_forKey_(v30, v24, NewestChangesFirst, @"newestFirst");
  uint64_t ChangesMadeByThisDevice = objc_msgSend_fetchChangesMadeByThisDevice(self, v25, v26, v27);
  objc_msgSend_encodeBool_forKey_(v30, v29, ChangesMadeByThisDevice, @"fetchChangesMadeByThisDevice");
}

- (CKFetchRecordZoneChangesConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)CKFetchRecordZoneChangesConfiguration;
  BOOL v5 = [(CKFetchRecordZoneChangesConfiguration *)&v27 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x18C12ADA0]();
    uint64_t v7 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, @"previousServerChangeToken");
    previousServerChangeToken = v5->_previousServerChangeToken;
    v5->_previousServerChangeToken = (CKServerChangeToken *)v9;

    uint64_t v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v16 = objc_msgSend_setWithObjects_(v11, v14, v12, v15, v13, 0);
    uint64_t v18 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v17, (uint64_t)v16, @"desiredKeys");
    desiredKeys = v5->_desiredKeys;
    v5->_desiredKeys = (NSArray *)v18;

    v5->_resultsLimit = objc_msgSend_decodeIntegerForKey_(v4, v20, @"resultsLimit", v21);
    v5->_fetchuint64_t NewestChangesFirst = objc_msgSend_decodeBoolForKey_(v4, v22, @"newestFirst", v23);
    v5->_fetchuint64_t ChangesMadeByThisDevice = objc_msgSend_decodeBoolForKey_(v4, v24, @"fetchChangesMadeByThisDevice", v25);
  }

  return v5;
}

- (NSArray)desiredKeys
{
  v2 = self;
  objc_sync_enter(v2);
  objc_super v3 = v2->_desiredKeys;
  objc_sync_exit(v2);

  return v3;
}

- (void)setDesiredKeys:(NSArray *)desiredKeys
{
  uint64_t v10 = desiredKeys;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v8 = objc_msgSend_CKDeepCopy(v10, v5, v6, v7);
  uint64_t v9 = v4->_desiredKeys;
  v4->_desiredKeys = (NSArray *)v8;

  objc_sync_exit(v4);
}

- (CKServerChangeToken)previousServerChangeToken
{
  return (CKServerChangeToken *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPreviousServerChangeToken:(CKServerChangeToken *)previousServerChangeToken
{
}

- (NSUInteger)resultsLimit
{
  return self->_resultsLimit;
}

- (void)setResultsLimit:(NSUInteger)resultsLimit
{
  self->_resultsLimit = resultsLimit;
}

- (BOOL)fetchNewestChangesFirst
{
  return self->_fetchNewestChangesFirst;
}

- (void)setFetchNewestChangesFirst:(BOOL)a3
{
  self->_fetchuint64_t NewestChangesFirst = a3;
}

- (BOOL)fetchChangesMadeByThisDevice
{
  return self->_fetchChangesMadeByThisDevice;
}

- (void)setFetchChangesMadeByThisDevice:(BOOL)a3
{
  self->_fetchuint64_t ChangesMadeByThisDevice = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousServerChangeToken, 0);

  objc_storeStrong((id *)&self->_desiredKeys, 0);
}

@end
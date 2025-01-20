@interface CKFetchRecordZoneChangesOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)fetchChangesMadeByThisDevice;
- (BOOL)fetchNewestChangesFirst;
- (CKFetchRecordZoneChangesOptions)init;
- (CKFetchRecordZoneChangesOptions)initWithCoder:(id)a3;
- (CKFetchRecordZoneChangesOptions)initWithZoneConfiguration:(id)a3;
- (CKServerChangeToken)previousServerChangeToken;
- (NSArray)desiredKeys;
- (NSUInteger)resultsLimit;
- (id)copyWithZone:(_NSZone *)a3;
- (id)zoneConfiguration;
- (void)encodeWithCoder:(id)a3;
- (void)setDesiredKeys:(NSArray *)desiredKeys;
- (void)setFetchChangesMadeByThisDevice:(BOOL)a3;
- (void)setFetchNewestChangesFirst:(BOOL)a3;
- (void)setPreviousServerChangeToken:(CKServerChangeToken *)previousServerChangeToken;
- (void)setResultsLimit:(NSUInteger)resultsLimit;
@end

@implementation CKFetchRecordZoneChangesOptions

- (CKFetchRecordZoneChangesOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)CKFetchRecordZoneChangesOptions;
  result = [(CKFetchRecordZoneChangesOptions *)&v3 init];
  if (result) {
    result->_fetchChangesMadeByThisDevice = 1;
  }
  return result;
}

- (CKFetchRecordZoneChangesOptions)initWithZoneConfiguration:(id)a3
{
  id v4 = a3;
  v11 = (CKFetchRecordZoneChangesOptions *)objc_msgSend_init(self, v5, v6, v7);
  if (v11)
  {
    v12 = objc_msgSend_previousServerChangeToken(v4, v8, v9, v10);
    objc_msgSend_setPreviousServerChangeToken_(v11, v13, (uint64_t)v12, v14);

    uint64_t v18 = objc_msgSend_resultsLimit(v4, v15, v16, v17);
    objc_msgSend_setResultsLimit_(v11, v19, v18, v20);
    v24 = objc_msgSend_desiredKeys(v4, v21, v22, v23);
    objc_msgSend_setDesiredKeys_(v11, v25, (uint64_t)v24, v26);

    uint64_t NewestChangesFirst = objc_msgSend_fetchNewestChangesFirst(v4, v27, v28, v29);
    objc_msgSend_setFetchNewestChangesFirst_(v11, v31, NewestChangesFirst, v32);
    uint64_t ChangesMadeByThisDevice = objc_msgSend_fetchChangesMadeByThisDevice(v4, v33, v34, v35);
    objc_msgSend_setFetchChangesMadeByThisDevice_(v11, v37, ChangesMadeByThisDevice, v38);
  }

  return v11;
}

- (id)zoneConfiguration
{
  objc_super v3 = objc_opt_new();
  uint64_t v7 = objc_msgSend_previousServerChangeToken(self, v4, v5, v6);
  objc_msgSend_setPreviousServerChangeToken_(v3, v8, (uint64_t)v7, v9);

  uint64_t v13 = objc_msgSend_resultsLimit(self, v10, v11, v12);
  objc_msgSend_setResultsLimit_(v3, v14, v13, v15);
  v19 = objc_msgSend_desiredKeys(self, v16, v17, v18);
  objc_msgSend_setDesiredKeys_(v3, v20, (uint64_t)v19, v21);

  uint64_t NewestChangesFirst = objc_msgSend_fetchNewestChangesFirst(self, v22, v23, v24);
  objc_msgSend_setFetchNewestChangesFirst_(v3, v26, NewestChangesFirst, v27);
  uint64_t ChangesMadeByThisDevice = objc_msgSend_fetchChangesMadeByThisDevice(self, v28, v29, v30);
  objc_msgSend_setFetchChangesMadeByThisDevice_(v3, v32, ChangesMadeByThisDevice, v33);

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(CKFetchRecordZoneChangesOptions);
  v8 = objc_msgSend_previousServerChangeToken(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_copy(v8, v9, v10, v11);
  previousServerChangeToken = v4->_previousServerChangeToken;
  v4->_previousServerChangeToken = (CKServerChangeToken *)v12;

  v4->_resultsLimit = objc_msgSend_resultsLimit(self, v14, v15, v16);
  uint64_t v20 = objc_msgSend_desiredKeys(self, v17, v18, v19);
  uint64_t v24 = objc_msgSend_copy(v20, v21, v22, v23);
  desiredKeys = v4->_desiredKeys;
  v4->_desiredKeys = (NSArray *)v24;

  v4->_fetchuint64_t NewestChangesFirst = objc_msgSend_fetchNewestChangesFirst(self, v26, v27, v28);
  v4->_fetchuint64_t ChangesMadeByThisDevice = objc_msgSend_fetchChangesMadeByThisDevice(self, v29, v30, v31);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v30 = a3;
  id v4 = (void *)MEMORY[0x18C12ADA0]();
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

- (CKFetchRecordZoneChangesOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)CKFetchRecordZoneChangesOptions;
  uint64_t v5 = [(CKFetchRecordZoneChangesOptions *)&v27 init];
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

- (CKServerChangeToken)previousServerChangeToken
{
  return self->_previousServerChangeToken;
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

- (NSArray)desiredKeys
{
  return self->_desiredKeys;
}

- (void)setDesiredKeys:(NSArray *)desiredKeys
{
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
  objc_storeStrong((id *)&self->_desiredKeys, 0);

  objc_storeStrong((id *)&self->_previousServerChangeToken, 0);
}

@end
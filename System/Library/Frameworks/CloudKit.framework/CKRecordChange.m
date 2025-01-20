@interface CKRecordChange
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CKRecord)record;
- (CKRecordChange)initWithChangeType:(int64_t)a3 recordID:(id)a4 record:(id)a5;
- (CKRecordChange)initWithCoder:(id)a3;
- (CKRecordID)recordID;
- (NSString)description;
- (id)redactedDescription;
- (int64_t)changeType;
- (unint64_t)hash;
- (void)CKDescribePropertiesUsing:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKRecordChange

- (CKRecordChange)initWithChangeType:(int64_t)a3 recordID:(id)a4 record:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = v9;
  if ((unint64_t)(a3 - 1) > 1 || v9)
  {
    v23.receiver = self;
    v23.super_class = (Class)CKRecordChange;
    v12 = [(CKRecordChange *)&v23 init];
    v16 = v12;
    if (v12)
    {
      v12->_changeType = a3;
      uint64_t v17 = objc_msgSend_copy(v8, v13, v14, v15);
      recordID = v16->_recordID;
      v16->_recordID = (CKRecordID *)v17;

      uint64_t v20 = objc_msgSend_copyWithZone_userFields_(v10, v19, 0, 0);
      record = v16->_record;
      v16->_record = (CKRecord *)v20;
    }
    self = v16;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  v5 = objc_msgSend_recordID(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_hash(v5, v6, v7, v8);
  unint64_t v13 = objc_msgSend_changeType(self, v10, v11, v12) ^ v9;

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CKRecordChange *)a3;
  if (self == v4)
  {
    char isEqual = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v9 = objc_msgSend_changeType(self, v6, v7, v8);
      if (v9 == objc_msgSend_changeType(v5, v10, v11, v12)
        && (objc_msgSend_recordID(self, v13, v14, v15),
            v16 = objc_claimAutoreleasedReturnValue(),
            objc_msgSend_recordID(v5, v17, v18, v19),
            uint64_t v20 = objc_claimAutoreleasedReturnValue(),
            int v23 = objc_msgSend_isEqual_(v16, v21, (uint64_t)v20, v22),
            v20,
            v16,
            v23))
      {
        v27 = objc_msgSend_record(self, v24, v25, v26);
        uint64_t v31 = objc_msgSend_record(v5, v28, v29, v30);
        if (v27 == (void *)v31)
        {
          char isEqual = 1;
          v35 = v27;
        }
        else
        {
          v35 = (void *)v31;
          v36 = objc_msgSend_record(self, v32, v33, v34);
          v40 = objc_msgSend_record(v5, v37, v38, v39);
          char isEqual = objc_msgSend_isEqual_(v36, v41, (uint64_t)v40, v42);
        }
      }
      else
      {
        char isEqual = 0;
      }
    }
    else
    {
      char isEqual = 0;
    }
  }

  return isEqual;
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v4 = a3;
  unint64_t v9 = objc_msgSend_changeType(self, v5, v6, v7) - 1;
  if (v9 > 2) {
    objc_msgSend_addProperty_value_shouldRedact_(v4, v8, @"changeType", @"Unknown", 0);
  }
  else {
    objc_msgSend_addProperty_value_shouldRedact_(v4, v8, @"changeType", (uint64_t)off_1E54650D0[v9], 0);
  }
  unint64_t v13 = objc_msgSend_recordID(self, v10, v11, v12);
  objc_msgSend_addProperty_value_shouldRedact_(v4, v14, @"recordID", (uint64_t)v13, 0);

  objc_msgSend_record(self, v15, v16, v17);
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_etag(v23, v18, v19, v20);
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v4, v22, @"recordETag", (uint64_t)v21, 0);
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKRecordChange *, char *))MEMORY[0x1F4181798])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKRecordChange *, char *))MEMORY[0x1F4181798])(self, sel_CKRedactedDescription);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKRecordChange)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_decodeIntegerForKey_(v4, v5, @"CK.changeType", v6);
  uint64_t v8 = objc_opt_class();
  v10 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v9, v8, @"CK.recordID");
  uint64_t v11 = objc_opt_class();
  unint64_t v13 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, @"CK.record");

  uint64_t v15 = (CKRecordChange *)objc_msgSend_initWithChangeType_recordID_record_(self, v14, v7, (uint64_t)v10, v13);
  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_changeType(self, v5, v6, v7);
  objc_msgSend_encodeInteger_forKey_(v4, v9, v8, @"CK.changeType");
  unint64_t v13 = objc_msgSend_recordID(self, v10, v11, v12);
  objc_msgSend_encodeObject_forKey_(v4, v14, (uint64_t)v13, @"CK.recordID");

  objc_msgSend_record(self, v15, v16, v17);
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v18, (uint64_t)v19, @"CK.record");
}

- (int64_t)changeType
{
  return self->_changeType;
}

- (CKRecordID)recordID
{
  return self->_recordID;
}

- (CKRecord)record
{
  return self->_record;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_record, 0);

  objc_storeStrong((id *)&self->_recordID, 0);
}

@end
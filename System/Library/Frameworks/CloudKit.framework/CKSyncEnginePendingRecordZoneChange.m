@interface CKSyncEnginePendingRecordZoneChange
+ (BOOL)supportsSecureCoding;
+ (id)recordChangesWithOppositeTypeFromRecordChanges:(id)a3;
- (BOOL)CKDescriptionShouldPrintPointer;
- (BOOL)isEqual:(id)a3;
- (CKRecordID)recordID;
- (CKSyncEnginePendingRecordZoneChange)initWithCoder:(id)a3;
- (CKSyncEnginePendingRecordZoneChange)initWithRecordID:(CKRecordID *)recordID type:(CKSyncEnginePendingRecordZoneChangeType)type;
- (CKSyncEnginePendingRecordZoneChangeType)type;
- (NSString)description;
- (id)CKDescriptionClassName;
- (id)oppositeTypeChange;
- (id)redactedDescription;
- (unint64_t)hash;
- (void)CKDescribePropertiesUsing:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKSyncEnginePendingRecordZoneChange

- (CKSyncEnginePendingRecordZoneChange)initWithRecordID:(CKRecordID *)recordID type:(CKSyncEnginePendingRecordZoneChangeType)type
{
  v6 = recordID;
  v14.receiver = self;
  v14.super_class = (Class)CKSyncEnginePendingRecordZoneChange;
  v10 = [(CKSyncEnginePendingRecordZoneChange *)&v14 init];
  if (v10)
  {
    uint64_t v11 = objc_msgSend_copy(v6, v7, v8, v9);
    v12 = v10->_recordID;
    v10->_recordID = (CKRecordID *)v11;

    v10->_type = type;
  }

  return v10;
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKSyncEnginePendingRecordZoneChange *, char *))MEMORY[0x1F4181798])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKSyncEnginePendingRecordZoneChange *, char *))MEMORY[0x1F4181798])(self, sel_CKRedactedDescription);
}

- (BOOL)CKDescriptionShouldPrintPointer
{
  return 0;
}

- (id)CKDescriptionClassName
{
  if (objc_msgSend_type(self, a2, v2, v3)) {
    return @"PendingRecordDelete";
  }
  else {
    return @"PendingRecordSave";
  }
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v4 = a3;
  objc_msgSend_recordID(self, v5, v6, v7);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v4, v8, @"recordID", (uint64_t)v9, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CKSyncEnginePendingRecordZoneChange *)a3;
  if (self == v4)
  {
    BOOL v23 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id v9 = objc_msgSend_recordID(self, v6, v7, v8);
      v13 = objc_msgSend_recordID(v5, v10, v11, v12);
      if (objc_msgSend_isEqual_(v9, v14, (uint64_t)v13, v15))
      {
        uint64_t v19 = objc_msgSend_type(self, v16, v17, v18);
        BOOL v23 = v19 == objc_msgSend_type(v5, v20, v21, v22);
      }
      else
      {
        BOOL v23 = 0;
      }
    }
    else
    {
      BOOL v23 = 0;
    }
  }

  return v23;
}

- (unint64_t)hash
{
  v5 = objc_msgSend_recordID(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_hash(v5, v6, v7, v8);
  unint64_t v13 = objc_msgSend_type(self, v10, v11, v12) ^ v9;

  return v13;
}

- (id)oppositeTypeChange
{
  uint64_t v3 = [CKSyncEnginePendingRecordZoneChange alloc];
  uint64_t v7 = objc_msgSend_recordID(self, v4, v5, v6);
  BOOL v11 = objc_msgSend_type(self, v8, v9, v10) == 0;
  unint64_t v13 = objc_msgSend_initWithRecordID_type_(v3, v12, (uint64_t)v7, v11);

  return v13;
}

+ (id)recordChangesWithOppositeTypeFromRecordChanges:(id)a3
{
  return (id)objc_msgSend_CKMap_(a3, a2, (uint64_t)&unk_1ED7EFE58, v3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v14 = a3;
  uint64_t v7 = objc_msgSend_recordID(self, v4, v5, v6);
  objc_msgSend_encodeObject_forKey_(v14, v8, (uint64_t)v7, @"recordID");

  uint64_t v12 = objc_msgSend_type(self, v9, v10, v11);
  objc_msgSend_encodeInteger_forKey_(v14, v13, v12, @"type");
}

- (CKSyncEnginePendingRecordZoneChange)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, @"recordID");
  uint64_t v7 = (CKRecordID *)objc_claimAutoreleasedReturnValue();
  recordID = self->_recordID;
  self->_recordID = v7;

  int64_t v11 = objc_msgSend_decodeIntegerForKey_(v4, v9, @"type", v10);
  self->_type = v11;
  unint64_t v13 = self->_recordID;

  return (CKSyncEnginePendingRecordZoneChange *)objc_msgSend_initWithRecordID_type_(self, v12, (uint64_t)v13, v11);
}

- (CKRecordID)recordID
{
  return self->_recordID;
}

- (CKSyncEnginePendingRecordZoneChangeType)type
{
  return self->_type;
}

- (void).cxx_destruct
{
}

@end
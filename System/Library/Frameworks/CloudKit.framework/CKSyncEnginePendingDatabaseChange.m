@interface CKSyncEnginePendingDatabaseChange
+ (BOOL)supportsSecureCoding;
+ (id)databaseChangesWithOppositeTypeFromDatabaseChanges:(id)a3;
+ (void)initialize;
- (BOOL)CKDescriptionShouldPrintPointer;
- (BOOL)isEqual:(id)a3;
- (CKRecordZoneID)zoneID;
- (CKSyncEnginePendingDatabaseChange)initWithCoder:(id)a3;
- (CKSyncEnginePendingDatabaseChange)initWithZoneID:(id)a3 type:(int64_t)a4;
- (CKSyncEnginePendingDatabaseChangeType)type;
- (NSString)description;
- (id)CKDescriptionClassName;
- (id)oppositeTypeChange;
- (id)redactedDescription;
- (unint64_t)hash;
- (void)CKDescribePropertiesUsing:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKSyncEnginePendingDatabaseChange

- (BOOL)isEqual:(id)a3
{
  v4 = (CKSyncEnginePendingDatabaseChange *)a3;
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
      uint64_t v9 = objc_msgSend_type(self, v6, v7, v8);
      if (v9 == objc_msgSend_type(v5, v10, v11, v12))
      {
        v16 = objc_msgSend_zoneID(self, v13, v14, v15);
        v20 = objc_msgSend_zoneID(v5, v17, v18, v19);
        char isEqual = objc_msgSend_isEqual_(v16, v21, (uint64_t)v20, v22);
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

- (CKSyncEnginePendingDatabaseChangeType)type
{
  return self->_type;
}

- (CKSyncEnginePendingDatabaseChange)initWithZoneID:(id)a3 type:(int64_t)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CKSyncEnginePendingDatabaseChange;
  v10 = [(CKSyncEnginePendingDatabaseChange *)&v14 init];
  if (v10)
  {
    uint64_t v11 = objc_msgSend_copy(v6, v7, v8, v9);
    zoneID = v10->_zoneID;
    v10->_zoneID = (CKRecordZoneID *)v11;

    v10->_type = a4;
  }

  return v10;
}

- (unint64_t)hash
{
  uint64_t v5 = objc_msgSend_type(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_zoneID(self, v6, v7, v8);
  unint64_t v13 = objc_msgSend_hash(v9, v10, v11, v12) ^ v5;

  return v13;
}

- (void).cxx_destruct
{
}

+ (void)initialize
{
  v6[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (objc_class *)objc_opt_class();
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  uint64_t v5 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v4, (uint64_t)v6, 2);
  sub_18AF14F44((uint64_t)a1, v3, v5, 0, 1);
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKSyncEnginePendingDatabaseChange *, char *))MEMORY[0x1F4181798])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKSyncEnginePendingDatabaseChange *, char *))MEMORY[0x1F4181798])(self, sel_CKRedactedDescription);
}

- (BOOL)CKDescriptionShouldPrintPointer
{
  return 0;
}

- (id)CKDescriptionClassName
{
  return @"PendingDatabaseChange";
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v8 = a3;
  if (objc_msgSend_type(self, v4, v5, v6)) {
    objc_msgSend_addProperty_value_shouldRedact_(v8, v7, @"type", @"Delete", 0);
  }
  else {
    objc_msgSend_addProperty_value_shouldRedact_(v8, v7, @"type", @"Save", 0);
  }
}

- (id)oppositeTypeChange
{
  uint64_t v6 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, v2, v3);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v6, v7, (uint64_t)a2, (uint64_t)self, @"CKSyncEngineState.m", 1155, @"Subclass must implement %s", "-[CKSyncEnginePendingDatabaseChange oppositeTypeChange]");

  return 0;
}

+ (id)databaseChangesWithOppositeTypeFromDatabaseChanges:(id)a3
{
  return (id)objc_msgSend_CKMap_(a3, a2, (uint64_t)&unk_1ED7F0118, v3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type = self->_type;
  id v5 = a3;
  uint64_t v6 = NSStringFromSelector(sel_type);
  objc_msgSend_encodeInteger_forKey_(v5, v7, type, (uint64_t)v6);

  zoneID = self->_zoneID;
  NSStringFromSelector(sel_zoneID);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v9, (uint64_t)zoneID, (uint64_t)v10);
}

- (CKSyncEnginePendingDatabaseChange)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CKSyncEnginePendingDatabaseChange;
  id v5 = [(CKSyncEnginePendingDatabaseChange *)&v15 init];
  if (v5)
  {
    uint64_t v6 = NSStringFromSelector(sel_type);
    v5->_int64_t type = objc_msgSend_decodeIntegerForKey_(v4, v7, (uint64_t)v6, v8);

    uint64_t v9 = objc_opt_class();
    id v10 = NSStringFromSelector(sel_zoneID);
    uint64_t v12 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v9, (uint64_t)v10);
    zoneID = v5->_zoneID;
    v5->_zoneID = (CKRecordZoneID *)v12;
  }
  return v5;
}

- (CKRecordZoneID)zoneID
{
  return self->_zoneID;
}

@end
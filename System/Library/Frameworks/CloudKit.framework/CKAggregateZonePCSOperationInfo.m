@interface CKAggregateZonePCSOperationInfo
+ (BOOL)supportsSecureCoding;
- (CKAggregateZonePCSOperationInfo)initWithCoder:(id)a3;
- (CKRecordZone)targetZone;
- (NSArray)sourceZoneIDs;
- (void)encodeWithCoder:(id)a3;
- (void)setSourceZoneIDs:(id)a3;
- (void)setTargetZone:(id)a3;
@end

@implementation CKAggregateZonePCSOperationInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x18C12ADA0]();
  v16.receiver = self;
  v16.super_class = (Class)CKAggregateZonePCSOperationInfo;
  [(CKDatabaseOperationInfo *)&v16 encodeWithCoder:v4];
  v9 = objc_msgSend_sourceZoneIDs(self, v6, v7, v8);
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)v9, @"sourceZoneIDs");

  v14 = objc_msgSend_targetZone(self, v11, v12, v13);
  objc_msgSend_encodeObject_forKey_(v4, v15, (uint64_t)v14, @"targetZone");
}

- (CKAggregateZonePCSOperationInfo)initWithCoder:(id)a3
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CKAggregateZonePCSOperationInfo;
  v5 = [(CKDatabaseOperationInfo *)&v21 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x18C12ADA0]();
    uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
    v22[0] = objc_opt_class();
    v22[1] = objc_opt_class();
    v9 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v8, (uint64_t)v22, 2);
    uint64_t v12 = objc_msgSend_setWithArray_(v7, v10, (uint64_t)v9, v11);
    uint64_t v14 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v13, (uint64_t)v12, @"sourceZoneIDs");
    sourceZoneIDs = v5->_sourceZoneIDs;
    v5->_sourceZoneIDs = (NSArray *)v14;

    uint64_t v16 = objc_opt_class();
    uint64_t v18 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v16, @"targetZone");
    targetZone = v5->_targetZone;
    v5->_targetZone = (CKRecordZone *)v18;
  }

  return v5;
}

- (NSArray)sourceZoneIDs
{
  return self->_sourceZoneIDs;
}

- (void)setSourceZoneIDs:(id)a3
{
}

- (CKRecordZone)targetZone
{
  return self->_targetZone;
}

- (void)setTargetZone:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetZone, 0);

  objc_storeStrong((id *)&self->_sourceZoneIDs, 0);
}

@end
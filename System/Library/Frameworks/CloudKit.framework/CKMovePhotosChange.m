@interface CKMovePhotosChange
+ (BOOL)supportsSecureCoding;
- (CKMovePhotosChange)initWithCoder:(id)a3;
- (CKRecord)destinationRecord;
- (CKRecordID)sourceRecordID;
- (CKRoughlyEquivalentProperties)equivalencyProperties;
- (NSString)sourceRecordChangeTag;
- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDestinationRecord:(id)a3;
- (void)setSourceRecordChangeTag:(id)a3;
- (void)setSourceRecordID:(id)a3;
@end

@implementation CKMovePhotosChange

- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  v20[2] = *MEMORY[0x1E4F143B8];
  v9 = objc_msgSend_destinationRecord(self, a2, a3, a4);
  v11 = objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(v9, v10, v7, v6, v5);

  v19[0] = @"sourceID";
  v15 = objc_msgSend_sourceRecordID(self, v12, v13, v14);
  v19[1] = @"dest";
  v20[0] = v15;
  v20[1] = v11;
  v17 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v16, (uint64_t)v20, (uint64_t)v19, 2);

  return v17;
}

- (id)description
{
  return (id)((uint64_t (*)(CKMovePhotosChange *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (CKRoughlyEquivalentProperties)equivalencyProperties
{
  v3 = objc_opt_new();
  BOOL v7 = objc_msgSend_sourceRecordID(self, v4, v5, v6);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)v7, @"sourceRecordID");

  v12 = objc_msgSend_destinationRecord(self, v9, v10, v11);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v13, (uint64_t)v12, @"destinationRecord");

  v17 = objc_msgSend_properties(v3, v14, v15, v16);

  return (CKRoughlyEquivalentProperties *)v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v23 = a3;
  v4 = (void *)MEMORY[0x18C12ADA0]();
  v8 = objc_msgSend_sourceRecordID(self, v5, v6, v7);
  v9 = NSStringFromSelector(sel_sourceRecordID);
  objc_msgSend_encodeObject_forKey_(v23, v10, (uint64_t)v8, (uint64_t)v9);

  uint64_t v14 = objc_msgSend_sourceRecordChangeTag(self, v11, v12, v13);
  uint64_t v15 = NSStringFromSelector(sel_sourceRecordChangeTag);
  objc_msgSend_encodeObject_forKey_(v23, v16, (uint64_t)v14, (uint64_t)v15);

  v20 = objc_msgSend_destinationRecord(self, v17, v18, v19);
  v21 = NSStringFromSelector(sel_destinationRecord);
  objc_msgSend_encodeObject_forKey_(v23, v22, (uint64_t)v20, (uint64_t)v21);
}

- (CKMovePhotosChange)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CKMovePhotosChange;
  uint64_t v5 = [(CKMovePhotosChange *)&v23 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x18C12ADA0]();
    uint64_t v7 = objc_opt_class();
    v8 = NSStringFromSelector(sel_sourceRecordID);
    uint64_t v10 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v9, v7, (uint64_t)v8);
    sourceRecordID = v5->_sourceRecordID;
    v5->_sourceRecordID = (CKRecordID *)v10;

    uint64_t v12 = objc_opt_class();
    uint64_t v13 = NSStringFromSelector(sel_sourceRecordChangeTag);
    uint64_t v15 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v12, (uint64_t)v13);
    sourceRecordChangeTag = v5->_sourceRecordChangeTag;
    v5->_sourceRecordChangeTag = (NSString *)v15;

    uint64_t v17 = objc_opt_class();
    uint64_t v18 = NSStringFromSelector(sel_destinationRecord);
    uint64_t v20 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v19, v17, (uint64_t)v18);
    destinationRecord = v5->_destinationRecord;
    v5->_destinationRecord = (CKRecord *)v20;
  }

  return v5;
}

- (CKRecordID)sourceRecordID
{
  return self->_sourceRecordID;
}

- (void)setSourceRecordID:(id)a3
{
}

- (NSString)sourceRecordChangeTag
{
  return self->_sourceRecordChangeTag;
}

- (void)setSourceRecordChangeTag:(id)a3
{
}

- (CKRecord)destinationRecord
{
  return self->_destinationRecord;
}

- (void)setDestinationRecord:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationRecord, 0);
  objc_storeStrong((id *)&self->_sourceRecordChangeTag, 0);

  objc_storeStrong((id *)&self->_sourceRecordID, 0);
}

@end
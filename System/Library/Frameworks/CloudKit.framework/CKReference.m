@interface CKReference
+ (BOOL)supportsSecureCoding;
+ (int)ckdpReferenceTypeForCKReferenceAction:(unint64_t)a3;
+ (unint64_t)ckReferenceActionForCKDPRecordReferenceType:(int)a3;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (CKRecordID)recordID;
- (CKReference)init;
- (CKReference)initWithCoder:(id)a3;
- (CKReference)initWithRecord:(CKRecord *)record action:(CKReferenceAction)action;
- (CKReference)initWithRecordID:(CKRecordID *)recordID action:(CKReferenceAction)action;
- (CKReferenceAction)referenceAction;
- (NSString)debugDescription;
- (NSString)description;
- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5;
- (id)ckShortDescription;
- (id)initInternal;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setRecordID_modelMutation:(id)a3;
- (void)setReferenceAction_modelMutation:(unint64_t)a3;
@end

@implementation CKReference

+ (void)initialize
{
  v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = self;

  sub_18AF14F44(v3, v2, 0, 0, 0);
}

- (CKReference)init
{
  v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  v4 = [CKException alloc];
  id v6 = (id)objc_msgSend_initWithName_format_(v4, v5, *MEMORY[0x1E4F1C3C8], @"You must call -[%@ initWithRecordID:] or -[%@ initWithRecord:] or -[%@ initWithAsset:]", v3, v3, v3);
  objc_exception_throw(v6);
}

- (id)initInternal
{
  v3.receiver = self;
  v3.super_class = (Class)CKReference;
  return [(CKReference *)&v3 init];
}

- (CKReference)initWithRecordID:(CKRecordID *)recordID action:(CKReferenceAction)action
{
  id v6 = recordID;
  id v30 = 0;
  char v7 = _CKCheckArgument((uint64_t)"recordID", v6, 0, 1, 0, &v30);
  id v8 = v30;
  if ((v7 & 1) == 0)
  {
    v17 = v8;
    v18 = [CKException alloc];
    uint64_t v22 = objc_msgSend_code(v17, v19, v20, v21);
    v26 = objc_msgSend_localizedDescription(v17, v23, v24, v25);
    id v28 = (id)objc_msgSend_initWithCode_format_(v18, v27, v22, @"%@", v26);

    objc_exception_throw(v28);
  }

  v29.receiver = self;
  v29.super_class = (Class)CKReference;
  v9 = [(CKReference *)&v29 init];
  v13 = v9;
  if (v9)
  {
    v9->_referenceAction = action;
    uint64_t v14 = objc_msgSend_copy(v6, v10, v11, v12);
    v15 = v13->_recordID;
    v13->_recordID = (CKRecordID *)v14;
  }
  return v13;
}

- (CKReference)initWithRecord:(CKRecord *)record action:(CKReferenceAction)action
{
  id v6 = record;
  id v28 = 0;
  char v7 = _CKCheckArgument((uint64_t)"record", v6, 0, 0, 0, &v28);
  id v8 = v28;
  if ((v7 & 1) == 0)
  {
    v16 = v8;
    v17 = [CKException alloc];
    uint64_t v21 = objc_msgSend_code(v16, v18, v19, v20);
    uint64_t v25 = objc_msgSend_localizedDescription(v16, v22, v23, v24);
    id v27 = (id)objc_msgSend_initWithCode_format_(v17, v26, v21, @"%@", v25);

    objc_exception_throw(v27);
  }

  uint64_t v12 = objc_msgSend_recordID(v6, v9, v10, v11);
  uint64_t v14 = (CKReference *)objc_msgSend_initWithRecordID_action_(self, v13, (uint64_t)v12, action);

  return v14;
}

- (void)setRecordID_modelMutation:(id)a3
{
  v5 = (CKRecordID *)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3);
  recordID = self->_recordID;
  self->_recordID = v5;

  MEMORY[0x1F41817F8](v5, recordID);
}

- (void)setReferenceAction_modelMutation:(unint64_t)a3
{
  self->_referenceAction = a3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CKReference *)a3;
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
      uint64_t v9 = objc_msgSend_referenceAction(self, v6, v7, v8);
      if (v9 == objc_msgSend_referenceAction(v5, v10, v11, v12))
      {
        v16 = objc_msgSend_recordID(self, v13, v14, v15);
        uint64_t v20 = objc_msgSend_recordID(v5, v17, v18, v19);
        if (v16 == (void *)v20)
        {
          char isEqual = 1;
          uint64_t v24 = v16;
        }
        else
        {
          uint64_t v24 = (void *)v20;
          uint64_t v25 = objc_msgSend_recordID(self, v21, v22, v23);
          objc_super v29 = objc_msgSend_recordID(v5, v26, v27, v28);
          char isEqual = objc_msgSend_isEqual_(v25, v30, (uint64_t)v29, v31);
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

- (unint64_t)hash
{
  v4 = objc_msgSend_recordID(self, a2, v2, v3);
  unint64_t v8 = objc_msgSend_hash(v4, v5, v6, v7);

  return v8;
}

- (NSString)debugDescription
{
  uint64_t v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)CKReference;
  v4 = [(CKReference *)&v13 description];
  unint64_t v8 = objc_msgSend_recordID(self, v5, v6, v7);
  uint64_t v11 = objc_msgSend_stringWithFormat_(v3, v9, @"[%@ recordID=\"%@\"]", v10, v4, v8);

  return (NSString *)v11;
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKReference *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (id)ckShortDescription
{
  v4 = objc_msgSend_recordID(self, a2, v2, v3);
  unint64_t v8 = objc_msgSend_ckShortDescription(v4, v5, v6, v7);

  return v8;
}

- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5
{
  v15[2] = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    if (a5)
    {
      v14[0] = @"type";
      v14[1] = @"recordID";
      v15[0] = @"reference";
      v5 = objc_msgSend_recordID(self, a2, a3, a4);
      uint64_t v7 = objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(v5, v6, 1, 1, 1);
      v15[1] = v7;
      uint64_t v9 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v8, (uint64_t)v15, (uint64_t)v14, 2);
    }
    else
    {
      uint64_t v12 = @"recordID";
      v5 = objc_msgSend_recordID(self, a2, a3, a4);
      objc_super v13 = v5;
      uint64_t v9 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v10, (uint64_t)&v13, (uint64_t)&v12, 1);
    }
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v15 = a3;
  v4 = (void *)MEMORY[0x18C12ADA0]();
  unint64_t v8 = objc_msgSend_recordID(self, v5, v6, v7);
  objc_msgSend_encodeObject_forKey_(v15, v9, (uint64_t)v8, @"recordID");

  uint64_t v13 = objc_msgSend_referenceAction(self, v10, v11, v12);
  objc_msgSend_encodeInt64_forKey_(v15, v14, v13, @"referenceAction");
}

- (CKReference)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_decodeInt64ForKey_(v4, v5, @"referenceAction", v6);
  unint64_t v8 = (void *)MEMORY[0x18C12ADA0]();
  uint64_t v9 = objc_opt_class();
  uint64_t v11 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v10, v9, @"recordID");
  uint64_t v13 = (CKReference *)objc_msgSend_initWithRecordID_action_(self, v12, (uint64_t)v11, v7);

  return v13;
}

- (CKReferenceAction)referenceAction
{
  return self->_referenceAction;
}

- (CKRecordID)recordID
{
  return self->_recordID;
}

- (void).cxx_destruct
{
}

+ (unint64_t)ckReferenceActionForCKDPRecordReferenceType:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    id v4 = [CKException alloc];
    id v6 = (id)objc_msgSend_initWithCode_format_(v4, v5, 12, @"Unexpected reference type");
    objc_exception_throw(v6);
  }
  return qword_18B1F3CC8[a3 - 1];
}

+ (int)ckdpReferenceTypeForCKReferenceAction:(unint64_t)a3
{
  if (a3 == 2) {
    int v3 = 3;
  }
  else {
    int v3 = 2;
  }
  if (a3 == 1) {
    return 1;
  }
  else {
    return v3;
  }
}

@end
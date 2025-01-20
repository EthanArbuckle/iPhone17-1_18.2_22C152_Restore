@interface CKMergeableDeltaID
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CKMergeableDeltaID)init;
- (CKMergeableDeltaID)initWithCoder:(id)a3;
- (CKMergeableDeltaID)initWithDeltaIdentifier:(id)a3 valueID:(id)a4;
- (CKMergeableValueID)valueID;
- (NSString)deltaIdentifier;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKMergeableDeltaID

- (CKMergeableDeltaID)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  objc_msgSend_raise_format_(v3, v6, v4, @"%@ is unavailable", v5);

  return 0;
}

- (CKMergeableDeltaID)initWithDeltaIdentifier:(id)a3 valueID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v37 = 0;
  char v8 = _CKCheckArgument((uint64_t)"deltaIdentifier", v6, 0, 0, 0, &v37);
  id v9 = v37;
  if ((v8 & 1) == 0
    || (v9,
        id v36 = 0,
        char v10 = _CKCheckArgument((uint64_t)"valueID", v7, 0, 0, 0, &v36),
        id v9 = v36,
        (v10 & 1) == 0))
  {
    v23 = v9;
    v24 = [CKException alloc];
    uint64_t v28 = objc_msgSend_code(v23, v25, v26, v27);
    v32 = objc_msgSend_localizedDescription(v23, v29, v30, v31);
    id v34 = (id)objc_msgSend_initWithCode_format_(v24, v33, v28, @"%@", v32);

    objc_exception_throw(v34);
  }

  v35.receiver = self;
  v35.super_class = (Class)CKMergeableDeltaID;
  v14 = [(CKMergeableDeltaID *)&v35 init];
  if (v14)
  {
    uint64_t v15 = objc_msgSend_copy(v6, v11, v12, v13);
    deltaIdentifier = v14->_deltaIdentifier;
    v14->_deltaIdentifier = (NSString *)v15;

    uint64_t v20 = objc_msgSend_copy(v7, v17, v18, v19);
    valueID = v14->_valueID;
    v14->_valueID = (CKMergeableValueID *)v20;
  }
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (CKMergeableDeltaID *)a3;
  if (self == v4)
  {
    char isEqual = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_msgSend_deltaIdentifier(self, v5, v6, v7),
          char v8 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend_deltaIdentifier(v4, v9, v10, v11),
          uint64_t v12 = objc_claimAutoreleasedReturnValue(),
          int v15 = objc_msgSend_isEqual_(v8, v13, (uint64_t)v12, v14),
          v12,
          v8,
          v15))
    {
      uint64_t v19 = objc_msgSend_valueID(self, v16, v17, v18);
      v23 = objc_msgSend_valueID(v4, v20, v21, v22);
      char isEqual = objc_msgSend_isEqual_(v19, v24, (uint64_t)v23, v25);
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
  v5 = objc_msgSend_deltaIdentifier(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_hash(v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_valueID(self, v10, v11, v12);
  unint64_t v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKMergeableDeltaID)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x18C12ADA0]();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = NSStringFromSelector(sel_deltaIdentifier);
  uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v6, (uint64_t)v7);

  uint64_t v10 = objc_opt_class();
  uint64_t v11 = NSStringFromSelector(sel_valueID);
  uint64_t v13 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v10, (uint64_t)v11);

  uint64_t v15 = (CKMergeableDeltaID *)objc_msgSend_initWithDeltaIdentifier_valueID_(self, v14, (uint64_t)v9, (uint64_t)v13);

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v17 = a3;
  id v4 = (void *)MEMORY[0x18C12ADA0]();
  uint64_t v8 = objc_msgSend_deltaIdentifier(self, v5, v6, v7);
  uint64_t v9 = NSStringFromSelector(sel_deltaIdentifier);
  objc_msgSend_encodeObject_forKey_(v17, v10, (uint64_t)v8, (uint64_t)v9);

  uint64_t v14 = objc_msgSend_valueID(self, v11, v12, v13);
  uint64_t v15 = NSStringFromSelector(sel_valueID);
  objc_msgSend_encodeObject_forKey_(v17, v16, (uint64_t)v14, (uint64_t)v15);
}

- (NSString)deltaIdentifier
{
  return self->_deltaIdentifier;
}

- (CKMergeableValueID)valueID
{
  return self->_valueID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueID, 0);

  objc_storeStrong((id *)&self->_deltaIdentifier, 0);
}

@end
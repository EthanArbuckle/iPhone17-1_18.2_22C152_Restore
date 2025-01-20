@interface CKReplaceDeltasRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)replacementDeltasContainNewData;
- (CKMergeableValueID)valueID;
- (CKReplaceDeltasRequest)init;
- (CKReplaceDeltasRequest)initWithCoder:(id)a3;
- (CKReplaceDeltasRequest)initWithValueID:(id)a3 deltaIdentifiersToReplace:(id)a4 replacementDeltas:(id)a5 replacementDeltasContainNewData:(BOOL)a6;
- (CKRoughlyEquivalentProperties)equivalencyProperties;
- (NSArray)deltaIdentifiersToReplace;
- (NSArray)replacementDeltas;
- (NSString)description;
- (id)redactedDescription;
- (unint64_t)hash;
- (void)CKDescribePropertiesUsing:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKReplaceDeltasRequest

- (CKReplaceDeltasRequest)initWithValueID:(id)a3 deltaIdentifiersToReplace:(id)a4 replacementDeltas:(id)a5 replacementDeltasContainNewData:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v49 = 0;
  char v13 = _CKCheckArgument((uint64_t)"valueID", v10, 0, 0, 0, &v49);
  id v14 = v49;
  if ((v13 & 1) == 0) {
    goto LABEL_7;
  }

  id v48 = 0;
  char v15 = _CKCheckArgument((uint64_t)"deltaIdentifiersToReplace", v11, 0, 0, 0, &v48);
  id v14 = v48;
  if ((v15 & 1) == 0
    || (v14,
        id v47 = 0,
        char v16 = _CKCheckArgument((uint64_t)"replacementDeltas", v12, 0, 0, 0, &v47),
        id v14 = v47,
        (v16 & 1) == 0))
  {
LABEL_7:
    v34 = v14;
    v35 = [CKException alloc];
    uint64_t v39 = objc_msgSend_code(v34, v36, v37, v38);
    v43 = objc_msgSend_localizedDescription(v34, v40, v41, v42);
    id v45 = (id)objc_msgSend_initWithCode_format_(v35, v44, v39, @"%@", v43);

    objc_exception_throw(v45);
  }

  v46.receiver = self;
  v46.super_class = (Class)CKReplaceDeltasRequest;
  v20 = [(CKReplaceDeltasRequest *)&v46 init];
  if (v20)
  {
    uint64_t v21 = objc_msgSend_copy(v10, v17, v18, v19);
    valueID = v20->_valueID;
    v20->_valueID = (CKMergeableValueID *)v21;

    uint64_t v26 = objc_msgSend_copy(v11, v23, v24, v25);
    deltaIdentifiersToReplace = v20->_deltaIdentifiersToReplace;
    v20->_deltaIdentifiersToReplace = (NSArray *)v26;

    uint64_t v31 = objc_msgSend_copy(v12, v28, v29, v30);
    replacementDeltas = v20->_replacementDeltas;
    v20->_replacementDeltas = (NSArray *)v31;

    v20->_replacementDeltasContainNewData = a6;
  }

  return v20;
}

- (CKReplaceDeltasRequest)init
{
  v3 = [CKException alloc];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = NSStringFromSelector(a2);
  id v9 = (id)objc_msgSend_initWithName_format_(v3, v8, v4, @"-[%@ %@] is unavailable", v6, v7);

  objc_exception_throw(v9);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (CKReplaceDeltasRequest *)a3;
  if (self == v4)
  {
    char v44 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_7;
    }
    int v8 = objc_msgSend_replacementDeltasContainNewData(self, v5, v6, v7);
    if (v8 != objc_msgSend_replacementDeltasContainNewData(v4, v9, v10, v11)) {
      goto LABEL_7;
    }
    char v15 = objc_msgSend_valueID(self, v12, v13, v14);
    uint64_t v19 = objc_msgSend_valueID(v4, v16, v17, v18);
    int isEqual = objc_msgSend_isEqual_(v15, v20, (uint64_t)v19, v21);

    if (!isEqual) {
      goto LABEL_7;
    }
    uint64_t v26 = objc_msgSend_deltaIdentifiersToReplace(self, v23, v24, v25);
    uint64_t v30 = objc_msgSend_deltaIdentifiersToReplace(v4, v27, v28, v29);
    int v33 = objc_msgSend_isEqual_(v26, v31, (uint64_t)v30, v32);

    if (v33)
    {
      uint64_t v37 = objc_msgSend_replacementDeltas(self, v34, v35, v36);
      uint64_t v41 = objc_msgSend_replacementDeltas(v4, v38, v39, v40);
      char v44 = objc_msgSend_isEqual_(v37, v42, (uint64_t)v41, v43);
    }
    else
    {
LABEL_7:
      char v44 = 0;
    }
  }

  return v44;
}

- (unint64_t)hash
{
  v5 = objc_msgSend_valueID(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_hash(v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_deltaIdentifiersToReplace(self, v10, v11, v12);
  uint64_t v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;
  uint64_t v21 = objc_msgSend_replacementDeltas(self, v18, v19, v20);
  uint64_t v25 = v17 ^ objc_msgSend_hash(v21, v22, v23, v24);
  unint64_t v29 = v25 ^ objc_msgSend_replacementDeltasContainNewData(self, v26, v27, v28);

  return v29;
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_valueID(self, v5, v6, v7);
  objc_msgSend_addProperty_value_shouldRedact_(v4, v9, @"valueID", (uint64_t)v8, 0);

  uint64_t v13 = objc_msgSend_deltaIdentifiersToReplace(self, v10, v11, v12);
  objc_msgSend_addProperty_value_shouldRedact_(v4, v14, @"deltaIdentifiersToReplace", (uint64_t)v13, 0);

  uint64_t v18 = objc_msgSend_replacementDeltas(self, v15, v16, v17);
  objc_msgSend_addProperty_value_shouldRedact_(v4, v19, @"replacementDeltas", (uint64_t)v18, 0);

  uint64_t v20 = NSNumber;
  uint64_t v24 = objc_msgSend_replacementDeltasContainNewData(self, v21, v22, v23);
  objc_msgSend_numberWithBool_(v20, v25, v24, v26);
  id v28 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v4, v27, @"replacementDeltasContainNewData", (uint64_t)v28, 0);
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKReplaceDeltasRequest *, char *))MEMORY[0x1F4181798])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKReplaceDeltasRequest *, char *))MEMORY[0x1F4181798])(self, sel_CKRedactedDescription);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKReplaceDeltasRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = NSStringFromSelector(sel_valueID);
  uint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, (uint64_t)v6);

  uint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v14 = objc_msgSend_setWithObjects_(v9, v12, v10, v13, v11, 0);
  uint64_t v15 = NSStringFromSelector(sel_deltaIdentifiersToReplace);
  uint64_t v17 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v16, (uint64_t)v14, (uint64_t)v15);

  uint64_t v18 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  uint64_t v23 = objc_msgSend_setWithObjects_(v18, v21, v19, v22, v20, 0);
  uint64_t v24 = NSStringFromSelector(sel_replacementDeltas);
  uint64_t v26 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v25, (uint64_t)v23, (uint64_t)v24);

  uint64_t v27 = NSStringFromSelector(sel_replacementDeltasContainNewData);
  uint64_t v30 = objc_msgSend_decodeBoolForKey_(v4, v28, (uint64_t)v27, v29);

  uint64_t v32 = (CKReplaceDeltasRequest *)objc_msgSend_initWithValueID_deltaIdentifiersToReplace_replacementDeltas_replacementDeltasContainNewData_(self, v31, (uint64_t)v8, (uint64_t)v17, v26, v30);
  return v32;
}

- (void)encodeWithCoder:(id)a3
{
  id v29 = a3;
  id v4 = (void *)MEMORY[0x18C12ADA0]();
  uint64_t v8 = objc_msgSend_valueID(self, v5, v6, v7);
  uint64_t v9 = NSStringFromSelector(sel_valueID);
  objc_msgSend_encodeObject_forKey_(v29, v10, (uint64_t)v8, (uint64_t)v9);

  uint64_t v14 = objc_msgSend_deltaIdentifiersToReplace(self, v11, v12, v13);
  uint64_t v15 = NSStringFromSelector(sel_deltaIdentifiersToReplace);
  objc_msgSend_encodeObject_forKey_(v29, v16, (uint64_t)v14, (uint64_t)v15);

  uint64_t v20 = objc_msgSend_replacementDeltas(self, v17, v18, v19);
  uint64_t v21 = NSStringFromSelector(sel_replacementDeltas);
  objc_msgSend_encodeObject_forKey_(v29, v22, (uint64_t)v20, (uint64_t)v21);

  uint64_t v26 = objc_msgSend_replacementDeltasContainNewData(self, v23, v24, v25);
  uint64_t v27 = NSStringFromSelector(sel_replacementDeltasContainNewData);
  objc_msgSend_encodeBool_forKey_(v29, v28, v26, (uint64_t)v27);
}

- (CKRoughlyEquivalentProperties)equivalencyProperties
{
  uint64_t v3 = objc_opt_new();
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_msgSend_deltaIdentifiersToReplace(self, v5, v6, v7);
  uint64_t v11 = objc_msgSend_setWithArray_(v4, v9, (uint64_t)v8, v10);
  objc_msgSend_addPlistObject_forKey_(v3, v12, (uint64_t)v11, @"ids");

  uint64_t v16 = objc_msgSend_valueID(self, v13, v14, v15);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v17, (uint64_t)v16, @"valueID");

  uint64_t v21 = objc_msgSend_properties(v3, v18, v19, v20);

  return (CKRoughlyEquivalentProperties *)v21;
}

- (CKMergeableValueID)valueID
{
  return self->_valueID;
}

- (NSArray)deltaIdentifiersToReplace
{
  return self->_deltaIdentifiersToReplace;
}

- (NSArray)replacementDeltas
{
  return self->_replacementDeltas;
}

- (BOOL)replacementDeltasContainNewData
{
  return self->_replacementDeltasContainNewData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replacementDeltas, 0);
  objc_storeStrong((id *)&self->_deltaIdentifiersToReplace, 0);

  objc_storeStrong((id *)&self->_valueID, 0);
}

@end
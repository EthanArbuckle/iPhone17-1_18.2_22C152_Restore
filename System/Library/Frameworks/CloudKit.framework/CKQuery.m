@interface CKQuery
+ (BOOL)supportsSecureCoding;
+ (id)copySortDescriptor:(id)a3;
+ (void)initialize;
- (CKQuery)init;
- (CKQuery)initWithCoder:(NSCoder *)aDecoder;
- (CKQuery)initWithRecordType:(CKRecordType)recordType predicate:(NSPredicate *)predicate;
- (CKRecordType)recordType;
- (CKRoughlyEquivalentProperties)equivalencyProperties;
- (NSArray)sortDescriptors;
- (NSPredicate)predicate;
- (id)CKPropertiesDescription;
- (id)_predicateWithoutCopy;
- (id)_sortDescriptorsWithoutCopy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (void)_setPredicate:(id)a3;
- (void)_setRecordType:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setSortDescriptors:(NSArray *)sortDescriptors;
@end

@implementation CKQuery

+ (void)initialize
{
  v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = self;

  sub_18AF14F44(v3, v2, 0, 0, 0);
}

- (CKQuery)init
{
  v2 = [CKException alloc];
  uint64_t v3 = *MEMORY[0x1E4F1C3C8];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v7 = (id)objc_msgSend_initWithName_format_(v2, v6, v3, @"You must call -[%@ initWithRecordType:predicate:sortDescriptors:]", v5);

  objc_exception_throw(v7);
}

- (CKQuery)initWithRecordType:(CKRecordType)recordType predicate:(NSPredicate *)predicate
{
  v6 = recordType;
  id v7 = predicate;
  id v33 = 0;
  char v8 = _CKCheckArgument((uint64_t)"recordType", v6, 1, 1, 0, &v33);
  id v9 = v33;
  if ((v8 & 1) == 0)
  {
    v17 = v9;
    v18 = [CKException alloc];
    uint64_t v22 = objc_msgSend_code(v17, v19, v20, v21);
    v26 = objc_msgSend_localizedDescription(v17, v23, v24, v25);
    id v28 = (id)objc_msgSend_initWithCode_format_(v18, v27, v22, @"%@", v26);

    objc_exception_throw(v28);
  }

  if (!v7)
  {
    v29 = [CKException alloc];
    id v31 = (id)objc_msgSend_initWithCode_format_(v29, v30, 12, @"predicate can not be nil. Use [NSPredicate predicateWithFormat:@\"TRUEPREDICATE\"] to query for all records of a given type");
    objc_exception_throw(v31);
  }
  v32.receiver = self;
  v32.super_class = (Class)CKQuery;
  v10 = [(CKQuery *)&v32 init];
  v13 = v10;
  if (v10)
  {
    objc_msgSend__setRecordType_(v10, v11, (uint64_t)v6, v12);
    objc_msgSend__setPredicate_(v13, v14, (uint64_t)v7, v15);
  }

  return v13;
}

+ (id)copySortDescriptor:(id)a3
{
  id v3 = a3;
  id v7 = (id)objc_msgSend_copy(v3, v4, v5, v6);
  if (v7 == v3)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F29008]);
    uint64_t v12 = objc_msgSend_key(v3, v9, v10, v11);
    uint64_t v16 = objc_msgSend_ascending(v3, v13, v14, v15);
    id v7 = (id)objc_msgSend_initWithKey_ascending_(v8, v17, (uint64_t)v12, v16);
  }
  return v7;
}

- (CKRoughlyEquivalentProperties)equivalencyProperties
{
  id v3 = objc_opt_new();
  id v7 = objc_msgSend_recordType(self, v4, v5, v6);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)v7, @"recordType");

  uint64_t v12 = objc_msgSend_predicate(self, v9, v10, v11);
  uint64_t v16 = objc_msgSend_predicateFormat(v12, v13, v14, v15);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v17, (uint64_t)v16, @"predicate");

  uint64_t v21 = objc_msgSend_properties(v3, v18, v19, v20);

  return (CKRoughlyEquivalentProperties *)v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [CKQuery alloc];
  id v8 = objc_msgSend_recordType(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend__predicateWithoutCopy(self, v9, v10, v11);
  uint64_t v14 = objc_msgSend_initWithRecordType_predicate_(v4, v13, (uint64_t)v8, (uint64_t)v12);

  uint64_t v18 = objc_msgSend__sortDescriptorsWithoutCopy(self, v15, v16, v17);
  uint64_t v19 = (void *)v14[2];
  v14[2] = v18;

  return v14;
}

- (void)_setRecordType:(id)a3
{
  id v15 = a3;
  if (!objc_msgSend_length(v15, v4, v5, v6))
  {
    uint64_t v12 = [CKException alloc];
    id v14 = (id)objc_msgSend_initWithName_format_(v12, v13, *MEMORY[0x1E4F1C3C8], @"Query must have a valid recordType");
    objc_exception_throw(v14);
  }
  uint64_t v10 = (NSString *)objc_msgSend_copy(v15, v7, v8, v9);
  recordType = self->_recordType;
  self->_recordType = v10;
}

- (void)setSortDescriptors:(NSArray *)sortDescriptors
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v4 = sortDescriptors;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v25 = [CKException alloc];
      id v27 = (id)objc_msgSend_initWithCode_format_(v25, v26, 12, @"sortDescriptors must be an array");
      objc_exception_throw(v27);
    }
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v5 = v4;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v29, (uint64_t)v33, 16);
  if (v7)
  {
    uint64_t v8 = *(void *)v30;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            uint64_t v16 = [CKException alloc];
            uint64_t v17 = (objc_class *)objc_opt_class();
            uint64_t v18 = NSStringFromClass(v17);
            uint64_t v19 = (objc_class *)objc_opt_class();
            uint64_t v20 = NSStringFromClass(v19);
            uint64_t v21 = (objc_class *)objc_opt_class();
            uint64_t v22 = NSStringFromClass(v21);
            id v24 = (id)objc_msgSend_initWithCode_format_(v16, v23, 12, @"sortDescriptor items must be of class %@ or %@, not %@", v18, v20, v22);

            objc_exception_throw(v24);
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v10, (uint64_t)&v29, (uint64_t)v33, 16);
    }
    while (v7);
  }

  uint64_t v11 = self;
  objc_sync_enter(v11);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = sub_18B04CC24;
  v28[3] = &unk_1E5461F58;
  v28[4] = v11;
  uint64_t v14 = objc_msgSend_CKDeepCopyWithLeafNodeCopyBlock_(v5, v12, (uint64_t)v28, v13);
  id v15 = v11->_sortDescriptors;
  v11->_sortDescriptors = (NSArray *)v14;

  objc_sync_exit(v11);
}

- (NSArray)sortDescriptors
{
  v2 = self;
  objc_sync_enter(v2);
  sortDescriptors = v2->_sortDescriptors;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_18B04CD38;
  v8[3] = &unk_1E5461F58;
  v8[4] = v2;
  uint64_t v6 = objc_msgSend_CKDeepCopyWithLeafNodeCopyBlock_(sortDescriptors, v4, (uint64_t)v8, v5);
  objc_sync_exit(v2);

  return (NSArray *)v6;
}

- (id)_sortDescriptorsWithoutCopy
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_sortDescriptors;
  objc_sync_exit(v2);

  return v3;
}

- (void)_setPredicate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x18C12ADA0]();
  if (CKCurrentProcessLinkChecke0fc00bd437646efa0e6635c2beaaea9()) {
    goto LABEL_4;
  }
  predicate = objc_msgSend_sharedValidator(CKPredicateValidator, v6, v7, v8);
  id v18 = 0;
  char v11 = objc_msgSend_validate_error_(predicate, v10, (uint64_t)v4, (uint64_t)&v18);
  id v12 = v18;
  uint64_t v13 = v12;
  if (v11)
  {

LABEL_4:
    objc_msgSend_CKDeepCopy(v4, v6, v7, v8);
    uint64_t v14 = (NSPredicate *)objc_claimAutoreleasedReturnValue();
    predicate = self->_predicate;
    self->_predicate = v14;
    goto LABEL_7;
  }
  if (CKShouldUseNewPredicateValidation())
  {
    id v15 = [CKException alloc];
    id v17 = (id)objc_msgSend_initWithCode_format_(v15, v16, 12, @"Invalid predicate: %@ (%@)", v4, v13);
    objc_exception_throw(v17);
  }

LABEL_7:
}

- (NSPredicate)predicate
{
  return (NSPredicate *)objc_msgSend_CKDeepCopy(self->_predicate, a2, v2, v3);
}

- (id)_predicateWithoutCopy
{
  return self->_predicate;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKQuery)initWithCoder:(NSCoder *)aDecoder
{
  id v4 = aDecoder;
  v29.receiver = self;
  v29.super_class = (Class)CKQuery;
  uint64_t v5 = [(CKQuery *)&v29 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x18C12ADA0]();
    uint64_t v7 = CKAcceptablePredicateValueClasses();
    uint64_t v9 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v8, (uint64_t)v7, @"predicateData");
    objc_msgSend__setPredicate_(v5, v10, (uint64_t)v9, v11);

    id v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    id v18 = objc_msgSend_setWithObjects_(v12, v16, v13, v17, v14, v15, 0);
    uint64_t v20 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v19, (uint64_t)v18, @"sortDescriptorsData");
    objc_msgSend_setSortDescriptors_(v5, v21, (uint64_t)v20, v22);

    uint64_t v23 = objc_opt_class();
    uint64_t v25 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v24, v23, @"recordType");
    objc_msgSend__setRecordType_(v5, v26, (uint64_t)v25, v27);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v20 = a3;
  id v4 = (void *)MEMORY[0x18C12ADA0]();
  uint64_t v8 = objc_msgSend__sortDescriptorsWithoutCopy(self, v5, v6, v7);
  objc_msgSend_encodeObject_forKey_(v20, v9, (uint64_t)v8, @"sortDescriptorsData");

  uint64_t v13 = objc_msgSend__predicateWithoutCopy(self, v10, v11, v12);
  objc_msgSend_encodeObject_forKey_(v20, v14, (uint64_t)v13, @"predicateData");

  id v18 = objc_msgSend_recordType(self, v15, v16, v17);
  objc_msgSend_encodeObject_forKey_(v20, v19, (uint64_t)v18, @"recordType");
}

- (id)debugDescription
{
  uint64_t v5 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v6 = objc_msgSend_description(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_stringWithString_(v5, v7, (uint64_t)v6, v8);

  uint64_t v13 = objc_msgSend__sortDescriptorsWithoutCopy(self, v10, v11, v12);
  uint64_t v17 = v13;
  if (v13)
  {
    id v18 = objc_msgSend_description(v13, v14, v15, v16);
    id v21 = (id)objc_msgSend_stringByAppendingString_(v9, v19, (uint64_t)v18, v20);
  }

  return v9;
}

- (id)CKPropertiesDescription
{
  uint64_t v5 = NSString;
  uint64_t v6 = objc_msgSend_recordType(self, a2, v2, v3);
  uint64_t v10 = objc_msgSend__predicateWithoutCopy(self, v7, v8, v9);
  uint64_t v13 = objc_msgSend_stringWithFormat_(v5, v11, @"recordType=%@, predicate=%@", v12, v6, v10);

  return v13;
}

- (id)description
{
  return (id)((uint64_t (*)(CKQuery *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (CKRecordType)recordType
{
  return (CKRecordType)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordType, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);

  objc_storeStrong((id *)&self->_predicate, 0);
}

@end
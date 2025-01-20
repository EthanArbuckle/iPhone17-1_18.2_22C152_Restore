@interface CKDistributedTimestampImmutableClockVector
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
- (BOOL)hasTimestampsNotInVector:(id)a3;
- (BOOL)includesTimestamp:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGreaterThanOrEqualToVector:(id)a3;
- (CKDistributedTimestampAttributedVector)backingVector;
- (CKDistributedTimestampImmutableClockVector)init;
- (CKDistributedTimestampImmutableClockVector)initWithCoder:(id)a3;
- (id)allSiteIdentifiers;
- (id)clockValuesForSiteIdentifier:(id)a3;
- (id)clockVector;
- (id)copy;
- (id)debugDescription;
- (id)description;
- (id)descriptionWithStringSiteIdentifiers:(BOOL)a3 usingSuperscripts:(BOOL)a4;
- (id)mutableCopy;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)vectorFillingInImplicitClockValuesUsingSiteIdentifiers:(id)a3;
- (id)vectorFilteredByClockType:(unsigned __int8)a3;
- (id)vectorFilteredByModifier:(id)a3;
- (id)vectorFilteredBySiteIdentifiers:(id)a3;
- (int64_t)compareToVector:(id)a3;
- (unint64_t)hash;
- (unint64_t)timestampCount;
- (unint64_t)timestampCountForSiteIdentifier:(id)a3;
- (unsigned)clockTypeForTimestamp:(id)a3;
- (unsigned)vectorExpansionState;
- (void)__setBackingStateNoCopy:(id)a3;
- (void)_setBackingState:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateAllClockValuesUsingBlock:(id)a3;
- (void)enumerateClockValuesForSiteIdentifier:(id)a3 usingBlock:(id)a4;
@end

@implementation CKDistributedTimestampImmutableClockVector

+ (void)initialize
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v3 = (objc_class *)objc_opt_class();
  v6[0] = objc_opt_class();
  v5 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v4, (uint64_t)v6, 1);
  sub_18AF14F44((uint64_t)a1, v3, v5, 0, 1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKDistributedTimestampImmutableClockVector)init
{
  v7.receiver = self;
  v7.super_class = (Class)CKDistributedTimestampImmutableClockVector;
  v2 = [(CKDistributedTimestampImmutableClockVector *)&v7 init];
  if (v2)
  {
    v3 = objc_opt_new();
    objc_msgSend__setBackingState_(v2, v4, (uint64_t)v3, v5);
  }
  return v2;
}

- (CKDistributedTimestampImmutableClockVector)initWithCoder:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CKDistributedTimestampImmutableClockVector;
  uint64_t v5 = [(CKDistributedTimestampImmutableClockVector *)&v29 init];
  if (!v5) {
    goto LABEL_11;
  }
  uint64_t v6 = objc_opt_class();
  v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"backingVectorProtobuf");
  if (!v8)
  {
    uint64_t v22 = objc_opt_class();
    v12 = NSStringFromSelector(sel_backingVector);
    v24 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v23, v22, (uint64_t)v12);
    objc_msgSend__setBackingState_(v5, v25, (uint64_t)v24, v26);

    goto LABEL_10;
  }
  v9 = [CKDPDistributedTimestamps alloc];
  v12 = objc_msgSend_initWithData_(v9, v10, (uint64_t)v8, v11);
  id v28 = 0;
  v14 = objc_msgSend_attributedVectorFromPDistributedTimestamps_error_(CKDistributedTimestampAttributedVector, v13, (uint64_t)v12, (uint64_t)&v28);
  id v15 = v28;
  objc_msgSend__setBackingState_(v5, v16, (uint64_t)v14, v17);

  if (!v15)
  {
LABEL_10:

LABEL_11:
    v21 = v5;
    goto LABEL_12;
  }
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v18 = ck_log_facility_distributed_sync;
  if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v31 = v15;
    _os_log_error_impl(&dword_18AF10000, v18, OS_LOG_TYPE_ERROR, "Error initializing distributed timestamp vector from data in coder: %@", buf, 0xCu);
  }
  objc_msgSend_failWithError_(v4, v19, (uint64_t)v15, v20);

  v21 = 0;
LABEL_12:

  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  id v17 = a3;
  id v4 = (void *)MEMORY[0x18C12ADA0]();
  v8 = objc_msgSend_backingVector(self, v5, v6, v7);
  uint64_t v11 = objc_msgSend_pDistributedTimestampsFromAttributedVector_(CKDistributedTimestampAttributedVector, v9, (uint64_t)v8, v10);

  id v15 = objc_msgSend_data(v11, v12, v13, v14);
  objc_msgSend_encodeObject_forKey_(v17, v16, (uint64_t)v15, @"backingVectorProtobuf");
}

- (void)_setBackingState:(id)a3
{
  id v7 = (id)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3);
  objc_msgSend___setBackingStateNoCopy_(self, v5, (uint64_t)v7, v6);
}

- (void)__setBackingStateNoCopy:(id)a3
{
}

- (id)copy
{
  return (id)objc_msgSend_copyWithZone_(self, a2, 0, v2);
}

- (id)mutableCopy
{
  return (id)((uint64_t (*)(CKDistributedTimestampImmutableClockVector *, char *, void))MEMORY[0x1F4181798])(self, sel_mutableCopyWithZone_, 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = objc_opt_new();
  v8 = objc_msgSend_backingVector(self, v5, v6, v7);
  objc_msgSend__setBackingState_(v4, v9, (uint64_t)v8, v10);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CKDistributedTimestampImmutableClockVector *)a3;
  if (self == v4)
  {
    char isEqual = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      v9 = objc_msgSend_backingVector(self, v6, v7, v8);
      objc_sync_enter(v9);
      uint64_t v13 = objc_msgSend_backingVector(v5, v10, v11, v12);
      objc_sync_enter(v13);
      id v17 = objc_msgSend_backingVector(self, v14, v15, v16);
      v24 = objc_msgSend_backingVector(v5, v18, v19, v20);
      if (v17 == v24)
      {
        char isEqual = 1;
      }
      else
      {
        v25 = objc_msgSend_backingVector(self, v21, v22, v23);
        objc_super v29 = objc_msgSend_backingVector(v5, v26, v27, v28);
        char isEqual = objc_msgSend_isEqual_(v25, v30, (uint64_t)v29, v31);
      }
      objc_sync_exit(v13);

      objc_sync_exit(v9);
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
  id v4 = objc_msgSend_backingVector(self, a2, v2, v3);
  unint64_t v8 = objc_msgSend_hash(v4, v5, v6, v7);

  return v8;
}

- (id)allSiteIdentifiers
{
  id v4 = objc_msgSend_backingVector(self, a2, v2, v3);
  unint64_t v8 = objc_msgSend_allSiteIdentifiers(v4, v5, v6, v7);

  return v8;
}

- (unint64_t)timestampCount
{
  id v4 = objc_msgSend_backingVector(self, a2, v2, v3);
  unint64_t v8 = objc_msgSend_timestampCount(v4, v5, v6, v7);

  return v8;
}

- (unint64_t)timestampCountForSiteIdentifier:(id)a3
{
  id v4 = a3;
  unint64_t v8 = objc_msgSend_backingVector(self, v5, v6, v7);
  unint64_t v11 = objc_msgSend_timestampCountForSiteIdentifier_(v8, v9, (uint64_t)v4, v10);

  return v11;
}

- (BOOL)includesTimestamp:(id)a3
{
  id v4 = a3;
  unint64_t v8 = objc_msgSend_backingVector(self, v5, v6, v7);
  char v11 = objc_msgSend_clockVector_includesTimestamp_(v8, v9, (uint64_t)v4, v10);

  return v11;
}

- (unsigned)clockTypeForTimestamp:(id)a3
{
  id v4 = a3;
  unint64_t v8 = objc_msgSend_backingVector(self, v5, v6, v7);
  unsigned int v11 = objc_msgSend_attributeForTimestamp_(v8, v9, (uint64_t)v4, v10);

  return BYTE1(v11);
}

- (int64_t)compareToVector:(id)a3
{
  id v4 = a3;
  unint64_t v8 = objc_msgSend_backingVector(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_backingVector(v4, v9, v10, v11);
  uint64_t v16 = objc_msgSend_vectorExpansionState(self, v13, v14, v15);
  int64_t v18 = objc_msgSend_clockVector_compareToVector_withExpansionState_(v8, v17, (uint64_t)v12, v16);

  return v18;
}

- (BOOL)isGreaterThanOrEqualToVector:(id)a3
{
  return (unint64_t)objc_msgSend_compareToVector_(self, a2, (uint64_t)a3, v3) < 2;
}

- (BOOL)hasTimestampsNotInVector:(id)a3
{
  id v4 = a3;
  unint64_t v8 = objc_msgSend_backingVector(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_backingVector(v4, v9, v10, v11);
  uint64_t v16 = objc_msgSend_vectorExpansionState(self, v13, v14, v15);
  LOBYTE(self) = objc_msgSend_clockVector_hasTimestampsNotInVector_withExpansionState_(v8, v17, (uint64_t)v12, v16);

  return (char)self;
}

- (unsigned)vectorExpansionState
{
  return 0;
}

- (id)clockValuesForSiteIdentifier:(id)a3
{
  id v4 = a3;
  unint64_t v8 = objc_msgSend_backingVector(self, v5, v6, v7);
  uint64_t v11 = objc_msgSend_clockValuesForSiteIdentifier_(v8, v9, (uint64_t)v4, v10);

  return v11;
}

- (void)enumerateClockValuesForSiteIdentifier:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = objc_msgSend_backingVector(self, v8, v9, v10);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_18B1886D8;
  v14[3] = &unk_1E5465A48;
  id v12 = v7;
  id v15 = v12;
  objc_msgSend_enumerateClockValuesForSiteIdentifier_usingBlock_(v11, v13, (uint64_t)v6, (uint64_t)v14);
}

- (void)enumerateAllClockValuesUsingBlock:(id)a3
{
  id v4 = a3;
  unint64_t v8 = objc_msgSend_backingVector(self, v5, v6, v7);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_18B1887C4;
  v12[3] = &unk_1E5465A70;
  id v9 = v4;
  id v13 = v9;
  objc_msgSend_enumerateAllClockValuesUsingBlock_(v8, v10, (uint64_t)v12, v11);
}

- (id)vectorFilteredBySiteIdentifiers:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  id v9 = objc_msgSend_backingVector(self, v6, v7, v8);
  id v12 = objc_msgSend_vectorFilteredBySiteIdentifiers_(v9, v10, (uint64_t)v4, v11);
  objc_msgSend__setBackingState_(v5, v13, (uint64_t)v12, v14);

  return v5;
}

- (id)vectorFilteredByModifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  id v9 = objc_msgSend_backingVector(self, v6, v7, v8);
  id v12 = objc_msgSend_vectorFilteredByModifier_(v9, v10, (uint64_t)v4, v11);
  objc_msgSend__setBackingState_(v5, v13, (uint64_t)v12, v14);

  return v5;
}

- (id)vectorFilteredByClockType:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  uint64_t v5 = objc_opt_new();
  id v9 = objc_msgSend_backingVector(self, v6, v7, v8);
  id v12 = objc_msgSend_clockVector_vectorFilteredByClockType_(v9, v10, v3, v11);
  objc_msgSend__setBackingState_(v5, v13, (uint64_t)v12, v14);

  return v5;
}

- (id)vectorFillingInImplicitClockValuesUsingSiteIdentifiers:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_backingVector(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_vectorExpansionState(self, v9, v10, v11);
  uint64_t v14 = objc_msgSend_clockVector_vectorFillingInImplicitClockValuesUsingSiteIdentifiers_withExpansionState_(v8, v13, (uint64_t)v4, v12);

  return v14;
}

- (id)clockVector
{
  id v4 = objc_msgSend_copy(self, a2, v2, v3);

  return v4;
}

- (id)descriptionWithStringSiteIdentifiers:(BOOL)a3 usingSuperscripts:(BOOL)a4
{
  BOOL v5 = a3;
  uint64_t v6 = objc_msgSend_backingVector(self, a2, a3, a4);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_18B188C1C;
  v9[3] = &unk_1E5465A90;
  BOOL v10 = a4;
  uint64_t v7 = sub_18B186410(v6, v5, v9);

  return v7;
}

- (id)description
{
  return (id)objc_msgSend_descriptionWithStringSiteIdentifiers_usingSuperscripts_(self, a2, 0, 0);
}

- (id)debugDescription
{
  return (id)objc_msgSend_descriptionWithStringSiteIdentifiers_usingSuperscripts_(self, a2, 1, 1);
}

- (CKDistributedTimestampAttributedVector)backingVector
{
  return self->_backingVector;
}

- (void).cxx_destruct
{
}

@end
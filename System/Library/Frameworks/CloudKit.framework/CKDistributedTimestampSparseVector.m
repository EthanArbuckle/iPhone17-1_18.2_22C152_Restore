@interface CKDistributedTimestampSparseVector
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (CKDistributedTimestampSparseVector)init;
- (CKDistributedTimestampSparseVector)initWithCoder:(id)a3;
- (NSDictionary)clockValues;
- (id)allSiteIdentifiers;
- (id)clockValuesForSiteIdentifier:(id)a3;
- (id)copy;
- (id)mutableCopy;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)vectorFilteredByModifier:(id)a3;
- (id)vectorFilteredBySiteIdentifiers:(id)a3;
- (unint64_t)hash;
- (unint64_t)timestampCount;
- (unint64_t)timestampCountForSiteIdentifier:(id)a3;
- (void)__setBackingStateNoCopy:(id)a3;
- (void)_setBackingState:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKDistributedTimestampSparseVector

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

- (CKDistributedTimestampSparseVector)init
{
  v7.receiver = self;
  v7.super_class = (Class)CKDistributedTimestampSparseVector;
  v2 = [(CKDistributedTimestampSparseVector *)&v7 init];
  if (v2)
  {
    v3 = objc_opt_new();
    objc_msgSend__setBackingState_(v2, v4, (uint64_t)v3, v5);
  }
  return v2;
}

- (CKDistributedTimestampSparseVector)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CKDistributedTimestampSparseVector;
  uint64_t v5 = [(CKDistributedTimestampSparseVector *)&v21 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    v14 = objc_msgSend_setWithObjects_(v6, v12, v7, v13, v8, v9, v10, v11, 0);
    v15 = NSStringFromSelector(sel_clockValues);
    v17 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v16, (uint64_t)v14, (uint64_t)v15);

    objc_msgSend__setBackingState_(v5, v18, (uint64_t)v17, v19);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v12 = a3;
  id v4 = (void *)MEMORY[0x18C12ADA0]();
  uint64_t v5 = self;
  objc_sync_enter(v5);
  uint64_t v9 = objc_msgSend_clockValues(v5, v6, v7, v8);
  uint64_t v10 = NSStringFromSelector(sel_clockValues);
  objc_msgSend_encodeObject_forKey_(v12, v11, (uint64_t)v9, (uint64_t)v10);

  objc_sync_exit(v5);
}

- (void)_setBackingState:(id)a3
{
  objc_msgSend_CKDeepCopy(a3, a2, (uint64_t)a3, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
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
  return (id)((uint64_t (*)(CKDistributedTimestampSparseVector *, char *, void))MEMORY[0x1F4181798])(self, sel_mutableCopyWithZone_, 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v3 = self;
  objc_sync_enter(v3);
  id v4 = objc_opt_new();
  uint64_t v8 = objc_msgSend_clockValues(v3, v5, v6, v7);
  objc_msgSend__setBackingState_(v4, v9, (uint64_t)v8, v10);

  objc_sync_exit(v3);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CKDistributedTimestampSparseVector *)a3;
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
      uint64_t v6 = self;
      objc_sync_enter(v6);
      uint64_t v7 = v5;
      objc_sync_enter(v7);
      uint64_t v11 = objc_msgSend_clockValues(v6, v8, v9, v10);
      v18 = objc_msgSend_clockValues(v7, v12, v13, v14);
      if (v11 == v18)
      {
        char isEqual = 1;
      }
      else
      {
        uint64_t v19 = objc_msgSend_clockValues(v6, v15, v16, v17);
        v23 = objc_msgSend_clockValues(v7, v20, v21, v22);
        char isEqual = objc_msgSend_isEqual_(v19, v24, (uint64_t)v23, v25);
      }
      objc_sync_exit(v7);

      objc_sync_exit(v6);
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
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  uint64_t v6 = objc_msgSend_clockValues(v2, v3, v4, v5);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_18B182918;
  v11[3] = &unk_1E5465850;
  v11[4] = &v12;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v6, v7, (uint64_t)v11, v8);

  unint64_t v9 = v13[3];
  _Block_object_dispose(&v12, 8);
  objc_sync_exit(v2);

  return v9;
}

- (id)allSiteIdentifiers
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_msgSend_clockValues(v2, v4, v5, v6);
  uint64_t v11 = objc_msgSend_allKeys(v7, v8, v9, v10);
  uint64_t v14 = objc_msgSend_setWithArray_(v3, v12, (uint64_t)v11, v13);

  objc_sync_exit(v2);

  return v14;
}

- (unint64_t)timestampCount
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  uint64_t v6 = objc_msgSend_clockValues(v2, v3, v4, v5);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_18B182B84;
  v11[3] = &unk_1E5465850;
  v11[4] = &v12;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v6, v7, (uint64_t)v11, v8);

  unint64_t v9 = v13[3];
  _Block_object_dispose(&v12, 8);
  objc_sync_exit(v2);

  return v9;
}

- (unint64_t)timestampCountForSiteIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  unint64_t v9 = objc_msgSend_clockValues(v5, v6, v7, v8);
  uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(v9, v10, (uint64_t)v4, v11);
  unint64_t v16 = objc_msgSend_count(v12, v13, v14, v15);

  objc_sync_exit(v5);
  return v16;
}

- (id)clockValuesForSiteIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  unint64_t v9 = objc_msgSend_clockValues(v5, v6, v7, v8);
  uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(v9, v10, (uint64_t)v4, v11);

  unint64_t v16 = objc_msgSend_copy(v12, v13, v14, v15);
  uint64_t v17 = v16;
  if (v16) {
    id v18 = v16;
  }
  else {
    id v18 = (id)objc_opt_new();
  }
  uint64_t v19 = v18;

  objc_sync_exit(v5);

  return v19;
}

- (id)vectorFilteredBySiteIdentifiers:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = objc_opt_new();
  uint64_t v10 = objc_msgSend_clockValues(v5, v7, v8, v9);
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  uint64_t v22 = sub_18B182F1C;
  v23 = &unk_1E5465878;
  id v11 = v4;
  id v24 = v11;
  id v12 = v6;
  id v25 = v12;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v10, v13, (uint64_t)&v20, v14);

  id v18 = objc_msgSend_copy(v12, v15, v16, v17, v20, v21, v22, v23);
  objc_sync_exit(v5);

  return v18;
}

- (id)vectorFilteredByModifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = objc_opt_new();
  uint64_t v10 = objc_msgSend_clockValues(v5, v7, v8, v9);
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  uint64_t v22 = sub_18B183164;
  v23 = &unk_1E5465878;
  id v11 = v4;
  id v24 = v11;
  id v12 = v6;
  id v25 = v12;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v10, v13, (uint64_t)&v20, v14);

  id v18 = objc_msgSend_copy(v12, v15, v16, v17, v20, v21, v22, v23);
  objc_sync_exit(v5);

  return v18;
}

- (NSDictionary)clockValues
{
  return self->_clockValues;
}

- (void).cxx_destruct
{
}

@end
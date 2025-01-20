@interface CKEncryptedRecordValueStore
- (BOOL)isEncrypted;
- (id)objectForKeyedSubscript:(id)a3;
- (void)_setObject:(id)a3 forKey:(id)a4;
- (void)setCompatibilityModeObjectNoValidate:(id)a3 forKey:(id)a4;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
@end

@implementation CKEncryptedRecordValueStore

- (BOOL)isEncrypted
{
  return 1;
}

- (void)_setObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v9 = [CKException alloc];
    uint64_t v10 = *MEMORY[0x1E4F1C3C8];
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    id v14 = (id)objc_msgSend_initWithName_format_(v9, v13, v10, @"Illegal value of type %@ for the encrypted store", v12);

    objc_exception_throw(v14);
  }
  if (v6)
  {
    objc_msgSend_setCompatibilityModeObjectNoValidate_forKey_(self, v8, (uint64_t)v6, (uint64_t)v7);
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)CKEncryptedRecordValueStore;
    [(CKRecordValueStore *)&v15 setObjectNoValidate:0 forKey:v7];
  }
}

- (void)setCompatibilityModeObjectNoValidate:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend_firstObject(v6, v8, v9, v10),
        v11 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v11,
        (isKindOfClass & 1) != 0))
  {
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = sub_18B0A6684;
    v24[3] = &unk_1E5463850;
    v24[4] = self;
    id v13 = v7;
    id v25 = v13;
    v16 = objc_msgSend_CKMap_(v6, v14, (uint64_t)v24, v15);
    objc_msgSend_setObjectNoValidate_forKey_(self, v17, (uint64_t)v16, (uint64_t)v13);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v23.receiver = self;
      v23.super_class = (Class)CKEncryptedRecordValueStore;
      [(CKRecordValueStore *)&v23 setObjectNoValidate:v6 forKey:v7];
    }
    else
    {
      v18 = [CKEncryptedData alloc];
      v21 = objc_msgSend_initWithValue_(v18, v19, (uint64_t)v6, v20);
      sub_18B0A66F4((uint64_t)self, v21, v7);
      objc_msgSend_setObjectNoValidate_forKey_(self, v22, (uint64_t)v21, (uint64_t)v7);
    }
  }
}

- (id)objectForKeyedSubscript:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CKEncryptedRecordValueStore;
  v3 = [(CKRecordValueStore *)&v12 objectForKeyedSubscript:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend_valueForKeyPath_(v3, v4, @"value", v5);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v3;
    }
    else
    {
      objc_msgSend_value(v3, v7, v8, v9);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  uint64_t v10 = v6;

  return v10;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  if (a4) {
    objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, (uint64_t)a4);
  }
}

@end
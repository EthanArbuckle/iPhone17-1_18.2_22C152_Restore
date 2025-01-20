@interface CKEncryptedStringArray
- (CKEncryptedStringArray)initWithStringArray:(id)a3;
- (NSArray)stringArray;
- (id)value;
@end

@implementation CKEncryptedStringArray

- (CKEncryptedStringArray)initWithStringArray:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = objc_opt_new();
  objc_msgSend_setStringListValues_(v5, v7, (uint64_t)v6, v8);

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v9 = v4;
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v28, (uint64_t)v32, 16);
  if (v11)
  {
    uint64_t v15 = v11;
    uint64_t v16 = *(void *)v29;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v29 != v16) {
          objc_enumerationMutation(v9);
        }
        v18 = objc_msgSend_copy(*(void **)(*((void *)&v28 + 1) + 8 * v17), v12, v13, v14);
        objc_msgSend_addStringListValue_(v5, v19, (uint64_t)v18, v20);

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v28, (uint64_t)v32, 16);
    }
    while (v15);
  }

  v24 = objc_msgSend_data(v5, v21, v22, v23);
  v27.receiver = self;
  v27.super_class = (Class)CKEncryptedStringArray;
  v25 = [(CKEncryptedData *)&v27 initWithData:v24];

  return v25;
}

- (NSArray)stringArray
{
  id v4 = objc_msgSend_data(self, a2, v2, v3);
  if (v4)
  {
    v5 = [CKDPRecordFieldValueEncryptedValue alloc];
    uint64_t v8 = objc_msgSend_initWithData_(v5, v6, (uint64_t)v4, v7);
    v12 = objc_msgSend_stringListValues(v8, v9, v10, v11);
  }
  else
  {
    v12 = 0;
  }

  return (NSArray *)v12;
}

- (id)value
{
  return (id)((uint64_t (*)(CKEncryptedStringArray *, char *))MEMORY[0x1F4181798])(self, sel_stringArray);
}

@end
@interface CKEncryptedLongLongArray
- (CKEncryptedLongLongArray)initWithLongLongArray:(id)a3;
- (NSArray)longLongArray;
- (id)value;
@end

@implementation CKEncryptedLongLongArray

- (CKEncryptedLongLongArray)initWithLongLongArray:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_new();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = v4;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v25, (uint64_t)v29, 16);
  if (v8)
  {
    uint64_t v12 = v8;
    uint64_t v13 = *(void *)v26;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v6);
        }
        uint64_t v15 = objc_msgSend_longLongValue(*(void **)(*((void *)&v25 + 1) + 8 * v14), v9, v10, v11);
        objc_msgSend_addSignedListValue_(v5, v16, v15, v17);
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v25, (uint64_t)v29, 16);
    }
    while (v12);
  }

  v21 = objc_msgSend_data(v5, v18, v19, v20);
  v24.receiver = self;
  v24.super_class = (Class)CKEncryptedLongLongArray;
  v22 = [(CKEncryptedData *)&v24 initWithData:v21];

  return v22;
}

- (NSArray)longLongArray
{
  id v4 = objc_msgSend_data(self, a2, v2, v3);
  if (v4)
  {
    v5 = objc_opt_new();
    id v6 = [CKDPRecordFieldValueEncryptedValue alloc];
    v9 = objc_msgSend_initWithData_(v6, v7, (uint64_t)v4, v8);
    if (objc_msgSend_signedListValuesCount(v9, v10, v11, v12))
    {
      unint64_t v16 = 0;
      do
      {
        uint64_t v17 = NSNumber;
        uint64_t v18 = objc_msgSend_signedListValues(v9, v13, v14, v15);
        v21 = objc_msgSend_numberWithLongLong_(v17, v19, *(void *)(v18 + 8 * v16), v20);
        objc_msgSend_addObject_(v5, v22, (uint64_t)v21, v23);

        ++v16;
      }
      while (v16 < objc_msgSend_signedListValuesCount(v9, v24, v25, v26));
    }
  }
  else
  {
    v5 = 0;
  }

  return (NSArray *)v5;
}

- (id)value
{
  return (id)((uint64_t (*)(CKEncryptedLongLongArray *, char *))MEMORY[0x1F4181798])(self, sel_longLongArray);
}

@end
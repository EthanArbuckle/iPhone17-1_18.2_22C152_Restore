@interface CKEncryptedDateArray
- (CKEncryptedDateArray)initWithDateArray:(id)a3;
- (NSArray)dateArray;
- (id)value;
@end

@implementation CKEncryptedDateArray

- (CKEncryptedDateArray)initWithDateArray:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_alloc_init(CKDPRecordFieldValueEncryptedValue);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v6 = v4;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v30, (uint64_t)v34, 16);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v31;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v30 + 1) + 8 * v11);
        v13 = objc_alloc_init(CKDPDate);
        objc_msgSend_timeIntervalSinceReferenceDate(v12, v14, v15, v16);
        objc_msgSend_setTime_(v13, v17, v18, v19);
        objc_msgSend_addDateListValue_(v5, v20, (uint64_t)v13, v21);

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v22, (uint64_t)&v30, (uint64_t)v34, 16);
    }
    while (v9);
  }

  v26 = objc_msgSend_data(v5, v23, v24, v25);
  v29.receiver = self;
  v29.super_class = (Class)CKEncryptedDateArray;
  v27 = [(CKEncryptedData *)&v29 initWithData:v26];

  return v27;
}

- (NSArray)dateArray
{
  id v4 = objc_msgSend_data(self, a2, v2, v3);
  if (v4)
  {
    v5 = [CKDPRecordFieldValueEncryptedValue alloc];
    uint64_t v8 = objc_msgSend_initWithData_(v5, v6, (uint64_t)v4, v7);
    v12 = objc_msgSend_dateListValues(v8, v9, v10, v11);
    uint64_t v15 = objc_msgSend_CKMap_(v12, v13, (uint64_t)&unk_1ED7EF438, v14);
  }
  else
  {
    uint64_t v15 = 0;
  }

  return (NSArray *)v15;
}

- (id)value
{
  return (id)((uint64_t (*)(CKEncryptedDateArray *, char *))MEMORY[0x1F4181798])(self, sel_dateArray);
}

@end
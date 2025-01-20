@interface CKEncryptedLocationArray
- (CKEncryptedLocationArray)initWithLocationArray:(id)a3;
- (NSArray)locationArray;
- (id)value;
@end

@implementation CKEncryptedLocationArray

- (CKEncryptedLocationArray)initWithLocationArray:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_alloc_init(CKDPRecordFieldValueEncryptedValue);
  v6 = objc_opt_new();
  objc_msgSend_setLocationListValues_(v5, v7, (uint64_t)v6, v8);

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v9 = v4;
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v27, (uint64_t)v31, 16);
  if (v11)
  {
    uint64_t v14 = v11;
    uint64_t v15 = *(void *)v28;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(v9);
        }
        v17 = objc_msgSend_CKDPLocationCoordinateFromCLLocation_(MEMORY[0x1E4F1E5F0], v12, *(void *)(*((void *)&v27 + 1) + 8 * v16), v13);
        objc_msgSend_addLocationListValue_(v5, v18, (uint64_t)v17, v19);

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v27, (uint64_t)v31, 16);
    }
    while (v14);
  }

  v23 = objc_msgSend_data(v5, v20, v21, v22);
  v26.receiver = self;
  v26.super_class = (Class)CKEncryptedLocationArray;
  v24 = [(CKEncryptedData *)&v26 initWithData:v23];

  return v24;
}

- (NSArray)locationArray
{
  id v4 = objc_msgSend_data(self, a2, v2, v3);
  if (v4)
  {
    v5 = [CKDPRecordFieldValueEncryptedValue alloc];
    uint64_t v8 = objc_msgSend_initWithData_(v5, v6, (uint64_t)v4, v7);
    v12 = objc_msgSend_locationListValues(v8, v9, v10, v11);
    uint64_t v15 = objc_msgSend_CKMap_(v12, v13, (uint64_t)&unk_1ED7EFB78, v14);
  }
  else
  {
    uint64_t v15 = 0;
  }

  return (NSArray *)v15;
}

- (id)value
{
  return (id)((uint64_t (*)(CKEncryptedLocationArray *, char *))MEMORY[0x1F4181798])(self, sel_locationArray);
}

@end
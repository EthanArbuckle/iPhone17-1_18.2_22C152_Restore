@interface FlexLocalDBSongData
- (BOOL)_validateSongData;
- (FlexLocalDBSongData)initWithUID:(id)a3 songData:(id)a4 shouldValidate:(BOOL)a5;
- (NSDictionary)songData;
- (NSString)uid;
- (id)_allRequiredKeys;
- (id)initForRecordCreationWithUID:(id)a3 songData:(id)a4;
- (id)initForRecordUpdateWithUID:(id)a3 songData:(id)a4;
@end

@implementation FlexLocalDBSongData

- (id)initForRecordCreationWithUID:(id)a3 songData:(id)a4
{
  return (id)MEMORY[0x270F9A6D0](self, sel_initWithUID_songData_shouldValidate_, a3, a4, 1);
}

- (id)initForRecordUpdateWithUID:(id)a3 songData:(id)a4
{
  return (id)MEMORY[0x270F9A6D0](self, sel_initWithUID_songData_shouldValidate_, a3, a4, 0);
}

- (FlexLocalDBSongData)initWithUID:(id)a3 songData:(id)a4 shouldValidate:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  v32.receiver = self;
  v32.super_class = (Class)FlexLocalDBSongData;
  v11 = [(FlexLocalDBSongData *)&v32 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_uid, a3);
    id v13 = objc_alloc(MEMORY[0x263F08C38]);
    v17 = objc_msgSend_initWithUUIDString_(v13, v14, (uint64_t)v9, v15, v16);
    uint64_t v22 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v18, v19, v20, v21);
    songData = v12->_songData;
    v12->_songData = (NSMutableDictionary *)v22;

    objc_msgSend_addEntriesFromDictionary_(v12->_songData, v24, (uint64_t)v10, v25, v26);
    if (v5 && !objc_msgSend__validateSongData(v12, v27, v28, v29, v30) || !v17)
    {

      v12 = 0;
    }
  }
  return v12;
}

- (BOOL)_validateSongData
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v6 = objc_msgSend__allRequiredKeys(self, a2, v2, v3, v4);
  v11 = objc_msgSend_mutableCopy(v6, v7, v8, v9, v10);

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v12 = self->_songData;
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v27, (uint64_t)v31, 16);
  if (v14)
  {
    uint64_t v18 = v14;
    uint64_t v19 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v28 != v19) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend_removeObject_(v11, v15, *(void *)(*((void *)&v27 + 1) + 8 * i), v16, v17, (void)v27);
      }
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v27, (uint64_t)v31, 16);
    }
    while (v18);
  }

  BOOL v25 = objc_msgSend_count(v11, v21, v22, v23, v24) == 0;
  return v25;
}

- (id)_allRequiredKeys
{
  if (qword_267BA93C0 != -1) {
    dispatch_once(&qword_267BA93C0, &unk_26C7FE7A8);
  }
  uint64_t v2 = (void *)qword_267BA93C8;
  return v2;
}

- (NSDictionary)songData
{
  return &self->_songData->super;
}

- (NSString)uid
{
  return self->_uid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_songData, 0);
  objc_storeStrong((id *)&self->_uid, 0);
}

@end
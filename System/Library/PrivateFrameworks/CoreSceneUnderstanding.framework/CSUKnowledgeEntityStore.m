@interface CSUKnowledgeEntityStore
- (BOOL)commitWithError:(id *)a3;
- (BOOL)loadWithError:(id *)a3;
- (BOOL)purgeDatabaseWithVersion:(int)a3 error:(id *)a4;
- (CSUKnowledgeEntityStore)initWithDatabasePath:(id)a3 error:(id *)a4;
- (id)entityForIdentifier:(unsigned int)a3;
- (int)version;
- (unint64_t)count;
- (unsigned)storeEntity:(id)a3 error:(id *)a4;
- (void)enumerateIdentifiersUsingBlock:(id)a3;
@end

@implementation CSUKnowledgeEntityStore

- (CSUKnowledgeEntityStore)initWithDatabasePath:(id)a3 error:(id *)a4
{
  id v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CSUKnowledgeEntityStore;
  v8 = [(CSUKnowledgeEntityStore *)&v15 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_databasePath, a3);
    data = v9->_data;
    v9->_data = 0;

    if ((objc_msgSend_loadWithError_(v9, v11, (uint64_t)a4, v12, v13) & 1) == 0)
    {

      v9 = 0;
    }
  }

  return v9;
}

- (BOOL)commitWithError:(id *)a3
{
  v61 = a3;
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v4 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v9 = objc_msgSend_count(self->_data, v5, v6, v7, v8);
  v62 = objc_msgSend_initWithCapacity_(v4, v10, v9, v11, v12);
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  uint64_t v13 = self->_data;
  uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v63, (uint64_t)v73, 16);
  if (v18)
  {
    uint64_t v19 = *(void *)v64;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v64 != v19) {
          objc_enumerationMutation(v13);
        }
        uint64_t v21 = *(void *)(*((void *)&v63 + 1) + 8 * i);
        v71[0] = @"identifier";
        v71[1] = @"data";
        v72[0] = v21;
        v22 = objc_msgSend_objectForKeyedSubscript_(self->_data, v15, v21, v16, v17, v61);
        v27 = objc_msgSend_dictionary(v22, v23, v24, v25, v26);
        v72[1] = v27;
        v29 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v28, (uint64_t)v72, (uint64_t)v71, 2);
        objc_msgSend_addObject_(v62, v30, (uint64_t)v29, v31, v32);
      }
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v15, (uint64_t)&v63, (uint64_t)v73, 16);
    }
    while (v18);
  }

  v33 = (void *)MEMORY[0x263F08900];
  v69[0] = @"metadata";
  v67[0] = @"schemaVersion";
  v37 = objc_msgSend_numberWithInteger_(NSNumber, v34, self->_schemaVersion, v35, v36);
  v68[0] = v37;
  v67[1] = @"size";
  v38 = NSNumber;
  uint64_t v43 = objc_msgSend_count(self->_data, v39, v40, v41, v42);
  v47 = objc_msgSend_numberWithUnsignedInteger_(v38, v44, v43, v45, v46);
  v68[1] = v47;
  v67[2] = @"version";
  v51 = objc_msgSend_numberWithInt_(NSNumber, v48, self->_version, v49, v50);
  v68[2] = v51;
  v53 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v52, (uint64_t)v68, (uint64_t)v67, 3);
  v69[1] = @"data";
  v70[0] = v53;
  v70[1] = v62;
  v55 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v54, (uint64_t)v70, (uint64_t)v69, 2);
  v57 = objc_msgSend_dataWithJSONObject_options_error_(v33, v56, (uint64_t)v55, 0, (uint64_t)v61);

  if (v57) {
    char v59 = objc_msgSend_writeToFile_options_error_(v57, v58, (uint64_t)self->_databasePath, 0, (uint64_t)v61);
  }
  else {
    char v59 = 0;
  }

  return v59;
}

- (BOOL)loadWithError:(id *)a3
{
  uint64_t v89 = *MEMORY[0x263EF8340];
  uint64_t v6 = objc_msgSend_defaultManager(MEMORY[0x263F08850], a2, (uint64_t)a3, v3, v4);
  char v10 = objc_msgSend_fileExistsAtPath_(v6, v7, (uint64_t)self->_databasePath, v8, v9);

  if (v10)
  {
    v81 = objc_msgSend_dataWithContentsOfFile_options_error_(MEMORY[0x263EFF8F8], v11, (uint64_t)self->_databasePath, 0, (uint64_t)a3);
    if (v81)
    {
      uint64_t v13 = objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x263F08900], v12, (uint64_t)v81, 0, (uint64_t)a3);
      BOOL v80 = v13 != 0;
      uint64_t v17 = self;
      if (v13)
      {
        id v79 = v13;
        uint64_t v18 = objc_msgSend_objectForKeyedSubscript_(v13, v14, @"metadata", v15, v16);
        v77 = objc_msgSend_objectForKeyedSubscript_(v18, v19, @"version", v20, v21);

        uint64_t v25 = objc_msgSend_objectForKeyedSubscript_(v79, v22, @"metadata", v23, v24);
        v78 = objc_msgSend_objectForKeyedSubscript_(v25, v26, @"schemaVersion", v27, v28);

        int v33 = (int)v77;
        if (v77) {
          int v33 = objc_msgSend_integerValue(v77, v29, v30, v31, v32);
        }
        self->_version = v33;
        int64_t v34 = (int64_t)v78;
        if (v78) {
          int64_t v34 = objc_msgSend_integerValue(v78, v29, v30, v31, v32);
        }
        self->_schemaVersion = v34;
        id v35 = objc_alloc(MEMORY[0x263EFF9A0]);
        uint64_t v40 = objc_msgSend_count(v79, v36, v37, v38, v39);
        v44 = (NSMutableDictionary *)objc_msgSend_initWithCapacity_(v35, v41, v40, v42, v43);
        data = self->_data;
        self->_data = v44;

        long long v86 = 0u;
        long long v87 = 0u;
        long long v84 = 0u;
        long long v85 = 0u;
        objc_msgSend_objectForKeyedSubscript_(v79, v46, @"data", v47, v48);
        id obj = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v49, (uint64_t)&v84, (uint64_t)v88, 16);
        if (v50)
        {
          uint64_t v51 = *(void *)v85;
          do
          {
            for (uint64_t i = 0; i != v50; ++i)
            {
              if (*(void *)v85 != v51) {
                objc_enumerationMutation(obj);
              }
              v53 = *(void **)(*((void *)&v84 + 1) + 8 * i);
              v54 = [CSUKnowledgeEntity alloc];
              v58 = objc_msgSend_objectForKeyedSubscript_(v53, v55, @"data", v56, v57);
              v62 = objc_msgSend_initWithDictionary_(v54, v59, (uint64_t)v58, v60, v61);
              long long v63 = v17->_data;
              v67 = objc_msgSend_objectForKeyedSubscript_(v53, v64, @"identifier", v65, v66);
              objc_msgSend_setObject_forKeyedSubscript_(v63, v68, (uint64_t)v62, (uint64_t)v67, v69);

              uint64_t v17 = self;
            }
            uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v70, (uint64_t)&v84, (uint64_t)v88, 16);
          }
          while (v50);
        }

        uint64_t v13 = v79;
      }
    }
    else
    {
      BOOL v80 = 0;
    }

    return v80;
  }
  else
  {
    v71 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v72 = self->_data;
    self->_data = v71;

    self->_version = 0;
    self->_schemaVersion = 0;
    return objc_msgSend_commitWithError_(self, v73, (uint64_t)a3, v74, v75);
  }
}

- (unsigned)storeEntity:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v11 = objc_msgSend_QID(v6, v7, v8, v9, v10);
  uint64_t v15 = objc_msgSend_substringFromIndex_(v11, v12, 1, v13, v14);
  uint64_t v20 = objc_msgSend_integerValue(v15, v16, v17, v18, v19);

  if (!v20)
  {
    if (!a4)
    {
LABEL_7:
      LODWORD(v20) = 0;
      goto LABEL_8;
    }
    uint64_t v40 = NSString;
    uint64_t v36 = objc_msgSend_QID(v6, v21, v22, v23, v24);
    v44 = objc_msgSend_stringWithFormat_(v40, v41, @"Invalid QID: %@", v42, v43, v36);
    objc_msgSend_errorWithCode_message_(CSUError, v45, 8, (uint64_t)v44, v46);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_6:
    goto LABEL_7;
  }
  data = self->_data;
  uint64_t v26 = objc_msgSend_numberWithInteger_(NSNumber, v21, v20, v23, v24);
  objc_msgSend_setObject_forKeyedSubscript_(data, v27, (uint64_t)v6, (uint64_t)v26, v28);

  if ((objc_msgSend_commitWithError_(self, v29, (uint64_t)a4, v30, v31) & 1) == 0)
  {
    id v35 = self->_data;
    uint64_t v36 = objc_msgSend_numberWithInteger_(NSNumber, v32, v20, v33, v34);
    objc_msgSend_removeObjectForKey_(v35, v37, (uint64_t)v36, v38, v39);
    goto LABEL_6;
  }
LABEL_8:

  return v20;
}

- (id)entityForIdentifier:(unsigned int)a3
{
  data = self->_data;
  id v6 = objc_msgSend_numberWithUnsignedInt_(NSNumber, a2, *(uint64_t *)&a3, v3, v4);
  uint64_t v10 = objc_msgSend_objectForKey_(data, v7, (uint64_t)v6, v8, v9);

  return v10;
}

- (BOOL)purgeDatabaseWithVersion:(int)a3 error:(id *)a4
{
  uint64_t v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  data = self->_data;
  self->_data = v7;

  self->_version = a3;
  return objc_msgSend_commitWithError_(self, v9, (uint64_t)a4, v10, v11);
}

- (unint64_t)count
{
  return objc_msgSend_count(self->_data, a2, v2, v3, v4);
}

- (void)enumerateIdentifiersUsingBlock:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(id, uint64_t, unsigned char *))a3;
  char v19 = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = self->_data;
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v15, (uint64_t)v20, 16);
  if (v11)
  {
    uint64_t v12 = *(void *)v16;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v16 != v12) {
        objc_enumerationMutation(v5);
      }
      uint64_t v14 = objc_msgSend_integerValue(*(void **)(*((void *)&v15 + 1) + 8 * v13), v7, v8, v9, v10, (void)v15);
      v4[2](v4, v14, &v19);
      if (v19) {
        break;
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v7, (uint64_t)&v15, (uint64_t)v20, 16);
        if (v11) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (int)version
{
  return self->_version;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_databasePath, 0);
}

@end
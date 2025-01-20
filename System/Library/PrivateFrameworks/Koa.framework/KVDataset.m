@interface KVDataset
- (BOOL)enumerateCascadeItemsWithError:(id *)a3 usingBlock:(id)a4;
- (BOOL)enumerateItemsWithError:(id *)a3 usingBlock:(id)a4;
- (KVDataset)init;
- (KVDataset)initWithReader:(id)a3;
- (id)datasetInfo;
- (id)description;
@end

@implementation KVDataset

- (BOOL)enumerateCascadeItemsWithError:(id *)a3 usingBlock:(id)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  v6 = (uint64_t (**)(id, uint64_t, void *))a4;
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x3032000000;
  v54 = sub_1BC3BC5CC;
  v55 = sub_1BC3BC5DC;
  id v56 = 0;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v49 = &v51;
  id v50 = 0;
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = sub_1BC3BCD44;
  v47[3] = &unk_1E62ACF68;
  id v8 = v7;
  id v48 = v8;
  char v12 = objc_msgSend_enumerateItemsWithError_usingBlock_(self, v9, (uint64_t)&v50, (uint64_t)v47, v10, v11);
  id v13 = v50;
  v42 = v13;
  if (v12)
  {

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    objc_msgSend_allKeys(v8, v14, v15, v16, v17, v18, v42);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v43, (uint64_t)v57, 16, v21);
    if (v22)
    {
      uint64_t v23 = *(void *)v44;
      while (2)
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v44 != v23) {
            objc_enumerationMutation(v19);
          }
          v25 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          v26 = (void *)MEMORY[0x1C186E860]();
          uint64_t v32 = objc_msgSend_unsignedShortValue(v25, v27, v28, v29, v30, v31);
          v37 = objc_msgSend_objectForKey_(v8, v33, (uint64_t)v25, v34, v35, v36);
          LODWORD(v25) = v6[2](v6, v32, v37);

          if (!v25)
          {
            BOOL v40 = 0;
            goto LABEL_19;
          }
        }
        uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v38, (uint64_t)&v43, (uint64_t)v57, 16, v39);
        BOOL v40 = 1;
        if (v22) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v40 = 1;
    }
  }
  else
  {
    if (v52[5]) {
      id v13 = (id)v52[5];
    }
    if (a3 && v13) {
      *a3 = v13;
    }
    BOOL v40 = 0;
    id v19 = v48;
  }
LABEL_19:

  _Block_object_dispose(&v51, 8);
  return v40;
}

- (void).cxx_destruct
{
}

- (id)description
{
  return (id)objc_msgSend_description(self->_datasetReader, a2, v2, v3, v4, v5);
}

- (BOOL)enumerateItemsWithError:(id *)a3 usingBlock:(id)a4
{
  return objc_msgSend_enumerateItemsWithError_usingBlock_(self->_datasetReader, a2, (uint64_t)a3, (uint64_t)a4, v4, v5);
}

- (id)datasetInfo
{
  return (id)objc_msgSend_datasetInfo(self->_datasetReader, a2, v2, v3, v4, v5);
}

- (KVDataset)initWithReader:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KVDataset;
  v6 = [(KVDataset *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_datasetReader, a3);
  }

  return v7;
}

- (KVDataset)init
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E4F1CA00], a2, *MEMORY[0x1E4F1C3B8], @"init unsupported", MEMORY[0x1E4F1CC08], v2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

@end
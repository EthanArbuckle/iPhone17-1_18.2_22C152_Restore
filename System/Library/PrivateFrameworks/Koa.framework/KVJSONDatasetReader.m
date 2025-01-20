@interface KVJSONDatasetReader
- (BOOL)enumerateItemsWithError:(id *)a3 usingBlock:(id)a4;
- (KVJSONDatasetReader)initWithDictionary:(id)a3 error:(id *)a4;
- (NSString)description;
- (id)datasetInfo;
@end

@implementation KVJSONDatasetReader

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_datasetInfo, 0);
}

- (NSString)description
{
  v5 = objc_msgSend_stringWithFormat_(NSString, a2, @"dataset format: %@ info: %@", v2, v3, v4, @"JSON", self->_datasetInfo);

  return (NSString *)v5;
}

- (id)datasetInfo
{
  return self->_datasetInfo;
}

- (BOOL)enumerateItemsWithError:(id *)a3 usingBlock:(id)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  v6 = (uint64_t (**)(id, void *))a4;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  obj = self->_items;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v46, (uint64_t)v54, 16, v8);
  if (!v9)
  {
    BOOL v29 = 1;
    goto LABEL_23;
  }
  uint64_t v10 = *(void *)v47;
  while (2)
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v47 != v10) {
        objc_enumerationMutation(obj);
      }
      v12 = *(void **)(*((void *)&v46 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v30 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v52 = *MEMORY[0x1E4F28568];
        v17 = objc_msgSend_stringWithFormat_(NSString, v13, @"Unexpected item outer dictionary: %@", v14, v15, v16, v12);
        v53 = v17;
        v26 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v31, (uint64_t)&v53, (uint64_t)&v52, 1, v32);
        v35 = objc_msgSend_errorWithDomain_code_userInfo_(v30, v33, @"com.apple.koa.profile", 10, (uint64_t)v26, v34);
        id v36 = v35;
        if (a3 && v35)
        {
          id v36 = v35;
          *a3 = v36;
        }
        goto LABEL_21;
      }
      v17 = objc_msgSend_objectForKey_(v12, v13, @"item", v14, v15, v16);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v37 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v50 = *MEMORY[0x1E4F28568];
        v26 = objc_msgSend_stringWithFormat_(NSString, v18, @"Unexpected item inner dictionary: %@", v19, v20, v21, v17);
        v51 = v26;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v38, (uint64_t)&v51, (uint64_t)&v50, 1, v39);
        id v36 = (id)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend_errorWithDomain_code_userInfo_(v37, v40, @"com.apple.koa.profile", 10, (uint64_t)v36, v41);
        v43 = v42;
        if (a3 && v42) {
          *a3 = v42;
        }

LABEL_21:
LABEL_22:

        BOOL v29 = 0;
        goto LABEL_23;
      }
      v22 = [KVItem alloc];
      v26 = objc_msgSend_initFromDictionary_error_(v22, v23, (uint64_t)v17, (uint64_t)a3, v24, v25);
      if (!v26 || (v6[2](v6, v26) & 1) == 0) {
        goto LABEL_22;
      }
    }
    uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v27, (uint64_t)&v46, (uint64_t)v54, 16, v28);
    BOOL v29 = 1;
    if (v9) {
      continue;
    }
    break;
  }
LABEL_23:

  return v29;
}

- (KVJSONDatasetReader)initWithDictionary:(id)a3 error:(id *)a4
{
  v57[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v53.receiver = self;
  v53.super_class = (Class)KVJSONDatasetReader;
  v11 = [(KVJSONDatasetReader *)&v53 init];
  if (!v11) {
    goto LABEL_7;
  }
  v12 = objc_msgSend_objectForKey_(v6, v7, @"datasetInfo", v8, v9, v10);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v26 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v56 = *MEMORY[0x1E4F28568];
    v27 = NSString;
    uint64_t v28 = (objc_class *)objc_opt_class();
    BOOL v29 = NSStringFromClass(v28);
    uint64_t v34 = objc_msgSend_stringWithFormat_(v27, v30, @"Unexpected DatasetInfo dictionary class: %@", v31, v32, v33, v29);
    v57[0] = v34;
    v37 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v35, (uint64_t)v57, (uint64_t)&v56, 1, v36);
    objc_msgSend_errorWithDomain_code_userInfo_(v26, v38, @"com.apple.koa.profile", 10, (uint64_t)v37, v39);
    id v40 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v13 = [KVDatasetInfo alloc];
  uint64_t v17 = objc_msgSend_initFromDictionary_error_(v13, v14, (uint64_t)v12, (uint64_t)a4, v15, v16);
  datasetInfo = v11->_datasetInfo;
  v11->_datasetInfo = (KVDatasetInfo *)v17;

  if (!v11->_datasetInfo)
  {
LABEL_13:

    uint64_t v25 = 0;
    goto LABEL_14;
  }
  uint64_t v23 = objc_msgSend_objectForKey_(v6, v19, @"items", v20, v21, v22);
  items = v11->_items;
  v11->_items = (NSArray *)v23;

  if (v11->_items)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v42 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v54 = *MEMORY[0x1E4F28568];
      v43 = NSString;
      v44 = (objc_class *)objc_opt_class();
      BOOL v29 = NSStringFromClass(v44);
      uint64_t v34 = objc_msgSend_stringWithFormat_(v43, v45, @"Unexpected items array class: %@", v46, v47, v48, v29);
      uint64_t v55 = v34;
      v37 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v49, (uint64_t)&v55, (uint64_t)&v54, 1, v50);
      objc_msgSend_errorWithDomain_code_userInfo_(v42, v51, @"com.apple.koa.profile", 10, (uint64_t)v37, v52);
      id v40 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
      if (a4 && v40)
      {
        id v40 = v40;
        *a4 = v40;
      }

      goto LABEL_13;
    }
  }

LABEL_7:
  uint64_t v25 = v11;
LABEL_14:

  return v25;
}

@end
@interface KVJSONProfileReader
- (BOOL)enumerateDatasetsWithError:(id *)a3 usingBlock:(id)a4;
- (KVJSONProfileReader)initWithData:(id)a3 error:(id *)a4;
- (NSString)description;
- (id)data;
- (id)profileInfo;
@end

@implementation KVJSONProfileReader

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_datasets, 0);
  objc_storeStrong((id *)&self->_profileInfo, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (NSString)description
{
  id v3 = [NSString alloc];
  uint64_t v9 = objc_msgSend_bytes(self->_data, v4, v5, v6, v7, v8);
  uint64_t v15 = objc_msgSend_length(self->_data, v10, v11, v12, v13, v14);
  v17 = objc_msgSend_initWithBytesNoCopy_length_encoding_freeWhenDone_(v3, v16, v9, v15, 4, 0);
  return (NSString *)v17;
}

- (id)profileInfo
{
  return self->_profileInfo;
}

- (BOOL)enumerateDatasetsWithError:(id *)a3 usingBlock:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (uint64_t (**)(id, void *))a4;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v7 = self->_datasets;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v35, (uint64_t)v41, 16, v9);
  if (v10)
  {
    uint64_t v11 = *(void *)v36;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v26 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v39 = *MEMORY[0x1E4F28568];
          v22 = objc_msgSend_stringWithFormat_(NSString, v14, @"Unexpected dataset dictionary: %@", v15, v16, v17, v13);
          v40 = v22;
          v29 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v27, (uint64_t)&v40, (uint64_t)&v39, 1, v28);
          v32 = objc_msgSend_errorWithDomain_code_userInfo_(v26, v30, @"com.apple.koa.profile", 10, (uint64_t)v29, v31);
          v33 = v32;
          if (a3 && v32) {
            *a3 = v32;
          }

LABEL_17:
          BOOL v25 = 0;
          goto LABEL_18;
        }
        v18 = [KVJSONDatasetReader alloc];
        v22 = objc_msgSend_initWithDictionary_error_(v18, v19, v13, (uint64_t)a3, v20, v21);
        if (!v22 || (v6[2](v6, v22) & 1) == 0) {
          goto LABEL_17;
        }
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v23, (uint64_t)&v35, (uint64_t)v41, 16, v24);
      BOOL v25 = 1;
      if (v10) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v25 = 1;
  }
LABEL_18:

  return v25;
}

- (id)data
{
  return self->_data;
}

- (KVJSONProfileReader)initWithData:(id)a3 error:(id *)a4
{
  v67[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v63.receiver = self;
  v63.super_class = (Class)KVJSONProfileReader;
  uint64_t v8 = [(KVJSONProfileReader *)&v63 init];
  uint64_t v9 = v8;
  if (!v8) {
    goto LABEL_8;
  }
  p_data = (uint64_t *)&v8->_data;
  objc_storeStrong((id *)&v8->_data, a3);
  uint64_t v11 = *p_data;
  id v62 = 0;
  uint64_t v14 = objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x1E4F28D90], v12, v11, 0, (uint64_t)&v62, v13);
  id v15 = v62;
  profile = v9->_profile;
  v9->_profile = (NSDictionary *)v14;

  if (!v9->_profile || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v39 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v66 = *MEMORY[0x1E4F28568];
    v40 = objc_msgSend_stringWithFormat_(NSString, v17, @"Attempt to parse profile from data: %@ as JSON failed with error: %@", v18, v19, v20, *p_data, v15);
    v67[0] = v40;
    v43 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v41, (uint64_t)v67, (uint64_t)&v66, 1, v42);
    v46 = objc_msgSend_errorWithDomain_code_userInfo_(v39, v44, @"com.apple.koa.profile", 10, (uint64_t)v43, v45);
    id v47 = v46;
    if (a4 && v46)
    {
      id v47 = v46;
      *a4 = v47;
    }
    goto LABEL_12;
  }
  uint64_t v21 = [KVProfileInfo alloc];
  v26 = objc_msgSend_objectForKey_(v9->_profile, v22, @"profileInfo", v23, v24, v25);
  uint64_t v30 = objc_msgSend_initFromDictionary_error_(v21, v27, (uint64_t)v26, (uint64_t)a4, v28, v29);
  profileInfo = v9->_profileInfo;
  v9->_profileInfo = (KVProfileInfo *)v30;

  if (!v9->_profileInfo)
  {
LABEL_13:

    long long v38 = 0;
    goto LABEL_14;
  }
  uint64_t v36 = objc_msgSend_objectForKey_(v9->_profile, v32, @"datasets", v33, v34, v35);
  datasets = v9->_datasets;
  v9->_datasets = (NSArray *)v36;

  if (v9->_datasets)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v49 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v64 = *MEMORY[0x1E4F28568];
      v50 = NSString;
      v51 = (objc_class *)objc_opt_class();
      v40 = NSStringFromClass(v51);
      v43 = objc_msgSend_stringWithFormat_(v50, v52, @"Unexpected datasets array class: %@", v53, v54, v55, v40);
      v65 = v43;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v56, (uint64_t)&v65, (uint64_t)&v64, 1, v57);
      id v47 = (id)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend_errorWithDomain_code_userInfo_(v49, v58, @"com.apple.koa.profile", 10, (uint64_t)v47, v59);
      v61 = v60;
      if (a4 && v60) {
        *a4 = v60;
      }

LABEL_12:
      goto LABEL_13;
    }
  }

LABEL_8:
  long long v38 = v9;
LABEL_14:

  return v38;
}

@end
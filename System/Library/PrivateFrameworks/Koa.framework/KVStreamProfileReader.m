@interface KVStreamProfileReader
- (BOOL)enumerateDatasetsWithError:(id *)a3 usingBlock:(id)a4;
- (KVStreamProfileReader)initWithData:(id)a3 profileInfo:(id)a4 offset:(unsigned int)a5;
- (NSString)description;
- (id)data;
- (id)profileInfo;
@end

@implementation KVStreamProfileReader

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileInfo, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (NSString)description
{
  v5 = objc_msgSend_stringWithFormat_(NSString, a2, @"profile format: %@ info: %@", v2, v3, v4, @"Binary Stream", self->_profileInfo);

  return (NSString *)v5;
}

- (id)profileInfo
{
  return self->_profileInfo;
}

- (BOOL)enumerateDatasetsWithError:(id *)a3 usingBlock:(id)a4
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  v6 = (uint64_t (**)(id, void *))a4;
  uint64_t v12 = objc_msgSend_bytes(self->_data, v7, v8, v9, v10, v11);
  unint64_t offset = self->_offset;
  unint64_t v19 = objc_msgSend_length(self->_data, v14, v15, v16, v17, v18);
  v20 = qword_1EB5EE458;
  if (os_log_type_enabled((os_log_t)qword_1EB5EE458, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v63 = "-[KVStreamProfileReader enumerateDatasetsWithError:usingBlock:]";
    __int16 v64 = 2048;
    unint64_t v65 = v19;
    _os_log_impl(&dword_1BC3B6000, v20, OS_LOG_TYPE_INFO, "%s Linearly scanning profile data (length: %llu) for all datasets.", buf, 0x16u);
  }
  if (v19 <= offset)
  {
LABEL_14:
    BOOL v49 = 1;
  }
  else
  {
    while (1)
    {
      v23 = objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x1E4F1C9B8], v21, v12 + offset, v19 - offset, 0, v22);
      v24 = [KVStreamDatasetReader alloc];
      v28 = objc_msgSend_initWithData_error_(v24, v25, (uint64_t)v23, (uint64_t)a3, v26, v27);
      if (!v28) {
        break;
      }
      v29 = qword_1EB5EE458;
      if (os_log_type_enabled((os_log_t)qword_1EB5EE458, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v63 = "-[KVStreamProfileReader enumerateDatasetsWithError:usingBlock:]";
        __int16 v64 = 2112;
        unint64_t v65 = (unint64_t)v28;
        _os_log_impl(&dword_1BC3B6000, v29, OS_LOG_TYPE_INFO, "%s Reading dataset: %@", buf, 0x16u);
      }
      if ((v6[2](v6, v28) & 1) == 0) {
        break;
      }
      uint64_t v35 = objc_msgSend_offset(v28, v30, v31, v32, v33, v34);
      if (!v35)
      {
        v36 = qword_1EB5EE458;
        if (os_log_type_enabled((os_log_t)qword_1EB5EE458, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          v63 = "-[KVStreamProfileReader enumerateDatasetsWithError:usingBlock:]";
          _os_log_debug_impl(&dword_1BC3B6000, v36, OS_LOG_TYPE_DEBUG, "%s Dataset buffer offset not resolved, enumerating items to resolve offset.", buf, 0xCu);
        }
        if (!objc_msgSend_enumerateItemsWithError_usingBlock_(v28, v37, (uint64_t)a3, (uint64_t)&unk_1F15F18E8, v38, v39))break; {
        uint64_t v35 = objc_msgSend_offset(v28, v40, v41, v42, v43, v44);
        }
        if (!v35)
        {
          v50 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v60 = *MEMORY[0x1E4F28568];
          v51 = objc_msgSend_stringWithFormat_(NSString, v45, @"Cannot enumerate items in dataset: %@ aborting profile enumeration.", v46, v47, v48, v28);
          v61 = v51;
          v54 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v52, (uint64_t)&v61, (uint64_t)&v60, 1, v53);
          v57 = objc_msgSend_errorWithDomain_code_userInfo_(v50, v55, @"com.apple.koa.profile", 3, (uint64_t)v54, v56);
          v58 = v57;
          if (a3 && v57) {
            *a3 = v57;
          }

          break;
        }
      }

      offset += v35;
      if (offset >= v19) {
        goto LABEL_14;
      }
    }

    BOOL v49 = 0;
  }

  return v49;
}

- (id)data
{
  return self->_data;
}

- (KVStreamProfileReader)initWithData:(id)a3 profileInfo:(id)a4 offset:(unsigned int)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)KVStreamProfileReader;
  uint64_t v11 = [(KVStreamProfileReader *)&v14 init];
  uint64_t v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_data, a3);
    objc_storeStrong((id *)&v12->_profileInfo, a4);
    v12->_unint64_t offset = a5;
  }

  return v12;
}

@end
@interface KVLinkOOVItemBuilder
+ (void)initialize;
- (KVLinkOOVItemBuilder)init;
- (id)_buildItemWithError:(id *)a3;
- (id)linkOOVItemWithPhrase:(id)a3 itemId:(id)a4 customPronunciations:(id)a5 error:(id *)a6;
@end

@implementation KVLinkOOVItemBuilder

- (void).cxx_destruct
{
}

- (id)_buildItemWithError:(id *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  builder = self->_builder;
  id v13 = 0;
  v8 = objc_msgSend_buildItemWithError_(builder, a2, (uint64_t)&v13, v3, v4, v5);
  id v9 = v13;
  if (v8)
  {
    id v10 = v8;
    goto LABEL_7;
  }
  v11 = qword_1EB5EE458;
  if (os_log_type_enabled((os_log_t)qword_1EB5EE458, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v15 = "-[KVLinkOOVItemBuilder _buildItemWithError:]";
    __int16 v16 = 2112;
    id v17 = v9;
    _os_log_error_impl(&dword_1BC3B6000, v11, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
    if (!a3) {
      goto LABEL_7;
    }
  }
  else if (!a3)
  {
    goto LABEL_7;
  }
  if (v9) {
    *a3 = v9;
  }
LABEL_7:

  return v8;
}

- (id)linkOOVItemWithPhrase:(id)a3 itemId:(id)a4 customPronunciations:(id)a5 error:(id *)a6
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  builder = self->_builder;
  id v68 = 0;
  v15 = objc_msgSend_setItemType_itemId_error_(builder, v13, 11, (uint64_t)a4, (uint64_t)&v68, v14);
  id v18 = v68;
  if (v15)
  {
    v19 = self->_builder;
    id v67 = v18;
    v20 = objc_msgSend_addFieldWithType_value_error_(v19, v16, 500, (uint64_t)v10, (uint64_t)&v67, v17);
    id v21 = v67;

    if (v20)
    {
      v27 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v22, v23, v24, v25, v26);
      if (objc_msgSend_isEqual_(v11, v28, (uint64_t)v27, v29, v30, v31))
      {
      }
      else
      {
        uint64_t v43 = objc_msgSend_count(v11, v32, v33, v34, v35, v36);

        if (v43)
        {
          v61 = a6;
          long long v65 = 0u;
          long long v66 = 0u;
          long long v63 = 0u;
          long long v64 = 0u;
          id v44 = v11;
          uint64_t v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v44, v45, (uint64_t)&v63, (uint64_t)v69, 16, v46);
          if (v47)
          {
            uint64_t v50 = v47;
            uint64_t v51 = *(void *)v64;
            while (2)
            {
              uint64_t v52 = 0;
              v53 = v21;
              do
              {
                if (*(void *)v64 != v51) {
                  objc_enumerationMutation(v44);
                }
                uint64_t v54 = *(void *)(*((void *)&v63 + 1) + 8 * v52);
                v55 = self->_builder;
                id v62 = v53;
                v56 = objc_msgSend_addFieldWithType_value_error_(v55, v48, 501, v54, (uint64_t)&v62, v49, v61);
                id v21 = v62;

                if (!v56)
                {
                  v60 = qword_1EB5EE458;
                  if (os_log_type_enabled((os_log_t)qword_1EB5EE458, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136315394;
                    v71 = "-[KVLinkOOVItemBuilder linkOOVItemWithPhrase:itemId:customPronunciations:error:]";
                    __int16 v72 = 2112;
                    id v73 = v21;
                    _os_log_error_impl(&dword_1BC3B6000, v60, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
                  }
                  if (v61 && v21) {
                    id *v61 = v21;
                  }

                  v42 = 0;
                  goto LABEL_24;
                }
                ++v52;
                v53 = v21;
              }
              while (v50 != v52);
              uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v44, v48, (uint64_t)&v63, (uint64_t)v69, 16, v49);
              if (v50) {
                continue;
              }
              break;
            }
          }

          v57 = self;
          v58 = v61;
          goto LABEL_23;
        }
      }
      v57 = self;
      v58 = a6;
LABEL_23:
      v42 = objc_msgSend__buildItemWithError_(v57, v37, (uint64_t)v58, v38, v39, v40, v61);
      goto LABEL_24;
    }
    id v18 = v21;
  }
  v41 = qword_1EB5EE458;
  if (os_log_type_enabled((os_log_t)qword_1EB5EE458, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v71 = "-[KVLinkOOVItemBuilder linkOOVItemWithPhrase:itemId:customPronunciations:error:]";
    __int16 v72 = 2112;
    id v73 = v18;
    _os_log_error_impl(&dword_1BC3B6000, v41, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
  }
  v42 = 0;
  if (a6 && v18)
  {
    id v21 = v18;
    v42 = 0;
    *a6 = v21;
  }
  else
  {
    id v21 = v18;
  }
LABEL_24:

  return v42;
}

- (KVLinkOOVItemBuilder)init
{
  v6.receiver = self;
  v6.super_class = (Class)KVLinkOOVItemBuilder;
  v2 = [(KVLinkOOVItemBuilder *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_alloc_init(KVItemBuilder);
    builder = v2->_builder;
    v2->_builder = v3;
  }
  return v2;
}

+ (void)initialize
{
  if (qword_1EB5EE450 != -1) {
    dispatch_once(&qword_1EB5EE450, &unk_1F15F18C8);
  }
}

@end
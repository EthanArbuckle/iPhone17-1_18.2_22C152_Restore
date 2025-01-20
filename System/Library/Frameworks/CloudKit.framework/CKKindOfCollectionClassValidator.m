@interface CKKindOfCollectionClassValidator
- (BOOL)validate:(id)a3 error:(id *)a4;
@end

@implementation CKKindOfCollectionClassValidator

- (BOOL)validate:(id)a3 error:(id *)a4
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_opt_class();
  v50 = a4;
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v6 = v5;
    uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v55, (uint64_t)v66, 16);
    if (v8)
    {
      uint64_t v9 = v8;
      id v49 = v5;
      id v10 = 0;
      uint64_t v11 = *(void *)v56;
      uint64_t v12 = *MEMORY[0x1E4F28568];
      char v13 = 1;
      while (1)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v56 != v11) {
            objc_enumerationMutation(v6);
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
          {
            if (!a4)
            {
              char v13 = 0;
              continue;
            }
LABEL_16:
            v18 = (void *)MEMORY[0x1E4F28C58];
            v64[0] = v12;
            v19 = objc_msgSend_stringWithFormat_(NSString, v15, @"Nested collection classes are not allowed: %@", v16, v6);
            v64[1] = @"ck_isComparisonError";
            v65[0] = v19;
            v65[1] = MEMORY[0x1E4F1CC28];
            v21 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v20, (uint64_t)v65, (uint64_t)v64, 2);
            uint64_t v23 = objc_msgSend_errorWithDomain_code_userInfo_(v18, v22, @"CKErrorDomain", 12, v21);

            a4 = v50;
            char v13 = 0;
            id v10 = (id)v23;
            continue;
          }
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          if (isKindOfClass) {
            char v13 = 0;
          }
          if (a4 && (isKindOfClass & 1) != 0) {
            goto LABEL_16;
          }
        }
        uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v15, (uint64_t)&v55, (uint64_t)v66, 16);
        if (!v9) {
          goto LABEL_19;
        }
      }
    }
    goto LABEL_38;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!a4)
    {
      BOOL v42 = 0;
      id v10 = 0;
      goto LABEL_41;
    }
    v44 = (void *)MEMORY[0x1E4F28C58];
    v59[0] = *MEMORY[0x1E4F28568];
    v45 = objc_msgSend_stringWithFormat_(NSString, v24, @"<%@> is not a collection class", v26, v5);
    v59[1] = @"ck_isComparisonError";
    v60[0] = v45;
    v60[1] = MEMORY[0x1E4F1CC28];
    v47 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v46, (uint64_t)v60, (uint64_t)v59, 2);
    objc_msgSend_errorWithDomain_code_userInfo_(v44, v48, @"CKErrorDomain", 12, v47);
    id v10 = (id)objc_claimAutoreleasedReturnValue();

    BOOL v42 = 0;
    goto LABEL_40;
  }
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  objc_msgSend_allValues(v5, v24, v25, v26);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v27, (uint64_t)&v51, (uint64_t)v63, 16);
  if (v28)
  {
    uint64_t v29 = v28;
    id v49 = v5;
    id v10 = 0;
    uint64_t v30 = *(void *)v52;
    uint64_t v31 = *MEMORY[0x1E4F28568];
    char v13 = 1;
    while (1)
    {
      for (uint64_t j = 0; j != v29; ++j)
      {
        if (*(void *)v52 != v30) {
          objc_enumerationMutation(v6);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
        {
          if (!a4)
          {
            char v13 = 0;
            continue;
          }
LABEL_34:
          v36 = (void *)MEMORY[0x1E4F28C58];
          v61[0] = v31;
          v37 = objc_msgSend_stringWithFormat_(NSString, v33, @"Nested collection classes are not allowed: %@", v34, v49);
          v61[1] = @"ck_isComparisonError";
          v62[0] = v37;
          v62[1] = MEMORY[0x1E4F1CC28];
          v39 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v38, (uint64_t)v62, (uint64_t)v61, 2);
          uint64_t v41 = objc_msgSend_errorWithDomain_code_userInfo_(v36, v40, @"CKErrorDomain", 12, v39);

          a4 = v50;
          char v13 = 0;
          id v10 = (id)v41;
          continue;
        }
        objc_opt_class();
        char v35 = objc_opt_isKindOfClass();
        if (v35) {
          char v13 = 0;
        }
        if (a4 && (v35 & 1) != 0) {
          goto LABEL_34;
        }
      }
      uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v33, (uint64_t)&v51, (uint64_t)v63, 16);
      if (!v29)
      {
LABEL_19:
        id v5 = v49;
        goto LABEL_39;
      }
    }
  }
LABEL_38:
  id v10 = 0;
  char v13 = 1;
LABEL_39:

  BOOL v42 = v13 & 1;
  if (a4)
  {
LABEL_40:
    id v10 = v10;
    *a4 = v10;
  }
LABEL_41:

  return v42;
}

@end
@interface CKCompoundSubpredicateValidator
- (BOOL)validate:(id)a3 error:(id *)a4;
- (CKCompoundSubpredicateValidator)initWithValidator:(id)a3;
- (CKObjectValidating)validator;
- (id)CKPropertiesDescription;
- (void)setValidator:(id)a3;
@end

@implementation CKCompoundSubpredicateValidator

- (CKCompoundSubpredicateValidator)initWithValidator:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CKCompoundSubpredicateValidator;
  id v3 = a3;
  v4 = [(CKCompoundSubpredicateValidator *)&v8 init];
  objc_msgSend_setValidator_(v4, v5, (uint64_t)v3, v6, v8.receiver, v8.super_class);

  return v4;
}

- (BOOL)validate:(id)a3 error:(id *)a4
{
  v56[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  char v11 = isKindOfClass;
  v12 = 0;
  if (a4 && (isKindOfClass & 1) == 0)
  {
    v13 = (void *)MEMORY[0x1E4F28C58];
    v55[0] = *MEMORY[0x1E4F28568];
    v14 = objc_msgSend_stringWithFormat_(NSString, v8, @"<%@> is not a compound predicate", v10, v6);
    v55[1] = @"ck_isComparisonError";
    v56[0] = v14;
    v56[1] = MEMORY[0x1E4F1CC28];
    v16 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v15, (uint64_t)v56, (uint64_t)v55, 2);
    v12 = objc_msgSend_errorWithDomain_code_userInfo_(v13, v17, @"CKErrorDomain", 12, v16);
  }
  if ((v11 & 1) == 0)
  {
    BOOL v33 = 0;
    if (!a4) {
      goto LABEL_26;
    }
    goto LABEL_24;
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  objc_msgSend_subpredicates(v6, v8, v9, v10);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v48, (uint64_t)v54, 16);
  if (v19)
  {
    uint64_t v23 = v19;
    id v45 = v6;
    uint64_t v24 = *(void *)v49;
    while (2)
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v49 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = *(void *)(*((void *)&v48 + 1) + 8 * i);
        v27 = objc_msgSend_validator(self, v20, v21, v22);
        v29 = v27;
        if (a4)
        {
          id v47 = v12;
          char v30 = objc_msgSend_validate_error_(v27, v28, v26, (uint64_t)&v47);
          id v31 = v47;

          if ((v30 & 1) == 0)
          {
            v34 = (void *)MEMORY[0x1E4F28C58];
            v52[0] = *MEMORY[0x1E4F28568];
            v35 = NSString;
            v36 = objc_msgSend_localizedDescription(v31, v20, v21, v22);
            v39 = objc_msgSend_stringWithFormat_(v35, v37, @"Invalid subpredicate <%@>: %@", v38, v26, v36);
            uint64_t v40 = *MEMORY[0x1E4F28A50];
            v53[0] = v39;
            v53[1] = v31;
            v52[1] = v40;
            v52[2] = @"ck_isComparisonError";
            v53[2] = MEMORY[0x1E4F1CC28];
            v42 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v41, (uint64_t)v53, (uint64_t)v52, 3);
            v12 = objc_msgSend_errorWithDomain_code_userInfo_(v34, v43, @"CKErrorDomain", 12, v42);

LABEL_20:
            BOOL v33 = 0;
            goto LABEL_21;
          }
          v12 = v31;
        }
        else
        {
          char v32 = objc_msgSend_validate_error_(v27, v28, v26, 0);

          if ((v32 & 1) == 0) {
            goto LABEL_20;
          }
        }
      }
      uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v20, (uint64_t)&v48, (uint64_t)v54, 16);
      if (v23) {
        continue;
      }
      break;
    }
    BOOL v33 = 1;
LABEL_21:
    id v6 = v45;
  }
  else
  {
    BOOL v33 = 1;
  }

  if (a4)
  {
LABEL_24:
    if (!v33) {
      *a4 = v12;
    }
  }
LABEL_26:

  return v33;
}

- (id)CKPropertiesDescription
{
  v4 = NSString;
  v5 = objc_msgSend_validator(self, a2, v2, v3);
  objc_super v8 = objc_msgSend_stringWithFormat_(v4, v6, @"validator=%@", v7, v5);

  return v8;
}

- (CKObjectValidating)validator
{
  return self->_validator;
}

- (void)setValidator:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
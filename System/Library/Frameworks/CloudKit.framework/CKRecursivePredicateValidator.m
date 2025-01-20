@interface CKRecursivePredicateValidator
- (BOOL)validate:(id)a3 error:(id *)a4;
- (CKObjectValidating)validator;
- (CKRecursivePredicateValidator)initWithValidator:(id)a3;
- (id)CKPropertiesDescription;
- (void)setValidator:(id)a3;
@end

@implementation CKRecursivePredicateValidator

- (CKRecursivePredicateValidator)initWithValidator:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CKRecursivePredicateValidator;
  id v3 = a3;
  v4 = [(CKRecursivePredicateValidator *)&v8 init];
  objc_msgSend_setValidator_(v4, v5, (uint64_t)v3, v6, v8.receiver, v8.super_class);

  return v4;
}

- (BOOL)validate:(id)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v10 = objc_msgSend_validator(self, v7, v8, v9);
  int v12 = objc_msgSend_validate_error_(v10, v11, (uint64_t)v6, (uint64_t)a4);

  if (v12)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      v16 = objc_msgSend_subpredicates(v6, v13, v14, v15, 0);
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v25, (uint64_t)v29, 16);
      if (v18)
      {
        uint64_t v20 = v18;
        uint64_t v21 = *(void *)v26;
        while (2)
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v26 != v21) {
              objc_enumerationMutation(v16);
            }
            if (!objc_msgSend_validate_error_(self, v19, *(void *)(*((void *)&v25 + 1) + 8 * i), (uint64_t)a4))
            {
              BOOL v23 = 0;
              goto LABEL_15;
            }
          }
          uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v19, (uint64_t)&v25, (uint64_t)v29, 16);
          if (v20) {
            continue;
          }
          break;
        }
      }
      BOOL v23 = 1;
LABEL_15:
    }
    else
    {
      BOOL v23 = 1;
    }
  }
  else
  {
    BOOL v23 = 0;
  }

  return v23;
}

- (id)CKPropertiesDescription
{
  v4 = NSString;
  v5 = objc_msgSend_validator(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_stringWithFormat_(v4, v6, @"validator=%@", v7, v5);

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
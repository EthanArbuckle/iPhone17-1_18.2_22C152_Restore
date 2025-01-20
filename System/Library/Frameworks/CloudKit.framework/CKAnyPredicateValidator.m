@interface CKAnyPredicateValidator
- (BOOL)validate:(id)a3 error:(id *)a4;
- (id)CKPropertiesDescription;
@end

@implementation CKAnyPredicateValidator

- (BOOL)validate:(id)a3 error:(id *)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  if (self) {
    validators = self->_validators;
  }
  else {
    validators = 0;
  }
  v8 = validators;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v42, (uint64_t)v46, 16);
  if (!v10)
  {
    v13 = 0;
    goto LABEL_23;
  }
  uint64_t v12 = v10;
  v13 = 0;
  uint64_t v14 = *(void *)v43;
  while (2)
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v43 != v14) {
        objc_enumerationMutation(v8);
      }
      v16 = *(void **)(*((void *)&v42 + 1) + 8 * i);
      if (a4)
      {
        id v41 = 0;
        char v17 = objc_msgSend_validate_error_(v16, v11, (uint64_t)v6, (uint64_t)&v41);
        id v18 = v41;
        v22 = v18;
        if (v17) {
          goto LABEL_30;
        }
        if (objc_msgSend_isComparisonError(v18, v19, v20, v21))
        {
LABEL_15:
          if (!v13)
          {
            v13 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v11, v23, v24);
          }
          objc_msgSend_addObject_(v13, v11, (uint64_t)v22, v24);
        }
        else
        {
          if (!v22) {
            continue;
          }
          objc_msgSend_addObject_(0, v11, (uint64_t)v22, v24);
        }

        continue;
      }
      if (objc_msgSend_validate_error_(v16, v11, (uint64_t)v6, 0))
      {
        v22 = 0;
LABEL_30:

        BOOL v39 = 1;
        goto LABEL_31;
      }
      v22 = 0;
      if (objc_msgSend_isComparisonError(0, v25, v26, v27)) {
        goto LABEL_15;
      }
    }
    uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v42, (uint64_t)v46, 16);
    if (v12) {
      continue;
    }
    break;
  }
LABEL_23:

  if (a4)
  {
    v34 = objc_msgSend_lastObject(0, v28, v29, v30);
    if (!v34 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && objc_msgSend_count(v13, v35, v36, v37))
    {
      uint64_t v38 = objc_msgSend_lastObject(v13, v31, v32, v33);

      v34 = (void *)v38;
    }
    v8 = v34;
    BOOL v39 = 0;
    *a4 = v8;
LABEL_31:
  }
  else
  {
    BOOL v39 = 0;
  }

  return v39;
}

- (id)CKPropertiesDescription
{
  validators = self;
  if (self) {
    validators = self->_validators;
  }
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"validators=%@", v2, validators);
}

- (void).cxx_destruct
{
}

@end
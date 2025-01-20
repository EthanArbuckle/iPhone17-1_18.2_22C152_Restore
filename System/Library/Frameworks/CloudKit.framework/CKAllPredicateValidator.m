@interface CKAllPredicateValidator
- (BOOL)validate:(id)a3 error:(id *)a4;
- (CKAllPredicateValidator)initWithValidators:(id)a3;
- (NSArray)validators;
- (id)CKPropertiesDescription;
- (void)setValidators:(id)a3;
@end

@implementation CKAllPredicateValidator

- (CKAllPredicateValidator)initWithValidators:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CKAllPredicateValidator;
  id v3 = a3;
  v4 = [(CKAllPredicateValidator *)&v8 init];
  objc_msgSend_setValidators_(v4, v5, (uint64_t)v3, v6, v8.receiver, v8.super_class);

  return v4;
}

- (BOOL)validate:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v10 = objc_msgSend_validators(self, v7, v8, v9);
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v24, (uint64_t)v28, 16);
  if (v12)
  {
    uint64_t v14 = v12;
    id v15 = 0;
    uint64_t v16 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v10);
        }
        v18 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (a4)
        {
          id v23 = v15;
          char v19 = objc_msgSend_validate_error_(v18, v13, (uint64_t)v6, (uint64_t)&v23);
          id v20 = v23;

          if ((v19 & 1) == 0)
          {
            id v15 = v20;
            BOOL v21 = 0;
            *a4 = v15;
            goto LABEL_17;
          }
          id v15 = v20;
        }
        else if ((objc_msgSend_validate_error_(v18, v13, (uint64_t)v6, 0) & 1) == 0)
        {
          BOOL v21 = 0;
          goto LABEL_17;
        }
      }
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v24, (uint64_t)v28, 16);
      if (v14) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v15 = 0;
  }
  BOOL v21 = 1;
LABEL_17:

  return v21;
}

- (id)CKPropertiesDescription
{
  v4 = NSString;
  v5 = objc_msgSend_validators(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_stringWithFormat_(v4, v6, @"validators=%@", v7, v5);

  return v8;
}

- (NSArray)validators
{
  return self->_validators;
}

- (void)setValidators:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
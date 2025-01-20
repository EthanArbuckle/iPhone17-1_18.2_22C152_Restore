@interface CKKeyPathExpressionValidator
- (BOOL)validate:(id)a3 error:(id *)a4;
- (CKKeyPathExpressionValidator)initWithValidator:(id)a3;
- (CKObjectValidating)validator;
- (id)CKPropertiesDescription;
- (void)setValidator:(id)a3;
@end

@implementation CKKeyPathExpressionValidator

- (CKKeyPathExpressionValidator)initWithValidator:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CKKeyPathExpressionValidator;
  id v3 = a3;
  v4 = [(CKKeyPathExpressionValidator *)&v8 init];
  objc_msgSend_setValidator_(v4, v5, (uint64_t)v3, v6, v8.receiver, v8.super_class);

  return v4;
}

- (BOOL)validate:(id)a3 error:(id *)a4
{
  v48[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  char v11 = isKindOfClass;
  id v12 = 0;
  if (a4 && (isKindOfClass & 1) == 0)
  {
    v13 = (void *)MEMORY[0x1E4F28C58];
    v47[0] = *MEMORY[0x1E4F28568];
    v14 = objc_msgSend_stringWithFormat_(NSString, v8, @"<%@> is not an expression", v10, v6);
    v47[1] = @"ck_isComparisonError";
    v48[0] = v14;
    v48[1] = MEMORY[0x1E4F1CC38];
    v16 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v15, (uint64_t)v48, (uint64_t)v47, 2);
    objc_msgSend_errorWithDomain_code_userInfo_(v13, v17, @"CKErrorDomain", 12, v16);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  if ((v11 & 1) == 0)
  {
    if (a4)
    {
LABEL_17:
      id v12 = v12;
      char v33 = 0;
      *a4 = v12;
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (objc_msgSend_expressionType(v6, v8, v9, v10) != 3)
  {
    if (a4)
    {
      v34 = (void *)MEMORY[0x1E4F28C58];
      v45[0] = *MEMORY[0x1E4F28568];
      v35 = objc_msgSend_stringWithFormat_(NSString, v18, @"<%@> is not a keyPath expression", v20, v6);
      v45[1] = @"ck_isComparisonError";
      v46[0] = v35;
      v46[1] = MEMORY[0x1E4F1CC38];
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v36, (uint64_t)v46, (uint64_t)v45, 2);
      v38 = LABEL_16:;
      uint64_t v40 = objc_msgSend_errorWithDomain_code_userInfo_(v34, v39, @"CKErrorDomain", 12, v38);

      id v12 = (id)v40;
      goto LABEL_17;
    }
LABEL_18:
    char v33 = 0;
    goto LABEL_19;
  }
  v21 = objc_msgSend_keyPath(v6, v18, v19, v20);

  if (!v21)
  {
    if (a4)
    {
      v34 = (void *)MEMORY[0x1E4F28C58];
      v43[0] = *MEMORY[0x1E4F28568];
      v35 = objc_msgSend_stringWithFormat_(NSString, v22, @"'%@' is not a valid keyPath", v24, v6);
      v43[1] = @"ck_isComparisonError";
      v44[0] = v35;
      v44[1] = MEMORY[0x1E4F1CC38];
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v37, (uint64_t)v44, (uint64_t)v43, 2);
      goto LABEL_16;
    }
    goto LABEL_18;
  }
  v25 = objc_msgSend_validator(self, v22, v23, v24);
  v30 = objc_msgSend_keyPath(v6, v26, v27, v28);
  if (!a4)
  {
    char v33 = objc_msgSend_validate_error_(v25, v29, (uint64_t)v30, 0);

    goto LABEL_19;
  }
  id v42 = v12;
  char v31 = objc_msgSend_validate_error_(v25, v29, (uint64_t)v30, (uint64_t)&v42);
  id v32 = v42;

  if ((v31 & 1) == 0)
  {
    id v12 = v32;
    goto LABEL_17;
  }
  char v33 = 1;
  id v12 = v32;
LABEL_19:

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
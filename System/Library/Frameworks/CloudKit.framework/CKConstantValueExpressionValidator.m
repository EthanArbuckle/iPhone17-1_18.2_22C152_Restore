@interface CKConstantValueExpressionValidator
- (BOOL)validate:(id)a3 error:(id *)a4;
- (CKConstantValueExpressionValidator)initWithValidator:(id)a3;
- (CKObjectValidating)validator;
- (id)CKPropertiesDescription;
- (void)setValidator:(id)a3;
@end

@implementation CKConstantValueExpressionValidator

- (CKConstantValueExpressionValidator)initWithValidator:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CKConstantValueExpressionValidator;
  id v3 = a3;
  v4 = [(CKConstantValueExpressionValidator *)&v8 init];
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
    if (a4) {
      goto LABEL_10;
    }
    goto LABEL_17;
  }
  if (objc_msgSend_expressionType(v6, v8, v9, v10))
  {
    if (a4)
    {
      v21 = (void *)MEMORY[0x1E4F28C58];
      v45[0] = *MEMORY[0x1E4F28568];
      v22 = objc_msgSend_stringWithFormat_(NSString, v18, @"<%@> is not a constantValue expression", v20, v6);
      v45[1] = @"ck_isComparisonError";
      v46[0] = v22;
      v46[1] = MEMORY[0x1E4F1CC38];
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v23, (uint64_t)v46, (uint64_t)v45, 2);
      v24 = LABEL_8:;
      uint64_t v26 = objc_msgSend_errorWithDomain_code_userInfo_(v21, v25, @"CKErrorDomain", 12, v24);

      id v12 = (id)v26;
      goto LABEL_10;
    }
    goto LABEL_17;
  }
  v28 = objc_msgSend_constantValue(v6, v18, v19, v20);

  if (!v28)
  {
    if (a4)
    {
      v21 = (void *)MEMORY[0x1E4F28C58];
      v43[0] = *MEMORY[0x1E4F28568];
      v22 = objc_msgSend_stringWithFormat_(NSString, v29, @"%@ is not a valid constant value", v31, v6);
      v43[1] = @"ck_isComparisonError";
      v44[0] = v22;
      v44[1] = MEMORY[0x1E4F1CC38];
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v40, (uint64_t)v44, (uint64_t)v43, 2);
      goto LABEL_8;
    }
LABEL_17:
    char v27 = 0;
    goto LABEL_18;
  }
  v32 = objc_msgSend_validator(self, v29, v30, v31);
  v37 = objc_msgSend_constantValue(v6, v33, v34, v35);
  if (!a4)
  {
    char v27 = objc_msgSend_validate_error_(v32, v36, (uint64_t)v37, 0);

    goto LABEL_18;
  }
  id v42 = v12;
  char v38 = objc_msgSend_validate_error_(v32, v36, (uint64_t)v37, (uint64_t)&v42);
  id v39 = v42;

  if (v38)
  {
    char v27 = 1;
    id v12 = v39;
    goto LABEL_18;
  }
  id v12 = v39;
LABEL_10:
  id v12 = v12;
  char v27 = 0;
  *a4 = v12;
LABEL_18:

  return v27;
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
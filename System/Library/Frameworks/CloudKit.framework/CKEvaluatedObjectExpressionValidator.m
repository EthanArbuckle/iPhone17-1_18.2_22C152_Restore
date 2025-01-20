@interface CKEvaluatedObjectExpressionValidator
- (BOOL)validate:(id)a3 error:(id *)a4;
@end

@implementation CKEvaluatedObjectExpressionValidator

- (BOOL)validate:(id)a3 error:(id *)a4
{
  v31[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  char v10 = isKindOfClass;
  id v11 = 0;
  if (a4 && (isKindOfClass & 1) == 0)
  {
    v12 = (void *)MEMORY[0x1E4F28C58];
    v30[0] = *MEMORY[0x1E4F28568];
    v13 = objc_msgSend_stringWithFormat_(NSString, v7, @"<%@> is not an expression", v9, v5);
    v30[1] = @"ck_isComparisonError";
    v31[0] = v13;
    v31[1] = MEMORY[0x1E4F1CC38];
    v15 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v14, (uint64_t)v31, (uint64_t)v30, 2);
    objc_msgSend_errorWithDomain_code_userInfo_(v12, v16, @"CKErrorDomain", 12, v15);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  if ((v10 & 1) == 0)
  {
    if (!a4)
    {
      BOOL v20 = 0;
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  uint64_t v17 = objc_msgSend_expressionType(v5, v7, v8, v9);
  BOOL v20 = v17 == 1;
  if (a4 && v17 != 1)
  {
    v21 = (void *)MEMORY[0x1E4F28C58];
    v22 = objc_msgSend_stringWithFormat_(NSString, v18, @"<%@> is not an evaluated object expression", v19, v5, *MEMORY[0x1E4F28568]);
    v28[1] = @"ck_isComparisonError";
    v29[0] = v22;
    v29[1] = MEMORY[0x1E4F1CC38];
    v24 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v23, (uint64_t)v29, (uint64_t)v28, 2);
    uint64_t v26 = objc_msgSend_errorWithDomain_code_userInfo_(v21, v25, @"CKErrorDomain", 12, v24);

    id v11 = (id)v26;
LABEL_9:
    id v11 = v11;
    BOOL v20 = 0;
    *a4 = v11;
  }
LABEL_11:

  return v20;
}

@end
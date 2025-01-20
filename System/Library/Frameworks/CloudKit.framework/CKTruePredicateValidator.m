@interface CKTruePredicateValidator
- (BOOL)validate:(id)a3 error:(id *)a4;
@end

@implementation CKTruePredicateValidator

- (BOOL)validate:(id)a3 error:(id *)a4
{
  v32[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  char v9 = isKindOfClass;
  id v10 = 0;
  if (a4 && (isKindOfClass & 1) == 0)
  {
    v11 = (void *)MEMORY[0x1E4F28C58];
    v31[0] = *MEMORY[0x1E4F28568];
    v12 = objc_msgSend_stringWithFormat_(NSString, v7, @"<%@> is not a predicate", v8, v5);
    v31[1] = @"ck_isComparisonError";
    v32[0] = v12;
    v32[1] = MEMORY[0x1E4F1CC28];
    v14 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v13, (uint64_t)v32, (uint64_t)v31, 2);
    objc_msgSend_errorWithDomain_code_userInfo_(v11, v15, @"CKErrorDomain", 12, v14);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  if ((v9 & 1) == 0)
  {
    if (!a4)
    {
      char isEqual = 0;
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  v16 = objc_msgSend_predicateWithValue_(MEMORY[0x1E4F28F60], v7, 1, v8);
  char isEqual = objc_msgSend_isEqual_(v5, v17, (uint64_t)v16, v18);

  if (a4 && (isEqual & 1) == 0)
  {
    v22 = (void *)MEMORY[0x1E4F28C58];
    v23 = objc_msgSend_stringWithFormat_(NSString, v20, @"Invalid predicate %@", v21, v5, *MEMORY[0x1E4F28568]);
    v29[1] = @"ck_isComparisonError";
    v30[0] = v23;
    v30[1] = MEMORY[0x1E4F1CC28];
    v25 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v24, (uint64_t)v30, (uint64_t)v29, 2);
    uint64_t v27 = objc_msgSend_errorWithDomain_code_userInfo_(v22, v26, @"CKErrorDomain", 12, v25);

    id v10 = (id)v27;
LABEL_9:
    id v10 = v10;
    char isEqual = 0;
    *a4 = v10;
  }
LABEL_11:

  return isEqual;
}

@end
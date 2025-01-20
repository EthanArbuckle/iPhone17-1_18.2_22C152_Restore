@interface CKComparisonOptionsValidator
- (BOOL)validate:(id)a3 error:(id *)a4;
- (id)CKPropertiesDescription;
@end

@implementation CKComparisonOptionsValidator

- (BOOL)validate:(id)a3 error:(id *)a4
{
  v43[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  char v11 = isKindOfClass;
  id v12 = 0;
  if (a4 && (isKindOfClass & 1) == 0)
  {
    v13 = (void *)MEMORY[0x1E4F28C58];
    v42[0] = *MEMORY[0x1E4F28568];
    v14 = objc_msgSend_stringWithFormat_(NSString, v8, @"<%@> is not a comparison predicate", v10, v6);
    v42[1] = @"ck_isComparisonError";
    v43[0] = v14;
    v43[1] = MEMORY[0x1E4F1CC38];
    v16 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v15, (uint64_t)v43, (uint64_t)v42, 2);
    objc_msgSend_errorWithDomain_code_userInfo_(v13, v17, @"CKErrorDomain", 12, v16);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  if ((v11 & 1) == 0)
  {
    if (a4)
    {
LABEL_16:
      id v12 = v12;
      BOOL v23 = 0;
      *a4 = v12;
      goto LABEL_17;
    }
    goto LABEL_12;
  }
  uint64_t v18 = objc_msgSend_options(v6, v8, v9, v10);
  if (!self) {
    goto LABEL_13;
  }
  unint64_t options = self->_options;
  if ((options & ~v18) != 0)
  {
    if (a4)
    {
LABEL_15:
      v25 = (void *)MEMORY[0x1E4F28C58];
      v40[0] = *MEMORY[0x1E4F28568];
      v26 = NSString;
      char v27 = objc_msgSend_options(v6, v19, v20, v21);
      v31 = sub_18B15C6B8(v27, v28, v29, v30);
      v34 = objc_msgSend_stringWithFormat_(v26, v32, @"Unsupported comparison options: %@", v33, v31);
      v40[1] = @"ck_isComparisonError";
      v41[0] = v34;
      v41[1] = MEMORY[0x1E4F1CC38];
      v36 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v35, (uint64_t)v41, (uint64_t)v40, 2);
      uint64_t v38 = objc_msgSend_errorWithDomain_code_userInfo_(v25, v37, @"CKErrorDomain", 12, v36);

      id v12 = (id)v38;
      goto LABEL_16;
    }
LABEL_12:
    BOOL v23 = 0;
    goto LABEL_17;
  }
  if (options)
  {
    BOOL v23 = 1;
    goto LABEL_17;
  }
LABEL_13:
  uint64_t v24 = objc_msgSend_options(v6, v19, v20, v21);
  BOOL v23 = v24 == 0;
  if (a4 && v24) {
    goto LABEL_15;
  }
LABEL_17:

  return v23;
}

- (id)CKPropertiesDescription
{
  v4 = NSString;
  if (self) {
    self = (CKComparisonOptionsValidator *)self->_options;
  }
  v5 = sub_18B15C6B8((char)self, a2, v2, v3);
  v8 = objc_msgSend_stringWithFormat_(v4, v6, @"options=%@", v7, v5);

  return v8;
}

@end
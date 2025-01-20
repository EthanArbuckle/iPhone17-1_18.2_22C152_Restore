@interface CKComparisonOperatorValidator
- (BOOL)validate:(id)a3 error:(id *)a4;
- (CKComparisonOperatorValidator)initWithOperatorType:(unint64_t)a3;
- (id)CKPropertiesDescription;
- (unint64_t)operatorType;
- (void)setOperatorType:(unint64_t)a3;
@end

@implementation CKComparisonOperatorValidator

- (CKComparisonOperatorValidator)initWithOperatorType:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CKComparisonOperatorValidator;
  v4 = [(CKComparisonOperatorValidator *)&v8 init];
  objc_msgSend_setOperatorType_(v4, v5, a3, v6);
  return v4;
}

- (BOOL)validate:(id)a3 error:(id *)a4
{
  v45[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  char v11 = isKindOfClass;
  id v12 = 0;
  if (a4 && (isKindOfClass & 1) == 0)
  {
    v13 = (void *)MEMORY[0x1E4F28C58];
    v44[0] = *MEMORY[0x1E4F28568];
    v14 = objc_msgSend_stringWithFormat_(NSString, v8, @"<%@> is not a comparison predicate", v10, v6);
    v44[1] = @"ck_isComparisonError";
    v45[0] = v14;
    v45[1] = MEMORY[0x1E4F1CC38];
    v16 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v15, (uint64_t)v45, (uint64_t)v44, 2);
    objc_msgSend_errorWithDomain_code_userInfo_(v13, v17, @"CKErrorDomain", 12, v16);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  if ((v11 & 1) == 0)
  {
    if (!a4)
    {
      BOOL v26 = 0;
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  uint64_t v18 = objc_msgSend_predicateOperatorType(v6, v8, v9, v10);
  uint64_t v22 = objc_msgSend_operatorType(self, v19, v20, v21);
  BOOL v26 = v18 == v22;
  if (a4 && v18 != v22)
  {
    v27 = (void *)MEMORY[0x1E4F28C58];
    v42[0] = *MEMORY[0x1E4F28568];
    v28 = NSString;
    uint64_t v29 = objc_msgSend_predicateOperatorType(v6, v23, v24, v25);
    v33 = sub_18B15BD94(v29, v30, v31, v32);
    v36 = objc_msgSend_stringWithFormat_(v28, v34, @"Unsupported operator: %@", v35, v33);
    v42[1] = @"ck_isComparisonError";
    v43[0] = v36;
    v43[1] = MEMORY[0x1E4F1CC38];
    v38 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v37, (uint64_t)v43, (uint64_t)v42, 2);
    uint64_t v40 = objc_msgSend_errorWithDomain_code_userInfo_(v27, v39, @"CKErrorDomain", 12, v38);

    id v12 = (id)v40;
LABEL_9:
    id v12 = v12;
    BOOL v26 = 0;
    *a4 = v12;
  }
LABEL_11:

  return v26;
}

- (id)CKPropertiesDescription
{
  v4 = NSString;
  uint64_t v5 = objc_msgSend_operatorType(self, a2, v2, v3);
  uint64_t v9 = sub_18B15BD94(v5, v6, v7, v8);
  id v12 = objc_msgSend_stringWithFormat_(v4, v10, @"operator=%@", v11, v9);

  return v12;
}

- (unint64_t)operatorType
{
  return self->_operatorType;
}

- (void)setOperatorType:(unint64_t)a3
{
  self->_operatorType = a3;
}

@end
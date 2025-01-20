@interface CKStringValueValidator
- (BOOL)validate:(id)a3 error:(id *)a4;
- (CKStringValueValidator)initWithValue:(id)a3;
- (NSString)value;
- (id)CKPropertiesDescription;
- (void)setValue:(id)a3;
@end

@implementation CKStringValueValidator

- (CKStringValueValidator)initWithValue:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CKStringValueValidator;
  id v3 = a3;
  v4 = [(CKStringValueValidator *)&v8 init];
  objc_msgSend_setValue_(v4, v5, (uint64_t)v3, v6, v8.receiver, v8.super_class);

  return v4;
}

- (BOOL)validate:(id)a3 error:(id *)a4
{
  v34[2] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (objc_class *)a3;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (!a4) {
      goto LABEL_9;
    }
    v17 = (void *)MEMORY[0x1E4F28C58];
    v33[0] = *MEMORY[0x1E4F28568];
    v18 = NSString;
    v19 = NSStringFromClass(v6);
    v22 = objc_msgSend_stringWithFormat_(v18, v20, @"%@ is not a string (%@)", v21, v6, v19);
    v33[1] = @"ck_isComparisonError";
    v34[0] = v22;
    v34[1] = MEMORY[0x1E4F1CC28];
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v23, (uint64_t)v34, (uint64_t)v33, 2);
    v28 = LABEL_8:;
    objc_msgSend_errorWithDomain_code_userInfo_(v17, v29, @"CKErrorDomain", 12, v28);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a4) = 0;
    goto LABEL_9;
  }
  v10 = objc_msgSend_value(self, v7, v8, v9);
  char isEqualToString = objc_msgSend_isEqualToString_(v6, v11, (uint64_t)v10, v12);

  if ((isEqualToString & 1) == 0)
  {
    if (!a4) {
      goto LABEL_9;
    }
    v17 = (void *)MEMORY[0x1E4F28C58];
    v31[0] = *MEMORY[0x1E4F28568];
    v24 = NSString;
    v19 = objc_msgSend_value(self, v14, v15, v16);
    v22 = objc_msgSend_stringWithFormat_(v24, v25, @"%@ is not equal to %@", v26, v6, v19);
    v31[1] = @"ck_isComparisonError";
    v32[0] = v22;
    v32[1] = MEMORY[0x1E4F1CC28];
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v27, (uint64_t)v32, (uint64_t)v31, 2);
    goto LABEL_8;
  }
  LOBYTE(a4) = 1;
LABEL_9:

  return (char)a4;
}

- (id)CKPropertiesDescription
{
  v4 = NSString;
  v5 = objc_msgSend_value(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_stringWithFormat_(v4, v6, @"value=%@", v7, v5);

  return v8;
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
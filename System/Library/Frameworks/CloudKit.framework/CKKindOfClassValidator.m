@interface CKKindOfClassValidator
- (BOOL)validate:(id)a3 error:(id *)a4;
- (id)CKPropertiesDescription;
@end

@implementation CKKindOfClassValidator

- (BOOL)validate:(id)a3 error:(id *)a4
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char isKindOfClass = objc_opt_isKindOfClass();
  char v8 = isKindOfClass;
  if (a4 && (isKindOfClass & 1) == 0)
  {
    v9 = (void *)MEMORY[0x1E4F28C58];
    v20[0] = *MEMORY[0x1E4F28568];
    v10 = NSString;
    if (self) {
      parentClass = self->_parentClass;
    }
    else {
      parentClass = 0;
    }
    v12 = NSStringFromClass(parentClass);
    v15 = objc_msgSend_stringWithFormat_(v10, v13, @"<%@> is not of type %@", v14, v6, v12);
    v20[1] = @"ck_isComparisonError";
    v21[0] = v15;
    v21[1] = MEMORY[0x1E4F1CC28];
    v17 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v16, (uint64_t)v21, (uint64_t)v20, 2);
    objc_msgSend_errorWithDomain_code_userInfo_(v9, v18, @"CKErrorDomain", 12, v17);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v8 & 1;
}

- (id)CKPropertiesDescription
{
  v2 = NSString;
  if (self) {
    self = (CKKindOfClassValidator *)self->_parentClass;
  }
  v3 = NSStringFromClass((Class)self);
  id v6 = objc_msgSend_stringWithFormat_(v2, v4, @"class=%@", v5, v3);

  return v6;
}

- (void).cxx_destruct
{
}

@end
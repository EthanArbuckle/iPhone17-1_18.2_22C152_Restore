@interface CKNilValidator
- (BOOL)validate:(id)a3 error:(id *)a4;
@end

@implementation CKNilValidator

- (BOOL)validate:(id)a3 error:(id *)a4
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v9 = objc_msgSend_constantValue(v5, v6, v7, v8);

  if (a4 && v9)
  {
    v12 = (void *)MEMORY[0x1E4F28C58];
    v13 = objc_msgSend_stringWithFormat_(NSString, v10, @"<%@> is not 'nil'", v11, v5, *MEMORY[0x1E4F28568]);
    v18[1] = @"ck_isComparisonError";
    v19[0] = v13;
    v19[1] = MEMORY[0x1E4F1CC28];
    v15 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v14, (uint64_t)v19, (uint64_t)v18, 2);
    objc_msgSend_errorWithDomain_code_userInfo_(v12, v16, @"CKErrorDomain", 12, v15);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v9 == 0;
}

@end
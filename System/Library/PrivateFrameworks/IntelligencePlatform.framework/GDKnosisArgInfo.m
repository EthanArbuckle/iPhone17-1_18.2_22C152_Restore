@interface GDKnosisArgInfo
+ (BOOL)supportsSecureCoding;
- (GDKnosisArgInfo)initWithCoder:(id)a3;
- (GDKnosisArgInfo)initWithValue:(id)a3 arg:(id)a4;
- (NSString)arg;
- (NSString)value;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GDKnosisArgInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arg, 0);

  objc_storeStrong((id *)&self->_value, 0);
}

- (NSString)arg
{
  return self->_arg;
}

- (NSString)value
{
  return self->_value;
}

- (GDKnosisArgInfo)initWithCoder:(id)a3
{
  v45[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(sel_value);
  v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, (uint64_t)v6, v8);

  if (v9)
  {
    uint64_t v14 = objc_opt_class();
    v15 = NSStringFromSelector("arg");
    v18 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v14, (uint64_t)v15, v17);

    if (v18)
    {
      self = (GDKnosisArgInfo *)(id)objc_msgSend_initWithValue_arg_(self, v19, (uint64_t)v9, (uint64_t)v18, v22);
      v23 = self;
LABEL_11:

      goto LABEL_12;
    }
    v26 = objc_msgSend_error(v4, v19, v20, v21, v22);

    if (!v26)
    {
      v28 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v42 = *MEMORY[0x1E4F28568];
      v43 = @"GDKnosisArgInfo arg is nil";
      v29 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v27, (uint64_t)&v43, (uint64_t)&v42, 1);
      v31 = objc_msgSend_errorWithDomain_code_userInfo_(v28, v30, @"GDErrorDomain", 9, (uint64_t)v29);
      objc_msgSend_failWithError_(v4, v32, (uint64_t)v31, v33, v34);
    }
    v18 = 0;
LABEL_10:
    v23 = 0;
    goto LABEL_11;
  }
  v24 = objc_msgSend_error(v4, v10, v11, v12, v13);

  if (!v24)
  {
    v35 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v44 = *MEMORY[0x1E4F28568];
    v45[0] = @"GDKnosisArgInfo value is nil";
    v18 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v25, (uint64_t)v45, (uint64_t)&v44, 1);
    v37 = objc_msgSend_errorWithDomain_code_userInfo_(v35, v36, @"GDErrorDomain", 9, (uint64_t)v18);
    objc_msgSend_failWithError_(v4, v38, (uint64_t)v37, v39, v40);

    goto LABEL_10;
  }
  v23 = 0;
LABEL_12:

  return v23;
}

- (void)encodeWithCoder:(id)a3
{
  value = self->_value;
  id v5 = a3;
  v6 = NSStringFromSelector(sel_value);
  objc_msgSend_encodeObject_forKey_(v5, v7, (uint64_t)value, (uint64_t)v6, v8);

  arg = self->_arg;
  NSStringFromSelector("arg");
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v10, (uint64_t)arg, (uint64_t)v12, v11);
}

- (GDKnosisArgInfo)initWithValue:(id)a3 arg:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)GDKnosisArgInfo;
  id v12 = [(GDKnosisArgInfo *)&v22 init];
  if (v12)
  {
    uint64_t v13 = objc_msgSend_copy(v6, v8, v9, v10, v11);
    value = v12->_value;
    v12->_value = (NSString *)v13;

    uint64_t v19 = objc_msgSend_copy(v7, v15, v16, v17, v18);
    arg = v12->_arg;
    v12->_arg = (NSString *)v19;
  }
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
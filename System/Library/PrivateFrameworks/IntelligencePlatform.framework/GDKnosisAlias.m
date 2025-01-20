@interface GDKnosisAlias
+ (BOOL)supportsSecureCoding;
- (GDKnosisAlias)initWithCoder:(id)a3;
- (GDKnosisAlias)initWithPrimary:(id)a3;
- (NSString)primary;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GDKnosisAlias

- (void).cxx_destruct
{
}

- (NSString)primary
{
  return self->_primary;
}

- (GDKnosisAlias)initWithCoder:(id)a3
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(sel_primary);
  v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, (uint64_t)v6, v8);

  if (v9)
  {
    self = (GDKnosisAlias *)(id)objc_msgSend_initWithPrimary_(self, v10, (uint64_t)v9, v12, v13);
    v14 = self;
  }
  else
  {
    v15 = objc_msgSend_error(v4, v10, v11, v12, v13);

    if (!v15)
    {
      v17 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v25 = *MEMORY[0x1E4F28568];
      v26[0] = @"GDKnosisAlias primary is nil";
      v18 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v16, (uint64_t)v26, (uint64_t)&v25, 1);
      v20 = objc_msgSend_errorWithDomain_code_userInfo_(v17, v19, @"GDErrorDomain", 9, (uint64_t)v18);
      objc_msgSend_failWithError_(v4, v21, (uint64_t)v20, v22, v23);
    }
    v14 = 0;
  }

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  primary = self->_primary;
  id v4 = a3;
  NSStringFromSelector(sel_primary);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)primary, (uint64_t)v7, v6);
}

- (GDKnosisAlias)initWithPrimary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GDKnosisAlias;
  v9 = [(GDKnosisAlias *)&v13 init];
  if (v9)
  {
    uint64_t v10 = objc_msgSend_copy(v4, v5, v6, v7, v8);
    primary = v9->_primary;
    v9->_primary = (NSString *)v10;
  }
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
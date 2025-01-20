@interface GDEntitySourceID
+ (BOOL)supportsSecureCoding;
- (GDEntitySourceID)initWithCoder:(id)a3;
- (GDEntitySourceID)initWithValue:(id)a3;
- (GDEntitySourceID)initWithValue:(id)a3 source:(id)a4;
- (NSString)source;
- (NSString)value;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GDEntitySourceID

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);

  objc_storeStrong((id *)&self->_value, 0);
}

- (NSString)source
{
  return self->_source;
}

- (NSString)value
{
  return self->_value;
}

- (id)description
{
  v6 = NSString;
  v7 = objc_msgSend_value(self, a2, v2, v3, v4);
  v12 = objc_msgSend_source(self, v8, v9, v10, v11);
  v16 = objc_msgSend_stringWithFormat_(v6, v13, @"<GDEntitySourceID: %@, source: %@>", v14, v15, v7, v12);

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  uint64_t v9 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  value = self->_value;
  source = self->_source;

  return (id)objc_msgSend_initWithValue_source_(v9, v10, (uint64_t)value, (uint64_t)source, v11);
}

- (GDEntitySourceID)initWithCoder:(id)a3
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v12 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, @"value", v7);
  if (v12)
  {
    uint64_t v13 = objc_opt_class();
    v20 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v13, @"source", v15);
    if (v20
      || (objc_msgSend_error(v4, v16, v17, v18, v19),
          v31 = objc_claimAutoreleasedReturnValue(),
          v31,
          !v31))
    {
      self = (GDEntitySourceID *)(id)objc_msgSend_initWithValue_source_(self, v16, (uint64_t)v12, (uint64_t)v20, v19);
      v21 = self;
    }
    else
    {
      v21 = 0;
    }
  }
  else
  {
    v22 = objc_msgSend_error(v4, v8, v9, v10, v11);

    if (!v22)
    {
      v24 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v33 = *MEMORY[0x1E4F28568];
      v34[0] = @"GDEntityResolution value is nil";
      v25 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v23, (uint64_t)v34, (uint64_t)&v33, 1);
      v27 = objc_msgSend_errorWithDomain_code_userInfo_(v24, v26, @"GDErrorDomain", 9, (uint64_t)v25);
      objc_msgSend_failWithError_(v4, v28, (uint64_t)v27, v29, v30);
    }
    v21 = 0;
  }

  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  value = self->_value;
  id v9 = a3;
  objc_msgSend_encodeObject_forKey_(v9, v5, (uint64_t)value, @"value", v6);
  objc_msgSend_encodeObject_forKey_(v9, v7, (uint64_t)self->_source, @"source", v8);
}

- (GDEntitySourceID)initWithValue:(id)a3 source:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)GDEntitySourceID;
  v12 = [(GDEntitySourceID *)&v22 init];
  if (v12)
  {
    uint64_t v13 = objc_msgSend_copy(v6, v8, v9, v10, v11);
    value = v12->_value;
    v12->_value = (NSString *)v13;

    uint64_t v19 = objc_msgSend_copy(v7, v15, v16, v17, v18);
    source = v12->_source;
    v12->_source = (NSString *)v19;
  }
  return v12;
}

- (GDEntitySourceID)initWithValue:(id)a3
{
  return (GDEntitySourceID *)objc_msgSend_initWithValue_source_(self, a2, (uint64_t)a3, 0, v3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
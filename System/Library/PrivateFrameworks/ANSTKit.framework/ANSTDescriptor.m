@interface ANSTDescriptor
+ (BOOL)supportsSecureCoding;
+ (id)new;
- (ANSTDescriptor)init;
- (ANSTDescriptor)initWithCoder:(id)a3;
- (ANSTDescriptor)initWithName:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ANSTDescriptor

- (ANSTDescriptor)init
{
  result = (ANSTDescriptor *)objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

+ (id)new
{
  id result = (id)objc_msgSend_doesNotRecognizeSelector_(a1, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTDescriptor)initWithName:(id)a3 error:(id *)a4
{
  v20[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ANSTDescriptor;
  v9 = [(ANSTDescriptor *)&v18 init];
  if (!v9) {
    goto LABEL_4;
  }
  if (objc_msgSend_length(v6, v7, v8))
  {
    uint64_t v12 = objc_msgSend_copy(v6, v10, v11);
    name = v9->_name;
    v9->_name = (NSString *)v12;

LABEL_4:
    a4 = v9;
    goto LABEL_5;
  }
  if (a4)
  {
    v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v19 = *MEMORY[0x263F07F80];
    v20[0] = @"Descriptor name should not be empty.";
    v16 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v10, (uint64_t)v20, &v19, 1);
    objc_msgSend_errorWithDomain_code_userInfo_(v15, v17, @"ANSTErrorDomain", 7, v16);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }
LABEL_5:

  return (ANSTDescriptor *)a4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ANSTDescriptor *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char isEqualToString = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v8 = objc_msgSend_name(self, v6, v7);
    uint64_t v11 = objc_msgSend_name(v5, v9, v10);
    char isEqualToString = objc_msgSend_isEqualToString_(v8, v12, (uint64_t)v11);
  }
  else
  {
    char isEqualToString = 0;
  }

  return isEqualToString;
}

- (unint64_t)hash
{
  v3 = objc_msgSend_name(self, a2, v2);
  unint64_t v6 = objc_msgSend_hash(v3, v4, v5);

  return v6;
}

- (id)debugDescription
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v8 = objc_msgSend_name(self, v6, v7);
  uint64_t v10 = objc_msgSend_stringWithFormat_(v3, v9, @"<%@ %p> %@", v5, self, v8);

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_name(self, v8, v9);
  uint64_t v12 = objc_msgSend_initWithName_error_(v7, v11, (uint64_t)v10, 0);

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend_name(self, v5, v6);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = NSStringFromSelector(sel_name);
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)v9, v7);
}

- (ANSTDescriptor)initWithCoder:(id)a3
{
  v25[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = NSStringFromSelector(sel_name);
  uint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, v6);

  if (v8)
  {
    v23.receiver = self;
    v23.super_class = (Class)ANSTDescriptor;
    uint64_t v12 = [(ANSTDescriptor *)&v23 init];
    if (v12)
    {
      uint64_t v13 = objc_msgSend_copy(v8, v10, v11);
      name = v12->_name;
      v12->_name = (NSString *)v13;
    }
    self = v12;
    v15 = self;
  }
  else
  {
    v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v17 = *MEMORY[0x263F07F70];
    uint64_t v24 = *MEMORY[0x263F07F80];
    v25[0] = @"Descriptor name was not encoded.";
    objc_super v18 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v9, (uint64_t)v25, &v24, 1);
    v20 = objc_msgSend_errorWithDomain_code_userInfo_(v16, v19, v17, 4865, v18);
    objc_msgSend_failWithError_(v4, v21, (uint64_t)v20);

    v15 = 0;
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
}

@end
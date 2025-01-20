@interface CKRoughlyEquivalentProperties
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CKRoughlyEquivalentProperties)initWithCoder:(id)a3;
- (CKRoughlyEquivalentProperties)initWithDictionary:(id)a3;
- (NSDictionary)dictionary;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKRoughlyEquivalentProperties

- (CKRoughlyEquivalentProperties)initWithDictionary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKRoughlyEquivalentProperties;
  v6 = [(CKRoughlyEquivalentProperties *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dictionary, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend_dictionary(self, v5, v6, v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  v8 = NSStringFromSelector(sel_dictionary);
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v10, (uint64_t)v8);
}

- (CKRoughlyEquivalentProperties)initWithCoder:(id)a3
{
  v17[8] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CKRoughlyEquivalentProperties;
  id v5 = [(CKRoughlyEquivalentProperties *)&v16 init];
  if (v5)
  {
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    v17[2] = objc_opt_class();
    v17[3] = objc_opt_class();
    v17[4] = objc_opt_class();
    v17[5] = objc_opt_class();
    v17[6] = objc_opt_class();
    v17[7] = objc_opt_class();
    uint64_t v7 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v6, (uint64_t)v17, 8);
    id v10 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], v8, (uint64_t)v7, v9);
    v11 = NSStringFromSelector(sel_dictionary);
    uint64_t v13 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v12, (uint64_t)v10, (uint64_t)v11);
    dictionary = v5->_dictionary;
    v5->_dictionary = (NSDictionary *)v13;
  }
  return v5;
}

- (unint64_t)hash
{
  id v4 = objc_msgSend_dictionary(self, a2, v2, v3);
  unint64_t v8 = objc_msgSend_hash(v4, v5, v6, v7);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CKRoughlyEquivalentProperties *)a3;
  if (self == v4)
  {
    char isEqual = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (objc_msgSend_isMemberOfClass_(v4, v6, v5, v7))
    {
      unint64_t v8 = v4;
      v12 = objc_msgSend_dictionary(self, v9, v10, v11);
      objc_super v16 = objc_msgSend_dictionary(v8, v13, v14, v15);

      char isEqual = objc_msgSend_isEqual_(v12, v17, (uint64_t)v16, v18);
    }
    else
    {
      char isEqual = 0;
    }
  }

  return isEqual;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void).cxx_destruct
{
}

@end
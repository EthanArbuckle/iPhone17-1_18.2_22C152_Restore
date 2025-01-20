@interface IDSSigningOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (IDSSigningKeyDiversifier)keyDiversifier;
- (IDSSigningOptions)init;
- (IDSSigningOptions)initWithCoder:(id)a3;
- (IDSSigningOptions)initWithKeyType:(unsigned int)a3 diversifier:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unsigned)keyType;
- (void)encodeWithCoder:(id)a3;
- (void)setKeyDiversifier:(id)a3;
- (void)setKeyType:(unsigned int)a3;
@end

@implementation IDSSigningOptions

- (IDSSigningOptions)init
{
  return (IDSSigningOptions *)objc_msgSend_initWithKeyType_diversifier_(self, a2, 0, v2, 0);
}

- (IDSSigningOptions)initWithKeyType:(unsigned int)a3 diversifier:(id)a4
{
  id v7 = a4;
  if (IDSIsValidSigningKeyType(a3))
  {
    v12.receiver = self;
    v12.super_class = (Class)IDSSigningOptions;
    v8 = [(IDSSigningOptions *)&v12 init];
    v9 = v8;
    if (v8)
    {
      v8->_keyType = a3;
      objc_storeStrong((id *)&v8->_keyDiversifier, a4);
    }
    self = v9;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (IDSSigningOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  unsigned int v7 = objc_msgSend_decodeIntegerForKey_(v4, v5, @"kT", v6);
  if (IDSIsValidSigningKeyType(v7))
  {
    v17.receiver = self;
    v17.super_class = (Class)IDSSigningOptions;
    v8 = [(IDSSigningOptions *)&v17 init];
    v9 = v8;
    if (v8)
    {
      v8->_keyType = v7;
      uint64_t v10 = objc_opt_class();
      uint64_t v13 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, v12, @"kD");
      keyDiversifier = v9->_keyDiversifier;
      v9->_keyDiversifier = (IDSSigningKeyDiversifier *)v13;
    }
    self = v9;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  unsigned int v8 = objc_msgSend_keyType(self, v5, v6, v7);
  objc_msgSend_encodeInteger_forKey_(v4, v9, v8, v10, @"kT");
  objc_msgSend_keyDiversifier(self, v11, v12, v13);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v14, (uint64_t)v16, v15, @"kD");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = self;
  uint64_t v7 = objc_msgSend_keyType(v3, v4, v5, v6);
  v11 = objc_msgSend_keyDiversifier(v3, v8, v9, v10);
  v14 = objc_msgSend_initWithKeyType_diversifier_(v3, v12, v7, v13, v11);

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (IDSSigningOptions *)a3;
  if (self == v4)
  {
    char isEqual = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      int v9 = objc_msgSend_keyType(v5, v6, v7, v8);
      if (v9 == objc_msgSend_keyType(self, v10, v11, v12))
      {
        id v16 = objc_msgSend_keyDiversifier(v5, v13, v14, v15);
        v20 = objc_msgSend_keyDiversifier(self, v17, v18, v19);
        char isEqual = objc_msgSend_isEqual_(v16, v21, (uint64_t)v20, v22);
      }
      else
      {
        char isEqual = 0;
      }
    }
    else
    {
      char isEqual = 0;
    }
  }

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v5 = objc_msgSend_keyType(self, a2, v2, v3);
  int v9 = objc_msgSend_keyDiversifier(self, v6, v7, v8);
  unint64_t v13 = objc_msgSend_hash(v9, v10, v11, v12) ^ v5;

  return v13;
}

- (id)description
{
  double v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v8 = objc_msgSend_keyType(self, v5, v6, v7);
  double v12 = objc_msgSend_keyDiversifier(self, v9, v10, v11);
  double v15 = objc_msgSend_stringWithFormat_(v3, v13, @"<%@: %p keyType: %ld, diversifier: %@>", v14, v4, self, v8, v12);

  return v15;
}

- (unsigned)keyType
{
  return self->_keyType;
}

- (void)setKeyType:(unsigned int)a3
{
  self->_keyType = a3;
}

- (IDSSigningKeyDiversifier)keyDiversifier
{
  return self->_keyDiversifier;
}

- (void)setKeyDiversifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
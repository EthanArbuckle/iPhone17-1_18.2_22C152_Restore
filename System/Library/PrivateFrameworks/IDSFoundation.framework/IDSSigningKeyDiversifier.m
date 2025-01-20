@interface IDSSigningKeyDiversifier
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (IDSSigningKeyDiversifier)initWithCoder:(id)a3;
- (IDSSigningKeyDiversifier)initWithDiversifier:(id)a3 trackingPreventionSecret:(id)a4;
- (NSData)trackingPreventionSecret;
- (NSString)diversifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDiversifier:(id)a3;
- (void)setTrackingPreventionSecret:(id)a3;
@end

@implementation IDSSigningKeyDiversifier

- (IDSSigningKeyDiversifier)initWithDiversifier:(id)a3 trackingPreventionSecret:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  v10 = 0;
  if (v7 && v8)
  {
    v14.receiver = self;
    v14.super_class = (Class)IDSSigningKeyDiversifier;
    v11 = [(IDSSigningKeyDiversifier *)&v14 init];
    p_isa = (id *)&v11->super.isa;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_diversifier, a3);
      objc_storeStrong(p_isa + 2, a4);
    }
    self = p_isa;
    v10 = self;
  }

  return v10;
}

- (IDSSigningKeyDiversifier)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, v7, @"dS");
  uint64_t v9 = objc_opt_class();
  v12 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v10, v9, v11, @"tPS");

  v15 = (IDSSigningKeyDiversifier *)objc_msgSend_initWithDiversifier_trackingPreventionSecret_(self, v13, (uint64_t)v8, v14, v12);
  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v8 = objc_msgSend_diversifier(self, v5, v6, v7);
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v8, v10, @"dS");

  objc_msgSend_trackingPreventionSecret(self, v11, v12, v13);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v14, (uint64_t)v16, v15, @"tPS");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = self;
  double v7 = objc_msgSend_diversifier(v3, v4, v5, v6);
  double v11 = objc_msgSend_trackingPreventionSecret(v3, v8, v9, v10);
  double v14 = objc_msgSend_initWithDiversifier_trackingPreventionSecret_(v3, v12, (uint64_t)v7, v13, v11);

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (IDSSigningKeyDiversifier *)a3;
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
      uint64_t v9 = objc_msgSend_diversifier(v5, v6, v7, v8);
      double v13 = objc_msgSend_diversifier(self, v10, v11, v12);
      if (objc_msgSend_isEqual_(v9, v14, (uint64_t)v13, v15))
      {
        v19 = objc_msgSend_trackingPreventionSecret(v5, v16, v17, v18);
        v23 = objc_msgSend_trackingPreventionSecret(self, v20, v21, v22);
        char isEqual = objc_msgSend_isEqual_(v19, v24, (uint64_t)v23, v25);
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
  uint64_t v5 = objc_msgSend_diversifier(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_hash(v5, v6, v7, v8);
  double v13 = objc_msgSend_trackingPreventionSecret(self, v10, v11, v12);
  unint64_t v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;

  return v17;
}

- (id)description
{
  double v3 = NSString;
  uint64_t v4 = objc_opt_class();
  double v8 = objc_msgSend_trackingPreventionSecret(self, v5, v6, v7);
  double v12 = objc_msgSend_diversifier(self, v9, v10, v11);
  uint64_t v15 = objc_msgSend_stringWithFormat_(v3, v13, @"<%@: %p tPS: %@, div: %@>", v14, v4, self, v8, v12);

  return v15;
}

- (NSString)diversifier
{
  return self->_diversifier;
}

- (void)setDiversifier:(id)a3
{
}

- (NSData)trackingPreventionSecret
{
  return self->_trackingPreventionSecret;
}

- (void)setTrackingPreventionSecret:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackingPreventionSecret, 0);
  objc_storeStrong((id *)&self->_diversifier, 0);
}

@end
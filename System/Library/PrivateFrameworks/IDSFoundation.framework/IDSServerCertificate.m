@interface IDSServerCertificate
- (BOOL)isEqual:(id)a3;
- (IDSServerCertificate)initWithDataRepresentation:(id)a3;
- (NSData)dataRepresentation;
- (id)description;
- (unint64_t)hash;
@end

@implementation IDSServerCertificate

- (IDSServerCertificate)initWithDataRepresentation:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IDSServerCertificate;
  v7 = [(IDSServerCertificate *)&v12 init];
  if (v7)
  {
    uint64_t v9 = objc_msgSend_copy(v4, v5, v6, v8);
    dataRepresentation = v7->_dataRepresentation;
    v7->_dataRepresentation = (NSData *)v9;
  }
  return v7;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  double v8 = objc_msgSend_dataRepresentation(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_hash(v8, v9, v10, v11);
  v15 = objc_msgSend_stringWithFormat_(v3, v13, @"<%@: %p hash: %lu>", v14, v4, self, v12);

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v8 = objc_msgSend_dataRepresentation(v4, v5, v6, v7);
    uint64_t v12 = objc_msgSend_dataRepresentation(self, v9, v10, v11);
    char isEqualToData = objc_msgSend_isEqualToData_(v8, v13, (uint64_t)v12, v14);
  }
  else
  {
    char isEqualToData = 0;
  }

  return isEqualToData;
}

- (unint64_t)hash
{
  id v4 = objc_msgSend_dataRepresentation(self, a2, v2, v3);
  unint64_t v8 = objc_msgSend_hash(v4, v5, v6, v7);

  return v8;
}

- (NSData)dataRepresentation
{
  return self->_dataRepresentation;
}

- (void).cxx_destruct
{
}

@end
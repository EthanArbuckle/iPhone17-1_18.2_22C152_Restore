@interface IDSDestinationEngram
+ (BOOL)supportsSecureCoding;
- (ENGroup)underlyingGroup;
- (IDSDestinationEngram)initWithCoder:(id)a3;
- (IDSDestinationEngram)initWithENGroup:(id)a3;
- (id)description;
- (id)destinationURIs;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IDSDestinationEngram

- (IDSDestinationEngram)initWithENGroup:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSDestinationEngram;
  v6 = [(IDSDestinationEngram *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_underlyingGroup, a3);
  }

  return v7;
}

- (IDSDestinationEngram)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, v7, @"kIDSDestinationEngramENGroupKey");

  v11 = (IDSDestinationEngram *)objc_msgSend_initWithENGroup_(self, v9, (uint64_t)v8, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend_underlyingGroup(self, v5, v6, v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)v10, v9, @"kIDSDestinationEngramENGroupKey");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)destinationURIs
{
  id v4 = objc_msgSend_underlyingGroup(self, a2, v2, v3);
  v8 = objc_msgSend_destinations(v4, v5, v6, v7);

  return v8;
}

- (id)description
{
  double v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v8 = objc_msgSend_destinationURIs(self, v5, v6, v7);
  v11 = objc_msgSend_stringWithFormat_(v3, v9, @"<%@: %p groupID: %@>", v10, v4, self, v8);

  return v11;
}

- (ENGroup)underlyingGroup
{
  return self->_underlyingGroup;
}

- (void).cxx_destruct
{
}

@end
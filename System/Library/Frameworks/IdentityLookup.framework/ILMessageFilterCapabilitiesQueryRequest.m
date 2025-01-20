@interface ILMessageFilterCapabilitiesQueryRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRequest:(id)a3;
- (ILMessageFilterCapabilitiesQueryRequest)initWithCoder:(id)a3;
- (ILMessageFilterCapabilitiesQueryRequest)initWithExtensionIdentifier:(id)a3;
- (NSString)extensionIdentifier;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ILMessageFilterCapabilitiesQueryRequest

- (ILMessageFilterCapabilitiesQueryRequest)initWithExtensionIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ILMessageFilterCapabilitiesQueryRequest;
  v5 = [(ILMessageFilterCapabilitiesQueryRequest *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    extensionIdentifier = v5->_extensionIdentifier;
    v5->_extensionIdentifier = (NSString *)v6;
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(ILMessageFilterCapabilitiesQueryRequest *)self extensionIdentifier];
  uint64_t v6 = [v3 stringWithFormat:@"<%@ %p extensionIdentifier=%@>", v4, self, v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(ILMessageFilterCapabilitiesQueryRequest *)self isEqualToRequest:v4];

  return v5;
}

- (BOOL)isEqualToRequest:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ILMessageFilterCapabilitiesQueryRequest *)self extensionIdentifier];
  uint64_t v6 = [v4 extensionIdentifier];

  LOBYTE(v4) = [v5 isEqualToString:v6];
  return (char)v4;
}

- (unint64_t)hash
{
  v2 = [(ILMessageFilterCapabilitiesQueryRequest *)self extensionIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ILMessageFilterCapabilitiesQueryRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = NSStringFromSelector(sel_extensionIdentifier);
  v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  v8 = [(ILMessageFilterCapabilitiesQueryRequest *)self initWithExtensionIdentifier:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(ILMessageFilterCapabilitiesQueryRequest *)self extensionIdentifier];
  uint64_t v5 = NSStringFromSelector(sel_extensionIdentifier);
  [v4 encodeObject:v6 forKey:v5];
}

- (NSString)extensionIdentifier
{
  return self->_extensionIdentifier;
}

- (void).cxx_destruct
{
}

@end
@interface _HMDIDSAccountIdentifier
+ (BOOL)supportsSecureCoding;
+ (id)namespace;
- (BOOL)isAuthenticated;
- (BOOL)isEqual:(id)a3;
- (NSString)identifierString;
- (_HMDIDSAccountIdentifier)initWithCoder:(id)a3;
- (_HMDIDSAccountIdentifier)initWithIdentifier:(id)a3;
- (_HMDIDSAccountIdentifier)initWithIdentifierString:(id)a3;
- (id)kind;
- (id)senderCorrelationIdentifier;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _HMDIDSAccountIdentifier

- (void).cxx_destruct
{
}

- (NSString)identifierString
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_HMDIDSAccountIdentifier;
  id v4 = a3;
  [(_HMDAccountIdentifier *)&v6 encodeWithCoder:v4];
  v5 = [(_HMDIDSAccountIdentifier *)self identifierString];
  [v4 encodeObject:v5 forKey:@"HM.string"];
}

- (_HMDIDSAccountIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HMDIDSAccountIdentifier;
  v5 = [(_HMDAccountIdentifier *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.string"];
    identifierString = v5->_identifierString;
    v5->_identifierString = (NSString *)v6;
  }
  return v5;
}

- (id)senderCorrelationIdentifier
{
  return self->_identifierString;
}

- (BOOL)isAuthenticated
{
  return 1;
}

- (id)kind
{
  return @"IDS";
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_HMDIDSAccountIdentifier *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    uint64_t v6 = v5;
    if (v6)
    {
      v7 = [(_HMDIDSAccountIdentifier *)self identifierString];
      v8 = [(_HMDIDSAccountIdentifier *)v6 identifierString];
      char v9 = [v7 isEqualToString:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (_HMDIDSAccountIdentifier)initWithIdentifierString:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F29128]);
    uint64_t v6 = +[_HMDIDSAccountIdentifier namespace];
    v7 = [v4 dataUsingEncoding:4];
    v8 = (void *)[v5 initWithNamespace:v6 data:v7];

    v14.receiver = self;
    v14.super_class = (Class)_HMDIDSAccountIdentifier;
    char v9 = [(_HMDAccountIdentifier *)&v14 initWithIdentifier:v8];
    if (v9)
    {
      uint64_t v10 = [v4 copy];
      identifierString = v9->_identifierString;
      v9->_identifierString = (NSString *)v10;
    }
    self = v9;

    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (_HMDIDSAccountIdentifier)initWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  v7 = NSString;
  v8 = NSStringFromSelector(a2);
  char v9 = [v7 stringWithFormat:@"%@ is unavailable", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)namespace
{
  if (namespace_onceToken_184 != -1) {
    dispatch_once(&namespace_onceToken_184, &__block_literal_global_186);
  }
  v2 = (void *)namespace_namespace_183;
  return v2;
}

@end
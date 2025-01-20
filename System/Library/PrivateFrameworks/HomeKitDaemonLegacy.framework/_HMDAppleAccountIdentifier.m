@interface _HMDAppleAccountIdentifier
+ (BOOL)supportsSecureCoding;
+ (id)namespace;
- (BOOL)isAuthenticated;
- (BOOL)isEqual:(id)a3;
- (NSString)identifierString;
- (_HMDAppleAccountIdentifier)initWithCoder:(id)a3;
- (_HMDAppleAccountIdentifier)initWithIdentifier:(id)a3;
- (_HMDAppleAccountIdentifier)initWithIdentifierString:(id)a3;
- (id)kind;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _HMDAppleAccountIdentifier

- (void).cxx_destruct
{
}

- (NSString)identifierString
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_HMDAppleAccountIdentifier;
  [(_HMDAccountIdentifier *)&v5 encodeWithCoder:v4];
  os_unfair_lock_lock_with_options();
  [v4 encodeObject:self->_identifierString forKey:@"HM.string"];
  os_unfair_lock_unlock(&self->_lock);
}

- (_HMDAppleAccountIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HMDAppleAccountIdentifier;
  objc_super v5 = [(_HMDAccountIdentifier *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.string"];
    identifierString = v5->_identifierString;
    v5->_identifierString = (NSString *)v6;
  }
  return v5;
}

- (BOOL)isAuthenticated
{
  v2 = [(_HMDAppleAccountIdentifier *)self identifierString];
  v3 = +[HMDAppleAccountManager sharedManager];
  id v4 = [v3 accountContext];
  objc_super v5 = [v4 identifier];
  char v6 = [v2 isEqualToString:v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_HMDAppleAccountIdentifier *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_super v5 = v4;
    }
    else {
      objc_super v5 = 0;
    }
    char v6 = v5;
    if (v6)
    {
      v7 = [(_HMDAppleAccountIdentifier *)self identifierString];
      v8 = [(_HMDAppleAccountIdentifier *)v6 identifierString];
      char v9 = [v7 isEqualToString:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (id)kind
{
  return @"AA";
}

- (_HMDAppleAccountIdentifier)initWithIdentifierString:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F29128]);
    char v6 = +[_HMDAppleAccountIdentifier namespace];
    v7 = [v4 dataUsingEncoding:4];
    v8 = (void *)[v5 initWithNamespace:v6 data:v7];

    v14.receiver = self;
    v14.super_class = (Class)_HMDAppleAccountIdentifier;
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

- (_HMDAppleAccountIdentifier)initWithIdentifier:(id)a3
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
  if (namespace_onceToken != -1) {
    dispatch_once(&namespace_onceToken, &__block_literal_global_17607);
  }
  v2 = (void *)namespace_namespace;
  return v2;
}

@end
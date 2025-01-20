@interface _HMDAccountHandleIdentifier
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HMDAccountHandle)accountHandle;
- (_HMDAccountHandleIdentifier)initWithAccountHandle:(id)a3;
- (_HMDAccountHandleIdentifier)initWithCoder:(id)a3;
- (_HMDAccountHandleIdentifier)initWithIdentifier:(id)a3;
- (id)identifier;
- (id)kind;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _HMDAccountHandleIdentifier

- (void).cxx_destruct
{
}

- (HMDAccountHandle)accountHandle
{
  return (HMDAccountHandle *)objc_getProperty(self, a2, 16, 1);
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_HMDAccountHandleIdentifier;
  id v4 = a3;
  [(_HMDAccountIdentifier *)&v6 encodeWithCoder:v4];
  v5 = [(_HMDAccountHandleIdentifier *)self accountHandle];
  [v4 encodeObject:v5 forKey:@"HM.handle"];
}

- (_HMDAccountHandleIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HMDAccountHandleIdentifier;
  v5 = [(_HMDAccountIdentifier *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.handle"];
    accountHandle = v5->_accountHandle;
    v5->_accountHandle = (HMDAccountHandle *)v6;
  }
  return v5;
}

- (id)identifier
{
  v2 = [(_HMDAccountHandleIdentifier *)self accountHandle];
  v3 = [v2 identifier];

  return v3;
}

- (id)kind
{
  return @"AH";
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_HMDAccountHandleIdentifier *)a3;
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
      v7 = [(_HMDAccountHandleIdentifier *)self accountHandle];
      v8 = [(_HMDAccountHandleIdentifier *)v6 accountHandle];
      char v9 = [v7 isEqual:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (_HMDAccountHandleIdentifier)initWithAccountHandle:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 identifier];
    v12.receiver = self;
    v12.super_class = (Class)_HMDAccountHandleIdentifier;
    v7 = [(_HMDAccountIdentifier *)&v12 initWithIdentifier:v6];

    if (v7)
    {
      uint64_t v8 = [v5 copy];
      accountHandle = v7->_accountHandle;
      v7->_accountHandle = (HMDAccountHandle *)v8;
    }
    self = v7;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (_HMDAccountHandleIdentifier)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  v7 = NSString;
  uint64_t v8 = NSStringFromSelector(a2);
  char v9 = [v7 stringWithFormat:@"%@ is unavailable", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
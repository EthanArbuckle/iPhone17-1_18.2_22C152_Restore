@interface _HMDAccountIdentifier
+ (BOOL)supportsSecureCoding;
- (BOOL)isAuthenticated;
- (BOOL)isEqual:(id)a3;
- (NSString)kind;
- (NSString)senderCorrelationIdentifier;
- (NSUUID)identifier;
- (_HMDAccountIdentifier)init;
- (_HMDAccountIdentifier)initWithCoder:(id)a3;
- (_HMDAccountIdentifier)initWithIdentifier:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _HMDAccountIdentifier

- (void).cxx_destruct
{
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(_HMDAccountIdentifier *)self identifier];
  [v4 encodeObject:v5 forKey:@"HM.identifier"];
}

- (_HMDAccountIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HMDAccountIdentifier;
  id v5 = [(_HMDAccountIdentifier *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;
  }
  return v5;
}

- (NSString)senderCorrelationIdentifier
{
  return 0;
}

- (BOOL)isAuthenticated
{
  return 0;
}

- (NSString)kind
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_HMDAccountIdentifier *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    uint64_t v6 = v5;
    if (v6)
    {
      id v7 = [(_HMDAccountIdentifier *)self identifier];
      v8 = [(_HMDAccountIdentifier *)v6 identifier];
      char v9 = objc_msgSend(v7, "hmf_isEqualToUUID:", v8);
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (unint64_t)hash
{
  v2 = [(_HMDAccountIdentifier *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (_HMDAccountIdentifier)initWithIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)_HMDAccountIdentifier;
    id v5 = [(_HMDAccountIdentifier *)&v10 init];
    if (v5)
    {
      uint64_t v6 = [v4 copy];
      identifier = v5->_identifier;
      v5->_identifier = (NSUUID *)v6;
    }
    self = v5;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (_HMDAccountIdentifier)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
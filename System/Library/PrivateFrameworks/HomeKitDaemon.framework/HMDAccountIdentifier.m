@interface HMDAccountIdentifier
+ (BOOL)supportsSecureCoding;
+ (id)accountIdentifierForAccountHandle:(id)a3;
+ (id)accountIdentifierForAppleAccountContext:(id)a3;
+ (id)accountIdentifierForMessageContext:(id)a3;
+ (id)accountIdentifierForSenderCorrelationIdentifier:(id)a3;
- (BOOL)isAuthenticated;
- (BOOL)isEqual:(id)a3;
- (HMDAccountIdentifier)init;
- (HMDAccountIdentifier)initWithCoder:(id)a3;
- (HMDAccountIdentifier)initWithInternal:(id)a3;
- (NSArray)attributeDescriptions;
- (NSString)senderCorrelationIdentifier;
- (NSString)shortDescription;
- (NSUUID)identifier;
- (_HMDAccountIdentifier)internal;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDAccountIdentifier

- (void).cxx_destruct
{
}

- (_HMDAccountIdentifier)internal
{
  return (_HMDAccountIdentifier *)objc_getProperty(self, a2, 8, 1);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAccountIdentifier *)self internal];
  [v4 encodeObject:v5 forKey:@"HM.internal"];
}

- (HMDAccountIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.internal"];

  v6 = [(HMDAccountIdentifier *)self initWithInternal:v5];
  return v6;
}

- (NSString)senderCorrelationIdentifier
{
  return [(_HMDAccountIdentifier *)self->_internal senderCorrelationIdentifier];
}

- (BOOL)isAuthenticated
{
  v2 = [(HMDAccountIdentifier *)self internal];
  char v3 = [v2 isAuthenticated];

  return v3;
}

- (NSUUID)identifier
{
  v2 = [(HMDAccountIdentifier *)self internal];
  char v3 = [v2 identifier];

  return (NSUUID *)v3;
}

- (NSArray)attributeDescriptions
{
  v16[3] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  id v4 = [(HMDAccountIdentifier *)self internal];
  id v5 = [v4 kind];
  v6 = (void *)[v3 initWithName:@"KN" value:v5];
  id v7 = objc_alloc(MEMORY[0x263F424F8]);
  v8 = [(HMDAccountIdentifier *)self identifier];
  v9 = [v8 UUIDString];
  v10 = (void *)[v7 initWithName:@"ID" value:v9];
  v16[1] = v10;
  id v11 = objc_alloc(MEMORY[0x263F424F8]);
  v12 = [(HMDAccountIdentifier *)self senderCorrelationIdentifier];
  v13 = (void *)[v11 initWithName:@"MID" value:v12];
  v16[2] = v13;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:3];

  return (NSArray *)v14;
}

- (NSString)shortDescription
{
  id v3 = NSString;
  id v4 = [(HMDAccountIdentifier *)self internal];
  id v5 = [v4 kind];
  v6 = [(HMDAccountIdentifier *)self identifier];
  id v7 = [v6 UUIDString];
  v8 = [v3 stringWithFormat:@"(%@)%@", v5, v7];

  return (NSString *)v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMDAccountIdentifier *)a3;
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
    v6 = v5;
    if (v6)
    {
      id v7 = [(HMDAccountIdentifier *)self internal];
      v8 = [(HMDAccountIdentifier *)v6 internal];
      char v9 = [v7 isEqual:v8];
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
  v2 = [(HMDAccountIdentifier *)self internal];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (HMDAccountIdentifier)initWithInternal:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)HMDAccountIdentifier;
    v6 = [(HMDAccountIdentifier *)&v10 init];
    id v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_internal, a3);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (HMDAccountIdentifier)init
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)accountIdentifierForSenderCorrelationIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = [[_HMDIDSAccountIdentifier alloc] initWithIdentifierString:v3];
    id v5 = [[HMDAccountIdentifier alloc] initWithInternal:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)accountIdentifierForMessageContext:(id)a3
{
  id v4 = [a3 senderCorrelationIdentifier];
  id v5 = [a1 accountIdentifierForSenderCorrelationIdentifier:v4];

  return v5;
}

+ (id)accountIdentifierForAppleAccountContext:(id)a3
{
  id v3 = a3;
  id v4 = [_HMDAppleAccountIdentifier alloc];
  id v5 = [v3 identifier];

  v6 = [(_HMDAppleAccountIdentifier *)v4 initWithIdentifierString:v5];
  id v7 = [[HMDAccountIdentifier alloc] initWithInternal:v6];

  return v7;
}

+ (id)accountIdentifierForAccountHandle:(id)a3
{
  id v4 = a3;
  id v5 = [[_HMDAccountHandleIdentifier alloc] initWithAccountHandle:v4];

  v6 = (void *)[objc_alloc((Class)a1) initWithInternal:v5];
  return v6;
}

@end
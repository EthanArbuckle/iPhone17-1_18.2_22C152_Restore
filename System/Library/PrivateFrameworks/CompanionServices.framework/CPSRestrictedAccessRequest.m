@interface CPSRestrictedAccessRequest
+ (BOOL)supportsSecureCoding;
- (CPSRestrictedAccessRequest)initWithCoder:(id)a3;
- (CPSRestrictedAccessRequest)initWithXPCDictionary:(id)a3;
- (NSArray)approversAppleAccountAltDSIDs;
- (NSString)description;
- (int64_t)authType;
- (int64_t)restrictionType;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
- (void)setApproversAppleAccountAltDSIDs:(id)a3;
- (void)setRestrictionType:(int64_t)a3;
@end

@implementation CPSRestrictedAccessRequest

- (NSString)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)[v3 appendInteger:self->_restrictionType withName:@"restrictionType"];
  id v5 = (id)[v3 appendObject:self->_approversAppleAccountAltDSIDs withName:@"approversAppleAccountAltDSIDs"];
  v6 = [v3 build];

  return (NSString *)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPSRestrictedAccessRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CPSRestrictedAccessRequest;
  id v5 = [(CPSAuthenticationRequest *)&v10 initWithCoder:v4];
  if (v5)
  {
    v6 = self;
    uint64_t v7 = [v4 decodeArrayOfObjectsOfClass:v6 forKey:@"approversAppleAccountAltDSIDs"];
    approversAppleAccountAltDSIDs = v5->_approversAppleAccountAltDSIDs;
    v5->_approversAppleAccountAltDSIDs = (NSArray *)v7;

    v5->_restrictionType = [v4 decodeIntegerForKey:@"restrictionType"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CPSRestrictedAccessRequest;
  id v4 = a3;
  [(CPSAuthenticationRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_approversAppleAccountAltDSIDs, @"approversAppleAccountAltDSIDs", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_restrictionType forKey:@"restrictionType"];
}

- (CPSRestrictedAccessRequest)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CPSRestrictedAccessRequest;
  objc_super v5 = [(CPSAuthenticationRequest *)&v14 init];
  if (v5)
  {
    v6 = [MEMORY[0x263F29D08] coderWithMessage:v4];
    uint64_t v7 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    [(CPSAuthenticationRequest *)v5 setIdentifier:v7];

    v8 = self;
    v9 = self;
    uint64_t v10 = [v6 decodeCollectionOfClass:v8 containingClass:v9 forKey:@"approversAppleAccountAltDSIDs"];
    approversAppleAccountAltDSIDs = v5->_approversAppleAccountAltDSIDs;
    v5->_approversAppleAccountAltDSIDs = (NSArray *)v10;

    v12 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"restrictionType"];
    v5->_restrictionType = [v12 integerValue];
  }
  return v5;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v6 = [MEMORY[0x263F29D08] coderWithMessage:a3];
  id v4 = [(CPSAuthenticationRequest *)self identifier];
  [v6 encodeObject:v4 forKey:@"identifier"];

  [v6 encodeObject:self->_approversAppleAccountAltDSIDs forKey:@"approversAppleAccountAltDSIDs"];
  objc_super v5 = [NSNumber numberWithInteger:self->_restrictionType];
  [v6 encodeObject:v5 forKey:@"restrictionType"];
}

- (int64_t)authType
{
  return 10;
}

- (int64_t)restrictionType
{
  return self->_restrictionType;
}

- (void)setRestrictionType:(int64_t)a3
{
  self->_restrictionType = a3;
}

- (NSArray)approversAppleAccountAltDSIDs
{
  return self->_approversAppleAccountAltDSIDs;
}

- (void)setApproversAppleAccountAltDSIDs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
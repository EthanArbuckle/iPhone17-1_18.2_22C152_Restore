@interface BLSForceActiveAttribute
+ (BOOL)supportsSecureCoding;
+ (id)forceActive;
+ (id)forceActiveUserInitiated:(BOOL)a3;
- (BLSForceActiveAttribute)initWithCoder:(id)a3;
- (BLSForceActiveAttribute)initWithUserInitiated:(BOOL)a3;
- (BLSForceActiveAttribute)initWithXPCDictionary:(id)a3;
- (BOOL)checkEntitlementSourceForRequiredEntitlements:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)userInitiated;
- (NSString)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation BLSForceActiveAttribute

+ (id)forceActive
{
  v2 = (void *)[objc_alloc((Class)a1) initWithUserInitiated:0];

  return v2;
}

+ (id)forceActiveUserInitiated:(BOOL)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithUserInitiated:a3];

  return v3;
}

- (BLSForceActiveAttribute)initWithUserInitiated:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BLSForceActiveAttribute;
  result = [(BLSAttribute *)&v5 init];
  if (result) {
    result->_userInitiated = a3;
  }
  return result;
}

- (BOOL)checkEntitlementSourceForRequiredEntitlements:(id)a3 error:(id *)a4
{
  return [(BLSAttribute *)self checkEntitlementSource:a3 forSingleEntitlement:0x1F0E40D20 error:a4];
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendBool:self->_userInitiated withName:@"userInitiated"];
  objc_super v5 = [v3 build];

  return (NSString *)v5;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendBool:self->_userInitiated];
  unint64_t v5 = [v3 hash];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BLSForceActiveAttribute *)a3;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL userInitiated = self->_userInitiated;
      BOOL v6 = userInitiated == [(BLSForceActiveAttribute *)v4 userInitiated];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (BLSForceActiveAttribute)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  BOOL v5 = xpc_dictionary_get_BOOL(v4, (const char *)[@"userInitiated" UTF8String]);

  return [(BLSForceActiveAttribute *)self initWithUserInitiated:v5];
}

- (void)encodeWithXPCDictionary:(id)a3
{
  xpc_object_t xdict = a3;
  xpc_dictionary_set_BOOL(xdict, (const char *)[@"userInitiated" UTF8String], self->_userInitiated);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BLSForceActiveAttribute)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeBoolForKey:@"userInitiated"];

  return [(BLSForceActiveAttribute *)self initWithUserInitiated:v4];
}

- (void)encodeWithCoder:(id)a3
{
}

- (BOOL)userInitiated
{
  return self->_userInitiated;
}

@end
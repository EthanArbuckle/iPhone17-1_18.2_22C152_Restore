@interface BLSPreventBacklightIdleAttribute
+ (BOOL)supportsSecureCoding;
+ (id)preventIdle;
+ (id)preventIdleAndRestartTimerOnInvalidation;
+ (id)preventIdleClearUserInteractionAndRestartTimerOnInvalidation;
- (BLSPreventBacklightIdleAttribute)initWithCoder:(id)a3;
- (BLSPreventBacklightIdleAttribute)initWithRestartTimerOnInvalidation:(BOOL)a3 clearUserInteraction:(BOOL)a4;
- (BLSPreventBacklightIdleAttribute)initWithXPCDictionary:(id)a3;
- (BOOL)checkEntitlementSourceForRequiredEntitlements:(id)a3 error:(id *)a4;
- (BOOL)clearUserInteraction;
- (BOOL)isEqual:(id)a3;
- (BOOL)restartTimerOnInvalidation;
- (NSString)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation BLSPreventBacklightIdleAttribute

+ (id)preventIdle
{
  v2 = (void *)[objc_alloc((Class)a1) initWithRestartTimerOnInvalidation:0 clearUserInteraction:0];

  return v2;
}

+ (id)preventIdleAndRestartTimerOnInvalidation
{
  v2 = (void *)[objc_alloc((Class)a1) initWithRestartTimerOnInvalidation:1 clearUserInteraction:0];

  return v2;
}

+ (id)preventIdleClearUserInteractionAndRestartTimerOnInvalidation
{
  v2 = (void *)[objc_alloc((Class)a1) initWithRestartTimerOnInvalidation:1 clearUserInteraction:1];

  return v2;
}

- (BLSPreventBacklightIdleAttribute)initWithRestartTimerOnInvalidation:(BOOL)a3 clearUserInteraction:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)BLSPreventBacklightIdleAttribute;
  result = [(BLSAttribute *)&v7 init];
  if (result)
  {
    result->_restartTimerOnInvalidation = a3;
    result->_clearUserInteraction = a4;
  }
  return result;
}

- (BOOL)checkEntitlementSourceForRequiredEntitlements:(id)a3 error:(id *)a4
{
  return [(BLSAttribute *)self checkEntitlementSource:a3 forSingleEntitlement:0x1F0E40D40 error:a4];
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendBool:self->_restartTimerOnInvalidation withName:@"restart"];
  id v5 = (id)[v3 appendBool:self->_clearUserInteraction withName:@"clearInteraction"];
  v6 = [v3 build];

  return (NSString *)v6;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendBool:self->_restartTimerOnInvalidation];
  id v5 = (id)[v3 appendBool:self->_clearUserInteraction];
  unint64_t v6 = [v3 hash];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BLSPreventBacklightIdleAttribute *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      BOOL restartTimerOnInvalidation = self->_restartTimerOnInvalidation;
      if (restartTimerOnInvalidation == [(BLSPreventBacklightIdleAttribute *)v5 restartTimerOnInvalidation])
      {
        BOOL clearUserInteraction = self->_clearUserInteraction;
        BOOL v8 = clearUserInteraction == [(BLSPreventBacklightIdleAttribute *)v5 clearUserInteraction];
      }
      else
      {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (BLSPreventBacklightIdleAttribute)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  id v5 = (const char *)[@"restart" UTF8String];
  unint64_t v6 = (const char *)[@"clearInteraction" UTF8String];
  BOOL v7 = xpc_dictionary_get_BOOL(v4, v5);
  BOOL v8 = xpc_dictionary_get_BOOL(v4, v6);

  return [(BLSPreventBacklightIdleAttribute *)self initWithRestartTimerOnInvalidation:v7 clearUserInteraction:v8];
}

- (void)encodeWithXPCDictionary:(id)a3
{
  xpc_object_t xdict = a3;
  id v4 = (const char *)[@"restart" UTF8String];
  id v5 = (const char *)[@"clearInteraction" UTF8String];
  xpc_dictionary_set_BOOL(xdict, v4, self->_restartTimerOnInvalidation);
  xpc_dictionary_set_BOOL(xdict, v5, self->_clearUserInteraction);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BLSPreventBacklightIdleAttribute)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeBoolForKey:@"restart"];
  uint64_t v6 = [v4 decodeBoolForKey:@"clearInteraction"];

  return [(BLSPreventBacklightIdleAttribute *)self initWithRestartTimerOnInvalidation:v5 clearUserInteraction:v6];
}

- (void)encodeWithCoder:(id)a3
{
  BOOL restartTimerOnInvalidation = self->_restartTimerOnInvalidation;
  id v5 = a3;
  [v5 encodeBool:restartTimerOnInvalidation forKey:@"restart"];
  [v5 encodeBool:self->_clearUserInteraction forKey:@"clearInteraction"];
}

- (BOOL)restartTimerOnInvalidation
{
  return self->_restartTimerOnInvalidation;
}

- (BOOL)clearUserInteraction
{
  return self->_clearUserInteraction;
}

@end
@interface AMAllowAmbientIdleTimerAttribute
+ (BOOL)supportsSecureCoding;
+ (id)allowAmbientIdleTimer;
+ (id)allowAmbientIdleTimerForSleepFocus;
- (AMAllowAmbientIdleTimerAttribute)initWithCoder:(id)a3;
- (AMAllowAmbientIdleTimerAttribute)initWithXPCDictionary:(id)a3;
- (BOOL)checkEntitlementSourceForRequiredEntitlements:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isForSleepFocus;
- (id)description;
- (id)initForSleepFocus:(BOOL)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation AMAllowAmbientIdleTimerAttribute

+ (id)allowAmbientIdleTimer
{
  v2 = (void *)[objc_alloc((Class)a1) initForSleepFocus:0];
  return v2;
}

+ (id)allowAmbientIdleTimerForSleepFocus
{
  v2 = (void *)[objc_alloc((Class)a1) initForSleepFocus:1];
  return v2;
}

- (id)initForSleepFocus:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AMAllowAmbientIdleTimerAttribute;
  id result = [(BLSAttribute *)&v5 init];
  if (result) {
    *((unsigned char *)result + 8) = a3;
  }
  return result;
}

- (BOOL)checkEntitlementSourceForRequiredEntitlements:(id)a3 error:(id *)a4
{
  return [(BLSAttribute *)self checkEntitlementSource:a3 forSingleEntitlement:@"com.apple.ambient.attribute.allow-idle-timer" error:a4];
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)[v3 appendBool:self->_forSleepFocus withName:@"forSleepFocus" ifEqualTo:1];
  objc_super v5 = [v3 build];

  return v5;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x263F29C60] builder];
  id v4 = (id)[v3 appendBool:self->_forSleepFocus];
  unint64_t v5 = [v3 hash];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [MEMORY[0x263F29C58] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  uint64_t forSleepFocus = self->_forSleepFocus;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __44__AMAllowAmbientIdleTimerAttribute_isEqual___block_invoke;
  v10[3] = &unk_2652234D0;
  id v11 = v4;
  id v7 = v4;
  id v8 = (id)[v5 appendBool:forSleepFocus counterpart:v10];
  LOBYTE(forSleepFocus) = [v5 isEqual];

  return forSleepFocus;
}

uint64_t __44__AMAllowAmbientIdleTimerAttribute_isEqual___block_invoke(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 8);
}

- (AMAllowAmbientIdleTimerAttribute)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  BOOL v5 = xpc_dictionary_get_BOOL(v4, (const char *)[@"forSleepFocus" UTF8String]);

  return (AMAllowAmbientIdleTimerAttribute *)[(AMAllowAmbientIdleTimerAttribute *)self initForSleepFocus:v5];
}

- (void)encodeWithXPCDictionary:(id)a3
{
  xpc_object_t xdict = a3;
  xpc_dictionary_set_BOOL(xdict, (const char *)[@"forSleepFocus" UTF8String], self->_forSleepFocus);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AMAllowAmbientIdleTimerAttribute)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeBoolForKey:@"forSleepFocus"];
  return (AMAllowAmbientIdleTimerAttribute *)[(AMAllowAmbientIdleTimerAttribute *)self initForSleepFocus:v4];
}

- (void)encodeWithCoder:(id)a3
{
}

- (BOOL)isForSleepFocus
{
  return self->_forSleepFocus;
}

@end
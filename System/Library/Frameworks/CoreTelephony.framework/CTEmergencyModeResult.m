@interface CTEmergencyModeResult
+ (BOOL)supportsSecureCoding;
- (CTEmergencyMode)mode;
- (CTEmergencyModeResult)initWithCoder:(id)a3;
- (CTEmergencyModeResult)initWithMode:(id)a3 andContext:(id)a4;
- (CTXPCServiceSubscriptionContext)context;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CTEmergencyModeResult

- (CTEmergencyModeResult)initWithMode:(id)a3 andContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CTEmergencyModeResult;
  v9 = [(CTEmergencyModeResult *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mode, a3);
    objc_storeStrong((id *)&v10->_context, a4);
  }

  return v10;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTEmergencyModeResult *)self mode];
  [v3 appendFormat:@" mode=%@", v4];

  v5 = [(CTEmergencyModeResult *)self context];
  [v3 appendFormat:@" context=%@", v5];

  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(CTEmergencyModeResult *)self mode];
  v6 = [(CTEmergencyModeResult *)self context];
  id v7 = (void *)[v4 initWithMode:v5 andContext:v6];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  mode = self->_mode;
  id v5 = a3;
  [v5 encodeObject:mode forKey:@"mode"];
  [v5 encodeObject:self->_context forKey:@"context"];
}

- (CTEmergencyModeResult)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectForKey:@"mode"];
  v6 = [v4 decodeObjectForKey:@"context"];

  id v7 = [(CTEmergencyModeResult *)self initWithMode:v5 andContext:v6];
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTEmergencyMode)mode
{
  return self->_mode;
}

- (CTXPCServiceSubscriptionContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_mode, 0);
}

@end
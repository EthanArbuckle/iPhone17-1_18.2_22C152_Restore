@interface BKSHIDTouchRoutingPolicy
+ (BOOL)supportsSecureCoding;
+ (void)inspectChangesWithOldPolicy:(id)a3 newPolicy:(id)a4 usingBlock:(id)a5;
- (BKSHIDTouchRoutingPolicy)init;
- (BKSHIDTouchRoutingPolicy)initWithCoder:(id)a3;
- (BOOL)shouldAvoidHitTesting;
- (BSMutableSettings)settings;
- (NSArray)contextIDsToAlwaysSendTouches;
- (NSArray)contextIDsToExcludeFromHitTesting;
- (void)encodeWithCoder:(id)a3;
- (void)setAvoidHitTesting:(BOOL)a3;
- (void)setContextIDsToAlwaysSendTouches:(id)a3;
- (void)setContextIDsToExcludeFromHitTesting:(id)a3;
- (void)setSettings:(id)a3;
@end

@implementation BKSHIDTouchRoutingPolicy

- (void).cxx_destruct
{
}

- (void)setSettings:(id)a3
{
}

- (BSMutableSettings)settings
{
  return self->_settings;
}

- (void)setContextIDsToExcludeFromHitTesting:(id)a3
{
}

- (NSArray)contextIDsToExcludeFromHitTesting
{
  return (NSArray *)[(BSMutableSettings *)self->_settings objectForSetting:2];
}

- (void)setContextIDsToAlwaysSendTouches:(id)a3
{
}

- (NSArray)contextIDsToAlwaysSendTouches
{
  return (NSArray *)[(BSMutableSettings *)self->_settings objectForSetting:1];
}

- (void)setAvoidHitTesting:(BOOL)a3
{
}

- (BOOL)shouldAvoidHitTesting
{
  return [(BSMutableSettings *)self->_settings BOOLForSetting:3];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[BKSHIDTouchRoutingPolicy shouldAvoidHitTesting](self, "shouldAvoidHitTesting"), @"shouldAvoidHitTesting");
  v5 = [(BKSHIDTouchRoutingPolicy *)self contextIDsToAlwaysSendTouches];
  [v4 encodeObject:v5 forKey:@"contextIDsToAlwaysSendTouches"];

  id v6 = [(BKSHIDTouchRoutingPolicy *)self contextIDsToExcludeFromHitTesting];
  [v4 encodeObject:v6 forKey:@"contextIDsToExcludeFromHitTesting"];
}

- (BKSHIDTouchRoutingPolicy)initWithCoder:(id)a3
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(BKSHIDTouchRoutingPolicy *)self init];
  if (!v5) {
    goto LABEL_9;
  }
  -[BKSHIDTouchRoutingPolicy setAvoidHitTesting:](v5, "setAvoidHitTesting:", [v4 decodeBoolForKey:@"shouldAvoidHitTesting"]);
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"contextIDsToAlwaysSendTouches"];

  if (v9)
  {
    if ((_BKSVerifyIsArrayOfNumbers(v9) & 1) == 0)
    {
      v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F281F8];
      uint64_t v28 = *MEMORY[0x1E4F28588];
      v17 = [NSString stringWithFormat:@"unsupported contextIDsToAlwaysSendTouches structure %@", v9];
      v29[0] = v17;
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
      v19 = [v15 errorWithDomain:v16 code:4866 userInfo:v18];
      [v4 failWithError:v19];

      goto LABEL_12;
    }
    [(BKSHIDTouchRoutingPolicy *)v5 setContextIDsToAlwaysSendTouches:v9];
  }
  v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v13 = [v4 decodeObjectOfClasses:v12 forKey:@"contextIDsToExcludeFromHitTesting"];

  if (v13)
  {
    if (_BKSVerifyIsArrayOfNumbers(v13))
    {
      [(BKSHIDTouchRoutingPolicy *)v5 setContextIDsToExcludeFromHitTesting:v13];
      goto LABEL_8;
    }
    v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v21 = *MEMORY[0x1E4F281F8];
    uint64_t v26 = *MEMORY[0x1E4F28588];
    v22 = [NSString stringWithFormat:@"unsupported contextIDsToExcludeFromHitTesting structure %@", v13];
    v27 = v22;
    v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    v24 = [v20 errorWithDomain:v21 code:4866 userInfo:v23];
    [v4 failWithError:v24];

LABEL_12:
    v14 = 0;
    goto LABEL_13;
  }
LABEL_8:

LABEL_9:
  v14 = v5;
LABEL_13:

  return v14;
}

- (BKSHIDTouchRoutingPolicy)init
{
  v6.receiver = self;
  v6.super_class = (Class)BKSHIDTouchRoutingPolicy;
  v2 = [(BKSHIDTouchRoutingPolicy *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    settings = v2->_settings;
    v2->_settings = (BSMutableSettings *)v3;
  }
  return v2;
}

+ (void)inspectChangesWithOldPolicy:(id)a3 newPolicy:(id)a4 usingBlock:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  v9 = [a3 settings];
  v10 = [v8 settings];

  uint64_t v11 = [MEMORY[0x1E4F4F828] diffFromSettings:v9 toSettings:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77__BKSHIDTouchRoutingPolicy_inspectChangesWithOldPolicy_newPolicy_usingBlock___block_invoke;
  v13[3] = &unk_1E54407D8;
  id v14 = v7;
  id v12 = v7;
  [v11 inspectChangesWithBlock:v13];
}

uint64_t __77__BKSHIDTouchRoutingPolicy_inspectChangesWithOldPolicy_newPolicy_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
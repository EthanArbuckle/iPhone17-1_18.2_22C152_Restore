@interface HMDTriggerDeleteAfterExecutionPolicy
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HMDTriggerDeleteAfterExecutionPolicy)init;
- (HMDTriggerDeleteAfterExecutionPolicy)initWithCoder:(id)a3;
- (id)description;
- (void)applyPolicy:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDTriggerDeleteAfterExecutionPolicy

- (BOOL)isEqual:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HMDTriggerDeleteAfterExecutionPolicy;
  return [(HMDTriggerDeletePolicy *)&v4 isEqual:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)HMDTriggerDeleteAfterExecutionPolicy;
  [(HMDTriggerDeletePolicy *)&v3 encodeWithCoder:a3];
}

- (HMDTriggerDeleteAfterExecutionPolicy)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HMDTriggerDeleteAfterExecutionPolicy;
  return [(HMDTriggerDeletePolicy *)&v4 initWithCoder:a3];
}

- (id)description
{
  return @"Delete After Execution";
}

- (void)applyPolicy:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)HMDTriggerDeleteAfterExecutionPolicy;
  [(HMDTriggerDeletePolicy *)&v3 applyPolicy:a3];
}

- (HMDTriggerDeleteAfterExecutionPolicy)init
{
  id v3 = objc_alloc(MEMORY[0x263F08C38]);
  objc_super v4 = (void *)[v3 initWithUUIDString:*MEMORY[0x263F0DB70]];
  v7.receiver = self;
  v7.super_class = (Class)HMDTriggerDeleteAfterExecutionPolicy;
  v5 = [(HMDTriggerDeletePolicy *)&v7 initWithIdentifier:v4];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
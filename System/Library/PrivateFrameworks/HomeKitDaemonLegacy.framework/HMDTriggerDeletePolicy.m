@interface HMDTriggerDeletePolicy
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HMDTriggerDeletePolicy)init;
- (HMDTriggerDeletePolicy)initWithCoder:(id)a3;
- (HMDTriggerDeletePolicy)initWithIdentifier:(id)a3;
- (void)applyPolicy:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDTriggerDeletePolicy

- (BOOL)isEqual:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HMDTriggerDeletePolicy;
  return [(HMDTriggerPolicy *)&v4 isEqual:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)HMDTriggerDeletePolicy;
  [(HMDTriggerPolicy *)&v3 encodeWithCoder:a3];
}

- (HMDTriggerDeletePolicy)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HMDTriggerDeletePolicy;
  return [(HMDTriggerPolicy *)&v4 initWithCoder:a3];
}

- (void)applyPolicy:(id)a3
{
  id v3 = a3;
  id v4 = [v3 home];
  [v4 removeTrigger:v3];
}

- (HMDTriggerDeletePolicy)initWithIdentifier:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HMDTriggerDeletePolicy;
  return [(HMDTriggerPolicy *)&v4 initWithIdentifier:a3];
}

- (HMDTriggerDeletePolicy)init
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
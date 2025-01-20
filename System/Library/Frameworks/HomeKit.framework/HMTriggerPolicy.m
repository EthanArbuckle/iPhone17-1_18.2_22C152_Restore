@interface HMTriggerPolicy
+ (BOOL)supportsSecureCoding;
- (HMTriggerPolicy)init;
- (HMTriggerPolicy)initWithCoder:(id)a3;
- (NSUUID)identifier;
- (id)_initWithIdentifier:(id)a3;
@end

@implementation HMTriggerPolicy

- (void).cxx_destruct
{
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (HMTriggerPolicy)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMT.triggerPolicyUUIDCodingKey"];

  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v5];
  v7 = [(HMTriggerPolicy *)self _initWithIdentifier:v6];

  return v7;
}

- (id)_initWithIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMTriggerPolicy;
  v6 = [(HMTriggerPolicy *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_identifier, a3);
  }

  return v7;
}

- (HMTriggerPolicy)init
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
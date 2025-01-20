@interface HMTriggerDeleteAfterExecutionPolicy
+ (BOOL)supportsSecureCoding;
+ (id)deleteAfterExecutionPolicy;
- (HMTriggerDeleteAfterExecutionPolicy)init;
- (HMTriggerDeleteAfterExecutionPolicy)initWithCoder:(id)a3;
- (HMTriggerDeleteAfterExecutionPolicy)initWithPayload:(id)a3 payload:(id)a4;
- (id)_init;
- (id)description;
@end

@implementation HMTriggerDeleteAfterExecutionPolicy

- (HMTriggerDeleteAfterExecutionPolicy)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HMTriggerDeleteAfterExecutionPolicy;
  return [(HMTriggerDeletePolicy *)&v4 initWithCoder:a3];
}

- (id)description
{
  return @"Delete After Execution";
}

- (id)_init
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"AABDED76-96F7-4033-83B3-3C7D512E5F9D"];
  v6.receiver = self;
  v6.super_class = (Class)HMTriggerDeleteAfterExecutionPolicy;
  id v4 = [(HMTriggerDeletePolicy *)&v6 _initWithIdentifier:v3];

  return v4;
}

- (HMTriggerDeleteAfterExecutionPolicy)initWithPayload:(id)a3 payload:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)HMTriggerDeleteAfterExecutionPolicy;
  return (HMTriggerDeleteAfterExecutionPolicy *)-[HMTriggerDeletePolicy _initWithIdentifier:](&v5, sel__initWithIdentifier_, a3, a4);
}

- (HMTriggerDeleteAfterExecutionPolicy)init
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)deleteAfterExecutionPolicy
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__HMTriggerDeleteAfterExecutionPolicy_deleteAfterExecutionPolicy__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (deleteAfterExecutionPolicy_onceToken != -1) {
    dispatch_once(&deleteAfterExecutionPolicy_onceToken, block);
  }
  v2 = (void *)deleteAfterExecutionPolicy_policyInstance;

  return v2;
}

uint64_t __65__HMTriggerDeleteAfterExecutionPolicy_deleteAfterExecutionPolicy__block_invoke()
{
  uint64_t v0 = [objc_alloc((Class)objc_opt_class()) _init];
  uint64_t v1 = deleteAfterExecutionPolicy_policyInstance;
  deleteAfterExecutionPolicy_policyInstance = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end
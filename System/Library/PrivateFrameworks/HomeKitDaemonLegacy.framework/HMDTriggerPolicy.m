@interface HMDTriggerPolicy
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HMDTriggerPolicy)init;
- (HMDTriggerPolicy)initWithCoder:(id)a3;
- (HMDTriggerPolicy)initWithIdentifier:(id)a3;
- (NSUUID)uuid;
- (void)applyPolicy:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDTriggerPolicy

- (void).cxx_destruct
{
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    v7 = [(HMDTriggerPolicy *)self uuid];
    v8 = [v6 uuid];
    char v9 = [v7 isEqual:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(HMDTriggerPolicy *)self uuid];
  v5 = [v6 UUIDString];
  [v4 encodeObject:v5 forKey:*MEMORY[0x1E4F2E208]];
}

- (HMDTriggerPolicy)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F2E208]];

  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v5];
  v7 = [(HMDTriggerPolicy *)self initWithIdentifier:v6];

  return v7;
}

- (void)applyPolicy:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  v7 = NSString;
  v8 = NSStringFromSelector(a2);
  char v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (HMDTriggerPolicy)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDTriggerPolicy;
  uint64_t v6 = [(HMDTriggerPolicy *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_uuid, a3);
  }

  return v7;
}

- (HMDTriggerPolicy)init
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
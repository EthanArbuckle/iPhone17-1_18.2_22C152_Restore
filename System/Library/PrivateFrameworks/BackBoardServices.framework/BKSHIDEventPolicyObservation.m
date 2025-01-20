@interface BKSHIDEventPolicyObservation
+ (BOOL)supportsSecureCoding;
+ (id)build:(id)a3;
+ (id)new;
- (BKSHIDEventDeferringEnvironment)environment;
- (BKSHIDEventDeferringToken)token;
- (BKSHIDEventDisplay)display;
- (BKSHIDEventPolicyObservation)init;
- (BKSHIDEventPolicyObservation)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)_init;
- (id)_initWithCopyOf:(id *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int)pid;
- (int64_t)policyStatus;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BKSHIDEventPolicyObservation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  unint64_t v3 = [(BKSHIDEventDisplay *)self->_display hash];
  unint64_t v4 = [(BKSHIDEventDeferringEnvironment *)self->_environment hash] ^ v3;
  uint64_t v5 = v4 ^ [(BKSHIDEventDeferringToken *)self->_token hash];
  v6 = [NSNumber numberWithInt:self->_pid];
  uint64_t v7 = v5 ^ [v6 hash];

  v8 = [NSNumber numberWithInteger:self->_policyStatus];
  unint64_t v9 = v7 ^ [v8 hash];

  unint64_t v10 = 0x94D049BB133111EBLL
      * ((0xBF58476D1CE4E5B9 * (v9 ^ (v9 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v9 ^ (v9 >> 30))) >> 27));
  return v10 ^ (v10 >> 31);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_display, 0);
}

- (BKSHIDEventPolicyObservation)initWithCoder:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)BKSHIDEventPolicyObservation;
  id v3 = a3;
  unint64_t v4 = [(BKSHIDEventPolicyObservation *)&v13 init];
  v4->_pid = objc_msgSend(v3, "decodeIntForKey:", @"pid", v13.receiver, v13.super_class);
  uint64_t v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"display"];
  display = v4->_display;
  v4->_display = (BKSHIDEventDisplay *)v5;

  uint64_t v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"environment"];
  environment = v4->_environment;
  v4->_environment = (BKSHIDEventDeferringEnvironment *)v7;

  uint64_t v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"token"];
  token = v4->_token;
  v4->_token = (BKSHIDEventDeferringToken *)v9;

  uint64_t v11 = [v3 decodeIntegerForKey:@"policyStatus"];
  v4->_policyStatus = v11;
  return v4;
}

- (int)pid
{
  return self->_pid;
}

- (BKSHIDEventDeferringToken)token
{
  return self->_token;
}

- (int64_t)policyStatus
{
  return self->_policyStatus;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  [v8 encodeInteger:self->_pid forKey:@"pid"];
  display = self->_display;
  if (display) {
    [v8 encodeObject:display forKey:@"display"];
  }
  environment = self->_environment;
  if (environment) {
    [v8 encodeObject:environment forKey:@"environment"];
  }
  token = self->_token;
  uint64_t v7 = v8;
  if (token)
  {
    [v8 encodeObject:token forKey:@"token"];
    uint64_t v7 = v8;
  }
  [v7 encodeInteger:self->_policyStatus forKey:@"policyStatus"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = v4;
    BOOL v6 = v5[2] == self->_pid
      && BSEqualObjects()
      && BSEqualObjects()
      && BSEqualObjects()
      && *((void *)v5 + 5) == self->_policyStatus;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (id)build:(id)a3
{
  id v3 = (void (**)(id, id))a3;
  id v4 = -[BKSHIDEventPolicyObservation _init]([BKSMutableHIDEventPolicyObservation alloc]);
  v3[2](v3, v4);

  uint64_t v5 = (void *)[v4 copy];
  return v5;
}

- (id)_init
{
  if (result)
  {
    v1 = result;
    uint64_t v2 = objc_opt_class();
    if (v2 != objc_opt_class())
    {
      uint64_t v3 = objc_opt_class();
      if (v3 != objc_opt_class())
      {
        id v4 = [MEMORY[0x1E4F28B00] currentHandler];
        [v4 handleFailureInMethod:sel__init object:v1 file:@"BKSHIDEventPolicyObservation.m" lineNumber:47 description:@"BKSHIDEventPolicyObservation cannot be subclassed"];
      }
    }
    v5.receiver = v1;
    v5.super_class = (Class)BKSHIDEventPolicyObservation;
    return objc_msgSendSuper2(&v5, sel_init);
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [BKSHIDEventPolicyObservation alloc];
  return -[BKSHIDEventPolicyObservation _initWithCopyOf:]((id *)&v4->super.isa, self);
}

- (id)_initWithCopyOf:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = (id *)-[BKSHIDEventPolicyObservation _init](a1);
    a1 = v4;
    if (v4)
    {
      *((_DWORD *)v4 + 2) = *((_DWORD *)v3 + 2);
      objc_storeStrong(v4 + 2, *((id *)v3 + 2));
      objc_storeStrong(a1 + 3, *((id *)v3 + 3));
      objc_storeStrong(a1 + 4, *((id *)v3 + 4));
      a1[5] = (id)*((void *)v3 + 5);
    }
  }

  return a1;
}

- (BKSHIDEventDeferringEnvironment)environment
{
  return self->_environment;
}

- (BKSHIDEventDisplay)display
{
  return self->_display;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v10 = a3;
  id v4 = (id)[v10 appendInteger:self->_pid withName:@"pid"];
  id v5 = (id)[v10 appendObject:self->_display withName:@"display"];
  id v6 = (id)[v10 appendObject:self->_environment withName:@"environment"];
  id v7 = (id)[v10 appendObject:self->_token withName:@"token"];
  id v8 = NSStringFromBKSHIDEventDeferringPolicyStatus(self->_policyStatus);
  id v9 = (id)[v10 appendObject:v8 withName:@"policyStatus"];
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [BKSMutableHIDEventPolicyObservation alloc];
  return -[BKSHIDEventPolicyObservation _initWithCopyOf:]((id *)&v4->super.super.isa, self);
}

- (BKSHIDEventPolicyObservation)init
{
  id v3 = [MEMORY[0x1E4F28B00] currentHandler];
  id v4 = [NSString stringWithUTF8String:"-[BKSHIDEventPolicyObservation init]"];
  [v3 handleFailureInFunction:v4 file:@"BKSHIDEventPolicyObservation.m" lineNumber:36 description:@"cannot directly allocate BKSHIDEventPolicyObservation"];

  return 0;
}

+ (id)new
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  id v3 = [NSString stringWithUTF8String:"+[BKSHIDEventPolicyObservation new]"];
  [v2 handleFailureInFunction:v3 file:@"BKSHIDEventPolicyObservation.m" lineNumber:41 description:@"cannot directly allocate BKSHIDEventPolicyObservation"];

  return 0;
}

@end
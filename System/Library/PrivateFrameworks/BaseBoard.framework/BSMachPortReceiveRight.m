@interface BSMachPortReceiveRight
+ (char)_type;
- (BSMachPortReceiveRight)init;
- (BSMachPortReceiveRight)initWithPort:(unsigned int)a3;
@end

@implementation BSMachPortReceiveRight

- (BSMachPortReceiveRight)init
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  mach_port_name_t v8 = 0;
  if (BSMachCreateReceiveRight(&v8))
  {
    v3 = _BSMachPortRightDescription(1u, 0, @"init", v8, 0);
    self = -[BSMachPortRight _initWithPort:type:owner:trace:](self, v8, 1, 0, v3);
    v4 = self;
  }
  else
  {
    v3 = BSLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v6 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v10 = v6;
      id v7 = v6;
      _os_log_error_impl(&dword_18AAA8000, v3, OS_LOG_TYPE_ERROR, "failed to create port for %{public}@ - returning nil from initializer", buf, 0xCu);
    }
    v4 = 0;
  }

  return v4;
}

- (BSMachPortReceiveRight)initWithPort:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (!BSMachPortIsType(a3, 0x20000))
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"BSMachPortRight.m" lineNumber:420 description:@"you must pass in a valid receive right"];
  }
  v6 = _BSMachPortRightDescription(1u, 0, @"take", v3, 0);
  id v7 = (BSMachPortReceiveRight *)-[BSMachPortRight _initWithPort:type:owner:trace:](self, v3, 1, 0, v6);

  return v7;
}

+ (char)_type
{
  return 1;
}

@end
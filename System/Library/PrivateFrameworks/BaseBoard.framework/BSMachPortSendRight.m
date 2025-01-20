@interface BSMachPortSendRight
+ (char)_type;
+ (id)bootstrapLookUpPortWithName:(id)a3;
+ (id)bootstrapLookUpWithName:(id)a3;
+ (id)taskNamePortForPID:(int)a3;
+ (id)wrapSendRight:(unsigned int)a3;
- (BSMachPortSendRight)initWithCopyOfPort:(unsigned int)a3;
- (BSMachPortSendRight)initWithCopyOfRight:(id)a3;
- (BSMachPortSendRight)initWithNonRetainingPort:(unsigned int)a3;
- (BSMachPortSendRight)initWithPort:(unsigned int)a3;
- (BSMachPortSendRight)initWithSendRight:(unsigned int)a3 assumeOwnership:(BOOL)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initFromReceiveRight:(id)a3;
@end

@implementation BSMachPortSendRight

+ (char)_type
{
  return 3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v4 initWithCopyOfRight:self];
}

- (BSMachPortSendRight)initWithCopyOfRight:(id)a3
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __43__BSMachPortSendRight_initWithCopyOfRight___block_invoke;
  v10[3] = &unk_1E5446108;
  v10[4] = &v11;
  [a3 accessPort:v10];
  uint64_t v5 = *((unsigned int *)v12 + 6);
  v6 = [a3 trace];
  v7 = _BSMachPortRightDescription(3u, 0, @"copy", v5, v6);

  v8 = (BSMachPortSendRight *)-[BSMachPortRight _initWithPort:type:owner:trace:](self, *((unsigned int *)v12 + 6), 3, 0, v7);
  _Block_object_dispose(&v11, 8);
  return v8;
}

BOOL __43__BSMachPortSendRight_initWithCopyOfRight___block_invoke(BOOL result, mach_port_name_t name)
{
  if (name - 1 <= 0xFFFFFFFD)
  {
    uint64_t v3 = result;
    result = BSMachSendRightRetain(name);
    if (result) {
      *(_DWORD *)(*(void *)(*(void *)(v3 + 32) + 8) + 24) = name;
    }
  }
  return result;
}

- (BSMachPortSendRight)initWithPort:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 - 1 <= 0xFFFFFFFD && !BSMachPortIsType(a3, 1114112))
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"BSMachPortRight.m" lineNumber:482 description:@"you must pass in a send (or dead) right or NULL"];
  }
  v6 = _BSMachPortRightDescription(3u, 0, @"take", v3, 0);
  v7 = (BSMachPortSendRight *)-[BSMachPortRight _initWithPort:type:owner:trace:](self, v3, 3, 0, v6);

  return v7;
}

+ (id)wrapSendRight:(unsigned int)a3
{
  uint64_t v3 = (void *)[objc_alloc((Class)a1) initWithSendRight:*(void *)&a3];
  return v3;
}

- (BSMachPortSendRight)initWithCopyOfPort:(unsigned int)a3
{
  LODWORD(v3) = a3;
  if (a3 - 1 <= 0xFFFFFFFD && !BSMachPortIsType(a3, 1114112))
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"BSMachPortRight.m" lineNumber:489 description:@"you must pass in a send (or dead) right or NULL"];
  }
  if (BSMachPortIsType(v3, 0x10000))
  {
    if (BSMachSendRightRetain(v3)) {
      uint64_t v3 = v3;
    }
    else {
      uint64_t v3 = 0;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  v6 = _BSMachPortRightDescription(3u, 0, @"copytake", v3, 0);
  v7 = (BSMachPortSendRight *)-[BSMachPortRight _initWithPort:type:owner:trace:](self, v3, 3, 0, v6);

  return v7;
}

- (id)initFromReceiveRight:(id)a3
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44__BSMachPortSendRight_initFromReceiveRight___block_invoke;
  v10[3] = &unk_1E5446108;
  v10[4] = &v11;
  [a3 accessPort:v10];
  uint64_t v5 = *((unsigned int *)v12 + 6);
  v6 = [a3 trace];
  v7 = _BSMachPortRightDescription(3u, 0, @"make", v5, v6);

  v8 = -[BSMachPortRight _initWithPort:type:owner:trace:](self, *((unsigned int *)v12 + 6), 3, 0, v7);
  _Block_object_dispose(&v11, 8);
  return v8;
}

BOOL __44__BSMachPortSendRight_initFromReceiveRight___block_invoke(BOOL result, mach_port_name_t name)
{
  if (name - 1 <= 0xFFFFFFFD)
  {
    uint64_t v3 = result;
    result = BSMachCreateSendRight(name);
    if (result) {
      *(_DWORD *)(*(void *)(*(void *)(v3 + 32) + 8) + 24) = name;
    }
  }
  return result;
}

+ (id)bootstrapLookUpWithName:(id)a3
{
  kern_return_t v6;
  mach_error_t v7;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  char *v14;
  mach_port_t sp;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  char *v19;
  __int16 v20;
  mach_error_t v21;
  uint64_t v22;
  uint64_t vars8;

  v22 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    sp = 0;
    mach_port_t v4 = *MEMORY[0x1E4F14638];
    id v5 = a3;
    v6 = bootstrap_look_up(v4, (const char *)[v5 UTF8String], &sp);
    v7 = v6;
    if (sp + 1 >= 2 && v6 == 0)
    {
      uint64_t v11 = [NSString stringWithFormat:@"bootstrap_look_up:%@", v5];
      v9 = _BSMachPortRightDescription(3u, 0, (uint64_t)v11, sp, 0);

      v12 = objc_alloc((Class)a1);
      v10 = -[BSMachPortRight _initWithPort:type:owner:trace:](v12, sp, 3, 0, v9);
    }
    else
    {
      v9 = BSLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v14 = mach_error_string(v7);
        *(_DWORD *)buf = 138543874;
        v17 = v5;
        v18 = 2082;
        v19 = v14;
        v20 = 1024;
        v21 = v7;
        _os_log_error_impl(&dword_18AAA8000, v9, OS_LOG_TYPE_ERROR, "Unable to bootstrap_look_up port with name %{public}@: %{public}s (%d)", buf, 0x1Cu);
      }
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (BSMachPortSendRight)initWithNonRetainingPort:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 + 1 <= 1)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"BSMachPortRight.m" lineNumber:553 description:@"you must pass in a valid send right"];
  }
  id v5 = _BSMachPortRightDescription(3u, 1, @"wrap", v3, 0);
  v6 = (BSMachPortSendRight *)-[BSMachPortRight _initWithPort:type:owner:trace:](self, v3, 3, 1, v5);

  return v6;
}

+ (id)taskNamePortForPID:(int)a3
{
  return +[BSMachPortTaskNameRight taskNameForPID:*(void *)&a3];
}

+ (id)bootstrapLookUpPortWithName:(id)a3
{
  uint64_t v3 = [a1 bootstrapLookUpWithName:a3];
  return v3;
}

- (BSMachPortSendRight)initWithSendRight:(unsigned int)a3 assumeOwnership:(BOOL)a4
{
  if (a4) {
    mach_port_t v4 = [(BSMachPortSendRight *)self initWithPort:*(void *)&a3];
  }
  else {
    mach_port_t v4 = [(BSMachPortSendRight *)self initWithNonRetainingPort:*(void *)&a3];
  }
  id v5 = v4;

  return v5;
}

@end
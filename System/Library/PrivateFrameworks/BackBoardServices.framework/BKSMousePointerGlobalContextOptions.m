@interface BKSMousePointerGlobalContextOptions
+ (BKSMousePointerGlobalContextOptions)new;
+ (BOOL)supportsSecureCoding;
+ (id)build:(id)a3;
- (BKSMousePointerGlobalContextOptions)init;
- (BKSMousePointerGlobalContextOptions)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)pinOnButtonDown;
- (NSString)description;
- (id)_init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)_initWithCopyOf:(void *)a1;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BKSMousePointerGlobalContextOptions

- (BOOL)pinOnButtonDown
{
  return self->_pinOnButtonDown;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v3 = (id)[a3 appendBool:self->_pinOnButtonDown withName:@"pinOnButtonDown"];
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [BKSMutableMousePointerGlobalContextOptions alloc];
  return -[BKSMousePointerGlobalContextOptions _initWithCopyOf:](v4, self);
}

- (void)_initWithCopyOf:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = -[BKSMousePointerGlobalContextOptions _init](a1);
    a1 = v4;
    if (v4) {
      *((unsigned char *)v4 + 8) = v3[8];
    }
  }

  return a1;
}

- (id)_init
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v1 = result;
    uint64_t v2 = objc_opt_class();
    if (v2 != objc_opt_class())
    {
      uint64_t v3 = objc_opt_class();
      if (v3 != objc_opt_class())
      {
        id v4 = [NSString stringWithFormat:@"BKSMousePointerGlobalContextOptions cannot be subclassed"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          v5 = NSStringFromSelector(sel__init);
          v6 = (objc_class *)objc_opt_class();
          v7 = NSStringFromClass(v6);
          *(_DWORD *)buf = 138544642;
          v10 = v5;
          __int16 v11 = 2114;
          v12 = v7;
          __int16 v13 = 2048;
          v14 = v1;
          __int16 v15 = 2114;
          v16 = @"BKSMousePointerGlobalContextOptions.m";
          __int16 v17 = 1024;
          int v18 = 41;
          __int16 v19 = 2114;
          v20 = v4;
          _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        [v4 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x18AA6CEF0);
      }
    }
    v8.receiver = v1;
    v8.super_class = (Class)BKSMousePointerGlobalContextOptions;
    return objc_msgSendSuper2(&v8, sel_init);
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [BKSMousePointerGlobalContextOptions alloc];
  return -[BKSMousePointerGlobalContextOptions _initWithCopyOf:](v4, self);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && v4[8] == self->_pinOnButtonDown;

  return v5;
}

- (unint64_t)hash
{
  unint64_t v2 = 0x476D1CE4E5B90000;
  if (!self->_pinOnButtonDown) {
    unint64_t v2 = 0;
  }
  return (0x94D049BB133111EBLL * (v2 ^ (v2 >> 27))) ^ ((0x94D049BB133111EBLL * (v2 ^ (v2 >> 27))) >> 31);
}

- (void)encodeWithCoder:(id)a3
{
}

- (BKSMousePointerGlobalContextOptions)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BKSMousePointerGlobalContextOptions;
  id v3 = a3;
  id v4 = [(BKSMousePointerGlobalContextOptions *)&v7 init];
  char v5 = objc_msgSend(v3, "decodeBoolForKey:", @"pinOnButtonDown", v7.receiver, v7.super_class);

  v4->_pinOnButtonDown = v5;
  return v4;
}

- (BKSMousePointerGlobalContextOptions)init
{
  unint64_t v2 = [NSString stringWithFormat:@"cannot directly allocate BKSMousePointerGlobalContextOptions"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v3 = [NSString stringWithUTF8String:"-[BKSMousePointerGlobalContextOptions init]"];
    int v5 = 138544130;
    v6 = v3;
    __int16 v7 = 2114;
    objc_super v8 = @"BKSMousePointerGlobalContextOptions.m";
    __int16 v9 = 1024;
    int v10 = 30;
    __int16 v11 = 2114;
    v12 = v2;
    _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v5, 0x26u);
  }
  [v2 UTF8String];
  result = (BKSMousePointerGlobalContextOptions *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BKSMousePointerGlobalContextOptions)new
{
  unint64_t v2 = [NSString stringWithFormat:@"cannot directly allocate BKSMousePointerGlobalContextOptions"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v3 = [NSString stringWithUTF8String:"+[BKSMousePointerGlobalContextOptions new]"];
    int v5 = 138544130;
    v6 = v3;
    __int16 v7 = 2114;
    objc_super v8 = @"BKSMousePointerGlobalContextOptions.m";
    __int16 v9 = 1024;
    int v10 = 35;
    __int16 v11 = 2114;
    v12 = v2;
    _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v5, 0x26u);
  }
  [v2 UTF8String];
  result = (BKSMousePointerGlobalContextOptions *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (id)build:(id)a3
{
  id v3 = (void (**)(id, id))a3;
  id v4 = -[BKSMousePointerGlobalContextOptions _init]([BKSMutableMousePointerGlobalContextOptions alloc]);
  v3[2](v3, v4);

  int v5 = (void *)[v4 copy];
  return v5;
}

@end
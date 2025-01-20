@interface BKSMousePointerEventGlobalRoute
+ (BOOL)supportsSecureCoding;
+ (id)build:(id)a3;
+ (id)new;
- (BKSMousePointerEventGlobalRoute)init;
- (BKSMousePointerEventGlobalRoute)initWithCoder:(id)a3;
- (BKSMousePointerGlobalContextOptions)options;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)_init;
- (id)_initWithCopyOf:(id *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unsigned)contextID;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BKSMousePointerEventGlobalRoute

- (void).cxx_destruct
{
}

- (BKSMousePointerGlobalContextOptions)options
{
  return self->_options;
}

- (unsigned)contextID
{
  return self->_contextID;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v6 = a3;
  id v4 = (id)[v6 appendUInt64:self->_contextID withName:@"contextID" format:1];
  id v5 = (id)[v6 appendObject:self->_options withName:@"options"];
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [BKSMutableMousePointerEventGlobalRoute alloc];
  return -[BKSMousePointerEventGlobalRoute _initWithCopyOf:]((id *)&v4->super.super.isa, self);
}

- (id)_initWithCopyOf:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = (id *)-[BKSMousePointerEventGlobalRoute _init](a1);
    a1 = v4;
    if (v4)
    {
      *((_DWORD *)v4 + 2) = *((_DWORD *)v3 + 2);
      objc_storeStrong(v4 + 2, *((id *)v3 + 2));
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
        id v4 = [NSString stringWithFormat:@"BKSMousePointerEventGlobalRoute cannot be subclassed"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          id v5 = NSStringFromSelector(sel__init);
          id v6 = (objc_class *)objc_opt_class();
          v7 = NSStringFromClass(v6);
          *(_DWORD *)buf = 138544642;
          v10 = v5;
          __int16 v11 = 2114;
          v12 = v7;
          __int16 v13 = 2048;
          v14 = v1;
          __int16 v15 = 2114;
          v16 = @"BKSMousePointerEventGlobalRoute.m";
          __int16 v17 = 1024;
          int v18 = 42;
          __int16 v19 = 2114;
          v20 = v4;
          _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        [v4 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x18AA5094CLL);
      }
    }
    v8.receiver = v1;
    v8.super_class = (Class)BKSMousePointerEventGlobalRoute;
    return objc_msgSendSuper2(&v8, sel_init);
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [BKSMousePointerEventGlobalRoute alloc];
  return -[BKSMousePointerEventGlobalRoute _initWithCopyOf:]((id *)&v4->super.isa, self);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && v4[2] == self->_contextID) {
    char v5 = BSEqualObjects();
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  unint64_t v3 = [(BKSMousePointerGlobalContextOptions *)self->_options hash];
  id v4 = [NSNumber numberWithUnsignedInt:self->_contextID];
  unint64_t v5 = [v4 hash] ^ v3;

  unint64_t v6 = 0x94D049BB133111EBLL
     * ((0xBF58476D1CE4E5B9 * (v5 ^ (v5 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v5 ^ (v5 >> 30))) >> 27));
  return v6 ^ (v6 >> 31);
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeInt32:self->_contextID forKey:@"contextID"];
  options = self->_options;
  if (options) {
    [v5 encodeObject:options forKey:@"options"];
  }
}

- (BKSMousePointerEventGlobalRoute)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BKSMousePointerEventGlobalRoute;
  id v3 = a3;
  id v4 = [(BKSMousePointerEventGlobalRoute *)&v8 init];
  v4->_contextID = objc_msgSend(v3, "decodeInt32ForKey:", @"contextID", v8.receiver, v8.super_class);
  uint64_t v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"options"];

  options = v4->_options;
  v4->_options = (BKSMousePointerGlobalContextOptions *)v5;

  return v4;
}

- (BKSMousePointerEventGlobalRoute)init
{
  uint64_t v2 = [NSString stringWithFormat:@"cannot directly allocate BKSMousePointerEventGlobalRoute"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v3 = [NSString stringWithUTF8String:"-[BKSMousePointerEventGlobalRoute init]"];
    int v5 = 138544130;
    unint64_t v6 = v3;
    __int16 v7 = 2114;
    objc_super v8 = @"BKSMousePointerEventGlobalRoute.m";
    __int16 v9 = 1024;
    int v10 = 31;
    __int16 v11 = 2114;
    v12 = v2;
    _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v5, 0x26u);
  }
  [v2 UTF8String];
  result = (BKSMousePointerEventGlobalRoute *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)new
{
  uint64_t v2 = [NSString stringWithFormat:@"cannot directly allocate BKSMousePointerEventGlobalRoute"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v3 = [NSString stringWithUTF8String:"+[BKSMousePointerEventGlobalRoute new]"];
    int v5 = 138544130;
    unint64_t v6 = v3;
    __int16 v7 = 2114;
    objc_super v8 = @"BKSMousePointerEventGlobalRoute.m";
    __int16 v9 = 1024;
    int v10 = 36;
    __int16 v11 = 2114;
    v12 = v2;
    _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v5, 0x26u);
  }
  [v2 UTF8String];
  id result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (id)build:(id)a3
{
  id v3 = (void (**)(id, id))a3;
  id v4 = -[BKSMousePointerEventGlobalRoute _init]([BKSMutableMousePointerEventGlobalRoute alloc]);
  v3[2](v3, v4);

  int v5 = (void *)[v4 copy];
  return v5;
}

@end
@interface BKSMutableHIDEventDeferringResolution
+ (id)new;
- (BKSMutableHIDEventDeferringResolution)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setDispatchingTarget:(id)a3;
- (void)setDisplay:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setPid:(int)a3;
- (void)setProcessDescription:(id)a3;
- (void)setToken:(id)a3;
- (void)setVersionedPID:(int64_t)a3;
@end

@implementation BKSMutableHIDEventDeferringResolution

+ (id)new
{
  return objc_alloc_init(BKSMutableHIDEventDeferringResolution);
}

- (BKSMutableHIDEventDeferringResolution)init
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_opt_class();
  if (v4 != objc_opt_class())
  {
    v9 = [NSString stringWithFormat:@"BKSMutableHIDEventDeferringResolution cannot be subclassed"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v10 = NSStringFromSelector(a2);
      v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      int v13 = 138544642;
      v14 = v10;
      __int16 v15 = 2114;
      v16 = v12;
      __int16 v17 = 2048;
      v18 = self;
      __int16 v19 = 2114;
      v20 = @"BKSHIDEventDeferringResolution.m";
      __int16 v21 = 1024;
      int v22 = 250;
      __int16 v23 = 2114;
      v24 = v9;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v13, 0x3Au);
    }
    [v9 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA0DB48);
  }
  v5 = +[BKSHIDEventDisplay nullDisplay];
  v6 = +[BKSHIDEventDeferringEnvironment keyboardFocusEnvironment];
  uint64_t v7 = BSGetVersionedPID();
  if (self) {
    self = (BKSMutableHIDEventDeferringResolution *)-[BKSHIDEventDeferringResolution _initWithDisplay:environment:versionedPID:pid:token:dispatchingTarget:](self, v5, v6, v7, -1, 0);
  }

  return self;
}

- (void)setToken:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v7 = [NSString stringWithFormat:@"expected BKSHIDEventDeferringToken; got %@", v11];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v8 = NSStringFromSelector(a2);
        v9 = (objc_class *)objc_opt_class();
        v10 = NSStringFromClass(v9);
        *(_DWORD *)buf = 138544642;
        int v13 = v8;
        __int16 v14 = 2114;
        __int16 v15 = v10;
        __int16 v16 = 2048;
        __int16 v17 = self;
        __int16 v18 = 2114;
        __int16 v19 = @"BKSHIDEventDeferringResolution.m";
        __int16 v20 = 1024;
        int v21 = 291;
        __int16 v22 = 2114;
        __int16 v23 = v7;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v7 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA0E790);
    }
  }
  v5 = (BKSHIDEventDeferringToken *)[v11 copy];
  token = self->super._token;
  self->super._token = v5;
}

- (void)setEnvironment:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  if (!v15)
  {
    uint64_t v7 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"environment != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v8 = NSStringFromSelector(a2);
      v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      *(_DWORD *)buf = 138544642;
      __int16 v17 = v8;
      __int16 v18 = 2114;
      __int16 v19 = v10;
      __int16 v20 = 2048;
      int v21 = self;
      __int16 v22 = 2114;
      __int16 v23 = @"BKSHIDEventDeferringResolution.m";
      __int16 v24 = 1024;
      int v25 = 264;
      __int16 v26 = 2114;
      v27 = v7;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v7 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA10FDCLL);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"expected BKSHIDEventDeferringEnvironment; got %@",
    id v11 = v15);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v12 = NSStringFromSelector(a2);
      int v13 = (objc_class *)objc_opt_class();
      __int16 v14 = NSStringFromClass(v13);
      *(_DWORD *)buf = 138544642;
      __int16 v17 = v12;
      __int16 v18 = 2114;
      __int16 v19 = v14;
      __int16 v20 = 2048;
      int v21 = self;
      __int16 v22 = 2114;
      __int16 v23 = @"BKSHIDEventDeferringResolution.m";
      __int16 v24 = 1024;
      int v25 = 265;
      __int16 v26 = 2114;
      v27 = v11;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v11 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA110D0);
  }
  v5 = (BKSHIDEventDeferringEnvironment *)[v15 copy];
  environment = self->super._environment;
  self->super._environment = v5;
}

- (void)setDisplay:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  if (!v15)
  {
    uint64_t v7 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"display != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v8 = NSStringFromSelector(a2);
      v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      *(_DWORD *)buf = 138544642;
      __int16 v17 = v8;
      __int16 v18 = 2114;
      __int16 v19 = v10;
      __int16 v20 = 2048;
      int v21 = self;
      __int16 v22 = 2114;
      __int16 v23 = @"BKSHIDEventDeferringResolution.m";
      __int16 v24 = 1024;
      int v25 = 256;
      __int16 v26 = 2114;
      v27 = v7;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v7 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA11278);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v11 = [NSString stringWithFormat:@"expected BKSHIDEventDisplay; got %@", v15];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v12 = NSStringFromSelector(a2);
      int v13 = (objc_class *)objc_opt_class();
      __int16 v14 = NSStringFromClass(v13);
      *(_DWORD *)buf = 138544642;
      __int16 v17 = v12;
      __int16 v18 = 2114;
      __int16 v19 = v14;
      __int16 v20 = 2048;
      int v21 = self;
      __int16 v22 = 2114;
      __int16 v23 = @"BKSHIDEventDeferringResolution.m";
      __int16 v24 = 1024;
      int v25 = 257;
      __int16 v26 = 2114;
      v27 = v11;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v11 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA1136CLL);
  }
  v5 = (BKSHIDEventDisplay *)[v15 copy];
  display = self->super._display;
  self->super._display = v5;
}

- (void)setPid:(int)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a3 <= 0)
  {
    v5 = [NSString stringWithFormat:@"invalid pid"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v6 = NSStringFromSelector(a2);
      uint64_t v7 = (objc_class *)objc_opt_class();
      v8 = NSStringFromClass(v7);
      int v9 = 138544642;
      v10 = v6;
      __int16 v11 = 2114;
      v12 = v8;
      __int16 v13 = 2048;
      __int16 v14 = self;
      __int16 v15 = 2114;
      __int16 v16 = @"BKSHIDEventDeferringResolution.m";
      __int16 v17 = 1024;
      int v18 = 283;
      __int16 v19 = 2114;
      __int16 v20 = v5;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
    }
    [v5 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA13170);
  }
  self->super._pid = a3;
  self->super._versionedPID = -1;
}

- (void)setDispatchingTarget:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v5 = (BKSHIDEventDispatchingTarget *)a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v7 = [NSString stringWithFormat:@"expected BKSHIDEventDispatchingTarget; got %@", v5];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v8 = NSStringFromSelector(a2);
        int v9 = (objc_class *)objc_opt_class();
        v10 = NSStringFromClass(v9);
        *(_DWORD *)buf = 138544642;
        v12 = v8;
        __int16 v13 = 2114;
        __int16 v14 = v10;
        __int16 v15 = 2048;
        __int16 v16 = self;
        __int16 v17 = 2114;
        int v18 = @"BKSHIDEventDeferringResolution.m";
        __int16 v19 = 1024;
        int v20 = 307;
        __int16 v21 = 2114;
        __int16 v22 = v7;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v7 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA133E0);
    }
  }
  dispatchingTarget = self->super._dispatchingTarget;
  self->super._dispatchingTarget = v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[BKSHIDEventDeferringResolution allocWithZone:a3];
  return -[BKSHIDEventDeferringResolution _initWithCopyOf:]((id *)&v4->super.isa, self);
}

- (void)setProcessDescription:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v7 = [NSString stringWithFormat:@"expected NSString; got %@", v11];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v8 = NSStringFromSelector(a2);
        int v9 = (objc_class *)objc_opt_class();
        v10 = NSStringFromClass(v9);
        *(_DWORD *)buf = 138544642;
        __int16 v13 = v8;
        __int16 v14 = 2114;
        __int16 v15 = v10;
        __int16 v16 = 2048;
        __int16 v17 = self;
        __int16 v18 = 2114;
        __int16 v19 = @"BKSHIDEventDeferringResolution.m";
        __int16 v20 = 1024;
        int v21 = 299;
        __int16 v22 = 2114;
        uint64_t v23 = v7;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v7 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA48F70);
    }
  }
  v5 = (NSString *)[v11 copy];
  processDescription = self->super._processDescription;
  self->super._processDescription = v5;
}

- (void)setVersionedPID:(int64_t)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (self->super._versionedPID != a3)
  {
    if (a3 == -1)
    {
      v5 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"versionedPID != ((BSVersionedPID) -1)"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v6 = NSStringFromSelector(a2);
        uint64_t v7 = (objc_class *)objc_opt_class();
        v8 = NSStringFromClass(v7);
        *(_DWORD *)buf = 138544642;
        __int16 v14 = v6;
        __int16 v15 = 2114;
        __int16 v16 = v8;
        __int16 v17 = 2048;
        __int16 v18 = self;
        __int16 v19 = 2114;
        __int16 v20 = @"BKSHIDEventDeferringResolution.m";
        __int16 v21 = 1024;
        int v22 = 273;
        __int16 v23 = 2114;
        uint64_t v24 = v5;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v5 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA490E8);
    }
    if (!a3)
    {
      int v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"versionedPID != 0"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v10 = NSStringFromSelector(a2);
        id v11 = (objc_class *)objc_opt_class();
        v12 = NSStringFromClass(v11);
        *(_DWORD *)buf = 138544642;
        __int16 v14 = v10;
        __int16 v15 = 2114;
        __int16 v16 = v12;
        __int16 v17 = 2048;
        __int16 v18 = self;
        __int16 v19 = 2114;
        __int16 v20 = @"BKSHIDEventDeferringResolution.m";
        __int16 v21 = 1024;
        int v22 = 274;
        __int16 v23 = 2114;
        uint64_t v24 = v9;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v9 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA491E0);
    }
    self->super._versionedPID = a3;
    self->super._pid = a3;
  }
}

@end
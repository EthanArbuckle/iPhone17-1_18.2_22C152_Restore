@interface BKSMutableHIDEventKeyCommandsRegistration
+ (id)new;
- (BKSMutableHIDEventKeyCommandsRegistration)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setDeferringEnvironment:(id)a3;
- (void)setDeferringToken:(id)a3;
- (void)setKeyCommands:(id)a3;
@end

@implementation BKSMutableHIDEventKeyCommandsRegistration

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[BKSHIDEventKeyCommandsRegistration allocWithZone:a3];
  environment = self->super._environment;
  token = self->super._token;
  keyCommands = self->super._keyCommands;
  return [(BKSHIDEventKeyCommandsRegistration *)v4 _initWithEnvironment:environment token:token keyCommands:keyCommands];
}

- (void)setKeyCommands:(id)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v32 = NSString;
    v33 = (objc_class *)objc_opt_class();
    v34 = NSStringFromClass(v33);
    v35 = [v32 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"keyCommands", v34];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v36 = NSStringFromSelector(a2);
      v37 = (objc_class *)objc_opt_class();
      v38 = NSStringFromClass(v37);
      *(_DWORD *)buf = 138544642;
      v54 = v36;
      __int16 v55 = 2114;
      v56 = v38;
      __int16 v57 = 2048;
      v58 = self;
      __int16 v59 = 2114;
      v60 = @"BKSHIDEventKeyCommandsRegistration.m";
      __int16 v61 = 1024;
      int v62 = 185;
      __int16 v63 = 2114;
      v64 = v35;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v35 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA4CAD8);
  }
  v6 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v39 = NSString;
    v40 = (objc_class *)[v6 classForCoder];
    if (!v40) {
      v40 = (objc_class *)objc_opt_class();
    }
    v41 = NSStringFromClass(v40);
    v42 = (objc_class *)objc_opt_class();
    v43 = NSStringFromClass(v42);
    v44 = [v39 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"keyCommands", v41, v43];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v45 = NSStringFromSelector(a2);
      v46 = (objc_class *)objc_opt_class();
      v47 = NSStringFromClass(v46);
      *(_DWORD *)buf = 138544642;
      v54 = v45;
      __int16 v55 = 2114;
      v56 = v47;
      __int16 v57 = 2048;
      v58 = self;
      __int16 v59 = 2114;
      v60 = @"BKSHIDEventKeyCommandsRegistration.m";
      __int16 v61 = 1024;
      int v62 = 185;
      __int16 v63 = 2114;
      v64 = v44;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v44 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA4CC14);
  }

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v49;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v49 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(id *)(*((void *)&v48 + 1) + 8 * v11);
        if (!v12)
        {
          v16 = NSString;
          v17 = (objc_class *)objc_opt_class();
          v18 = NSStringFromClass(v17);
          v19 = [v16 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"keyCommand", v18];

          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            v20 = NSStringFromSelector(a2);
            v21 = (objc_class *)objc_opt_class();
            v22 = NSStringFromClass(v21);
            *(_DWORD *)buf = 138544642;
            v54 = v20;
            __int16 v55 = 2114;
            v56 = v22;
            __int16 v57 = 2048;
            v58 = self;
            __int16 v59 = 2114;
            v60 = @"BKSHIDEventKeyCommandsRegistration.m";
            __int16 v61 = 1024;
            int v62 = 187;
            __int16 v63 = 2114;
            v64 = v19;
            _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
          }
          [v19 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x18AA4C884);
        }
        v13 = v12;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v23 = NSString;
          v24 = (objc_class *)[v13 classForCoder];
          if (!v24) {
            v24 = (objc_class *)objc_opt_class();
          }
          v25 = NSStringFromClass(v24);
          v26 = (objc_class *)objc_opt_class();
          v27 = NSStringFromClass(v26);
          v28 = [v23 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"keyCommand", v25, v27];

          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            v29 = NSStringFromSelector(a2);
            v30 = (objc_class *)objc_opt_class();
            v31 = NSStringFromClass(v30);
            *(_DWORD *)buf = 138544642;
            v54 = v29;
            __int16 v55 = 2114;
            v56 = v31;
            __int16 v57 = 2048;
            v58 = self;
            __int16 v59 = 2114;
            v60 = @"BKSHIDEventKeyCommandsRegistration.m";
            __int16 v61 = 1024;
            int v62 = 187;
            __int16 v63 = 2114;
            v64 = v28;
            _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
          }
          [v28 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x18AA4C9C0);
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v48 objects:v52 count:16];
    }
    while (v9);
  }

  v14 = (NSSet *)[v7 copy];
  keyCommands = self->super._keyCommands;
  self->super._keyCommands = v14;
}

- (void)setDeferringToken:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  if (v16)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v7 = NSString;
      uint64_t v8 = (objc_class *)[v16 classForCoder];
      if (!v8) {
        uint64_t v8 = (objc_class *)objc_opt_class();
      }
      uint64_t v9 = NSStringFromClass(v8);
      uint64_t v10 = (objc_class *)objc_opt_class();
      uint64_t v11 = NSStringFromClass(v10);
      id v12 = [v7 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"token", v9, v11];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v13 = NSStringFromSelector(a2);
        v14 = (objc_class *)objc_opt_class();
        v15 = NSStringFromClass(v14);
        *(_DWORD *)buf = 138544642;
        v18 = v13;
        __int16 v19 = 2114;
        v20 = v15;
        __int16 v21 = 2048;
        v22 = self;
        __int16 v23 = 2114;
        v24 = @"BKSHIDEventKeyCommandsRegistration.m";
        __int16 v25 = 1024;
        int v26 = 179;
        __int16 v27 = 2114;
        v28 = v12;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v12 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA4CE14);
    }
  }

  id v5 = (BKSHIDEventDeferringToken *)[v16 copy];
  token = self->super._token;
  self->super._token = v5;
}

- (void)setDeferringEnvironment:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  if (!v23)
  {
    id v7 = NSString;
    uint64_t v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    uint64_t v10 = [v7 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"environment", v9];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = NSStringFromSelector(a2);
      id v12 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v12);
      *(_DWORD *)buf = 138544642;
      __int16 v25 = v11;
      __int16 v26 = 2114;
      __int16 v27 = v13;
      __int16 v28 = 2048;
      uint64_t v29 = self;
      __int16 v30 = 2114;
      v31 = @"BKSHIDEventKeyCommandsRegistration.m";
      __int16 v32 = 1024;
      int v33 = 173;
      __int16 v34 = 2114;
      v35 = v10;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v10 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA4CFF0);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = NSString;
    v15 = (objc_class *)[v23 classForCoder];
    if (!v15) {
      v15 = (objc_class *)objc_opt_class();
    }
    id v16 = NSStringFromClass(v15);
    v17 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v17);
    __int16 v19 = [v14 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"environment", v16, v18];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v20 = NSStringFromSelector(a2);
      __int16 v21 = (objc_class *)objc_opt_class();
      v22 = NSStringFromClass(v21);
      *(_DWORD *)buf = 138544642;
      __int16 v25 = v20;
      __int16 v26 = 2114;
      __int16 v27 = v22;
      __int16 v28 = 2048;
      uint64_t v29 = self;
      __int16 v30 = 2114;
      v31 = @"BKSHIDEventKeyCommandsRegistration.m";
      __int16 v32 = 1024;
      int v33 = 173;
      __int16 v34 = 2114;
      v35 = v19;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v19 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA4D12CLL);
  }

  id v5 = (BKSHIDEventDeferringEnvironment *)[v23 copy];
  environment = self->super._environment;
  self->super._environment = v5;
}

- (BKSMutableHIDEventKeyCommandsRegistration)init
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_opt_class();
  if (v4 != objc_opt_class())
  {
    uint64_t v9 = [NSString stringWithFormat:@"BKSMutableHIDEventKeyCommandsRegistration cannot be subclassed"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = NSStringFromSelector(a2);
      uint64_t v11 = (objc_class *)objc_opt_class();
      id v12 = NSStringFromClass(v11);
      int v13 = 138544642;
      v14 = v10;
      __int16 v15 = 2114;
      id v16 = v12;
      __int16 v17 = 2048;
      v18 = self;
      __int16 v19 = 2114;
      v20 = @"BKSHIDEventKeyCommandsRegistration.m";
      __int16 v21 = 1024;
      int v22 = 167;
      __int16 v23 = 2114;
      v24 = v9;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v13, 0x3Au);
    }
    [v9 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA4D2E0);
  }
  id v5 = +[BKSHIDEventDeferringEnvironment keyboardFocusEnvironment];
  v6 = [MEMORY[0x1E4F1CAD0] set];
  id v7 = [(BKSHIDEventKeyCommandsRegistration *)self _initWithEnvironment:v5 token:0 keyCommands:v6];

  return v7;
}

+ (id)new
{
  return objc_alloc_init(BKSMutableHIDEventKeyCommandsRegistration);
}

@end
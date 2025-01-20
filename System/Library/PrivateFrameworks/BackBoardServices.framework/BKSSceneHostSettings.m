@interface BKSSceneHostSettings
+ (BKSSceneHostSettings)new;
+ (BOOL)supportsSecureCoding;
- (BKSSceneHostSettings)init;
- (BKSSceneHostSettings)initWithCoder:(id)a3;
- (BKSSceneHostSettings)initWithIdentifier:(id)a3 touchBehavior:(int64_t)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)identifier;
- (int64_t)touchBehavior;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BKSSceneHostSettings

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"ident"];
  [v5 encodeInteger:self->_touchBehavior forKey:@"touchBehavior"];
}

- (void).cxx_destruct
{
}

- (int64_t)touchBehavior
{
  return self->_touchBehavior;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BKSSceneHostSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ident"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"touchBehavior"];

  v7 = [(BKSSceneHostSettings *)self initWithIdentifier:v5 touchBehavior:v6];
  return v7;
}

- (BKSSceneHostSettings)initWithIdentifier:(id)a3 touchBehavior:(int64_t)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = NSString;
  v9 = (objc_class *)objc_opt_class();
  if (!v7)
  {
    v15 = NSStringFromClass(v9);
    v16 = [v8 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"identifier", v15];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v17 = NSStringFromSelector(a2);
      v18 = (objc_class *)objc_opt_class();
      v19 = NSStringFromClass(v18);
      *(_DWORD *)buf = 138544642;
      v39 = v17;
      __int16 v40 = 2114;
      v41 = v19;
      __int16 v42 = 2048;
      v43 = self;
      __int16 v44 = 2114;
      v45 = @"BKSSceneHostSettings.m";
      __int16 v46 = 1024;
      int v47 = 58;
      __int16 v48 = 2114;
      v49 = v16;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v16 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA1E940);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v20 = NSString;
    v21 = (objc_class *)[v7 classForCoder];
    if (!v21) {
      v21 = (objc_class *)objc_opt_class();
    }
    v22 = NSStringFromClass(v21);
    v23 = (objc_class *)objc_opt_class();
    v24 = NSStringFromClass(v23);
    v25 = [v20 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"identifier", v22, v24];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v26 = NSStringFromSelector(a2);
      v27 = (objc_class *)objc_opt_class();
      v28 = NSStringFromClass(v27);
      *(_DWORD *)buf = 138544642;
      v39 = v26;
      __int16 v40 = 2114;
      v41 = v28;
      __int16 v42 = 2048;
      v43 = self;
      __int16 v44 = 2114;
      v45 = @"BKSSceneHostSettings.m";
      __int16 v46 = 1024;
      int v47 = 58;
      __int16 v48 = 2114;
      v49 = v25;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v25 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA1EA78);
  }

  if ((unint64_t)(a4 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v29 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"behavior == BKSSceneHostTouchBehaviorInactive || behavior == BKSSceneHostTouchBehaviorForeground"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v30 = NSStringFromSelector(a2);
      v31 = (objc_class *)objc_opt_class();
      v32 = NSStringFromClass(v31);
      *(_DWORD *)buf = 138544642;
      v39 = v30;
      __int16 v40 = 2114;
      v41 = v32;
      __int16 v42 = 2048;
      v43 = self;
      __int16 v44 = 2114;
      v45 = @"BKSSceneHostSettings.m";
      __int16 v46 = 1024;
      int v47 = 59;
      __int16 v48 = 2114;
      v49 = v29;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v29 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA1EB6CLL);
  }
  v37.receiver = self;
  v37.super_class = (Class)BKSSceneHostSettings;
  v10 = [(BKSSceneHostSettings *)&v37 init];
  if (v10)
  {
    uint64_t v11 = objc_opt_class();
    if (v11 != objc_opt_class())
    {
      v33 = [NSString stringWithFormat:@"BKSSceneHostSettings cannot be subclassed"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v34 = NSStringFromSelector(a2);
        v35 = (objc_class *)objc_opt_class();
        v36 = NSStringFromClass(v35);
        *(_DWORD *)buf = 138544642;
        v39 = v34;
        __int16 v40 = 2114;
        v41 = v36;
        __int16 v42 = 2048;
        v43 = v10;
        __int16 v44 = 2114;
        v45 = @"BKSSceneHostSettings.m";
        __int16 v46 = 1024;
        int v47 = 63;
        __int16 v48 = 2114;
        v49 = v33;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v33 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA1EC54);
    }
    uint64_t v12 = [v7 copy];
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v12;

    v10->_touchBehavior = a4;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BKSSceneHostSettings *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = v4;
    if (v5)
    {
      if (objc_opt_isKindOfClass()) {
        id v7 = v6;
      }
      else {
        id v7 = 0;
      }
    }
    else
    {
      id v7 = 0;
    }
    v9 = v7;

    BOOL v8 = v9 && BSEqualObjects() && self->_touchBehavior == v9->_touchBehavior;
  }

  return v8;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__BKSSceneHostSettings_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_1E5441BB0;
  id v7 = v4;
  BOOL v8 = self;
  id v5 = v4;
  [v5 appendProem:0 block:v6];
}

void __53__BKSSceneHostSettings_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) appendString:*(void *)(*(void *)(a1 + 40) + 8) withName:@"identifier"];
  v2 = *(void **)(a1 + 32);
  NSStringFromBKSSceneHostTouchBehavior(*(void *)(*(void *)(a1 + 40) + 16));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 appendString:v3 withName:@"touchBehavior"];
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (unint64_t)hash
{
  return [(NSString *)self->_identifier hash];
}

- (BKSSceneHostSettings)init
{
  id v4 = [NSString stringWithFormat:@"-init is not permitted"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v5 = NSStringFromSelector(a2);
    uint64_t v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    v10 = v5;
    __int16 v11 = 2114;
    uint64_t v12 = v7;
    __int16 v13 = 2048;
    v14 = self;
    __int16 v15 = 2114;
    v16 = @"BKSSceneHostSettings.m";
    __int16 v17 = 1024;
    int v18 = 53;
    __int16 v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (BKSSceneHostSettings *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (BKSSceneHostSettings)new
{
  id v4 = [NSString stringWithFormat:@"+new is not permitted"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v5 = NSStringFromSelector(a2);
    uint64_t v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    v10 = v5;
    __int16 v11 = 2114;
    uint64_t v12 = v7;
    __int16 v13 = 2048;
    id v14 = a1;
    __int16 v15 = 2114;
    v16 = @"BKSSceneHostSettings.m";
    __int16 v17 = 1024;
    int v18 = 48;
    __int16 v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (BKSSceneHostSettings *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

@end
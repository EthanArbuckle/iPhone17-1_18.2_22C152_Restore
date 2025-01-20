@interface BKSHIDEventDisplay
+ (BKSHIDEventDisplay)displayWithHardwareIdentifier:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)builtinDisplay;
+ (id)nullDisplay;
+ (id)protobufSchema;
- (BKSHIDEventDisplay)init;
- (BKSHIDEventDisplay)initWithCoder:(id)a3;
- (BOOL)_isBuiltinDisplay;
- (BOOL)_isNullDisplay;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)_hardwareIdentifier;
- (id)_initWithHardwareIdentifier:(id)a3;
- (id)initForProtobufDecoding;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BKSHIDEventDisplay

- (unint64_t)hash
{
  if (self->_builtin) {
    uint64_t v2 = 102301;
  }
  else {
    uint64_t v2 = 96953;
  }
  return v2 ^ [(NSString *)self->_hardwareIdentifier hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
}

- (BOOL)_isBuiltinDisplay
{
  return self->_builtin;
}

+ (id)nullDisplay
{
  if (nullDisplay_onceToken != -1) {
    dispatch_once(&nullDisplay_onceToken, &__block_literal_global_2225);
  }
  uint64_t v2 = (void *)nullDisplay___null;
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (BKSHIDEventDisplay *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class() && self->_builtin == v4->_builtin) {
      char v6 = BSEqualStrings();
    }
    else {
      char v6 = 0;
    }
  }

  return v6;
}

- (BOOL)_isNullDisplay
{
  return !self->_builtin && self->_hardwareIdentifier == 0;
}

- (void)encodeWithCoder:(id)a3
{
  hardwareIdentifier = self->_hardwareIdentifier;
  if (hardwareIdentifier) {
    [a3 encodeObject:hardwareIdentifier forKey:@"hardwareIdentifier"];
  }
  else {
    [a3 encodeBool:self->_builtin forKey:@"builtin"];
  }
}

- (NSString)description
{
  hardwareIdentifier = self->_hardwareIdentifier;
  if (hardwareIdentifier)
  {
    v3 = hardwareIdentifier;
  }
  else if (self->_builtin)
  {
    v3 = @"builtin";
  }
  else
  {
    v3 = @"null";
  }
  return (NSString *)v3;
}

- (BKSHIDEventDisplay)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 decodeBoolForKey:@"builtin"])
  {
    uint64_t v5 = +[BKSHIDEventDisplay builtinDisplay];
  }
  else
  {
    char v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hardwareIdentifier"];
    if (v6) {
      +[BKSHIDEventDisplay displayWithHardwareIdentifier:v6];
    }
    else {
    uint64_t v5 = +[BKSHIDEventDisplay nullDisplay];
    }
  }
  return v5;
}

+ (id)builtinDisplay
{
  if (builtinDisplay_onceToken != -1) {
    dispatch_once(&builtinDisplay_onceToken, &__block_literal_global_16);
  }
  uint64_t v2 = (void *)builtinDisplay___builtin;
  return v2;
}

void __33__BKSHIDEventDisplay_nullDisplay__block_invoke()
{
  id v0 = [[BKSHIDEventDisplay alloc] _initWithHardwareIdentifier:0];
  v1 = (void *)nullDisplay___null;
  nullDisplay___null = (uint64_t)v0;

  *(unsigned char *)(nullDisplay___null + 8) = 0;
}

void __36__BKSHIDEventDisplay_builtinDisplay__block_invoke()
{
  id v0 = [[BKSHIDEventDisplay alloc] _initWithHardwareIdentifier:0];
  v1 = (void *)builtinDisplay___builtin;
  builtinDisplay___builtin = (uint64_t)v0;

  *(unsigned char *)(builtinDisplay___builtin + 8) = 1;
}

- (id)_initWithHardwareIdentifier:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)BKSHIDEventDisplay;
  char v6 = [(BKSHIDEventDisplay *)&v25 init];
  if (v6)
  {
    uint64_t v7 = objc_opt_class();
    if (v7 != objc_opt_class())
    {
      v12 = [NSString stringWithFormat:@"BKSHIDEventDisplay cannot be subclassed"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v13 = NSStringFromSelector(a2);
        v14 = (objc_class *)objc_opt_class();
        v15 = NSStringFromClass(v14);
        *(_DWORD *)buf = 138544642;
        v27 = v13;
        __int16 v28 = 2114;
        v29 = v15;
        __int16 v30 = 2048;
        v31 = v6;
        __int16 v32 = 2114;
        v33 = @"BKSHIDEventDisplay.m";
        __int16 v34 = 1024;
        int v35 = 28;
        __int16 v36 = 2114;
        v37 = v12;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v12 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA235C0);
    }
    id v8 = v5;
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v16 = NSString;
        v17 = (objc_class *)[v8 classForCoder];
        if (!v17) {
          v17 = (objc_class *)objc_opt_class();
        }
        v18 = NSStringFromClass(v17);
        v19 = (objc_class *)objc_opt_class();
        v20 = NSStringFromClass(v19);
        v21 = [v16 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"hardwareIdentifier", v18, v20];

        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          v22 = NSStringFromSelector(a2);
          v23 = (objc_class *)objc_opt_class();
          v24 = NSStringFromClass(v23);
          *(_DWORD *)buf = 138544642;
          v27 = v22;
          __int16 v28 = 2114;
          v29 = v24;
          __int16 v30 = 2048;
          v31 = v6;
          __int16 v32 = 2114;
          v33 = @"BKSHIDEventDisplay.m";
          __int16 v34 = 1024;
          int v35 = 29;
          __int16 v36 = 2114;
          v37 = v21;
          _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        [v21 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x18AA236F8);
      }
    }

    uint64_t v9 = [v8 copy];
    hardwareIdentifier = v6->_hardwareIdentifier;
    v6->_hardwareIdentifier = (NSString *)v9;
  }
  return v6;
}

- (id)initForProtobufDecoding
{
  v3.receiver = self;
  v3.super_class = (Class)BKSHIDEventDisplay;
  return [(BKSHIDEventDisplay *)&v3 init];
}

+ (id)protobufSchema
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__BKSHIDEventDisplay_protobufSchema__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (protobufSchema_onceToken_2215 != -1) {
    dispatch_once(&protobufSchema_onceToken_2215, block);
  }
  uint64_t v2 = (void *)protobufSchema_schema_2216;
  return v2;
}

- (id)_hardwareIdentifier
{
  return self->_hardwareIdentifier;
}

- (BKSHIDEventDisplay)init
{
  id v4 = [NSString stringWithFormat:@"-init is not allowed on BKSHIDEventDisplay"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v5 = NSStringFromSelector(a2);
    char v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    v10 = v5;
    __int16 v11 = 2114;
    v12 = v7;
    __int16 v13 = 2048;
    v14 = self;
    __int16 v15 = 2114;
    v16 = @"BKSHIDEventDisplay.m";
    __int16 v17 = 1024;
    int v18 = 22;
    __int16 v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (BKSHIDEventDisplay *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

uint64_t __36__BKSHIDEventDisplay_protobufSchema__block_invoke(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x1E4F4F808] buildSchemaForClass:*(void *)(a1 + 32) builder:&__block_literal_global_26];
  uint64_t v2 = protobufSchema_schema_2216;
  protobufSchema_schema_2216 = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

void __36__BKSHIDEventDisplay_protobufSchema__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 addField:"_hardwareIdentifier" forTag:1];
  [v2 addField:"_builtin" forTag:2];
}

+ (BKSHIDEventDisplay)displayWithHardwareIdentifier:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  char v6 = NSString;
  uint64_t v7 = (objc_class *)objc_opt_class();
  if (!v5)
  {
    v10 = NSStringFromClass(v7);
    __int16 v11 = [v6 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"hardwareIdentifier", v10];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v12 = NSStringFromSelector(a2);
      __int16 v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      *(_DWORD *)buf = 138544642;
      objc_super v25 = v12;
      __int16 v26 = 2114;
      v27 = v14;
      __int16 v28 = 2048;
      id v29 = a1;
      __int16 v30 = 2114;
      v31 = @"BKSHIDEventDisplay.m";
      __int16 v32 = 1024;
      int v33 = 66;
      __int16 v34 = 2114;
      int v35 = v11;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v11 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA36DC0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __int16 v15 = NSString;
    v16 = (objc_class *)[v5 classForCoder];
    if (!v16) {
      v16 = (objc_class *)objc_opt_class();
    }
    __int16 v17 = NSStringFromClass(v16);
    int v18 = (objc_class *)objc_opt_class();
    __int16 v19 = NSStringFromClass(v18);
    v20 = [v15 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"hardwareIdentifier", v17, v19];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v21 = NSStringFromSelector(a2);
      v22 = (objc_class *)objc_opt_class();
      v23 = NSStringFromClass(v22);
      *(_DWORD *)buf = 138544642;
      objc_super v25 = v21;
      __int16 v26 = 2114;
      v27 = v23;
      __int16 v28 = 2048;
      id v29 = a1;
      __int16 v30 = 2114;
      v31 = @"BKSHIDEventDisplay.m";
      __int16 v32 = 1024;
      int v33 = 66;
      __int16 v34 = 2114;
      int v35 = v20;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v20 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA36EF8);
  }

  id v8 = [[BKSHIDEventDisplay alloc] _initWithHardwareIdentifier:v5];
  return (BKSHIDEventDisplay *)v8;
}

@end
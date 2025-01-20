@interface BKSHIDEventDeferringEnvironment
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (id)environmentWithIdentifier:(id)a3;
+ (id)keyboardFocusEnvironment;
+ (id)protobufSchema;
+ (id)systemEnvironment;
- (BKSHIDEventDeferringEnvironment)init;
- (BKSHIDEventDeferringEnvironment)initWithBSXPCCoder:(id)a3;
- (BKSHIDEventDeferringEnvironment)initWithCoder:(id)a3;
- (BKSHIDEventDeferringEnvironment)initWithXPCDictionary:(id)a3;
- (BOOL)_isKeyboardFocusEnvironment;
- (BOOL)_isSystemEnvironment;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)_uniqueEnvironmentForIdentifier;
- (id)initForProtobufDecoding;
- (unint64_t)hash;
- (void)_initWithIdentifier:(void *)a1;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation BKSHIDEventDeferringEnvironment

- (NSString)description
{
  return self->_identifier;
}

- (unint64_t)hash
{
  return [(NSString *)self->_identifier hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
}

- (void)encodeWithCoder:(id)a3
{
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v3 = a3;
  [@"ident" UTF8String];
  BSSerializeStringToXPCDictionaryWithKey();
}

- (BKSHIDEventDeferringEnvironment)initWithXPCDictionary:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)BKSHIDEventDeferringEnvironment;
  id v3 = a3;
  v4 = [(BKSHIDEventDeferringEnvironment *)&v12 init];
  objc_msgSend(@"ident", "UTF8String", v12.receiver, v12.super_class);
  uint64_t v5 = BSDeserializeStringFromXPCDictionaryWithKey();

  identifier = v4->_identifier;
  v4->_identifier = (NSString *)v5;

  uint64_t v7 = -[BKSHIDEventDeferringEnvironment _uniqueEnvironmentForIdentifier]((id *)&v4->super.isa);
  v8 = (void *)v7;
  if (v7) {
    v9 = (void *)v7;
  }
  else {
    v9 = v4;
  }
  v10 = v9;

  return v10;
}

- (BKSHIDEventDeferringEnvironment)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BKSHIDEventDeferringEnvironment;
  uint64_t v5 = [(BKSHIDEventDeferringEnvironment *)&v10 init];
  if (!v5
    || ([v4 decodeObjectOfClass:objc_opt_class() forKey:@"ident"],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        identifier = v5->_identifier,
        v5->_identifier = (NSString *)v6,
        identifier,
        -[BKSHIDEventDeferringEnvironment _uniqueEnvironmentForIdentifier]((id *)&v5->super.isa),
        (v8 = (BKSHIDEventDeferringEnvironment *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v8 = v5;
  }

  return v8;
}

- (id)_uniqueEnvironmentForIdentifier
{
  if (a1)
  {
    v2 = a1;
    if ([a1[1] isEqual:@"system"])
    {
      a1 = +[BKSHIDEventDeferringEnvironment systemEnvironment];
    }
    else if ([v2[1] isEqual:@"keyboardFocus"])
    {
      a1 = +[BKSHIDEventDeferringEnvironment keyboardFocusEnvironment];
    }
    else
    {
      a1 = 0;
    }
    uint64_t v1 = vars8;
  }
  return a1;
}

+ (id)systemEnvironment
{
  if (systemEnvironment_onceToken != -1) {
    dispatch_once(&systemEnvironment_onceToken, &__block_literal_global_240);
  }
  v2 = (void *)systemEnvironment___systemEnvironment;
  return v2;
}

+ (id)keyboardFocusEnvironment
{
  if (keyboardFocusEnvironment_onceToken != -1) {
    dispatch_once(&keyboardFocusEnvironment_onceToken, &__block_literal_global_18);
  }
  v2 = (void *)keyboardFocusEnvironment___focusEnvironment;
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BKSHIDEventDeferringEnvironment *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class()) {
      char v6 = [(NSString *)self->_identifier isEqual:v4->_identifier];
    }
    else {
      char v6 = 0;
    }
  }

  return v6;
}

+ (id)environmentWithIdentifier:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 isEqualToString:@"system"])
  {
    v8 = [NSString stringWithFormat:@"use +systemEnvironment"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v9 = NSStringFromSelector(a2);
      objc_super v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      int v16 = 138544642;
      v17 = v9;
      __int16 v18 = 2114;
      v19 = v11;
      __int16 v20 = 2048;
      id v21 = a1;
      __int16 v22 = 2114;
      v23 = @"BKSHIDEventDeferringEnvironment.m";
      __int16 v24 = 1024;
      int v25 = 61;
      __int16 v26 = 2114;
      v27 = v8;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v16, 0x3Au);
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA23C78);
  }
  if ([v5 isEqualToString:@"keyboardFocus"])
  {
    objc_super v12 = [NSString stringWithFormat:@"use +keyboardFocusEnvironment"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v13 = NSStringFromSelector(a2);
      v14 = (objc_class *)objc_opt_class();
      v15 = NSStringFromClass(v14);
      int v16 = 138544642;
      v17 = v13;
      __int16 v18 = 2114;
      v19 = v15;
      __int16 v20 = 2048;
      id v21 = a1;
      __int16 v22 = 2114;
      v23 = @"BKSHIDEventDeferringEnvironment.m";
      __int16 v24 = 1024;
      int v25 = 62;
      __int16 v26 = 2114;
      v27 = v12;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v16, 0x3Au);
    }
    [v12 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA23D64);
  }
  char v6 = -[BKSHIDEventDeferringEnvironment _initWithIdentifier:]([BKSHIDEventDeferringEnvironment alloc], v5);

  return v6;
}

uint64_t __59__BKSHIDEventDeferringEnvironment_keyboardFocusEnvironment__block_invoke()
{
  v0 = -[BKSHIDEventDeferringEnvironment _initWithIdentifier:]([BKSHIDEventDeferringEnvironment alloc], @"keyboardFocus");
  uint64_t v1 = keyboardFocusEnvironment___focusEnvironment;
  keyboardFocusEnvironment___focusEnvironment = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)_initWithIdentifier:(void *)a1
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = objc_opt_class();
    if (v4 != objc_opt_class())
    {
      v8 = [NSString stringWithFormat:@"BKSHIDEventDeferringEnvironment is not subclassable"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v9 = NSStringFromSelector(sel__initWithIdentifier_);
        objc_super v10 = (objc_class *)objc_opt_class();
        v11 = NSStringFromClass(v10);
        *(_DWORD *)buf = 138544642;
        v14 = v9;
        __int16 v15 = 2114;
        int v16 = v11;
        __int16 v17 = 2048;
        __int16 v18 = a1;
        __int16 v19 = 2114;
        __int16 v20 = @"BKSHIDEventDeferringEnvironment.m";
        __int16 v21 = 1024;
        int v22 = 32;
        __int16 v23 = 2114;
        __int16 v24 = v8;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v8 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA23F64);
    }
    v12.receiver = a1;
    v12.super_class = (Class)BKSHIDEventDeferringEnvironment;
    a1 = objc_msgSendSuper2(&v12, sel_init);
    if (a1)
    {
      uint64_t v5 = [v3 copy];
      char v6 = (void *)a1[1];
      a1[1] = v5;
    }
  }

  return a1;
}

- (id)initForProtobufDecoding
{
  v3.receiver = self;
  v3.super_class = (Class)BKSHIDEventDeferringEnvironment;
  return [(BKSHIDEventDeferringEnvironment *)&v3 init];
}

+ (id)protobufSchema
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__BKSHIDEventDeferringEnvironment_protobufSchema__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (protobufSchema_onceToken != -1) {
    dispatch_once(&protobufSchema_onceToken, block);
  }
  v2 = (void *)protobufSchema_schema;
  return v2;
}

- (BKSHIDEventDeferringEnvironment)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BKSHIDEventDeferringEnvironment;
  uint64_t v5 = [(BKSHIDEventDeferringEnvironment *)&v10 init];
  if (!v5
    || ([v4 decodeStringForKey:@"ident"],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        identifier = v5->_identifier,
        v5->_identifier = (NSString *)v6,
        identifier,
        -[BKSHIDEventDeferringEnvironment _uniqueEnvironmentForIdentifier]((id *)&v5->super.isa),
        (v8 = (BKSHIDEventDeferringEnvironment *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v8 = v5;
  }

  return v8;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
}

- (BOOL)_isKeyboardFocusEnvironment
{
  return [(NSString *)self->_identifier isEqualToString:@"keyboardFocus"];
}

- (BOOL)_isSystemEnvironment
{
  return [(NSString *)self->_identifier isEqualToString:@"system"];
}

- (BKSHIDEventDeferringEnvironment)init
{
  id v4 = [NSString stringWithFormat:@"-init is not allowed on BKSHIDEventDeferringEnvironment"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = NSStringFromSelector(a2);
    uint64_t v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    objc_super v10 = v5;
    __int16 v11 = 2114;
    objc_super v12 = v7;
    __int16 v13 = 2048;
    v14 = self;
    __int16 v15 = 2114;
    int v16 = @"BKSHIDEventDeferringEnvironment.m";
    __int16 v17 = 1024;
    int v18 = 27;
    __int16 v19 = 2114;
    __int16 v20 = v4;
    _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (BKSHIDEventDeferringEnvironment *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

uint64_t __49__BKSHIDEventDeferringEnvironment_protobufSchema__block_invoke(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x1E4F4F808] buildSchemaForClass:*(void *)(a1 + 32) builder:&__block_literal_global_31];
  uint64_t v2 = protobufSchema_schema;
  protobufSchema_schema = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

uint64_t __49__BKSHIDEventDeferringEnvironment_protobufSchema__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 addField:"_identifier" forTag:1];
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

uint64_t __52__BKSHIDEventDeferringEnvironment_systemEnvironment__block_invoke()
{
  v0 = -[BKSHIDEventDeferringEnvironment _initWithIdentifier:]([BKSHIDEventDeferringEnvironment alloc], @"system");
  uint64_t v1 = systemEnvironment___systemEnvironment;
  systemEnvironment___systemEnvironment = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end
@interface BKSHIDAuthenticatedKeyCommandSpecification
+ (BOOL)supportsSecureCoding;
+ (id)protobufSchema;
+ (id)specificationWithKeyCommand:(id)a3 context:(unint64_t)a4;
- (BKSHIDAuthenticatedKeyCommandSpecification)initWithCoder:(id)a3;
- (BKSHIDEventKeyCommand)keyCommand;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)_init;
- (id)initForProtobufDecoding;
- (unint64_t)context;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setContext:(unint64_t)a3;
- (void)setKeyCommand:(id)a3;
@end

@implementation BKSHIDAuthenticatedKeyCommandSpecification

- (void).cxx_destruct
{
}

- (void)setKeyCommand:(id)a3
{
}

- (BKSHIDEventKeyCommand)keyCommand
{
  return self->_keyCommand;
}

- (void)setContext:(unint64_t)a3
{
  self->_context = a3;
}

- (unint64_t)context
{
  return self->_context;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v6 = a3;
  id v4 = (id)[v6 appendUInt64:self->_context withName:@"context" format:1];
  id v5 = (id)[v6 appendObject:self->_keyCommand withName:@"keyCommands"];
}

- (id)initForProtobufDecoding
{
  v3.receiver = self;
  v3.super_class = (Class)BKSHIDAuthenticatedKeyCommandSpecification;
  return [(BKSHIDAuthenticatedKeyCommandSpecification *)&v3 init];
}

- (void)encodeWithCoder:(id)a3
{
  keyCommand = self->_keyCommand;
  id v5 = a3;
  [v5 encodeObject:keyCommand forKey:@"keyCommand"];
  [v5 encodeInt64:self->_context forKey:@"context"];
}

- (BKSHIDAuthenticatedKeyCommandSpecification)initWithCoder:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [[BKSHIDAuthenticatedKeyCommandSpecification alloc] _init];

  if (v5)
  {
    v5->_context = [v4 decodeInt64ForKey:@"context"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyCommand"];
    keyCommand = v5->_keyCommand;
    v5->_keyCommand = (BKSHIDEventKeyCommand *)v6;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v9 = *MEMORY[0x1E4F28798];
      uint64_t v17 = *MEMORY[0x1E4F28588];
      v10 = [NSString stringWithFormat:@"_keyCommand invalid class:%@", objc_opt_class()];
      v18[0] = v10;
      v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
      v12 = [v8 errorWithDomain:v9 code:22 userInfo:v11];

      if (v12)
      {
        v13 = BKLogEventDelivery();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v16 = v12;
          _os_log_error_impl(&dword_18AA0B000, v13, OS_LOG_TYPE_ERROR, "error decoding authenticated key command spec:%{public}@", buf, 0xCu);
        }

        [v4 failWithError:v12];
      }
    }
  }

  return v5;
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && v4[1] == self->_context) {
    char v5 = BSEqualObjects();
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return [(BKSHIDEventKeyCommand *)self->_keyCommand hash];
}

- (id)_init
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)BKSHIDAuthenticatedKeyCommandSpecification;
  objc_super v3 = [(BKSHIDAuthenticatedKeyCommandSpecification *)&v10 init];
  if (v3)
  {
    uint64_t v4 = objc_opt_class();
    if (v4 != objc_opt_class())
    {
      uint64_t v6 = [NSString stringWithFormat:@"no subclassing"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v7 = NSStringFromSelector(a2);
        v8 = (objc_class *)objc_opt_class();
        uint64_t v9 = NSStringFromClass(v8);
        *(_DWORD *)buf = 138544642;
        v12 = v7;
        __int16 v13 = 2114;
        v14 = v9;
        __int16 v15 = 2048;
        v16 = v3;
        __int16 v17 = 2114;
        v18 = @"BKSHIDAuthenticatedKeyCommandSpecification.m";
        __int16 v19 = 1024;
        int v20 = 28;
        __int16 v21 = 2114;
        v22 = v6;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v6 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA6C234);
    }
  }
  return v3;
}

+ (id)protobufSchema
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__BKSHIDAuthenticatedKeyCommandSpecification_protobufSchema__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (protobufSchema_onceToken_11623 != -1) {
    dispatch_once(&protobufSchema_onceToken_11623, block);
  }
  v2 = (void *)protobufSchema_schema_11624;
  return v2;
}

uint64_t __60__BKSHIDAuthenticatedKeyCommandSpecification_protobufSchema__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F4F808] buildSchemaForClass:objc_opt_class() builder:&__block_literal_global_11626];
  uint64_t v1 = protobufSchema_schema_11624;
  protobufSchema_schema_11624 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void __60__BKSHIDAuthenticatedKeyCommandSpecification_protobufSchema__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 addField:"_context"];
  [v2 addRepeatingField:"_keyCommands" containsClass:objc_opt_class()];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)specificationWithKeyCommand:(id)a3 context:(unint64_t)a4
{
  id v5 = a3;
  id v6 = [[BKSHIDAuthenticatedKeyCommandSpecification alloc] _init];
  [v6 setContext:a4];
  [v6 setKeyCommand:v5];

  return v6;
}

@end
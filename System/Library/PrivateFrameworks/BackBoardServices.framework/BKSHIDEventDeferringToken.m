@interface BKSHIDEventDeferringToken
+ (BKSHIDEventDeferringToken)new;
+ (BOOL)supportsSecureCoding;
+ (id)protobufSchema;
+ (id)tokenForIdentifierOfCAContext:(unsigned int)a3;
+ (id)tokenForIdentifierOfCGSConnection:(unsigned int)a3;
+ (id)tokenForString:(id)a3;
- (BKSHIDEventDeferringToken)init;
- (BKSHIDEventDeferringToken)initWithCoder:(id)a3;
- (BOOL)_isIdentifierOfCAContext;
- (BOOL)_isIdentifierOfCGSConnection;
- (BOOL)_isString;
- (id)_init;
- (id)_string;
- (unsigned)_identifierOfCAContext;
- (unsigned)_identifierOfCGSConnection;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BKSHIDEventDeferringToken

- (id)_init
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_opt_class();
  if (v4 != objc_opt_class() && v4 != objc_opt_class() && v4 != objc_opt_class())
  {
    v6 = [NSString stringWithFormat:@"cannot subclass BKSHIDEventDeferringToken"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v7 = NSStringFromSelector(a2);
      v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      *(_DWORD *)buf = 138544642;
      v12 = v7;
      __int16 v13 = 2114;
      v14 = v9;
      __int16 v15 = 2048;
      v16 = self;
      __int16 v17 = 2114;
      v18 = @"BKSHIDEventDeferringToken.m";
      __int16 v19 = 1024;
      int v20 = 365;
      __int16 v21 = 2114;
      v22 = v6;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v6 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA0ED7CLL);
  }
  v10.receiver = self;
  v10.super_class = (Class)BKSHIDEventDeferringToken;
  return [(BKSHIDEventDeferringToken *)&v10 init];
}

+ (id)tokenForIdentifierOfCAContext:(unsigned int)a3
{
  if (a3)
  {
    id v4 = [[_BKSHIDCAContextEventDeferringToken alloc] _initWithIdentifier:*(void *)&a3];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

+ (id)tokenForString:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (![v5 length])
  {
    v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[string length] > 0"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v9 = NSStringFromSelector(a2);
      objc_super v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 138544642;
      __int16 v13 = v9;
      __int16 v14 = 2114;
      __int16 v15 = v11;
      __int16 v16 = 2048;
      id v17 = a1;
      __int16 v18 = 2114;
      __int16 v19 = @"BKSHIDEventDeferringToken.m";
      __int16 v20 = 1024;
      int v21 = 385;
      __int16 v22 = 2114;
      uint64_t v23 = v8;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA19690);
  }
  id v6 = [[_BKSHIDStringIdentifierEventDeferringToken alloc] _initWithString:v5];

  return v6;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v5 = a3;
  id v6 = [NSString stringWithFormat:@"subclass me"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v7 = NSStringFromSelector(a2);
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    int v10 = 138544642;
    v11 = v7;
    __int16 v12 = 2114;
    __int16 v13 = v9;
    __int16 v14 = 2048;
    __int16 v15 = self;
    __int16 v16 = 2114;
    id v17 = @"BKSHIDEventDeferringToken.m";
    __int16 v18 = 1024;
    int v19 = 451;
    __int16 v20 = 2114;
    int v21 = v6;
    _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v10, 0x3Au);
  }
  [v6 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

- (BKSHIDEventDeferringToken)initWithCoder:(id)a3
{
  id v5 = a3;
  id v6 = [NSString stringWithFormat:@"subclass me"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v7 = NSStringFromSelector(a2);
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    int v11 = 138544642;
    __int16 v12 = v7;
    __int16 v13 = 2114;
    __int16 v14 = v9;
    __int16 v15 = 2048;
    __int16 v16 = self;
    __int16 v17 = 2114;
    __int16 v18 = @"BKSHIDEventDeferringToken.m";
    __int16 v19 = 1024;
    int v20 = 446;
    __int16 v21 = 2114;
    __int16 v22 = v6;
    _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v11, 0x3Au);
  }
  [v6 UTF8String];
  result = (BKSHIDEventDeferringToken *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v6 = [NSString stringWithFormat:@"subclass me"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v7 = NSStringFromSelector(a2);
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    int v10 = 138544642;
    int v11 = v7;
    __int16 v12 = 2114;
    __int16 v13 = v9;
    __int16 v14 = 2048;
    __int16 v15 = self;
    __int16 v16 = 2114;
    __int16 v17 = @"BKSHIDEventDeferringToken.m";
    __int16 v18 = 1024;
    int v19 = 442;
    __int16 v20 = 2114;
    __int16 v21 = v6;
    _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v10, 0x3Au);
  }
  [v6 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

- (id)_string
{
  return 0;
}

- (BOOL)_isString
{
  return 0;
}

- (unsigned)_identifierOfCGSConnection
{
  return 0;
}

- (BOOL)_isIdentifierOfCGSConnection
{
  return 0;
}

- (unsigned)_identifierOfCAContext
{
  return 0;
}

- (BOOL)_isIdentifierOfCAContext
{
  return 0;
}

+ (id)protobufSchema
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__BKSHIDEventDeferringToken_protobufSchema__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (protobufSchema_onceToken_116 != -1) {
    dispatch_once(&protobufSchema_onceToken_116, block);
  }
  v2 = (void *)protobufSchema_schema_115;
  return v2;
}

uint64_t __43__BKSHIDEventDeferringToken_protobufSchema__block_invoke(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x1E4F4F808] buildSchemaForClass:*(void *)(a1 + 32) builder:&__block_literal_global_118];
  uint64_t v2 = protobufSchema_schema_115;
  protobufSchema_schema_115 = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

void __43__BKSHIDEventDeferringToken_protobufSchema__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v4 count:3];
  objc_msgSend(v2, "setAcceptableConcreteSubclasses:", v3, v4, v5);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)tokenForIdentifierOfCGSConnection:(unsigned int)a3
{
  if (a3)
  {
    id v4 = [[_BKSHIDCGSConnectIDEventDeferringToken alloc] _initWithCGSConnectionID:*(void *)&a3];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

+ (BKSHIDEventDeferringToken)new
{
  id v4 = [NSString stringWithFormat:@"+new is not allowed on BKSHIDEventDeferringToken"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = NSStringFromSelector(a2);
    uint64_t v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    int v10 = v5;
    __int16 v11 = 2114;
    __int16 v12 = v7;
    __int16 v13 = 2048;
    id v14 = a1;
    __int16 v15 = 2114;
    __int16 v16 = @"BKSHIDEventDeferringToken.m";
    __int16 v17 = 1024;
    int v18 = 352;
    __int16 v19 = 2114;
    __int16 v20 = v4;
    _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (BKSHIDEventDeferringToken *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (BKSHIDEventDeferringToken)init
{
  id v4 = [NSString stringWithFormat:@"-init is not allowed on BKSHIDEventDeferringToken"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = NSStringFromSelector(a2);
    uint64_t v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    int v10 = v5;
    __int16 v11 = 2114;
    __int16 v12 = v7;
    __int16 v13 = 2048;
    id v14 = self;
    __int16 v15 = 2114;
    __int16 v16 = @"BKSHIDEventDeferringToken.m";
    __int16 v17 = 1024;
    int v18 = 357;
    __int16 v19 = 2114;
    __int16 v20 = v4;
    _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (BKSHIDEventDeferringToken *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

@end
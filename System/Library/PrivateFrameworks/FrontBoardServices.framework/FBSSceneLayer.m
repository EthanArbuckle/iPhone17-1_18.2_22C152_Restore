@interface FBSSceneLayer
- (BOOL)isCAContextLayer;
- (BOOL)isEqual:(id)a3;
- (BOOL)isKeyboardLayer;
- (BOOL)isKeyboardProxyLayer;
- (BOOL)isKindOfClass:(Class)a3;
- (CAContext)CAContext;
- (FBSSceneIdentityToken)keyboardOwner;
- (FBSSceneLayer)init;
- (FBSSceneLayer)initWithContextID:(unsigned int)a3 level:(double)a4;
- (FBSSceneLayer)initWithKeyboardContext:(id)a3;
- (FBSSceneLayer)initWithKeyboardOwner:(id)a3 level:(double)a4;
- (FBSSceneLayer)initWithWindowContext:(id)a3;
- (double)level;
- (id)_init;
- (id)capture;
- (id)description;
- (id)stringRepresentation;
- (int64_t)alignment;
- (int64_t)type;
- (unint64_t)hash;
- (unsigned)contextID;
- (void)dealloc;
@end

@implementation FBSSceneLayer

- (int64_t)type
{
  return self->_type;
}

- (unsigned)contextID
{
  return self->_contextID;
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (BOOL)isKeyboardProxyLayer
{
  return self->_type == 2 && self->_keyboardOwner != 0;
}

- (BOOL)isKeyboardLayer
{
  return self->_type == 2 && self->_keyboardOwner == 0;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (FBSSceneLayer *)a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (self == v4)
      {
        BOOL v5 = 1;
        goto LABEL_8;
      }
      if (self->_type == v4->_type && self->_contextID == v4->_contextID) {
        BSFloatEqualToFloat();
      }
    }
  }
  BOOL v5 = 0;
LABEL_8:

  return v5;
}

- (BOOL)isKindOfClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3 && [(FBSSceneLayer *)self isCAContextLayer]
    || (Class)objc_opt_class() == a3 && [(FBSSceneLayer *)self isKeyboardLayer]
    || (Class)objc_opt_class() == a3 && [(FBSSceneLayer *)self isKeyboardProxyLayer])
  {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)FBSSceneLayer;
  return [(FBSSceneLayer *)&v6 isKindOfClass:a3];
}

- (unint64_t)hash
{
  v2 = [(FBSSceneLayer *)self stringRepresentation];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)stringRepresentation
{
  return self->_stringRepresentation;
}

- (id)capture
{
  id v2 = [[_FBSCapturedSceneLayer alloc] _initWithLayer:self];

  return v2;
}

- (FBSSceneLayer)initWithWindowContext:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"context"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSSceneLayer initWithWindowContext:]();
    }
    [v14 UTF8String];
    _bs_set_crash_log_message();
  }
  objc_super v6 = v5;
  v7 = [(FBSSceneLayer *)self _init];
  v8 = (FBSSceneLayer *)v7;
  if (v7)
  {
    *(_OWORD *)(v7 + 40) = xmmword_19C722C60;
    objc_storeStrong((id *)v7 + 1, a3);
    [v6 level];
    v8->_level = v9;
    uint64_t v10 = [v6 contextId];
    v8->_contextID = v10;
    uint64_t v11 = [NSString stringWithFormat:@"0x%x", v10];
    stringRepresentation = v8->_stringRepresentation;
    v8->_stringRepresentation = (NSString *)v11;
  }
  return v8;
}

- (double)level
{
  return self->_level;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)FBSSceneLayer;
  return [(FBSSceneLayer *)&v3 init];
}

void __24__FBSSceneLayer_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  id v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringRepresentation, 0);
  objc_storeStrong((id *)&self->_keyboardOwner, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

- (void)dealloc
{
  context = self->_context;
  if (context)
  {
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x3032000000;
    v11[3] = __Block_byref_object_copy__10;
    v11[4] = __Block_byref_object_dispose__10;
    v11[5] = context;
    v4 = self->_context;
    self->_context = 0;

    uint64_t v6 = MEMORY[0x1E4F143A8];
    uint64_t v7 = 3221225472;
    v8 = __24__FBSSceneLayer_dealloc__block_invoke;
    float v9 = &unk_1E58F54C8;
    uint64_t v10 = v11;
    BSDispatchMain();
  }
  v5.receiver = self;
  v5.super_class = (Class)FBSSceneLayer;
  [(FBSSceneLayer *)&v5 dealloc];
}

- (FBSSceneLayer)init
{
  v4 = [NSString stringWithFormat:@"wrong initializer"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    objc_super v5 = NSStringFromSelector(a2);
    uint64_t v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    int v8 = 138544642;
    float v9 = v5;
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    __int16 v12 = 2048;
    v13 = self;
    __int16 v14 = 2114;
    v15 = @"FBSSceneLayer.m";
    __int16 v16 = 1024;
    int v17 = 41;
    __int16 v18 = 2114;
    v19 = v4;
    _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
  }
  [v4 UTF8String];
  _bs_set_crash_log_message();
}

- (FBSSceneLayer)initWithKeyboardContext:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    __int16 v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"context"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSSceneLayer initWithKeyboardContext:]();
    }
    [v12 UTF8String];
    _bs_set_crash_log_message();
  }
  uint64_t v6 = v5;
  uint64_t v7 = [(FBSSceneLayer *)self _init];
  int v8 = (FBSSceneLayer *)v7;
  if (v7)
  {
    *(_OWORD *)(v7 + 40) = xmmword_19C722C70;
    objc_storeStrong((id *)v7 + 1, a3);
    [v6 level];
    v8->_level = v9;
    stringRepresentation = v8->_stringRepresentation;
    v8->_stringRepresentation = (NSString *)@"FBSKeyboardLayer";
  }
  return v8;
}

- (FBSSceneLayer)initWithContextID:(unsigned int)a3 level:(double)a4
{
  if (!a3)
  {
    uint64_t v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", a4, @"contextID"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSSceneLayer initWithContextID:level:]();
    }
    [v11 UTF8String];
    _bs_set_crash_log_message();
  }
  uint64_t v5 = *(void *)&a3;
  uint64_t v6 = [(FBSSceneLayer *)self _init];
  uint64_t v7 = (FBSSceneLayer *)v6;
  if (v6)
  {
    *(_OWORD *)(v6 + 40) = xmmword_19C722C60;
    *((_DWORD *)v6 + 4) = v5;
    *((double *)v6 + 3) = a4;
    uint64_t v8 = [NSString stringWithFormat:@"0x%x", v5];
    stringRepresentation = v7->_stringRepresentation;
    v7->_stringRepresentation = (NSString *)v8;
  }
  return v7;
}

- (FBSSceneLayer)initWithKeyboardOwner:(id)a3 level:(double)a4
{
  id v7 = a3;
  if (!v7)
  {
    __int16 v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"owner"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSSceneLayer initWithKeyboardOwner:level:]();
    }
    [v14 UTF8String];
    _bs_set_crash_log_message();
  }
  uint64_t v8 = v7;
  float v9 = [(FBSSceneLayer *)self _init];
  __int16 v10 = (FBSSceneLayer *)v9;
  if (v9)
  {
    *(_OWORD *)(v9 + 40) = xmmword_19C722C70;
    objc_storeStrong((id *)v9 + 4, a3);
    v10->_level = a4;
    uint64_t v11 = [(FBSSceneIdentityToken *)v10->_keyboardOwner stringRepresentation];
    stringRepresentation = v10->_stringRepresentation;
    v10->_stringRepresentation = (NSString *)v11;
  }
  return v10;
}

- (CAContext)CAContext
{
  return self->_context;
}

- (FBSSceneIdentityToken)keyboardOwner
{
  return self->_keyboardOwner;
}

- (BOOL)isCAContextLayer
{
  return self->_type == 1;
}

- (id)description
{
  objc_super v3 = [off_1E58F44F0 builderWithObject:self];
  v4 = NSStringFromFBSSceneLayerType(self->_type);
  id v5 = (id)[v3 appendObject:v4 withName:@"type"];

  id v6 = (id)[v3 appendFloat:@"level" withName:0 decimalPrecision:self->_level];
  uint64_t contextID = self->_contextID;
  if (contextID)
  {
    uint64_t v8 = [NSString stringWithFormat:@"0x%x (%u)", self->_contextID, contextID];
    id v9 = (id)[v3 appendObject:v8 withName:@"contextID"];
  }
  keyboardOwner = self->_keyboardOwner;
  if (keyboardOwner) {
    id v11 = (id)[v3 appendObject:keyboardOwner withName:@"owner"];
  }
  int64_t alignment = self->_alignment;
  if (alignment)
  {
    v13 = NSStringFromFBSSceneLayerAlignment(alignment);
    [v3 appendString:v13 withName:@"alignment"];
  }
  __int16 v14 = [v3 build];

  return v14;
}

- (void)initWithWindowContext:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_18();
  objc_super v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithKeyboardContext:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_18();
  objc_super v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithContextID:level:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_18();
  objc_super v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithKeyboardOwner:level:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_18();
  objc_super v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end
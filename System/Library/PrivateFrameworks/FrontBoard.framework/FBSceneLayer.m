@interface FBSceneLayer
+ (id)layerWithFBSSceneLayer:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isKeyboardLayer;
- (BOOL)isKeyboardProxyLayer;
- (FBSSceneIdentityToken)proxiedKeyboardOwner;
- (FBSceneLayer)init;
- (FBSceneLayer)initWithContextID:(unsigned int)a3;
- (NSString)description;
- (NSString)externalSceneID;
- (double)level;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)initAsKeyboard;
- (id)initAsKeyboardProxyWithOwner:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)alignment;
- (int64_t)type;
- (unint64_t)hash;
- (unsigned)contextID;
- (void)setAlignment:(int64_t)a3;
- (void)setLevel:(double)a3;
@end

@implementation FBSceneLayer

- (int64_t)type
{
  return self->_type;
}

uint64_t __24__FBSceneLayer_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) type];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F62840] builder];
  id v4 = (id)[v3 appendInteger:self->_type];
  id v5 = (id)[v3 appendUnsignedInteger:self->_contextID];
  id v6 = (id)[v3 appendObject:self->_proxiedKeyboardOwner];
  id v7 = (id)[v3 appendCGFloat:self->_level];
  id v8 = (id)[v3 appendInteger:self->_alignment];
  unint64_t v9 = [v3 hash];

  return v9;
}

- (int64_t)alignment
{
  return self->_alignment;
}

uint64_t __24__FBSceneLayer_isEqual___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) alignment];
}

uint64_t __24__FBSceneLayer_isEqual___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) level];
}

uint64_t __24__FBSceneLayer_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) proxiedKeyboardOwner];
}

- (FBSSceneIdentityToken)proxiedKeyboardOwner
{
  return self->_proxiedKeyboardOwner;
}

- (double)level
{
  return self->_level;
}

- (void).cxx_destruct
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F62828] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  int64_t type = self->_type;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __24__FBSceneLayer_isEqual___block_invoke;
  v30[3] = &unk_1E5C4B3C0;
  id v7 = v4;
  id v31 = v7;
  id v8 = (id)[v5 appendInteger:type counterpart:v30];
  uint64_t contextID = self->_contextID;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __24__FBSceneLayer_isEqual___block_invoke_2;
  v28[3] = &unk_1E5C4B3E8;
  id v10 = v7;
  id v29 = v10;
  id v11 = (id)[v5 appendUnsignedInteger:contextID counterpart:v28];
  proxiedKeyboardOwner = self->_proxiedKeyboardOwner;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __24__FBSceneLayer_isEqual___block_invoke_3;
  v26[3] = &unk_1E5C4B410;
  id v13 = v10;
  id v27 = v13;
  id v14 = (id)[v5 appendObject:proxiedKeyboardOwner counterpart:v26];
  double level = self->_level;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __24__FBSceneLayer_isEqual___block_invoke_4;
  v24[3] = &unk_1E5C4B438;
  id v16 = v13;
  id v25 = v16;
  id v17 = (id)[v5 appendCGFloat:v24 counterpart:level];
  int64_t alignment = self->_alignment;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __24__FBSceneLayer_isEqual___block_invoke_5;
  v22[3] = &unk_1E5C4B3C0;
  id v23 = v16;
  id v19 = v16;
  id v20 = (id)[v5 appendInteger:alignment counterpart:v22];
  LOBYTE(alignment) = [v5 isEqual];

  return alignment;
}

+ (id)layerWithFBSSceneLayer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 type];
  if (v5 == 2)
  {
    id v7 = [v4 keyboardOwner];

    id v8 = objc_alloc((Class)a1);
    unint64_t v9 = v8;
    if (v7)
    {
      id v10 = [v4 keyboardOwner];
      id v11 = (void *)[v9 initAsKeyboardProxyWithOwner:v10];

      goto LABEL_9;
    }
    uint64_t v6 = [v8 initAsKeyboard];
  }
  else
  {
    if (v5 != 1)
    {
      id v11 = 0;
      goto LABEL_9;
    }
    uint64_t v6 = objc_msgSend(objc_alloc((Class)a1), "initWithContextID:", objc_msgSend(v4, "contextID"));
  }
  id v11 = (void *)v6;
LABEL_9:
  [v4 level];
  objc_msgSend(v11, "setLevel:");
  objc_msgSend(v11, "setAlignment:", objc_msgSend(v4, "alignment"));

  return v11;
}

uint64_t __24__FBSceneLayer_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) contextID];
}

- (unsigned)contextID
{
  return self->_contextID;
}

- (void)setLevel:(double)a3
{
  self->_double level = a3;
}

- (void)setAlignment:(int64_t)a3
{
  self->_int64_t alignment = a3;
}

- (FBSceneLayer)initWithContextID:(unsigned int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FBSceneLayer;
  result = [(FBSceneLayer *)&v5 init];
  if (result)
  {
    result->_uint64_t contextID = a3;
    result->_int64_t type = 1;
  }
  return result;
}

- (NSString)externalSceneID
{
  return 0;
}

- (FBSceneLayer)init
{
  id v4 = [NSString stringWithFormat:@"you should not be instantiating this class"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    objc_super v5 = NSStringFromSelector(a2);
    uint64_t v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    id v10 = v5;
    __int16 v11 = 2114;
    v12 = v7;
    __int16 v13 = 2048;
    id v14 = self;
    __int16 v15 = 2114;
    id v16 = @"FBSceneLayer.m";
    __int16 v17 = 1024;
    int v18 = 58;
    __int16 v19 = 2114;
    id v20 = v4;
    _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (FBSceneLayer *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)initAsKeyboard
{
  v3.receiver = self;
  v3.super_class = (Class)FBSceneLayer;
  id result = [(FBSceneLayer *)&v3 init];
  if (result) { {
    *((void *)result + 1) = 3;
  }
  }
  return result;
}

- (id)initAsKeyboardProxyWithOwner:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FBSceneLayer;
  uint64_t v6 = [(FBSceneLayer *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    v6->_int64_t type = 4;
    objc_storeStrong((id *)&v6->_proxiedKeyboardOwner, a3);
  }

  return v7;
}

- (NSString)description
{
  return (NSString *)[(FBSceneLayer *)self descriptionWithMultilinePrefix:0];
}

- (BOOL)isKeyboardLayer
{
  return self->_type == 3;
}

- (BOOL)isKeyboardProxyLayer
{
  return self->_type == 4;
}

- (id)succinctDescription
{
  v2 = [(FBSceneLayer *)self succinctDescriptionBuilder];
  objc_super v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  objc_super v3 = [MEMORY[0x1E4F62810] builderWithObject:self];
  id v4 = FBSceneLayerTypeDescription(self->_type);
  id v5 = (id)[v3 appendObject:v4 withName:@"type"];

  uint64_t contextID = self->_contextID;
  if (contextID)
  {
    id v7 = objc_msgSend(NSString, "stringWithFormat:", @"0x%x (%u)", self->_contextID, contextID);
    id v8 = (id)[v3 appendObject:v7 withName:@"contextID"];
  }
  [(FBSceneLayer *)self alignment];
  objc_super v9 = NSStringFromFBSSceneLayerAlignment();
  id v10 = (id)[v3 appendObject:v9 withName:@"alignment"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  objc_super v3 = [(FBSceneLayer *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

@end
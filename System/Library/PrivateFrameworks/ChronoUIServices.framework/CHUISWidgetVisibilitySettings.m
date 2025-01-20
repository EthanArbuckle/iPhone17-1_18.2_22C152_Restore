@interface CHUISWidgetVisibilitySettings
- (BOOL)isEqual:(id)a3;
- (BOOL)isSettled;
- (CGRect)visibleBounds;
- (CHUISWidgetVisibilitySettings)init;
- (CHUISWidgetVisibilitySettings)initWithXPCDictionary:(id)a3;
- (id)_initWithVisibilitySettings:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation CHUISWidgetVisibilitySettings

- (CHUISWidgetVisibilitySettings)init
{
  v4.receiver = self;
  v4.super_class = (Class)CHUISWidgetVisibilitySettings;
  result = [(CHUISWidgetVisibilitySettings *)&v4 init];
  if (result)
  {
    result->_settled = 0;
    CGSize v3 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    result->_visibleBounds.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    result->_visibleBounds.size = v3;
  }
  return result;
}

- (id)_initWithVisibilitySettings:(id)a3
{
  objc_super v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHUISWidgetVisibilitySettings;
  v5 = [(CHUISWidgetVisibilitySettings *)&v9 init];
  v6 = v5;
  if (v5)
  {
    v5->_settled = v4[8];
    CGSize v7 = (CGSize)*((_OWORD *)v4 + 2);
    v5->_visibleBounds.origin = (CGPoint)*((_OWORD *)v4 + 1);
    v5->_visibleBounds.size = v7;
  }

  return v6;
}

- (BOOL)isSettled
{
  return self->_settled;
}

- (CGRect)visibleBounds
{
  double x = self->_visibleBounds.origin.x;
  double y = self->_visibleBounds.origin.y;
  double width = self->_visibleBounds.size.width;
  double height = self->_visibleBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  uint64_t v6 = objc_opt_class();
  id v7 = v4;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      v8 = v7;
    }
    else {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }
  id v9 = v8;

  BOOL v10 = [(CHUISWidgetVisibilitySettings *)self isSettled];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __41__CHUISWidgetVisibilitySettings_isEqual___block_invoke;
  v29[3] = &unk_1E62AF688;
  id v11 = v9;
  id v30 = v11;
  id v12 = (id)[v5 appendBool:v10 counterpart:v29];
  [(CHUISWidgetVisibilitySettings *)self visibleBounds];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  v26 = __41__CHUISWidgetVisibilitySettings_isEqual___block_invoke_2;
  v27 = &unk_1E62AF6B0;
  id v21 = v11;
  id v28 = v21;
  id v22 = (id)objc_msgSend(v5, "appendCGRect:counterpart:", &v24, v14, v16, v18, v20);
  LOBYTE(v11) = objc_msgSend(v5, "isEqual", v24, v25, v26, v27);

  return (char)v11;
}

uint64_t __41__CHUISWidgetVisibilitySettings_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) isSettled];
}

uint64_t __41__CHUISWidgetVisibilitySettings_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) visibleBounds];
}

- (unint64_t)hash
{
  CGSize v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)objc_msgSend(v3, "appendBool:", -[CHUISWidgetVisibilitySettings isSettled](self, "isSettled"));
  [(CHUISWidgetVisibilitySettings *)self visibleBounds];
  id v5 = (id)objc_msgSend(v3, "appendCGRect:");
  unint64_t v6 = [v3 hash];

  return v6;
}

- (id)succinctDescription
{
  v2 = [(CHUISWidgetVisibilitySettings *)self succinctDescriptionBuilder];
  CGSize v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  CGSize v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[CHUISWidgetVisibilitySettings isSettled](self, "isSettled"), @"settled");
  [(CHUISWidgetVisibilitySettings *)self visibleBounds];
  id v5 = (id)objc_msgSend(v3, "appendRect:withName:", @"visibleBounds");

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  CGSize v3 = [(CHUISWidgetVisibilitySettings *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__CHUISWidgetVisibilitySettings_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E62AF538;
  id v6 = v5;
  id v10 = v6;
  id v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];
  id v7 = v6;

  return v7;
}

id __71__CHUISWidgetVisibilitySettings_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isSettled"), @"settled");
  CGSize v3 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) visibleBounds];
  return (id)objc_msgSend(v3, "appendRect:withName:", @"visibleBounds");
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [CHUISMutableWidgetVisibilitySettings alloc];

  return [(CHUISWidgetVisibilitySettings *)v4 _initWithVisibilitySettings:self];
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4 = a3;
  xpc_dictionary_set_BOOL(v4, "s", self->_settled);
  BSSerializeCGRectToXPCDictionaryWithKey();
}

- (CHUISWidgetVisibilitySettings)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [(CHUISWidgetVisibilitySettings *)self init];
  if (v5)
  {
    v5->_settled = xpc_dictionary_get_BOOL(v4, "s");
    BSDeserializeCGRectFromXPCDictionaryWithKey();
    v5->_visibleBounds.origin.double x = v6;
    v5->_visibleBounds.origin.double y = v7;
    v5->_visibleBounds.size.double width = v8;
    v5->_visibleBounds.size.double height = v9;
  }

  return v5;
}

@end
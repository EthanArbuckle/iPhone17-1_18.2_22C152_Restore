@interface BLSBacklightSceneUpdateContext
- (BLSAlwaysOnFrameSpecifier)frameSpecifier;
- (BLSBacklightChangeEvent)triggerEvent;
- (BLSBacklightSceneUpdateContext)initWithVisualState:(id)a3 previousVisualState:(id)a4 frameSpecifier:(id)a5 animated:(BOOL)a6 triggerEvent:(id)a7 touchTargetable:(BOOL)a8;
- (BLSBacklightSceneVisualState)previousVisualState;
- (BLSBacklightSceneVisualState)visualState;
- (BOOL)isAnimated;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTouchTargetable;
- (id)description;
- (unint64_t)hash;
@end

@implementation BLSBacklightSceneUpdateContext

- (BLSBacklightSceneUpdateContext)initWithVisualState:(id)a3 previousVisualState:(id)a4 frameSpecifier:(id)a5 animated:(BOOL)a6 triggerEvent:(id)a7 touchTargetable:(BOOL)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  v22.receiver = self;
  v22.super_class = (Class)BLSBacklightSceneUpdateContext;
  v18 = [(BLSBacklightSceneUpdateContext *)&v22 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_visualState, a3);
    objc_storeStrong((id *)&v19->_previousVisualState, a4);
    objc_storeStrong((id *)&v19->_frameSpecifier, a5);
    v19->_animated = a6;
    objc_storeStrong((id *)&v19->_triggerEvent, a7);
    v19->_touchTargetable = a8;
  }

  return v19;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_visualState withName:@"new"];
  id v5 = (id)[v3 appendObject:self->_previousVisualState withName:@"previous"];
  id v6 = (id)[v3 appendObject:self->_frameSpecifier withName:@"specifier" skipIfNil:1];
  id v7 = (id)[v3 appendBool:self->_animated withName:@"animated"];
  id v8 = (id)[v3 appendBool:self->_touchTargetable withName:@"touchTarget"];
  id v9 = (id)[v3 appendObject:self->_triggerEvent withName:@"trigger" skipIfNil:1];
  v10 = [v3 build];

  return v10;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendObject:self->_visualState];
  id v5 = (id)[v3 appendObject:self->_previousVisualState];
  id v6 = (id)[v3 appendObject:self->_frameSpecifier];
  id v7 = (id)[v3 appendBool:self->_animated];
  id v8 = (id)[v3 appendBool:self->_touchTargetable];
  unint64_t v9 = [v3 hash];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  visualState = self->_visualState;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __42__BLSBacklightSceneUpdateContext_isEqual___block_invoke;
  v30[3] = &unk_1E61073D8;
  id v7 = v4;
  id v31 = v7;
  id v8 = (id)[v5 appendObject:visualState counterpart:v30];
  previousVisualState = self->_previousVisualState;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __42__BLSBacklightSceneUpdateContext_isEqual___block_invoke_2;
  v28[3] = &unk_1E61073D8;
  id v10 = v7;
  id v29 = v10;
  id v11 = (id)[v5 appendObject:previousVisualState counterpart:v28];
  frameSpecifier = self->_frameSpecifier;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __42__BLSBacklightSceneUpdateContext_isEqual___block_invoke_3;
  v26[3] = &unk_1E61073D8;
  id v13 = v10;
  id v27 = v13;
  id v14 = (id)[v5 appendObject:frameSpecifier counterpart:v26];
  BOOL animated = self->_animated;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __42__BLSBacklightSceneUpdateContext_isEqual___block_invoke_4;
  v24[3] = &unk_1E6107880;
  id v16 = v13;
  id v25 = v16;
  id v17 = (id)[v5 appendBool:animated counterpart:v24];
  uint64_t touchTargetable = self->_touchTargetable;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __42__BLSBacklightSceneUpdateContext_isEqual___block_invoke_5;
  v22[3] = &unk_1E6107880;
  id v23 = v16;
  id v19 = v16;
  id v20 = (id)[v5 appendBool:touchTargetable counterpart:v22];
  LOBYTE(touchTargetable) = [v5 isEqual];

  return touchTargetable;
}

uint64_t __42__BLSBacklightSceneUpdateContext_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) visualState];
}

uint64_t __42__BLSBacklightSceneUpdateContext_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) previousVisualState];
}

uint64_t __42__BLSBacklightSceneUpdateContext_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) frameSpecifier];
}

uint64_t __42__BLSBacklightSceneUpdateContext_isEqual___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) isAnimated];
}

uint64_t __42__BLSBacklightSceneUpdateContext_isEqual___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) isTouchTargetable];
}

- (BLSBacklightSceneVisualState)visualState
{
  return self->_visualState;
}

- (BLSBacklightSceneVisualState)previousVisualState
{
  return self->_previousVisualState;
}

- (BLSAlwaysOnFrameSpecifier)frameSpecifier
{
  return self->_frameSpecifier;
}

- (BOOL)isAnimated
{
  return self->_animated;
}

- (BLSBacklightChangeEvent)triggerEvent
{
  return self->_triggerEvent;
}

- (BOOL)isTouchTargetable
{
  return self->_touchTargetable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerEvent, 0);
  objc_storeStrong((id *)&self->_frameSpecifier, 0);
  objc_storeStrong((id *)&self->_previousVisualState, 0);

  objc_storeStrong((id *)&self->_visualState, 0);
}

@end
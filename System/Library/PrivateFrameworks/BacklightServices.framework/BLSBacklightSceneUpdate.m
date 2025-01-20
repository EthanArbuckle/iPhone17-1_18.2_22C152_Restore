@interface BLSBacklightSceneUpdate
- (BLSBacklightSceneEnvironment_Private)environment;
- (BLSBacklightSceneUpdateContext)context;
- (BOOL)areSceneContentsUpdated;
- (BOOL)didStartBacklightRamp;
- (BOOL)isAnimationComplete;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUpdateToDateSpecifier;
- (id)debugDescription;
- (id)description;
- (id)initForEnvironment:(id)a3 visualState:(id)a4 previousVisualState:(id)a5 frameSpecifier:(id)a6 animated:(BOOL)a7 triggerEvent:(id)a8 touchTargetable:(BOOL)a9 isUpdateToDateSpecifier:(BOOL)a10 sceneContentsUpdated:(id)a11 performBacklightRamp:(id)a12 sceneContentsAnimationComplete:(id)a13;
- (unint64_t)hash;
- (void)performBacklightRampWithDuration:(double)a3;
- (void)sceneContentsAnimationDidComplete;
- (void)sceneContentsDidUpdate;
- (void)setReplacedSceneUpdate:(id)a3;
@end

@implementation BLSBacklightSceneUpdate

- (id)initForEnvironment:(id)a3 visualState:(id)a4 previousVisualState:(id)a5 frameSpecifier:(id)a6 animated:(BOOL)a7 triggerEvent:(id)a8 touchTargetable:(BOOL)a9 isUpdateToDateSpecifier:(BOOL)a10 sceneContentsUpdated:(id)a11 performBacklightRamp:(id)a12 sceneContentsAnimationComplete:(id)a13
{
  BOOL v14 = a7;
  id obj = a3;
  id v36 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a8;
  id v22 = a11;
  id v23 = a12;
  id v24 = a13;
  v38.receiver = self;
  v38.super_class = (Class)BLSBacklightSceneUpdate;
  v25 = [(BLSBacklightSceneUpdate *)&v38 init];
  v26 = v25;
  if (v25)
  {
    v25->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v25->_environment, obj);
    v27 = [[BLSBacklightSceneUpdateContext alloc] initWithVisualState:v36 previousVisualState:v19 frameSpecifier:v20 animated:v14 triggerEvent:v21 touchTargetable:a9];
    context = v26->_context;
    v26->_context = v27;

    v26->_isUpdateToDateSpecifier = a10;
    uint64_t v29 = MEMORY[0x1BA99C630](v22);
    id sceneContentsUpdatedBlock = v26->_sceneContentsUpdatedBlock;
    v26->_id sceneContentsUpdatedBlock = (id)v29;

    uint64_t v31 = MEMORY[0x1BA99C630](v23);
    id performBacklightRampBlock = v26->_performBacklightRampBlock;
    v26->_id performBacklightRampBlock = (id)v31;

    uint64_t v33 = MEMORY[0x1BA99C630](v24);
    id sceneContentsAnimationCompleteBlock = v26->_sceneContentsAnimationCompleteBlock;
    v26->_id sceneContentsAnimationCompleteBlock = (id)v33;
  }
  return v26;
}

- (id)description
{
  v3 = objc_opt_new();
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  v9 = __38__BLSBacklightSceneUpdate_description__block_invoke;
  v10 = &unk_1E6106FA8;
  v11 = self;
  id v12 = v3;
  id v4 = v3;
  [v4 appendProem:0 block:&v7];
  v5 = objc_msgSend(v4, "description", v7, v8, v9, v10, v11);

  return v5;
}

void __38__BLSBacklightSceneUpdate_description__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  id v2 = (id)[*(id *)(a1 + 40) appendUInt64:*(void *)(a1 + 32) withName:0 format:1];
  v3 = *(void **)(a1 + 40);
  id v4 = [WeakRetained identifier];
  id v5 = (id)[v3 appendUInt64:WeakRetained withName:v4];

  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(a1 + 40);
  if (*(unsigned char *)(v6 + 39))
  {
    uint64_t v8 = @"flipbook";
  }
  else if ([*(id *)(v6 + 40) isAnimated])
  {
    uint64_t v8 = @"animated";
  }
  else
  {
    uint64_t v8 = @"snap";
  }
  id v9 = (id)[v7 appendObject:v8 withName:0];
  v10 = *(void **)(a1 + 40);
  v11 = [*(id *)(*(void *)(a1 + 32) + 40) previousVisualState];
  id v12 = objc_msgSend(v11, "bls_shortLoggingString");
  id v13 = (id)[v10 appendObject:v12 withName:0];

  BOOL v14 = *(void **)(a1 + 40);
  v15 = [*(id *)(*(void *)(a1 + 32) + 40) visualState];
  v16 = objc_msgSend(v15, "bls_shortLoggingString");
  id v17 = (id)[v14 appendObject:v16 withName:@"->"];

  v18 = [*(id *)(*(void *)(a1 + 32) + 40) triggerEvent];
  id v19 = v18;
  if (v18)
  {
    id v20 = *(void **)(a1 + 40);
    id v21 = objc_msgSend(v18, "bls_shortLoggingString");
    id v22 = (id)[v20 appendObject:v21 withName:0];
  }
}

- (id)debugDescription
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  id v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v5 = [(BLSBacklightSceneUpdateContext *)self->_context visualState];
  id v6 = (id)[v4 appendObject:v5 withName:@"new"];

  uint64_t v7 = [(BLSBacklightSceneUpdateContext *)self->_context previousVisualState];
  id v8 = (id)[v4 appendObject:v7 withName:@"previous"];

  id v9 = [(BLSBacklightSceneUpdateContext *)self->_context frameSpecifier];
  id v10 = (id)[v4 appendObject:v9 withName:@"specifier" skipIfNil:1];

  id v11 = (id)objc_msgSend(v4, "appendBool:withName:", -[BLSBacklightSceneUpdateContext isAnimated](self->_context, "isAnimated"), @"animated");
  id v12 = [(BLSBacklightSceneUpdateContext *)self->_context triggerEvent];
  id v13 = (id)[v4 appendObject:v12 withName:@"trigger" skipIfNil:1];

  id v14 = (id)[v4 appendBool:self->_isUpdateToDateSpecifier withName:@"isUpdateToDateSpecifier"];
  id v15 = (id)[v4 appendBool:self->_lock_sceneContentsUpdated withName:@"sceneContentsUpdated"];
  id v16 = (id)[v4 appendBool:self->_lock_didStartBacklightRamp withName:@"didStartBacklightRamp"];
  id v17 = (id)[v4 appendBool:self->_lock_animationComplete withName:@"animationComplete"];
  id v18 = (id)[v4 appendBool:self->_performBacklightRampBlock != 0 withName:@"backlightRampNonNil" ifEqualTo:1];
  id v19 = (id)[v4 appendBool:self->_sceneContentsAnimationCompleteBlock != 0 withName:@"animationCompletionNonNil" ifEqualTo:1];
  os_unfair_lock_unlock(p_lock);
  id v20 = [v4 build];

  return v20;
}

- (unint64_t)hash
{
  return [(BLSBacklightSceneUpdateContext *)self->_context hash];
}

- (BOOL)isEqual:(id)a3
{
  return [(BLSBacklightSceneUpdateContext *)self->_context isEqual:a3];
}

- (void)setReplacedSceneUpdate:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (([v4 areSceneContentsUpdated] & 1) == 0)
  {
    id v5 = (void *)MEMORY[0x1BA99C630](self->_sceneContentsUpdatedBlock);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __50__BLSBacklightSceneUpdate_setReplacedSceneUpdate___block_invoke;
    v25[3] = &unk_1E6107250;
    id v26 = v4;
    id v27 = v5;
    id v6 = v5;
    uint64_t v7 = (void *)MEMORY[0x1BA99C630](v25);
    id sceneContentsUpdatedBlock = self->_sceneContentsUpdatedBlock;
    self->_id sceneContentsUpdatedBlock = v7;
  }
  if (([v4 didStartBacklightRamp] & 1) == 0)
  {
    id v9 = (void *)MEMORY[0x1BA99C630](self->_performBacklightRampBlock);
    BOOL v10 = [(BLSBacklightSceneUpdateContext *)self->_context isAnimated];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __50__BLSBacklightSceneUpdate_setReplacedSceneUpdate___block_invoke_2;
    v21[3] = &unk_1E6107428;
    BOOL v24 = v10;
    id v22 = v4;
    id v23 = v9;
    id v11 = v9;
    id v12 = (void *)MEMORY[0x1BA99C630](v21);
    id performBacklightRampBlock = self->_performBacklightRampBlock;
    self->_id performBacklightRampBlock = v12;
  }
  if (([v4 isAnimationComplete] & 1) == 0)
  {
    id v14 = (void *)MEMORY[0x1BA99C630](self->_sceneContentsAnimationCompleteBlock);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __50__BLSBacklightSceneUpdate_setReplacedSceneUpdate___block_invoke_3;
    v18[3] = &unk_1E6107250;
    id v19 = v4;
    id v20 = v14;
    id v15 = v14;
    id v16 = (void *)MEMORY[0x1BA99C630](v18);
    id sceneContentsAnimationCompleteBlock = self->_sceneContentsAnimationCompleteBlock;
    self->_id sceneContentsAnimationCompleteBlock = v16;
  }
  os_unfair_lock_unlock(&self->_lock);
}

uint64_t __50__BLSBacklightSceneUpdate_setReplacedSceneUpdate___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) sceneContentsDidUpdate];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

uint64_t __50__BLSBacklightSceneUpdate_setReplacedSceneUpdate___block_invoke_2(uint64_t a1, double a2)
{
  id v4 = *(void **)(a1 + 32);
  double v5 = 0.5;
  if (!*(unsigned char *)(a1 + 48)) {
    double v5 = 0.0;
  }
  [v4 performBacklightRampWithDuration:v5];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v8 = *(uint64_t (**)(__n128))(result + 16);
    v6.n128_f64[0] = a2;
    return v8(v6);
  }
  return result;
}

uint64_t __50__BLSBacklightSceneUpdate_setReplacedSceneUpdate___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) sceneContentsAnimationDidComplete];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (BOOL)areSceneContentsUpdated
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_sceneContentsUpdated;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)sceneContentsDidUpdate
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_2();
  _os_log_error_impl(&dword_1B55DE000, v0, OS_LOG_TYPE_ERROR, "%p sceneContentsDidUpdate should only be called once for update:%@", v1, 0x16u);
}

- (BOOL)didStartBacklightRamp
{
  uint64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_didStartBacklightRamp;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)performBacklightRampWithDuration:(double)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL lock_didStartBacklightRamp = self->_lock_didStartBacklightRamp;
  self->_BOOL lock_didStartBacklightRamp = 1;
  uint64_t v7 = (void (**)(void, double))MEMORY[0x1BA99C630](self->_performBacklightRampBlock);
  id performBacklightRampBlock = self->_performBacklightRampBlock;
  self->_id performBacklightRampBlock = 0;

  os_unfair_lock_unlock(p_lock);
  if (lock_didStartBacklightRamp)
  {
    id v9 = bls_scenes_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[BLSBacklightSceneUpdate performBacklightRampWithDuration:]();
    }
LABEL_4:

    goto LABEL_9;
  }
  id v9 = bls_scenes_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  if (!v7)
  {
    if (v10) {
      -[BLSBacklightSceneUpdate performBacklightRampWithDuration:]();
    }
    goto LABEL_4;
  }
  if (v10) {
    -[BLSBacklightSceneUpdate performBacklightRampWithDuration:]();
  }

  v7[2](v7, a3);
LABEL_9:
}

- (BOOL)isAnimationComplete
{
  uint64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_animationComplete;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)sceneContentsAnimationDidComplete
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B55DE000, a2, OS_LOG_TYPE_ERROR, "sceneContentsAnimationDidComplete should only be called once for update:%@", (uint8_t *)&v2, 0xCu);
}

- (BLSBacklightSceneUpdateContext)context
{
  return self->_context;
}

- (BOOL)isUpdateToDateSpecifier
{
  return self->_isUpdateToDateSpecifier;
}

- (BLSBacklightSceneEnvironment_Private)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);

  return (BLSBacklightSceneEnvironment_Private *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_environment);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong(&self->_sceneContentsAnimationCompleteBlock, 0);
  objc_storeStrong(&self->_performBacklightRampBlock, 0);

  objc_storeStrong(&self->_sceneContentsUpdatedBlock, 0);
}

- (void)performBacklightRampWithDuration:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_2();
  _os_log_debug_impl(&dword_1B55DE000, v0, OS_LOG_TYPE_DEBUG, "%p ignoring performBacklightRampWithDuration:%lf for update:%@", v1, 0x20u);
}

- (void)performBacklightRampWithDuration:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_2();
  _os_log_debug_impl(&dword_1B55DE000, v0, OS_LOG_TYPE_DEBUG, "%p performBacklightRampWithDuration:%lf for update:%@", v1, 0x20u);
}

- (void)performBacklightRampWithDuration:.cold.3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_2();
  _os_log_error_impl(&dword_1B55DE000, v0, OS_LOG_TYPE_ERROR, "%p performBacklightRampWithDuration should only be called once for update:%@", v1, 0x16u);
}

@end
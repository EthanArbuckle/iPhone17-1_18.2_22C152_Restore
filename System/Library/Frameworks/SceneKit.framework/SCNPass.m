@interface SCNPass
- (SCNPass)initWithFXPass:(__C3DFXPass *)a3 technique:(id)a4;
- (id)executionHandler;
- (id)initializationHandler;
- (id)valueForPassPropertyKey:(int64_t)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setExecutionHandler:(id)a3;
- (void)setInitializationHandler:(id)a3;
- (void)setValue:(id)a3 forPassPropertyKey:(int64_t)a4;
@end

@implementation SCNPass

- (SCNPass)initWithFXPass:(__C3DFXPass *)a3 technique:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SCNPass;
  v6 = [(SCNPass *)&v8 init];
  if (v6)
  {
    v6->_fxPass = (__C3DFXPass *)CFRetain(a3);
    v6->_technique = (SCNTechnique *)a4;
  }
  return v6;
}

- (void)dealloc
{
  CFRelease(self->_fxPass);
  v3.receiver = self;
  v3.super_class = (Class)SCNPass;
  [(SCNPass *)&v3 dealloc];
}

- (void)invalidate
{
  self->_technique = 0;
}

- (void)setInitializationHandler:(id)a3
{
  C3DFXPassSetInitializeBlock((uint64_t)self->_fxPass, a3);
  fxPass = self->_fxPass;

  C3DFXPassSetInitializeCallback((uint64_t)fxPass, (uint64_t)SCNPassInitialize);
}

- (id)initializationHandler
{
  return (id)C3DFXPassGetInitializeBlock((uint64_t)self->_fxPass);
}

- (void)setExecutionHandler:(id)a3
{
  C3DFXPassSetExecuteBlock((uint64_t)self->_fxPass, a3);
  fxPass = self->_fxPass;

  C3DFloorSetReflectionCategoryBitMask((uint64_t)fxPass, (uint64_t)SCNPassExecute);
}

- (id)executionHandler
{
  return (id)C3DFXPassGetExecuteBlock((uint64_t)self->_fxPass);
}

- (void)setValue:(id)a3 forPassPropertyKey:(int64_t)a4
{
  v7 = [(SCNTechnique *)self->_technique sceneRef];
  technique = self->_technique;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __39__SCNPass_setValue_forPassPropertyKey___block_invoke;
  v9[3] = &unk_264004E20;
  v9[5] = self;
  v9[6] = a4;
  v9[4] = a3;
  +[SCNTransaction postCommandWithContext:v7 object:technique applyBlock:v9];
}

void __39__SCNPass_setValue_forPassPropertyKey___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if ((unint64_t)(v2 - 1) >= 5)
  {
    if (v2 == 6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 200) = [*(id *)(a1 + 32) unsignedLongValue];
      }
    }
    else
    {
      if (v2 != 7) {
        return;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 208) = [*(id *)(a1 + 32) unsignedLongValue];
      }
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v3 = *(void *)(a1 + 48);
      [*(id *)(a1 + 32) floatValue];
      *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + (((v3 << 32) - 0x100000000) >> 30) + 392) = v4;
    }
  }
  uint64_t SharedInstance = C3DNotificationCenterGetSharedInstance();
  v6 = (const void *)[*(id *)(*(void *)(a1 + 40) + 16) sceneRef];

  C3DNotificationCenterPostNotification(SharedInstance, @"kC3DNotificationEngineContextInvalidatePasses", v6, 0, 1u);
}

- (id)valueForPassPropertyKey:(int64_t)a3
{
  +[SCNTransaction lock];
  if ((unint64_t)(a3 - 1) >= 5)
  {
    if (a3 == 6)
    {
      v7 = NSNumber;
      var3 = self->_fxPass->var49.var3;
    }
    else
    {
      if (a3 != 7)
      {
        v9 = 0;
        goto LABEL_9;
      }
      v7 = NSNumber;
      var3 = self->_fxPass->var49.var4;
    }
    uint64_t v6 = [v7 numberWithUnsignedLong:var3];
  }
  else
  {
    LODWORD(v5) = *(&self->_fxPass->var54 + (a3 - 1));
    uint64_t v6 = [NSNumber numberWithFloat:v5];
  }
  v9 = (void *)v6;
LABEL_9:
  +[SCNTransaction unlock];
  return v9;
}

@end
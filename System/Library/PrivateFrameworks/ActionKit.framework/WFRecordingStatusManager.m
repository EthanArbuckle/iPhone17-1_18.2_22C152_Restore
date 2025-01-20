@interface WFRecordingStatusManager
+ (id)sharedManager;
- (BOOL)isRecording;
- (SBSStatusBarStyleOverridesAssertion)assertion;
- (void)acquireAssertion;
- (void)invalidateAssertion;
- (void)setAssertion:(id)a3;
- (void)setRecording:(BOOL)a3;
@end

@implementation WFRecordingStatusManager

- (void).cxx_destruct
{
}

- (void)setAssertion:(id)a3
{
}

- (SBSStatusBarStyleOverridesAssertion)assertion
{
  return self->_assertion;
}

- (void)invalidateAssertion
{
  assertion = self->_assertion;
  if (assertion)
  {
    [(SBSStatusBarStyleOverridesAssertion *)assertion invalidate];
    v4 = self->_assertion;
    self->_assertion = 0;
  }
}

- (void)acquireAssertion
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2050000000;
  v3 = (void *)getSBSStatusBarStyleOverridesAssertionClass_softClass;
  uint64_t v14 = getSBSStatusBarStyleOverridesAssertionClass_softClass;
  if (!getSBSStatusBarStyleOverridesAssertionClass_softClass)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __getSBSStatusBarStyleOverridesAssertionClass_block_invoke;
    v10[3] = &unk_264E5EC88;
    v10[4] = &v11;
    __getSBSStatusBarStyleOverridesAssertionClass_block_invoke((uint64_t)v10);
    v3 = (void *)v12[3];
  }
  v4 = v3;
  _Block_object_dispose(&v11, 8);
  v5 = (SBSStatusBarStyleOverridesAssertion *)[[v4 alloc] initWithStatusBarStyleOverrides:4 forPID:getpid() exclusive:1 showsWhenForeground:0];
  assertion = self->_assertion;
  self->_assertion = v5;

  v7 = self->_assertion;
  v8[4] = self;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __44__WFRecordingStatusManager_acquireAssertion__block_invoke;
  v9[3] = &unk_264E57710;
  v9[4] = self;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __44__WFRecordingStatusManager_acquireAssertion__block_invoke_2;
  v8[3] = &unk_264E5EE70;
  [(SBSStatusBarStyleOverridesAssertion *)v7 acquireWithHandler:v9 invalidationHandler:v8];
}

uint64_t __44__WFRecordingStatusManager_acquireAssertion__block_invoke(uint64_t result, char a2)
{
  if ((a2 & 1) == 0) {
    return [*(id *)(result + 32) invalidateAssertion];
  }
  return result;
}

uint64_t __44__WFRecordingStatusManager_acquireAssertion__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidateAssertion];
}

- (BOOL)isRecording
{
  return self->_assertion != 0;
}

- (void)setRecording:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(WFRecordingStatusManager *)self isRecording];
  if (!v5 || v3)
  {
    if (!v5 && v3)
    {
      [(WFRecordingStatusManager *)self acquireAssertion];
    }
  }
  else
  {
    [(WFRecordingStatusManager *)self invalidateAssertion];
  }
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_1314);
  }
  v2 = (void *)sharedManager_sharedManager;
  return v2;
}

void __41__WFRecordingStatusManager_sharedManager__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedManager_sharedManager;
  sharedManager_sharedManager = v0;
}

@end
@interface MPCVocalAttenuationPolicyController
- (MPCVocalAttenuationPolicyController)initWithDelegate:(id)a3 parameters:(id)a4;
- (MPCVocalAttenuationPolicyControllerDelegate)delegate;
- (NSMutableArray)blockingPolicies;
- (NSMutableArray)policies;
- (OS_dispatch_queue)accessQueue;
- (id)blockingEvaluation;
- (void)_notifyDelegate;
- (void)_setupPoliciesWithParameters:(id)a3;
- (void)resetPolicies;
- (void)setAccessQueue:(id)a3;
- (void)setBlockingPolicies:(id)a3;
- (void)setPolicies:(id)a3;
- (void)vocalAttenuationPolicy:(id)a3 didChangeEvaluation:(id)a4;
@end

@implementation MPCVocalAttenuationPolicyController

uint64_t __67__MPCVocalAttenuationPolicyController_initWithDelegate_parameters___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setupPoliciesWithParameters:*(void *)(a1 + 40)];
}

- (MPCVocalAttenuationPolicyController)initWithDelegate:(id)a3 parameters:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)MPCVocalAttenuationPolicyController;
  v8 = [(MPCVocalAttenuationPolicyController *)&v21 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    uint64_t v10 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:3];
    policies = v9->_policies;
    v9->_policies = (NSMutableArray *)v10;

    uint64_t v12 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:3];
    blockingPolicies = v9->_blockingPolicies;
    v9->_blockingPolicies = (NSMutableArray *)v12;

    dispatch_queue_t v14 = dispatch_queue_create("com.apple.MediaPlaybackCore.VAPoliciesQueue", 0);
    accessQueue = v9->_accessQueue;
    v9->_accessQueue = (OS_dispatch_queue *)v14;

    v16 = v9->_accessQueue;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __67__MPCVocalAttenuationPolicyController_initWithDelegate_parameters___block_invoke;
    v18[3] = &unk_2643C5EE8;
    v19 = v9;
    id v20 = v7;
    dispatch_async(v16, v18);
  }
  return v9;
}

- (void)_setupPoliciesWithParameters:(id)a3
{
  accessQueue = self->_accessQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(accessQueue);
  policies = self->_policies;
  id v7 = [MPCVocalAttenuationThermalPressurePolicy alloc];
  v8 = [v5 thermalMonitor];
  v9 = [(MPCVocalAttenuationThermalPressurePolicy *)v7 initWithThermalMonitor:v8 calloutQueue:self->_accessQueue delegate:self];
  [(NSMutableArray *)policies addObject:v9];

  uint64_t v10 = self->_policies;
  v11 = [MPCVocalAttenuationLowPowerModePolicy alloc];
  id v13 = [v5 lowPowerModeMonitor];

  uint64_t v12 = [(MPCVocalAttenuationLowPowerModePolicy *)v11 initWithPowerModeMonitor:v13 calloutQueue:self->_accessQueue delegate:self];
  [(NSMutableArray *)v10 addObject:v12];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_blockingPolicies, 0);
  objc_storeStrong((id *)&self->_policies, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setAccessQueue:(id)a3
{
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setBlockingPolicies:(id)a3
{
}

- (NSMutableArray)blockingPolicies
{
  return self->_blockingPolicies;
}

- (void)setPolicies:(id)a3
{
}

- (NSMutableArray)policies
{
  return self->_policies;
}

- (MPCVocalAttenuationPolicyControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MPCVocalAttenuationPolicyControllerDelegate *)WeakRetained;
}

- (void)vocalAttenuationPolicy:(id)a3 didChangeEvaluation:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  id v6 = [(MPCVocalAttenuationPolicyController *)self blockingPolicies];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __82__MPCVocalAttenuationPolicyController_vocalAttenuationPolicy_didChangeEvaluation___block_invoke;
  v12[3] = &unk_2643C0CC0;
  id v7 = v5;
  id v13 = v7;
  uint64_t v8 = [v6 indexOfObjectPassingTest:v12];

  if (v8 == 0x7FFFFFFFFFFFFFFFLL
    || ([(MPCVocalAttenuationPolicyController *)self blockingPolicies],
        v9 = objc_claimAutoreleasedReturnValue(),
        [v9 objectAtIndexedSubscript:v8],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        v9,
        !v10))
  {
    if (![v7 shouldDisableVocalAttenuation])
    {
      uint64_t v10 = 0;
      goto LABEL_10;
    }
    v11 = [(MPCVocalAttenuationPolicyController *)self blockingPolicies];
    [v11 addObject:v7];
    uint64_t v10 = 0;
    goto LABEL_8;
  }
  if ([v10 shouldDisableVocalAttenuation]
    && ([v7 shouldDisableVocalAttenuation] & 1) == 0)
  {
    v11 = [(MPCVocalAttenuationPolicyController *)self blockingPolicies];
    [v11 removeObject:v10];
LABEL_8:

    [(MPCVocalAttenuationPolicyController *)self _notifyDelegate];
  }
LABEL_10:
}

BOOL __82__MPCVocalAttenuationPolicyController_vocalAttenuationPolicy_didChangeEvaluation___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [a2 policyType];
  uint64_t v7 = [*(id *)(a1 + 32) policyType];
  if (v6 == v7) {
    *a4 = 1;
  }
  return v6 == v7;
}

- (void)_notifyDelegate
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__MPCVocalAttenuationPolicyController__notifyDelegate__block_invoke;
  block[3] = &unk_2643C5FC8;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __54__MPCVocalAttenuationPolicyController__notifyDelegate__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 vocalAttenuationPolicyControllerDidChange:*(void *)(a1 + 32)];
}

- (id)blockingEvaluation
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__10132;
  uint64_t v10 = __Block_byref_object_dispose__10133;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __57__MPCVocalAttenuationPolicyController_blockingEvaluation__block_invoke;
  v5[3] = &unk_2643C67A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __57__MPCVocalAttenuationPolicyController_blockingEvaluation__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) blockingPolicies];
  uint64_t v2 = [v5 firstObject];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)resetPolicies
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__MPCVocalAttenuationPolicyController_resetPolicies__block_invoke;
  block[3] = &unk_2643C5FC8;
  block[4] = self;
  dispatch_sync(accessQueue, block);
}

void __52__MPCVocalAttenuationPolicyController_resetPolicies__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v1 = objc_msgSend(*(id *)(a1 + 32), "policies", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v8;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void **)(*((void *)&v7 + 1) + 8 * i);
        if ([v6 canBeReset]) {
          [v6 reset];
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

@end
@interface AARecoveryFactorController
- (void)availableRecoveryFactorsWithCompletion:(id)a3;
@end

@implementation AARecoveryFactorController

- (void)availableRecoveryFactorsWithCompletion:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(AACustodianController);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__AARecoveryFactorController_availableRecoveryFactorsWithCompletion___block_invoke;
  v6[3] = &unk_1E5A48588;
  id v7 = v3;
  id v5 = v3;
  [(AACustodianController *)v4 availableRecoveryFactorsWithCompletion:v6];
}

uint64_t __69__AARecoveryFactorController_availableRecoveryFactorsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

@end
@interface CNObservableContractEnforcementPreferences
+ (BOOL)primitiveShouldEnforceRxProtocols;
+ (BOOL)primitiveShouldSwizzleNilResults;
+ (BOOL)shouldEnforceRxProtocols;
+ (BOOL)shouldSwizzleNilResults;
@end

@implementation CNObservableContractEnforcementPreferences

+ (BOOL)shouldSwizzleNilResults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__CNObservableContractEnforcementPreferences_shouldSwizzleNilResults__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (shouldSwizzleNilResults_cn_once_token_17 != -1) {
    dispatch_once(&shouldSwizzleNilResults_cn_once_token_17, block);
  }
  return [(id)shouldSwizzleNilResults_cn_once_object_17 BOOLValue];
}

+ (BOOL)primitiveShouldSwizzleNilResults
{
  v2 = +[CNUserDefaults standardPreferences];
  char v3 = [v2 userHasOptedInToPreference:@"CNSwizzleNilResults"];

  return v3;
}

uint64_t __69__CNObservableContractEnforcementPreferences_shouldSwizzleNilResults__block_invoke(uint64_t a1)
{
  shouldSwizzleNilResults_cn_once_object_17 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "primitiveShouldSwizzleNilResults"));

  return MEMORY[0x1F41817F8]();
}

+ (BOOL)shouldEnforceRxProtocols
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__CNObservableContractEnforcementPreferences_shouldEnforceRxProtocols__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (shouldEnforceRxProtocols_cn_once_token_16 != -1) {
    dispatch_once(&shouldEnforceRxProtocols_cn_once_token_16, block);
  }
  return [(id)shouldEnforceRxProtocols_cn_once_object_16 BOOLValue];
}

uint64_t __70__CNObservableContractEnforcementPreferences_shouldEnforceRxProtocols__block_invoke(uint64_t a1)
{
  uint64_t v1 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "primitiveShouldEnforceRxProtocols"));
  uint64_t v2 = shouldEnforceRxProtocols_cn_once_object_16;
  shouldEnforceRxProtocols_cn_once_object_16 = v1;

  return MEMORY[0x1F41817F8](v1, v2);
}

+ (BOOL)primitiveShouldEnforceRxProtocols
{
  uint64_t v2 = +[CNUserDefaults standardPreferences];
  char v3 = [v2 userHasOptedInToPreference:@"CNThrowOnProtocolViolations"];

  return v3;
}

@end
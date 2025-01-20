@interface HUServiceDetailsLockPinCodesItem
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HUServiceDetailsLockPinCodesItem

- (id)_subclass_updateWithOptions:(id)a3
{
  objc_opt_class();
  v4 = [(HUServiceDetailsAbstractItem *)self sourceServiceItem];
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  v7 = [MEMORY[0x1E4F1CA60] dictionary];
  v8 = [v6 accessories];
  int v9 = objc_msgSend(v8, "na_any:", &__block_literal_global_200);

  v10 = [v6 accessories];

  int v11 = objc_msgSend(v10, "na_all:", &__block_literal_global_3_4);
  uint64_t v12 = 1;
  v13 = _HULocalizedStringWithDefaultValue(@"HUServiceDetailsLockPinCodesTitle", @"HUServiceDetailsLockPinCodesTitle", 1);
  [v7 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  [v7 setObject:@"Home.Lock.ServiceDetails.ManageAccess" forKeyedSubscript:*MEMORY[0x1E4F68928]];
  v14 = NSNumber;
  if (!v6)
  {
    int v9 = 0;
    goto LABEL_9;
  }
  if (!v9)
  {
LABEL_9:
    int v15 = 0;
    goto LABEL_10;
  }
  id v6 = [(HUServiceDetailsAbstractItem *)self home];
  if ([v6 hasOnboardedForAccessCode])
  {
    self = [(HUServiceDetailsAbstractItem *)self home];
    uint64_t v12 = [(HUServiceDetailsLockPinCodesItem *)self hf_currentUserIsAdministrator] ^ 1;
    int v9 = 1;
    int v15 = 1;
  }
  else
  {
    int v15 = 0;
    int v9 = 1;
  }
LABEL_10:
  v16 = [v14 numberWithInt:v12];
  [v7 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F68B10]];

  if (v15) {
  if (v9)
  }

  v17 = [NSNumber numberWithInt:v11 ^ 1u];
  [v7 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F68A08]];

  v18 = (void *)MEMORY[0x1E4F7A0D8];
  v19 = [MEMORY[0x1E4F69228] outcomeWithResults:v7];
  v20 = [v18 futureWithResult:v19];

  return v20;
}

uint64_t __64__HUServiceDetailsLockPinCodesItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  return [a2 supportsAccessCodes];
}

uint64_t __64__HUServiceDetailsLockPinCodesItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isReachable];
}

@end
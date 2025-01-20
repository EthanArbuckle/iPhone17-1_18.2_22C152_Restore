@interface HMRoom(HFDemoMode)
- (id)hf_demoModeAccessories;
@end

@implementation HMRoom(HFDemoMode)

- (id)hf_demoModeAccessories
{
  v2 = +[HFDemoModeAccessoryManager sharedManager];
  v3 = [v2 accessories];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__HMRoom_HFDemoMode__hf_demoModeAccessories__block_invoke;
  v6[3] = &unk_264097CD0;
  v6[4] = a1;
  v4 = objc_msgSend(v3, "na_filter:", v6);

  return v4;
}

@end
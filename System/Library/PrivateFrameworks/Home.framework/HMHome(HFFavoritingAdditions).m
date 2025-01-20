@interface HMHome(HFFavoritingAdditions)
- (uint64_t)hf_favoriteCameraCountExcludingHomeKitObjects:()HFFavoritingAdditions;
@end

@implementation HMHome(HFFavoritingAdditions)

- (uint64_t)hf_favoriteCameraCountExcludingHomeKitObjects:()HFFavoritingAdditions
{
  id v4 = a3;
  v5 = [a1 accessories];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __79__HMHome_HFFavoritingAdditions__hf_favoriteCameraCountExcludingHomeKitObjects___block_invoke;
  v10[3] = &unk_26408D968;
  id v11 = v4;
  id v6 = v4;
  v7 = objc_msgSend(v5, "na_filter:", v10);
  uint64_t v8 = [v7 count];

  return v8;
}

@end
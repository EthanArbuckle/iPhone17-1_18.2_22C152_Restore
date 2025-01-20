@interface HMAccessory
@end

@implementation HMAccessory

void __77__HMAccessory_HRERecommendableObjectProtocol___containedRecommendableObjects__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  v3 = *(void **)(a1 + 32);
  if ([v6 conformsToProtocol:&unk_26EABF440]) {
    v4 = v6;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;
  objc_msgSend(v3, "na_safeAddObject:", v5);
}

uint64_t __62__HMAccessory_HRERecommendableObjectProtocol__hre_actionTypes__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hre_actionTypes");
}

uint64_t __64__HMAccessory_HRERecommendableObjectProtocol__hre_matchingTypes__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hre_matchingTypes");
}

uint64_t __66__HMAccessory_HRERecommendableObjectProtocol__hre_characteristics__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hre_characteristics");
}

uint64_t __63__HMAccessory_HRERecommendableObjectProtocol__hre_isActionable__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hre_isActionable");
}

@end
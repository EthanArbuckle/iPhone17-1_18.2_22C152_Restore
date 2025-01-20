@interface HMMediaSystem
@end

@implementation HMMediaSystem

uint64_t __64__HMMediaSystem_HRERecommendableObjectProtocol__hre_actionTypes__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hre_actionTypes");
}

uint64_t __64__HMMediaSystem_HRERecommendableObjectProtocol__hre_primaryType__block_invoke_2()
{
  qword_268944B18 = NSStringFromProtocol((Protocol *)&unk_26EAC9D48);

  return MEMORY[0x270F9A758]();
}

id __66__HMMediaSystem_HRERecommendableObjectProtocol__hre_matchingTypes__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__HMMediaSystem_HRERecommendableObjectProtocol__hre_matchingTypes__block_invoke_2;
  block[3] = &unk_264CF3740;
  block[4] = *(void *)(a1 + 32);
  if (qword_268944B20 != -1) {
    dispatch_once(&qword_268944B20, block);
  }
  return (id)qword_268944B28;
}

void __66__HMMediaSystem_HRERecommendableObjectProtocol__hre_matchingTypes__block_invoke_2(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  v1 = (void *)MEMORY[0x263EFFA08];
  v2 = objc_msgSend(*(id *)(a1 + 32), "hre_primaryType");
  v6[0] = v2;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  uint64_t v4 = [v1 setWithArray:v3];
  v5 = (void *)qword_268944B28;
  qword_268944B28 = v4;
}

uint64_t __68__HMMediaSystem_HRERecommendableObjectProtocol__hre_characteristics__block_invoke_2()
{
  qword_268944B38 = [MEMORY[0x263EFFA08] setWithArray:MEMORY[0x263EFFA68]];

  return MEMORY[0x270F9A758]();
}

uint64_t __62__HMMediaSystem_HRERecommendableObjectProtocol__hre_isVisible__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 accessory];
  uint64_t v3 = objc_msgSend(v2, "hre_isVisible");

  return v3;
}

@end
@interface HMMediaProfile
@end

@implementation HMMediaProfile

uint64_t __65__HMMediaProfile_HRERecommendableObjectProtocol__hre_primaryType__block_invoke_2()
{
  qword_268944AE8 = NSStringFromProtocol((Protocol *)&unk_26EAC9D48);

  return MEMORY[0x270F9A758]();
}

id __67__HMMediaProfile_HRERecommendableObjectProtocol__hre_matchingTypes__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__HMMediaProfile_HRERecommendableObjectProtocol__hre_matchingTypes__block_invoke_2;
  block[3] = &unk_264CF3740;
  block[4] = *(void *)(a1 + 32);
  if (qword_268944AF0 != -1) {
    dispatch_once(&qword_268944AF0, block);
  }
  return (id)qword_268944AF8;
}

void __67__HMMediaProfile_HRERecommendableObjectProtocol__hre_matchingTypes__block_invoke_2(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  v1 = (void *)MEMORY[0x263EFFA08];
  v2 = objc_msgSend(*(id *)(a1 + 32), "hre_primaryType");
  v6[0] = v2;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  uint64_t v4 = [v1 setWithArray:v3];
  v5 = (void *)qword_268944AF8;
  qword_268944AF8 = v4;
}

uint64_t __69__HMMediaProfile_HRERecommendableObjectProtocol__hre_characteristics__block_invoke_2()
{
  qword_268944B08 = [MEMORY[0x263EFFA08] setWithArray:MEMORY[0x263EFFA68]];

  return MEMORY[0x270F9A758]();
}

@end
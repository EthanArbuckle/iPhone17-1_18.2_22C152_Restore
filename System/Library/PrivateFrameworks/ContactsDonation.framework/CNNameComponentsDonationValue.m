@interface CNNameComponentsDonationValue
@end

@implementation CNNameComponentsDonationValue

uint64_t __42___CNNameComponentsDonationValue_isEqual___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263F335D0];
  v3 = [*(id *)(a1 + 32) nameComponents];
  v4 = [*(id *)(a1 + 40) nameComponents];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __42___CNNameComponentsDonationValue_isEqual___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263F335D0];
  v3 = [*(id *)(a1 + 32) origin];
  v4 = [*(id *)(a1 + 40) origin];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __38___CNNameComponentsDonationValue_hash__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F335E8];
  v2 = [*(id *)(a1 + 32) nameComponents];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __38___CNNameComponentsDonationValue_hash__block_invoke_2(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F335E8];
  v2 = [*(id *)(a1 + 32) origin];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

@end
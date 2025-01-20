@interface CNPostalAddressDonationValue
@end

@implementation CNPostalAddressDonationValue

uint64_t __41___CNPostalAddressDonationValue_isEqual___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263F335D0];
  uint64_t v3 = [*(id *)(a1 + 32) style];
  uint64_t v4 = [*(id *)(a1 + 40) style];

  return [v2 isInteger:v3 equalToOther:v4];
}

uint64_t __41___CNPostalAddressDonationValue_isEqual___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263F335D0];
  uint64_t v3 = [*(id *)(a1 + 32) label];
  uint64_t v4 = [*(id *)(a1 + 40) label];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __41___CNPostalAddressDonationValue_isEqual___block_invoke_3(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263F335D0];
  uint64_t v3 = [*(id *)(a1 + 32) postalAddress];
  uint64_t v4 = [*(id *)(a1 + 40) postalAddress];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __41___CNPostalAddressDonationValue_isEqual___block_invoke_4(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263F335D0];
  uint64_t v3 = [*(id *)(a1 + 32) origin];
  uint64_t v4 = [*(id *)(a1 + 40) origin];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __37___CNPostalAddressDonationValue_hash__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F335E8];
  uint64_t v2 = [*(id *)(a1 + 32) style];

  return [v1 integerHash:v2];
}

uint64_t __37___CNPostalAddressDonationValue_hash__block_invoke_2(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F335E8];
  uint64_t v2 = [*(id *)(a1 + 32) postalAddress];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __37___CNPostalAddressDonationValue_hash__block_invoke_3(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F335E8];
  uint64_t v2 = [*(id *)(a1 + 32) label];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __37___CNPostalAddressDonationValue_hash__block_invoke_4(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F335E8];
  uint64_t v2 = [*(id *)(a1 + 32) origin];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

@end
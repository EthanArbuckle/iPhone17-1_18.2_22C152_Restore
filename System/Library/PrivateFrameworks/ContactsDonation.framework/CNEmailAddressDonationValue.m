@interface CNEmailAddressDonationValue
@end

@implementation CNEmailAddressDonationValue

uint64_t __40___CNEmailAddressDonationValue_isEqual___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263F335D0];
  v3 = [*(id *)(a1 + 32) emailAddress];
  v4 = [*(id *)(a1 + 40) emailAddress];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __40___CNEmailAddressDonationValue_isEqual___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263F335D0];
  v3 = [*(id *)(a1 + 32) label];
  v4 = [*(id *)(a1 + 40) label];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __40___CNEmailAddressDonationValue_isEqual___block_invoke_3(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263F335D0];
  v3 = [*(id *)(a1 + 32) origin];
  v4 = [*(id *)(a1 + 40) origin];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __36___CNEmailAddressDonationValue_hash__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F335E8];
  v2 = [*(id *)(a1 + 32) emailAddress];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __36___CNEmailAddressDonationValue_hash__block_invoke_2(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F335E8];
  v2 = [*(id *)(a1 + 32) label];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __36___CNEmailAddressDonationValue_hash__block_invoke_3(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F335E8];
  v2 = [*(id *)(a1 + 32) origin];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

@end
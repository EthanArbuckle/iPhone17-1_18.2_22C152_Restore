@interface CNImageDataDonationValue
@end

@implementation CNImageDataDonationValue

uint64_t __37___CNImageDataDonationValue_isEqual___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263F335D0];
  v3 = [*(id *)(a1 + 32) imageData];
  v4 = [*(id *)(a1 + 40) imageData];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __37___CNImageDataDonationValue_isEqual___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263F335D0];
  v3 = [*(id *)(a1 + 32) origin];
  v4 = [*(id *)(a1 + 40) origin];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __33___CNImageDataDonationValue_hash__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F335E8];
  v2 = [*(id *)(a1 + 32) imageData];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __33___CNImageDataDonationValue_hash__block_invoke_2(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F335E8];
  v2 = [*(id *)(a1 + 32) origin];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

@end
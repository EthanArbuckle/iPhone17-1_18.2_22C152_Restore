@interface CNUIUserActionUserActivityItem
@end

@implementation CNUIUserActionUserActivityItem

void __60___CNUIUserActionUserActivityItem_performActionWithContext___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) actionRecorder];
  [v2 recordUserAction:*(void *)(a1 + 40)];
}

uint64_t __43___CNUIUserActionUserActivityItem_isEqual___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x263F335D0];
  v3 = [*(id *)(a1 + 32) type];
  v4 = [*(id *)(a1 + 40) type];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __43___CNUIUserActionUserActivityItem_isEqual___block_invoke_2(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x263F335D0];
  v3 = [*(id *)(a1 + 32) label];
  v4 = [*(id *)(a1 + 40) label];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __43___CNUIUserActionUserActivityItem_isEqual___block_invoke_3(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x263F335D0];
  v3 = [*(id *)(a1 + 32) targetHandle];
  v4 = [*(id *)(a1 + 40) targetHandle];
  uint64_t v5 = [v2 isString:v3 localizedCaseInsensitiveEqualToOther:v4];

  return v5;
}

uint64_t __43___CNUIUserActionUserActivityItem_isEqual___block_invoke_4(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x263F335D0];
  v3 = [*(id *)(a1 + 32) bundleIdentifier];
  v4 = [*(id *)(a1 + 40) bundleIdentifier];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __43___CNUIUserActionUserActivityItem_isEqual___block_invoke_5(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3 = [v2 userActivity];
  v4 = [v3 interaction];
  uint64_t v5 = [v4 intent];
  v6 = [*(id *)(a1 + 40) userActivity];
  v7 = [v6 interaction];
  v8 = [v7 intent];
  uint64_t v9 = [v2 _isIntent:v5 equalToOther:v8];

  return v9;
}

uint64_t __39___CNUIUserActionUserActivityItem_hash__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F335E8];
  id v2 = [*(id *)(a1 + 32) type];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __39___CNUIUserActionUserActivityItem_hash__block_invoke_2(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F335E8];
  id v2 = [*(id *)(a1 + 32) label];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __39___CNUIUserActionUserActivityItem_hash__block_invoke_3(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F335E8];
  id v2 = [*(id *)(a1 + 32) targetHandle];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __39___CNUIUserActionUserActivityItem_hash__block_invoke_4(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F335E8];
  id v2 = [*(id *)(a1 + 32) bundleIdentifier];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __39___CNUIUserActionUserActivityItem_hash__block_invoke_5(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 userActivity];
  uint64_t v3 = [v2 interaction];
  v4 = [v3 intent];
  uint64_t v5 = [v1 _hashForIntent:v4];

  return v5;
}

uint64_t __58___CNUIUserActionUserActivityItem__isIntent_equalToOther___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x263F335D0];
  uint64_t v3 = [*(id *)(a1 + 32) personHandle];
  v4 = [v3 value];
  uint64_t v5 = [*(id *)(a1 + 40) personHandle];
  v6 = [v5 value];
  uint64_t v7 = [v2 isString:v4 localizedCaseInsensitiveEqualToOther:v6];

  return v7;
}

uint64_t __58___CNUIUserActionUserActivityItem__isIntent_equalToOther___block_invoke_2(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x263F335D0];
  uint64_t v3 = [*(id *)(a1 + 32) contactIdentifier];
  v4 = [*(id *)(a1 + 40) contactIdentifier];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __50___CNUIUserActionUserActivityItem__hashForIntent___block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F335E8];
  id v2 = [*(id *)(a1 + 32) personHandle];
  uint64_t v3 = [v2 value];
  uint64_t v4 = [v1 objectHash:v3];

  return v4;
}

uint64_t __50___CNUIUserActionUserActivityItem__hashForIntent___block_invoke_2(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F335E8];
  id v2 = [*(id *)(a1 + 32) contactIdentifier];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

@end
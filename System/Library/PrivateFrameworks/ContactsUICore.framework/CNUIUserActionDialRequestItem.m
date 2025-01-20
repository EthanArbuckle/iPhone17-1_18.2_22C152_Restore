@interface CNUIUserActionDialRequestItem
@end

@implementation CNUIUserActionDialRequestItem

void __59___CNUIUserActionDialRequestItem_performActionWithContext___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) actionRecorder];
  [v2 recordUserAction:*(void *)(a1 + 40)];
}

uint64_t __42___CNUIUserActionDialRequestItem_isEqual___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x263F335D0];
  v3 = [*(id *)(a1 + 32) type];
  v4 = [*(id *)(a1 + 40) type];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __42___CNUIUserActionDialRequestItem_isEqual___block_invoke_2(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x263F335D0];
  v3 = [*(id *)(a1 + 32) label];
  v4 = [*(id *)(a1 + 40) label];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __42___CNUIUserActionDialRequestItem_isEqual___block_invoke_3(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x263F335D0];
  v3 = [*(id *)(a1 + 32) targetHandle];
  v4 = [*(id *)(a1 + 40) targetHandle];
  uint64_t v5 = [v2 isString:v3 localizedCaseInsensitiveEqualToOther:v4];

  return v5;
}

uint64_t __42___CNUIUserActionDialRequestItem_isEqual___block_invoke_4(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x263F335D0];
  v3 = [*(id *)(a1 + 32) bundleIdentifier];
  v4 = [*(id *)(a1 + 40) bundleIdentifier];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __42___CNUIUserActionDialRequestItem_isEqual___block_invoke_5(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x263F335D0];
  v3 = [*(id *)(a1 + 32) dialRequest];
  v4 = [v3 handle];
  uint64_t v5 = [v4 value];
  v6 = [*(id *)(a1 + 40) dialRequest];
  v7 = [v6 handle];
  v8 = [v7 value];
  uint64_t v9 = [v2 isString:v5 localizedCaseInsensitiveEqualToOther:v8];

  return v9;
}

uint64_t __42___CNUIUserActionDialRequestItem_isEqual___block_invoke_6(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x263F335D0];
  v3 = [*(id *)(a1 + 32) dialRequest];
  v4 = [v3 handle];
  uint64_t v5 = [v4 type];
  v6 = [*(id *)(a1 + 40) dialRequest];
  v7 = [v6 handle];
  uint64_t v8 = objc_msgSend(v2, "isInteger:equalToOther:", v5, objc_msgSend(v7, "type"));

  return v8;
}

uint64_t __42___CNUIUserActionDialRequestItem_isEqual___block_invoke_7(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x263F335D0];
  v3 = [*(id *)(a1 + 32) dialRequest];
  v4 = [v3 contactIdentifier];
  uint64_t v5 = [*(id *)(a1 + 40) dialRequest];
  v6 = [v5 contactIdentifier];
  uint64_t v7 = [v2 isObject:v4 equalToOther:v6];

  return v7;
}

uint64_t __42___CNUIUserActionDialRequestItem_isEqual___block_invoke_8(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x263F335D0];
  v3 = [*(id *)(a1 + 32) dialRequest];
  uint64_t v4 = [v3 isVideo];
  uint64_t v5 = [*(id *)(a1 + 40) dialRequest];
  uint64_t v6 = objc_msgSend(v2, "isBool:equalToOther:", v4, objc_msgSend(v5, "isVideo"));

  return v6;
}

uint64_t __38___CNUIUserActionDialRequestItem_hash__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F335E8];
  id v2 = [*(id *)(a1 + 32) type];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __38___CNUIUserActionDialRequestItem_hash__block_invoke_2(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F335E8];
  id v2 = [*(id *)(a1 + 32) label];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __38___CNUIUserActionDialRequestItem_hash__block_invoke_3(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F335E8];
  id v2 = [*(id *)(a1 + 32) targetHandle];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __38___CNUIUserActionDialRequestItem_hash__block_invoke_4(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F335E8];
  id v2 = [*(id *)(a1 + 32) bundleIdentifier];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __38___CNUIUserActionDialRequestItem_hash__block_invoke_5(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F335E8];
  id v2 = [*(id *)(a1 + 32) dialRequest];
  uint64_t v3 = [v2 handle];
  uint64_t v4 = [v1 objectHash:v3];

  return v4;
}

uint64_t __38___CNUIUserActionDialRequestItem_hash__block_invoke_6(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F335E8];
  id v2 = [*(id *)(a1 + 32) dialRequest];
  uint64_t v3 = [v2 contactIdentifier];
  uint64_t v4 = [v1 objectHash:v3];

  return v4;
}

uint64_t __38___CNUIUserActionDialRequestItem_hash__block_invoke_7(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F335E8];
  id v2 = [*(id *)(a1 + 32) dialRequest];
  uint64_t v3 = objc_msgSend(v1, "BOOLHash:", objc_msgSend(v2, "isVideo"));

  return v3;
}

@end
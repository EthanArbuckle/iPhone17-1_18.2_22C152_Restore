@interface CNUIUserActionWalletPayTarget
@end

@implementation CNUIUserActionWalletPayTarget

id __90___CNUIUserActionWalletPayTarget_actionsForEmailAddresses_contact_discoveringEnvironment___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isSuggested])
  {
    v4 = (void *)MEMORY[0x263EFFA68];
  }
  else
  {
    v5 = [v3 value];
    v6 = [[CNHandle alloc] initWithStringValue:v5 type:3];
    v7 = objc_msgSend(NSURL, "_cnui_walletPayURLFutureWithHandle:", v6);
    v8 = (void *)MEMORY[0x263EFEA30];
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *MEMORY[0x263EFDF80];
    v11 = [v3 identifier];
    v12 = [v8 contactPropertyWithContactNoCopy:v9 propertyKey:v10 identifier:v11];

    uint64_t v13 = *MEMORY[0x263EFDF20];
    v14 = [*(id *)(a1 + 40) bundleIdentifier];
    v4 = +[CNUIUserActionItem itemWithType:v13 contactProperty:v12 bundleIdentifier:v14 url:v7 isSensitive:1 group:9 options:0];
  }
  return v4;
}

id __88___CNUIUserActionWalletPayTarget_actionsForPhoneNumbers_contact_discoveringEnvironment___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isSuggested])
  {
    v4 = (void *)MEMORY[0x263EFFA68];
  }
  else
  {
    v5 = [v3 value];
    v6 = [v5 stringValue];

    v7 = [[CNHandle alloc] initWithStringValue:v6 type:2];
    v8 = objc_msgSend(NSURL, "_cnui_walletPayURLFutureWithHandle:", v7);
    uint64_t v9 = (void *)MEMORY[0x263EFEA30];
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *MEMORY[0x263EFE070];
    v12 = [v3 identifier];
    uint64_t v13 = [v9 contactPropertyWithContactNoCopy:v10 propertyKey:v11 identifier:v12];

    uint64_t v14 = *MEMORY[0x263EFDF20];
    v15 = [*(id *)(a1 + 40) bundleIdentifier];
    v4 = +[CNUIUserActionItem itemWithType:v14 contactProperty:v13 bundleIdentifier:v15 url:v8 isSensitive:1 group:9 options:0];
  }
  return v4;
}

@end
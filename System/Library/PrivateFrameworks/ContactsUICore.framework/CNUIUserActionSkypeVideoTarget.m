@interface CNUIUserActionSkypeVideoTarget
@end

@implementation CNUIUserActionSkypeVideoTarget

id __91___CNUIUserActionSkypeVideoTarget_actionsForEmailAddresses_contact_discoveringEnvironment___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isSuggested])
  {
    v4 = (void *)MEMORY[0x263EFFA68];
  }
  else
  {
    v5 = [CNHandle alloc];
    v6 = [v3 value];
    v7 = [(CNHandle *)v5 initWithStringValue:v6 type:3];

    v8 = objc_msgSend(NSURL, "_cnui_skypeVideoURLFutureWithHandle:", v7);
    v9 = (void *)MEMORY[0x263EFEA30];
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *MEMORY[0x263EFDF80];
    v12 = [v3 identifier];
    v13 = [v9 contactPropertyWithContactNoCopy:v10 propertyKey:v11 identifier:v12];

    uint64_t v14 = *MEMORY[0x263EFDF38];
    v15 = [*(id *)(a1 + 40) bundleIdentifier];
    v4 = +[CNUIUserActionItem itemWithType:v14 contactProperty:v13 bundleIdentifier:v15 url:v8 group:4 options:0];
  }
  return v4;
}

id __89___CNUIUserActionSkypeVideoTarget_actionsForPhoneNumbers_contact_discoveringEnvironment___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isSuggested])
  {
    v4 = (void *)MEMORY[0x263EFFA68];
  }
  else
  {
    v5 = [CNHandle alloc];
    v6 = [v3 value];
    v7 = [v6 stringValue];
    v8 = [(CNHandle *)v5 initWithStringValue:v7 type:2];

    v9 = objc_msgSend(NSURL, "_cnui_skypeVideoURLFutureWithHandle:", v8);
    uint64_t v10 = (void *)MEMORY[0x263EFEA30];
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *MEMORY[0x263EFE070];
    v13 = [v3 identifier];
    uint64_t v14 = [v10 contactPropertyWithContactNoCopy:v11 propertyKey:v12 identifier:v13];

    uint64_t v15 = *MEMORY[0x263EFDF38];
    v16 = [*(id *)(a1 + 40) bundleIdentifier];
    v4 = +[CNUIUserActionItem itemWithType:v15 contactProperty:v14 bundleIdentifier:v16 url:v9 group:4 options:0];
  }
  return v4;
}

@end
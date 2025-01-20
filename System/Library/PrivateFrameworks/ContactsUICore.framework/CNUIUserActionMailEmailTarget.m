@interface CNUIUserActionMailEmailTarget
@end

@implementation CNUIUserActionMailEmailTarget

id __90___CNUIUserActionMailEmailTarget_actionsForEmailAddresses_contact_discoveringEnvironment___block_invoke(uint64_t a1, void *a2)
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
    v7 = objc_msgSend(NSURL, "_cnui_mailURLFutureWithHandle:contact:", v6, *(void *)(a1 + 32));
    v8 = (void *)MEMORY[0x263EFEA30];
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *MEMORY[0x263EFDF80];
    v11 = [v3 identifier];
    v12 = [v8 contactPropertyWithContactNoCopy:v9 propertyKey:v10 identifier:v11];

    uint64_t v13 = *MEMORY[0x263EFDF10];
    v14 = [*(id *)(a1 + 40) bundleIdentifier];
    v4 = +[CNUIUserActionItem itemWithType:v13 contactProperty:v12 bundleIdentifier:v14 url:v7 group:8 options:0];
  }
  return v4;
}

@end
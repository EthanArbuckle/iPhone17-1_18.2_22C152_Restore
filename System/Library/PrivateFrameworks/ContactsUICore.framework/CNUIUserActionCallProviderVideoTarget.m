@interface CNUIUserActionCallProviderVideoTarget
@end

@implementation CNUIUserActionCallProviderVideoTarget

id __98___CNUIUserActionCallProviderVideoTarget_actionsForEmailAddresses_contact_discoveringEnvironment___block_invoke(uint64_t a1, void *a2)
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
    v7 = [*(id *)(a1 + 32) callProvider];
    v8 = [v7 dialRequestForHandle:v6 contact:*(void *)(a1 + 40) video:1];

    v9 = [*(id *)(a1 + 32) callProvider];
    if ([v9 isEligibleDefaultApp]) {
      uint64_t v10 = 2;
    }
    else {
      uint64_t v10 = 6;
    }

    v11 = (void *)MEMORY[0x263EFEA30];
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v13 = *MEMORY[0x263EFDF80];
    v14 = [v3 identifier];
    v15 = [v11 contactPropertyWithContactNoCopy:v12 propertyKey:v13 identifier:v14];

    uint64_t v16 = *MEMORY[0x263EFDF38];
    v17 = [*(id *)(a1 + 32) bundleIdentifier];
    v4 = +[CNUIUserActionItem itemWithType:v16 contactProperty:v15 bundleIdentifier:v17 dialRequest:v8 group:v10 options:16];
  }
  return v4;
}

id __96___CNUIUserActionCallProviderVideoTarget_actionsForPhoneNumbers_contact_discoveringEnvironment___block_invoke(uint64_t a1, void *a2)
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

    uint64_t v7 = 2;
    v8 = [[CNHandle alloc] initWithStringValue:v6 type:2];
    v9 = [*(id *)(a1 + 32) callProvider];
    uint64_t v10 = [v9 dialRequestForHandle:v8 contact:*(void *)(a1 + 40) video:1];

    v11 = [*(id *)(a1 + 32) callProvider];
    if (![v11 isEligibleDefaultApp]) {
      uint64_t v7 = 6;
    }

    uint64_t v12 = (void *)MEMORY[0x263EFEA30];
    uint64_t v13 = *(void *)(a1 + 40);
    uint64_t v14 = *MEMORY[0x263EFE070];
    v15 = [v3 identifier];
    uint64_t v16 = [v12 contactPropertyWithContactNoCopy:v13 propertyKey:v14 identifier:v15];

    uint64_t v17 = *MEMORY[0x263EFDF38];
    v18 = [*(id *)(a1 + 32) bundleIdentifier];
    v4 = +[CNUIUserActionItem itemWithType:v17 contactProperty:v16 bundleIdentifier:v18 dialRequest:v10 group:v7 options:16];
  }
  return v4;
}

uint64_t __98___CNUIUserActionCallProviderVideoTarget_actionsForSocialProfiles_contact_discoveringEnvironment___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *MEMORY[0x263F334E8];
  v5 = [v3 value];
  v6 = [v5 username];
  LODWORD(v4) = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v6);

  if (v4)
  {
    uint64_t v7 = [v3 value];
    v8 = [v7 bundleIdentifiers];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __98___CNUIUserActionCallProviderVideoTarget_actionsForSocialProfiles_contact_discoveringEnvironment___block_invoke_2;
    v11[3] = &unk_264017358;
    v11[4] = *(void *)(a1 + 32);
    uint64_t v9 = objc_msgSend(v8, "_cn_any:", v11);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

uint64_t __98___CNUIUserActionCallProviderVideoTarget_actionsForSocialProfiles_contact_discoveringEnvironment___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 bundleIdentifier];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

id __98___CNUIUserActionCallProviderVideoTarget_actionsForSocialProfiles_contact_discoveringEnvironment___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 value];
  uint64_t v5 = [v4 username];

  v6 = [v3 value];
  uint64_t v7 = [v6 userIdentifier];

  v8 = [[CNHandle alloc] initWithStringValue:v5 customIdentifier:v7 type:1];
  uint64_t v9 = [*(id *)(a1 + 32) callProvider];
  uint64_t v10 = [v9 dialRequestForHandle:v8 contact:*(void *)(a1 + 40) video:1];

  v11 = (void *)MEMORY[0x263EFEA30];
  uint64_t v12 = *(void *)(a1 + 40);
  uint64_t v13 = *MEMORY[0x263EFE110];
  uint64_t v14 = [v3 identifier];
  v15 = [v11 contactPropertyWithContactNoCopy:v12 propertyKey:v13 identifier:v14];

  uint64_t v16 = *MEMORY[0x263EFDF38];
  uint64_t v17 = [*(id *)(a1 + 32) bundleIdentifier];
  uint64_t v18 = [v3 isSuggested];

  LOBYTE(v21) = 0;
  v19 = +[CNUIUserActionItem itemWithType:v16 contactProperty:v15 bundleIdentifier:v17 dialRequest:v10 isSuggested:v18 options:16 isEligibleDefaultApp:v21];

  return v19;
}

uint64_t __107___CNUIUserActionCallProviderVideoTarget_actionsForInstantMessageAddresses_contact_discoveringEnvironment___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *MEMORY[0x263F334E8];
  uint64_t v5 = [v3 value];
  v6 = [v5 username];
  LODWORD(v4) = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v6);

  if (v4)
  {
    uint64_t v7 = [v3 value];
    v8 = [v7 bundleIdentifiers];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __107___CNUIUserActionCallProviderVideoTarget_actionsForInstantMessageAddresses_contact_discoveringEnvironment___block_invoke_2;
    v11[3] = &unk_264017358;
    v11[4] = *(void *)(a1 + 32);
    uint64_t v9 = objc_msgSend(v8, "_cn_any:", v11);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

uint64_t __107___CNUIUserActionCallProviderVideoTarget_actionsForInstantMessageAddresses_contact_discoveringEnvironment___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 bundleIdentifier];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

id __107___CNUIUserActionCallProviderVideoTarget_actionsForInstantMessageAddresses_contact_discoveringEnvironment___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 value];
  uint64_t v5 = [v4 username];

  v6 = [v3 value];
  uint64_t v7 = [v6 userIdentifier];

  v8 = [[CNHandle alloc] initWithStringValue:v5 customIdentifier:v7 type:1];
  uint64_t v9 = [*(id *)(a1 + 32) callProvider];
  uint64_t v10 = [v9 dialRequestForHandle:v8 contact:*(void *)(a1 + 40) video:1];

  v11 = (void *)MEMORY[0x263EFEA30];
  uint64_t v12 = *(void *)(a1 + 40);
  uint64_t v13 = *MEMORY[0x263EFE010];
  uint64_t v14 = [v3 identifier];
  v15 = [v11 contactPropertyWithContactNoCopy:v12 propertyKey:v13 identifier:v14];

  uint64_t v16 = *MEMORY[0x263EFDF38];
  uint64_t v17 = [*(id *)(a1 + 32) bundleIdentifier];
  uint64_t v18 = [v3 isSuggested];

  LOBYTE(v21) = 0;
  v19 = +[CNUIUserActionItem itemWithType:v16 contactProperty:v15 bundleIdentifier:v17 dialRequest:v10 isSuggested:v18 options:16 isEligibleDefaultApp:v21];

  return v19;
}

@end
@interface CNUIUserActionStartVideoCallIntentTarget
@end

@implementation CNUIUserActionStartVideoCallIntentTarget

id __101___CNUIUserActionStartVideoCallIntentTarget_actionsForEmailAddresses_contact_discoveringEnvironment___block_invoke(uint64_t a1, void *a2)
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
    v7 = objc_msgSend(MEMORY[0x263F08D38], "_cnui_startVideoCallIntentWithHandle:contact:", v6, *(void *)(a1 + 32));
    v8 = (void *)MEMORY[0x263EFEA30];
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *MEMORY[0x263EFDF80];
    v11 = [v3 identifier];
    v12 = [v8 contactPropertyWithContactNoCopy:v9 propertyKey:v10 identifier:v11];

    uint64_t v13 = *MEMORY[0x263EFDF38];
    v14 = [*(id *)(a1 + 40) bundleIdentifier];
    v4 = +[CNUIUserActionItem itemWithType:v13 contactProperty:v12 bundleIdentifier:v14 userActivity:v7 group:7 options:26];

    v15 = [*(id *)(a1 + 40) teamIdentifier];
    [v4 setTeamIdentifier:v15];
  }
  return v4;
}

id __99___CNUIUserActionStartVideoCallIntentTarget_actionsForPhoneNumbers_contact_discoveringEnvironment___block_invoke(uint64_t a1, void *a2)
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
    v8 = objc_msgSend(MEMORY[0x263F08D38], "_cnui_startVideoCallIntentWithHandle:contact:", v7, *(void *)(a1 + 32));
    uint64_t v9 = (void *)MEMORY[0x263EFEA30];
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *MEMORY[0x263EFE070];
    v12 = [v3 identifier];
    uint64_t v13 = [v9 contactPropertyWithContactNoCopy:v10 propertyKey:v11 identifier:v12];

    uint64_t v14 = *MEMORY[0x263EFDF38];
    v15 = [*(id *)(a1 + 40) bundleIdentifier];
    v4 = +[CNUIUserActionItem itemWithType:v14 contactProperty:v13 bundleIdentifier:v15 userActivity:v8 group:7 options:26];

    v16 = [*(id *)(a1 + 40) teamIdentifier];
    [v4 setTeamIdentifier:v16];
  }
  return v4;
}

uint64_t __101___CNUIUserActionStartVideoCallIntentTarget_actionsForSocialProfiles_contact_discoveringEnvironment___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *MEMORY[0x263F334E8];
  v5 = [v3 value];
  v6 = [v5 username];
  LODWORD(v4) = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v6);

  if (v4)
  {
    v7 = [v3 value];
    v8 = [v7 bundleIdentifiers];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __101___CNUIUserActionStartVideoCallIntentTarget_actionsForSocialProfiles_contact_discoveringEnvironment___block_invoke_2;
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

uint64_t __101___CNUIUserActionStartVideoCallIntentTarget_actionsForSocialProfiles_contact_discoveringEnvironment___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 bundleIdentifier];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

id __101___CNUIUserActionStartVideoCallIntentTarget_actionsForSocialProfiles_contact_discoveringEnvironment___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 value];
  v20 = [v4 username];

  uint64_t v5 = [v3 value];
  v6 = [v5 userIdentifier];

  v7 = [[CNHandle alloc] initWithStringValue:v20 customIdentifier:v6 type:1];
  v8 = objc_msgSend(MEMORY[0x263F08D38], "_cnui_startVideoCallIntentWithHandle:contact:", v7, *(void *)(a1 + 32));
  uint64_t v9 = (void *)MEMORY[0x263EFEA30];
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *MEMORY[0x263EFE110];
  v12 = [v3 identifier];
  uint64_t v13 = [v9 contactPropertyWithContactNoCopy:v10 propertyKey:v11 identifier:v12];

  uint64_t v14 = *MEMORY[0x263EFDF38];
  v15 = [*(id *)(a1 + 40) bundleIdentifier];
  uint64_t v16 = [v3 isSuggested];

  v17 = +[CNUIUserActionItem itemWithType:v14 contactProperty:v13 bundleIdentifier:v15 userActivity:v8 isSuggested:v16 options:26];

  v18 = [*(id *)(a1 + 40) teamIdentifier];
  [v17 setTeamIdentifier:v18];

  return v17;
}

uint64_t __110___CNUIUserActionStartVideoCallIntentTarget_actionsForInstantMessageAddresses_contact_discoveringEnvironment___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *MEMORY[0x263F334E8];
  uint64_t v5 = [v3 value];
  v6 = [v5 username];
  LODWORD(v4) = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v6);

  if (v4)
  {
    v7 = [v3 value];
    v8 = [v7 bundleIdentifiers];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __110___CNUIUserActionStartVideoCallIntentTarget_actionsForInstantMessageAddresses_contact_discoveringEnvironment___block_invoke_2;
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

uint64_t __110___CNUIUserActionStartVideoCallIntentTarget_actionsForInstantMessageAddresses_contact_discoveringEnvironment___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 bundleIdentifier];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

id __110___CNUIUserActionStartVideoCallIntentTarget_actionsForInstantMessageAddresses_contact_discoveringEnvironment___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 value];
  v20 = [v4 username];

  uint64_t v5 = [v3 value];
  v6 = [v5 userIdentifier];

  v7 = [[CNHandle alloc] initWithStringValue:v20 customIdentifier:v6 type:1];
  v8 = objc_msgSend(MEMORY[0x263F08D38], "_cnui_startVideoCallIntentWithHandle:contact:", v7, *(void *)(a1 + 32));
  uint64_t v9 = (void *)MEMORY[0x263EFEA30];
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *MEMORY[0x263EFE010];
  v12 = [v3 identifier];
  uint64_t v13 = [v9 contactPropertyWithContactNoCopy:v10 propertyKey:v11 identifier:v12];

  uint64_t v14 = *MEMORY[0x263EFDF38];
  v15 = [*(id *)(a1 + 40) bundleIdentifier];
  uint64_t v16 = [v3 isSuggested];

  v17 = +[CNUIUserActionItem itemWithType:v14 contactProperty:v13 bundleIdentifier:v15 userActivity:v8 isSuggested:v16 options:26];

  v18 = [*(id *)(a1 + 40) teamIdentifier];
  [v17 setTeamIdentifier:v18];

  return v17;
}

@end
@interface CNUIUserActionCallProviderVoiceTarget
@end

@implementation CNUIUserActionCallProviderVoiceTarget

BOOL __83___CNUIUserActionCallProviderVoiceTarget_actionsForContact_discoveringEnvironment___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v6 = (id *)(a1 + 32);
  v7 = [*(id *)(a1 + 32) managedBundleIdentifierForContact:v5 discoveringEnvironment:*(void *)(a1 + 40)];
  if (v7 || ([*v6 bundleIdentifier], (v2 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v8 = [*v6 bundleIdentifier];
    int v9 = [v7 isEqual:v8];

    if (v7)
    {
      if (!v9) {
        goto LABEL_12;
      }
    }
    else
    {

      if ((v9 & 1) == 0) {
        goto LABEL_12;
      }
    }
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v12 = *(void *)(v10 + 40);
  v11 = (id *)(v10 + 40);
  if (v12)
  {
    v13 = +[CNUICoreLogProvider actions_os_log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      __83___CNUIUserActionCallProviderVoiceTarget_actionsForContact_discoveringEnvironment___block_invoke_cold_1((id *)(a1 + 32), (uint64_t)v5, v13);
    }
  }
  else
  {
    objc_storeStrong(v11, a2);
  }
LABEL_12:

  return v7 == 0;
}

id __98___CNUIUserActionCallProviderVoiceTarget_actionsForEmailAddresses_contact_discoveringEnvironment___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isSuggested])
  {
    v4 = (void *)MEMORY[0x263EFFA68];
  }
  else
  {
    id v5 = [v3 value];
    v6 = [[CNHandle alloc] initWithStringValue:v5 type:3];
    v7 = [*(id *)(a1 + 32) callProvider];
    v8 = [v7 dialRequestForHandle:v6 contact:*(void *)(a1 + 40) video:0];

    int v9 = (void *)MEMORY[0x263EFEA30];
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = *MEMORY[0x263EFDF80];
    uint64_t v12 = [v3 identifier];
    v13 = [v9 contactPropertyWithContactNoCopy:v10 propertyKey:v11 identifier:v12];

    v14 = [*(id *)(a1 + 32) callProvider];
    if ([v14 isEligibleDefaultApp]) {
      uint64_t v15 = 2;
    }
    else {
      uint64_t v15 = 6;
    }

    uint64_t v16 = *MEMORY[0x263EFDEF8];
    v17 = [*(id *)(a1 + 32) bundleIdentifier];
    v4 = +[CNUIUserActionItem itemWithType:v16 contactProperty:v13 bundleIdentifier:v17 dialRequest:v8 group:v15 options:16];
  }
  return v4;
}

id __110___CNUIUserActionCallProviderVoiceTarget_actionsForPhoneNumbers_contact_group_options_discoveringEnvironment___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isSuggested])
  {
    v4 = (void *)MEMORY[0x263EFFA68];
  }
  else
  {
    id v5 = [v3 value];
    v6 = [v5 stringValue];

    uint64_t v7 = 2;
    v8 = [[CNHandle alloc] initWithStringValue:v6 type:2];
    int v9 = [*(id *)(a1 + 32) callProvider];
    uint64_t v10 = [v9 dialRequestForHandle:v8 contact:*(void *)(a1 + 40) video:0];

    uint64_t v11 = (void *)MEMORY[0x263EFEA30];
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v13 = *MEMORY[0x263EFE070];
    v14 = [v3 identifier];
    uint64_t v15 = [v11 contactPropertyWithContactNoCopy:v12 propertyKey:v13 identifier:v14];

    uint64_t v16 = [*(id *)(a1 + 32) callProvider];
    if (([v16 isEligibleDefaultApp] & 1) == 0) {
      uint64_t v7 = *(void *)(a1 + 48);
    }

    uint64_t v17 = *MEMORY[0x263EFDEF8];
    v18 = [*(id *)(a1 + 32) bundleIdentifier];
    v4 = +[CNUIUserActionItem itemWithType:v17 contactProperty:v15 bundleIdentifier:v18 dialRequest:v10 group:v7 options:*(void *)(a1 + 56)];
  }
  return v4;
}

uint64_t __98___CNUIUserActionCallProviderVoiceTarget_actionsForSocialProfiles_contact_discoveringEnvironment___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *MEMORY[0x263F334E8];
  id v5 = [v3 value];
  v6 = [v5 username];
  LODWORD(v4) = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v6);

  if (v4)
  {
    uint64_t v7 = [v3 value];
    v8 = [v7 bundleIdentifiers];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __98___CNUIUserActionCallProviderVoiceTarget_actionsForSocialProfiles_contact_discoveringEnvironment___block_invoke_2;
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

uint64_t __98___CNUIUserActionCallProviderVoiceTarget_actionsForSocialProfiles_contact_discoveringEnvironment___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 bundleIdentifier];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

id __98___CNUIUserActionCallProviderVoiceTarget_actionsForSocialProfiles_contact_discoveringEnvironment___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 value];
  v22 = [v4 username];

  uint64_t v5 = [v3 value];
  v6 = [v5 userIdentifier];

  uint64_t v7 = [[CNHandle alloc] initWithStringValue:v22 customIdentifier:v6 type:1];
  v8 = [*(id *)(a1 + 32) callProvider];
  uint64_t v9 = [v8 dialRequestForHandle:v7 contact:*(void *)(a1 + 40) video:0];

  uint64_t v10 = (void *)MEMORY[0x263EFEA30];
  uint64_t v11 = *(void *)(a1 + 40);
  uint64_t v12 = *MEMORY[0x263EFE110];
  uint64_t v13 = [v3 identifier];
  v14 = [v10 contactPropertyWithContactNoCopy:v11 propertyKey:v12 identifier:v13];

  uint64_t v15 = *MEMORY[0x263EFDEF8];
  uint64_t v16 = [*(id *)(a1 + 32) bundleIdentifier];
  uint64_t v17 = [v3 isSuggested];

  v18 = [*(id *)(a1 + 32) callProvider];
  LOBYTE(v21) = [v18 isEligibleDefaultApp];
  v19 = +[CNUIUserActionItem itemWithType:v15 contactProperty:v14 bundleIdentifier:v16 dialRequest:v9 isSuggested:v17 options:16 isEligibleDefaultApp:v21];

  return v19;
}

uint64_t __107___CNUIUserActionCallProviderVoiceTarget_actionsForInstantMessageAddresses_contact_discoveringEnvironment___block_invoke(uint64_t a1, void *a2)
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
    v11[2] = __107___CNUIUserActionCallProviderVoiceTarget_actionsForInstantMessageAddresses_contact_discoveringEnvironment___block_invoke_2;
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

uint64_t __107___CNUIUserActionCallProviderVoiceTarget_actionsForInstantMessageAddresses_contact_discoveringEnvironment___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 bundleIdentifier];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

id __107___CNUIUserActionCallProviderVoiceTarget_actionsForInstantMessageAddresses_contact_discoveringEnvironment___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 value];
  v22 = [v4 username];

  uint64_t v5 = [v3 value];
  v6 = [v5 userIdentifier];

  uint64_t v7 = [[CNHandle alloc] initWithStringValue:v22 customIdentifier:v6 type:1];
  v8 = [*(id *)(a1 + 32) callProvider];
  uint64_t v9 = [v8 dialRequestForHandle:v7 contact:*(void *)(a1 + 40) video:0];

  uint64_t v10 = (void *)MEMORY[0x263EFEA30];
  uint64_t v11 = *(void *)(a1 + 40);
  uint64_t v12 = *MEMORY[0x263EFE010];
  uint64_t v13 = [v3 identifier];
  v14 = [v10 contactPropertyWithContactNoCopy:v11 propertyKey:v12 identifier:v13];

  uint64_t v15 = *MEMORY[0x263EFDEF8];
  uint64_t v16 = [*(id *)(a1 + 32) bundleIdentifier];
  uint64_t v17 = [v3 isSuggested];

  v18 = [*(id *)(a1 + 32) callProvider];
  LOBYTE(v21) = [v18 isEligibleDefaultApp];
  v19 = +[CNUIUserActionItem itemWithType:v15 contactProperty:v14 bundleIdentifier:v16 dialRequest:v9 isSuggested:v17 options:16 isEligibleDefaultApp:v21];

  return v19;
}

void __83___CNUIUserActionCallProviderVoiceTarget_actionsForContact_discoveringEnvironment___block_invoke_cold_1(id *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = [*a1 bundleIdentifier];
  int v6 = 138412546;
  uint64_t v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_debug_impl(&dword_20B704000, a3, OS_LOG_TYPE_DEBUG, "[Disambiguation Modeler] not creating actions for managed VoIP call provider %@ with managed contact %@", (uint8_t *)&v6, 0x16u);
}

@end
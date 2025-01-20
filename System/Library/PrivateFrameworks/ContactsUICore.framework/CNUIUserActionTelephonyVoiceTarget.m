@interface CNUIUserActionTelephonyVoiceTarget
@end

@implementation CNUIUserActionTelephonyVoiceTarget

id __93___CNUIUserActionTelephonyVoiceTarget_actionsForPhoneNumbers_contact_discoveringEnvironment___block_invoke(uint64_t a1, void *a2)
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

    v7 = (void *)MEMORY[0x263EFEA30];
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *MEMORY[0x263EFE070];
    v10 = [v3 identifier];
    v11 = [v7 contactPropertyWithContactNoCopy:v8 propertyKey:v9 identifier:v10];

    v4 = [MEMORY[0x263EFF980] array];
    v12 = [*(id *)(a1 + 40) phoneCallActionWithDestinationID:v6 contactProperty:v11 discoveringEnvironment:*(void *)(a1 + 48)];
    [v4 addObject:v12];
  }
  return v4;
}

id __96___CNUIUserActionTelephonyVoiceTarget_ttyActionsForPhoneNumbers_contact_discoveringEnvironment___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) highLatencySchedulerProvider];
  v5 = [v4 backgroundScheduler];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __96___CNUIUserActionTelephonyVoiceTarget_ttyActionsForPhoneNumbers_contact_discoveringEnvironment___block_invoke_2;
  v10[3] = &unk_264018510;
  v6 = *(void **)(a1 + 48);
  v10[4] = *(void *)(a1 + 40);
  id v11 = v6;
  id v12 = *(id *)(a1 + 56);
  id v13 = *(id *)(a1 + 32);
  id v14 = v3;
  id v7 = v3;
  uint64_t v8 = [v5 performCancelableBlock:v10 qualityOfService:2];

  return v8;
}

void __96___CNUIUserActionTelephonyVoiceTarget_ttyActionsForPhoneNumbers_contact_discoveringEnvironment___block_invoke_2(void *a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263F33608];
  v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  uint64_t v7 = a1[7];
  id v8 = a2;
  uint64_t v9 = [v4 ttyActionsFutureForPhoneNumbers:v5 contact:v6 discoveringEnvironment:v7];
  v10 = [v3 observableWithFuture:v9];
  id v11 = [v10 subscribe:a1[8]];

  [v8 addCancelable:v11];
}

id __102___CNUIUserActionTelephonyVoiceTarget_ttyActionsFutureForPhoneNumbers_contact_discoveringEnvironment___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isSuggested])
  {
    v4 = (void *)MEMORY[0x263EFFA68];
  }
  else
  {
    uint64_t v5 = [v3 value];
    uint64_t v6 = [v5 stringValue];

    uint64_t v7 = (void *)MEMORY[0x263EFEA30];
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *MEMORY[0x263EFE070];
    v10 = [v3 identifier];
    id v11 = [v7 contactPropertyWithContactNoCopy:v8 propertyKey:v9 identifier:v10];

    v4 = [MEMORY[0x263EFF980] array];
    id v12 = [*(id *)(a1 + 40) TTYCallActionWithDestinationID:v6 contactProperty:v11 discoveringEnvironment:*(void *)(a1 + 48)];
    [v4 addObject:v12];

    if (*(unsigned char *)(a1 + 56))
    {
      id v13 = [*(id *)(a1 + 40) TTYRelayCallActionWithDestinationID:v6 contactProperty:v11 discoveringEnvironment:*(void *)(a1 + 48)];
      [v4 addObject:v13];
    }
  }

  return v4;
}

@end
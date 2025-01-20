@interface _CNUIUserActionTelephonyVoiceTarget
- (_CNUIUserActionTelephonyVoiceTarget)init;
- (id)TTYCallActionWithDestinationID:(id)a3 contactProperty:(id)a4 discoveringEnvironment:(id)a5;
- (id)TTYRelayCallActionWithDestinationID:(id)a3 contactProperty:(id)a4 discoveringEnvironment:(id)a5;
- (id)actionsForContact:(id)a3 discoveringEnvironment:(id)a4;
- (id)actionsForPhoneNumbers:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5;
- (id)phoneCallActionWithDestinationID:(id)a3 contactProperty:(id)a4 discoveringEnvironment:(id)a5;
- (id)ttyActionsForPhoneNumbers:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5;
- (id)ttyActionsFutureForPhoneNumbers:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5;
@end

@implementation _CNUIUserActionTelephonyVoiceTarget

- (_CNUIUserActionTelephonyVoiceTarget)init
{
  uint64_t v2 = *MEMORY[0x263EFDEE8];
  v4.receiver = self;
  v4.super_class = (Class)_CNUIUserActionTelephonyVoiceTarget;
  return [(CNUIUserActionTarget *)&v4 initWithName:@"Phone" bundleIdentifier:v2 teamIdentifier:0];
}

- (id)actionsForContact:(id)a3 discoveringEnvironment:(id)a4
{
  v19[2] = *MEMORY[0x263EF8340];
  v18.receiver = self;
  v18.super_class = (Class)_CNUIUserActionTelephonyVoiceTarget;
  id v6 = a4;
  id v7 = a3;
  v8 = [(CNUIUserActionTarget *)&v18 actionsForContact:v7 discoveringEnvironment:v6];
  v9 = [v7 phoneNumbers];
  v10 = [(_CNUIUserActionTelephonyVoiceTarget *)self ttyActionsForPhoneNumbers:v9 contact:v7 discoveringEnvironment:v6];

  v11 = [v10 startWith:&unk_26BFD9D60];

  v12 = (void *)MEMORY[0x263F33608];
  v19[0] = v8;
  v19[1] = v11;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
  v14 = [v6 schedulerProvider];

  v15 = [v12 combineLatest:v13 schedulerProvider:v14];
  v16 = [v15 map:*MEMORY[0x263F33478]];

  return v16;
}

- (id)actionsForPhoneNumbers:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __93___CNUIUserActionTelephonyVoiceTarget_actionsForPhoneNumbers_contact_discoveringEnvironment___block_invoke;
  v14[3] = &unk_2640184E8;
  id v15 = v8;
  v16 = self;
  id v17 = v9;
  id v10 = v9;
  id v11 = v8;
  v12 = objc_msgSend(a3, "_cn_flatMap:", v14);

  return v12;
}

- (id)ttyActionsForPhoneNumbers:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x263F33608];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __96___CNUIUserActionTelephonyVoiceTarget_ttyActionsForPhoneNumbers_contact_discoveringEnvironment___block_invoke;
  v17[3] = &unk_264018538;
  id v18 = v10;
  v19 = self;
  id v20 = v8;
  id v21 = v9;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  id v15 = [v11 observableWithBlock:v17];

  return v15;
}

- (id)ttyActionsFutureForPhoneNumbers:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v10 ttyUtilities];
  char v12 = [v11 contactIsTTYContact:v9];

  if (v12)
  {
    id v13 = [v10 ttyUtilities];
    char v14 = [v13 relayIsSupported];

    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 3221225472;
    id v21 = __102___CNUIUserActionTelephonyVoiceTarget_ttyActionsFutureForPhoneNumbers_contact_discoveringEnvironment___block_invoke;
    v22 = &unk_264018560;
    id v23 = v9;
    v24 = self;
    id v25 = v10;
    char v26 = v14;
    id v15 = objc_msgSend(v8, "_cn_flatMap:", &v19);
    v16 = objc_msgSend(v15, "_cn_flatten", v19, v20, v21, v22);

    id v17 = [MEMORY[0x263F335E0] futureWithResult:v16];
  }
  else
  {
    id v17 = [MEMORY[0x263F335E0] futureWithResult:MEMORY[0x263EFFA68]];
  }

  return v17;
}

- (id)phoneCallActionWithDestinationID:(id)a3 contactProperty:(id)a4 discoveringEnvironment:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [[CNHandle alloc] initWithStringValue:v8 type:2];

  id v10 = NSURL;
  id v11 = [v7 contact];
  char v12 = objc_msgSend(v10, "_cnui_telephonyURLFutureWithHandle:contact:preferDefaultApp:", v9, v11, 0);

  uint64_t v13 = *MEMORY[0x263EFDEF8];
  char v14 = [(CNUIUserActionTarget *)self bundleIdentifier];
  id v15 = +[CNUIUserActionItem itemWithType:v13 contactProperty:v7 bundleIdentifier:v14 url:v12 group:2 options:0];

  return v15;
}

- (id)TTYCallActionWithDestinationID:(id)a3 contactProperty:(id)a4 discoveringEnvironment:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [[CNHandle alloc] initWithStringValue:v8 type:2];

  id v10 = NSURL;
  id v11 = [v7 contact];
  char v12 = objc_msgSend(v10, "_cnui_ttyURLFutureWithHandle:contact:", v9, v11);

  uint64_t v13 = *MEMORY[0x263EFDF28];
  char v14 = [(CNUIUserActionTarget *)self bundleIdentifier];
  id v15 = +[CNUIUserActionItem itemWithType:v13 contactProperty:v7 bundleIdentifier:v14 url:v12 group:2 options:0];

  return v15;
}

- (id)TTYRelayCallActionWithDestinationID:(id)a3 contactProperty:(id)a4 discoveringEnvironment:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [[CNHandle alloc] initWithStringValue:v8 type:2];

  id v10 = NSURL;
  id v11 = [v7 contact];
  char v12 = objc_msgSend(v10, "_cnui_ttyRelayURLFutureWithHandle:contact:", v9, v11);

  uint64_t v13 = *MEMORY[0x263EFDF30];
  char v14 = [(CNUIUserActionTarget *)self bundleIdentifier];
  id v15 = +[CNUIUserActionItem itemWithType:v13 contactProperty:v7 bundleIdentifier:v14 url:v12 group:2 options:0];

  return v15;
}

@end
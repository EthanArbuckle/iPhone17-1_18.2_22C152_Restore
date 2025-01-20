@interface _CNUIUserActionCallProviderVoiceTarget
- (BOOL)isCallProviderManagedUsingDiscoveringEnvironment:(id)a3;
- (id)actionsForContact:(id)a3 discoveringEnvironment:(id)a4;
- (id)actionsForEmailAddresses:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5;
- (id)actionsForInstantMessageAddresses:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5;
- (id)actionsForPhoneNumbers:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5;
- (id)actionsForPhoneNumbers:(id)a3 contact:(id)a4 group:(int64_t)a5 options:(unint64_t)a6 discoveringEnvironment:(id)a7;
- (id)actionsForSocialProfiles:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5;
- (id)externalAccountIdentifierForContact:(id)a3 contactStore:(id)a4;
- (id)managedBundleIdentifierForContact:(id)a3 discoveringEnvironment:(id)a4;
@end

@implementation _CNUIUserActionCallProviderVoiceTarget

- (id)actionsForContact:(id)a3 discoveringEnvironment:(id)a4
{
  v34[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy_;
  v31 = __Block_byref_object_dispose_;
  id v32 = 0;
  if ([v6 isUnified])
  {
    [v6 linkedContacts];
  }
  else
  {
    v34[0] = v6;
    [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:1];
  v8 = };
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __83___CNUIUserActionCallProviderVoiceTarget_actionsForContact_discoveringEnvironment___block_invoke;
  v24[3] = &unk_264017CA0;
  v24[4] = self;
  id v9 = v7;
  id v25 = v9;
  v26 = &v27;
  v10 = objc_msgSend(v8, "_cn_filter:", v24);
  v11 = (void *)v28[5];
  if (v11)
  {
    v12 = (void *)MEMORY[0x263F33608];
    v13 = [v11 phoneNumbers];
    v14 = [(_CNUIUserActionCallProviderVoiceTarget *)self actionsForPhoneNumbers:v13 contact:v28[5] group:1 options:0 discoveringEnvironment:v9];
    v33 = v14;
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v33 count:1];
    v16 = [v12 observableWithResults:v15];

LABEL_6:
    goto LABEL_13;
  }
  if ([(_CNUIUserActionCallProviderVoiceTarget *)self isCallProviderManagedUsingDiscoveringEnvironment:v9])
  {
    v23 = self;
    v17 = (objc_super *)&v23;
LABEL_11:
    v17->super_class = (Class)_CNUIUserActionCallProviderVoiceTarget;
    uint64_t v19 = [(objc_super *)v17 actionsForContact:v6 discoveringEnvironment:v9];
    goto LABEL_12;
  }
  uint64_t v18 = [v10 count];
  if (v18 == [v8 count])
  {
    v22.receiver = self;
    v17 = &v22;
    goto LABEL_11;
  }
  if ([v10 count])
  {
    v13 = [MEMORY[0x263EFE9F8] unifyContacts:v10];
    v21.receiver = self;
    v21.super_class = (Class)_CNUIUserActionCallProviderVoiceTarget;
    v16 = [(CNUIUserActionTarget *)&v21 actionsForContact:v13 discoveringEnvironment:v9];
    goto LABEL_6;
  }
  uint64_t v19 = [MEMORY[0x263F33608] emptyObservable];
LABEL_12:
  v16 = (void *)v19;
LABEL_13:

  _Block_object_dispose(&v27, 8);
  return v16;
}

- (id)managedBundleIdentifierForContact:(id)a3 discoveringEnvironment:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v6 contactStore];
  id v9 = [(_CNUIUserActionCallProviderVoiceTarget *)self externalAccountIdentifierForContact:v7 contactStore:v8];

  if (v9)
  {
    v10 = [v6 profileConnection];
    v11 = getkMCCommunicationServiceTypeAudioCall();
    v12 = [v10 defaultAppBundleIDForCommunicationServiceType:v11 forAccountWithIdentifier:v9];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)externalAccountIdentifierForContact:(id)a3 contactStore:(id)a4
{
  id v5 = a4;
  id v6 = (void *)MEMORY[0x263EFEA80];
  id v7 = [a3 identifier];
  v8 = [v6 predicateForContainerOfContactWithIdentifier:v7];

  id v9 = [v5 containersMatchingPredicate:v8 error:0];
  v10 = [v9 firstObject];

  if (v10)
  {
    v11 = [v9 firstObject];
    v12 = (void *)MEMORY[0x263EFE9D0];
    v13 = [v11 identifier];
    v14 = [v12 predicateForAccountForContainerWithIdentifier:v13];

    v15 = [v5 accountsMatchingPredicate:v14 error:0];
    v16 = [v15 firstObject];
    v10 = [v16 externalIdentifierString];
  }
  return v10;
}

- (BOOL)isCallProviderManagedUsingDiscoveringEnvironment:(id)a3
{
  v4 = [a3 profileConnection];
  id v5 = [(CNUIUserActionTarget *)self callProvider];
  id v6 = [v5 bundleIdentifier];
  id v7 = getkMCCommunicationServiceTypeAudioCall();
  char v8 = [v4 communicationServiceRulesExistForBundleID:v6 forCommunicationServiceType:v7];

  return v8;
}

- (id)actionsForEmailAddresses:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(CNUIUserActionTarget *)self callProvider];
  v10 = [v9 supportedHandleTypes];
  int v11 = [v10 containsObject:&unk_26BFD9A60];

  if (v11)
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __98___CNUIUserActionCallProviderVoiceTarget_actionsForEmailAddresses_contact_discoveringEnvironment___block_invoke;
    v14[3] = &unk_264017330;
    v14[4] = self;
    id v15 = v8;
    v12 = objc_msgSend(v7, "_cn_map:", v14);
  }
  else
  {
    v12 = (void *)MEMORY[0x263EFFA68];
  }

  return v12;
}

- (id)actionsForPhoneNumbers:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(CNUIUserActionTarget *)self callProvider];
  v12 = [v11 supportedHandleTypes];
  int v13 = [v12 containsObject:&unk_26BFD9A78];

  if (v13)
  {
    v14 = [(_CNUIUserActionCallProviderVoiceTarget *)self actionsForPhoneNumbers:v8 contact:v9 group:6 options:16 discoveringEnvironment:v10];
  }
  else
  {
    v14 = (void *)MEMORY[0x263EFFA68];
  }

  return v14;
}

- (id)actionsForPhoneNumbers:(id)a3 contact:(id)a4 group:(int64_t)a5 options:(unint64_t)a6 discoveringEnvironment:(id)a7
{
  id v11 = a4;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __110___CNUIUserActionCallProviderVoiceTarget_actionsForPhoneNumbers_contact_group_options_discoveringEnvironment___block_invoke;
  v15[3] = &unk_264017CC8;
  v15[4] = self;
  id v16 = v11;
  int64_t v17 = a5;
  unint64_t v18 = a6;
  id v12 = v11;
  int v13 = objc_msgSend(a3, "_cn_map:", v15);

  return v13;
}

- (id)actionsForSocialProfiles:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5
{
  id v7 = a4;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __98___CNUIUserActionCallProviderVoiceTarget_actionsForSocialProfiles_contact_discoveringEnvironment___block_invoke;
  v14[3] = &unk_264017380;
  v14[4] = self;
  id v8 = objc_msgSend(a3, "_cn_filter:", v14);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __98___CNUIUserActionCallProviderVoiceTarget_actionsForSocialProfiles_contact_discoveringEnvironment___block_invoke_3;
  v12[3] = &unk_264017330;
  v12[4] = self;
  id v13 = v7;
  id v9 = v7;
  id v10 = objc_msgSend(v8, "_cn_map:", v12);

  return v10;
}

- (id)actionsForInstantMessageAddresses:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5
{
  id v7 = a4;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __107___CNUIUserActionCallProviderVoiceTarget_actionsForInstantMessageAddresses_contact_discoveringEnvironment___block_invoke;
  v14[3] = &unk_264017380;
  v14[4] = self;
  id v8 = objc_msgSend(a3, "_cn_filter:", v14);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __107___CNUIUserActionCallProviderVoiceTarget_actionsForInstantMessageAddresses_contact_discoveringEnvironment___block_invoke_3;
  v12[3] = &unk_264017330;
  v12[4] = self;
  id v13 = v7;
  id v9 = v7;
  id v10 = objc_msgSend(v8, "_cn_map:", v12);

  return v10;
}

@end
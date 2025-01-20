@interface _CNUIUserActionStartVideoCallIntentTarget
- (id)actionsForEmailAddresses:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5;
- (id)actionsForInstantMessageAddresses:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5;
- (id)actionsForPhoneNumbers:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5;
- (id)actionsForSocialProfiles:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5;
@end

@implementation _CNUIUserActionStartVideoCallIntentTarget

- (id)actionsForEmailAddresses:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5
{
  id v7 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __101___CNUIUserActionStartVideoCallIntentTarget_actionsForEmailAddresses_contact_discoveringEnvironment___block_invoke;
  v11[3] = &unk_264017330;
  id v12 = v7;
  v13 = self;
  id v8 = v7;
  v9 = objc_msgSend(a3, "_cn_map:", v11);

  return v9;
}

- (id)actionsForPhoneNumbers:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5
{
  id v7 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __99___CNUIUserActionStartVideoCallIntentTarget_actionsForPhoneNumbers_contact_discoveringEnvironment___block_invoke;
  v11[3] = &unk_264017330;
  id v12 = v7;
  v13 = self;
  id v8 = v7;
  v9 = objc_msgSend(a3, "_cn_map:", v11);

  return v9;
}

- (id)actionsForSocialProfiles:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5
{
  id v7 = a4;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __101___CNUIUserActionStartVideoCallIntentTarget_actionsForSocialProfiles_contact_discoveringEnvironment___block_invoke;
  v15[3] = &unk_264017380;
  v15[4] = self;
  id v8 = objc_msgSend(a3, "_cn_filter:", v15);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __101___CNUIUserActionStartVideoCallIntentTarget_actionsForSocialProfiles_contact_discoveringEnvironment___block_invoke_3;
  v12[3] = &unk_264017330;
  id v13 = v7;
  v14 = self;
  id v9 = v7;
  v10 = objc_msgSend(v8, "_cn_map:", v12);

  return v10;
}

- (id)actionsForInstantMessageAddresses:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5
{
  id v7 = a4;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __110___CNUIUserActionStartVideoCallIntentTarget_actionsForInstantMessageAddresses_contact_discoveringEnvironment___block_invoke;
  v15[3] = &unk_264017380;
  v15[4] = self;
  id v8 = objc_msgSend(a3, "_cn_filter:", v15);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __110___CNUIUserActionStartVideoCallIntentTarget_actionsForInstantMessageAddresses_contact_discoveringEnvironment___block_invoke_3;
  v12[3] = &unk_264017330;
  id v13 = v7;
  v14 = self;
  id v9 = v7;
  v10 = objc_msgSend(v8, "_cn_map:", v12);

  return v10;
}

@end
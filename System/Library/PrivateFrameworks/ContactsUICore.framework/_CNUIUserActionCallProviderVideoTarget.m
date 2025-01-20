@interface _CNUIUserActionCallProviderVideoTarget
- (id)actionsForEmailAddresses:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5;
- (id)actionsForInstantMessageAddresses:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5;
- (id)actionsForPhoneNumbers:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5;
- (id)actionsForSocialProfiles:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5;
@end

@implementation _CNUIUserActionCallProviderVideoTarget

- (id)actionsForEmailAddresses:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(CNUIUserActionTarget *)self callProvider];
  v10 = [v9 supportedHandleTypes];
  int v11 = [v10 containsObject:&unk_26BFD9AA8];

  if (v11)
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __98___CNUIUserActionCallProviderVideoTarget_actionsForEmailAddresses_contact_discoveringEnvironment___block_invoke;
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
  id v7 = a3;
  id v8 = a4;
  v9 = [(CNUIUserActionTarget *)self callProvider];
  v10 = [v9 supportedHandleTypes];
  int v11 = [v10 containsObject:&unk_26BFD9AC0];

  if (v11)
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __96___CNUIUserActionCallProviderVideoTarget_actionsForPhoneNumbers_contact_discoveringEnvironment___block_invoke;
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

- (id)actionsForSocialProfiles:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5
{
  id v7 = a4;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __98___CNUIUserActionCallProviderVideoTarget_actionsForSocialProfiles_contact_discoveringEnvironment___block_invoke;
  v14[3] = &unk_264017380;
  v14[4] = self;
  id v8 = objc_msgSend(a3, "_cn_filter:", v14);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __98___CNUIUserActionCallProviderVideoTarget_actionsForSocialProfiles_contact_discoveringEnvironment___block_invoke_3;
  v12[3] = &unk_264017330;
  v12[4] = self;
  id v13 = v7;
  id v9 = v7;
  v10 = objc_msgSend(v8, "_cn_map:", v12);

  return v10;
}

- (id)actionsForInstantMessageAddresses:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5
{
  id v7 = a4;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __107___CNUIUserActionCallProviderVideoTarget_actionsForInstantMessageAddresses_contact_discoveringEnvironment___block_invoke;
  v14[3] = &unk_264017380;
  v14[4] = self;
  id v8 = objc_msgSend(a3, "_cn_filter:", v14);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __107___CNUIUserActionCallProviderVideoTarget_actionsForInstantMessageAddresses_contact_discoveringEnvironment___block_invoke_3;
  v12[3] = &unk_264017330;
  v12[4] = self;
  id v13 = v7;
  id v9 = v7;
  v10 = objc_msgSend(v8, "_cn_map:", v12);

  return v10;
}

@end
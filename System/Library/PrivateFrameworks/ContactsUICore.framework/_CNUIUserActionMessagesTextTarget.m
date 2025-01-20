@interface _CNUIUserActionMessagesTextTarget
- (_CNUIUserActionMessagesTextTarget)init;
- (id)actionsForEmailAddresses:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5;
- (id)actionsForPhoneNumbers:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5;
@end

@implementation _CNUIUserActionMessagesTextTarget

- (_CNUIUserActionMessagesTextTarget)init
{
  uint64_t v2 = *MEMORY[0x263EFDEE0];
  v4.receiver = self;
  v4.super_class = (Class)_CNUIUserActionMessagesTextTarget;
  return [(CNUIUserActionTarget *)&v4 initWithName:@"Messages" bundleIdentifier:v2 teamIdentifier:0];
}

- (id)actionsForEmailAddresses:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5
{
  id v7 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __93___CNUIUserActionMessagesTextTarget_actionsForEmailAddresses_contact_discoveringEnvironment___block_invoke;
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
  v11[2] = __91___CNUIUserActionMessagesTextTarget_actionsForPhoneNumbers_contact_discoveringEnvironment___block_invoke;
  v11[3] = &unk_264017330;
  id v12 = v7;
  v13 = self;
  id v8 = v7;
  v9 = objc_msgSend(a3, "_cn_map:", v11);

  return v9;
}

@end
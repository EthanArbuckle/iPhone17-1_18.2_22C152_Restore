@interface _CNUIUserActionFaceTimeVoiceTarget
- (_CNUIUserActionFaceTimeVoiceTarget)init;
- (id)actionsForContact:(id)a3 discoveringEnvironment:(id)a4;
@end

@implementation _CNUIUserActionFaceTimeVoiceTarget

- (_CNUIUserActionFaceTimeVoiceTarget)init
{
  uint64_t v2 = *MEMORY[0x263EFDEC0];
  v4.receiver = self;
  v4.super_class = (Class)_CNUIUserActionFaceTimeVoiceTarget;
  return [(CNUIUserActionTarget *)&v4 initWithName:@"FaceTime Audio" bundleIdentifier:v2 teamIdentifier:0];
}

- (id)actionsForContact:(id)a3 discoveringEnvironment:(id)a4
{
  v24[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 idsContactPropertyResolver];
  v9 = [v7 highLatencySchedulerProvider];

  v10 = [v8 resolveAllFaceTimeIDSPropertiesForContact:v6 schedulerProvider:v9];

  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  v20 = __79___CNUIUserActionFaceTimeVoiceTarget_actionsForContact_discoveringEnvironment___block_invoke;
  v21 = &unk_264018260;
  id v22 = v6;
  v23 = self;
  id v11 = v6;
  v12 = [v10 map:&v18];
  v13 = objc_msgSend(v12, "allObjects:", 0, v18, v19, v20, v21);
  v14 = (void *)MEMORY[0x263F33608];
  v24[0] = v13;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
  v16 = [v14 observableWithResults:v15];

  return v16;
}

@end
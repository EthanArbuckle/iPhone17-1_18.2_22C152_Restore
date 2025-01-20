@interface _CNUIUserActionExpanseTarget
- (_CNUIUserActionExpanseTarget)init;
- (id)actionsForContact:(id)a3 discoveringEnvironment:(id)a4;
@end

@implementation _CNUIUserActionExpanseTarget

- (_CNUIUserActionExpanseTarget)init
{
  uint64_t v2 = *MEMORY[0x263EFDEC0];
  v4.receiver = self;
  v4.super_class = (Class)_CNUIUserActionExpanseTarget;
  return [(CNUIUserActionTarget *)&v4 initWithName:@"Expanse" bundleIdentifier:v2 teamIdentifier:0];
}

- (id)actionsForContact:(id)a3 discoveringEnvironment:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v6 idsContactPropertyResolver];
  v9 = [v6 highLatencySchedulerProvider];

  v10 = [v8 resolveBestExpanseIDSPropertyForContact:v7 schedulerProvider:v9];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __73___CNUIUserActionExpanseTarget_actionsForContact_discoveringEnvironment___block_invoke;
  v14[3] = &unk_264017E28;
  v14[4] = self;
  v11 = [v10 map:v14];
  v12 = [v11 startWith:&unk_26BFD9D48];

  return v12;
}

@end
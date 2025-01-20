@interface MGGroup(RemoteQuery)
+ (id)rq_predicateForInCurrentHome;
+ (id)rq_predicateForRestrictedTypes;
+ (uint64_t)rq_predicateForHaveCurrentHome;
+ (uint64_t)rq_predicateForLocal;
- (uint64_t)rq_sourcedRemotely;
- (void)rq_setSourcedRemotely:()RemoteQuery;
@end

@implementation MGGroup(RemoteQuery)

- (void)rq_setSourcedRemotely:()RemoteQuery
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, sel_rq_sourcedRemotely, v2, (void *)1);
}

- (uint64_t)rq_sourcedRemotely
{
  v1 = objc_getAssociatedObject(a1, sel_rq_sourcedRemotely);
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

+ (uint64_t)rq_predicateForLocal
{
  return [MEMORY[0x263F08A98] predicateWithFormat:@"SELF.rq_sourcedRemotely == NO"];
}

+ (id)rq_predicateForRestrictedTypes
{
  v9[5] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263F08A98];
  v1 = [MEMORY[0x263F54730] type];
  v9[0] = v1;
  uint64_t v2 = [MEMORY[0x263F54728] type];
  v9[1] = v2;
  v3 = [MEMORY[0x263F54708] type];
  v9[2] = v3;
  v4 = [MEMORY[0x263F546C8] type];
  v9[3] = v4;
  v5 = [MEMORY[0x263F54748] type];
  v9[4] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:5];
  v7 = [v0 predicateWithFormat:@"SELF.type IN %@", v6];

  return v7;
}

+ (uint64_t)rq_predicateForHaveCurrentHome
{
  return [MEMORY[0x263F08A98] predicateWithFormat:@"($CURRENT_HOME != nil)"];
}

+ (id)rq_predicateForInCurrentHome
{
  v6[2] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263F08730];
  v1 = [MEMORY[0x263F08A98] predicateWithFormat:@"$CONTAINMENT_MAP[SELF.identifier] != nil"];
  v6[0] = v1;
  uint64_t v2 = [MEMORY[0x263F08A98] predicateWithFormat:@"SUBQUERY($CONTAINMENT_MAP[SELF.identifier], $container, $CURRENT_HOME.identifier in $container)[SIZE] > 0"];
  v6[1] = v2;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  v4 = [v0 andPredicateWithSubpredicates:v3];

  return v4;
}

@end
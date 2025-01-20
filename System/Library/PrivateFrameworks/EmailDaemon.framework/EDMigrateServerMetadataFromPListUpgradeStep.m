@interface EDMigrateServerMetadataFromPListUpgradeStep
+ (int)runWithConnection:(id)a3;
- (EDMigrateServerMetadataFromPListUpgradeStep)init;
@end

@implementation EDMigrateServerMetadataFromPListUpgradeStep

+ (int)runWithConnection:(id)a3
{
  id v3 = a3;
  sub_1DB5B385C((uint64_t)v3);

  return 0;
}

- (EDMigrateServerMetadataFromPListUpgradeStep)init
{
  v3.receiver = self;
  v3.super_class = (Class)EDMigrateServerMetadataFromPListUpgradeStep;
  return [(EDMigrateServerMetadataFromPListUpgradeStep *)&v3 init];
}

@end
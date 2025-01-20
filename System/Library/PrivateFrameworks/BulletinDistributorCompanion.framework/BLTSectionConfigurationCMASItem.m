@interface BLTSectionConfigurationCMASItem
- (BOOL)hasDisplayedCriticalBulletins;
- (unint64_t)coordinationType;
@end

@implementation BLTSectionConfigurationCMASItem

- (unint64_t)coordinationType
{
  v10.receiver = self;
  v10.super_class = (Class)BLTSectionConfigurationCMASItem;
  unint64_t v2 = [(BLTSectionConfigurationItem *)&v10 coordinationType];
  if (v2 == 2)
  {
    v3 = objc_msgSend(MEMORY[0x263F57730], "blt_boundedWaitForActivePairedDevice");
    v4 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"4AA3FF3B-3224-42E6-995E-481F49AE9260"];
    int v5 = [v3 supportsCapability:v4];

    if (v5)
    {
      v6 = +[BLTBulletinDistributor sharedDistributor];
      v7 = [v6 gizmoConnection];
      uint64_t v8 = [v7 lastKnownConnectionStatus];

      if ((unint64_t)(v8 - 1) < 2) {
        unint64_t v2 = 1;
      }
      else {
        unint64_t v2 = 2;
      }
    }
    else
    {
      unint64_t v2 = 2;
    }
  }
  return v2;
}

- (BOOL)hasDisplayedCriticalBulletins
{
  return 1;
}

@end
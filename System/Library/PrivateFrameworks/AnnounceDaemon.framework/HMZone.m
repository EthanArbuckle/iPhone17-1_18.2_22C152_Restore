@interface HMZone
@end

@implementation HMZone

BOOL __61__HMZone_Announce__an_zonesWithAnnounceAccessoriesFromZones___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F2E4F8];
  v3 = objc_msgSend(a2, "hmu_accessories");
  v4 = [v2 announceAccessoriesFromAccessories:v3];
  BOOL v5 = [v4 count] != 0;

  return v5;
}

@end
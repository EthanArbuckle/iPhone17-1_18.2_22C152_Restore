@interface HMZone(Announce)
+ (uint64_t)an_zonesWithAnnounceAccessoriesFromZones:()Announce;
@end

@implementation HMZone(Announce)

+ (uint64_t)an_zonesWithAnnounceAccessoriesFromZones:()Announce
{
  return objc_msgSend(a3, "na_filter:", &__block_literal_global_19);
}

@end
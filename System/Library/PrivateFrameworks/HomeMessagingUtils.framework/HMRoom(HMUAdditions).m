@interface HMRoom(HMUAdditions)
+ (id)hmu_accessoriesInRooms:()HMUAdditions;
+ (uint64_t)hmu_roomsWithAnnounceAccessoriesFromRooms:()HMUAdditions;
+ (uint64_t)hmu_roomsWithHomePodsFromRooms:()HMUAdditions;
+ (uint64_t)hmu_uniqueIdentifiersFromRooms:()HMUAdditions;
- (id)hmu_homePods;
@end

@implementation HMRoom(HMUAdditions)

- (id)hmu_homePods
{
  v1 = [a1 accessories];
  v2 = objc_msgSend(v1, "na_filter:", &__block_literal_global_4);

  return v2;
}

+ (id)hmu_accessoriesInRooms:()HMUAdditions
{
  v3 = objc_msgSend(a3, "na_map:", &__block_literal_global_3_0);
  v4 = objc_msgSend(v3, "na_flatMap:", &__block_literal_global_6);

  return v4;
}

+ (uint64_t)hmu_uniqueIdentifiersFromRooms:()HMUAdditions
{
  return objc_msgSend(a3, "na_map:", &__block_literal_global_8);
}

+ (uint64_t)hmu_roomsWithHomePodsFromRooms:()HMUAdditions
{
  return objc_msgSend(a3, "na_filter:", &__block_literal_global_11);
}

+ (uint64_t)hmu_roomsWithAnnounceAccessoriesFromRooms:()HMUAdditions
{
  return objc_msgSend(a3, "na_filter:", &__block_literal_global_13);
}

@end
@interface HMRoom(Announce)
+ (uint64_t)an_roomsWithAnnounceAccessoriesFromRooms:()Announce;
@end

@implementation HMRoom(Announce)

+ (uint64_t)an_roomsWithAnnounceAccessoriesFromRooms:()Announce
{
  return objc_msgSend(a3, "na_filter:", &__block_literal_global);
}

@end
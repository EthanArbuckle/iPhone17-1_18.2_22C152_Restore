@interface EDGroupedSenderList
@end

@implementation EDGroupedSenderList

uint64_t __35___EDGroupedSenderList_unreadCount__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 flags];
  uint64_t v3 = [v2 read] ^ 1;

  return v3;
}

@end
@interface NSCache(CalClassAdditions_NSCache)
- (id)CALobjectForKey:()CalClassAdditions_NSCache calculatedWithBlock:;
@end

@implementation NSCache(CalClassAdditions_NSCache)

- (id)CALobjectForKey:()CalClassAdditions_NSCache calculatedWithBlock:
{
  return CalCachedObjectForKeyWithCalculateBlock(a1, a3, a4);
}

@end
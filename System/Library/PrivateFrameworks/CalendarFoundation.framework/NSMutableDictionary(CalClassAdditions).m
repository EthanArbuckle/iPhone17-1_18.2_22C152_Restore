@interface NSMutableDictionary(CalClassAdditions)
- (id)CALsafeObjectForKey:()CalClassAdditions calculatedWithBlock:;
@end

@implementation NSMutableDictionary(CalClassAdditions)

- (id)CALsafeObjectForKey:()CalClassAdditions calculatedWithBlock:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = a1;
  objc_sync_enter(v8);
  v9 = CalCachedObjectForKeyWithCalculateBlock(v8, v6, v7);
  objc_sync_exit(v8);

  return v9;
}

@end
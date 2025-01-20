@interface NSHashTable(Concurrency)
- (id)_gkSafeCopy;
- (void)_gkSafeAddObject:()Concurrency;
- (void)_gkSafeRemoveObject:()Concurrency;
@end

@implementation NSHashTable(Concurrency)

- (void)_gkSafeAddObject:()Concurrency
{
  id v5 = a3;
  id v4 = a1;
  objc_sync_enter(v4);
  [v4 addObject:v5];
  objc_sync_exit(v4);
}

- (void)_gkSafeRemoveObject:()Concurrency
{
  id v5 = a3;
  id v4 = a1;
  objc_sync_enter(v4);
  [v4 removeObject:v5];
  objc_sync_exit(v4);
}

- (id)_gkSafeCopy
{
  id v1 = a1;
  objc_sync_enter(v1);
  v2 = (void *)[v1 copy];
  objc_sync_exit(v1);

  return v2;
}

@end
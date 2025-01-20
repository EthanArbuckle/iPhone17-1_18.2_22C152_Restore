@interface BBBulletin(BLTCleanup)
- (id)bltContext;
@end

@implementation BBBulletin(BLTCleanup)

- (id)bltContext
{
  v1 = [a1 context];
  v2 = [v1 objectForKeyedSubscript:@"BLTWatchLegacyMap"];
  if (v2)
  {
    id v3 = (id)[v1 mutableCopy];

    [v3 removeObjectForKey:@"BLTWatchLegacyMap"];
    v1 = v3;
  }
  else
  {
    id v3 = 0;
  }
  id v4 = v1;

  return v4;
}

@end
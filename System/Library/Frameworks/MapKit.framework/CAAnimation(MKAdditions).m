@interface CAAnimation(MKAdditions)
- (uint64_t)_mapkit_ID;
- (void)set_mapkit_ID:()MKAdditions;
@end

@implementation CAAnimation(MKAdditions)

- (uint64_t)_mapkit_ID
{
  v1 = [a1 valueForUndefinedKey:@"_mapkit_ID"];
  uint64_t v2 = [v1 integerValue];

  return v2;
}

- (void)set_mapkit_ID:()MKAdditions
{
  objc_msgSend(NSNumber, "numberWithInteger:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setValue:v2 forUndefinedKey:@"_mapkit_ID"];
}

@end
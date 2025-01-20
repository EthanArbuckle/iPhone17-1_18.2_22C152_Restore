@interface NSDictionary(KeyComparison)
- (uint64_t)cam_compareKey:()KeyComparison withDictionary:;
@end

@implementation NSDictionary(KeyComparison)

- (uint64_t)cam_compareKey:()KeyComparison withDictionary:
{
  id v6 = a4;
  id v7 = a3;
  v8 = [a1 objectForKey:v7];
  v9 = [v6 objectForKey:v7];

  uint64_t v10 = [v8 isEqual:v9];
  return v10;
}

@end
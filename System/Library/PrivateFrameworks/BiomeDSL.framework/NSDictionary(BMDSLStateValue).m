@interface NSDictionary(BMDSLStateValue)
- (id)reduceWithNext:()BMDSLStateValue;
@end

@implementation NSDictionary(BMDSLStateValue)

- (id)reduceWithNext:()BMDSLStateValue
{
  id v4 = a3;
  v5 = (void *)[a1 mutableCopy];
  [v5 addEntriesFromDictionary:v4];

  v6 = (void *)[v5 copy];
  return v6;
}

@end
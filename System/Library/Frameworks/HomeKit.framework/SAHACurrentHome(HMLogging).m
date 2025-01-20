@interface SAHACurrentHome(HMLogging)
- (id)hm_shortDescription;
@end

@implementation SAHACurrentHome(HMLogging)

- (id)hm_shortDescription
{
  v2 = NSString;
  v3 = [a1 currentHomeName];
  v4 = [a1 currentHomeIdentifier];
  v5 = [v2 stringWithFormat:@"Siri Current home name: %@, identifier: %@", v3, v4];

  return v5;
}

@end
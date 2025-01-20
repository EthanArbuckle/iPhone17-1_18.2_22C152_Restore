@interface NSDate(DMCProfilesUI)
- (BOOL)DMCProfileNearOrPastExpiration;
- (BOOL)DMCProfilePastExpiration;
@end

@implementation NSDate(DMCProfilesUI)

- (BOOL)DMCProfileNearOrPastExpiration
{
  [a1 timeIntervalSinceNow];
  return v1 <= 1209600.0;
}

- (BOOL)DMCProfilePastExpiration
{
  [a1 timeIntervalSinceNow];
  return v1 <= 0.0;
}

@end
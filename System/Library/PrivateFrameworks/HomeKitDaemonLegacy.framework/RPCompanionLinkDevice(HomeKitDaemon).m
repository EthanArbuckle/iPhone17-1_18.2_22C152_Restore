@interface RPCompanionLinkDevice(HomeKitDaemon)
- (id)redactedDescription;
@end

@implementation RPCompanionLinkDevice(HomeKitDaemon)

- (id)redactedDescription
{
  v1 = NSString;
  v2 = [a1 identifier];
  v3 = [v1 stringWithFormat:@"ID %@", v2];

  return v3;
}

@end
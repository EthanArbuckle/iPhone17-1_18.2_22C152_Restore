@interface MGAppleTVAccessory
+ (id)type;
- (id)HomeKitAccesoryIdentifier;
- (id)HomeKitAccessoryWithHomeManager:(id)a3;
- (id)deviceIdentifier;
@end

@implementation MGAppleTVAccessory

- (id)deviceIdentifier
{
  v2 = [(MGGroup *)self properties];
  v3 = [v2 objectForKey:@"deviceIdentifier"];

  return v3;
}

+ (id)type
{
  return @"com.apple.media-group.solo-AppleTVAccessory";
}

- (id)HomeKitAccesoryIdentifier
{
  v2 = [(MGGroup *)self identifier];
  v3 = MGAccessoryIdentifierForGroupIdentifier(v2);

  return v3;
}

- (id)HomeKitAccessoryWithHomeManager:(id)a3
{
  id v4 = a3;
  v5 = [(MGGroup *)self identifier];
  v6 = MGAccessoryFromHomeManagerForGroupIdentifier(v4, v5);

  return v6;
}

@end
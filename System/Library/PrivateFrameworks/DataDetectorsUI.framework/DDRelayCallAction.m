@interface DDRelayCallAction
- (id)_serviceIdentifier;
- (id)iconName;
- (id)localizedName;
- (int64_t)TTYType;
@end

@implementation DDRelayCallAction

- (id)localizedName
{
  return DDLocalizedString(@"Call Using Relay");
}

- (id)iconName
{
  return @"phone";
}

- (int64_t)TTYType
{
  return 3;
}

- (id)_serviceIdentifier
{
  return @"com.apple.internal.relay";
}

@end
@interface DDTTYCallAction
- (id)_serviceIdentifier;
- (id)localizedName;
- (int64_t)TTYType;
@end

@implementation DDTTYCallAction

- (id)localizedName
{
  return DDLocalizedString(@"Call Using RTT/TTY");
}

- (int64_t)TTYType
{
  return 2;
}

- (id)_serviceIdentifier
{
  return @"com.apple.internal.tty";
}

@end
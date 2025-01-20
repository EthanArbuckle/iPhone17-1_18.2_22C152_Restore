@interface SLTudouService
- (id)accountTypeIdentifier;
- (id)serviceType;
- (int64_t)authenticationStyle;
@end

@implementation SLTudouService

- (id)serviceType
{
  return @"com.apple.social.tudou";
}

- (id)accountTypeIdentifier
{
  return (id)*MEMORY[0x1E4F17868];
}

- (int64_t)authenticationStyle
{
  return 0;
}

@end
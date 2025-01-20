@interface SLYoukuService
- (id)accountTypeIdentifier;
- (id)serviceType;
- (int64_t)authenticationStyle;
@end

@implementation SLYoukuService

- (id)serviceType
{
  return @"com.apple.social.youku";
}

- (id)accountTypeIdentifier
{
  return (id)*MEMORY[0x1E4F17880];
}

- (int64_t)authenticationStyle
{
  return 0;
}

@end
@interface WFScreenshotAccessResource
+ (BOOL)isSystemResource;
- (id)icon;
- (id)name;
- (unint64_t)status;
@end

@implementation WFScreenshotAccessResource

+ (BOOL)isSystemResource
{
  return 1;
}

- (unint64_t)status
{
  return 4;
}

- (id)icon
{
  v2 = (void *)MEMORY[0x263F85308];
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [v2 imageNamed:@"Image" inBundle:v3];

  return v4;
}

- (id)name
{
  return WFLocalizedString(@"Take a Screenshot");
}

@end
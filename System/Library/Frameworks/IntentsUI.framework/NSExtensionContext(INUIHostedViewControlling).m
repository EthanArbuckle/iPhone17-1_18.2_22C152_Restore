@interface NSExtensionContext(INUIHostedViewControlling)
- (double)hostedViewMaximumAllowedSize;
- (double)hostedViewMinimumAllowedSize;
- (uint64_t)interfaceParametersDescription;
@end

@implementation NSExtensionContext(INUIHostedViewControlling)

- (uint64_t)interfaceParametersDescription
{
  return 0;
}

- (double)hostedViewMaximumAllowedSize
{
  return *MEMORY[0x263F001B0];
}

- (double)hostedViewMinimumAllowedSize
{
  return *MEMORY[0x263F001B0];
}

@end
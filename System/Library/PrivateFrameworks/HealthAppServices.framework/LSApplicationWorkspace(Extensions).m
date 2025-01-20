@interface LSApplicationWorkspace(Extensions)
- (uint64_t)hk_asyncOpenURL:()Extensions;
@end

@implementation LSApplicationWorkspace(Extensions)

- (uint64_t)hk_asyncOpenURL:()Extensions
{
  return [a1 openURL:a3 configuration:0 completionHandler:&__block_literal_global];
}

@end
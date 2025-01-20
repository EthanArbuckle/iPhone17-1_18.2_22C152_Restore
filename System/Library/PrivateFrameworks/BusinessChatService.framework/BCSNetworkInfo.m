@interface BCSNetworkInfo
+ (BOOL)isExpensiveNetwork;
@end

@implementation BCSNetworkInfo

+ (BOOL)isExpensiveNetwork
{
  id v2 = objc_alloc_init(MEMORY[0x263F14420]);
  v3 = [v2 path];
  char v4 = [v3 isExpensive];

  return v4;
}

@end
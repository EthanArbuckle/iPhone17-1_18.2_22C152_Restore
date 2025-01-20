@interface HFWindowServiceItem
+ (id)supportedServiceTypes;
@end

@implementation HFWindowServiceItem

+ (id)supportedServiceTypes
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F0D8A8]];
}

@end
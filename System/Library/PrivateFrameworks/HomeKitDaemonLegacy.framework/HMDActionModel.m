@interface HMDActionModel
+ (id)properties;
@end

@implementation HMDActionModel

+ (id)properties
{
  return (id)MEMORY[0x1E4F1CC08];
}

@end
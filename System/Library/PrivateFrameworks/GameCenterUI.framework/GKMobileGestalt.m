@interface GKMobileGestalt
+ (BOOL)wapiCapability;
+ (NSString)deviceClass;
+ (NSString)productType;
@end

@implementation GKMobileGestalt

+ (BOOL)wapiCapability
{
  return MEMORY[0x1F417CE00](@"wapi", a2);
}

+ (NSString)deviceClass
{
  v2 = (void *)MGGetStringAnswer();

  return (NSString *)v2;
}

+ (NSString)productType
{
  v2 = (void *)MGGetStringAnswer();

  return (NSString *)v2;
}

@end
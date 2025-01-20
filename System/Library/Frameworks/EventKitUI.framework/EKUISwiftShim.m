@interface EKUISwiftShim
+ (BOOL)isLegacyEKUIClient;
@end

@implementation EKUISwiftShim

+ (BOOL)isLegacyEKUIClient
{
  return [MEMORY[0x1E4F57690] isProgramSDKAtLeast:0x7E70901FFFFFFFFLL] ^ 1;
}

@end
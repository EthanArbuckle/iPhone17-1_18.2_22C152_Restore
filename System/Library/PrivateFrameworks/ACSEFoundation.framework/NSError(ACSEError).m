@interface NSError(ACSEError)
+ (uint64_t)forACSEError:()ACSEError;
@end

@implementation NSError(ACSEError)

+ (uint64_t)forACSEError:()ACSEError
{
  return [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.ACSEFoundation" code:0 userInfo:0];
}

@end
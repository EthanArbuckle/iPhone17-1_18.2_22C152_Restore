@interface NSError(HomeKitDaemonError)
+ (uint64_t)hmdErrorWithCode:()HomeKitDaemonError;
@end

@implementation NSError(HomeKitDaemonError)

+ (uint64_t)hmdErrorWithCode:()HomeKitDaemonError
{
  return [MEMORY[0x1E4F28C58] errorWithDomain:@"HMDErrorDomain" code:a3 userInfo:0];
}

@end
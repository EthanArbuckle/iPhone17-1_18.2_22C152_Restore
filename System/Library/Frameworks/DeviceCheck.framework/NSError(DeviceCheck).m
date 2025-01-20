@interface NSError(DeviceCheck)
+ (uint64_t)dc_errorWithCode:()DeviceCheck;
+ (uint64_t)dc_errorWithCode:()DeviceCheck userInfo:;
@end

@implementation NSError(DeviceCheck)

+ (uint64_t)dc_errorWithCode:()DeviceCheck
{
  return objc_msgSend(a1, "dc_errorWithCode:userInfo:", a3, 0);
}

+ (uint64_t)dc_errorWithCode:()DeviceCheck userInfo:
{
  return [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.devicecheck.error" code:a3 userInfo:a4];
}

@end
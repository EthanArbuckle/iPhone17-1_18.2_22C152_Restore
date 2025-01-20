@interface NSURL(SOAuthorizationExtras)
+ (uint64_t)_web_canPerformAuthorizationWithURL:()SOAuthorizationExtras;
+ (uint64_t)_web_willPerformSOKerberosAuthorizationWithURL:()SOAuthorizationExtras;
@end

@implementation NSURL(SOAuthorizationExtras)

+ (uint64_t)_web_canPerformAuthorizationWithURL:()SOAuthorizationExtras
{
  v4 = (void *)((uint64_t (*)(void))*MEMORY[0x1E4FB62F8])();

  return [v4 canPerformAuthorizationWithURL:a3 responseCode:0];
}

+ (uint64_t)_web_willPerformSOKerberosAuthorizationWithURL:()SOAuthorizationExtras
{
  v4 = (void *)((uint64_t (*)(void))*MEMORY[0x1E4FB62F8])();

  return [v4 canPerformAuthorizationWithURL:a3 responseCode:401];
}

@end
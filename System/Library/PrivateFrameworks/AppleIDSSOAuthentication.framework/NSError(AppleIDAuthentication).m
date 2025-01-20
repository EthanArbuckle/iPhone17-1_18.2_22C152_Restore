@interface NSError(AppleIDAuthentication)
+ (uint64_t)aida_errorWithCode:()AppleIDAuthentication;
+ (uint64_t)aida_errorWithCode:()AppleIDAuthentication userInfo:;
@end

@implementation NSError(AppleIDAuthentication)

+ (uint64_t)aida_errorWithCode:()AppleIDAuthentication
{
  return objc_msgSend(a1, "aida_errorWithCode:userInfo:", a3, 0);
}

+ (uint64_t)aida_errorWithCode:()AppleIDAuthentication userInfo:
{
  return [a1 errorWithDomain:@"com.apple.AppleID.Error" code:a3 userInfo:a4];
}

@end
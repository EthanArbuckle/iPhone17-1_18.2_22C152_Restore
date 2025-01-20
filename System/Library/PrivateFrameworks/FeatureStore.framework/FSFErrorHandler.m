@interface FSFErrorHandler
+ (void)assertThatUserIsSupported;
@end

@implementation FSFErrorHandler

+ (void)assertThatUserIsSupported
{
  if (!+[FSFUtils isSupportedUser])
  {
    v2 = (void *)MEMORY[0x263EFF940];
    uint64_t v3 = *MEMORY[0x263EFF498];
    v4 = NSString;
    v6 = v5 = NSUserName();
    id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

    objc_exception_throw(v7);
  }
}

@end
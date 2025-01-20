@interface BKErrorHelper
+ (id)errorWithCode:(int64_t)a3;
+ (id)errorWithOSStatus:(int)a3;
@end

@implementation BKErrorHelper

+ (id)errorWithCode:(int64_t)a3
{
  return (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.BiometricKit" code:a3 userInfo:0];
}

+ (id)errorWithOSStatus:(int)a3
{
  return (id)[a1 errorWithCode:1];
}

@end
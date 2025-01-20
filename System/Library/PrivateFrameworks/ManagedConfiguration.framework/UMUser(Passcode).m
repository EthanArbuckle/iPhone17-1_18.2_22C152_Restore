@interface UMUser(Passcode)
+ (uint64_t)mc_userPasscodeTypeWithPasscode:()Passcode;
+ (uint64_t)mc_userPasscodeTypeWithUnlockScreenType:()Passcode simplePasscodeType:;
@end

@implementation UMUser(Passcode)

+ (uint64_t)mc_userPasscodeTypeWithUnlockScreenType:()Passcode simplePasscodeType:
{
  uint64_t v4 = 3;
  uint64_t v5 = 3;
  if (a4 == 1) {
    uint64_t v5 = 1;
  }
  if (!a4) {
    uint64_t v5 = 0;
  }
  if (!a3) {
    uint64_t v4 = v5;
  }
  if (a3 == 1) {
    return 2;
  }
  else {
    return v4;
  }
}

+ (uint64_t)mc_userPasscodeTypeWithPasscode:()Passcode
{
  unsigned int v6 = 0;
  uint64_t v4 = +[MCPasscodeUtilities unlockScreenTypeForPasscode:a3 outSimplePasscodeType:&v6];
  return objc_msgSend(a1, "mc_userPasscodeTypeWithUnlockScreenType:simplePasscodeType:", v4, v6);
}

@end
@interface NSString(LSDebuggingAdditions)
+ (__CFString)NSStringFromLSInstallPhase:()LSDebuggingAdditions;
+ (__CFString)NSStringFromLSInstallState:()LSDebuggingAdditions;
+ (__CFString)NSStringFromLSInstallType:()LSDebuggingAdditions;
@end

@implementation NSString(LSDebuggingAdditions)

+ (__CFString)NSStringFromLSInstallPhase:()LSDebuggingAdditions
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(LSInstallPhase)%llu", a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E522F918[a3];
  }

  return v3;
}

+ (__CFString)NSStringFromLSInstallState:()LSDebuggingAdditions
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(LSInstallState)%llu", a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E522F940[a3];
  }

  return v3;
}

+ (__CFString)NSStringFromLSInstallType:()LSDebuggingAdditions
{
  if (a3 >= 0xB)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(LSInstallType)%llu", a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E522F970[a3];
  }

  return v3;
}

@end
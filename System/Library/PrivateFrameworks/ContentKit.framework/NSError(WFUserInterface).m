@interface NSError(WFUserInterface)
+ (uint64_t)wfSiriPunchOutError;
+ (uint64_t)wfUnsupportedUserInterfaceError;
- (BOOL)wf_isSiriPunchOutError;
- (BOOL)wf_isUnsupportedUserInterfaceError;
@end

@implementation NSError(WFUserInterface)

- (BOOL)wf_isSiriPunchOutError
{
  v2 = [a1 domain];
  if ([v2 isEqualToString:@"WFUserInterfaceErrorDomain"]) {
    BOOL v3 = [a1 code] == 2;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (BOOL)wf_isUnsupportedUserInterfaceError
{
  v2 = [a1 domain];
  if ([v2 isEqualToString:@"WFUserInterfaceErrorDomain"]) {
    BOOL v3 = [a1 code] == 0;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

+ (uint64_t)wfSiriPunchOutError
{
  return [MEMORY[0x263F087E8] errorWithDomain:@"WFUserInterfaceErrorDomain" code:2 userInfo:0];
}

+ (uint64_t)wfUnsupportedUserInterfaceError
{
  return [MEMORY[0x263F087E8] errorWithDomain:@"WFUserInterfaceErrorDomain" code:0 userInfo:0];
}

@end
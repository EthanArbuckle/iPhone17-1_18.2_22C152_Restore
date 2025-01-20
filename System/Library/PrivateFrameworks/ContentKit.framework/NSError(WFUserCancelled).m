@interface NSError(WFUserCancelled)
+ (uint64_t)userCancelledError;
- (BOOL)wf_isUserCancelledError;
@end

@implementation NSError(WFUserCancelled)

- (BOOL)wf_isUserCancelledError
{
  v2 = [a1 domain];
  if ([v2 isEqualToString:*MEMORY[0x263F07F70]]) {
    BOOL v3 = [a1 code] == 3072;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

+ (uint64_t)userCancelledError
{
  return [a1 errorWithDomain:*MEMORY[0x263F07F70] code:3072 userInfo:0];
}

@end
@interface NSError(FMErrors)
+ (uint64_t)fm_cancelledError;
+ (uint64_t)fm_errorWithCode:()FMErrors;
+ (uint64_t)fm_genericError;
+ (uint64_t)fm_timeoutError;
- (BOOL)fm_isCancelledError;
- (BOOL)fm_isTimeoutError;
@end

@implementation NSError(FMErrors)

+ (uint64_t)fm_errorWithCode:()FMErrors
{
  return [MEMORY[0x1E4F28C58] errorWithDomain:@"FMErrorDomain" code:a3 userInfo:0];
}

+ (uint64_t)fm_timeoutError
{
  return objc_msgSend(a1, "fm_errorWithCode:", 1);
}

+ (uint64_t)fm_cancelledError
{
  return [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3072 userInfo:0];
}

+ (uint64_t)fm_genericError
{
  return objc_msgSend(a1, "fm_errorWithCode:", 330669);
}

- (BOOL)fm_isTimeoutError
{
  v2 = [a1 domain];
  if ([v2 isEqualToString:@"FMErrorDomain"]) {
    BOOL v3 = [a1 code] == 1;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (BOOL)fm_isCancelledError
{
  v2 = [a1 domain];
  if ([v2 isEqualToString:*MEMORY[0x1E4F281F8]]) {
    BOOL v3 = [a1 code] == 3072;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

@end
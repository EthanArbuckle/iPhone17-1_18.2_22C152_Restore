@interface NSError(FPAdditionsGS)
+ (uint64_t)fp_GSInvalidStorageError;
- (BOOL)fp_isGSErrorWithCode:()FPAdditionsGS;
- (uint64_t)fp_isGSInvalidStorageError;
@end

@implementation NSError(FPAdditionsGS)

- (BOOL)fp_isGSErrorWithCode:()FPAdditionsGS
{
  v5 = (void *)*MEMORY[0x263F406C0];
  v6 = [a1 domain];
  if ([v5 isEqualToString:v6]) {
    BOOL v7 = [a1 code] == a3;
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (uint64_t)fp_isGSInvalidStorageError
{
  return objc_msgSend(a1, "fp_isGSErrorWithCode:", 7);
}

+ (uint64_t)fp_GSInvalidStorageError
{
  return [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F406C0] code:7 userInfo:0];
}

@end
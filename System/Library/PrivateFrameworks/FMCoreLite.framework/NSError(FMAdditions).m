@interface NSError(FMAdditions)
- (uint64_t)fm_isFileNotFoundError;
@end

@implementation NSError(FMAdditions)

- (uint64_t)fm_isFileNotFoundError
{
  v2 = [a1 domain];
  if ([v2 isEqualToString:*MEMORY[0x1E4F281F8]]) {
    BOOL v3 = [a1 code] == 260;
  }
  else {
    BOOL v3 = 0;
  }

  v4 = [a1 domain];
  if ([v4 isEqualToString:@"com.apple.icloud.FMCore.FMDataArchiver"]) {
    BOOL v5 = [a1 code] == 4;
  }
  else {
    BOOL v5 = 0;
  }

  v6 = [a1 domain];
  if ([v6 isEqualToString:*MEMORY[0x1E4F28798]]) {
    BOOL v7 = [a1 code] == 2;
  }
  else {
    BOOL v7 = 0;
  }

  return (v3 || v5) | v7;
}

@end
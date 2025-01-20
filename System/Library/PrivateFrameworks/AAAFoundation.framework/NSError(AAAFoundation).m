@interface NSError(AAAFoundation)
- (BOOL)isRecoverableError;
@end

@implementation NSError(AAAFoundation)

- (BOOL)isRecoverableError
{
  v2 = [a1 domain];
  int v3 = [v2 isEqualToString:*MEMORY[0x1E4F289A0]];

  if (v3
    && ([a1 code] == -997
     || [a1 code] == -1005
     || [a1 code] == -1001
     || [a1 code] == -1009))
  {
    return 1;
  }
  v4 = [a1 domain];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F281F8]];

  if (v5)
  {
    if ([a1 code] == 4099 || objc_msgSend(a1, "code") == 4097) {
      return 1;
    }
  }
  v6 = [a1 domain];
  int v7 = [v6 isEqualToString:@"CKErrorDomain"];

  return v7 && ([a1 code] == 3 || objc_msgSend(a1, "code") == 4);
}

@end
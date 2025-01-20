@interface NSError(FBKSErrorDomain)
- (uint64_t)isFBKErrorWithCode:()FBKSErrorDomain;
@end

@implementation NSError(FBKSErrorDomain)

- (uint64_t)isFBKErrorWithCode:()FBKSErrorDomain
{
  if ([a1 code] != a3) {
    return 0;
  }
  v4 = [a1 domain];
  uint64_t v5 = [v4 isEqualToString:*MEMORY[0x263F3C620]];

  return v5;
}

@end
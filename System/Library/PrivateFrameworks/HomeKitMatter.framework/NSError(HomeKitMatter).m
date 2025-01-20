@interface NSError(HomeKitMatter)
+ (uint64_t)hmmtrErrorWithCode:()HomeKitMatter;
- (uint64_t)hmmtr_isMatterError;
- (uint64_t)isHMMTRError;
@end

@implementation NSError(HomeKitMatter)

- (uint64_t)isHMMTRError
{
  v1 = [a1 domain];
  uint64_t v2 = [v1 isEqualToString:@"HMMTRErrorDomain"];

  return v2;
}

- (uint64_t)hmmtr_isMatterError
{
  v1 = [a1 domain];
  uint64_t v2 = [v1 isEqualToString:*MEMORY[0x263F10BB0]];

  return v2;
}

+ (uint64_t)hmmtrErrorWithCode:()HomeKitMatter
{
  return [MEMORY[0x263F087E8] errorWithDomain:@"HMMTRErrorDomain" code:a3 userInfo:0];
}

@end
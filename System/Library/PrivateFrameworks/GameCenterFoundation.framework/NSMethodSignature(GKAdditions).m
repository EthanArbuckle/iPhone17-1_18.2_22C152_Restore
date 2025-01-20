@interface NSMethodSignature(GKAdditions)
- (BOOL)_gkTakesBlockAtIndex:()GKAdditions;
- (uint64_t)_gkHasReplyBlock;
@end

@implementation NSMethodSignature(GKAdditions)

- (BOOL)_gkTakesBlockAtIndex:()GKAdditions
{
  return [a1 numberOfArguments] > a3
      && strncmp((const char *)[a1 getArgumentTypeAtIndex:a3], "@?", 2uLL) == 0;
}

- (uint64_t)_gkHasReplyBlock
{
  uint64_t v2 = [a1 numberOfArguments] - 1;

  return [a1 _gkTakesBlockAtIndex:v2];
}

@end
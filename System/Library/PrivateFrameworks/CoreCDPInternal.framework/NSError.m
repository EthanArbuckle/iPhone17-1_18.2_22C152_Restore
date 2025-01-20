@interface NSError
@end

@implementation NSError

uint64_t __73__NSError_Authentication__isAuthenticationErrorIncludingUnderlyingErrors__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isAuthenticationError];
}

@end
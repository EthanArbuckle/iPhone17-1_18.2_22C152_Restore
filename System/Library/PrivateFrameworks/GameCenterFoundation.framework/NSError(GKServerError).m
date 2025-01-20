@interface NSError(GKServerError)
- (uint64_t)gkIsServerUnauthenticatedError;
- (uint64_t)gkRequiresCredentialRenewal;
- (uint64_t)isGKCompoundError;
@end

@implementation NSError(GKServerError)

- (uint64_t)isGKCompoundError
{
  if ([a1 code] != 5020) {
    return 0;
  }
  if ([a1 isGKServerError]) {
    return 1;
  }

  return [a1 isGKClientError];
}

- (uint64_t)gkIsServerUnauthenticatedError
{
  if ([a1 code] != 5000) {
    return 0;
  }
  v2 = [a1 domain];
  uint64_t v3 = [v2 isEqualToString:@"GKServerErrorDomain"];

  return v3;
}

- (uint64_t)gkRequiresCredentialRenewal
{
  if (![a1 gkIsUnauthenticatedError]) {
    return 0;
  }
  v2 = [a1 userInfo];
  uint64_t v3 = [v2 objectForKey:*MEMORY[0x1E4F28A50]];

  if (!v3) {
    return 0;
  }
  uint64_t v4 = [v3 gkIsServerUnauthenticatedError];

  return v4;
}

@end
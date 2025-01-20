@interface NSError(VSAdditions)
- (id)vs_secureCodingSafeError;
@end

@implementation NSError(VSAdditions)

- (id)vs_secureCodingSafeError
{
  v2 = [a1 userInfo];
  v3 = secureCodingSafeObject(v2);
  v4 = [v3 unwrapWithFallback:MEMORY[0x1E4F1CC08]];

  v5 = (void *)MEMORY[0x1E4F28C58];
  v6 = [a1 domain];
  v7 = objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, objc_msgSend(a1, "code"), v4);

  return v7;
}

@end
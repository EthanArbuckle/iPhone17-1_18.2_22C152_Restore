@interface NSInvocation(GKAdditions)
+ (void)_gkInvocationWithBlock:()GKAdditions;
- (uint64_t)_gkHasReplyBlock;
@end

@implementation NSInvocation(GKAdditions)

- (uint64_t)_gkHasReplyBlock
{
  v1 = (void *)[a1 methodSignature];

  return [v1 _gkHasReplyBlock];
}

+ (void)_gkInvocationWithBlock:()GKAdditions
{
  v4 = objc_msgSend(MEMORY[0x1E4F1CA18], "invocationWithMethodSignature:", objc_msgSend(MEMORY[0x1E4F1CA38], "signatureWithObjCTypes:", _Block_signature(aBlock)));
  [v4 setTarget:aBlock];
  return v4;
}

@end
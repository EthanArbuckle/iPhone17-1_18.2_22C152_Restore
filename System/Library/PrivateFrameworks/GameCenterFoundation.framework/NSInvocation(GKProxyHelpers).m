@interface NSInvocation(GKProxyHelpers)
- (uint64_t)_gkClearTarget;
- (uint64_t)_gkInvokeOnce;
- (uint64_t)_gkInvokeOnceWithTarget:()GKProxyHelpers;
- (uint64_t)_gkReplyHandlerInvocation;
- (unint64_t)_gkPrepareForCallWithError:()GKProxyHelpers;
- (void)_gkCallbackWithError:()GKProxyHelpers queue:;
- (void)_gkClearCopiedArguments;
- (void)_gkCopyArguments;
@end

@implementation NSInvocation(GKProxyHelpers)

- (uint64_t)_gkReplyHandlerInvocation
{
  v2 = (void *)[a1 methodSignature];
  uint64_t v3 = [v2 numberOfArguments] - 1;
  if ([v2 _gkTakesBlockAtIndex:v3]
    && (uint64_t v5 = 0, [a1 getArgument:&v5 atIndex:v3], v5))
  {
    return objc_msgSend(MEMORY[0x1E4F1CA18], "_gkInvocationWithBlock:");
  }
  else
  {
    return 0;
  }
}

- (void)_gkCopyArguments
{
  if (objc_getAssociatedObject(a1, (const void *)kGKArgumentIndexesCopied))
  {
    v2 = NSString;
    uint64_t v3 = [NSString stringWithFormat:@"Must only copy arguments once per invocation : %@", a1];
    uint64_t v4 = [v2 stringWithFormat:@"%@ (indexesCopied == nil)\n[%s (%s:%d)]", v3, "-[NSInvocation(GKProxyHelpers) _gkCopyArguments]", objc_msgSend((id)objc_msgSend((id)objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/NSInvocation+GKAdditions+NoARC.m"), "lastPathComponent"), "UTF8String"), 23];
    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v4 format];
  }
  uint64_t v5 = (void *)[MEMORY[0x1E4F28E60] indexSet];
  v6 = (void *)[a1 methodSignature];
  unint64_t v7 = [v6 numberOfArguments];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2 * v7];
  if (v7 >= 3)
  {
    for (uint64_t i = 2; i != v7; ++i)
    {
      if (*(unsigned char *)[v6 getArgumentTypeAtIndex:i] == 64)
      {
        id v11 = 0;
        [a1 getArgument:&v11 atIndex:i];
        if ([v11 conformsToProtocol:&unk_1F1E81110])
        {
          [v5 addIndex:i];
          uint64_t v10 = 0;
          uint64_t v10 = [v11 copy];
          [a1 setArgument:&v10 atIndex:i];
          [v8 addObject:v10];
        }
      }
    }
  }
  objc_setAssociatedObject(a1, (const void *)kGKArgumentIndexesCopied, v5, (void *)0x301);
  [a1 retainArguments];
}

- (uint64_t)_gkInvokeOnceWithTarget:()GKProxyHelpers
{
  [a1 _gkClearTarget];
  [a1 invokeWithTarget:a3];

  return [a1 _gkClearTarget];
}

- (uint64_t)_gkClearTarget
{
  uint64_t v2 = [MEMORY[0x1E4F1CA98] null];

  return [a1 setTarget:v2];
}

- (uint64_t)_gkInvokeOnce
{
  [a1 invoke];

  return [a1 _gkClearTarget];
}

- (void)_gkClearCopiedArguments
{
  id AssociatedObject = objc_getAssociatedObject(a1, (const void *)kGKArgumentIndexesCopied);
  if (!AssociatedObject)
  {
    uint64_t v3 = NSString;
    uint64_t v4 = [NSString stringWithFormat:@"Must release arguments only once per invocation for which _gkCopyArguments has been called : %@", a1];
    uint64_t v5 = [v3 stringWithFormat:@"%@ (indexesCopied != nil)\n[%s (%s:%d)]", v4, "-[NSInvocation(GKProxyHelpers) _gkClearCopiedArguments]", objc_msgSend((id)objc_msgSend((id)objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/NSInvocation+GKAdditions+NoARC.m"), "lastPathComponent"), "UTF8String"), 60];
    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v5 format];
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__NSInvocation_GKProxyHelpers___gkClearCopiedArguments__block_invoke;
  v6[3] = &unk_1E6470D40;
  v6[4] = a1;
  [AssociatedObject enumerateIndexesUsingBlock:v6];
  objc_setAssociatedObject(a1, (const void *)kGKArgumentIndexesCopied, 0, (void *)0x301);
}

- (void)_gkCallbackWithError:()GKProxyHelpers queue:
{
  objc_msgSend(a1, "_gkPrepareForCallWithError:");
  [a1 retainArguments];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__NSInvocation_GKProxyHelpers___gkCallbackWithError_queue___block_invoke;
  block[3] = &unk_1E646E210;
  block[4] = a1;
  dispatch_async(a4, block);
}

- (unint64_t)_gkPrepareForCallWithError:()GKProxyHelpers
{
  uint64_t v15 = a3;
  uint64_t v4 = (void *)[a1 methodSignature];
  unint64_t result = objc_msgSend(v4, "numberOfArguments", 0);
  unint64_t v6 = result - 3;
  if (result >= 3)
  {
    uint64_t v7 = 0;
    unint64_t v8 = result - 1;
    unint64_t v9 = result - 2;
    do
    {
      uint64_t v10 = (unsigned char *)[v4 getArgumentTypeAtIndex:v7 + 2];
      if (v6 == v7 && *v10 == 64)
      {
        id v11 = &v15;
        v12 = a1;
        unint64_t v13 = v8;
      }
      else
      {
        id v11 = &v14;
        v12 = a1;
        unint64_t v13 = v7 + 2;
      }
      unint64_t result = [v12 setArgument:v11 atIndex:v13];
      ++v7;
    }
    while (v9 != v7);
  }
  return result;
}

@end
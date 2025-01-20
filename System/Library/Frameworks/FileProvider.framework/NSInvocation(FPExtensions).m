@interface NSInvocation(FPExtensions)
- (void)fp_sanitizeError;
- (void)fp_transformArgumentAtIndex:()FPExtensions withBlock:;
- (void)fp_zeroOutReplyBlockArgumentsWithError:()FPExtensions;
@end

@implementation NSInvocation(FPExtensions)

- (void)fp_sanitizeError
{
  id v5 = [a1 methodSignature];
  uint64_t v2 = [v5 numberOfArguments];
  if (v2)
  {
    uint64_t v3 = v2;
    for (uint64_t i = 0; i != v3; ++i)
    {
      if (!strncmp((const char *)[v5 getArgumentTypeAtIndex:i], "@\"NSError\", 0xAuLL))objc_msgSend(a1, "fp_transformArgumentAtIndex:withBlock:"", i, &__block_literal_global_37); {
    }
      }
  }
}

- (void)fp_transformArgumentAtIndex:()FPExtensions withBlock:
{
  v6 = a4;
  v12 = 0;
  [a1 getArgument:&v12 atIndex:a3];
  if (v12)
  {
    v7 = v6[2](v6);
    if (v7 != v12)
    {
      id v8 = a1;
      id v9 = v7;
      id v10 = v8;
      objc_sync_enter(v10);
      v11 = objc_getAssociatedObject(v10, &retainedArgumentsKey);
      if (!v11)
      {
        v11 = [MEMORY[0x1E4F1CA48] array];
        objc_setAssociatedObject(v10, &retainedArgumentsKey, v11, (void *)0x301);
      }
      id v13 = v9;
      [v10 setArgument:&v13 atIndex:a3];
      [v11 addObject:v9];

      objc_sync_exit(v10);
    }
  }
}

- (void)fp_zeroOutReplyBlockArgumentsWithError:()FPExtensions
{
  v10[1] = *(id *)MEMORY[0x1E4F143B8];
  v10[0] = a3;
  v4 = [a1 methodSignature];
  unint64_t v5 = [v4 numberOfArguments];
  size_t v6 = [v4 frameLength];
  v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v7, v6);
  bzero(v7, [v4 frameLength]);
  if (v5 >= 2)
  {
    for (uint64_t i = 1; i != v5; ++i)
      [a1 setArgument:v7 atIndex:i];
  }
  uint64_t v9 = objc_msgSend(v4, "fp_indexOfLastArgumentWithType:", "@\"NSError\"");
  if (v9 != 0x7FFFFFFFFFFFFFFFLL) {
    [a1 setArgument:v10 atIndex:v9];
  }
}

@end
@interface NSObject(GKAdditions)
- (id)_gkInvokeSelector:()GKAdditions withNullableObject:;
- (uint64_t)_gkInvokeSelector:()GKAdditions;
- (uint64_t)_gkPerformSelector:()GKAdditions;
- (void)_gkPerformSelector:()GKAdditions withNullableObject:;
- (void)_gkPerformSelector:()GKAdditions withObject:withObject:;
- (void)_gkPerformSelector:()GKAdditions withObjects:;
@end

@implementation NSObject(GKAdditions)

- (uint64_t)_gkPerformSelector:()GKAdditions
{
  return [a1 _gkPerformSelector:a3 withNullableObject:0];
}

- (void)_gkPerformSelector:()GKAdditions withNullableObject:
{
  id v8 = a4;
  v6 = [(id)objc_opt_class() instanceMethodSignatureForSelector:a3];
  v7 = [MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v6];
  [v7 setSelector:a3];
  if (v8 && (unint64_t)[v6 numberOfArguments] >= 3) {
    [v7 setArgument:&v8 atIndex:2];
  }
  [v7 setTarget:a1];
  [v7 retainArguments];
  [v7 invoke];
}

- (void)_gkPerformSelector:()GKAdditions withObject:withObject:
{
  id v12 = a4;
  id v8 = a5;
  id v11 = v8;
  v9 = [(id)objc_opt_class() instanceMethodSignatureForSelector:a3];
  v10 = [MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v9];
  [v10 setSelector:a3];
  if (v12)
  {
    if ((unint64_t)objc_msgSend(v9, "numberOfArguments", v11, v12) >= 3)
    {
      [v10 setArgument:&v12 atIndex:2];
      if (v8)
      {
        if ((unint64_t)[v9 numberOfArguments] >= 4) {
          [v10 setArgument:&v11 atIndex:3];
        }
      }
    }
  }
  objc_msgSend(v10, "setTarget:", a1, v11);
  [v10 retainArguments];
  [v10 invoke];
}

- (void)_gkPerformSelector:()GKAdditions withObjects:
{
  id v6 = a4;
  v7 = [(id)objc_opt_class() instanceMethodSignatureForSelector:a3];
  id v8 = [MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v7];
  [v8 setSelector:a3];
  if ([v6 count])
  {
    unint64_t v9 = 2;
    do
    {
      id v12 = [v6 objectAtIndex:v9 - 2];
      if (v12 && [v7 numberOfArguments] > v9) {
        [v8 setArgument:&v12 atIndex:v9];
      }

      unint64_t v10 = [v6 count];
      unint64_t v11 = v9++ - 1;
    }
    while (v10 > v11);
  }
  [v8 setTarget:a1];
  [v8 retainArguments];
  [v8 invoke];
}

- (uint64_t)_gkInvokeSelector:()GKAdditions
{
  return [a1 _gkInvokeSelector:a3 withNullableObject:0];
}

- (id)_gkInvokeSelector:()GKAdditions withNullableObject:
{
  id v11 = a4;
  id v6 = [(id)objc_opt_class() instanceMethodSignatureForSelector:a3];
  v7 = [MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v6];
  [v7 setSelector:a3];
  if (v11 && (unint64_t)[v6 numberOfArguments] >= 3) {
    [v7 setArgument:&v11 atIndex:2];
  }
  [v7 setTarget:a1];
  [v7 retainArguments];
  [v7 invoke];
  id v10 = 0;
  [v7 getReturnValue:&v10];
  id v8 = v10;

  return v8;
}

@end
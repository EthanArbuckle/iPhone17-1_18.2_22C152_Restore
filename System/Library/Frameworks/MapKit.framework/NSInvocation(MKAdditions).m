@interface NSInvocation(MKAdditions)
+ (id)_mapkit_invocationWithSelector:()MKAdditions target:;
+ (id)_mapkit_invocationWithSelector:()MKAdditions target:arguments:;
@end

@implementation NSInvocation(MKAdditions)

+ (id)_mapkit_invocationWithSelector:()MKAdditions target:
{
  v9 = objc_msgSend(a1, "_mapkit_invocationWithSelector:target:arguments:", a3, a4, &a9);

  return v9;
}

+ (id)_mapkit_invocationWithSelector:()MKAdditions target:arguments:
{
  id v7 = a4;
  v16 = a5;
  v8 = [v7 methodSignatureForSelector:a3];
  unint64_t v9 = [v8 numberOfArguments];
  v10 = [MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v8];
  [v10 setTarget:v7];
  [v10 setSelector:a3];
  [v10 retainArguments];
  if (v9 >= 3)
  {
    unint64_t v11 = v9 - 2;
    uint64_t v12 = 0x200000000;
    do
    {
      v13 = v16++;
      uint64_t v15 = *v13;
      [v10 setArgument:&v15 atIndex:v12 >> 32];
      v12 += 0x100000000;
      --v11;
    }
    while (v11);
  }

  return v10;
}

@end
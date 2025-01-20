@interface BMDSLTransformInvocation
+ (id)invokeTransformWithInput:(id)a3 selector:(SEL)a4 target:(id)a5;
@end

@implementation BMDSLTransformInvocation

+ (id)invokeTransformWithInput:(id)a3 selector:(SEL)a4 target:(id)a5
{
  id v7 = a3;
  id v26 = v7;
  id v8 = a5;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (objc_opt_respondsToSelector())
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = &stru_1F0B32A50;
    }
    v21 = NSString;
    v22 = NSStringFromSelector(a4);
    uint64_t v23 = [v21 stringWithFormat:@"Target %@ does not have selector %@", v17, v22];

    v18 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v19 = *MEMORY[0x1E4F1C3B8];
    v20 = (__CFString *)v23;
LABEL_19:
    id v24 = [v18 exceptionWithName:v19 reason:v20 userInfo:0];
    objc_exception_throw(v24);
  }
  v9 = [v8 methodSignatureForSelector:a4];
  v10 = [MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v9];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v7;
    uint64_t v12 = [v11 count];
    if (v12 == [v9 numberOfArguments] - 2)
    {
      if ([v11 count])
      {
        unint64_t v13 = 0;
        do
        {
          id v25 = [v11 objectAtIndex:v13];
          [v10 setArgument:&v25 atIndex:v13 + 2];

          ++v13;
        }
        while ([v11 count] > v13);
      }

      goto LABEL_11;
    }
    goto LABEL_16;
  }
  if ([v9 numberOfArguments] == 3)
  {
    [v10 setArgument:&v26 atIndex:2];
    goto LABEL_11;
  }
  if ([v9 numberOfArguments] != 2)
  {
LABEL_16:
    v18 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v19 = *MEMORY[0x1E4F1C3B8];
    v20 = @"Invalid transform arguments.";
    goto LABEL_19;
  }
LABEL_11:
  [v10 setTarget:v8];
  [v10 setSelector:a4];
  [v10 invoke];
  id v25 = 0;
  [v10 getReturnValue:&v25];
  id v14 = v25;

  return v14;
}

@end
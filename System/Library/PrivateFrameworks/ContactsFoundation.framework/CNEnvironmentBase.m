@interface CNEnvironmentBase
+ (char)environmentStackKey;
+ (id)currentEnvironment;
+ (id)currentEnvironmentForKey:(void *)a3;
+ (id)defaultEnvironment;
+ (id)defaultStack;
+ (id)effectiveReadingStackForKey:(void *)a3;
+ (id)effectiveWritingStackForKey:(void *)a3;
- (void)becomeCurrent;
- (void)resignCurrent;
@end

@implementation CNEnvironmentBase

+ (id)currentEnvironmentForKey:(void *)a3
{
  v4 = [(id)objc_opt_class() effectiveReadingStackForKey:a3];
  id v5 = [v4 peek];
  v6 = v5;
  if (!v5)
  {
    v6 = [a1 defaultEnvironment];
  }

  return v6;
}

+ (id)effectiveReadingStackForKey:(void *)a3
{
  dispatch_get_specific(a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    dispatch_queue_get_specific(MEMORY[0x1E4F14428], a3);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    v6 = v7;
    if (!v7)
    {
      v6 = [a1 defaultStack];
    }
  }

  return v6;
}

+ (id)defaultStack
{
  if (defaultStack_cn_once_token_1 != -1) {
    dispatch_once(&defaultStack_cn_once_token_1, &__block_literal_global_78);
  }
  v3 = NSString;
  id v4 = (id)defaultStack_cn_once_object_1;
  id v5 = objc_msgSend(v3, "stringWithUTF8String:", objc_msgSend(a1, "environmentStackKey"));
  v6 = [v4 objectForKey:v5 onCacheMiss:&__block_literal_global_5_2];

  return v6;
}

+ (id)currentEnvironment
{
  uint64_t v3 = [a1 environmentStackKey];

  return (id)[a1 currentEnvironmentForKey:v3];
}

CNStack *__33__CNEnvironmentBase_defaultStack__block_invoke_2()
{
  v0 = objc_alloc_init(CNStack);

  return v0;
}

uint64_t __33__CNEnvironmentBase_defaultStack__block_invoke()
{
  defaultStack_cn_once_object_1 = +[CNCache atomicCache];

  return MEMORY[0x1F41817F8]();
}

+ (id)defaultEnvironment
{
  CNAbstractMethodException(a1, a2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

+ (id)effectiveWritingStackForKey:(void *)a3
{
  dispatch_get_specific(a3);
  id v4 = (CNStack *)(id)objc_claimAutoreleasedReturnValue();
  id v5 = v4;
  if (!v4)
  {
    id v5 = objc_alloc_init(CNStack);
    v6 = dispatch_get_current_queue();
    dispatch_queue_set_specific(v6, a3, v5, 0);
    objc_setAssociatedObject(v6, a3, v5, (void *)0x301);
  }

  return v5;
}

+ (char)environmentStackKey
{
  CNAbstractMethodException(a1, a2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)becomeCurrent
{
  uint64_t v3 = objc_opt_class();
  objc_msgSend(v3, "effectiveWritingStackForKey:", objc_msgSend((id)objc_opt_class(), "environmentStackKey"));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 push:self];
}

- (void)resignCurrent
{
  uint64_t v3 = objc_opt_class();
  objc_msgSend(v3, "effectiveReadingStackForKey:", objc_msgSend((id)objc_opt_class(), "environmentStackKey"));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 removeObject:self];
}

- (void).cxx_destruct
{
}

@end
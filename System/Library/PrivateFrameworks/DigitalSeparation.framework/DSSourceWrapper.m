@interface DSSourceWrapper
+ (BOOL)shouldEnumerateResourceNamesForSource:(id)a3;
+ (id)wrapMultiSource:(id)a3;
+ (void)initialize;
@end

@implementation DSSourceWrapper

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    DSLog_4 = (uint64_t)os_log_create("com.apple.DigitalSeparation", "DSSourceWrapper");
    MEMORY[0x270F9A758]();
  }
}

+ (BOOL)shouldEnumerateResourceNamesForSource:(id)a3
{
  id v3 = a3;
  if ([v3 conformsToProtocol:&unk_26E976708])
  {
    v4 = [v3 resourceNames];
    BOOL v5 = (unint64_t)[v4 count] > 1;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

+ (id)wrapMultiSource:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263EFF9A0] dictionary];
  if (+[DSSourceWrapper shouldEnumerateResourceNamesForSource:v3])
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id obj = [v3 resourceNames];
    uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          id v10 = [[DSSubSource alloc] init:v3 withResourceName:v9];
          [v4 setObject:v10 forKeyedSubscript:v9];

          v11 = (void *)DSLog_4;
          if (os_log_type_enabled((os_log_t)DSLog_4, OS_LOG_TYPE_DEFAULT))
          {
            v12 = v11;
            v13 = [v3 name];
            *(_DWORD *)buf = 138543618;
            uint64_t v22 = v9;
            __int16 v23 = 2114;
            v24 = v13;
            _os_log_impl(&dword_236090000, v12, OS_LOG_TYPE_DEFAULT, "Adding sharing sub source for %{public}@ from %{public}@", buf, 0x16u);
          }
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v6);
    }
  }
  else
  {
    v14 = (void *)DSLog_4;
    if (os_log_type_enabled((os_log_t)DSLog_4, OS_LOG_TYPE_ERROR)) {
      +[DSSourceWrapper wrapMultiSource:](v14, v3);
    }
  }

  return v4;
}

+ (void)wrapMultiSource:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a1;
  v4 = [a2 name];
  int v5 = 138543362;
  uint64_t v6 = v4;
  _os_log_error_impl(&dword_236090000, v3, OS_LOG_TYPE_ERROR, "%{public}@ does not satisfy constraints to use DSResourceName", (uint8_t *)&v5, 0xCu);
}

@end
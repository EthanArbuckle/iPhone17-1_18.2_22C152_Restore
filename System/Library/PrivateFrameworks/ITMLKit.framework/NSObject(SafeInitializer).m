@interface NSObject(SafeInitializer)
+ (id)ik_invocationForSelectorCandidates:()SafeInitializer;
+ (id)ik_invocationforSelectorString:()SafeInitializer argumentsPointerValue:;
- (BOOL)ik_initInvocation:()SafeInitializer;
- (id)ik_initWithInitializers:()SafeInitializer;
- (id)ik_initWithSelectorString:()SafeInitializer arguments:;
@end

@implementation NSObject(SafeInitializer)

- (BOOL)ik_initInvocation:()SafeInitializer
{
  id v4 = a3;
  v5 = v4;
  BOOL v6 = 0;
  if (v4)
  {
    [v4 retainArguments];
    [v5 invokeWithTarget:a1];
    uint64_t v8 = 0;
    [v5 getReturnValue:&v8];
    if (v8) {
      BOOL v6 = 1;
    }
  }

  return v6;
}

- (id)ik_initWithSelectorString:()SafeInitializer arguments:
{
  id v6 = a3;
  v7 = objc_opt_class();
  uint64_t v8 = [MEMORY[0x1E4F29238] valueWithPointer:a4];
  v9 = objc_msgSend(v7, "ik_invocationforSelectorString:argumentsPointerValue:", v6, v8);

  if (objc_msgSend(a1, "ik_initInvocation:", v9))
  {
    id v10 = a1;
  }
  else
  {
    v11 = ITMLKitGetLogObject(5);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[NSObject(SafeInitializer) ik_initWithSelectorString:arguments:]();
    }

    id v10 = 0;
  }

  return v10;
}

- (id)ik_initWithInitializers:()SafeInitializer
{
  id v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(), "ik_invocationForSelectorCandidates:", v4);
  if (objc_msgSend(a1, "ik_initInvocation:", v5))
  {
    id v6 = a1;
  }
  else
  {
    v7 = ITMLKitGetLogObject(5);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      [(NSObject(SafeInitializer) *)(uint64_t)a1 ik_initWithInitializers:v7];
    }

    id v6 = 0;
  }

  return v6;
}

+ (id)ik_invocationForSelectorCandidates:()SafeInitializer
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v14 != v6) {
        objc_enumerationMutation(v3);
      }
      uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * v7);
      v9 = objc_opt_class();
      id v10 = objc_msgSend(v3, "objectForKey:", v8, (void)v13);
      v11 = objc_msgSend(v9, "ik_invocationforSelectorString:argumentsPointerValue:", v8, v10);

      if (v11) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v11 = 0;
  }

  return v11;
}

+ (id)ik_invocationforSelectorString:()SafeInitializer argumentsPointerValue:
{
  uint64_t v5 = a3;
  id v6 = a4;
  SEL v7 = NSSelectorFromString(v5);
  if ([(id)objc_opt_class() instancesRespondToSelector:v7])
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CA18];
    v9 = [(id)objc_opt_class() instanceMethodSignatureForSelector:v7];
    id v10 = [v8 invocationWithMethodSignature:v9];

    if (v10)
    {
      [v10 setSelector:v7];
      uint64_t v11 = [v6 pointerValue];
      if (v11)
      {
        uint64_t v12 = v11;
        long long v13 = [v10 methodSignature];
        uint64_t v14 = [v13 numberOfArguments];

        if (v14 != 2)
        {
          unint64_t v15 = 0;
          do
          {
            [v10 setArgument:*(void *)(v12 + 8 * v15) atIndex:v15 + 2];
            ++v15;
            long long v16 = [v10 methodSignature];
            unint64_t v17 = [v16 numberOfArguments] - 2;
          }
          while (v17 > v15);
        }
      }
    }
  }
  else
  {
    uint64_t v18 = ITMLKitGetLogObject(5);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      +[NSObject(SafeInitializer) ik_invocationforSelectorString:argumentsPointerValue:]();
    }

    id v10 = 0;
  }

  return v10;
}

- (void)ik_initWithSelectorString:()SafeInitializer arguments:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7(&dword_1E2ACE000, v0, v1, "No init invocation selector \"%@\" exists for %@");
}

- (void)ik_initWithInitializers:()SafeInitializer .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a2 allKeys];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  v9 = v5;
  _os_log_debug_impl(&dword_1E2ACE000, a3, OS_LOG_TYPE_DEBUG, "No init invocation selector exists for %@ -> %@", (uint8_t *)&v6, 0x16u);
}

+ (void)ik_invocationforSelectorString:()SafeInitializer argumentsPointerValue:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7(&dword_1E2ACE000, v0, v1, "No invocation selector \"%@\" exists for %@");
}

@end
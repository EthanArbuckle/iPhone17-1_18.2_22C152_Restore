@interface DOCUISession
+ (NSString)defaultContentSizeCategory;
+ (UIWindow)anyWindowPreferingKeyWindow;
+ (UIWindow)keyWindow;
+ (id)shared;
+ (id)windowWithRootViewController:(id)a3;
+ (void)performAfterCATransactionCommits:(id)a3;
@end

@implementation DOCUISession

+ (UIWindow)keyWindow
{
  return (UIWindow *)[(id)*MEMORY[0x263F83300] keyWindow];
}

+ (void)performAfterCATransactionCommits:(id)a3
{
}

+ (id)shared
{
  if (shared_onceToken != -1) {
    dispatch_once(&shared_onceToken, &__block_literal_global_0);
  }
  return 0;
}

uint64_t __22__DOCUISession_shared__block_invoke()
{
  v0 = objc_alloc_init(DOCUISession);
  uint64_t v1 = shared_session;
  shared_session = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (NSString)defaultContentSizeCategory
{
  return (NSString *)[(id)*MEMORY[0x263F83300] preferredContentSizeCategory];
}

+ (UIWindow)anyWindowPreferingKeyWindow
{
  v2 = [a1 keyWindow];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    v5 = [(id)*MEMORY[0x263F83300] windows];
    id v4 = [v5 firstObject];
  }
  return (UIWindow *)v4;
}

+ (id)windowWithRootViewController:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = objc_msgSend((id)*MEMORY[0x263F83300], "windows", 0);
  id v5 = (id)[v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        id v9 = [v8 rootViewController];

        if (v9 == v3)
        {
          id v5 = v8;
          goto LABEL_11;
        }
      }
      id v5 = (id)[v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

@end
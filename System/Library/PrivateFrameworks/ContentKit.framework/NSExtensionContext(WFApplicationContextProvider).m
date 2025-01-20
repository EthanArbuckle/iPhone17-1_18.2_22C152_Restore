@interface NSExtensionContext(WFApplicationContextProvider)
- (BOOL)shouldReverseLayoutDirection;
- (id)bundleForWFApplicationContext:()WFApplicationContextProvider;
- (id)currentUserInterfaceTypeForWFApplicationContext:()WFApplicationContextProvider;
- (id)extensionApplicationContextProviderDelegate;
- (id)keyWindowForWFApplicationContext:()WFApplicationContextProvider;
- (id)notificationNameForApplicationStateEvent:()WFApplicationContextProvider applicationContext:;
- (uint64_t)applicationForWFApplicationContext:()WFApplicationContextProvider;
- (void)setExtensionApplicationContextProviderDelegate:()WFApplicationContextProvider;
@end

@implementation NSExtensionContext(WFApplicationContextProvider)

- (BOOL)shouldReverseLayoutDirection
{
  v1 = [a1 extensionApplicationContextProviderDelegate];
  v2 = [v1 extensionViewController];
  v3 = [v2 view];
  BOOL v4 = [v3 effectiveUserInterfaceLayoutDirection] == 1;

  return v4;
}

- (uint64_t)applicationForWFApplicationContext:()WFApplicationContextProvider
{
  return 0;
}

- (id)keyWindowForWFApplicationContext:()WFApplicationContextProvider
{
  v1 = [a1 extensionApplicationContextProviderDelegate];
  v2 = [v1 extensionViewController];
  v3 = [v2 view];
  BOOL v4 = [v3 window];

  return v4;
}

- (void)setExtensionApplicationContextProviderDelegate:()WFApplicationContextProvider
{
  BOOL v4 = (void *)MEMORY[0x263F088B0];
  id v5 = a3;
  id value = [v4 weakObjectsHashTable];
  [value addObject:v5];

  objc_setAssociatedObject(a1, sel_extensionApplicationContextProviderDelegate, value, (void *)1);
}

- (id)extensionApplicationContextProviderDelegate
{
  v1 = objc_getAssociatedObject(a1, sel_extensionApplicationContextProviderDelegate);
  v2 = [v1 anyObject];

  return v2;
}

- (id)notificationNameForApplicationStateEvent:()WFApplicationContextProvider applicationContext:
{
  BOOL v4 = [a1 extensionApplicationContextProviderDelegate];
  id v5 = [v4 notificationNameForApplicationStateEvent:a3];

  return v5;
}

- (id)currentUserInterfaceTypeForWFApplicationContext:()WFApplicationContextProvider
{
  BOOL v4 = [a1 extensionApplicationContextProviderDelegate];
  if (!v4)
  {
    v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2 object:a1 file:@"NSExtensionContext+WFApplicationContextProvider.m" lineNumber:30 description:@"The extension application context provider delegate is not set."];
  }
  id v5 = [v4 currentUserInterfaceType];

  return v5;
}

- (id)bundleForWFApplicationContext:()WFApplicationContextProvider
{
  BOOL v4 = [a1 extensionApplicationContextProviderDelegate];
  if (!v4)
  {
    v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2 object:a1 file:@"NSExtensionContext+WFApplicationContextProvider.m" lineNumber:24 description:@"The extension application context provider delegate is not set."];
  }
  id v5 = [v4 bundle];

  return v5;
}

@end
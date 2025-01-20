@interface NSExtensionItem(AKExtensionItem)
+ (id)extensionItemWithAppleIDAuthenticationContext:()AKExtensionItem;
- (id)ak_context;
- (void)ak_setContext:()AKExtensionItem;
@end

@implementation NSExtensionItem(AKExtensionItem)

+ (id)extensionItemWithAppleIDAuthenticationContext:()AKExtensionItem
{
  v3 = (objc_class *)MEMORY[0x1E4F28C80];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "ak_setContext:", v4);

  return v5;
}

- (void)ak_setContext:()AKExtensionItem
{
  id v7 = a3;
  id v4 = [a1 userInfo];
  id v5 = (void *)[v4 mutableCopy];

  if (v7)
  {
    v6 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:0];
    [v5 setObject:v6 forKey:@"AKExtensionItemContext"];
  }
  else
  {
    [v5 removeObjectForKey:@"AKExtensionItemContext"];
  }
  [a1 setUserInfo:v5];
}

- (id)ak_context
{
  v1 = [a1 userInfo];
  v2 = [v1 objectForKey:@"AKExtensionItemContext"];

  if (v2)
  {
    v3 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v2 error:0];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end
@interface DDParsecServiceCollectionViewControllerGuidedAccessDictionaryLookup
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)setSections:(id)a3;
@end

@implementation DDParsecServiceCollectionViewControllerGuidedAccessDictionaryLookup

+ (id)safeCategoryTargetClassName
{
  return @"DDParsecServiceCollectionViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DDParsecServiceCollectionViewController", @"setSections:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFResultSection", @"bundleIdentifier", "@", 0);
}

- (void)setSections:(id)a3
{
  id v4 = a3;
  if (UIAccessibilityIsGuidedAccessEnabled())
  {
    v5 = +[NSMutableArray array];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          v12 = [v11 safeStringForKey:@"bundleIdentifier"];
          if ([v12 isEqualToString:@"com.apple.lookup.dictionary"]) {
            [v5 addObject:v11];
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
  else
  {
    v5 = v4;
  }
  v13.receiver = self;
  v13.super_class = (Class)DDParsecServiceCollectionViewControllerGuidedAccessDictionaryLookup;
  [(DDParsecServiceCollectionViewControllerGuidedAccessDictionaryLookup *)&v13 setSections:v5];
}

@end
@interface DDParsecNoDataViewControllerGuidedAccessDictionaryLookup
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)loadView;
@end

@implementation DDParsecNoDataViewControllerGuidedAccessDictionaryLookup

+ (id)safeCategoryTargetClassName
{
  return @"DDParsecNoDataViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DDParsecNoDataViewController", @"loadView", "v", 0);
  [v3 validateClass:@"DDParsecNoDataViewController" hasInstanceVariable:@"_container" withType:"UIView"];
}

- (void)loadView
{
  v14.receiver = self;
  v14.super_class = (Class)DDParsecNoDataViewControllerGuidedAccessDictionaryLookup;
  [(DDParsecNoDataViewControllerGuidedAccessDictionaryLookup *)&v14 loadView];
  if (UIAccessibilityIsGuidedAccessEnabled())
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v3 = [(DDParsecNoDataViewControllerGuidedAccessDictionaryLookup *)self safeUIViewForKey:@"_container", 0];
    v4 = [v3 subviews];

    id v5 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = *(void **)(*((void *)&v10 + 1) + 8 * (void)v8);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v9 setEnabled:0];
          }
          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
      }
      while (v6);
    }
  }
}

@end
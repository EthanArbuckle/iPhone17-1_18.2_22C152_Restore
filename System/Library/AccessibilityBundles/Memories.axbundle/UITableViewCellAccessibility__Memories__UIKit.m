@interface UITableViewCellAccessibility__Memories__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityElements;
@end

@implementation UITableViewCellAccessibility__Memories__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"UITableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"UICollectionViewControllerWrapperView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"subviews", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UICollectionViewControllerWrapperView", @"_collectionViewController", "@", 0);
}

- (id)accessibilityElements
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = [(UITableViewCellAccessibility__Memories__UIKit *)self accessibilityIdentification];
  int v4 = [v3 isEqualToString:@"AccessibilityMiroTitleCollectionCell"];

  if (v4)
  {
    char v23 = 0;
    objc_opt_class();
    v5 = [(UITableViewCellAccessibility__Memories__UIKit *)self safeValueForKey:@"subviews"];
    v6 = __UIAccessibilityCastAsClass();

    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          MEMORY[0x2455E2920](@"UICollectionViewControllerWrapperView");
          if (objc_opt_isKindOfClass())
          {
            char v23 = 0;
            objc_opt_class();
            v14 = [v12 safeValueForKey:@"_collectionViewController"];
            v15 = __UIAccessibilityCastAsClass();

            if (v23) {
              abort();
            }
            v16 = [v15 collectionView];
            v24 = v16;
            v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v24 count:1];

            goto LABEL_15;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v25 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)UITableViewCellAccessibility__Memories__UIKit;
  v13 = [(UITableViewCellAccessibility__Memories__UIKit *)&v18 accessibilityElements];
LABEL_15:

  return v13;
}

@end
@interface LoggingCardCarouselCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityElementsHidden;
@end

@implementation LoggingCardCarouselCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MenstrualCyclesAppPlugin.LoggingCardCarouselCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)accessibilityElementsHidden
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  char v28 = 0;
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  v3 = [v2 _accessibilityAncestorIsKindOf:objc_opt_class()];
  [v3 bounds];
  AX_CGRectGetCenter();
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  [v2 bounds];
  objc_msgSend(v3, "convertRect:fromView:", v2);
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v16 = objc_msgSend(v3, "indexPathsForVisibleItems", 0);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v25 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = [v3 cellForItemAtIndexPath:*(void *)(*((void *)&v24 + 1) + 8 * i)];
        [v21 bounds];
        objc_msgSend(v3, "convertRect:fromView:", v21);
        v31.x = v5;
        v31.y = v7;
        if (CGRectContainsPoint(v33, v31))
        {
          v34.origin.x = v9;
          v34.origin.y = v11;
          v34.size.width = v13;
          v34.size.height = v15;
          v32.x = v5;
          v32.y = v7;
          if (CGRectContainsPoint(v34, v32))
          {

            BOOL v22 = 0;
            goto LABEL_12;
          }
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v18) {
        continue;
      }
      break;
    }
  }
  BOOL v22 = 1;
LABEL_12:

  return v22;
}

@end
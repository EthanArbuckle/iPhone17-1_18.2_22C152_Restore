@interface MTUIViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityObscuredScreenAllowedViews;
@end

@implementation MTUIViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityObscuredScreenAllowedViews
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v3 = [(MTUIViewAccessibility *)self accessibilityIdentifier];
  if ([v3 isEqualToString:@"modalSearchView"])
  {
  }
  else
  {
    v4 = [(MTUIViewAccessibility *)self accessibilityIdentifier];
    int v5 = [v4 isEqualToString:@"ModalPopup"];

    if (!v5)
    {
      v21.receiver = self;
      v21.super_class = (Class)MTUIViewAccessibility;
      v8 = [(MTUIViewAccessibility *)&v21 _accessibilityObscuredScreenAllowedViews];
      goto LABEL_18;
    }
  }
  v20 = objc_getAssociatedObject(self, &MTAXSearchDelegateObject);
  v6 = [v20 safeValueForKey:@"_searchBar"];
  v7 = [MEMORY[0x263EFF980] array];
  v8 = v7;
  if (v6) {
    [v7 addObject:v6];
  }
  v9 = [(MTUIViewAccessibility *)self superview];
  v10 = [v9 subviews];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v17 = [v16 accessibilityIdentifier];
        int v18 = [v17 isEqualToString:@"DismissView"];

        if (v18)
        {
          [v8 addObject:v16];
          goto LABEL_16;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
LABEL_16:

LABEL_18:

  return v8;
}

- (BOOL)isAccessibilityElement
{
  v3 = [(MTUIViewAccessibility *)self accessibilityIdentifier];
  int v4 = [v3 isEqualToString:@"DismissView"];

  if (v4)
  {
    [(MTUIViewAccessibility *)self alpha];
    if (v5 > 0.0 && ![(MTUIViewAccessibility *)self isHidden]) {
      return 1;
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)MTUIViewAccessibility;
  return [(MTUIViewAccessibility *)&v7 isAccessibilityElement];
}

@end
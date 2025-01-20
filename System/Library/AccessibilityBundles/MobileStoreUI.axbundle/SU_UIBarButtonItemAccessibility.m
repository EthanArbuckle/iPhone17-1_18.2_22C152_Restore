@interface SU_UIBarButtonItemAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation SU_UIBarButtonItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIBarButtonItem";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__1;
  v18 = __Block_byref_object_dispose__1;
  id v19 = 0;
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  v10 = __53__SU_UIBarButtonItemAccessibility_accessibilityLabel__block_invoke;
  v11 = &unk_265138300;
  v12 = self;
  v13 = &v14;
  AXPerformSafeBlock();
  id v3 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  if ([v3 isEqualToString:@"_shareButtonAction:"])
  {
    uint64_t v4 = UIKitAccessibilityLocalizedString();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SU_UIBarButtonItemAccessibility;
    uint64_t v4 = [(SU_UIBarButtonItemAccessibility *)&v7 accessibilityLabel];
  }
  v5 = (void *)v4;

  return v5;
}

@end
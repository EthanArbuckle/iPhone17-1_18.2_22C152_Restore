@interface SBHLibraryCategoryPodIconViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (CGRect)accessibilityFrameForScrolling;
@end

@implementation SBHLibraryCategoryPodIconViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBHLibraryCategoryPodIconView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (CGRect)accessibilityFrameForScrolling
{
  v3 = [(SBHLibraryCategoryPodIconViewAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_1 startWithSelf:0];
  v4 = v3;
  if (!v3) {
    v3 = self;
  }
  [v3 accessibilityFrameForScrolling];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

uint64_t __76__SBHLibraryCategoryPodIconViewAccessibility_accessibilityFrameForScrolling__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Sbhlibrarypodi_1.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
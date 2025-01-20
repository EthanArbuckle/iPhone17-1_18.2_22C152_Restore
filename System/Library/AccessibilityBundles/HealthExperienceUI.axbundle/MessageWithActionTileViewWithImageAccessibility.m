@interface MessageWithActionTileViewWithImageAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation MessageWithActionTileViewWithImageAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HealthExperienceUI.MessageWithActionTileViewWithImage";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(MessageWithActionTileViewWithImageAccessibility *)self safeUIViewForKey:@"messageTileView"];
  v3 = [v2 accessibilityLabel];

  return v3;
}

- (CGPoint)accessibilityActivationPoint
{
  v3 = [(MessageWithActionTileViewWithImageAccessibility *)self _accessibilityFindSubviewDescendantsPassingTest:&__block_literal_global_0];
  v4 = [v3 firstObject];
  v5 = v4;
  if (v4)
  {
    [v4 accessibilityActivationPoint];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)MessageWithActionTileViewWithImageAccessibility;
    [(MessageWithActionTileViewWithImageAccessibility *)&v12 accessibilityActivationPoint];
  }
  double v8 = v6;
  double v9 = v7;

  double v10 = v8;
  double v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

uint64_t __79__MessageWithActionTileViewWithImageAccessibility_accessibilityActivationPoint__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)MessageWithActionTileViewWithImageAccessibility;
  return *MEMORY[0x263F1CEE8] | [(MessageWithActionTileViewWithImageAccessibility *)&v3 accessibilityTraits];
}

@end
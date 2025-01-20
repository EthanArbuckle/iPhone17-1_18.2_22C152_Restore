@interface TVMLKit_UICollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (_NSRange)accessibilityRowRange;
@end

@implementation TVMLKit_UICollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UICollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"TVCarouselView"];
  [v3 validateClass:@"TVCarouselView" hasInstanceVariable:@"_numberOfRealItemsForDataSource" withType:"Q"];
}

- (_NSRange)accessibilityRowRange
{
  if (accessibilityRowRange_onceToken != -1) {
    dispatch_once(&accessibilityRowRange_onceToken, &__block_literal_global_0);
  }
  v13.receiver = self;
  v13.super_class = (Class)TVMLKit_UICollectionViewCellAccessibility;
  NSUInteger v3 = (NSUInteger)[(TVMLKit_UICollectionViewCellAccessibility *)&v13 accessibilityRowRange];
  NSUInteger v5 = v4;
  objc_opt_class();
  v6 = [(TVMLKit_UICollectionViewCellAccessibility *)self _accessibilityAncestorIsKindOf:objc_opt_class()];
  v7 = __UIAccessibilityCastAsClass();

  v8 = [v7 _accessibilityAncestorIsKindOf:accessibilityRowRange_TVCarouselViewClass];
  v9 = v8;
  if (v8)
  {
    unint64_t v10 = [v8 safeUnsignedIntegerForKey:@"_numberOfRealItemsForDataSource"];
    if (v10)
    {
      v3 %= v10;
      NSUInteger v5 = v10;
    }
  }

  NSUInteger v11 = v3;
  NSUInteger v12 = v5;
  result.length = v12;
  result.location = v11;
  return result;
}

@end
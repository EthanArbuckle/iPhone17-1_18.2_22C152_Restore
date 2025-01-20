@interface MovieHorizontalCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation MovieHorizontalCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.MovieHorizontalCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.MovieHorizontalCell", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.MovieHorizontalCell", @"releaseDate", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  objc_opt_class();
  id v3 = [(MovieHorizontalCellAccessibility *)self safeValueForKey:@"releaseDate"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = AXDateStringForFormat();
  v6 = [(MovieHorizontalCellAccessibility *)self safeValueForKey:@"title"];
  v7 = __UIAXStringForVariables();

  return v7;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)MovieHorizontalCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(MovieHorizontalCellAccessibility *)&v3 accessibilityTraits];
}

@end
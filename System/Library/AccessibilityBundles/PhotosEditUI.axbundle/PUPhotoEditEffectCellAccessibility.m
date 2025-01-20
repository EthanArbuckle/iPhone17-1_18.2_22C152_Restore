@interface PUPhotoEditEffectCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation PUPhotoEditEffectCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUPhotoEditEffectCell";
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
  v2 = [(PUPhotoEditEffectCellAccessibility *)self safeValueForKey:@"_nameLabel"];
  v3 = [v2 accessibilityLabel];
  v4 = __UIAXStringForVariables();

  return v4;
}

@end
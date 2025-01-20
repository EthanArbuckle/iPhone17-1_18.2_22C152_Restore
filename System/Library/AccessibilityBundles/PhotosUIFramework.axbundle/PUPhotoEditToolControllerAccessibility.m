@interface PUPhotoEditToolControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)centerToolbarView;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation PUPhotoEditToolControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUPhotoEditToolController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)PUPhotoEditToolControllerAccessibility;
  [(PUPhotoEditToolControllerAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  v3 = [(PUPhotoEditToolControllerAccessibility *)self safeUIViewForKey:@"centerToolbarView"];
  [v3 _setAccessibilityTraitsBlock:&__block_literal_global_0];
}

uint64_t __84__PUPhotoEditToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return *MEMORY[0x263F1CEF8];
}

- (id)centerToolbarView
{
  v4.receiver = self;
  v4.super_class = (Class)PUPhotoEditToolControllerAccessibility;
  v2 = [(PUPhotoEditToolControllerAccessibility *)&v4 centerToolbarView];
  [v2 _setAccessibilityTraitsBlock:&__block_literal_global_310];

  return v2;
}

uint64_t __59__PUPhotoEditToolControllerAccessibility_centerToolbarView__block_invoke()
{
  return *MEMORY[0x263F1CEF8];
}

@end
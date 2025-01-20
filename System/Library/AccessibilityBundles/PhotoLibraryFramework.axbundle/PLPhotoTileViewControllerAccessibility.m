@interface PLPhotoTileViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_configureViews;
- (void)_setPhoto:(id)a3;
@end

@implementation PLPhotoTileViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PLPhotoTileViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_setPhoto:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PLPhotoTileViewControllerAccessibility;
  id v4 = a3;
  [(PLPhotoTileViewControllerAccessibility *)&v7 _setPhoto:v4];
  v5 = [(PLPhotoTileViewControllerAccessibility *)self safeValueForKey:@"_imageView", v7.receiver, v7.super_class];
  v6 = [v4 safeValueForKey:@"mainFileURL"];

  [v5 _accessibilitySetRetainedValue:v6 forKey:@"AXAssetURL"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)PLPhotoTileViewControllerAccessibility;
  [(PLPhotoTileViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  v3 = [(PLPhotoTileViewControllerAccessibility *)self safeValueForKey:@"_imageView"];
  NSClassFromString(&cfstr_Plexpandableim.isa);
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    AXPerformSafeBlock();
  }
}

void __84__PLPhotoTileViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) safeValueForKey:@"_modelPhoto"];
  [v1 setPhoto:v2];
}

- (void)_configureViews
{
  v3.receiver = self;
  v3.super_class = (Class)PLPhotoTileViewControllerAccessibility;
  [(PLPhotoTileViewControllerAccessibility *)&v3 _configureViews];
  [(PLPhotoTileViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end
@interface PUWallpaperPosterEditorControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_photoPickerAction;
@end

@implementation PUWallpaperPosterEditorControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUWallpaperPosterEditorController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUWallpaperPosterEditorController", @"posterConfiguration", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUWallpaperPosterEditorController", @"_photoPickerAction", "@", 0);
}

- (id)_photoPickerAction
{
  v8.receiver = self;
  v8.super_class = (Class)PUWallpaperPosterEditorControllerAccessibility;
  id v3 = [(PUWallpaperPosterEditorControllerAccessibility *)&v8 _photoPickerAction];
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __68__PUWallpaperPosterEditorControllerAccessibility__photoPickerAction__block_invoke;
  v5[3] = &unk_2650A7D50;
  objc_copyWeak(&v6, &location);
  [v3 setAccessibilityLabelBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

  return v3;
}

id __68__PUWallpaperPosterEditorControllerAccessibility__photoPickerAction__block_invoke(uint64_t a1)
{
  objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained safeValueForKey:@"posterConfiguration"];
  v4 = __UIAccessibilityCastAsClass();

  if ([v4 configurationType] == 1) {
    v5 = @"wallpaper.poster.album.picker.label";
  }
  else {
    v5 = @"wallpaper.poster.photo.picker.label";
  }
  id v6 = accessibilityPULocalizedString(v5);

  return v6;
}

@end
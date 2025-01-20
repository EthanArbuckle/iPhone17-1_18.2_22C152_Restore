@interface PBFPosterGalleryPreviewViewController_InvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillMoveToWindow:(id)a3;
@end

@implementation PBFPosterGalleryPreviewViewController_InvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PBFPosterGalleryPreviewViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)viewWillMoveToWindow:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PBFPosterGalleryPreviewViewController_InvertColorsAccessibility;
  id v3 = a3;
  [(PBFPosterGalleryPreviewViewController_InvertColorsAccessibility *)&v4 viewWillMoveToWindow:v3];
  objc_msgSend(v3, "_accessibilitySetBoolValue:forKey:", 1, @"galleryVisible", v4.receiver, v4.super_class);
  +[AXInvertColorsManager toggleDarkModeWindowInvert:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PBFPosterGalleryPreviewViewController_InvertColorsAccessibility;
  [(PBFPosterGalleryPreviewViewController_InvertColorsAccessibility *)&v6 viewWillDisappear:a3];
  objc_super v4 = [(PBFPosterGalleryPreviewViewController_InvertColorsAccessibility *)self safeUIViewForKey:@"view"];
  v5 = [v4 window];

  [v5 _accessibilitySetBoolValue:0 forKey:@"galleryVisible"];
  +[AXInvertColorsManager toggleDarkModeWindowInvert:v5];
}

@end
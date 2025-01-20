@interface SBSUIWallpaperPreviewViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (SBSUIWallpaperPreviewViewAccessibility)initWithFrame:(CGRect)a3 wallpaperView:(id)a4 disableParallax:(BOOL)a5;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation SBSUIWallpaperPreviewViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBSUIWallpaperPreviewView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBSUIWallpaperPreviewView" hasInstanceVariable:@"_parallaxButton" withType:"UIButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSUIWallpaperPreviewView", @"initWithFrame:wallpaperView:disableParallax:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSUIWallpaperPreviewView", @"irisButton", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)SBSUIWallpaperPreviewViewAccessibility;
  [(SBSUIWallpaperPreviewViewAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  id v3 = accessibilitySBLocalizedString(@"parallax.effect.button.for.wallpaper");
  v4 = [(SBSUIWallpaperPreviewViewAccessibility *)self safeUIViewForKey:@"_parallaxButton"];
  [v4 setAccessibilityLabel:v3];

  v5 = accessibilitySBLocalizedString(@"live.photo.button.for.wallpaper");
  v6 = [(SBSUIWallpaperPreviewViewAccessibility *)self safeUIViewForKey:@"irisButton"];
  [v6 setAccessibilityLabel:v5];
}

- (SBSUIWallpaperPreviewViewAccessibility)initWithFrame:(CGRect)a3 wallpaperView:(id)a4 disableParallax:(BOOL)a5
{
  v7.receiver = self;
  v7.super_class = (Class)SBSUIWallpaperPreviewViewAccessibility;
  v5 = -[SBSUIWallpaperPreviewViewAccessibility initWithFrame:wallpaperView:disableParallax:](&v7, sel_initWithFrame_wallpaperView_disableParallax_, a4, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(SBSUIWallpaperPreviewViewAccessibility *)v5 _accessibilityLoadAccessibilityInformation];

  return v5;
}

@end
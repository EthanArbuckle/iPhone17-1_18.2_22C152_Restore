@interface PUPhotosAlbumViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation PUPhotosAlbumViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUPhotosAlbumViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PUPhotosAlbumViewControllerAccessibility;
  [(PUPhotosAlbumViewControllerAccessibility *)&v3 viewDidAppear:a3];
  if (UIAccessibilityIsSwitchControlRunning()) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
  }
}

@end
@interface VideosUI_MultiPlayerContainerEditOverlayViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)setHidden:(BOOL)a3;
@end

@implementation VideosUI_MultiPlayerContainerEditOverlayViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VideosUI.MultiPlayerContainerEditOverlayView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)setHidden:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)VideosUI_MultiPlayerContainerEditOverlayViewAccessibility;
  [(VideosUI_MultiPlayerContainerEditOverlayViewAccessibility *)&v3 setHidden:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

@end
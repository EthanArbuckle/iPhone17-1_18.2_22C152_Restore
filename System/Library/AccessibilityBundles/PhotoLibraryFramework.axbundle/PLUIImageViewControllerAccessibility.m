@interface PLUIImageViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)cropOverlayWasOKed:(id)a3;
@end

@implementation PLUIImageViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PLUIImageViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)cropOverlayWasOKed:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PLUIImageViewControllerAccessibility;
  [(PLUIImageViewControllerAccessibility *)&v3 cropOverlayWasOKed:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

@end
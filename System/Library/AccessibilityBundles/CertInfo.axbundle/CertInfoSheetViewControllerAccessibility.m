@interface CertInfoSheetViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_pushDetailsView;
@end

@implementation CertInfoSheetViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CertInfoSheetViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_pushDetailsView
{
  v2.receiver = self;
  v2.super_class = (Class)CertInfoSheetViewControllerAccessibility;
  [(CertInfoSheetViewControllerAccessibility *)&v2 _pushDetailsView];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

@end
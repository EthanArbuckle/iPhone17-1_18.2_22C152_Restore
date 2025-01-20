@interface CallistoViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)showUIIfReady;
@end

@implementation CallistoViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CallistoViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F8B098], a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)showUIIfReady
{
  v2.receiver = self;
  v2.super_class = (Class)CallistoViewControllerAccessibility;
  [(CallistoViewControllerAccessibility *)&v2 showUIIfReady];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

@end
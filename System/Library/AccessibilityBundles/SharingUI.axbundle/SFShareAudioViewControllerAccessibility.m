@interface SFShareAudioViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityViewIsModal;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SFShareAudioViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SFShareAudioViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFShareAudioViewControllerAccessibility;
  [(SFShareAudioViewControllerAccessibility *)&v4 viewWillAppear:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], self);
}

- (BOOL)accessibilityViewIsModal
{
  return 1;
}

@end
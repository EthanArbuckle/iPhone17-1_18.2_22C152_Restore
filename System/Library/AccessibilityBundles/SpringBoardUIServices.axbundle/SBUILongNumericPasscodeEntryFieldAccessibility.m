@interface SBUILongNumericPasscodeEntryFieldAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)setShowsOkButton:(BOOL)a3;
@end

@implementation SBUILongNumericPasscodeEntryFieldAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBUILongNumericPasscodeEntryField";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)setShowsOkButton:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SBUILongNumericPasscodeEntryFieldAccessibility;
  [(SBUILongNumericPasscodeEntryFieldAccessibility *)&v3 setShowsOkButton:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

@end
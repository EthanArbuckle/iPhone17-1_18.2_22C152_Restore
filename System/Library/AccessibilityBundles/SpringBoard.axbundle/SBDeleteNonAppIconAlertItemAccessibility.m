@interface SBDeleteNonAppIconAlertItemAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4;
@end

@implementation SBDeleteNonAppIconAlertItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBDeleteNonAppIconAlertItem";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)SBDeleteNonAppIconAlertItemAccessibility;
  [(SBDeleteNonAppIconAlertItemAccessibility *)&v5 configure:a3 requirePasscodeForActions:a4];
  [(SBDeleteNonAppIconAlertItemAccessibility *)self _accessibilitySetRetainedValue:&unk_26F7E5E90 forKey:*MEMORY[0x263F81478]];
}

@end
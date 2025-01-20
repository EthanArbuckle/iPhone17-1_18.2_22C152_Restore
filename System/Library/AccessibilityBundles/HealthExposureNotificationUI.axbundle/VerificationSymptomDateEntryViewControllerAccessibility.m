@interface VerificationSymptomDateEntryViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)updateSymptomsDateCell:(id)a3;
@end

@implementation VerificationSymptomDateEntryViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HealthExposureNotificationUI.VerificationSymptomDateEntryViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)updateSymptomsDateCell:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)VerificationSymptomDateEntryViewControllerAccessibility;
  id v4 = a3;
  [(VerificationSymptomDateEntryViewControllerAccessibility *)&v8 updateSymptomsDateCell:v4];
  char v5 = [(VerificationSymptomDateEntryViewControllerAccessibility *)self safeBoolForKey:@"hasSymptoms"];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __82__VerificationSymptomDateEntryViewControllerAccessibility_updateSymptomsDateCell___block_invoke;
  v6[3] = &__block_descriptor_33_e5_Q8__0l;
  char v7 = v5;
  [v4 _setAccessibilityTraitsBlock:v6];
}

uint64_t __82__VerificationSymptomDateEntryViewControllerAccessibility_updateSymptomsDateCell___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 32)) {
    uint64_t v1 = MEMORY[0x263F1CF18];
  }
  else {
    uint64_t v1 = MEMORY[0x263F1CF20];
  }
  return *(void *)v1;
}

@end
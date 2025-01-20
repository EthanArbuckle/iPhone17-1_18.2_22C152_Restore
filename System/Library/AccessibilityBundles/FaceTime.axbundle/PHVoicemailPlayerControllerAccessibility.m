@interface PHVoicemailPlayerControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)play;
@end

@implementation PHVoicemailPlayerControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PHVoicemailPlayerController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)play
{
  v2.receiver = self;
  v2.super_class = (Class)PHVoicemailPlayerControllerAccessibility;
  [(PHVoicemailPlayerControllerAccessibility *)&v2 play];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], (id)*MEMORY[0x263F21988]);
}

@end
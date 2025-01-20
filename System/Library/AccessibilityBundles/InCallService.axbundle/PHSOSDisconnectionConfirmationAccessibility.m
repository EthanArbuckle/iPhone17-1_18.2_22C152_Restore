@interface PHSOSDisconnectionConfirmationAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)showSOSDisconnectConfirmation:(id)a3;
@end

@implementation PHSOSDisconnectionConfirmationAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PHSOSDisconnectionConfirmation";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)showSOSDisconnectConfirmation:(id)a3
{
  v4 = (void (**)(id, uint64_t))a3;
  if (UIAccessibilityIsVoiceOverRunning())
  {
    v4[2](v4, 1);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PHSOSDisconnectionConfirmationAccessibility;
    [(PHSOSDisconnectionConfirmationAccessibility *)&v5 showSOSDisconnectConfirmation:v4];
  }
}

@end
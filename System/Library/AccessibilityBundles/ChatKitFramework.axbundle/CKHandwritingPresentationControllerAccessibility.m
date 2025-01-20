@interface CKHandwritingPresentationControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsHandwritingEnabled;
- (BOOL)_axIsObservingVoiceOverNotifications;
- (CKHandwritingPresentationControllerAccessibility)init;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axSetIsHandwritingEnabled:(BOOL)a3;
- (void)_axSetIsObservingVoiceOverNotifications:(BOOL)a3;
- (void)_axSubscribeToVoiceOverNotifications;
- (void)_axUnsubscribeFromVoiceOverNotifications;
- (void)_updateVisibilityState;
- (void)dealloc;
@end

@implementation CKHandwritingPresentationControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKHandwritingPresentationController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_axIsHandwritingEnabled
{
  return MEMORY[0x270F09620](self, &__UIKeyboardImplAccessibility___axIsHandwritingEnabled);
}

- (void)_axSetIsHandwritingEnabled:(BOOL)a3
{
}

- (BOOL)_axIsObservingVoiceOverNotifications
{
  return MEMORY[0x270F09620](self, &__UIKeyboardImplAccessibility___axIsObservingVoiceOverNotifications);
}

- (void)_axSetIsObservingVoiceOverNotifications:(BOOL)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKHandwritingPresentationController", @"init", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKHandwritingPresentationController", @"requestedVisibility", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKHandwritingPresentationController", @"_updateVisibilityState", "v", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)CKHandwritingPresentationControllerAccessibility;
  [(CKHandwritingPresentationControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(CKHandwritingPresentationControllerAccessibility *)self _axSubscribeToVoiceOverNotifications];
}

- (CKHandwritingPresentationControllerAccessibility)init
{
  v4.receiver = self;
  v4.super_class = (Class)CKHandwritingPresentationControllerAccessibility;
  v2 = [(CKHandwritingPresentationControllerAccessibility *)&v4 init];
  [(CKHandwritingPresentationControllerAccessibility *)v2 _accessibilityLoadAccessibilityInformation];
  return v2;
}

- (void)dealloc
{
  [(CKHandwritingPresentationControllerAccessibility *)self _axUnsubscribeFromVoiceOverNotifications];
  v3.receiver = self;
  v3.super_class = (Class)CKHandwritingPresentationControllerAccessibility;
  [(CKHandwritingPresentationControllerAccessibility *)&v3 dealloc];
}

- (void)_updateVisibilityState
{
  objc_super v3 = [NSClassFromString(&cfstr_Axuikitglue.isa) safeValueForKey:@"sharedGlueObjectIfAvailable"];
  if (([v3 safeBoolForKey:@"isVoiceOverHandwritingEnabled"] & 1) == 0)
  {
    int v4 = [(CKHandwritingPresentationControllerAccessibility *)self safeBoolForKey:@"requestedVisibility"];
    v7.receiver = self;
    v7.super_class = (Class)CKHandwritingPresentationControllerAccessibility;
    [(CKHandwritingPresentationControllerAccessibility *)&v7 _updateVisibilityState];
    if (AXDeviceIsPhoneIdiom())
    {
      if (v4)
      {
        v5 = [MEMORY[0x263F1C5C0] currentDevice];
        uint64_t v6 = [v5 orientation];
      }
      else
      {
        uint64_t v6 = 0;
      }
      [(id)*MEMORY[0x263F1D020] _accessibilitySetApplicationOrientation:v6];
    }
  }
}

- (void)_axSubscribeToVoiceOverNotifications
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_241FFB000, log, OS_LOG_TYPE_DEBUG, "Registering UIKeyboard for handwriting notifications", v1, 2u);
}

- (void)_axUnsubscribeFromVoiceOverNotifications
{
  if ([(CKHandwritingPresentationControllerAccessibility *)self _axIsObservingVoiceOverNotifications])
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x263F22770], 0);
    int v4 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(v4, self, (CFNotificationName)*MEMORY[0x263F22768], 0);
    [(CKHandwritingPresentationControllerAccessibility *)self _axSetIsObservingVoiceOverNotifications:0];
  }
}

@end
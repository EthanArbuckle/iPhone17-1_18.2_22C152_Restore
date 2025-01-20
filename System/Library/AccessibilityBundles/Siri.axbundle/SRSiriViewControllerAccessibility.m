@interface SRSiriViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)siriDidDeactivateWithCompletion:(id)a3;
- (void)siriSessionDidTransitionFromState:(int64_t)a3 toState:(int64_t)a4 event:(int64_t)a5 machAbsoluteTransitionTime:(double)a6;
- (void)speechSynthesisDidStartSpeakingWithIdentifier:(id)a3;
- (void)speechSynthesisDidStopSpeakingWithIdentifier:(id)a3 queueIsEmpty:(BOOL)a4;
@end

@implementation SRSiriViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SRSiriViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SRSiriViewController", @"speechSynthesisDidStopSpeakingWithIdentifier:queueIsEmpty:", "v", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SRSiriViewController", @"speechSynthesisDidStartSpeakingWithIdentifier:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SRSiriViewController", @"siriDidDeactivateWithCompletion:", "v", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SRSiriViewController", @"siriSessionDidTransitionFromState:toState:event:machAbsoluteTransitionTime:", "v", "q", "q", "q", "d", 0);
}

- (void)siriDidDeactivateWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __69__SRSiriViewControllerAccessibility_siriDidDeactivateWithCompletion___block_invoke;
  v7[3] = &unk_265151060;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)SRSiriViewControllerAccessibility;
  id v5 = v4;
  [(SRSiriViewControllerAccessibility *)&v6 siriDidDeactivateWithCompletion:v7];
}

void __69__SRSiriViewControllerAccessibility_siriDidDeactivateWithCompletion___block_invoke(uint64_t a1)
{
  UIAccessibilityPostNotification(0x1645u, 0);
  UIAccessibilityPostNotification(0x1647u, 0);
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  UIAccessibilityNotifications v3 = *MEMORY[0x263F1CE68];

  UIAccessibilityPostNotification(v3, 0);
}

- (void)speechSynthesisDidStartSpeakingWithIdentifier:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SRSiriViewControllerAccessibility;
  [(SRSiriViewControllerAccessibility *)&v3 speechSynthesisDidStartSpeakingWithIdentifier:a3];
  UIAccessibilityPostNotification(0x1644u, 0);
}

- (void)speechSynthesisDidStopSpeakingWithIdentifier:(id)a3 queueIsEmpty:(BOOL)a4
{
  BOOL v4 = a4;
  v5.receiver = self;
  v5.super_class = (Class)SRSiriViewControllerAccessibility;
  -[SRSiriViewControllerAccessibility speechSynthesisDidStopSpeakingWithIdentifier:queueIsEmpty:](&v5, sel_speechSynthesisDidStopSpeakingWithIdentifier_queueIsEmpty_, a3);
  if (v4) {
    UIAccessibilityPostNotification(0x1645u, 0);
  }
}

- (void)siriSessionDidTransitionFromState:(int64_t)a3 toState:(int64_t)a4 event:(int64_t)a5 machAbsoluteTransitionTime:(double)a6
{
  v9.receiver = self;
  v9.super_class = (Class)SRSiriViewControllerAccessibility;
  [(SRSiriViewControllerAccessibility *)&v9 siriSessionDidTransitionFromState:a3 toState:a4 event:a5 machAbsoluteTransitionTime:a6];
  if (a4 == 1)
  {
    UIAccessibilityNotifications v8 = 5702;
  }
  else
  {
    if (a3 != 1) {
      return;
    }
    UIAccessibilityNotifications v8 = 5703;
  }
  UIAccessibilityPostNotification(v8, 0);
}

@end
@interface SBTelephonyManagerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)updateSpringBoard;
@end

@implementation SBTelephonyManagerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBTelephonyManager";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)updateSpringBoard
{
  v3 = [MEMORY[0x263F7E1A0] sharedInstance];
  v4 = [v3 displayedCallFromCalls:0];

  v5 = [(SBTelephonyManagerAccessibility *)self safeValueForKey:@"inCall"];
  int v6 = [v5 BOOLValue];

  if (v6) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], (id)*MEMORY[0x263F21988]);
  }
  v7.receiver = self;
  v7.super_class = (Class)SBTelephonyManagerAccessibility;
  [(SBTelephonyManagerAccessibility *)&v7 updateSpringBoard];
}

@end
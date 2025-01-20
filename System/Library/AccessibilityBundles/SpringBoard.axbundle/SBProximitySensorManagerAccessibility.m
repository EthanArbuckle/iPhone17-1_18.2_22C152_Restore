@interface SBProximitySensorManagerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_setObjectInProximity:(BOOL)a3 detectionMode:(int)a4;
@end

@implementation SBProximitySensorManagerAccessibility

- (void)_setObjectInProximity:(BOOL)a3 detectionMode:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  BOOL v5 = a3;
  char v7 = [(SBProximitySensorManagerAccessibility *)self safeBoolForKey:@"_objectInProximity"];
  v8.receiver = self;
  v8.super_class = (Class)SBProximitySensorManagerAccessibility;
  [(SBProximitySensorManagerAccessibility *)&v8 _setObjectInProximity:v5 detectionMode:v4];
  if ((v7 & 1) == 0 && v5) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], (id)*MEMORY[0x263F21988]);
  }
}

+ (id)safeCategoryTargetClassName
{
  return @"SBProximitySensorManager";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBProximitySensorManager" hasInstanceVariable:@"_objectInProximity" withType:"B"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBProximitySensorManager", @"_setObjectInProximity:detectionMode:", "v", "B", "i", 0);
}

@end
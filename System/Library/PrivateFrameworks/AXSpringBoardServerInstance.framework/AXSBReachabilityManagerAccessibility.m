@interface AXSBReachabilityManagerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axReachabilityEnabled;
- (id)_axDictionaryOfAnimationProperties;
- (id)_axReachabilitySettings;
- (void)_axAddReachabilityProperty:(id)a3 toDictionary:(id)a4;
- (void)_axSendReachabilityToggledActionWithPayload:(id)a3;
- (void)_notifyObserversReachabilityModeActive:(BOOL)a3;
- (void)_setKeepAliveTimer;
@end

@implementation AXSBReachabilityManagerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBReachabilityManager";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBPrototypeController"];
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"SBPrototypeController", @"sharedInstance", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBPrototypeController", @"rootSettings", "@", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"SBReachabilityDomain", @"rootSettings", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBReachabilitySettings", @"animationSettings", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBReachabilitySettings", @"yOffsetFactor", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFFluidBehaviorSettings", @"trackingDampingRatio", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFFluidBehaviorSettings", @"dampingRatio", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFFluidBehaviorSettings", @"trackingResponse", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFFluidBehaviorSettings", @"response", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFFluidBehaviorSettings", @"trackingRetargetImpulse", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFFluidBehaviorSettings", @"retargetImpulse", "d", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"SBReachabilityManager", @"sharedInstance", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBReachabilityManager", @"reachabilityEnabled", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBReachabilityManager", @"reachabilityModeActive", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBReachabilityManager", @"_notifyObserversReachabilityModeActive:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBReachabilityManager", @"_setKeepAliveTimer", "v", 0);
}

- (void)_notifyObserversReachabilityModeActive:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3) {
    int v5 = ReachableActiveInProgress + 1;
  }
  else {
    int v5 = ReachableActiveInProgress - 1;
  }
  ReachableActiveInProgress = v5;
  v22.receiver = self;
  v22.super_class = (Class)AXSBReachabilityManagerAccessibility;
  -[AXSBReachabilityManagerAccessibility _notifyObserversReachabilityModeActive:](&v22, sel__notifyObserversReachabilityModeActive_);
  if (v3)
  {
    if (ReachableActiveInProgress >= 1)
    {
      if ([(AXSBReachabilityManagerAccessibility *)self _axReachabilityEnabled])
      {
        v6 = +[_AXSpringBoardServerInstance springBoardServerInstance];
        int v7 = [v6 shouldSendReachabilityToggled];

        if (v7)
        {
          v8 = [(AXSBReachabilityManagerAccessibility *)self _axDictionaryOfAnimationProperties];
          v9 = NSNumber;
          v10 = [NSClassFromString(&cfstr_Sbreachability.isa) safeValueForKey:@"sharedInstance"];
          v11 = objc_msgSend(v9, "numberWithBool:", objc_msgSend(v10, "safeBoolForKey:", @"reachabilityModeActive"));
          [v8 setObject:v11 forKeyedSubscript:@"enabled"];

          v12 = [(AXSBReachabilityManagerAccessibility *)self _axReachabilitySettings];
          v13 = NSNumber;
          v14 = [v12 safeValueForKey:@"yOffsetFactor"];
          [v14 doubleValue];
          double v16 = v15;
          v17 = [MEMORY[0x263F82B60] mainScreen];
          [v17 bounds];
          v19 = [v13 numberWithDouble:v16 * v18];
          [v8 setObject:v19 forKeyedSubscript:@"offset"];

          [(AXSBReachabilityManagerAccessibility *)self _axSendReachabilityToggledActionWithPayload:v8];
LABEL_13:
        }
      }
    }
  }
  else if (ReachabilityActive)
  {
    if ([(AXSBReachabilityManagerAccessibility *)self _axReachabilityEnabled])
    {
      v20 = +[_AXSpringBoardServerInstance springBoardServerInstance];
      int v21 = [v20 shouldSendReachabilityToggled];

      if (v21)
      {
        v8 = [(AXSBReachabilityManagerAccessibility *)self _axDictionaryOfAnimationProperties];
        [v8 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"enabled"];
        [v8 setObject:&unk_26DB1FE80 forKeyedSubscript:@"offset"];
        [(AXSBReachabilityManagerAccessibility *)self _axSendReachabilityToggledActionWithPayload:v8];
        goto LABEL_13;
      }
    }
  }
  ReachabilityActive = v3;
}

- (id)_axReachabilitySettings
{
  Class v2 = NSClassFromString(&cfstr_Sbreachability_0.isa);
  return (id)[(objc_class *)v2 safeValueForKey:@"rootSettings"];
}

- (void)_axAddReachabilityProperty:(id)a3 toDictionary:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  int v7 = [(AXSBReachabilityManagerAccessibility *)self _axReachabilitySettings];
  v8 = [v7 safeValueForKey:@"animationSettings"];
  v9 = [v8 safeValueForKey:v10];
  if (v9) {
    [v6 setObject:v9 forKeyedSubscript:v10];
  }
}

- (id)_axDictionaryOfAnimationProperties
{
  BOOL v3 = [MEMORY[0x263EFF9A0] dictionary];
  [(AXSBReachabilityManagerAccessibility *)self _axAddReachabilityProperty:@"trackingDampingRatio" toDictionary:v3];
  [(AXSBReachabilityManagerAccessibility *)self _axAddReachabilityProperty:@"dampingRatio" toDictionary:v3];
  [(AXSBReachabilityManagerAccessibility *)self _axAddReachabilityProperty:@"trackingResponse" toDictionary:v3];
  [(AXSBReachabilityManagerAccessibility *)self _axAddReachabilityProperty:@"response" toDictionary:v3];
  [(AXSBReachabilityManagerAccessibility *)self _axAddReachabilityProperty:@"trackingRetargetImpulse" toDictionary:v3];
  [(AXSBReachabilityManagerAccessibility *)self _axAddReachabilityProperty:@"retargetImpulse" toDictionary:v3];
  return v3;
}

- (void)_axSendReachabilityToggledActionWithPayload:(id)a3
{
  BOOL v3 = (void *)MEMORY[0x263F82E88];
  id v4 = a3;
  uint64_t v5 = [v3 _synchronizeDrawingAcrossProcesses];
  id v6 = +[_AXSpringBoardServerInstance springBoardServerInstance];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __84__AXSBReachabilityManagerAccessibility__axSendReachabilityToggledActionWithPayload___block_invoke;
  v7[3] = &__block_descriptor_36_e5_v8__0l;
  int v8 = v5;
  [v6 reachabilityToggledWithPayload:v4 synchronizationPort:v5 completion:v7];
}

uint64_t __84__AXSBReachabilityManagerAccessibility__axSendReachabilityToggledActionWithPayload___block_invoke(uint64_t result)
{
  mach_port_name_t v1 = *(_DWORD *)(result + 32);
  if (v1) {
    return mach_port_deallocate(*MEMORY[0x263EF8960], v1);
  }
  return result;
}

- (BOOL)_axReachabilityEnabled
{
  Class v2 = [NSClassFromString(&cfstr_Sbreachability.isa) safeValueForKey:@"sharedInstance"];
  char v3 = [v2 safeBoolForKey:@"reachabilityEnabled"];

  return v3;
}

- (void)_setKeepAliveTimer
{
  if (!UIAccessibilityIsVoiceOverRunning())
  {
    v3.receiver = self;
    v3.super_class = (Class)AXSBReachabilityManagerAccessibility;
    [(AXSBReachabilityManagerAccessibility *)&v3 _setKeepAliveTimer];
  }
}

@end
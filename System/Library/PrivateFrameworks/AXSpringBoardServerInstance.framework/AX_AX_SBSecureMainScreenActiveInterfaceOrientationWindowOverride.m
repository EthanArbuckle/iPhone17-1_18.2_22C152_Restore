@interface AX_AX_SBSecureMainScreenActiveInterfaceOrientationWindowOverride
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityTripleClickElementHitTest:(id)a3;
- (void)_processEventForVOSpeakage:(id)a3;
- (void)_tripleClickSpeakMenuProcessTouch:(id)a3;
- (void)sendEvent:(id)a3;
@end

@implementation AX_AX_SBSecureMainScreenActiveInterfaceOrientationWindowOverride

+ (id)safeCategoryTargetClassName
{
  return @"AX_SBSecureMainScreenActiveInterfaceOrientationWindow";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_UIAlertControllerActionView", @"action", "@", 0);
  [v3 validateClass:@"_UIAlertControllerActionView" hasInstanceVariable:@"_highlighted" withType:"B"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIWindow", @"sendEvent:", "v", "@", 0);
}

- (id)_accessibilityTripleClickElementHitTest:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263EFF980] array];
  [v5 addObject:self];
  while ([v5 count])
  {
    v6 = [v5 firstObject];
    [v5 removeObjectAtIndex:0];
    [v4 locationInView:v6];
    if (objc_msgSend(v6, "pointInside:withEvent:", 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_8;
      }
      NSClassFromString(&cfstr_Uialertcontrol.isa);
      if (objc_opt_isKindOfClass()) {
        goto LABEL_8;
      }
      v7 = [v6 subviews];
      [v5 addObjectsFromArray:v7];
    }
  }
  v6 = 0;
LABEL_8:

  return v6;
}

- (void)_tripleClickSpeakMenuProcessTouch:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(AX_AX_SBSecureMainScreenActiveInterfaceOrientationWindowOverride *)self _accessibilityValueForKey:@"TripleClickTitle"];
  v6 = [(AX_AX_SBSecureMainScreenActiveInterfaceOrientationWindowOverride *)self _accessibilityTripleClickElementHitTest:v4];
  NSClassFromString(&cfstr_Uialertcontrol.isa);
  if (objc_opt_isKindOfClass())
  {
    buf[0] = 0;
    objc_opt_class();
    v7 = [v6 safeValueForKey:@"action"];
    v8 = __UIAccessibilityCastAsClass();

    v9 = [v8 title];
    if ([v6 safeBoolForKey:@"_highlighted"])
    {
      v27 = SBAXLocalizedString(@"selected");
      v28 = @"__AXStringForVariablesSentinel";
      uint64_t v10 = __AXStringForVariables();

      v9 = (void *)v10;
    }

    if (!v9) {
      goto LABEL_15;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || ([v6 text], (v9 = objc_claimAutoreleasedReturnValue()) == 0))
    {
LABEL_15:
      v19 = objc_msgSend(MEMORY[0x263F78B88], "sharedInstance", v27, v28);
      [v19 notifySpeakServicesToStopSpeaking];

      v20 = [MEMORY[0x263F213E8] sharedInstance];
      char v21 = [v20 ignoreLogging];

      if ((v21 & 1) == 0)
      {
        v22 = [MEMORY[0x263F213E8] identifier];
        v23 = AXLoggerForFacility();

        os_log_type_t v24 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v23, v24))
        {
          v25 = AXColorizeFormatLog();
          v26 = _AXStringForArgs();
          if (os_log_type_enabled(v23, v24))
          {
            *(_DWORD *)buf = 138543362;
            v30 = v26;
            _os_log_impl(&dword_226EBC000, v23, v24, "%{public}@", buf, 0xCu);
          }
        }
      }
      [(AX_AX_SBSecureMainScreenActiveInterfaceOrientationWindowOverride *)self _accessibilityRemoveValueForKey:@"TripleClickTitle"];
      v9 = 0;
      goto LABEL_22;
    }
  }
  if ((objc_msgSend(v5, "isEqualToString:", v9, v27, v28) & 1) == 0)
  {
    uint64_t v11 = [MEMORY[0x263F78B88] sharedInstance];
    _AXSVoiceOverTouchSpeakingRate();
    [(id)v11 notifySpeakServicesForSpeechOutput:v9 volume:1.0 speakingRate:v12];

    [(AX_AX_SBSecureMainScreenActiveInterfaceOrientationWindowOverride *)self _accessibilitySetRetainedValue:v9 forKey:@"TripleClickTitle"];
    v13 = [MEMORY[0x263F213E8] sharedInstance];
    LOBYTE(v11) = [v13 ignoreLogging];

    if ((v11 & 1) == 0)
    {
      v14 = [MEMORY[0x263F213E8] identifier];
      v15 = AXLoggerForFacility();

      os_log_type_t v16 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v15, v16))
      {
        v17 = AXColorizeFormatLog();
        v18 = _AXStringForArgs();
        if (os_log_type_enabled(v15, v16))
        {
          *(_DWORD *)buf = 138543362;
          v30 = v18;
          _os_log_impl(&dword_226EBC000, v15, v16, "%{public}@", buf, 0xCu);
        }
      }
    }
  }
LABEL_22:
}

- (void)_processEventForVOSpeakage:(id)a3
{
  id v4 = a3;
  v5 = [(AX_AX_SBSecureMainScreenActiveInterfaceOrientationWindowOverride *)self _accessibilityValueForKey:@"AXDispatchTimer"];
  if (!v5)
  {
    id v6 = objc_alloc(MEMORY[0x263F21398]);
    v5 = (void *)[v6 initWithTargetSerialQueue:MEMORY[0x263EF83A0]];
    [v5 setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
    [(AX_AX_SBSecureMainScreenActiveInterfaceOrientationWindowOverride *)self _accessibilitySetRetainedValue:v5 forKey:@"AXDispatchTimer"];
  }
  if ([(AX_AX_SBSecureMainScreenActiveInterfaceOrientationWindowOverride *)self _accessibilityBoolValueForKey:@"TripleClickSpeakWaited"])
  {
    [(AX_AX_SBSecureMainScreenActiveInterfaceOrientationWindowOverride *)self _tripleClickSpeakMenuProcessTouch:v4];
  }
  else if (![v5 isPending] || objc_msgSend(v5, "isCancelled"))
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __95__AX_AX_SBSecureMainScreenActiveInterfaceOrientationWindowOverride__processEventForVOSpeakage___block_invoke;
    v7[3] = &unk_2647F0728;
    v7[4] = self;
    id v8 = v4;
    [v5 afterDelay:v7 processBlock:0.300000012];
  }
}

- (void)sendEvent:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(AX_AX_SBSecureMainScreenActiveInterfaceOrientationWindowOverride *)self accessibilityIdentifier];
  int v6 = [v5 isEqualToString:@"TripleClickAskWindow"];

  if (v6 && ![v4 type])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v14 = v4;
    v7 = [v4 allTouches];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (!v8) {
      goto LABEL_18;
    }
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    while (1)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        float v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (![v12 phase] || objc_msgSend(v12, "phase") == 1)
        {
          v13 = (void *)_AXSTripleClickCopyOptions();
          if ([v13 containsObject:&unk_26DB20118]) {
            [(AX_AX_SBSecureMainScreenActiveInterfaceOrientationWindowOverride *)self _processEventForVOSpeakage:v12];
          }
          goto LABEL_15;
        }
        if ([v12 phase] == 3 || objc_msgSend(v12, "phase") == 4)
        {
          v13 = [(AX_AX_SBSecureMainScreenActiveInterfaceOrientationWindowOverride *)self _accessibilityValueForKey:@"AXDispatchTimer"];
          [v13 cancel];
          [(AX_AX_SBSecureMainScreenActiveInterfaceOrientationWindowOverride *)self _accessibilitySetBoolValue:0 forKey:@"TripleClickSpeakWaited"];
          [(AX_AX_SBSecureMainScreenActiveInterfaceOrientationWindowOverride *)self _accessibilityRemoveValueForKey:@"TripleClickTitle"];
LABEL_15:

          continue;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (!v9)
      {
LABEL_18:

        id v4 = v14;
        break;
      }
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)AX_AX_SBSecureMainScreenActiveInterfaceOrientationWindowOverride;
  [(AX_AX_SBSecureMainScreenActiveInterfaceOrientationWindowOverride *)&v15 sendEvent:v4];
}

@end
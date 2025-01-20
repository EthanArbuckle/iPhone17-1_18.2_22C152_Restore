@interface VTUIEnrollTrainingViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)AXSuspendAudioTimer;
- (id)_axShowTrainingInstructionBlock;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilitySetAccessibilityElementsIfNeeded;
- (void)_accessibilitySuperShowTrainingInstruction:(int64_t)a3 afterDelay:(double)a4 isRetry:(BOOL)a5 animate:(BOOL)a6;
- (void)_axAnnounceInstructionWithNumber:(int64_t)a3;
- (void)_axAnnounceString:(id)a3;
- (void)_axHandleAnnouncementDidFinishNotification:(id)a3;
- (void)_axHandleElementFocusedNotification:(id)a3;
- (void)_axHandleSuspendAudioTimerFired:(id)a3;
- (void)_axHandleVoiceOverStatusChangedNotification:(id)a3;
- (void)_axSetShowTrainingInstructionBlock:(id)a3;
- (void)_axSuspendAudio:(BOOL)a3;
- (void)_continueToTrainingFromIntro;
- (void)_setLanguageOptionsAndContinue;
- (void)_setupEnrollTrainingView;
- (void)_showEducationView;
- (void)_showEnrollmentSuccessView;
- (void)_showIntroView;
- (void)_showSiriDataSharingOptIn;
- (void)_showStatusMessage:(id)a3 afterDelay:(double)a4 completion:(id)a5;
- (void)_showTrainingInstruction:(int64_t)a3 afterDelay:(double)a4 isRetry:(BOOL)a5 animate:(BOOL)a6;
- (void)_showVoiceSelectionViewForRecognitionLanguage:(id)a3;
- (void)_startEnrollment;
- (void)dealloc;
- (void)setAXSuspendAudioTimer:(id)a3;
@end

@implementation VTUIEnrollTrainingViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VTUIEnrollTrainingViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VTUIEnrollTrainingViewController", @"_continueToTrainingFromIntro", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VTUIEnrollTrainingViewController", @"_showTrainingInstruction: afterDelay: isRetry: animate:", "v", "q", "d", "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VTUIEnrollTrainingViewController", @"_showStatusMessage: afterDelay: completion:", "v", "@", "d", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VTUIEnrollTrainingViewController", @"_showEnrollmentSuccessView", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VTUIEnrollTrainingViewController", @"_showIntroView", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VTUIEnrollTrainingViewController", @"_showSiriDataSharingOptIn", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VTUIEnrollTrainingViewController", @"_setupEnrollTrainingView", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VTUIEnrollTrainingViewController", @"trainingViewMediator", "@", 0);
  [v3 validateClass:@"VTUIEnrollTrainingViewController" hasInstanceVariable:@"_trainingPageInstructions" withType:"NSArray"];
  [v3 validateClass:@"VTUIEnrollTrainingViewController" hasInstanceVariable:@"_trainingManager" withType:"SSRVTUITrainingManager"];
  [v3 validateClass:@"VTUIEnrollTrainingViewController" hasInstanceVariable:@"_currentTrainingState" withType:"NSInteger"];
  [v3 validateClass:@"VTUIEnrollmentSuccessView" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  [v3 validateClass:@"VTUIPagedLabel" hasInstanceVariable:@"_instructionLabelLeft" withType:"UILabel"];
  [v3 validateClass:@"VTUIPagedLabel" hasInstanceVariable:@"_instructionLabelRight" withType:"UILabel"];
  [v3 validateClass:@"VTUIPagedLabel" hasInstanceVariable:@"_instructionLabelRight" withType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SSRVTUITrainingManager", @"setSuspendAudio:", "v", "B", 0);
  [v3 validateClass:@"VTUIStyle"];
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"VTUIStyle", @"sharedStyle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VTUIStyle", @"VTUIDeviceSpecificString:", "@", "@", 0);
  [v3 validateClass:@"VTUIEnrollTrainingViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"VTUIEnrollTrainingViewController" hasInstanceVariable:@"_introViewController" withType:"UIViewController<VTUIEnrollmentSetupIntroViewControlling>"];
  [v3 validateClass:@"VTUIEnrollTrainingViewController" hasInstanceVariable:@"_educationViewController" withType:"VTUISiriEducationViewController"];
  [v3 validateClass:@"VTUIEnrollTrainingViewController" hasInstanceVariable:@"_siriDataSharingViewController" withType:"UIViewController"];
  [v3 validateClass:@"VTUISiriEducationViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VTUIEnrollTrainingViewController", @"_showEducationView", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VTUIEnrollTrainingViewController", @"_startEnrollment", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VTUIEnrollTrainingViewController", @"_setLanguageOptionsAndContinue", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VTUIEnrollTrainingViewMediatorGM", @"trainingView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VTUIEnrollTrainingViewController", @"_showVoiceSelectionViewForRecognitionLanguage:", "v", "@", 0);
  [v3 validateClass:@"VTUIEnrollTrainingViewController" hasInstanceVariable:@"_siriDataSharingOptInView" withType:"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VTUIEnrollTrainingView", @"orbView", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v12.receiver = self;
  v12.super_class = (Class)VTUIEnrollTrainingViewControllerAccessibility;
  [(VTUIEnrollTrainingViewControllerAccessibility *)&v12 _accessibilityLoadAccessibilityInformation];
  id v3 = [(VTUIEnrollTrainingViewControllerAccessibility *)self safeValueForKey:@"trainingViewMediator"];
  if (objc_opt_respondsToSelector())
  {
    v4 = [v3 safeValueForKey:@"trainingView"];
    v5 = [v4 safeValueForKey:@"orbView"];
    [v5 accessibilitySetIdentification:@"EnrollmentSetupIntroView"];
  }
  v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 addObserver:self selector:sel__axHandleAnnouncementDidFinishNotification_ name:*MEMORY[0x263F1CDB0] object:0];

  v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 addObserver:self selector:sel__axHandleVoiceOverStatusChangedNotification_ name:*MEMORY[0x263F1CF90] object:0];

  v8 = [MEMORY[0x263F08A00] defaultCenter];
  [v8 addObserver:self selector:sel__axHandleElementFocusedNotification_ name:*MEMORY[0x263F1CDF8] object:0];

  VoiceOverStatus = UIAccessibilityIsVoiceOverRunning();
  v9 = [(VTUIEnrollTrainingViewControllerAccessibility *)self safeValueForKey:@"_educationViewController"];
  [v9 _accessibilityLoadAccessibilityInformation];

  v10 = [(VTUIEnrollTrainingViewControllerAccessibility *)self safeValueForKey:@"_siriDataSharingViewController"];
  [v10 _accessibilityLoadAccessibilityInformation];

  v11 = [(VTUIEnrollTrainingViewControllerAccessibility *)self safeValueForKey:@"_introViewController"];
  [v11 _accessibilityLoadAccessibilityInformation];

  [(VTUIEnrollTrainingViewControllerAccessibility *)self _accessibilitySetAccessibilityElementsIfNeeded];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F1CDB0] object:0];

  v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x263F1CF90] object:0];

  v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self name:*MEMORY[0x263F1CDF8] object:0];

  [(VTUIEnrollTrainingViewControllerAccessibility *)self _axSuspendAudio:0];
  v6.receiver = self;
  v6.super_class = (Class)VTUIEnrollTrainingViewControllerAccessibility;
  [(VTUIEnrollTrainingViewControllerAccessibility *)&v6 dealloc];
}

- (void)_setupEnrollTrainingView
{
  v4.receiver = self;
  v4.super_class = (Class)VTUIEnrollTrainingViewControllerAccessibility;
  [(VTUIEnrollTrainingViewControllerAccessibility *)&v4 _setupEnrollTrainingView];
  v3.receiver = self;
  v3.super_class = (Class)VTUIEnrollTrainingViewControllerAccessibility;
  [(VTUIEnrollTrainingViewControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
}

- (void)_showIntroView
{
  v3.receiver = self;
  v3.super_class = (Class)VTUIEnrollTrainingViewControllerAccessibility;
  [(VTUIEnrollTrainingViewControllerAccessibility *)&v3 _showIntroView];
  [(VTUIEnrollTrainingViewControllerAccessibility *)self _accessibilitySetAccessibilityElementsIfNeeded];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

- (void)_showEducationView
{
  v5.receiver = self;
  v5.super_class = (Class)VTUIEnrollTrainingViewControllerAccessibility;
  [(VTUIEnrollTrainingViewControllerAccessibility *)&v5 _showEducationView];
  objc_super v3 = [(VTUIEnrollTrainingViewControllerAccessibility *)self safeValueForKey:@"_educationViewController"];
  objc_super v4 = [v3 safeUIViewForKey:@"view"];
  [v4 setAccessibilityViewIsModal:1];

  [(VTUIEnrollTrainingViewControllerAccessibility *)self _accessibilitySetAccessibilityElementsIfNeeded];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

- (void)_showEnrollmentSuccessView
{
  v7.receiver = self;
  v7.super_class = (Class)VTUIEnrollTrainingViewControllerAccessibility;
  [(VTUIEnrollTrainingViewControllerAccessibility *)&v7 _showEnrollmentSuccessView];
  objc_super v3 = [(VTUIEnrollTrainingViewControllerAccessibility *)self safeValueForKey:@"_flamesView"];
  [v3 setIsAccessibilityElement:0];

  objc_super v4 = [(VTUIEnrollTrainingViewControllerAccessibility *)self safeValueForKey:@"_successView"];
  [v4 _accessibilitySetRetainedValue:MEMORY[0x263EFFA88] forKey:@"AXIsInstructionLabel"];

  LODWORD(v4) = *MEMORY[0x263F1CE68];
  objc_super v5 = [(VTUIEnrollTrainingViewControllerAccessibility *)self safeValueForKey:@"_successView"];
  objc_super v6 = [v5 safeValueForKey:@"_titleLabel"];
  UIAccessibilityPostNotification((UIAccessibilityNotifications)v4, v6);
}

- (id)_axShowTrainingInstructionBlock
{
}

- (void)_axSetShowTrainingInstructionBlock:(id)a3
{
  id v3 = (id)MEMORY[0x24566A130](a3, a2);
  __UIAccessibilitySetAssociatedObject();
}

- (void)_showTrainingInstruction:(int64_t)a3 afterDelay:(double)a4 isRetry:(BOOL)a5 animate:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  if (UIAccessibilityIsVoiceOverRunning())
  {
    [(VTUIEnrollTrainingViewControllerAccessibility *)self _axAnnounceInstructionWithNumber:a3];
    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __101__VTUIEnrollTrainingViewControllerAccessibility__showTrainingInstruction_afterDelay_isRetry_animate___block_invoke;
    v12[3] = &unk_265167B78;
    objc_copyWeak(v13, &location);
    v13[1] = (id)a3;
    v13[2] = *(id *)&a4;
    BOOL v14 = v7;
    BOOL v15 = v6;
    [(VTUIEnrollTrainingViewControllerAccessibility *)self _axSetShowTrainingInstructionBlock:v12];
    objc_destroyWeak(v13);
    objc_destroyWeak(&location);
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)VTUIEnrollTrainingViewControllerAccessibility;
    [(VTUIEnrollTrainingViewControllerAccessibility *)&v11 _showTrainingInstruction:a3 afterDelay:v7 isRetry:v6 animate:a4];
  }
}

void __101__VTUIEnrollTrainingViewControllerAccessibility__showTrainingInstruction_afterDelay_isRetry_animate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _accessibilitySuperShowTrainingInstruction:*(void *)(a1 + 40) afterDelay:*(unsigned __int8 *)(a1 + 56) isRetry:*(unsigned __int8 *)(a1 + 57) animate:*(double *)(a1 + 48)];
}

- (void)_accessibilitySuperShowTrainingInstruction:(int64_t)a3 afterDelay:(double)a4 isRetry:(BOOL)a5 animate:(BOOL)a6
{
  v6.receiver = self;
  v6.super_class = (Class)VTUIEnrollTrainingViewControllerAccessibility;
  [(VTUIEnrollTrainingViewControllerAccessibility *)&v6 _showTrainingInstruction:a3 afterDelay:a5 isRetry:a6 animate:a4];
}

- (void)_showStatusMessage:(id)a3 afterDelay:(double)a4 completion:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)VTUIEnrollTrainingViewControllerAccessibility;
  id v8 = a3;
  [(VTUIEnrollTrainingViewControllerAccessibility *)&v9 _showStatusMessage:v8 afterDelay:a5 completion:a4];
  -[VTUIEnrollTrainingViewControllerAccessibility _axAnnounceString:](self, "_axAnnounceString:", v8, v9.receiver, v9.super_class);
}

- (void)_continueToTrainingFromIntro
{
  v3.receiver = self;
  v3.super_class = (Class)VTUIEnrollTrainingViewControllerAccessibility;
  [(VTUIEnrollTrainingViewControllerAccessibility *)&v3 _continueToTrainingFromIntro];
  [(VTUIEnrollTrainingViewControllerAccessibility *)self _accessibilitySetAccessibilityElementsIfNeeded];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

- (void)_startEnrollment
{
  v3.receiver = self;
  v3.super_class = (Class)VTUIEnrollTrainingViewControllerAccessibility;
  [(VTUIEnrollTrainingViewControllerAccessibility *)&v3 _startEnrollment];
  [(VTUIEnrollTrainingViewControllerAccessibility *)self _accessibilitySetAccessibilityElementsIfNeeded];
}

- (void)_setLanguageOptionsAndContinue
{
  v3.receiver = self;
  v3.super_class = (Class)VTUIEnrollTrainingViewControllerAccessibility;
  [(VTUIEnrollTrainingViewControllerAccessibility *)&v3 _setLanguageOptionsAndContinue];
  [(VTUIEnrollTrainingViewControllerAccessibility *)self _accessibilitySetAccessibilityElementsIfNeeded];
}

- (void)_showSiriDataSharingOptIn
{
  v4.receiver = self;
  v4.super_class = (Class)VTUIEnrollTrainingViewControllerAccessibility;
  [(VTUIEnrollTrainingViewControllerAccessibility *)&v4 _showSiriDataSharingOptIn];
  objc_super v3 = [(VTUIEnrollTrainingViewControllerAccessibility *)self safeUIViewForKey:@"_siriDataSharingOptInView"];
  [v3 setAccessibilityViewIsModal:1];

  [(VTUIEnrollTrainingViewControllerAccessibility *)self _accessibilitySetAccessibilityElementsIfNeeded];
}

- (void)_showVoiceSelectionViewForRecognitionLanguage:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VTUIEnrollTrainingViewControllerAccessibility;
  [(VTUIEnrollTrainingViewControllerAccessibility *)&v4 _showVoiceSelectionViewForRecognitionLanguage:a3];
  [(VTUIEnrollTrainingViewControllerAccessibility *)self _accessibilitySetAccessibilityElementsIfNeeded];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

- (void)_axAnnounceInstructionWithNumber:(int64_t)a3
{
  objc_super v5 = [(VTUIEnrollTrainingViewControllerAccessibility *)self safeArrayForKey:@"_trainingPageInstructions"];
  if ([v5 count] > (unint64_t)a3)
  {
    objc_super v6 = NSString;
    BOOL v7 = accessibilityLocalizedString(@"step.announcement");
    id v8 = AXFormatInteger();
    [v5 count];
    objc_super v9 = AXFormatInteger();
    v10 = objc_msgSend(v6, "stringWithFormat:", v7, v8, v9);

    objc_super v11 = [(id)MEMORY[0x245669F00](@"VTUIStyle") safeValueForKey:@"sharedStyle"];
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x3032000000;
    v23 = __Block_byref_object_copy_;
    v24 = __Block_byref_object_dispose_;
    id v25 = 0;
    objc_opt_class();
    objc_super v12 = [v5 axSafeObjectAtIndex:a3];
    v13 = __UIAccessibilityCastAsClass();

    BOOL v14 = [v13 objectForKeyedSubscript:@"Instruction"];

    uint64_t v17 = MEMORY[0x263EF8330];
    id v18 = v11;
    id v19 = v14;
    AXPerformSafeBlock();
    uint64_t v16 = v21[5];
    BOOL v15 = __AXStringForVariables();
    [(VTUIEnrollTrainingViewControllerAccessibility *)self _axAnnounceString:v15, v16, @"__AXStringForVariablesSentinel", v17, 3221225472, __82__VTUIEnrollTrainingViewControllerAccessibility__axAnnounceInstructionWithNumber___block_invoke, &unk_265167BA0];

    _Block_object_dispose(&v20, 8);
  }
}

uint64_t __82__VTUIEnrollTrainingViewControllerAccessibility__axAnnounceInstructionWithNumber___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) VTUIDeviceSpecificString:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

- (void)_axAnnounceString:(id)a3
{
  id v5 = a3;
  BOOL IsVoiceOverRunning = UIAccessibilityIsVoiceOverRunning();
  if (v5 && IsVoiceOverRunning)
  {
    [(VTUIEnrollTrainingViewControllerAccessibility *)self _axSuspendAudio:1];
    UIAccessibilitySpeakAndDoNotBeInterrupted();
  }
}

- (void)_axHandleAnnouncementDidFinishNotification:(id)a3
{
  objc_super v4 = [(VTUIEnrollTrainingViewControllerAccessibility *)self _axShowTrainingInstructionBlock];

  if (v4)
  {
    id v5 = [(VTUIEnrollTrainingViewControllerAccessibility *)self _axShowTrainingInstructionBlock];
    v5[2]();

    [(VTUIEnrollTrainingViewControllerAccessibility *)self _axSetShowTrainingInstructionBlock:0];
  }

  [(VTUIEnrollTrainingViewControllerAccessibility *)self _axSuspendAudio:0];
}

- (void)_axHandleVoiceOverStatusChangedNotification:(id)a3
{
  id v4 = a3;
  if (VoiceOverStatus && !UIAccessibilityIsVoiceOverRunning()) {
    [(VTUIEnrollTrainingViewControllerAccessibility *)self _axSuspendAudio:0];
  }
  VoiceOverStatus = UIAccessibilityIsVoiceOverRunning();
}

- (id)AXSuspendAudioTimer
{
}

- (void)setAXSuspendAudioTimer:(id)a3
{
}

- (void)_axHandleElementFocusedNotification:(id)a3
{
  id v4 = [a3 userInfo];
  id v8 = [v4 objectForKeyedSubscript:*MEMORY[0x263F1CE00]];

  id v5 = [v8 _accessibilityValueForKey:@"AXIsInstructionLabel"];
  int v6 = [v5 BOOLValue];

  if (v6)
  {
    [(VTUIEnrollTrainingViewControllerAccessibility *)self _axSuspendAudio:1];
    BOOL v7 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel__axHandleSuspendAudioTimerFired_ selector:0 userInfo:0 repeats:1.5];
    [(VTUIEnrollTrainingViewControllerAccessibility *)self setAXSuspendAudioTimer:v7];
  }
}

- (void)_axHandleSuspendAudioTimerFired:(id)a3
{
}

- (void)_axSuspendAudio:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(VTUIEnrollTrainingViewControllerAccessibility *)self AXSuspendAudioTimer];
  [v4 invalidate];

  if (!v3 || UIAccessibilityIsVoiceOverRunning()) {
    AXPerformSafeBlock();
  }
}

void __65__VTUIEnrollTrainingViewControllerAccessibility__axSuspendAudio___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) safeValueForKey:@"_trainingManager"];
  [v2 setSuspendAudio:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_accessibilitySetAccessibilityElementsIfNeeded
{
  v13[1] = *MEMORY[0x263EF8340];
  BOOL v3 = [(VTUIEnrollTrainingViewControllerAccessibility *)self safeUIViewForKey:@"view"];
  if (PSIsRunningInAssistant())
  {
    id v4 = [(VTUIEnrollTrainingViewControllerAccessibility *)self safeValueForKey:@"_educationViewController"];
    id v5 = [v4 safeUIViewForKey:@"view"];

    int v6 = [(VTUIEnrollTrainingViewControllerAccessibility *)self safeValueForKey:@"_siriDataSharingOptInView"];
    BOOL v7 = [(VTUIEnrollTrainingViewControllerAccessibility *)self safeValueForKey:@"_introViewController"];
    id v8 = [v7 safeUIViewForKey:@"view"];

    if ([v5 accessibilityViewIsModal]
      && [v5 _accessibilityViewIsVisible])
    {
      v13[0] = v5;
      objc_super v9 = (void **)v13;
    }
    else if ([v6 accessibilityViewIsModal] {
           && [v6 _accessibilityViewIsVisible])
    }
    {
      objc_super v12 = v6;
      objc_super v9 = &v12;
    }
    else
    {
      if (![v8 accessibilityViewIsModal]
        || ![v8 _accessibilityViewIsVisible])
      {
        v10 = 0;
        goto LABEL_14;
      }
      objc_super v11 = v8;
      objc_super v9 = &v11;
    }
    v10 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v9, 1, v11, v12, v13[0]);
LABEL_14:
    [v3 setAccessibilityElements:v10];

    goto LABEL_15;
  }
  [v3 setAccessibilityElements:0];
LABEL_15:
}

@end
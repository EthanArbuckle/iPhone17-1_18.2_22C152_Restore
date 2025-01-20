@interface AXTimerAssistantUIGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXTimerAssistantUIGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F229D0] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_321 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_330];

    _Failover = [objc_allocWithZone((Class)AXTimerAssistantUIGlue) init];
    MEMORY[0x270F9A758]();
  }
}

uint64_t __55__AXTimerAssistantUIGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 validateClass:@"MobileTimerAssistantAlarmSnippetCell"];
  [v2 validateClass:@"MobileTimerAssistantTimerSnippetCell"];
  [v2 validateClass:@"TimerSnippetTimeView"];
  [v2 validateClass:@"SAAlarmObject"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"TimerSnippetTimeView", @"updateDisplayWithTime:", "B", "d", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MTUIAlarmView", @"repeatText", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MTUIAlarmView", @"enabledSwitch", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MTUIWorldClockCellView", @"nameLabel", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MTUIWorldClockCellView", @"combinedLabel", "@", 0);
  [v2 validateClass:@"MobileTimerAssistantAlarmSnippetCell" hasInstanceVariable:@"_alarmView" withType:"MTUIAlarmView"];
  [v2 validateClass:@"MobileTimerAssistantWorldClockSnippetCell" hasInstanceVariable:@"_clockCellView" withType:"MTUIWorldClockCellView"];
  [v2 validateClass:@"TimerSnippetTimeView" hasInstanceVariable:@"_running" withType:"c"];
  [v2 validateClass:@"TimerSnippetTimeView" hasInstanceVariable:@"_fireTime" withType:"d"];

  return 1;
}

uint64_t __55__AXTimerAssistantUIGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"Timer Assistant UI AX Bundle"];
  [v2 setOverrideProcessName:@"Timer Assistant UI"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

void __55__AXTimerAssistantUIGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"MobileTimerAssistantAlarmSnippetCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MobileTimerAssistantTimerSnippetCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MobileTimerAssistantWorldClockSnippetCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TimerSnippetTimeViewAccessibility" canInteractWithTargetClass:1];
}

@end
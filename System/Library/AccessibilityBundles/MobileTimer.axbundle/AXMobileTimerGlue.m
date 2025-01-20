@interface AXMobileTimerGlue
+ (void)accessibilityInitializeBundle;
+ (void)playStartSound;
+ (void)playStopSound;
@end

@implementation AXMobileTimerGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F229D0] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_438 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_447];

    uint64_t v3 = [objc_allocWithZone((Class)AXMobileTimerGlue) init];
    v4 = (void *)_Failover;
    _Failover = v3;

    id v5 = [MEMORY[0x263F22850] sharedInstance];
    [v5 addHandler:&__block_literal_global_551 forFramework:@"Weather"];
  }
}

uint64_t __50__AXMobileTimerGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 validateClass:@"MTUIDigitalClockLabel"];
  [v2 validateClass:@"MTATimeView"];
  [v2 validateClass:@"MTATableViewController"];
  [v2 validateClass:@"MTATimerViewController"];
  [v2 validateClass:@"MTUIAnalogClockView"];
  [v2 validateClass:@"MTTimerManager"];
  [v2 validateClass:@"MTAStopwatchViewController"];
  [v2 validateClass:@"MTUIDigitalClockLabel" isKindOfClass:@"MTUIDateLabel"];
  [v2 validateClass:@"MTAAlarmTableViewCell" isKindOfClass:@"UITableViewCell"];
  [v2 validateClass:@"MTATimeView" hasInstanceVariable:@"_timeLabel" withType:"UILabel"];
  [v2 validateClass:@"UISegmentedControl" hasInstanceVariable:@"_segments" withType:"NSMutableArray"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MTATimerViewController", @"loadView", "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MTAStopwatchViewController", @"pauseLapTimer", "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MTAStopwatchViewController", @"startLapTimer", "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MTAStopwatchViewController", @"resumeLapTimer", "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MTATimerViewController", @"startUpdatingTimerUI", "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MTATimerViewController", @"stopUpdatingTimerUI", "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MTATableViewController", @"_numberOfItemsDidChangeAnimated:", "v", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MTUIAlarmView", @"name", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MTUIAlarmView", @"repeatText", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MTUIAlarmView", @"enabledSwitch", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MTUIAlarmView", @"timeLabel", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MTATimerViewController", @"pauseResumeTimer:", "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MTATimerViewController", @"startTimer:", "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MTUIAnalogClockView", @"isNighttime", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MTUIAnalogClockView", @"hour", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MTUIAnalogClockView", @"minute", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"UIViewController", @"toolbarItems", "@", 0);
  [v2 validateClass:@"Alarm"];
  [v2 validateClass:@"MTAWorldClockMapView"];
  [v2 validateClass:@"MTAWorldClockMapCityView"];
  [v2 validateClass:@"MTAWorldClockPadViewController"];
  [v2 validateClass:@"MTAWorldClockView"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MTATimerPickerCell", @"picker", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MTATimerPickerCell", @"timeView", "@", 0);
  [v2 validateClass:@"MTAWorldClockMapCityView" hasInstanceVariable:@"_nameLabel" withType:"UILabel"];
  [v2 validateClass:@"MTAWorldClockMapCityView" hasInstanceVariable:@"_timeLabel" withType:"UILabel"];
  [v2 validateClass:@"MTAWorldClockTableViewCell" hasInstanceVariable:@"_clockCellView" withType:"MTUIWorldClockCellView"];
  [v2 validateClass:@"MTUIAnalogClockView" hasInstanceVariable:@"_nighttime" withType:"B"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MTUIWorldClockCellView", @"nameLabel", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MTUIWorldClockCellView", @"combinedLabel", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"Alarm", @"isActive", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"Alarm", @"hour", "I", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"Alarm", @"minute", "I", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MTAWorldClockMapCityView", @"city", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MTAWorldClockMapView", @"addCity:", "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MTAWorldClockMapView", @"removeCity:", "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MTAWorldClockView", @"analogClock", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MTAStopwatchViewController", @"didAddLap:", "v", "d", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MTAStopwatchViewController", @"lapLapTimer", "v", 0);

  return 1;
}

uint64_t __50__AXMobileTimerGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setOverrideProcessName:@"Clock"];
  [v2 setValidationTargetName:@"MobileTimer AX Bundle"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

void __50__AXMobileTimerGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"MTATimeViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MobileTimerUIButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MobileTimerUILabelAccessiblity" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MTATableViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MTATimerViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MTAWorldClockTableViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MTAStopwatchViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MTACircleButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MTATimerPickerCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MTATimerControlsViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MTATimerButtonsControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MTAWorldClockMapViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MTAWorldClockMapCityViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MTAWorldClockPadViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MTAWorldClockViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MTAWorldClockCollectionCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MT_UICollectionViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MTAStopwatchTableViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MTAStopwatchLapCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MTAWorldClockCollectionViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MTAAlarmCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MTAEditAlarmVolumeCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MT_UIPageControlAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MTATimerIntervalPickerViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MTAAlarmEditViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MTAAlarmTableViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MTAAlarmTableViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MTAAppControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MTAAlarmCollectionViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MTACountDownPickerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MTATimerPresetViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MTATimerCellViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MTATimerRecentViewAccessibility" canInteractWithTargetClass:1];
}

uint64_t __50__AXMobileTimerGlue_accessibilityInitializeBundle__block_invoke_4()
{
  return AXPerformBlockOnMainThreadAfterDelay();
}

void __50__AXMobileTimerGlue_accessibilityInitializeBundle__block_invoke_5()
{
  id v0 = [MEMORY[0x263F229D0] sharedInstance];
  [v0 performValidations:&__block_literal_global_555 withPreValidationHandler:&__block_literal_global_566 postValidationHandler:&__block_literal_global_572];
}

uint64_t __50__AXMobileTimerGlue_accessibilityInitializeBundle__block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"City", @"temperature", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"City", @"conditionCode", "q", 0);

  return 1;
}

uint64_t __50__AXMobileTimerGlue_accessibilityInitializeBundle__block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 setValidationTargetName:@"MobileTimer - Weather Combo Framework AX Bundle"];

  return MEMORY[0x270F0A270](v2);
}

+ (void)playStopSound
{
  SystemSoundID v2 = playStopSound_StopSound;
  if (!playStopSound_StopSound)
  {
    uint64_t v3 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.MobileTimer.axbundle"];
    v4 = NSURL;
    id v5 = [v3 pathForResource:@"timer-stop" ofType:@"aiff"];
    CFURLRef v6 = [v4 fileURLWithPath:v5];

    AudioServicesCreateSystemSoundID(v6, (SystemSoundID *)&playStopSound_StopSound);
    SystemSoundID v2 = playStopSound_StopSound;
  }

  AudioServicesPlaySystemSound(v2);
}

+ (void)playStartSound
{
  SystemSoundID v2 = playStartSound_StartSound;
  if (!playStartSound_StartSound)
  {
    uint64_t v3 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.MobileTimer.axbundle"];
    v4 = NSURL;
    id v5 = [v3 pathForResource:@"timer-start" ofType:@"aiff"];
    CFURLRef v6 = [v4 fileURLWithPath:v5];

    AudioServicesCreateSystemSoundID(v6, (SystemSoundID *)&playStartSound_StartSound);
    SystemSoundID v2 = playStartSound_StartSound;
  }

  AudioServicesPlaySystemSound(v2);
}

@end
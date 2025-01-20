@interface PHCountdownViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axAnnouncementTimer;
- (void)_axSetAnnouncementTimer:(id)a3;
- (void)dealloc;
- (void)pause;
- (void)startCountdown;
- (void)stop;
@end

@implementation PHCountdownViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PHCountdownView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axAnnouncementTimer
{
}

- (void)_axSetAnnouncementTimer:(id)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHCountdownView", @"pauseTimer", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHCountdownView", @"startCountdown", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHCountdownView", @"countdownViewModel", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHCountdownView", @"stop", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHCountdownView", @"pause", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHCountdownViewModel", @"playsSound", "B", 0);
  [v3 validateProtocol:@"PHCountdownViewModel" hasRequiredInstanceMethod:@"countdown"];
  [v3 validateProtocol:@"PHCountdownViewModel" hasRequiredInstanceMethod:@"countdownString:"];
  [v3 validateProtocol:@"PHCountdownViewModel" hasRequiredInstanceMethod:@"countdownTickDuration"];
  [v3 validateClass:@"PHSOSDialCountdownViewModel" conformsToProtocol:@"PHCountdownViewModel"];
  [v3 validateClass:@"PHSOSNotifyCountdownViewModel" conformsToProtocol:@"PHCountdownViewModel"];
}

- (void)pause
{
  v2.receiver = self;
  v2.super_class = (Class)PHCountdownViewAccessibility;
  [(PHCountdownViewAccessibility *)&v2 pause];
  [(id)*MEMORY[0x263F1D020] _accessibilitySetIsDictationListeningOverride:0];
}

- (void)stop
{
  v2.receiver = self;
  v2.super_class = (Class)PHCountdownViewAccessibility;
  [(PHCountdownViewAccessibility *)&v2 stop];
  [(id)*MEMORY[0x263F1D020] _accessibilitySetIsDictationListeningOverride:0];
}

- (void)dealloc
{
  [(id)*MEMORY[0x263F1D020] _accessibilitySetIsDictationListeningOverride:0];
  v3.receiver = self;
  v3.super_class = (Class)PHCountdownViewAccessibility;
  [(PHCountdownViewAccessibility *)&v3 dealloc];
}

- (void)startCountdown
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  objc_super v3 = [(PHCountdownViewAccessibility *)self safeValueForKey:@"countdownViewModel"];
  if (UIAccessibilityIsVoiceOverRunning()) {
    uint64_t v4 = [v3 safeBoolForKey:@"playsSound"] ^ 1;
  }
  else {
    uint64_t v4 = 0;
  }
  v5 = AXLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [NSNumber numberWithBool:v4];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_2421F2000, v5, OS_LOG_TYPE_DEFAULT, "Are we quiet: %@", (uint8_t *)&buf, 0xCu);
  }
  if (v4)
  {
    v7 = AXLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_2421F2000, v7, OS_LOG_TYPE_DEFAULT, "Marking VO to be quiet since we're in quiet mode", (uint8_t *)&buf, 2u);
    }

    [(id)*MEMORY[0x263F1D020] _accessibilitySetIsDictationListeningOverride:MEMORY[0x263EFFA88]];
    UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], &stru_26F6D4890);
    v17.receiver = self;
    v17.super_class = (Class)PHCountdownViewAccessibility;
    [(PHCountdownViewAccessibility *)&v17 startCountdown];
  }
  else
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v19 = 0x2020000000;
    uint64_t v20 = 0;
    uint64_t v20 = [v3 safeUnsignedIntegerForKey:@"countdown"];
    v8 = [v3 safeValueForKey:@"_axAnnouncementString"];
    UIAccessibilitySpeakAndDoNotBeInterrupted();
    v16.receiver = self;
    v16.super_class = (Class)PHCountdownViewAccessibility;
    [(PHCountdownViewAccessibility *)&v16 startCountdown];
    [v3 safeTimeIntervalForKey:@"countdownTickDuration"];
    double v10 = v9;
    v11 = (void *)MEMORY[0x263EFFA20];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __46__PHCountdownViewAccessibility_startCountdown__block_invoke;
    v13[3] = &unk_26512A088;
    v13[4] = self;
    p_long long buf = &buf;
    id v14 = v3;
    v12 = [v11 scheduledTimerWithTimeInterval:1 repeats:v13 block:v10];
    [(PHCountdownViewAccessibility *)self _axSetAnnouncementTimer:v12];

    _Block_object_dispose(&buf, 8);
  }
}

void __46__PHCountdownViewAccessibility_startCountdown__block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) safeBoolForKey:@"pauseTimer"] & 1) == 0)
  {
    if (--*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      id v3 = *(id *)(a1 + 40);
      AXPerformSafeBlock();
    }
    else
    {
      id v2 = [*(id *)(a1 + 32) _axAnnouncementTimer];
      [v2 invalidate];
      [*(id *)(a1 + 32) _axSetAnnouncementTimer:0];
    }
  }
}

void __46__PHCountdownViewAccessibility_startCountdown__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) countdownString:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  UIAccessibilitySpeak();
}

@end
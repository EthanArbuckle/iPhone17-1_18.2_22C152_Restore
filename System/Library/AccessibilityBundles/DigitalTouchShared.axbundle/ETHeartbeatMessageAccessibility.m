@interface ETHeartbeatMessageAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityMessageTypeString;
- (id)accessibilityLabel;
- (void)_displayInScene:(id)a3 useDuration:(BOOL)a4 fastStart:(BOOL)a5;
- (void)stopPlaying;
@end

@implementation ETHeartbeatMessageAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ETHeartbeatMessage";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"ETHeartbeatMessage"];
  [v3 validateClass:@"ETHeartbeatMessage" isKindOfClass:@"ETMessage"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ETHeartbeatMessage", @"_displayInScene: useDuration: fastStart:", "v", "@", "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ETHeartbeatMessage", @"stopPlaying", "v", 0);
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"heartbeat.label");
}

- (id)_accessibilityMessageTypeString
{
  return accessibilityLocalizedString(@"heartbeat");
}

- (void)_displayInScene:(id)a3 useDuration:(BOOL)a4 fastStart:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  if (UIAccessibilityIsVoiceOverRunning())
  {
    UIAccessibilityPostNotification(0x418u, 0);
    _axSetIsWaitingOnETMessageStart(1);
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    v12 = __73__ETHeartbeatMessageAccessibility__displayInScene_useDuration_fastStart___block_invoke;
    v13 = &unk_26511CD18;
    BOOL v16 = v6;
    BOOL v17 = v5;
    id v14 = v8;
    v15 = self;
    AXPerformBlockOnMainThreadAfterDelay();
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)ETHeartbeatMessageAccessibility;
    [(ETHeartbeatMessageAccessibility *)&v9 _displayInScene:v8 useDuration:v6 fastStart:v5];
  }
}

uint64_t __73__ETHeartbeatMessageAccessibility__displayInScene_useDuration_fastStart___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 49);
  v5.receiver = *(id *)(a1 + 40);
  v5.super_class = (Class)ETHeartbeatMessageAccessibility;
  objc_msgSendSuper2(&v5, sel__displayInScene_useDuration_fastStart_, v1, v2, v3);
  return _axSetIsWaitingOnETMessageStart(0);
}

- (void)stopPlaying
{
  v2.receiver = self;
  v2.super_class = (Class)ETHeartbeatMessageAccessibility;
  [(ETHeartbeatMessageAccessibility *)&v2 stopPlaying];
  UIAccessibilityPostNotification(0x419u, 0);
}

@end
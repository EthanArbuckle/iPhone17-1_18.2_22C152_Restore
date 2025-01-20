@interface PhoneApplicationAccesssibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityAllowsNotificationsDuringSuspension;
- (BOOL)accessibilityStartStopToggle;
- (id)_accessibilitySoftwareMimicKeyboard;
@end

@implementation PhoneApplicationAccesssibility

+ (id)safeCategoryTargetClassName
{
  return @"PhoneApplication";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PhoneTabBarController"];
  [v3 validateClass:@"PHVoicemailGreetingViewController"];
  [v3 validateClass:@"MPVoicemailTableViewController"];
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"PHVoicemailPlayerController", @"sharedPlayerController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PhoneApplication", @"rootViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHAudioRecorder", @"stop", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHVoicemailPlayerController", @"isPlaying", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHVoicemailPlayerController", @"pause", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHVoicemailPlayerController", @"play", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPVoicemailTableViewController", @"detailIndexPath", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHVoicemailGreetingViewController", @"recordStopButtonTapped", "v", 0);
  [v3 validateClass:@"PhoneRootViewController"];
  [v3 validateClass:@"PhoneTabBarController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PhoneTabBarController", @"keypadViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PhoneTabBarController", @"currentTabViewType", "i", 0);
  [v3 validateClass:@"MPKeypadViewController" isKindOfClass:@"DialerController"];
  [v3 validateClass:@"DialerController" hasInstanceVariable:@"_dialerView" withType:"PHAbstractDialerView"];
  [v3 validateClass:@"PhoneTabBarController" hasInstanceVariable:@"_voicemailViewController" withType:"PHVoicemailNavigationController"];
  [v3 validateClass:@"PHVoicemailNavigationController" hasInstanceVariable:@"_inboxViewController" withType:"MPVoicemailTableViewController<PHVoicemailListProtocol>"];
  [v3 validateClass:@"MPVoicemailTableViewController" isKindOfClass:@"UITableViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHAbstractDialerView", @"phonePadView", "@", 0);
}

- (id)_accessibilitySoftwareMimicKeyboard
{
  __int16 v14 = 0;
  id v3 = [(PhoneApplicationAccesssibility *)self safeValueForKey:@"rootViewController"];
  v4 = __UIAccessibilitySafeClass();

  v5 = [v4 safeValueForKey:@"baseViewController"];
  v6 = __UIAccessibilitySafeClass();

  if ([v6 safeIntForKey:@"currentTabViewType"] == 4)
  {
    v7 = [v6 safeValueForKey:@"keypadViewController"];
    v8 = __UIAccessibilitySafeClass();

    HIBYTE(v14) = 0;
    v9 = [v8 safeValueForKey:@"_dialerView"];
    v10 = __UIAccessibilitySafeClass();

    v11 = [v10 safeValueForKey:@"phonePadView"];
    if ([v11 _accessibilityViewIsVisible])
    {

      goto LABEL_6;
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)PhoneApplicationAccesssibility;
  v11 = [(PhoneApplicationAccesssibility *)&v13 _accessibilitySoftwareMimicKeyboard];
LABEL_6:

  return v11;
}

- (BOOL)accessibilityStartStopToggle
{
  v20.receiver = self;
  v20.super_class = (Class)PhoneApplicationAccesssibility;
  if (![(PhoneApplicationAccesssibility *)&v20 accessibilityStartStopToggle])
  {
    id v3 = [(PhoneApplicationAccesssibility *)self safeValueForKey:@"rootViewController"];
    v4 = __UIAccessibilitySafeClass();

    v5 = [v4 safeValueForKey:@"baseViewController"];

    NSClassFromString(&cfstr_Phonetabbarcon.isa);
    if (objc_opt_isKindOfClass())
    {
      v6 = [v5 safeValueForKey:@"modalViewController"];
      v7 = [v6 safeValueForKey:@"visibleViewController"];

      NSClassFromString(&cfstr_Phvoicemailgre_0.isa);
      if (objc_opt_isKindOfClass())
      {
        id v19 = v7;
        AXPerformSafeBlock();
      }
      v8 = [v5 safeValueForKey:@"_voicemailViewController"];
      NSClassFromString(&cfstr_Phvoicemailnav.isa);
      if (objc_opt_isKindOfClass())
      {
        v9 = [v8 safeValueForKey:@"_inboxViewController"];
        v10 = [v9 safeValueForKey:@"selectedVoicemail"];
        if (v10)
        {
          objc_opt_class();
          v11 = [v9 safeValueForKey:@"detailIndexPath"];
          v12 = __UIAccessibilityCastAsClass();

          objc_opt_class();
          objc_super v13 = [v9 safeValueForKey:@"tableView"];
          __int16 v14 = __UIAccessibilityCastAsClass();

          v15 = [v14 cellForRowAtIndexPath:v12];

          if (v15)
          {
            v18 = [NSClassFromString(&cfstr_Phvoicemailpla.isa) safeValueForKey:@"sharedPlayerController"];
            id v16 = v18;
            AXPerformSafeBlock();
          }
        }
      }
    }
  }
  return 1;
}

uint64_t __62__PhoneApplicationAccesssibility_accessibilityStartStopToggle__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) recordStopButtonTapped];
}

uint64_t __62__PhoneApplicationAccesssibility_accessibilityStartStopToggle__block_invoke_2(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) safeBoolForKey:@"isPlaying"];
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    return [v3 pause];
  }
  else
  {
    return [v3 play];
  }
}

- (BOOL)_accessibilityAllowsNotificationsDuringSuspension
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  AXPerformBlockSynchronouslyOnMainThread();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

void __83__PhoneApplicationAccesssibility__accessibilityAllowsNotificationsDuringSuspension__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F7E1A0] sharedInstance];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v2 currentCallCount] != 0;
}

@end
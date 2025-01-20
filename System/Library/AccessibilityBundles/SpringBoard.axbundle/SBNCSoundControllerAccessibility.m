@interface SBNCSoundControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsAlarmRinging;
- (void)_killSounds;
- (void)playSoundForNotificationRequest:(id)a3 presentingDestination:(id)a4;
- (void)stopSoundForNotificationRequest:(id)a3;
@end

@implementation SBNCSoundControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBNCSoundController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBNCSoundController" hasInstanceVariable:@"_playingSounds" withType:"NSMutableDictionary"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBNCSoundController", @"playSoundForNotificationRequest:presentingDestination:", "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBNCSoundController", @"_killSounds", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBNCSoundController", @"stopSoundForNotificationRequest:", "v", "@", 0);
}

- (BOOL)_accessibilityIsAlarmRinging
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = [(SBNCSoundControllerAccessibility *)self _accessibilityValueForKey:@"AXAlarmSoundPlayingDataKey"];
  v4 = [(SBNCSoundControllerAccessibility *)self safeDictionaryForKey:@"_playingSounds"];
  v5 = [v4 objectForKey:v3];

  v6 = AXLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8[0] = 67109120;
    v8[1] = v5 != 0;
    _os_log_impl(&dword_242561000, v6, OS_LOG_TYPE_INFO, "Query is alarm ringing: %d", (uint8_t *)v8, 8u);
  }

  return v5 != 0;
}

- (void)playSoundForNotificationRequest:(id)a3 presentingDestination:(id)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBNCSoundControllerAccessibility;
  [(SBNCSoundControllerAccessibility *)&v13 playSoundForNotificationRequest:v6 presentingDestination:a4];
  v7 = [v6 sectionIdentifier];
  int v8 = [v7 isEqualToString:@"com.apple.mobiletimer"];

  if (v8)
  {
    uint64_t v9 = [(SBNCSoundControllerAccessibility *)self safeDictionaryForKey:@"_playingSounds"];
    v10 = [v6 notificationIdentifier];
    v11 = [v9 objectForKey:v10];

    if (v11)
    {
      v12 = [v6 notificationIdentifier];
      [(SBNCSoundControllerAccessibility *)self _accessibilitySetRetainedValue:v12 forKey:@"AXAlarmSoundPlayingDataKey"];
    }
  }
}

- (void)_killSounds
{
  v3.receiver = self;
  v3.super_class = (Class)SBNCSoundControllerAccessibility;
  [(SBNCSoundControllerAccessibility *)&v3 _killSounds];
  [(SBNCSoundControllerAccessibility *)self _accessibilityRemoveValueForKey:@"AXAlarmSoundPlayingDataKey"];
}

- (void)stopSoundForNotificationRequest:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBNCSoundControllerAccessibility;
  [(SBNCSoundControllerAccessibility *)&v4 stopSoundForNotificationRequest:a3];
  [(SBNCSoundControllerAccessibility *)self _accessibilityRemoveValueForKey:@"AXAlarmSoundPlayingDataKey"];
}

@end
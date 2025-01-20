@interface GAXSBVoiceControlControllerOverride
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)handleHeadsetButtonUp;
- (BOOL)handleHeadsetButtonUpNotInCall;
- (BOOL)handleHomeButtonHeld;
- (void)bluetoothDeviceEndedVoiceControl:(id)a3;
- (void)bluetoothDeviceInitiatedVoiceControl:(id)a3;
- (void)handleHeadsetButtonDownWithClickCount:(unint64_t)a3;
@end

@implementation GAXSBVoiceControlControllerOverride

+ (id)safeCategoryTargetClassName
{
  return @"SBVoiceControlController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBVoiceControlController", @"bluetoothDeviceEndedVoiceControl:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBVoiceControlController", @"bluetoothDeviceInitiatedVoiceControl:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBVoiceControlController", @"handleHeadsetButtonDownWithClickCount:", "v", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBVoiceControlController", @"handleHeadsetButtonUp", "B", 0, 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBVoiceControlController", @"handleHeadsetButtonUpNotInCall", "B", 0, 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBVoiceControlController", @"handleHomeButtonHeld", "B", 0, 0);
}

- (BOOL)handleHomeButtonHeld
{
  id v3 = +[GAXSpringboard sharedInstance];
  if (([v3 isActive] & 1) != 0
    || ([v3 wantsSingleAppModeOrAppSelfLockMode] & 1) != 0)
  {
    BOOL v4 = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)GAXSBVoiceControlControllerOverride;
    BOOL v4 = [(GAXSBVoiceControlControllerOverride *)&v6 handleHomeButtonHeld];
  }

  return v4;
}

- (void)handleHeadsetButtonDownWithClickCount:(unint64_t)a3
{
  v5 = +[GAXSpringboard sharedInstance];
  if (([v5 isActive] & 1) == 0
    && ([v5 wantsSingleAppModeOrAppSelfLockMode] & 1) == 0)
  {
    v6.receiver = self;
    v6.super_class = (Class)GAXSBVoiceControlControllerOverride;
    [(GAXSBVoiceControlControllerOverride *)&v6 handleHeadsetButtonDownWithClickCount:a3];
  }
}

- (BOOL)handleHeadsetButtonUp
{
  id v3 = +[GAXSpringboard sharedInstance];
  if (([v3 isActive] & 1) != 0
    || ([v3 wantsSingleAppModeOrAppSelfLockMode] & 1) != 0)
  {
    BOOL v4 = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)GAXSBVoiceControlControllerOverride;
    BOOL v4 = [(GAXSBVoiceControlControllerOverride *)&v6 handleHeadsetButtonUp];
  }

  return v4;
}

- (BOOL)handleHeadsetButtonUpNotInCall
{
  id v3 = +[GAXSpringboard sharedInstance];
  if (([v3 isActive] & 1) != 0
    || ([v3 wantsSingleAppModeOrAppSelfLockMode] & 1) != 0)
  {
    BOOL v4 = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)GAXSBVoiceControlControllerOverride;
    BOOL v4 = [(GAXSBVoiceControlControllerOverride *)&v6 handleHeadsetButtonUpNotInCall];
  }

  return v4;
}

- (void)bluetoothDeviceInitiatedVoiceControl:(id)a3
{
  id v4 = a3;
  v5 = +[GAXSpringboard sharedInstance];
  if (([v5 isActive] & 1) == 0
    && ([v5 wantsSingleAppModeOrAppSelfLockMode] & 1) == 0)
  {
    v6.receiver = self;
    v6.super_class = (Class)GAXSBVoiceControlControllerOverride;
    [(GAXSBVoiceControlControllerOverride *)&v6 bluetoothDeviceInitiatedVoiceControl:v4];
  }
}

- (void)bluetoothDeviceEndedVoiceControl:(id)a3
{
  id v4 = a3;
  v5 = +[GAXSpringboard sharedInstance];
  if (([v5 isActive] & 1) == 0
    && ([v5 wantsSingleAppModeOrAppSelfLockMode] & 1) == 0)
  {
    v6.receiver = self;
    v6.super_class = (Class)GAXSBVoiceControlControllerOverride;
    [(GAXSBVoiceControlControllerOverride *)&v6 bluetoothDeviceEndedVoiceControl:v4];
  }
}

@end
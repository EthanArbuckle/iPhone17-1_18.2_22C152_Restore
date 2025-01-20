@interface UIColorEffect
+ (id)inCallControls;
+ (id)inCallControlsButtonAvatarOnly;
+ (id)inCallControlsEmergencyCallButton;
+ (id)inCallControlsKeypadButton;
@end

@implementation UIColorEffect

+ (id)inCallControls
{
  id v2 = static UIColorEffect.inCallControls.getter();

  return v2;
}

+ (id)inCallControlsButtonAvatarOnly
{
  id v2 = static UIColorEffect.inCallControlsButtonNoPhotoNoAvatar.getter();

  return v2;
}

+ (id)inCallControlsKeypadButton
{
  id v2 = static UIColorEffect.inCallControlsKeypadButton.getter();

  return v2;
}

+ (id)inCallControlsEmergencyCallButton
{
  id v2 = static UIColorEffect.inCallControlsEmergencyCallButton.getter();

  return v2;
}

@end
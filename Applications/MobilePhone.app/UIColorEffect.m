@interface UIColorEffect
+ (id)inCallControls;
+ (id)inCallControlsButtonAvatarOnly;
+ (id)inCallControlsButtonNoPhotoNoAvatar;
+ (id)inCallControlsEmergencyCallButton;
+ (id)inCallControlsKeypadButton;
@end

@implementation UIColorEffect

+ (id)inCallControls
{
  return @objc static UIColorEffect.inCallControls.getter((__n128)xmmword_100206BF0, (__n128)xmmword_100206C00, (__n128)xmmword_100206C10, (__n128)xmmword_100206C20);
}

+ (id)inCallControlsButtonAvatarOnly
{
  return @objc static UIColorEffect.inCallControls.getter((__n128)xmmword_100206C30, (__n128)xmmword_100206C40, (__n128)xmmword_100206C50, (__n128)xmmword_100206C60);
}

+ (id)inCallControlsButtonNoPhotoNoAvatar
{
  return @objc static UIColorEffect.inCallControls.getter((__n128)xmmword_100206C30, (__n128)xmmword_100206C40, (__n128)xmmword_100206C50, (__n128)xmmword_100206C60);
}

+ (id)inCallControlsKeypadButton
{
  v3[0] = xmmword_100206C70;
  v3[1] = xmmword_100206C80;
  v3[2] = xmmword_100206C90;
  int v4 = 1067567809;
  uint64_t v6 = 0;
  uint64_t v5 = 0;
  int v7 = 0;
  uint64_t v8 = 1065353216;
  id result = [self _colorEffectCAMatrix:v3];
  if (result)
  {
    return result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

+ (id)inCallControlsEmergencyCallButton
{
  return @objc static UIColorEffect.inCallControls.getter((__n128)xmmword_100206CA0, (__n128)xmmword_100206CB0, (__n128)xmmword_100206CC0, (__n128)xmmword_100206CD0);
}

@end
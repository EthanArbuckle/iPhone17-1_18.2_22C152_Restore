@interface CAMViewfinderLockScreenExtensionHelper
+ (void)beginDelayingAppearance;
+ (void)endDelayingAppearance;
+ (void)executeUnlockOneUpAction:(unint64_t)a3 on:(id)a4;
+ (void)notifyCompleteTransition;
- (CAMViewfinderLockScreenExtensionHelper)init;
@end

@implementation CAMViewfinderLockScreenExtensionHelper

+ (void)executeUnlockOneUpAction:(unint64_t)a3 on:(id)a4
{
  id v6 = a4;
  _s8CameraUI35ViewfinderLockScreenExtensionHelperC24executeUnlockOneUpAction_2onySo014PXUnlockDeviceL4TypeV_So05PUOneK14ViewControllerCSgtFZ_0((id)a3, a4);
}

+ (void)beginDelayingAppearance
{
}

+ (void)endDelayingAppearance
{
}

+ (void)notifyCompleteTransition
{
}

- (CAMViewfinderLockScreenExtensionHelper)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(CAMViewfinderLockScreenExtensionHelper *)&v3 init];
}

@end
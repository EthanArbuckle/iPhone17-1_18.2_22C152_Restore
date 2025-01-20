@interface UIWindow(AVAdditions_Internal_Mobile)
- (uint64_t)avkit_canAttemptRotation;
- (uint64_t)avkit_canAttemptSecondWindowForRotability;
- (uint64_t)avkit_isHostedInAnotherProcess;
- (uint64_t)avkit_preferredInterfaceOrientationFromDeviceOrientation;
- (uint64_t)avkit_supportsAutorotationForInterfaceOrientationMask:()AVAdditions_Internal_Mobile;
@end

@implementation UIWindow(AVAdditions_Internal_Mobile)

- (uint64_t)avkit_supportsAutorotationForInterfaceOrientationMask:()AVAdditions_Internal_Mobile
{
  uint64_t result = objc_msgSend(a1, "avkit_canAttemptRotation");
  if (result)
  {
    uint64_t v6 = 1;
    while (1)
    {
      if (((1 << v6) & a3) != 0)
      {
        uint64_t result = [a1 _shouldAutorotateToInterfaceOrientation:v6];
        if (!result) {
          break;
        }
      }
      if (++v6 == 6) {
        return 1;
      }
    }
  }
  return result;
}

- (uint64_t)avkit_canAttemptSecondWindowForRotability
{
  char v3 = [a1 _windowOwnsInterfaceOrientation];
  if ((v3 & 1) == 0)
  {
    v1 = [a1 windowScene];
    if (![v1 _canDynamicallySpecifySupportedInterfaceOrientations])
    {
      uint64_t v4 = 0;
      goto LABEL_10;
    }
  }
  if ([a1 _windowControlsStatusBarOrientation]
    && [a1 _shouldControlAutorotation])
  {
    uint64_t v4 = objc_msgSend(a1, "avkit_isHostedInAnotherProcess") ^ 1;
    uint64_t result = v4;
    if (v3) {
      return result;
    }
LABEL_10:

    return v4;
  }
  uint64_t v4 = 0;
  uint64_t result = 0;
  if ((v3 & 1) == 0) {
    goto LABEL_10;
  }
  return result;
}

- (uint64_t)avkit_canAttemptRotation
{
  uint64_t result = [a1 autorotates];
  if (result)
  {
    return objc_msgSend(a1, "avkit_canAttemptSecondWindowForRotability");
  }
  return result;
}

- (uint64_t)avkit_preferredInterfaceOrientationFromDeviceOrientation
{
  uint64_t v2 = [a1 _windowInterfaceOrientation];
  if (objc_msgSend(a1, "avkit_canAttemptRotation"))
  {
    char v3 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v4 = [v3 orientation];
    if ((unint64_t)(v4 - 3) >= 2)
    {
      if (v4 == 2)
      {
        uint64_t v6 = [MEMORY[0x1E4FB16C8] currentDevice];
        uint64_t v7 = [v6 userInterfaceIdiom];

        if (v7 != 1) {
          return v2;
        }
        goto LABEL_6;
      }
      if (v4 != 1)
      {
LABEL_7:

        return v2;
      }
    }

LABEL_6:
    char v3 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v2 = [v3 orientation];
    goto LABEL_7;
  }
  return v2;
}

- (uint64_t)avkit_isHostedInAnotherProcess
{
  if (objc_opt_respondsToSelector())
  {
    return [a1 _isHostedInAnotherProcess];
  }
  else
  {
    objc_opt_class();
    return objc_opt_isKindOfClass() & 1;
  }
}

@end
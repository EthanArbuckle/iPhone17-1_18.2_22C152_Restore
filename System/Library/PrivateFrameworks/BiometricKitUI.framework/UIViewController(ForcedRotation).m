@interface UIViewController(ForcedRotation)
+ (uint64_t)bkui_reverseLeftRight:()ForcedRotation;
- (uint64_t)bkui_deviceOrientationForIterfaceOrientation:()ForcedRotation;
- (uint64_t)bkui_reverseLeftRight:()ForcedRotation;
- (uint64_t)bkui_uiforDeviceOrientation:()ForcedRotation;
- (void)bkui_rotateView:()ForcedRotation fromOrientation:toOrientation:containerBounds:animatedDuration:alongSide:completion:;
@end

@implementation UIViewController(ForcedRotation)

- (uint64_t)bkui_uiforDeviceOrientation:()ForcedRotation
{
  if (a3 > 6) {
    return 1;
  }
  else {
    return qword_1E4BD1758[a3];
  }
}

- (void)bkui_rotateView:()ForcedRotation fromOrientation:toOrientation:containerBounds:animatedDuration:alongSide:completion:
{
  id v21 = a8;
  v22 = a11;
  v23 = a12;
  if (a9 == a10)
  {
    if (v22) {
      v22[2](v22, 1.0);
    }
    if (v23) {
      v23[2](v23, 1);
    }
  }
  else
  {
    v24 = (void *)MEMORY[0x1E4F42FF0];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __136__UIViewController_ForcedRotation__bkui_rotateView_fromOrientation_toOrientation_containerBounds_animatedDuration_alongSide_completion___block_invoke;
    v25[3] = &unk_1E6EA2AE8;
    id v26 = v21;
    uint64_t v28 = a9;
    uint64_t v29 = a10;
    double v30 = a1;
    double v31 = a2;
    double v32 = a3;
    double v33 = a4;
    v27 = v22;
    [v24 animateWithDuration:v25 animations:v23 completion:a5];
  }
}

- (uint64_t)bkui_deviceOrientationForIterfaceOrientation:()ForcedRotation
{
  if ((unint64_t)(a3 - 1) > 3) {
    return 0;
  }
  else {
    return qword_1E4BD1818[a3 - 1];
  }
}

- (uint64_t)bkui_reverseLeftRight:()ForcedRotation
{
  return objc_msgSend(MEMORY[0x1E4F42FF8], "bkui_reverseLeftRight:");
}

+ (uint64_t)bkui_reverseLeftRight:()ForcedRotation
{
  uint64_t v3 = 3;
  if (a3 == 3) {
    uint64_t v3 = 4;
  }
  if ((unint64_t)(a3 - 5) >= 0xFFFFFFFFFFFFFFFELL) {
    return v3;
  }
  else {
    return a3;
  }
}

@end
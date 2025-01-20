@interface UIView(CEKFluidBehaviorSettings)
+ (void)cek_animateWithSettings:()CEKFluidBehaviorSettings interactive:animations:completion:;
+ (void)cek_animateWithSettings:()CEKFluidBehaviorSettings mode:animations:completion:;
@end

@implementation UIView(CEKFluidBehaviorSettings)

+ (void)cek_animateWithSettings:()CEKFluidBehaviorSettings interactive:animations:completion:
{
  id v15 = a3;
  id v9 = a5;
  id v10 = a6;
  uint64_t v11 = [v15 behaviorType];
  if ((unint64_t)(v11 - 1) >= 2)
  {
    if (v11) {
      goto LABEL_6;
    }
    v14 = (void *)MEMORY[0x1E4FB1EB0];
    v13 = _CEKModifyFrameRateForAnimationBlockFromSettings(v9, v15);
    [v14 _animateWithFrictionBounceAnimations:v13 completion:v10];
  }
  else
  {
    v12 = (void *)MEMORY[0x1E4FB1EB0];
    v13 = _CEKModifyFrameRateForAnimationBlockFromSettings(v9, v15);
    [v12 _animateUsingSpringBehavior:v15 tracking:a4 animations:v13 completion:v10];
  }

LABEL_6:
}

+ (void)cek_animateWithSettings:()CEKFluidBehaviorSettings mode:animations:completion:
{
  id v17 = a3;
  id v10 = a5;
  uint64_t v11 = a6;
  switch(a4)
  {
    case 1:
      v10[2](v10);
      if (v11) {
        goto LABEL_5;
      }
      break;
    case 2:
      [MEMORY[0x1E4FB1EB0] _performWithoutRetargetingAnimations:v10];
      if (v11) {
LABEL_5:
      }
        v11[2](v11, 1, 0);
      break;
    case 3:
      v12 = a1;
      id v13 = v17;
      uint64_t v14 = 0;
      goto LABEL_9;
    case 4:
      id v15 = (void *)MEMORY[0x1E4FB1EB0];
      v16 = _CEKModifyFrameRateForAnimationBlockFromSettings(v10, v17);
      [v15 _animateByRetargetingAnimations:v16 completion:v11];

      break;
    case 5:
      v12 = a1;
      id v13 = v17;
      uint64_t v14 = 1;
LABEL_9:
      objc_msgSend(v12, "cek_animateWithSettings:interactive:animations:completion:", v13, v14, v10, v11);
      break;
    default:
      break;
  }
}

@end
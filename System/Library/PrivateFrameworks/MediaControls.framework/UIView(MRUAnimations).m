@interface UIView(MRUAnimations)
+ (uint64_t)mru_animateUsingType:()MRUAnimations animations:;
+ (uint64_t)mru_animateWithSpringParameters:()MRUAnimations options:animations:;
+ (uint64_t)mru_animateWithSpringParameters:()MRUAnimations options:animations:completion:;
+ (void)mru_animateUsingType:()MRUAnimations animations:completion:;
@end

@implementation UIView(MRUAnimations)

+ (void)mru_animateUsingType:()MRUAnimations animations:completion:
{
  id v8 = a4;
  id v9 = a5;
  switch(a3)
  {
    case 2:
      v10 = [MEMORY[0x1E4FB1EE0] behaviorWithDampingRatio:0.8165 response:0.51302];
      v11 = (void *)MEMORY[0x1E4FB1EB0];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __68__UIView_MRUAnimations__mru_animateUsingType_animations_completion___block_invoke_4;
      v16[3] = &unk_1E5F0FB08;
      id v17 = v8;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __68__UIView_MRUAnimations__mru_animateUsingType_animations_completion___block_invoke_5;
      v14[3] = &unk_1E5F0FB30;
      id v15 = v9;
      [v11 _animateUsingSpringBehavior:v10 tracking:0 animations:v16 completion:v14];

      v12 = v17;
LABEL_7:

      goto LABEL_8;
    case 1:
      v10 = [MEMORY[0x1E4FB1EE0] behaviorWithDampingRatio:0.8165 response:0.51302];
      v13 = (void *)MEMORY[0x1E4FB1EB0];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __68__UIView_MRUAnimations__mru_animateUsingType_animations_completion___block_invoke_2;
      v20[3] = &unk_1E5F0FB08;
      id v21 = v8;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __68__UIView_MRUAnimations__mru_animateUsingType_animations_completion___block_invoke_3;
      v18[3] = &unk_1E5F0FB30;
      id v19 = v9;
      [v13 _animateUsingSpringBehavior:v10 tracking:0 animations:v20 completion:v18];

      v12 = v21;
      goto LABEL_7;
    case 0:
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __68__UIView_MRUAnimations__mru_animateUsingType_animations_completion___block_invoke;
      v22[3] = &unk_1E5F0FB08;
      id v23 = v8;
      [a1 _animateUsingSpringWithDuration:1 delay:v22 options:v9 mass:0.8 stiffness:0.0 damping:2.0 initialVelocity:300.0 animations:42.0 completion:0.0];
      v10 = v23;
LABEL_8:

      break;
  }
}

+ (uint64_t)mru_animateUsingType:()MRUAnimations animations:
{
  return objc_msgSend(a1, "mru_animateUsingType:animations:completion:", a3, a4, 0);
}

+ (uint64_t)mru_animateWithSpringParameters:()MRUAnimations options:animations:
{
  long long v5 = *(_OWORD *)(a3 + 16);
  v7[0] = *(_OWORD *)a3;
  v7[1] = v5;
  uint64_t v8 = *(void *)(a3 + 32);
  return objc_msgSend(a1, "mru_animateWithSpringParameters:options:animations:completion:", v7, a4, a5, 0);
}

+ (uint64_t)mru_animateWithSpringParameters:()MRUAnimations options:animations:completion:
{
  return [MEMORY[0x1E4FB1EB0] _animateUsingSpringWithDuration:a4 delay:a5 options:a6 mass:*a3 stiffness:0.0 damping:a3[1] initialVelocity:a3[3] animations:a3[2] completion:a3[4]];
}

@end
@interface UIView(FIUIUtilities)
+ (uint64_t)fiui_animateIfNeededWithDuration:()FIUIUtilities animations:;
+ (void)fiui_animateIfNeededWithDuration:()FIUIUtilities animations:completion:;
+ (void)fiui_animateIfNeededWithDuration:()FIUIUtilities delay:options:animations:completion:;
@end

@implementation UIView(FIUIUtilities)

+ (uint64_t)fiui_animateIfNeededWithDuration:()FIUIUtilities animations:
{
  return objc_msgSend(a1, "fiui_animateIfNeededWithDuration:animations:completion:", a3, 0);
}

+ (void)fiui_animateIfNeededWithDuration:()FIUIUtilities animations:completion:
{
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v8)
  {
    if (a2 >= 2.22044605e-16)
    {
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __80__UIView_FIUIUtilities__fiui_animateIfNeededWithDuration_animations_completion___block_invoke;
      v11[3] = &unk_2644A7990;
      v12 = v9;
      [a1 animateWithDuration:v8 animations:v11 completion:a2];
    }
    else
    {
      v8[2](v8);
      if (v10) {
        v10[2](v10);
      }
    }
  }
}

+ (void)fiui_animateIfNeededWithDuration:()FIUIUtilities delay:options:animations:completion:
{
  v12 = a6;
  v13 = a7;
  v14 = v13;
  if (v12)
  {
    if (a2 >= 2.22044605e-16)
    {
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __94__UIView_FIUIUtilities__fiui_animateIfNeededWithDuration_delay_options_animations_completion___block_invoke;
      v15[3] = &unk_2644A7990;
      v16 = v13;
      [a1 animateWithDuration:a5 delay:v12 options:v15 animations:a2 completion:a3];
    }
    else
    {
      v12[2](v12);
      if (v14) {
        v14[2](v14);
      }
    }
  }
}

@end
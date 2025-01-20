@interface UIView
@end

@implementation UIView

void __76__UIView_LPExtras___lp_applyAndRegisterForUpdatesToValue_withApplyCallback___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v8 = v3;
  v6 = [v3 traitCollection];
  v7 = [v5 valueForAppearance:v6];
  (*(void (**)(uint64_t, id, void *))(v4 + 16))(v4, v8, v7);
}

@end
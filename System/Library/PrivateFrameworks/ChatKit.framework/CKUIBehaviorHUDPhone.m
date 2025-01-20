@interface CKUIBehaviorHUDPhone
- (BOOL)entryFieldShouldUseBackdropView;
- (BOOL)joystickUsesWindow;
- (BOOL)usesActionMenu;
- (UIEdgeInsets)entryViewHorizontalCoverInsets;
- (UIEdgeInsets)entryViewVerticalCoverInsets;
- (id)theme;
@end

@implementation CKUIBehaviorHUDPhone

- (id)theme
{
  if (theme_once_5891 != -1) {
    dispatch_once(&theme_once_5891, &__block_literal_global_5893);
  }
  v2 = (void *)theme_sBehavior_5890;

  return v2;
}

void __29__CKUIBehaviorHUDPhone_theme__block_invoke()
{
  v0 = objc_alloc_init(CKUIThemeHUD);
  v1 = (void *)theme_sBehavior_5890;
  theme_sBehavior_5890 = (uint64_t)v0;
}

- (BOOL)joystickUsesWindow
{
  if (joystickUsesWindow_once_5896 != -1) {
    dispatch_once(&joystickUsesWindow_once_5896, &__block_literal_global_5898);
  }
  return 0;
}

- (BOOL)entryFieldShouldUseBackdropView
{
  if (entryFieldShouldUseBackdropView_once_5900 != -1) {
    dispatch_once(&entryFieldShouldUseBackdropView_once_5900, &__block_literal_global_5902);
  }
  return 0;
}

- (BOOL)usesActionMenu
{
  if (usesActionMenu_once_5904 != -1) {
    dispatch_once(&usesActionMenu_once_5904, &__block_literal_global_5906);
  }
  return 0;
}

- (UIEdgeInsets)entryViewVerticalCoverInsets
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__CKUIBehaviorHUDPhone_entryViewVerticalCoverInsets__block_invoke;
  block[3] = &unk_1E5620C40;
  block[4] = self;
  if (entryViewVerticalCoverInsets_once_5908 != -1) {
    dispatch_once(&entryViewVerticalCoverInsets_once_5908, block);
  }
  double v3 = *((double *)&entryViewVerticalCoverInsets_sBehavior_5907 + 1);
  double v2 = *(double *)&entryViewVerticalCoverInsets_sBehavior_5907;
  double v4 = *(double *)&qword_1E9250500;
  double v5 = unk_1E9250508;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

void __52__CKUIBehaviorHUDPhone_entryViewVerticalCoverInsets__block_invoke(uint64_t a1)
{
  double v2 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v2 _supportsForceTouch])
  {
    v8.receiver = *(id *)(a1 + 32);
    v8.super_class = (Class)CKUIBehaviorHUDPhone;
    objc_msgSendSuper2(&v8, sel_entryViewVerticalCoverInsets);
    *(void *)&entryViewVerticalCoverInsets_sBehavior_5907 = v3;
    *((void *)&entryViewVerticalCoverInsets_sBehavior_5907 + 1) = v4;
    qword_1E9250500 = v5;
    unk_1E9250508 = v6;
  }
  else
  {
    long long v7 = *(_OWORD *)(MEMORY[0x1E4F437F8] + 16);
    entryViewVerticalCoverInsets_sBehavior_5907 = *MEMORY[0x1E4F437F8];
    *(_OWORD *)&qword_1E9250500 = v7;
  }
}

- (UIEdgeInsets)entryViewHorizontalCoverInsets
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__CKUIBehaviorHUDPhone_entryViewHorizontalCoverInsets__block_invoke;
  block[3] = &unk_1E5620C40;
  block[4] = self;
  if (entryViewHorizontalCoverInsets_once_5912 != -1) {
    dispatch_once(&entryViewHorizontalCoverInsets_once_5912, block);
  }
  double v2 = *(double *)&entryViewHorizontalCoverInsets_sBehavior_5911_0;
  double v3 = *(double *)&entryViewHorizontalCoverInsets_sBehavior_5911_1;
  double v4 = *(double *)&entryViewHorizontalCoverInsets_sBehavior_5911_2;
  double v5 = *(double *)&entryViewHorizontalCoverInsets_sBehavior_5911_3;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

void __54__CKUIBehaviorHUDPhone_entryViewHorizontalCoverInsets__block_invoke(uint64_t a1)
{
  double v2 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v2 _supportsForceTouch])
  {
    v7.receiver = *(id *)(a1 + 32);
    v7.super_class = (Class)CKUIBehaviorHUDPhone;
    objc_msgSendSuper2(&v7, sel_entryViewHorizontalCoverInsets);
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    uint64_t v6 = 0;
  }
  entryViewHorizontalCoverInsets_sBehavior_5911_0 = v3;
  entryViewHorizontalCoverInsets_sBehavior_5911_1 = v4;
  entryViewHorizontalCoverInsets_sBehavior_5911_2 = v5;
  entryViewHorizontalCoverInsets_sBehavior_5911_3 = v6;
}

@end
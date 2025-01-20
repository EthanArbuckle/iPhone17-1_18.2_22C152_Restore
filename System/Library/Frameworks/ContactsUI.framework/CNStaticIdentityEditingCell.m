@interface CNStaticIdentityEditingCell
+ (BOOL)wantsHorizontalLayout;
+ (id)supportedPasteboardTypes;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (void)copy:(id)a3;
- (void)paste:(id)a3;
@end

@implementation CNStaticIdentityEditingCell

+ (id)supportedPasteboardTypes
{
  if (supportedPasteboardTypes_cn_once_token_1 != -1) {
    dispatch_once(&supportedPasteboardTypes_cn_once_token_1, &__block_literal_global_11576);
  }
  v2 = (void *)supportedPasteboardTypes_cn_once_object_1;

  return v2;
}

void __55__CNStaticIdentityEditingCell_supportedPasteboardTypes__block_invoke()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F226F0];
  v3[0] = *MEMORY[0x1E4F22688];
  v3[1] = v0;
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:2];
  v2 = (void *)supportedPasteboardTypes_cn_once_object_1;
  supportedPasteboardTypes_cn_once_object_1 = v1;
}

+ (BOOL)wantsHorizontalLayout
{
  return objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory") ^ 1;
}

- (void)copy:(id)a3
{
  id v4 = [a3 identity];
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A2A0] + 16))())
  {
    v3 = [MEMORY[0x1E4FB1A78] generalPasteboard];
    [v3 setString:v4];
  }
}

- (void)paste:(id)a3
{
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v5 = a4;
  if (sel_copy_ == a3)
  {
    char v6 = 1;
  }
  else if (sel_paste_ == a3)
  {
    v7 = [MEMORY[0x1E4FB1A78] generalPasteboard];
    v8 = [(id)objc_opt_class() supportedPasteboardTypes];
    char v6 = [v7 containsPasteboardTypes:v8];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

@end
@interface CCUIMenuModuleStackView
- (void)layoutSubviews;
@end

@implementation CCUIMenuModuleStackView

- (void)layoutSubviews
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __41__CCUIMenuModuleStackView_layoutSubviews__block_invoke;
  v2[3] = &unk_1E6AD41E8;
  v2[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v2];
}

id __41__CCUIMenuModuleStackView_layoutSubviews__block_invoke(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)CCUIMenuModuleStackView;
  return objc_msgSendSuper2(&v2, sel_layoutSubviews);
}

@end
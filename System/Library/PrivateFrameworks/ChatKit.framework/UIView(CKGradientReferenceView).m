@interface UIView(CKGradientReferenceView)
- (void)layoutGradientViewsIfNeeded;
- (void)setGradientViewsNeedLayout;
@end

@implementation UIView(CKGradientReferenceView)

- (void)setGradientViewsNeedLayout
{
  v2 = +[CKGradientView gradientViews];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __61__UIView_CKGradientReferenceView__setGradientViewsNeedLayout__block_invoke;
  v3[3] = &unk_1E56296B0;
  v3[4] = a1;
  [v2 enumerateObjectsUsingBlock:v3];
}

- (void)layoutGradientViewsIfNeeded
{
  v2 = +[CKGradientView gradientViews];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __62__UIView_CKGradientReferenceView__layoutGradientViewsIfNeeded__block_invoke;
  v3[3] = &unk_1E56296B0;
  v3[4] = a1;
  [v2 enumerateObjectsUsingBlock:v3];
}

@end
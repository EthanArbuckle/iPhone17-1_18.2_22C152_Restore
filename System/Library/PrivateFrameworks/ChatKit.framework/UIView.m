@interface UIView
@end

@implementation UIView

void __61__UIView_CKGradientReferenceView__setGradientViewsNeedLayout__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = [v5 referenceView];
  v4 = *(void **)(a1 + 32);

  if (v3 == v4) {
    [v5 setNeedsLayout];
  }
}

void __62__UIView_CKGradientReferenceView__layoutGradientViewsIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = [v5 referenceView];
  v4 = *(void **)(a1 + 32);

  if (v3 == v4) {
    [v5 layoutIfNeeded];
  }
}

uint64_t __77__UIView_CKMessageAcknowledgmentAnimations__messageAcknowledgmentBounceView___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 72);
  return [v1 setTransform:v4];
}

uint64_t __77__UIView_CKMessageAcknowledgmentAnimations__messageAcknowledgmentBounceView___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __95__UIView_CKMessageAcknowledgmentAnimations__messageAcknowledgmentShrinkViewToPoint_completion___block_invoke(uint64_t a1)
{
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  v3 = (void *)MEMORY[0x1E4F39CF8];

  return [v3 setDisableActions:0];
}

@end
@interface CLKUIBlinkingTimeLabelManager
@end

@implementation CLKUIBlinkingTimeLabelManager

void __48___CLKUIBlinkingTimeLabelManager__startBlinking__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateBlinkerAlphaForSecondFraction:*(double *)(a3 + 32)];
}

id __48___CLKUIBlinkingTimeLabelManager__startBlinking__block_invoke_139(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = _IdentifyingInfoForView(WeakRetained);

  return v2;
}

@end
@interface BSUIPartialStylingLabelView
@end

@implementation BSUIPartialStylingLabelView

void __77__BSUIPartialStylingLabelView_MTVisualStylingSupport__mt_applyVisualStyling___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 contentLabel];
  [v4 setTextColor:v3];
}

@end
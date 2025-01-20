@interface UIView
@end

@implementation UIView

void __52__UIView_PKAdditions__pk_autoFadeOutShapePointLayer__block_invoke(uint64_t a1)
{
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setAnimationDuration:0.5];
  [*(id *)(a1 + 32) setOpacity:0.0];
  v2 = (void *)MEMORY[0x1E4F39CF8];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52__UIView_PKAdditions__pk_autoFadeOutShapePointLayer__block_invoke_2;
  v3[3] = &unk_1E64C61C0;
  id v4 = *(id *)(a1 + 32);
  [v2 setCompletionBlock:v3];
  [MEMORY[0x1E4F39CF8] commit];
}

void __52__UIView_PKAdditions__pk_autoFadeOutShapePointLayer__block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__UIView_PKAdditions__pk_autoFadeOutShapePointLayer__block_invoke_3;
  block[3] = &unk_1E64C61C0;
  id v4 = *(id *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E4F14428], block);
}

uint64_t __52__UIView_PKAdditions__pk_autoFadeOutShapePointLayer__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperlayer];
}

@end
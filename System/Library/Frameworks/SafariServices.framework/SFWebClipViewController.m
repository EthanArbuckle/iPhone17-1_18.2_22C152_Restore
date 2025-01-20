@interface SFWebClipViewController
@end

@implementation SFWebClipViewController

uint64_t __45___SFWebClipViewController_updateUIAnimated___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 1064);
  v3 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v3 scale];
  v4 = objc_msgSend(v2, "generateIconImageForFormat:scale:", 2);
  [*(id *)(*(void *)(a1 + 32) + 1048) setImage:v4];

  v5 = *(void **)(a1 + 32);

  return [v5 _textFieldChanged:0];
}

uint64_t __61___SFWebClipViewController__showDemoModeFeatureDisabledAlert__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 1058) = 0;
  return result;
}

@end
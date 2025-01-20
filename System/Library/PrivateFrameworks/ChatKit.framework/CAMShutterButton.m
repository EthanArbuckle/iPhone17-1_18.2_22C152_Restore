@interface CAMShutterButton
@end

@implementation CAMShutterButton

uint64_t __62__CAMShutterButton_CKActionMenuItemView__setEnabled_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setEnabled:*(unsigned __int8 *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);
  BOOL v3 = *(unsigned char *)(a1 + 40) == 0;

  return [v2 setShowDisabled:v3];
}

@end
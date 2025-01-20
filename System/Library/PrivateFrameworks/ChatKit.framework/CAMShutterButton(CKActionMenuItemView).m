@interface CAMShutterButton(CKActionMenuItemView)
+ (uint64_t)actionMenuShutterButton;
- (uint64_t)setSelected:()CKActionMenuItemView animated:;
- (void)setEnabled:()CKActionMenuItemView animated:;
@end

@implementation CAMShutterButton(CKActionMenuItemView)

+ (uint64_t)actionMenuShutterButton
{
  v0 = (void *)MEMORY[0x1E4F57DB0];
  CAMShutterButtonSpecMake();

  return objc_msgSend(v0, "shutterButtonWithSpec:");
}

- (void)setEnabled:()CKActionMenuItemView animated:
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__CAMShutterButton_CKActionMenuItemView__setEnabled_animated___block_invoke;
  v7[3] = &unk_1E5622A18;
  v7[4] = a1;
  char v8 = a3;
  v5 = _Block_copy(v7);
  v6 = v5;
  if (a4) {
    +[CKActionMenuItem animate:v5 completion:0];
  }
  else {
    (*((void (**)(void *))v5 + 2))(v5);
  }
}

- (uint64_t)setSelected:()CKActionMenuItemView animated:
{
  uint64_t result = [a1 mode];
  if ((result & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    if (a3) {
      uint64_t v8 = 5;
    }
    else {
      uint64_t v8 = 1;
    }
    return [a1 setMode:v8 animated:a4];
  }
  return result;
}

@end
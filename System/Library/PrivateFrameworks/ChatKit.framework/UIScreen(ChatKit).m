@interface UIScreen(ChatKit)
- (uint64_t)ck_screenSizeCategory;
@end

@implementation UIScreen(ChatKit)

- (uint64_t)ck_screenSizeCategory
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__UIScreen_ChatKit__ck_screenSizeCategory__block_invoke;
  block[3] = &unk_1E5620C40;
  block[4] = a1;
  if (ck_screenSizeCategory_onceToken != -1) {
    dispatch_once(&ck_screenSizeCategory_onceToken, block);
  }
  return ck_screenSizeCategory_screenCategory;
}

@end
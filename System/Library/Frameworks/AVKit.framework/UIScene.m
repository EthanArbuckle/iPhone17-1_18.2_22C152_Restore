@interface UIScene
@end

@implementation UIScene

BOOL __60__UIScene_AVSecondScreenAdditions__avkit_secondScreenScenes__block_invoke(uint64_t a1, void *a2)
{
  return (unint64_t)(objc_msgSend(a2, "avkit_screenType") - 3) < 2;
}

@end
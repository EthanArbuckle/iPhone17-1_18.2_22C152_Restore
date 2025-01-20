@interface UIScrollView
@end

@implementation UIScrollView

uint64_t __85__UIScrollView_WebKitInternal___wk_setContentOffsetAndShowScrollIndicators_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 56), "setContentOffset:animated:", *(unsigned __int8 *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48));
}

@end
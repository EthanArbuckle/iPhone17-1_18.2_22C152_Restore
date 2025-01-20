@interface UIScrollView(MUXCrossPlatformOperations)
- (uint64_t)_mapsui_scrollToContentOffset:()MUXCrossPlatformOperations animated:;
- (uint64_t)_mapsui_scrollToTopAnimated:()MUXCrossPlatformOperations;
@end

@implementation UIScrollView(MUXCrossPlatformOperations)

- (uint64_t)_mapsui_scrollToTopAnimated:()MUXCrossPlatformOperations
{
  double v5 = *MEMORY[0x1E4F1DAD8];
  double v6 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [a1 adjustedContentInset];
  double v8 = v5 - v7;
  [a1 adjustedContentInset];
  return objc_msgSend(a1, "setContentOffset:animated:", a3, v8, v6 - v9);
}

- (uint64_t)_mapsui_scrollToContentOffset:()MUXCrossPlatformOperations animated:
{
  return objc_msgSend(a1, "setContentOffset:animated:", 1);
}

@end
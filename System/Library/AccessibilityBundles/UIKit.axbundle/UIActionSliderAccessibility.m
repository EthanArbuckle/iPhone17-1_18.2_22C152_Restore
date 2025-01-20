@interface UIActionSliderAccessibility
@end

@implementation UIActionSliderAccessibility

uint64_t __53___UIActionSliderAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  if (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 32) actionSliderDidBeginSlide:*(void *)(a1 + 40)];
  }
  if (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 32) actionSlider:*(void *)(a1 + 40) didUpdateSlideWithValue:1.0];
  }
  uint64_t result = objc_opt_respondsToSelector();
  if (result) {
    return [*(id *)(a1 + 32) actionSliderDidCompleteSlide:*(void *)(a1 + 40)];
  }
  return result;
}

@end
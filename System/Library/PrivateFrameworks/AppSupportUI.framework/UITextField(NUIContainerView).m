@interface UITextField(NUIContainerView)
- (uint64_t)_nui_baselineViewType;
@end

@implementation UITextField(NUIContainerView)

- (uint64_t)_nui_baselineViewType
{
  return 0;
}

@end
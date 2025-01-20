@interface UIImageView(NUIContainerView)
- (uint64_t)_nui_baselineViewType;
@end

@implementation UIImageView(NUIContainerView)

- (uint64_t)_nui_baselineViewType
{
  return 0;
}

@end
@interface UIView(NUIClassCheck)
- (uint64_t)_nui_baselineViewType;
@end

@implementation UIView(NUIClassCheck)

- (uint64_t)_nui_baselineViewType
{
  return 1;
}

@end
@interface UITextView(NUIContainerView)
- (uint64_t)_nui_baselineViewType;
- (uint64_t)isLayoutSizeDependentOnPerpendicularAxis;
@end

@implementation UITextView(NUIContainerView)

- (uint64_t)isLayoutSizeDependentOnPerpendicularAxis
{
  v3.receiver = a1;
  v3.super_class = (Class)&off_1F06375C8;
  if (objc_msgSendSuper2(&v3, sel_isLayoutSizeDependentOnPerpendicularAxis)) {
    return 1;
  }
  else {
    return [a1 isScrollEnabled] ^ 1;
  }
}

- (uint64_t)_nui_baselineViewType
{
  return 0;
}

@end
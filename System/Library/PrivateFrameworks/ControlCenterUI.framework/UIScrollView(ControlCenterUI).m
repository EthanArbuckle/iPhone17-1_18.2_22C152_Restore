@interface UIScrollView(ControlCenterUI)
- (double)ccui_relativeContentOffset;
- (uint64_t)ccui_setContentInsetPreservingOffset:()ControlCenterUI;
- (uint64_t)ccui_setRelativeContentOffset:()ControlCenterUI;
@end

@implementation UIScrollView(ControlCenterUI)

- (double)ccui_relativeContentOffset
{
  [a1 contentOffset];
  double v3 = v2;
  [a1 contentInset];
  return v3 + v4;
}

- (uint64_t)ccui_setRelativeContentOffset:()ControlCenterUI
{
  [a1 contentInset];

  return objc_msgSend(a1, "setContentOffset:", a2 - v7, a3 - v6);
}

- (uint64_t)ccui_setContentInsetPreservingOffset:()ControlCenterUI
{
  uint64_t result = [a1 contentInset];
  if (a3 != v14 || a2 != v11 || a5 != v13 || a4 != v12)
  {
    objc_msgSend(a1, "ccui_relativeContentOffset");
    double v19 = v18;
    double v21 = v20;
    objc_msgSend(a1, "setContentInset:", a2, a3, a4, a5);
    return objc_msgSend(a1, "ccui_setRelativeContentOffset:", v19, v21);
  }
  return result;
}

@end
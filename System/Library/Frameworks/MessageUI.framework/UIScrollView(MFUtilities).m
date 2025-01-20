@interface UIScrollView(MFUtilities)
- (double)mf_maxContentOffset;
- (double)mf_minContentOffset;
- (double)mf_visibleBounds;
- (double)mf_visibleFrame;
- (double)mf_visibleHeight;
@end

@implementation UIScrollView(MFUtilities)

- (double)mf_visibleFrame
{
  [a1 frame];
  double v3 = v2;
  [a1 contentInset];
  return v3 + v4;
}

- (double)mf_visibleBounds
{
  [a1 bounds];
  double v3 = v2;
  [a1 contentInset];
  return v3 + v4;
}

- (double)mf_visibleHeight
{
  objc_msgSend(a1, "mf_visibleFrame");

  return CGRectGetHeight(*(CGRect *)&v1);
}

- (double)mf_minContentOffset
{
  [a1 contentInset];
  double v3 = -v2;
  [a1 contentInset];
  return v3;
}

- (double)mf_maxContentOffset
{
  [a1 contentSize];
  double v3 = v2;
  [a1 bounds];
  double v4 = v3 - CGRectGetWidth(v8);
  [a1 contentInset];
  double v6 = v4 + v5;
  [a1 contentSize];
  [a1 bounds];
  CGRectGetHeight(v9);
  [a1 contentInset];
  return v6;
}

@end
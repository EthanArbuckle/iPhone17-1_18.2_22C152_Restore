@interface NSTextLayoutFragment(FragmentView)
- (void)_emk_getFragmentViewFrame:()FragmentView getBounds:textContainerInset:;
@end

@implementation NSTextLayoutFragment(FragmentView)

- (void)_emk_getFragmentViewFrame:()FragmentView getBounds:textContainerInset:
{
  [a1 layoutFragmentFrame];
  CGFloat v10 = v9;
  double v12 = v11;
  [a1 renderingSurfaceBounds];
  CGRect v20 = CGRectIntegral(v19);
  double x = v20.origin.x;
  CGFloat y = v20.origin.y;
  CGFloat width = v20.size.width;
  CGFloat height = v20.size.height;
  double v17 = a2 + v12 + v20.origin.y;
  v20.origin.double x = v10;
  v20.origin.CGFloat y = v17;
  if (CGRectGetHeight(v20) > 0.0)
  {
    v21.origin.double x = v10;
    v21.origin.CGFloat y = v17;
    v21.size.CGFloat width = width;
    v21.size.CGFloat height = height;
    if (CGRectGetWidth(v21) > 0.0)
    {
      v22.origin.double x = v10;
      v22.origin.CGFloat y = v17;
      v22.size.CGFloat width = width;
      v22.size.CGFloat height = height;
      double MinX = CGRectGetMinX(v22);
      v23.origin.double x = v10;
      v23.origin.CGFloat y = v17;
      v23.size.CGFloat width = width;
      v23.size.CGFloat height = height;
      double x = x + MinX - CGRectGetMinX(v23);
    }
  }
  *a5 = x;
  a5[1] = y;
  a5[2] = width;
  a5[3] = height;
  *a4 = v10;
  a4[1] = v17;
  a4[2] = width;
  a4[3] = height;
}

@end
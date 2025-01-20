@interface NSTextLayoutFragment(FragmentView)
- (void)_ck_getFragmentViewFrame:()FragmentView getBounds:textContainerInset:;
@end

@implementation NSTextLayoutFragment(FragmentView)

- (void)_ck_getFragmentViewFrame:()FragmentView getBounds:textContainerInset:
{
  if (!a3)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, a1, @"CKMentionsTextContainerOverlayView.m", 36, @"Invalid parameter not satisfying: %@", @"frameOut" object file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
LABEL_8:
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, a1, @"CKMentionsTextContainerOverlayView.m", 37, @"Invalid parameter not satisfying: %@", @"boundsOut" object file lineNumber description];

    goto LABEL_3;
  }
  if (!a4) {
    goto LABEL_8;
  }
LABEL_3:
  [a1 layoutFragmentFrame];
  double v9 = v8;
  [a1 renderingSurfaceBounds];
  CGRect v21 = CGRectIntegral(v20);
  double x = v21.origin.x;
  CGFloat y = v21.origin.y;
  CGFloat width = v21.size.width;
  CGFloat height = v21.size.height;
  double v14 = v9 + v21.origin.y;
  v21.origin.CGFloat y = v14;
  BOOL v15 = CGRectGetHeight(v21) <= 0.0;
  double v16 = x;
  if (!v15)
  {
    v22.origin.double x = x;
    v22.origin.CGFloat y = v14;
    v22.size.CGFloat width = width;
    v22.size.CGFloat height = height;
    BOOL v15 = CGRectGetWidth(v22) <= 0.0;
    double v16 = x;
    if (!v15)
    {
      v23.origin.double x = x;
      v23.origin.CGFloat y = v14;
      v23.size.CGFloat width = width;
      v23.size.CGFloat height = height;
      double MinX = CGRectGetMinX(v23);
      v24.origin.double x = x;
      v24.origin.CGFloat y = v14;
      v24.size.CGFloat width = width;
      v24.size.CGFloat height = height;
      double v16 = x + MinX - CGRectGetMinX(v24);
    }
  }
  *a4 = v16;
  a4[1] = y;
  a4[2] = width;
  a4[3] = height;
  *a3 = x;
  a3[1] = v14;
  a3[2] = width;
  a3[3] = height;
}

@end
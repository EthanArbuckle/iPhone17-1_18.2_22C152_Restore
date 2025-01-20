@interface RTIDocumentState(AFUIExtras)
- (double)_popoverAnchorRectForPopoverPresentedFromVerticalEdge:()AFUIExtras;
- (double)_popoverAnchorRectInClientFrameForPopoverPresentedFromVerticalEdge:()AFUIExtras;
@end

@implementation RTIDocumentState(AFUIExtras)

- (double)_popoverAnchorRectForPopoverPresentedFromVerticalEdge:()AFUIExtras
{
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([a1 firstSelectionRectInEntitySpace], double x = v5.origin.x, CGRectIsNull(v5)))
  {
    [a1 clientFrameInEntitySpace];
    return v3;
  }
  return x;
}

- (double)_popoverAnchorRectInClientFrameForPopoverPresentedFromVerticalEdge:()AFUIExtras
{
  objc_msgSend(a1, "_popoverAnchorRectForPopoverPresentedFromVerticalEdge:");
  double v3 = v2;
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  [a1 clientFrameInEntitySpace];
  v15.origin.double x = v3;
  v15.origin.y = v5;
  v15.size.width = v7;
  v15.size.height = v9;
  BOOL v10 = CGRectIntersectsRect(v14, v15);
  [a1 clientFrameInEntitySpace];
  if (v10)
  {
    double v12 = v3 - v11;
    [a1 clientFrameInEntitySpace];
  }
  else
  {
    [a1 clientFrameInEntitySpace];
    return 0.0;
  }
  return v12;
}

@end
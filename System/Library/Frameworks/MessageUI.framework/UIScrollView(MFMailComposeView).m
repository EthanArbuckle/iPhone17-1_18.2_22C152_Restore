@interface UIScrollView(MFMailComposeView)
- (BOOL)mf_needsToAdjustContentOffset;
@end

@implementation UIScrollView(MFMailComposeView)

- (BOOL)mf_needsToAdjustContentOffset
{
  [a1 bounds];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  [a1 contentOffset];
  double v11 = v10;
  double v30 = v12;
  [a1 contentSize];
  double v14 = v13;
  double v16 = v15;
  [a1 _effectiveContentInset];
  double v21 = round(-v20);
  if (v7 < round(v19 + v14 + v20) && v3 >= v21)
  {
    double v23 = round(v14 + v19);
    if (v3 + v7 > v23) {
      double v21 = v23 - v7;
    }
    else {
      double v21 = v11;
    }
  }
  double v24 = round(-v17);
  if (v9 < round(v18 + v16 + v17) && v5 >= v24)
  {
    double v26 = round(v16 + v18);
    double v24 = v30;
    if (v5 + v9 > v26) {
      double v24 = v26 - v9;
    }
  }
  [a1 contentOffset];
  return v28 != v24 || v27 != v21;
}

@end
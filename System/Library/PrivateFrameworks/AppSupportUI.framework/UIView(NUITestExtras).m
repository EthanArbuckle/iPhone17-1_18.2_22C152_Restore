@interface UIView(NUITestExtras)
- (double)sizeToBestFitAndLayoutIfNeeded;
- (double)testableEffectiveLayoutSizeFittingSize:()NUITestExtras;
- (double)testableSizeThatFits:()NUITestExtras;
@end

@implementation UIView(NUITestExtras)

- (double)sizeToBestFitAndLayoutIfNeeded
{
  double v2 = *MEMORY[0x1E4F1DB28];
  double v3 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  int v4 = [a1 _wantsConstraintBasedLayout];
  double v5 = *MEMORY[0x1E4F1DB30];
  double v6 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (v4) {
    objc_msgSend(a1, "systemLayoutSizeFittingSize:", v5, v6);
  }
  else {
    objc_msgSend(a1, "effectiveLayoutSizeFittingSize:", v5, v6);
  }
  double v9 = v7;
  objc_msgSend(a1, "setFrame:", v2, v3, v7, v8);
  [a1 layoutIfNeeded];
  return v9;
}

- (double)testableSizeThatFits:()NUITestExtras
{
  objc_msgSend(a1, "sizeThatFits:");
  objc_msgSend(a1, "alignmentRectForFrame:", 0.0, 0.0, v2, v3);
  return v4;
}

- (double)testableEffectiveLayoutSizeFittingSize:()NUITestExtras
{
  objc_msgSend(a1, "sizeThatFits:");
  objc_msgSend(a1, "alignmentRectForFrame:", 0.0, 0.0, v2, v3);
  return v4;
}

@end
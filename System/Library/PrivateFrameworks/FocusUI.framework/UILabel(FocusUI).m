@interface UILabel(FocusUI)
+ (void)fcui_layoutPrimaryLabel:()FocusUI secondaryLabel:inTextFrame:primaryLabelFrame:secondaryLabelFrame:drawingContext:;
- (double)fcui_drawingHeightWithNumberOfLines:()FocusUI;
- (double)fcui_measuringHeightWithNumberOfLines:()FocusUI;
- (uint64_t)fcui_numberOfLinesInFrame:()FocusUI maximum:drawingContext:;
@end

@implementation UILabel(FocusUI)

+ (void)fcui_layoutPrimaryLabel:()FocusUI secondaryLabel:inTextFrame:primaryLabelFrame:secondaryLabelFrame:drawingContext:
{
  id v31 = a6;
  id v17 = a7;
  id v18 = a10;
  if (v31 && a8)
  {
    uint64_t v19 = objc_msgSend(v31, "fcui_numberOfLinesInFrame:maximum:drawingContext:", 0, v18, a1, a2, a3, 1.79769313e308);
    objc_msgSend(v31, "fcui_drawingHeightWithNumberOfLines:", v19);
    v20 = [v17 text];
    uint64_t v21 = [v20 length];

    if (v21)
    {
      objc_msgSend(v31, "fcui_measuringHeightWithNumberOfLines:", v19);
      uint64_t v22 = objc_msgSend(v17, "fcui_numberOfLinesInFrame:maximum:drawingContext:", 0, v18, a1, a2, a3, 1.79769313e308);
      objc_msgSend(v17, "fcui_measuringHeightWithNumberOfLines:", v22);
      UIRectCenteredYInRect();
      CGRectGetMaxY(v33);
      objc_msgSend(v17, "fcui_drawingHeightWithNumberOfLines:", v22);
      UIRectCenteredIntegralRectScale();
      if (a9)
      {
        *a9 = v23;
        a9[1] = v24;
        a9[2] = v25;
        a9[3] = v26;
      }
    }
    UIRectCenteredIntegralRectScale();
    *a8 = v27;
    a8[1] = v28;
    a8[2] = v29;
    a8[3] = v30;
  }
}

- (uint64_t)fcui_numberOfLinesInFrame:()FocusUI maximum:drawingContext:
{
  id v14 = a8;
  v15 = [a1 font];
  v16 = [a1 text];
  uint64_t v17 = objc_msgSend(v15, "fcui_numberOfLinesForText:inFrame:maximum:drawingContext:", v16, a7, v14, a2, a3, a4, a5);

  return v17;
}

- (double)fcui_measuringHeightWithNumberOfLines:()FocusUI
{
  v5 = [a1 font];
  v6 = [a1 text];
  objc_msgSend(v5, "fcui_measuringHeightForText:withNumberOfLines:", v6, a3);
  double v8 = v7;

  return v8;
}

- (double)fcui_drawingHeightWithNumberOfLines:()FocusUI
{
  v5 = [a1 font];
  v6 = [a1 text];
  objc_msgSend(v5, "fcui_drawingHeightForText:withNumberOfLines:additionalPadding:", v6, a3, 2.0);
  double v8 = v7;

  return v8;
}

@end
@interface UILabel
+ (void)rpccui_layoutPrimaryLabel:(id)a3 secondaryLabel:(id)a4 inTextFrame:(CGRect)a5 primaryLabelFrame:(CGRect *)a6 secondaryLabelFrame:(CGRect *)a7 drawingContext:(id)a8;
- (double)rpccui_drawingHeightWithNumberOfLines:(unint64_t)a3;
- (double)rpccui_measuringHeightWithNumberOfLines:(unint64_t)a3;
- (unint64_t)rpccui_numberOfLinesInFrame:(CGRect)a3 maximum:(unint64_t)a4 drawingContext:(id)a5;
@end

@implementation UILabel

+ (void)rpccui_layoutPrimaryLabel:(id)a3 secondaryLabel:(id)a4 inTextFrame:(CGRect)a5 primaryLabelFrame:(CGRect *)a6 secondaryLabelFrame:(CGRect *)a7 drawingContext:(id)a8
{
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v29 = a3;
  id v15 = a4;
  id v16 = a8;
  if (v29 && a6)
  {
    id v17 = objc_msgSend(v29, "rpccui_numberOfLinesInFrame:maximum:drawingContext:", 0, v16, x, y, width, 1.79769313e308);
    objc_msgSend(v29, "rpccui_drawingHeightWithNumberOfLines:", v17);
    v18 = [v15 text];
    id v19 = [v18 length];

    if (v19)
    {
      objc_msgSend(v29, "rpccui_measuringHeightWithNumberOfLines:", v17);
      id v20 = objc_msgSend(v15, "rpccui_numberOfLinesInFrame:maximum:drawingContext:", 0, v16, x, y, width, 1.79769313e308);
      objc_msgSend(v15, "rpccui_measuringHeightWithNumberOfLines:", v20);
      UIRectCenteredYInRect();
      CGRectGetMaxY(v31);
      objc_msgSend(v15, "rpccui_drawingHeightWithNumberOfLines:", v20);
      UIRectCenteredIntegralRectScale();
      if (a7)
      {
        a7->origin.double x = v21;
        a7->origin.double y = v22;
        a7->size.double width = v23;
        a7->size.height = v24;
      }
    }
    UIRectCenteredIntegralRectScale();
    a6->origin.double x = v25;
    a6->origin.double y = v26;
    a6->size.double width = v27;
    a6->size.height = v28;
  }
}

- (unint64_t)rpccui_numberOfLinesInFrame:(CGRect)a3 maximum:(unint64_t)a4 drawingContext:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a5;
  v12 = [(UILabel *)self font];
  v13 = [(UILabel *)self text];
  id v14 = objc_msgSend(v12, "rpccui_numberOfLinesForText:inFrame:maximum:drawingContext:", v13, a4, v11, x, y, width, height);

  return (unint64_t)v14;
}

- (double)rpccui_measuringHeightWithNumberOfLines:(unint64_t)a3
{
  v5 = [(UILabel *)self font];
  v6 = [(UILabel *)self text];
  objc_msgSend(v5, "rpccui_measuringHeightForText:withNumberOfLines:", v6, a3);
  double v8 = v7;

  return v8;
}

- (double)rpccui_drawingHeightWithNumberOfLines:(unint64_t)a3
{
  v5 = [(UILabel *)self font];
  v6 = [(UILabel *)self text];
  objc_msgSend(v5, "rpccui_drawingHeightForText:withNumberOfLines:additionalPadding:", v6, a3, 2.0);
  double v8 = v7;

  return v8;
}

@end
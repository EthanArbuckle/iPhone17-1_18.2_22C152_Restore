@interface _FCUIFocusSelectionHeaderView
- (void)_layoutLabel:(id)a3 inBounds:(CGRect)a4 measuringOnly:(CGSize *)a5;
@end

@implementation _FCUIFocusSelectionHeaderView

- (void)_layoutLabel:(id)a3 inBounds:(CGRect)a4 measuringOnly:(CGSize *)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v24 = a3;
  objc_msgSend(v24, "sizeThatFits:", width, height);
  BSRectWithSize();
  v11 = [(_FCUIFocusSelectionHeaderView *)self traitCollection];
  [v11 displayScale];
  uint64_t v23 = v12;
  UIRectCenteredXInRectScale();
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  if (a5)
  {
    v26.origin.CGFloat x = x;
    v26.origin.CGFloat y = y;
    v26.size.double width = width;
    v26.size.double height = height;
    CGFloat v21 = CGRectGetWidth(v26);
    v27.origin.CGFloat x = v14;
    v27.origin.CGFloat y = v16;
    v27.size.double width = v18;
    v27.size.double height = v20;
    CGFloat MaxY = CGRectGetMaxY(v27);
    a5->double width = v21;
    a5->double height = MaxY;
  }
  else
  {
    objc_msgSend(v24, "setFrame:", v14, v16, v18, v20, v23);
  }
}

@end
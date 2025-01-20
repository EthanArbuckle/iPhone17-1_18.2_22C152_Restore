@interface CCUIStatusLabel
- (CCUIStatusLabel)init;
- (UIEdgeInsets)edgeInsets;
- (unint64_t)verticalAlignment;
- (void)_contentSizeCategoryDidChange;
- (void)_updateVisualStyling;
- (void)didMoveToWindow;
- (void)drawTextInRect:(CGRect)a3;
- (void)setEdgeInsets:(UIEdgeInsets)a3;
- (void)setVerticalAlignment:(unint64_t)a3;
@end

@implementation CCUIStatusLabel

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  if (self->_edgeInsets.left != a3.left
    || self->_edgeInsets.top != a3.top
    || self->_edgeInsets.right != a3.right
    || self->_edgeInsets.bottom != a3.bottom)
  {
    self->_edgeInsets = a3;
    [(CCUIStatusLabel *)self setNeedsLayout];
  }
}

- (CCUIStatusLabel)init
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)CCUIStatusLabel;
  v2 = [(CCUIStatusLabel *)&v9 init];
  v3 = v2;
  if (v2)
  {
    [(CCUIStatusLabel *)v2 setTextAlignment:1];
    [(CCUIStatusLabel *)v3 setNumberOfLines:2];
    [(CCUIStatusLabel *)v3 setAdjustsFontSizeToFitWidth:1];
    v4 = self;
    v10[0] = v4;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    id v6 = (id)[(CCUIStatusLabel *)v3 registerForTraitChanges:v5 withAction:sel__contentSizeCategoryDidChange];

    [(CCUIStatusLabel *)v3 _contentSizeCategoryDidChange];
    [(CCUIStatusLabel *)v3 controlCenterApplyPrimaryContentShadow];
    v7 = [(CCUIStatusLabel *)v3 layer];
    [v7 setShadowPathIsBounds:0];
  }
  return v3;
}

- (void)didMoveToWindow
{
  v6.receiver = self;
  v6.super_class = (Class)CCUIStatusLabel;
  [(CCUIStatusLabel *)&v6 didMoveToWindow];
  v3 = [(CCUIStatusLabel *)self window];

  if (v3)
  {
    v4 = [(CCUIStatusLabel *)self visualStylingProviderForCategory:1];
    visualStylingProvider = self->_visualStylingProvider;
    if (v4 != visualStylingProvider)
    {
      [(MTVisualStylingProvider *)visualStylingProvider stopAutomaticallyUpdatingView:self];
      objc_storeStrong((id *)&self->_visualStylingProvider, v4);
      [(CCUIStatusLabel *)self _updateVisualStyling];
    }
  }
}

- (void)setVerticalAlignment:(unint64_t)a3
{
  if (self->_verticalAlignment != a3)
  {
    self->_verticalAlignment = a3;
    [(CCUIStatusLabel *)self setNeedsLayout];
  }
}

- (void)drawTextInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  CCUIEdgeInsetsRTLSwap();
  double v9 = x + v8;
  double v11 = y + v10;
  double v13 = width - (v8 + v12);
  double v15 = height - (v10 + v14);
  unint64_t v16 = [(CCUIStatusLabel *)self verticalAlignment];
  if (v16 == 1)
  {
    -[CCUIStatusLabel textRectForBounds:limitedToNumberOfLines:](self, "textRectForBounds:limitedToNumberOfLines:", 2, v9, v11, v13, v15);
    CGFloat v18 = v17;
    rect.origin.double x = v17;
    rect.origin.double y = v19;
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    v29.origin.double x = v9;
    v29.origin.double y = v11;
    v29.size.double width = v13;
    v29.size.double height = v15;
    rect.size.double width = CGRectGetMinX(v29);
    v30.origin.double x = v9;
    v30.origin.double y = v11;
    v30.size.double width = v13;
    v30.size.double height = v15;
    double MinY = CGRectGetMinY(v30);
    v31.origin.double x = v9;
    v31.origin.double y = v11;
    v31.size.double width = v13;
    v31.size.double height = v15;
    double v24 = CGRectGetHeight(v31);
    v32.origin.double x = v18;
    v32.origin.double y = v21;
    v32.size.double width = rect.origin.y;
    v32.size.double height = v23;
    double v25 = MinY + v24 - CGRectGetHeight(v32);
    v33.origin.double x = v9;
    v33.origin.double y = v11;
    v33.size.double width = v13;
    v33.size.double height = v15;
    double v13 = CGRectGetWidth(v33);
    v34.origin.double x = rect.origin.x;
    v34.origin.double y = v21;
    v34.size.double width = rect.origin.y;
    v34.size.double height = v23;
    double v15 = CGRectGetHeight(v34);
    double v11 = v25;
    double v9 = rect.size.width;
  }
  else if (v16)
  {
    double v9 = *MEMORY[0x1E4F1DB20];
    double v11 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v13 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v15 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  *(void *)&rect.size.double height = self;
  v28 = CCUIStatusLabel;
  -[CGFloat drawTextInRect:]((objc_super *)&rect.size.height, sel_drawTextInRect_, v9, v11, v13, v15, *(void *)&MinY);
}

- (void)_contentSizeCategoryDidChange
{
  v3 = [MEMORY[0x1E4F4F8B8] preferredFontProvider];
  id v4 = [v3 preferredFontForTextStyle:*MEMORY[0x1E4FB2948] hiFontStyle:1];

  [(CCUIStatusLabel *)self setFont:v4];
  [(CCUIStatusLabel *)self setNeedsLayout];
}

- (void)_updateVisualStyling
{
}

- (UIEdgeInsets)edgeInsets
{
  double top = self->_edgeInsets.top;
  double left = self->_edgeInsets.left;
  double bottom = self->_edgeInsets.bottom;
  double right = self->_edgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (unint64_t)verticalAlignment
{
  return self->_verticalAlignment;
}

- (void).cxx_destruct
{
}

@end
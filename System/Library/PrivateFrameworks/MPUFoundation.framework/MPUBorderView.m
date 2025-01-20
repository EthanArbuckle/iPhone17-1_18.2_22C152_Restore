@interface MPUBorderView
+ (double)requiredOutsetForDropShadow;
- (BOOL)hidesWhenFullyTransparent;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MPUBorderConfiguration)borderConfiguration;
- (MPUBorderView)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)resizableImageCapInsets;
- (double)requiredOutsetForDropShadow;
- (void)drawRect:(CGRect)a3;
- (void)setBorderConfiguration:(id)a3;
- (void)setHidesWhenFullyTransparent:(BOOL)a3;
@end

@implementation MPUBorderView

+ (double)requiredOutsetForDropShadow
{
  return 1.0;
}

- (MPUBorderView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MPUBorderView;
  v3 = -[MPUBorderView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_hidesWhenFullyTransparent = 1;
    [(MPUBorderView *)v3 setOpaque:0];
    [(MPUBorderView *)v4 setBackgroundColor:0];
    [(MPUBorderView *)v4 setContentMode:3];
  }
  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(MPUBorderView *)self requiredOutsetForDropShadow];
  double v5 = v4 + v4;
  [(MPUBorderConfiguration *)self->_borderConfiguration borderWidth];
  double v7 = v5 + v6 * 2.0 + 1.0;
  double v8 = v7;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)setBorderConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t borderConfiguration = (uint64_t)self->_borderConfiguration;
  if ((id)borderConfiguration != v4)
  {
    v9 = v4;
    uint64_t borderConfiguration = [(id)borderConfiguration isEqual:v4];
    id v4 = v9;
    if ((borderConfiguration & 1) == 0)
    {
      double v6 = (MPUBorderConfiguration *)[v9 copy];
      double v7 = self->_borderConfiguration;
      self->_uint64_t borderConfiguration = v6;

      if (!self->_hidesWhenFullyTransparent
        || (BOOL v8 = [(MPUBorderConfiguration *)self->_borderConfiguration isFullyTransparent],
            uint64_t borderConfiguration = [(MPUBorderView *)self setHidden:v8],
            id v4 = v9,
            !v8))
      {
        uint64_t borderConfiguration = [(MPUBorderView *)self setNeedsDisplay];
        id v4 = v9;
      }
    }
  }

  MEMORY[0x270F9A758](borderConfiguration, v4);
}

- (double)requiredOutsetForDropShadow
{
  v2 = objc_opt_class();

  [v2 requiredOutsetForDropShadow];
  return result;
}

- (UIEdgeInsets)resizableImageCapInsets
{
  [(MPUBorderView *)self requiredOutsetForDropShadow];
  double v4 = v3;
  [(MPUBorderConfiguration *)self->_borderConfiguration borderWidth];
  double v6 = v4 + v5;
  double v7 = v6;
  double v8 = v6;
  double v9 = v6;
  result.right = v9;
  result.bottom = v8;
  result.left = v7;
  result.top = v6;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  [(MPUBorderView *)self requiredOutsetForDropShadow];
  CGFloat v5 = v4;
  [(MPUBorderView *)self bounds];
  CGRect v54 = CGRectInset(v53, v5, v5);
  double x = v54.origin.x;
  double y = v54.origin.y;
  double width = v54.size.width;
  double height = v54.size.height;
  [(MPUBorderConfiguration *)self->_borderConfiguration borderWidth];
  CGFloat v11 = v10;
  id v51 = [(MPUBorderConfiguration *)self->_borderConfiguration fillColor];
  [(MPUBorderConfiguration *)self->_borderConfiguration fillAlpha];
  if (v51) {
    BOOL v13 = v12 <= 0.00000011920929;
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13)
  {
    v14 = objc_msgSend(v51, "colorWithAlphaComponent:");
    [v14 setFill];

    v55.origin.double x = x;
    v55.origin.double y = y;
    v55.size.double width = width;
    v55.size.double height = height;
    CGRect v56 = CGRectInset(v55, v11, v11);
    UIRectFillUsingBlendMode(v56, kCGBlendModeNormal);
  }
  v15 = [(MPUBorderConfiguration *)self->_borderConfiguration borderColor];
  [(MPUBorderConfiguration *)self->_borderConfiguration borderAlpha];
  double v17 = v16;
  if (v15) {
    BOOL v18 = v11 <= 0.00000011920929;
  }
  else {
    BOOL v18 = 1;
  }
  if (!v18 && v16 > 0.00000011920929)
  {
    v20 = objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithRect:", x, y, width, height);
    v21 = (void *)MEMORY[0x263F1C478];
    v57.origin.double x = x;
    v57.origin.double y = y;
    v57.size.double width = width;
    v57.size.double height = height;
    CGRect v58 = CGRectInset(v57, v11, v11);
    v22 = objc_msgSend(v21, "bezierPathWithRect:", v58.origin.x, v58.origin.y, v58.size.width, v58.size.height);
    [v20 appendPath:v22];

    [v20 setUsesEvenOddFillRule:1];
    v23 = [v15 colorWithAlphaComponent:v17];
    [v23 setFill];

    [v20 fillWithBlendMode:0 alpha:1.0];
  }
  v24 = [(MPUBorderConfiguration *)self->_borderConfiguration dropShadowColor];
  [(MPUBorderConfiguration *)self->_borderConfiguration dropShadowAlpha];
  double v26 = v25;
  [(MPUBorderConfiguration *)self->_borderConfiguration dropShadowWidth];
  double v28 = v27;
  unint64_t v29 = [(MPUBorderConfiguration *)self->_borderConfiguration dropShadowEdges];
  if (v24) {
    BOOL v30 = v28 <= 0.00000011920929;
  }
  else {
    BOOL v30 = 1;
  }
  if (!v30 && v26 > 0.00000011920929 && v29 != 0)
  {
    char v33 = v29;
    v34 = [v24 colorWithAlphaComponent:v26];
    [v34 setFill];

    if (v33)
    {
      v59.origin.double x = x;
      v59.origin.double y = y;
      v59.size.double width = width;
      v59.size.double height = height;
      double MinX = CGRectGetMinX(v59);
      if ((v33 & 2) != 0) {
        double v36 = v28;
      }
      else {
        double v36 = 0.0;
      }
      double v37 = MinX - v36;
      v60.origin.double x = x;
      v60.origin.double y = y;
      v60.size.double width = width;
      v60.size.double height = height;
      double v38 = CGRectGetMinY(v60) - v28;
      v61.origin.double x = x;
      v61.origin.double y = y;
      v61.size.double width = width;
      v61.size.double height = height;
      double v39 = v36 + CGRectGetWidth(v61);
      double v40 = 0.0;
      if ((v33 & 8) != 0) {
        double v40 = v28;
      }
      v62.size.double width = v40 + v39;
      v62.origin.double x = v37;
      v62.origin.double y = v38;
      v62.size.double height = v28;
      UIRectFillUsingBlendMode(v62, kCGBlendModeNormal);
    }
    if ((v33 & 4) != 0)
    {
      v63.origin.double x = x;
      v63.origin.double y = y;
      v63.size.double width = width;
      v63.size.double height = height;
      double v41 = CGRectGetMinX(v63);
      if ((v33 & 2) != 0) {
        double v42 = v28;
      }
      else {
        double v42 = 0.0;
      }
      double v43 = v41 - v42;
      v64.origin.double x = x;
      v64.origin.double y = y;
      v64.size.double width = width;
      v64.size.double height = height;
      CGFloat MaxY = CGRectGetMaxY(v64);
      v65.origin.double x = x;
      v65.origin.double y = y;
      v65.size.double width = width;
      v65.size.double height = height;
      double v45 = v42 + CGRectGetWidth(v65);
      double v46 = 0.0;
      if ((v33 & 8) != 0) {
        double v46 = v28;
      }
      v66.size.double width = v46 + v45;
      v66.origin.double x = v43;
      v66.origin.double y = MaxY;
      v66.size.double height = v28;
      UIRectFillUsingBlendMode(v66, kCGBlendModeNormal);
      if ((v33 & 2) == 0) {
        goto LABEL_41;
      }
    }
    else if ((v33 & 2) == 0)
    {
LABEL_41:
      if ((v33 & 8) != 0)
      {
        v71.origin.double x = x;
        v71.origin.double y = y;
        v71.size.double width = width;
        v71.size.double height = height;
        CGFloat MaxX = CGRectGetMaxX(v71);
        v72.origin.double x = x;
        v72.origin.double y = y;
        v72.size.double width = width;
        v72.size.double height = height;
        CGFloat MinY = CGRectGetMinY(v72);
        v73.origin.double x = x;
        v73.origin.double y = y;
        v73.size.double width = width;
        v73.size.double height = height;
        v74.size.double height = CGRectGetHeight(v73);
        v74.origin.double x = MaxX;
        v74.origin.double y = MinY;
        v74.size.double width = v28;
        UIRectFillUsingBlendMode(v74, kCGBlendModeNormal);
      }
      goto LABEL_43;
    }
    v67.origin.double x = x;
    v67.origin.double y = y;
    v67.size.double width = width;
    v67.size.double height = height;
    CGFloat v47 = CGRectGetMinX(v67) - v28;
    v68.origin.double x = x;
    v68.origin.double y = y;
    v68.size.double width = width;
    v68.size.double height = height;
    CGFloat v48 = CGRectGetMinY(v68);
    v69.origin.double x = x;
    v69.origin.double y = y;
    v69.size.double width = width;
    v69.size.double height = height;
    v70.size.double height = CGRectGetHeight(v69);
    v70.origin.double x = v47;
    v70.origin.double y = v48;
    v70.size.double width = v28;
    UIRectFillUsingBlendMode(v70, kCGBlendModeNormal);
    goto LABEL_41;
  }
LABEL_43:
}

- (MPUBorderConfiguration)borderConfiguration
{
  return self->_borderConfiguration;
}

- (BOOL)hidesWhenFullyTransparent
{
  return self->_hidesWhenFullyTransparent;
}

- (void)setHidesWhenFullyTransparent:(BOOL)a3
{
  self->_hidesWhenFullyTransparent = a3;
}

- (void).cxx_destruct
{
}

@end
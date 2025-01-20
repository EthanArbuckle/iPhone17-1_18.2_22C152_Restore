@interface CEKEdgeGradientView
- ($01BB1521EC52D44A8E7628F5261DCEC8)gradientDimensions;
- (BOOL)isOpaque;
- (CEKEdgeGradientView)initWithFrame:(CGRect)a3;
- (UIColor)customEdgeGradientColor;
- (UIEdgeInsets)contentInsets;
- (double)innerFadeLength;
- (double)outerColorLength;
- (int64_t)edgeGradientStyle;
- (int64_t)gradientDirection;
- (void)drawRect:(CGRect)a3;
- (void)setContentInsets:(UIEdgeInsets)a3;
- (void)setCustomEdgeGradientStyleWithColor:(id)a3;
- (void)setEdgeGradientStyleBlack;
- (void)setEdgeGradientStyleMask;
- (void)setGradientDimensions:(id)a3;
- (void)setGradientDirection:(int64_t)a3;
- (void)setInnerFadeLength:(double)a3;
- (void)setOuterColorLength:(double)a3;
@end

@implementation CEKEdgeGradientView

- (CEKEdgeGradientView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CEKEdgeGradientView;
  v3 = -[CEKEdgeGradientView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4FB1618] blackColor];
    customEdgeGradientColor = v3->_customEdgeGradientColor;
    v3->_customEdgeGradientColor = (UIColor *)v4;

    v3->_gradientDirection = 0;
    [(CEKEdgeGradientView *)v3 setContentMode:3];
    [(CEKEdgeGradientView *)v3 setBackgroundColor:0];
    [(CEKEdgeGradientView *)v3 setUserInteractionEnabled:0];
  }
  return v3;
}

- (BOOL)isOpaque
{
  return 0;
}

- (double)outerColorLength
{
  return fmax(self->_gradientDimensions.startFadeInset, self->_gradientDimensions.endFadeInset);
}

- (void)setOuterColorLength:(double)a3
{
}

- (double)innerFadeLength
{
  return fmax(self->_gradientDimensions.startFadeLength, self->_gradientDimensions.endFadeLength);
}

- (void)setInnerFadeLength:(double)a3
{
}

- (void)setGradientDimensions:(id)a3
{
  if (self->_gradientDimensions.startFadeInset != a3.var0
    || self->_gradientDimensions.startFadeLength != a3.var1
    || self->_gradientDimensions.endFadeLength != a3.var2
    || self->_gradientDimensions.endFadeInset != a3.var3)
  {
    self->_gradientDimensions = ($104681888C943ED0167B77A1E92465DA)a3;
    [(CEKEdgeGradientView *)self setNeedsDisplay];
  }
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  if (self->_contentInsets.left != a3.left
    || self->_contentInsets.top != a3.top
    || self->_contentInsets.right != a3.right
    || self->_contentInsets.bottom != a3.bottom)
  {
    self->_contentInsets = a3;
    [(CEKEdgeGradientView *)self setNeedsDisplay];
  }
}

- (void)setEdgeGradientStyleBlack
{
  if (self->_edgeGradientStyle)
  {
    self->_edgeGradientStyle = 0;
    customEdgeGradientColor = self->_customEdgeGradientColor;
    self->_customEdgeGradientColor = 0;

    [(CEKEdgeGradientView *)self setNeedsDisplay];
  }
}

- (void)setEdgeGradientStyleMask
{
  if (self->_edgeGradientStyle != 1)
  {
    self->_edgeGradientStyle = 1;
    customEdgeGradientColor = self->_customEdgeGradientColor;
    self->_customEdgeGradientColor = 0;

    [(CEKEdgeGradientView *)self setNeedsDisplay];
  }
}

- (void)setCustomEdgeGradientStyleWithColor:(id)a3
{
  uint64_t v5 = (uint64_t)a3;
  uint64_t v6 = v5;
  uint64_t v7 = v5;
  if (self->_customEdgeGradientColor != (UIColor *)v5
    && (uint64_t v5 = objc_msgSend((id)v5, "isEqual:"), v6 = v7, (v5 & 1) == 0)
    || self->_edgeGradientStyle != 2)
  {
    self->_edgeGradientStyle = 2;
    objc_storeStrong((id *)&self->_customEdgeGradientColor, a3);
    uint64_t v5 = [(CEKEdgeGradientView *)self setNeedsDisplay];
    uint64_t v6 = v7;
  }
  MEMORY[0x1F41817F8](v5, v6);
}

- (void)setGradientDirection:(int64_t)a3
{
  if (self->_gradientDirection != a3)
  {
    self->_gradientDirection = a3;
    [(CEKEdgeGradientView *)self setNeedsDisplay];
  }
}

- (void)drawRect:(CGRect)a3
{
  v68[6] = *MEMORY[0x1E4F143B8];
  [(CEKEdgeGradientView *)self bounds];
  if (v6 <= 0.0) {
    return;
  }
  double v8 = v7;
  if (v7 <= 0.0) {
    return;
  }
  double v9 = v4;
  double v10 = v5;
  double v11 = v6;
  CurrentContext = UIGraphicsGetCurrentContext();
  v71.origin.x = v9;
  v71.origin.y = v10;
  v71.size.width = v11;
  v71.size.height = v8;
  CGContextClearRect(CurrentContext, v71);
  int64_t v13 = [(CEKEdgeGradientView *)self edgeGradientStyle];
  if (!v13)
  {
    v14 = [MEMORY[0x1E4FB1618] blackColor];
    v16 = (void *)MEMORY[0x1E4FB1618];
    goto LABEL_9;
  }
  if (v13 == 2)
  {
    v14 = [(CEKEdgeGradientView *)self customEdgeGradientColor];
    v16 = (void *)MEMORY[0x1E4FB1618];
LABEL_9:
    uint64_t v15 = [v16 clearColor];
    goto LABEL_10;
  }
  if (v13 != 1)
  {
    v17 = 0;
    v14 = 0;
    goto LABEL_12;
  }
  v14 = [MEMORY[0x1E4FB1618] clearColor];
  uint64_t v15 = [MEMORY[0x1E4FB1618] blackColor];
LABEL_10:
  v17 = (void *)v15;
LABEL_12:
  [v17 set];
  v72.origin.x = v9;
  v72.origin.y = v10;
  v72.size.width = v11;
  v72.size.height = v8;
  CGContextFillRect(CurrentContext, v72);
  [(CEKEdgeGradientView *)self contentInsets];
  CGFloat v19 = v9 + v18;
  CGFloat v21 = v10 + v20;
  CGFloat v23 = v11 - (v18 + v22);
  CGFloat v25 = v8 - (v20 + v24);
  v73.origin.x = v9 + v18;
  v73.origin.y = v21;
  v73.size.width = v23;
  v73.size.height = v25;
  CGContextClearRect(CurrentContext, v73);
  v74.origin.x = v19;
  v74.origin.y = v21;
  v74.size.width = v23;
  v74.size.height = v25;
  CGContextClipToRect(CurrentContext, v74);
  int64_t v26 = [(CEKEdgeGradientView *)self gradientDirection];
  [(CEKEdgeGradientView *)self contentInsets];
  double v28 = v27;
  double v30 = v29;
  [(CEKEdgeGradientView *)self contentInsets];
  CGFloat v65 = v9;
  CGFloat v66 = v10;
  if (v26)
  {
    double v33 = v28 / v8;
    double v34 = v8;
    double v35 = v31 / v8;
  }
  else
  {
    double v33 = v30 / v11;
    double v34 = v11;
    double v35 = v32 / v11;
  }
  double v36 = 1.0 - v35;
  id v37 = v14;
  v38 = [v37 CGColor];
  id v39 = v17;
  v40 = [v39 CGColor];
  v68[0] = v38;
  v68[1] = v38;
  v68[2] = v40;
  v68[3] = v40;
  v68[4] = v38;
  v68[5] = v38;
  CFArrayRef v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:6];
  [(CEKEdgeGradientView *)self gradientDimensions];
  double v43 = v42 / v34;
  [(CEKEdgeGradientView *)self gradientDimensions];
  double v45 = v44 / v34;
  [(CEKEdgeGradientView *)self gradientDimensions];
  double v47 = v46 / v34;
  [(CEKEdgeGradientView *)self gradientDimensions];
  double v49 = v48 / v34;
  if (v43 <= 0.0) {
    double v50 = 0.05;
  }
  else {
    double v50 = v43;
  }
  if (v45 <= 0.0) {
    double v51 = 0.05;
  }
  else {
    double v51 = v45;
  }
  if (v47 <= 0.0) {
    double v52 = 0.05;
  }
  else {
    double v52 = v47;
  }
  if (v49 <= 0.0) {
    double v49 = 0.05;
  }
  locations[0] = v33;
  locations[1] = v33 + v50;
  double v53 = v36 - v49;
  locations[2] = v33 + v50 + v51;
  locations[3] = v53 - v52;
  locations[4] = v53;
  locations[5] = v36;
  id v54 = v37;
  ColorSpace = CGColorGetColorSpace((CGColorRef)[v54 CGColor]);
  v56 = CGGradientCreateWithColors(ColorSpace, v41, locations);
  v75.origin.x = v65;
  v75.origin.y = v66;
  v75.size.width = v11;
  v75.size.height = v8;
  CGFloat MinX = CGRectGetMinX(v75);
  v76.origin.x = v65;
  v76.origin.y = v66;
  v76.size.width = v11;
  v76.size.height = v8;
  CGFloat MinY = CGRectGetMinY(v76);
  CGFloat v59 = v65;
  CGFloat v60 = v66;
  double v61 = v11;
  double v62 = v8;
  if (v26)
  {
    CGFloat MaxX = CGRectGetMinX(*(CGRect *)&v59);
    v77.origin.x = v65;
    v77.origin.y = v66;
    v77.size.width = v11;
    v77.size.height = v8;
    double MaxY = CGRectGetMaxY(v77);
  }
  else
  {
    CGFloat MaxX = CGRectGetMaxX(*(CGRect *)&v59);
    v78.origin.x = v65;
    v78.origin.y = v66;
    v78.size.width = v11;
    v78.size.height = v8;
    double MaxY = CGRectGetMinY(v78);
  }
  v70.y = MaxY;
  v69.x = MinX;
  v69.y = MinY;
  v70.x = MaxX;
  CGContextDrawLinearGradient(CurrentContext, v56, v69, v70, 0);
  CGGradientRelease(v56);
}

- (int64_t)edgeGradientStyle
{
  return self->_edgeGradientStyle;
}

- (UIColor)customEdgeGradientColor
{
  return self->_customEdgeGradientColor;
}

- (int64_t)gradientDirection
{
  return self->_gradientDirection;
}

- (UIEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double bottom = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)gradientDimensions
{
  double startFadeInset = self->_gradientDimensions.startFadeInset;
  double startFadeLength = self->_gradientDimensions.startFadeLength;
  double endFadeLength = self->_gradientDimensions.endFadeLength;
  double endFadeInset = self->_gradientDimensions.endFadeInset;
  result.var3 = endFadeInset;
  result.var2 = endFadeLength;
  result.var1 = startFadeLength;
  result.var0 = startFadeInset;
  return result;
}

- (void).cxx_destruct
{
}

@end
@interface MUHairlineView
- (BOOL)vertical;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)result;
- (MUHairlineView)init;
- (MUHairlineView)initWithCoder:(id)a3;
- (MUHairlineView)initWithFrame:(CGRect)a3;
- (NSLayoutConstraint)leadingMarginConstraint;
- (NSLayoutConstraint)trailingMarginConstraint;
- (double)leadingMargin;
- (double)trailingMargin;
- (void)_updateIntrinsicThicknessForDisplayScale;
- (void)customInit;
- (void)didMoveToWindow;
- (void)setLeadingMargin:(double)a3;
- (void)setLeadingMarginConstraint:(id)a3;
- (void)setTrailingMargin:(double)a3;
- (void)setTrailingMarginConstraint:(id)a3;
- (void)setVertical:(BOOL)a3;
@end

@implementation MUHairlineView

- (MUHairlineView)init
{
  v5.receiver = self;
  v5.super_class = (Class)MUHairlineView;
  v2 = -[MKHairlineView initWithFrame:](&v5, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v3 = v2;
  if (v2) {
    [(MUHairlineView *)v2 customInit];
  }
  return v3;
}

- (MUHairlineView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MUHairlineView;
  v3 = -[MKHairlineView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(MUHairlineView *)v3 customInit];
  }
  return v4;
}

- (MUHairlineView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MUHairlineView;
  v3 = [(MUHairlineView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(MUHairlineView *)v3 customInit];
  }
  return v4;
}

- (void)customInit
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v2 = self;
  v3 = [(MUHairlineView *)v2 window];
  v4 = [v3 screen];
  if (v4)
  {
    objc_super v5 = [(MUHairlineView *)v2 window];
    objc_super v6 = [v5 screen];
    [v6 nativeScale];
    double v8 = v7;
  }
  else
  {
    objc_super v5 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v5 nativeScale];
    double v8 = v9;
  }

  if (v8 <= 0.0) {
    double v10 = 1.0;
  }
  else {
    double v10 = 1.0 / v8;
  }

  v2->_intrinsicThickness = v10;
  LODWORD(v11) = 1148846080;
  [(MUHairlineView *)v2 setContentHuggingPriority:1 forAxis:v11];
  LODWORD(v12) = 1148846080;
  [(MUHairlineView *)v2 setContentCompressionResistancePriority:1 forAxis:v12];
  v13 = self;
  v16[0] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  id v15 = (id)[(MUHairlineView *)v2 registerForTraitChanges:v14 withAction:sel__updateIntrinsicThicknessForDisplayScale];
}

- (void)setVertical:(BOOL)a3
{
  if (self->_vertical != a3)
  {
    self->_vertical = a3;
    if (a3) {
      *(float *)&double v3 = 1000.0;
    }
    else {
      *(float *)&double v3 = 250.0;
    }
    if (a3) {
      float v5 = 250.0;
    }
    else {
      float v5 = 1000.0;
    }
    if (a3) {
      float v6 = 1000.0;
    }
    else {
      float v6 = 750.0;
    }
    if (a3) {
      float v7 = 750.0;
    }
    else {
      float v7 = 1000.0;
    }
    [(MUHairlineView *)self setContentHuggingPriority:0 forAxis:v3];
    *(float *)&double v8 = v5;
    [(MUHairlineView *)self setContentHuggingPriority:1 forAxis:v8];
    *(float *)&double v9 = v6;
    [(MUHairlineView *)self setContentCompressionResistancePriority:0 forAxis:v9];
    *(float *)&double v10 = v7;
    [(MUHairlineView *)self setContentCompressionResistancePriority:1 forAxis:v10];
  }
}

- (void)didMoveToWindow
{
  v12.receiver = self;
  v12.super_class = (Class)MUHairlineView;
  [(MKHairlineView *)&v12 didMoveToWindow];
  double v3 = self;
  v4 = [(MUHairlineView *)v3 window];
  float v5 = [v4 screen];
  if (v5)
  {
    float v6 = [(MUHairlineView *)v3 window];

    float v7 = [v6 screen];
    [v7 nativeScale];
    double v9 = v8;
  }
  else
  {
    float v6 = [MEMORY[0x1E4FB1BA8] mainScreen];

    [v6 nativeScale];
    double v9 = v10;
  }

  double v11 = 1.0;
  if (v9 > 0.0) {
    double v11 = 1.0 / v9;
  }
  if (v11 != v3->_intrinsicThickness)
  {
    v3->_intrinsicThickness = v11;
    [(MUHairlineView *)v3 invalidateIntrinsicContentSize];
  }
}

- (CGSize)intrinsicContentSize
{
  p_intrinsicThickness = &self->_intrinsicThickness;
  if (self->_vertical) {
    double v3 = &self->_intrinsicThickness;
  }
  else {
    double v3 = (double *)MEMORY[0x1E4FB30D8];
  }
  if (self->_vertical) {
    p_intrinsicThickness = (double *)MEMORY[0x1E4FB30D8];
  }
  double v4 = *p_intrinsicThickness;
  double v5 = *v3;
  result.height = v4;
  result.width = v5;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)result
{
  if (self->_vertical) {
    result.width = self->_intrinsicThickness;
  }
  else {
    result.height = self->_intrinsicThickness;
  }
  return result;
}

- (void)_updateIntrinsicThicknessForDisplayScale
{
  v2 = self;
  double v3 = [(MUHairlineView *)v2 window];
  double v4 = [v3 screen];
  if (v4)
  {
    double v5 = [(MUHairlineView *)v2 window];
    float v6 = [v5 screen];
    [v6 nativeScale];
    double v8 = v7;
  }
  else
  {
    double v5 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v5 nativeScale];
    double v8 = v9;
  }

  if (v8 <= 0.0) {
    double v10 = 1.0;
  }
  else {
    double v10 = 1.0 / v8;
  }

  v2->_intrinsicThickness = v10;
  [(MUHairlineView *)v2 invalidateIntrinsicContentSize];
}

- (void)setLeadingMargin:(double)a3
{
  id v4 = [(MUHairlineView *)self leadingMarginConstraint];
  [v4 setConstant:a3];
}

- (double)leadingMargin
{
  v2 = [(MUHairlineView *)self leadingMarginConstraint];
  [v2 constant];
  double v4 = v3;

  return v4;
}

- (void)setTrailingMargin:(double)a3
{
  id v4 = [(MUHairlineView *)self trailingMarginConstraint];
  [v4 setConstant:a3];
}

- (double)trailingMargin
{
  v2 = [(MUHairlineView *)self trailingMarginConstraint];
  [v2 constant];
  double v4 = v3;

  return v4;
}

- (BOOL)vertical
{
  return self->_vertical;
}

- (NSLayoutConstraint)leadingMarginConstraint
{
  return self->_leadingMarginConstraint;
}

- (void)setLeadingMarginConstraint:(id)a3
{
}

- (NSLayoutConstraint)trailingMarginConstraint
{
  return self->_trailingMarginConstraint;
}

- (void)setTrailingMarginConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingMarginConstraint, 0);
  objc_storeStrong((id *)&self->_leadingMarginConstraint, 0);
}

@end
@interface GKButtonStyle
+ (id)defaultStyle;
+ (id)standardStyle;
- (BOOL)clipToBounds;
- (GKButtonStyle)initWithCornerRadius:(double)a3 andBackgroundColor:(id)a4;
- (UIColor)backgroundColor;
- (UIEdgeInsets)titleEdgeInsets;
- (double)cornerRadius;
- (id)compositingFilter;
- (void)applyToButton:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setClipToBounds:(BOOL)a3;
- (void)setCompositingFilter:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)setTitleEdgeInsets:(UIEdgeInsets)a3;
@end

@implementation GKButtonStyle

+ (id)defaultStyle
{
  v2 = [GKButtonStyle alloc];
  v3 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.0799999982];
  v4 = [(GKButtonStyle *)v2 initWithCornerRadius:v3 andBackgroundColor:14.0];

  return v4;
}

+ (id)standardStyle
{
  v2 = [GKButtonStyle alloc];
  v3 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.200000003];
  v4 = [(GKButtonStyle *)v2 initWithCornerRadius:v3 andBackgroundColor:12.0];

  return v4;
}

- (GKButtonStyle)initWithCornerRadius:(double)a3 andBackgroundColor:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)GKButtonStyle;
  v8 = [(GKButtonStyle *)&v11 init];
  v9 = (GKButtonStyle *)v8;
  if (v8)
  {
    *((double *)v8 + 2) = a3;
    v8[8] = 1;
    *(_OWORD *)(v8 + 40) = xmmword_1AF7CB240;
    *(_OWORD *)(v8 + 56) = xmmword_1AF7CB240;
    objc_storeStrong((id *)v8 + 3, a4);
    v9->_compositingFilter = (id)*MEMORY[0x1E4F3A2E8];
  }

  return v9;
}

- (void)applyToButton:(id)a3
{
  double cornerRadius = self->_cornerRadius;
  id v8 = a3;
  v5 = [v8 layer];
  [v5 setCornerRadius:cornerRadius];

  [v8 setClipsToBounds:self->_clipToBounds];
  objc_msgSend(v8, "setTitleEdgeInsets:", self->_titleEdgeInsets.top, self->_titleEdgeInsets.left, self->_titleEdgeInsets.bottom, self->_titleEdgeInsets.right);
  [v8 setBackgroundColor:self->_backgroundColor];
  id compositingFilter = self->_compositingFilter;
  id v7 = [v8 layer];
  [v7 setCompositingFilter:compositingFilter];

  [v8 setNeedsLayout];
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_double cornerRadius = a3;
}

- (BOOL)clipToBounds
{
  return self->_clipToBounds;
}

- (void)setClipToBounds:(BOOL)a3
{
  self->_clipToBounds = a3;
}

- (UIEdgeInsets)titleEdgeInsets
{
  double top = self->_titleEdgeInsets.top;
  double left = self->_titleEdgeInsets.left;
  double bottom = self->_titleEdgeInsets.bottom;
  double right = self->_titleEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setTitleEdgeInsets:(UIEdgeInsets)a3
{
  self->_titleEdgeInsets = a3;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (id)compositingFilter
{
  return self->_compositingFilter;
}

- (void)setCompositingFilter:(id)a3
{
  self->_id compositingFilter = a3;
}

- (void).cxx_destruct
{
}

@end
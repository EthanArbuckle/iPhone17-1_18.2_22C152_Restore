@interface _PKColorPickerCrosshairCornerMaskView
+ (Class)layerClass;
- (BOOL)excludeCorner;
- (_PKColorPickerCrosshairCornerMaskView)initWithFrame:(CGRect)a3;
- (id)maskPath;
- (unint64_t)cornerPosition;
- (void)_setFillColor:(id)a3;
- (void)_setPath:(id)a3;
- (void)layoutSubviews;
- (void)setCornerPosition:(unint64_t)a3;
- (void)setExcludeCorner:(BOOL)a3;
@end

@implementation _PKColorPickerCrosshairCornerMaskView

- (_PKColorPickerCrosshairCornerMaskView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_PKColorPickerCrosshairCornerMaskView;
  result = -[_PKColorPickerCrosshairCornerMaskView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result->_cornerPosition = 0;
  result->_excludeCorner = 0;
  return result;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)_PKColorPickerCrosshairCornerMaskView;
  [(_PKColorPickerCrosshairCornerMaskView *)&v5 layoutSubviews];
  v3 = [MEMORY[0x1E4FB1618] blackColor];
  [(_PKColorPickerCrosshairCornerMaskView *)self _setFillColor:v3];

  objc_super v4 = [(_PKColorPickerCrosshairCornerMaskView *)self maskPath];
  [(_PKColorPickerCrosshairCornerMaskView *)self _setPath:v4];
}

- (void)setCornerPosition:(unint64_t)a3
{
  self->_cornerPosition = a3;
  [(_PKColorPickerCrosshairCornerMaskView *)self setNeedsLayout];
}

- (void)setExcludeCorner:(BOOL)a3
{
  self->_excludeCorner = a3;
  [(_PKColorPickerCrosshairCornerMaskView *)self setNeedsLayout];
}

- (void)_setPath:(id)a3
{
  id v4 = a3;
  id v7 = [(_PKColorPickerCrosshairCornerMaskView *)self _shapeLayer];
  id v5 = v4;
  uint64_t v6 = [v5 CGPath];

  [v7 setPath:v6];
}

- (void)_setFillColor:(id)a3
{
  id v4 = a3;
  id v7 = [(_PKColorPickerCrosshairCornerMaskView *)self _shapeLayer];
  id v5 = v4;
  uint64_t v6 = [v5 CGColor];

  [v7 setFillColor:v6];
}

- (id)maskPath
{
  [(_PKColorPickerCrosshairCornerMaskView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if ([(_PKColorPickerCrosshairCornerMaskView *)self cornerPosition])
  {
    CGAffineTransformMakeScale(&v25, 0.5, 0.5);
    double v11 = v10 * v25.c;
    double a = v25.a;
    double b = v25.b;
    double v13 = v10 * v25.d;
    if ([(_PKColorPickerCrosshairCornerMaskView *)self cornerPosition] == 3
      || [(_PKColorPickerCrosshairCornerMaskView *)self cornerPosition] == 4)
    {
      v27.origin.x = v4;
      v27.origin.y = v6;
      v27.size.width = v8;
      v27.size.height = v10;
      double MidY = CGRectGetMidY(v27);
    }
    else
    {
      v28.origin.x = v4;
      v28.origin.y = v6;
      v28.size.width = v8;
      v28.size.height = v10;
      double MidY = CGRectGetMinY(v28);
    }
    double v16 = MidY;
    double v17 = v11 + a * v8;
    double v18 = v13 + b * v8;
    if ([(_PKColorPickerCrosshairCornerMaskView *)self cornerPosition] == 2
      || [(_PKColorPickerCrosshairCornerMaskView *)self cornerPosition] == 4)
    {
      v29.origin.x = v4;
      v29.origin.y = v6;
      v29.size.width = v8;
      v29.size.height = v10;
      double MidX = CGRectGetMidX(v29);
    }
    else
    {
      v30.origin.x = v4;
      v30.origin.y = v6;
      v30.size.width = v8;
      v30.size.height = v10;
      double MidX = CGRectGetMinX(v30);
    }
  }
  else
  {
    double MidX = *MEMORY[0x1E4F1DB28];
    double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v18 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  v19 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRect:", MidX, v16, v17, v18);
  if ([(_PKColorPickerCrosshairCornerMaskView *)self excludeCorner])
  {
    v20 = (void *)MEMORY[0x1E4FB14C0];
    [(_PKColorPickerCrosshairCornerMaskView *)self bounds];
    objc_msgSend(v20, "bezierPathWithRect:");
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    v22 = [v19 bezierPathByReversingPath];
    [v21 appendPath:v22];
  }
  else
  {
    id v21 = v19;
  }

  return v21;
}

- (unint64_t)cornerPosition
{
  return self->_cornerPosition;
}

- (BOOL)excludeCorner
{
  return self->_excludeCorner;
}

@end
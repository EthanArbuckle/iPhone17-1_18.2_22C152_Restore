@interface AXCameraFeatureDebuggingView
- (AXCameraFeatureDebuggingView)initWithFrame:(CGRect)a3;
- (BOOL)didReuse;
- (BOOL)textInsideBox;
- (BOOL)textOnTop;
- (NSString)text;
- (UIColor)borderColor;
- (UIColor)textColor;
- (UILabel)_label;
- (UIView)_crossHairX;
- (UIView)_crossHairY;
- (double)borderWidth;
- (int64_t)interfaceOrientation;
- (void)layoutSubviews;
- (void)setBorderColor:(id)a3;
- (void)setBorderWidth:(double)a3;
- (void)setDidReuse:(BOOL)a3;
- (void)setInterfaceOrientation:(int64_t)a3;
- (void)setText:(id)a3;
- (void)setTextColor:(id)a3;
- (void)setTextInsideBox:(BOOL)a3;
- (void)setTextOnTop:(BOOL)a3;
@end

@implementation AXCameraFeatureDebuggingView

- (AXCameraFeatureDebuggingView)initWithFrame:(CGRect)a3
{
  v19.receiver = self;
  v19.super_class = (Class)AXCameraFeatureDebuggingView;
  v3 = -[AXCameraFeatureDebuggingView initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F1CB60]);
    double v5 = *MEMORY[0x263F001A8];
    double v6 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v7 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v8 = *(double *)(MEMORY[0x263F001A8] + 24);
    uint64_t v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], v6, v7, v8);
    crossHairX = v3->__crossHairX;
    v3->__crossHairX = (UIView *)v9;

    v11 = [(AXCameraFeatureDebuggingView *)v3 borderColor];
    [(UIView *)v3->__crossHairX setBackgroundColor:v11];

    [(AXCameraFeatureDebuggingView *)v3 addSubview:v3->__crossHairX];
    uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", v5, v6, v7, v8);
    crossHairY = v3->__crossHairY;
    v3->__crossHairY = (UIView *)v12;

    v14 = [(AXCameraFeatureDebuggingView *)v3 borderColor];
    [(UIView *)v3->__crossHairY setBackgroundColor:v14];

    [(AXCameraFeatureDebuggingView *)v3 addSubview:v3->__crossHairY];
    uint64_t v15 = [MEMORY[0x263F1C550] whiteColor];
    textColor = v3->_textColor;
    v3->_textColor = (UIColor *)v15;

    v17 = v3;
  }

  return v3;
}

- (double)borderWidth
{
  v2 = [(AXCameraFeatureDebuggingView *)self layer];
  [v2 borderWidth];
  double v4 = v3;

  return v4;
}

- (void)setBorderWidth:(double)a3
{
  id v4 = [(AXCameraFeatureDebuggingView *)self layer];
  [v4 setBorderWidth:a3];
}

- (void)setBorderColor:(id)a3
{
  double v5 = (UIColor *)a3;
  borderColor = self->_borderColor;
  if (borderColor != v5)
  {
    v13 = v5;
    if (([(UIColor *)borderColor isEqual:v5] & 1) == 0)
    {
      objc_storeStrong((id *)&self->_borderColor, a3);
      double v7 = v13;
      uint64_t v8 = [(UIColor *)v7 CGColor];
      uint64_t v9 = [(AXCameraFeatureDebuggingView *)self layer];
      [v9 setBorderColor:v8];

      v10 = [(AXCameraFeatureDebuggingView *)self _crossHairX];
      [v10 setBackgroundColor:v7];

      v11 = [(AXCameraFeatureDebuggingView *)self _crossHairY];
      [v11 setBackgroundColor:v7];

      uint64_t v12 = [(AXCameraFeatureDebuggingView *)self _label];
      [v12 setBackgroundColor:v7];
    }
  }

  MEMORY[0x270F9A758]();
}

- (void)setTextColor:(id)a3
{
  double v6 = (UIColor *)a3;
  if (self->_textColor != v6)
  {
    objc_storeStrong((id *)&self->_textColor, a3);
    double v5 = [(AXCameraFeatureDebuggingView *)self _label];
    [v5 setTextColor:v6];
  }
}

- (NSString)text
{
  v2 = [(AXCameraFeatureDebuggingView *)self _label];
  double v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setText:(id)a3
{
  id v11 = a3;
  if (v11 && !self->__label)
  {
    id v4 = objc_alloc(MEMORY[0x263F1C768]);
    double v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    double v6 = [(AXCameraFeatureDebuggingView *)self textColor];
    [(UILabel *)v5 setTextColor:v6];

    double v7 = [(AXCameraFeatureDebuggingView *)self borderColor];
    [(UILabel *)v5 setBackgroundColor:v7];

    uint64_t v8 = [MEMORY[0x263F1C658] systemFontOfSize:16.0];
    [(UILabel *)v5 setFont:v8];

    [(UILabel *)v5 setTextAlignment:1];
    [(AXCameraFeatureDebuggingView *)self addSubview:v5];
    label = self->__label;
    self->__label = v5;
  }
  v10 = [(AXCameraFeatureDebuggingView *)self _label];
  [v10 setText:v11];

  [(AXCameraFeatureDebuggingView *)self setNeedsLayout];
}

- (void)setTextOnTop:(BOOL)a3
{
  if (self->_textOnTop != a3)
  {
    self->_textOnTop = a3;
    [(AXCameraFeatureDebuggingView *)self setNeedsLayout];
  }
}

- (void)setTextInsideBox:(BOOL)a3
{
  if (self->_textInsideBox != a3)
  {
    self->_textInsideBox = a3;
    [(AXCameraFeatureDebuggingView *)self setNeedsLayout];
  }
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  if (self->_interfaceOrientation != a3)
  {
    self->_interfaceOrientation = a3;
    [(AXCameraFeatureDebuggingView *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v50.receiver = self;
  v50.super_class = (Class)AXCameraFeatureDebuggingView;
  [(AXCameraFeatureDebuggingView *)&v50 layoutSubviews];
  [(AXCameraFeatureDebuggingView *)self bounds];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  double v8 = v7;
  double v10 = v9;
  UIRectGetCenter();
  double MinX = v11;
  double MaxY = v13;
  [(AXCameraFeatureDebuggingView *)self borderWidth];
  if (v15 <= 0.0) {
    double v16 = 0.0;
  }
  else {
    double v16 = 10.0;
  }
  v17 = [(AXCameraFeatureDebuggingView *)self _crossHairX];
  objc_msgSend(v17, "setCenter:", MinX, MaxY);

  v18 = [(AXCameraFeatureDebuggingView *)self _crossHairY];
  objc_msgSend(v18, "setCenter:", MinX, MaxY);

  objc_super v19 = [(AXCameraFeatureDebuggingView *)self _crossHairX];
  objc_msgSend(v19, "setBounds:", 0.0, 0.0, v16, 2.0);

  v20 = [(AXCameraFeatureDebuggingView *)self _crossHairY];
  objc_msgSend(v20, "setBounds:", 0.0, 0.0, 2.0, v16);

  v21 = [(AXCameraFeatureDebuggingView *)self _label];
  if (v21)
  {
    if ((unint64_t)([(AXCameraFeatureDebuggingView *)self interfaceOrientation] - 3) >= 2) {
      double v22 = v8;
    }
    else {
      double v22 = v10;
    }
    [v21 intrinsicContentSize];
    double v44 = fmax(v23, v22);
    double v45 = v24;
    double v46 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v47 = *MEMORY[0x263F001A8];
    BOOL v25 = [(AXCameraFeatureDebuggingView *)self textOnTop];
    uint64_t v26 = MEMORY[0x263F00148];
    double v27 = *MEMORY[0x263F00148];
    int64_t v28 = [(AXCameraFeatureDebuggingView *)self interfaceOrientation];
    if (v28 == 2)
    {
      uint64_t v34 = v4;
      uint64_t v35 = v6;
      double v36 = v8;
      double v37 = v10;
      if (v25)
      {
        double MaxY = CGRectGetMaxY(*(CGRect *)&v34);
        double v29 = 1.0;
      }
      else
      {
        double MaxY = CGRectGetMinY(*(CGRect *)&v34);
        double v29 = -1.0;
      }
      *(double *)&unint64_t v38 = 3.14159265;
    }
    else
    {
      double v29 = *(double *)(v26 + 8);
      uint64_t v30 = v4;
      uint64_t v31 = v6;
      double v32 = v8;
      double v33 = v10;
      if (v28 == 4)
      {
        if (v25)
        {
          double MinX = CGRectGetMinX(*(CGRect *)&v30);
          double v27 = -1.0;
        }
        else
        {
          double MinX = CGRectGetMaxX(*(CGRect *)&v30);
          double v27 = 1.0;
        }
        *(double *)&unint64_t v38 = -1.57079633;
      }
      else if (v28 == 3)
      {
        if (v25)
        {
          double MinX = CGRectGetMaxX(*(CGRect *)&v30);
          double v27 = 1.0;
        }
        else
        {
          double MinX = CGRectGetMinX(*(CGRect *)&v30);
          double v27 = -1.0;
        }
        *(double *)&unint64_t v38 = 1.57079633;
      }
      else
      {
        if (v25)
        {
          double MaxY = CGRectGetMinY(*(CGRect *)&v30);
          double v29 = -1.0;
        }
        else
        {
          double MaxY = CGRectGetMaxY(*(CGRect *)&v30);
          double v29 = 1.0;
        }
        *(double *)&unint64_t v38 = 0.0;
      }
    }
    CGFloat angle = *(double *)&v38;
    BOOL v39 = [(AXCameraFeatureDebuggingView *)self textInsideBox];
    double v40 = -(v45 * 0.5);
    if (!v39) {
      double v40 = v45 * 0.5;
    }
    double v41 = MinX + v27 * v40;
    double v42 = MaxY + v29 * v40;
    memset(&v49, 0, sizeof(v49));
    CGAffineTransformMakeRotation(&v49, angle);
    objc_msgSend(v21, "setCenter:", v41, v42);
    objc_msgSend(v21, "setBounds:", v47, v46, v44, v45);
    CGAffineTransform v48 = v49;
    [v21 setTransform:&v48];
  }
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (BOOL)textOnTop
{
  return self->_textOnTop;
}

- (BOOL)textInsideBox
{
  return self->_textInsideBox;
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (BOOL)didReuse
{
  return self->_didReuse;
}

- (void)setDidReuse:(BOOL)a3
{
  self->_didReuse = a3;
}

- (UIView)_crossHairX
{
  return self->__crossHairX;
}

- (UIView)_crossHairY
{
  return self->__crossHairY;
}

- (UILabel)_label
{
  return self->__label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__label, 0);
  objc_storeStrong((id *)&self->__crossHairY, 0);
  objc_storeStrong((id *)&self->__crossHairX, 0);
  objc_storeStrong((id *)&self->_textColor, 0);

  objc_storeStrong((id *)&self->_borderColor, 0);
}

@end
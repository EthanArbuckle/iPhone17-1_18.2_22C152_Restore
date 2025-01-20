@interface NTKKuiperNumeralLabel
- (NSString)text;
- (NTKKuiperNumeralLabel)initWithDevice:(id)a3;
- (UIColor)backgroundTextColor;
- (UIColor)foregroundTextColor;
- (UIFont)backgroundFont;
- (UIFont)foregroundFont;
- (void)drawRect:(CGRect)a3;
- (void)setBackgroundFont:(id)a3;
- (void)setBackgroundTextColor:(id)a3;
- (void)setForegroundFont:(id)a3;
- (void)setForegroundTextColor:(id)a3;
- (void)setText:(id)a3;
@end

@implementation NTKKuiperNumeralLabel

- (NTKKuiperNumeralLabel)initWithDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKKuiperNumeralLabel;
  v6 = -[NTKKuiperNumeralLabel initWithFrame:](&v9, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    [(NTKKuiperNumeralLabel *)v7 setOpaque:0];
    [(NTKKuiperNumeralLabel *)v7 setClearsContextBeforeDrawing:1];
  }

  return v7;
}

- (void)drawRect:(CGRect)a3
{
  v31.receiver = self;
  v31.super_class = (Class)NTKKuiperNumeralLabel;
  -[NTKKuiperNumeralLabel drawRect:](&v31, "drawRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = self->_device;
  [(NTKKuiperNumeralLabel *)self bounds];
  uint64_t v6 = v5;
  CGFloat v8 = v7;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  long long v10 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v30.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v30.c = v10;
  *(_OWORD *)&v30.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  CGContextSetTextMatrix(CurrentContext, &v30);
  CGContextTranslateCTM(CurrentContext, 0.0, v8);
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  CGContextSetAllowsFontSubpixelPositioning(CurrentContext, 1);
  CGContextSetAllowsFontSubpixelQuantization(CurrentContext, 0);
  CGContextSetAllowsAntialiasing(CurrentContext, 1);
  CGContextSetAllowsFontSmoothing(CurrentContext, 1);
  CGContextSetShouldSubpixelPositionFonts(CurrentContext, 1);
  CGContextSetShouldSubpixelQuantizeFonts(CurrentContext, 0);
  CGContextSetShouldAntialias(CurrentContext, 1);
  CGContextSetShouldSmoothFonts(CurrentContext, 1);
  v11 = v4;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_17288);
  id WeakRetained = objc_loadWeakRetained(&qword_17290);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v13 = WeakRetained;
  v14 = (CLKDevice *)objc_loadWeakRetained(&qword_17290);
  if (v14 != v11)
  {

LABEL_5:
    id v17 = objc_storeWeak(&qword_17290, v11);
    qword_17298 = (uint64_t)[(CLKDevice *)v11 version];

    sub_915C(v18, (uint64_t)v11);
    goto LABEL_6;
  }
  id v15 = [(CLKDevice *)v11 version];
  uint64_t v16 = qword_17298;

  if (v15 != (id)v16) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_17288);
  uint64_t v19 = qword_17280;

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_8EA8;
  v29[3] = &unk_107A0;
  v29[4] = v6;
  *(CGFloat *)&v29[5] = v8;
  v29[6] = CurrentContext;
  v29[7] = v19;
  v20 = objc_retainBlock(v29);
  v21 = [(NTKKuiperNumeralLabel *)self text];
  v22 = v21;
  backgroundFont = self->_backgroundFont;
  if (backgroundFont)
  {
    backgroundTextColor = self->_backgroundTextColor;
    if (backgroundTextColor)
    {
      v25 = sub_8F20(v21, backgroundFont, backgroundTextColor);
      ((void (*)(void *, void *))v20[2])(v20, v25);
    }
  }
  foregroundFont = self->_foregroundFont;
  if (foregroundFont)
  {
    foregroundTextColor = self->_foregroundTextColor;
    if (foregroundTextColor)
    {
      v28 = sub_8F20(v22, foregroundFont, foregroundTextColor);
      ((void (*)(void *, void *))v20[2])(v20, v28);
    }
  }
  CGContextRestoreGState(CurrentContext);
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (UIFont)backgroundFont
{
  return self->_backgroundFont;
}

- (void)setBackgroundFont:(id)a3
{
}

- (UIFont)foregroundFont
{
  return self->_foregroundFont;
}

- (void)setForegroundFont:(id)a3
{
}

- (UIColor)backgroundTextColor
{
  return self->_backgroundTextColor;
}

- (void)setBackgroundTextColor:(id)a3
{
}

- (UIColor)foregroundTextColor
{
  return self->_foregroundTextColor;
}

- (void)setForegroundTextColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foregroundTextColor, 0);
  objc_storeStrong((id *)&self->_backgroundTextColor, 0);
  objc_storeStrong((id *)&self->_foregroundFont, 0);
  objc_storeStrong((id *)&self->_backgroundFont, 0);
  objc_storeStrong((id *)&self->_text, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end
@interface LPCircularProgressIndicatorStyle
- (LPCircularProgressIndicatorStyle)initWithPlatform:(int64_t)a3;
- (UIColor)borderColor;
- (UIColor)fillColor;
- (double)borderWidth;
- (void)setBorderColor:(id)a3;
- (void)setBorderWidth:(double)a3;
- (void)setFillColor:(id)a3;
@end

@implementation LPCircularProgressIndicatorStyle

- (LPCircularProgressIndicatorStyle)initWithPlatform:(int64_t)a3
{
  v14.receiver = self;
  v14.super_class = (Class)LPCircularProgressIndicatorStyle;
  v4 = [(LPCircularProgressIndicatorStyle *)&v14 init];
  v5 = v4;
  if (v4)
  {
    v4->_borderWidth = 3.0;
    if ((unint64_t)a3 < 5 || a3 == 6)
    {
      uint64_t v6 = [MEMORY[0x1E4FB1618] lightGrayColor];
      borderColor = v5->_borderColor;
      v5->_borderColor = (UIColor *)v6;

      uint64_t v8 = [MEMORY[0x1E4FB1618] lightGrayColor];
    }
    else
    {
      if (a3 != 5) {
        goto LABEL_5;
      }
      uint64_t v12 = [MEMORY[0x1E4FB1618] whiteColor];
      v13 = v5->_borderColor;
      v5->_borderColor = (UIColor *)v12;

      uint64_t v8 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    }
    fillColor = v5->_fillColor;
    v5->_fillColor = (UIColor *)v8;

LABEL_5:
    v10 = v5;
  }

  return v5;
}

- (double)borderWidth
{
  return self->_borderWidth;
}

- (void)setBorderWidth:(double)a3
{
  self->_borderWidth = a3;
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (void)setBorderColor:(id)a3
{
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (void)setFillColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fillColor, 0);

  objc_storeStrong((id *)&self->_borderColor, 0);
}

@end
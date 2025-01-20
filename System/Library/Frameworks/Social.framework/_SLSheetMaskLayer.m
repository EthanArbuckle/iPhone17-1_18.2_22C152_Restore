@interface _SLSheetMaskLayer
- (UIColor)clipBackgroundColor;
- (double)clipCornerRadius;
- (void)drawInContext:(CGContext *)a3;
- (void)setClipBackgroundColor:(id)a3;
- (void)setClipCornerRadius:(double)a3;
@end

@implementation _SLSheetMaskLayer

- (void)drawInContext:(CGContext *)a3
{
  CGContextSaveGState(a3);
  [(_SLSheetMaskLayer *)self bounds];
  double x = v14.origin.x;
  double y = v14.origin.y;
  double width = v14.size.width;
  double height = v14.size.height;
  CGContextAddRect(a3, v14);
  v9 = (void *)MEMORY[0x1E4F427D0];
  [(_SLSheetMaskLayer *)self clipCornerRadius];
  objc_msgSend(v9, "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, v10);
  id v11 = objc_claimAutoreleasedReturnValue();
  CGContextAddPath(a3, (CGPathRef)[v11 CGPath]);

  CGContextEOClip(a3);
  id v12 = [(_SLSheetMaskLayer *)self clipBackgroundColor];
  CGContextSetFillColorWithColor(a3, (CGColorRef)[v12 CGColor]);

  v15.origin.double x = x;
  v15.origin.double y = y;
  v15.size.double width = width;
  v15.size.double height = height;
  CGContextFillRect(a3, v15);

  CGContextRestoreGState(a3);
}

- (double)clipCornerRadius
{
  return self->_clipCornerRadius;
}

- (void)setClipCornerRadius:(double)a3
{
  self->_clipCornerRadius = a3;
}

- (UIColor)clipBackgroundColor
{
  return self->_clipBackgroundColor;
}

- (void)setClipBackgroundColor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
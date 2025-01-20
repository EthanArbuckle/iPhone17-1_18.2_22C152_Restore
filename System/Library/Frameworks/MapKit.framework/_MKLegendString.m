@interface _MKLegendString
- (NSAttributedString)string;
- (_MKLegendString)init;
- (double)baselineDistanceFromBottom;
- (id)actionForKey:(id)a3;
- (void)dealloc;
- (void)drawInContext:(CGContext *)a3;
- (void)setFrame:(CGRect)a3;
- (void)setString:(id)a3;
- (void)sizeToFit;
@end

@implementation _MKLegendString

- (_MKLegendString)init
{
  v5.receiver = self;
  v5.super_class = (Class)_MKLegendString;
  v2 = [(_MKLegendString *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F42D90] mainScreen];
    [v3 scale];
    -[_MKLegendString setContentsScale:](v2, "setContentsScale:");
  }
  return v2;
}

- (void)dealloc
{
  line = self->_line;
  if (line) {
    CFRelease(line);
  }
  v4.receiver = self;
  v4.super_class = (Class)_MKLegendString;
  [(_MKLegendString *)&v4 dealloc];
}

- (void)sizeToFit
{
  line = self->_line;
  if (line)
  {
    CGFloat descent = 0.0;
    CGFloat ascent = 0.0;
    CGFloat leading = 0.0;
    CTLineGetTypographicBounds(line, &ascent, &descent, &leading);
    CGRect BoundsWithOptions = CTLineGetBoundsWithOptions(self->_line, 8uLL);
    ceil(CGRectGetMaxX(BoundsWithOptions));
    self->_baselineDistanceFromBottom = descent;
    [(_MKLegendString *)self frame];
    -[_MKLegendString setFrame:](self, "setFrame:");
  }
}

- (void)setFrame:(CGRect)a3
{
  v3.receiver = self;
  v3.super_class = (Class)_MKLegendString;
  -[_MKLegendString setFrame:](&v3, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setString:(id)a3
{
  objc_super v5 = (NSAttributedString *)a3;
  v6 = v5;
  if (self->_string != v5)
  {
    v10 = v5;
    BOOL v7 = -[NSAttributedString isEqualToAttributedString:](v5, "isEqualToAttributedString:");
    v6 = v10;
    if (!v7)
    {
      objc_storeStrong((id *)&self->_string, a3);
      line = self->_line;
      if (line)
      {
        CFRelease(line);
        self->_line = 0;
      }
      v6 = v10;
      if (self->_string)
      {
        CFAttributedStringRef v9 = [(_MKLegendString *)self string];
        self->_line = CTLineCreateWithAttributedString(v9);

        v6 = v10;
      }
    }
  }
}

- (void)drawInContext:(CGContext *)a3
{
  objc_super v5 = [(_MKLegendString *)self string];
  if (v5)
  {
    line = self->_line;

    if (line)
    {
      CGContextSaveGState(a3);
      [(_MKLegendString *)self bounds];
      CGContextTranslateCTM(a3, 0.0, v7);
      CGContextScaleCTM(a3, 1.0, -1.0);
      CGContextSetTextPosition(a3, 0.0, self->_baselineDistanceFromBottom);
      VKLineDrawWithOuterStroke();
      CGContextRestoreGState(a3);
    }
  }
}

- (id)actionForKey:(id)a3
{
  return 0;
}

- (NSAttributedString)string
{
  return self->_string;
}

- (double)baselineDistanceFromBottom
{
  return self->_baselineDistanceFromBottom;
}

- (void).cxx_destruct
{
}

@end
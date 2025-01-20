@interface FontRepertoireCell
- (CGRect)boundingRect;
- (CGSize)advance;
- (FontRepertoireCell)initWithFrame:(CGRect)a3;
- (UIFont)font;
- (double)descent;
- (double)leading;
- (unsigned)gid;
- (void)drawRect:(CGRect)a3;
- (void)setAdvance:(CGSize)a3;
- (void)setBoundingRect:(CGRect)a3;
- (void)setDescent:(double)a3;
- (void)setFont:(id)a3;
- (void)setGid:(unsigned __int16)a3;
- (void)setLeading:(double)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation FontRepertoireCell

- (FontRepertoireCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FontRepertoireCell;
  v3 = -[FontRepertoireCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIColor systemBackgroundColor];
    [(FontRepertoireCell *)v3 setBackgroundColor:v4];

    v3->_gid = 0;
  }
  return v3;
}

- (void)setGid:(unsigned __int16)a3
{
  if (self->_font)
  {
    p_gid = &self->_gid;
    self->_gid = a3;
    font = self->_font;
    CTFontGetAdvancesForGlyphs((CTFontRef)font, kCTFontOrientationDefault, &self->_gid, &self->_advance, 1);
    CTFontGetBoundingRectsForGlyphs((CTFontRef)font, kCTFontOrientationDefault, p_gid, &self->_boundingRect, 1);
    self->_descent = CTFontGetDescent((CTFontRef)font);
    self->_leading = CTFontGetLeading((CTFontRef)font);
    [(FontRepertoireCell *)self setNeedsDisplay];
  }
}

- (void)setSelected:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FontRepertoireCell;
  [(FontRepertoireCell *)&v4 setSelected:a3];
  [(FontRepertoireCell *)self setNeedsDisplay];
}

- (void)drawRect:(CGRect)a3
{
  font = self->_font;
  if (font)
  {
    CGFloat height = a3.size.height;
    double width = a3.size.width;
    double y = a3.origin.y;
    double x = a3.origin.x;
    CurrentContext = UIGraphicsGetCurrentContext();
    if ([(FontRepertoireCell *)self isSelected])
    {
      v14.origin.double x = x;
      v14.origin.double y = y;
      v14.size.double width = width;
      v14.size.CGFloat height = height;
      CGRectInset(v14, 1.0, 1.0);
      v15.origin.double x = x;
      v15.origin.double y = y;
      v15.size.double width = width;
      v15.size.CGFloat height = height;
      CGContextStrokeRect(CurrentContext, v15);
    }
    CGContextTranslateCTM(CurrentContext, 0.0, height);
    CGContextScaleCTM(CurrentContext, 1.0, -1.0);
    id v10 = +[UIColor labelColor];
    CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v10 CGColor]);

    long long v11 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v13.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v13.c = v11;
    *(_OWORD *)&v13.tdouble x = *(_OWORD *)&CGAffineTransformIdentity.tx;
    CGContextSetTextMatrix(CurrentContext, &v13);
    CGFloat v12 = y + self->_descent + self->_leading;
    v13.a = x + width * 0.5 - self->_boundingRect.size.width * 0.5;
    v13.b = v12;
    CTFontDrawGlyphs((CTFontRef)font, &self->_gid, (const CGPoint *)&v13, 1uLL, CurrentContext);
  }
}

- (UIFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
}

- (unsigned)gid
{
  return self->_gid;
}

- (CGRect)boundingRect
{
  double x = self->_boundingRect.origin.x;
  double y = self->_boundingRect.origin.y;
  double width = self->_boundingRect.size.width;
  double height = self->_boundingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBoundingRect:(CGRect)a3
{
  self->_boundingRect = a3;
}

- (CGSize)advance
{
  double width = self->_advance.width;
  double height = self->_advance.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setAdvance:(CGSize)a3
{
  self->_advance = a3;
}

- (double)descent
{
  return self->_descent;
}

- (void)setDescent:(double)a3
{
  self->_descent = a3;
}

- (double)leading
{
  return self->_leading;
}

- (void)setLeading:(double)a3
{
  self->_leading = a3;
}

- (void).cxx_destruct
{
}

@end
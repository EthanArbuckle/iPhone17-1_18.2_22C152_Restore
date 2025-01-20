@interface CoreColor
+ (id)blackColorWithSystem:(unsigned __int8)a3;
+ (id)colorWithSystem:(unsigned __int8)a3 cgColor:(CGColor *)a4;
+ (id)systemBlueColorWithSystem:(unsigned __int8)a3;
+ (id)systemBrownColorWithSystem:(unsigned __int8)a3;
+ (id)systemCyanColorWithSystem:(unsigned __int8)a3;
+ (id)systemGrayColorWithSystem:(unsigned __int8)a3;
+ (id)systemGreenColorWithSystem:(unsigned __int8)a3;
+ (id)systemIndigoColorWithSystem:(unsigned __int8)a3;
+ (id)systemMintColorWithSystem:(unsigned __int8)a3;
+ (id)systemOrangeColorWithSystem:(unsigned __int8)a3;
+ (id)systemPinkColorWithSystem:(unsigned __int8)a3;
+ (id)systemPurpleColorWithSystem:(unsigned __int8)a3;
+ (id)systemRedColorWithSystem:(unsigned __int8)a3;
+ (id)systemTealColorWithSystem:(unsigned __int8)a3;
+ (id)systemYellowColorWithSystem:(unsigned __int8)a3;
- (CGColor)CGColor;
- (CoreColor)colorWithAlphaComponent:(double)a3;
- (CoreColor)initWithCGColor:(CGColor *)a3;
- (void)dealloc;
- (void)set;
- (void)setFill;
- (void)setStroke;
@end

@implementation CoreColor

+ (id)colorWithSystem:(unsigned __int8)a3 cgColor:(CGColor *)a4
{
  v6 = (void *)CoreColorClass(a3);
  if (v6)
  {
    return (id)[v6 colorWithCGColor:a4];
  }
  else
  {
    v8 = (void *)[objc_alloc((Class)a1) initWithCGColor:a4];
    return v8;
  }
}

+ (id)blackColorWithSystem:(unsigned __int8)a3
{
  v3 = (void *)CoreColorClass(a3);

  return (id)[v3 blackColor];
}

+ (id)systemRedColorWithSystem:(unsigned __int8)a3
{
  v3 = (void *)CoreColorClass(a3);

  return (id)[v3 systemRedColor];
}

+ (id)systemOrangeColorWithSystem:(unsigned __int8)a3
{
  v3 = (void *)CoreColorClass(a3);

  return (id)[v3 systemOrangeColor];
}

+ (id)systemYellowColorWithSystem:(unsigned __int8)a3
{
  v3 = (void *)CoreColorClass(a3);

  return (id)[v3 systemYellowColor];
}

+ (id)systemGreenColorWithSystem:(unsigned __int8)a3
{
  v3 = (void *)CoreColorClass(a3);

  return (id)[v3 systemGreenColor];
}

+ (id)systemTealColorWithSystem:(unsigned __int8)a3
{
  v3 = (void *)CoreColorClass(a3);

  return (id)[v3 systemTealColor];
}

+ (id)systemMintColorWithSystem:(unsigned __int8)a3
{
  v3 = (void *)CoreColorClass(a3);

  return (id)[v3 systemMintColor];
}

+ (id)systemCyanColorWithSystem:(unsigned __int8)a3
{
  v3 = (void *)CoreColorClass(a3);

  return (id)[v3 systemCyanColor];
}

+ (id)systemBlueColorWithSystem:(unsigned __int8)a3
{
  v3 = (void *)CoreColorClass(a3);

  return (id)[v3 systemBlueColor];
}

+ (id)systemIndigoColorWithSystem:(unsigned __int8)a3
{
  v3 = (void *)CoreColorClass(a3);

  return (id)[v3 systemIndigoColor];
}

+ (id)systemPurpleColorWithSystem:(unsigned __int8)a3
{
  v3 = (void *)CoreColorClass(a3);

  return (id)[v3 systemPurpleColor];
}

+ (id)systemPinkColorWithSystem:(unsigned __int8)a3
{
  v3 = (void *)CoreColorClass(a3);

  return (id)[v3 systemPinkColor];
}

+ (id)systemBrownColorWithSystem:(unsigned __int8)a3
{
  v3 = (void *)CoreColorClass(a3);

  return (id)[v3 systemBrownColor];
}

+ (id)systemGrayColorWithSystem:(unsigned __int8)a3
{
  v3 = (void *)CoreColorClass(a3);

  return (id)[v3 systemGrayColor];
}

- (CoreColor)initWithCGColor:(CGColor *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CoreColor;
  v4 = [(CoreColor *)&v6 init];
  if (v4) {
    v4->_color = CGColorRetain(a3);
  }
  return v4;
}

- (void)dealloc
{
  CGColorRelease(self->_color);
  v3.receiver = self;
  v3.super_class = (Class)CoreColor;
  [(CoreColor *)&v3 dealloc];
}

- (void)set
{
  objc_super v3 = [+[CoreGraphicsContext current] CGContext];
  if (v3)
  {
    v4 = v3;
    CGContextSetFillColorWithColor(v3, [(CoreColor *)self CGColor]);
    v5 = [(CoreColor *)self CGColor];
    CGContextSetStrokeColorWithColor(v4, v5);
  }
}

- (void)setFill
{
  objc_super v3 = [+[CoreGraphicsContext current] CGContext];
  if (v3)
  {
    v4 = v3;
    v5 = [(CoreColor *)self CGColor];
    CGContextSetFillColorWithColor(v4, v5);
  }
}

- (void)setStroke
{
  objc_super v3 = [+[CoreGraphicsContext current] CGContext];
  if (v3)
  {
    v4 = v3;
    v5 = [(CoreColor *)self CGColor];
    CGContextSetStrokeColorWithColor(v4, v5);
  }
}

- (CGColor)CGColor
{
  return self->_color;
}

- (CoreColor)colorWithAlphaComponent:(double)a3
{
  CopyWithAlpha = CGColorCreateCopyWithAlpha(self->_color, a3);
  v4 = +[CoreColor colorWithCGColor:CopyWithAlpha];
  CGColorRelease(CopyWithAlpha);
  return v4;
}

@end
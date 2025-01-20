@interface CSSIntegralSize
+ (CSSIntegralSize)zeroSize;
- (BOOL)hasZeroArea;
- (BOOL)isEqual:(id)a3;
- (CSSIntegralSize)init;
- (CSSIntegralSize)initWithFloatingPointSize:(CGSize)a3;
- (CSSIntegralSize)initWithWidth:(unint64_t)a3 height:(unint64_t)a4;
- (CSSIntegralSize)rotatedSize;
- (id)description;
- (id)sizeScaledByFactor:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)height;
- (unint64_t)width;
@end

@implementation CSSIntegralSize

+ (CSSIntegralSize)zeroSize
{
  v2 = objc_opt_new();

  return (CSSIntegralSize *)v2;
}

- (CSSIntegralSize)init
{
  return [(CSSIntegralSize *)self initWithWidth:0 height:0];
}

- (CSSIntegralSize)initWithFloatingPointSize:(CGSize)a3
{
  return [(CSSIntegralSize *)self initWithWidth:(unint64_t)a3.width height:(unint64_t)a3.height];
}

- (CSSIntegralSize)initWithWidth:(unint64_t)a3 height:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CSSIntegralSize;
  result = [(CSSIntegralSize *)&v7 init];
  if (result)
  {
    result->_width = a3;
    result->_height = a4;
  }
  return result;
}

- (id)sizeScaledByFactor:(unint64_t)a3
{
  id v3 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithWidth:height:", -[CSSIntegralSize width](self, "width") * a3, -[CSSIntegralSize height](self, "height") * a3);

  return v3;
}

- (BOOL)hasZeroArea
{
  return ![(CSSIntegralSize *)self width] || [(CSSIntegralSize *)self height] == 0;
}

- (CSSIntegralSize)rotatedSize
{
  id v2 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithWidth:height:", -[CSSIntegralSize height](self, "height"), -[CSSIntegralSize width](self, "width"));

  return (CSSIntegralSize *)v2;
}

- (id)description
{
  return +[NSString stringWithFormat:@"<%@: %p { width = %lu, height = %lu }>", objc_opt_class(), self, [(CSSIntegralSize *)self width], [(CSSIntegralSize *)self height]];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    id v6 = [(CSSIntegralSize *)self width];
    if (v6 == [v5 width])
    {
      id v7 = [(CSSIntegralSize *)self height];
      BOOL v8 = v7 == [v5 height];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = [(CSSIntegralSize *)self width];
  return [(CSSIntegralSize *)self height] ^ v3;
}

- (unint64_t)width
{
  return self->_width;
}

- (unint64_t)height
{
  return self->_height;
}

@end
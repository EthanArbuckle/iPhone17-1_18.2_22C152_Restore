@interface EQKitHVSpace
- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4;
- (BOOL)isEqual:(id)a3;
- (EQKitHVSpace)initWithWidth:(double)a3 height:(double)a4 depth:(double)a5;
- (double)depth;
- (double)height;
- (double)layoutDepth;
- (double)layoutHeight;
- (double)width;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation EQKitHVSpace

- (EQKitHVSpace)initWithWidth:(double)a3 height:(double)a4 depth:(double)a5
{
  v9.receiver = self;
  v9.super_class = (Class)EQKitHVSpace;
  result = [(EQKitHVSpace *)&v9 init];
  if (result)
  {
    result->_width = a3;
    result->_height = a4;
    result->_depth = a5;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  [(EQKitHVSpace *)self width];
  double v6 = v5;
  [(EQKitHVSpace *)self height];
  double v8 = v7;
  [(EQKitHVSpace *)self depth];

  return (id)[v4 initWithWidth:v6 height:v8 depth:v9];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (EQKitHVSpace *)a3;
  if (self == v4)
  {
    BOOL v15 = 1;
  }
  else if ([(EQKitHVSpace *)v4 isMemberOfClass:objc_opt_class()])
  {
    double v5 = v4;
    [(EQKitHVSpace *)self width];
    double v7 = v6;
    [(EQKitHVSpace *)v5 width];
    if (v7 == v8
      && ([(EQKitHVSpace *)self height], double v10 = v9, [(EQKitHVSpace *)v5 height], v10 == v11))
    {
      [(EQKitHVSpace *)self depth];
      double v13 = v12;
      [(EQKitHVSpace *)v5 depth];
      BOOL v15 = v13 == v14;
    }
    else
    {
      BOOL v15 = 0;
    }
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(EQKitHVSpace *)self height];
  uint64_t v6 = v5;
  [(EQKitHVSpace *)self depth];
  uint64_t v8 = v7;
  [(EQKitHVSpace *)self width];
  return (id)[v3 stringWithFormat:@"<%@ %p>: height=%f depth=%f width=%f", v4, self, v6, v8, v9];
}

- (double)layoutHeight
{
  return self->_height;
}

- (double)layoutDepth
{
  return self->_depth;
}

- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4
{
  return 0;
}

- (double)width
{
  return self->_width;
}

- (double)height
{
  return self->_height;
}

- (double)depth
{
  return self->_depth;
}

@end
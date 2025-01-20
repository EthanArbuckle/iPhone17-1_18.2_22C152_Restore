@interface EQKitVSpace
- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4;
- (BOOL)isEqual:(id)a3;
- (EQKitVSpace)initWithHeight:(double)a3 depth:(double)a4;
- (double)depth;
- (double)height;
- (double)layoutDepth;
- (double)layoutHeight;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation EQKitVSpace

- (EQKitVSpace)initWithHeight:(double)a3 depth:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)EQKitVSpace;
  result = [(EQKitVSpace *)&v7 init];
  if (result)
  {
    result->_height = a3;
    result->_depth = a4;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  [(EQKitVSpace *)self height];
  double v6 = v5;
  [(EQKitVSpace *)self depth];

  return (id)[v4 initWithHeight:v6 depth:v7];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (EQKitVSpace *)a3;
  if (self == v4)
  {
    BOOL v12 = 1;
  }
  else if ([(EQKitVSpace *)v4 isMemberOfClass:objc_opt_class()])
  {
    double v5 = v4;
    [(EQKitVSpace *)self height];
    double v7 = v6;
    [(EQKitVSpace *)v5 height];
    if (v7 == v8)
    {
      [(EQKitVSpace *)self depth];
      double v10 = v9;
      [(EQKitVSpace *)v5 depth];
      BOOL v12 = v10 == v11;
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(EQKitVSpace *)self height];
  uint64_t v6 = v5;
  [(EQKitVSpace *)self depth];
  return (id)[v3 stringWithFormat:@"<%@ %p>: height=%f depth=%f", v4, self, v6, v7];
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

- (double)height
{
  return self->_height;
}

- (double)depth
{
  return self->_depth;
}

@end
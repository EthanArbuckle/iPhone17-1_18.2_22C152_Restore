@interface CCUIAnimationCustomTimingFunctionParameters
+ (id)functionWithControlPoint1:(CGPoint)a3 controlPoint2:(CGPoint)a4;
- (BOOL)isEqual:(id)a3;
- (CGPoint)controlPoint1;
- (CGPoint)controlPoint2;
- (NSString)description;
- (id)_initWithControlPoint1:(CGPoint)a3 controlPoint2:(CGPoint)a4;
- (unint64_t)hash;
@end

@implementation CCUIAnimationCustomTimingFunctionParameters

+ (id)functionWithControlPoint1:(CGPoint)a3 controlPoint2:(CGPoint)a4
{
  v4 = objc_msgSend(objc_alloc((Class)a1), "_initWithControlPoint1:controlPoint2:", a3.x, a3.y, a4.x, a4.y);

  return v4;
}

- (id)_initWithControlPoint1:(CGPoint)a3 controlPoint2:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  CGFloat v6 = a3.y;
  CGFloat v7 = a3.x;
  v9.receiver = self;
  v9.super_class = (Class)CCUIAnimationCustomTimingFunctionParameters;
  id result = [(CCUIAnimationCustomTimingFunctionParameters *)&v9 init];
  if (result)
  {
    *((CGFloat *)result + 1) = v7;
    *((CGFloat *)result + 2) = v6;
    *((CGFloat *)result + 3) = x;
    *((CGFloat *)result + 4) = y;
  }
  return result;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [(CCUIAnimationCustomTimingFunctionParameters *)self controlPoint1];
  id v4 = (id)objc_msgSend(v3, "appendPoint:withName:", @"Control Point 1");
  [(CCUIAnimationCustomTimingFunctionParameters *)self controlPoint2];
  id v5 = (id)objc_msgSend(v3, "appendPoint:withName:", @"Control Point 2");
  CGFloat v6 = [v3 build];

  return (NSString *)v6;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  [(CCUIAnimationCustomTimingFunctionParameters *)self controlPoint1];
  id v4 = (id)objc_msgSend(v3, "appendCGPoint:");
  [(CCUIAnimationCustomTimingFunctionParameters *)self controlPoint2];
  id v5 = (id)objc_msgSend(v3, "appendCGPoint:");
  unint64_t v6 = [v3 hash];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CCUIAnimationCustomTimingFunctionParameters *)a3;
  if (v4 == self)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      id v5 = v4;
      [(CCUIAnimationCustomTimingFunctionParameters *)self controlPoint1];
      double v7 = v6;
      double v9 = v8;
      [(CCUIAnimationCustomTimingFunctionParameters *)v5 controlPoint1];
      BOOL v11 = 0;
      if (v7 == v12 && v9 == v10)
      {
        [(CCUIAnimationCustomTimingFunctionParameters *)self controlPoint2];
        double v14 = v13;
        double v16 = v15;
        [(CCUIAnimationCustomTimingFunctionParameters *)v5 controlPoint2];
        BOOL v11 = v16 == v18 && v14 == v17;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (CGPoint)controlPoint1
{
  double x = self->_controlPoint1.x;
  double y = self->_controlPoint1.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)controlPoint2
{
  double x = self->_controlPoint2.x;
  double y = self->_controlPoint2.y;
  result.double y = y;
  result.double x = x;
  return result;
}

@end
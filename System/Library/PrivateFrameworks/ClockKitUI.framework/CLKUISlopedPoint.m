@interface CLKUISlopedPoint
- (CGPoint)point;
- (CGVector)tangent;
- (CLKUISlopedPoint)init;
- (CLKUISlopedPoint)initWithPoint:(CGPoint)a3 tangent:(CGVector)a4;
- (void)setPoint:(CGPoint)a3;
- (void)setTangent:(CGVector)a3;
@end

@implementation CLKUISlopedPoint

- (CGPoint)point
{
  double v2 = sub_1D31A5924((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___CLKUISlopedPoint_point);
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setPoint:(CGPoint)a3
{
}

- (CGVector)tangent
{
  double v2 = sub_1D31A5924((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___CLKUISlopedPoint_tangent);
  result.dy = v3;
  result.dx = v2;
  return result;
}

- (void)setTangent:(CGVector)a3
{
}

- (CLKUISlopedPoint)initWithPoint:(CGPoint)a3 tangent:(CGVector)a4
{
  CGFloat dy = a4.dy;
  CGFloat dx = a4.dx;
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v10 = (CGFloat *)((char *)self + OBJC_IVAR___CLKUISlopedPoint_point);
  CGFloat *v10 = x;
  v10[1] = y;
  v11 = (CGFloat *)((char *)self + OBJC_IVAR___CLKUISlopedPoint_tangent);
  CGFloat *v11 = dx;
  v11[1] = dy;
  v13.receiver = self;
  v13.super_class = ObjectType;
  return [(CLKUISlopedPoint *)&v13 init];
}

- (CLKUISlopedPoint)init
{
  CGVector result = (CLKUISlopedPoint *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
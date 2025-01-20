@interface AXAuditPoint
+ (id)createWithPoint:(CGPoint)a3;
+ (void)registerTransportableObjectWithManager:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CGPoint)point;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setPoint:(CGPoint)a3;
@end

@implementation AXAuditPoint

+ (void)registerTransportableObjectWithManager:(id)a3
{
  id v3 = a3;
  v5 = [[AXAuditObjectTransportInfoPropertyBased alloc] initWithClass:objc_opt_class() transportKey:@"AXAuditPoint_v1"];
  v4 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  [(AXAuditObjectTransportPropertyEntry *)v4 setTransportKey:@"PointValue_v1"];
  [(AXAuditObjectTransportPropertyEntry *)v4 setLocalValueToTransportValue:&__block_literal_global_6];
  [(AXAuditObjectTransportPropertyEntry *)v4 setPopulateLocalObjectWithTransportValue:&__block_literal_global_10_1];
  [(AXAuditObjectTransportInfoPropertyBased *)v5 addPropertyEntry:v4];
  [v3 registerTransportInfoPropertyBased:v5];
}

uint64_t __55__AXAuditPoint_registerTransportableObjectWithManager___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F08D40];
  [a2 point];

  return objc_msgSend(v2, "valueWithPoint:");
}

void __55__AXAuditPoint_registerTransportableObjectWithManager___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v4 pointValue];
    objc_msgSend(v5, "setPoint:");
  }
}

+ (id)createWithPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = objc_alloc_init(AXAuditPoint);
  -[AXAuditPoint setPoint:](v5, "setPoint:", x, y);

  return v5;
}

- (unint64_t)hash
{
  [(AXAuditPoint *)self point];
  return (unint64_t)(v2 + v3);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AXAuditPoint *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(AXAuditPoint *)self point];
      CGFloat v6 = v5;
      CGFloat v8 = v7;
      [(AXAuditPoint *)v4 point];
      v14.double x = v9;
      v14.double y = v10;
      v13.double x = v6;
      v13.double y = v8;
      BOOL v11 = NSEqualPoints(v13, v14);
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  [(AXAuditPoint *)self point];
  objc_msgSend(v4, "setPoint:");
  return v4;
}

- (CGPoint)point
{
  double x = self->_point.x;
  double y = self->_point.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPoint:(CGPoint)a3
{
  self->_point = a3;
}

@end
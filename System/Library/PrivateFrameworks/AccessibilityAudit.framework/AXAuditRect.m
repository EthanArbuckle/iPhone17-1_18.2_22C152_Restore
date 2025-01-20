@interface AXAuditRect
+ (id)createWithRect:(CGRect)a3;
+ (void)registerTransportableObjectWithManager:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CGRect)rect;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setRect:(CGRect)a3;
@end

@implementation AXAuditRect

+ (void)registerTransportableObjectWithManager:(id)a3
{
  id v3 = a3;
  v5 = [[AXAuditObjectTransportInfoPropertyBased alloc] initWithClass:objc_opt_class() transportKey:@"AXAuditRect_v1"];
  v4 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  [(AXAuditObjectTransportPropertyEntry *)v4 setTransportKey:@"RectValue_v1"];
  [(AXAuditObjectTransportPropertyEntry *)v4 setLocalValueToTransportValue:&__block_literal_global_4];
  [(AXAuditObjectTransportPropertyEntry *)v4 setPopulateLocalObjectWithTransportValue:&__block_literal_global_10_0];
  [(AXAuditObjectTransportInfoPropertyBased *)v5 addPropertyEntry:v4];
  [v3 registerTransportInfoPropertyBased:v5];
}

uint64_t __54__AXAuditRect_registerTransportableObjectWithManager___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F08D40];
  [a2 rect];

  return objc_msgSend(v2, "valueWithRect:");
}

void __54__AXAuditRect_registerTransportableObjectWithManager___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v4 rectValue];
    objc_msgSend(v5, "setRect:");
  }
}

+ (id)createWithRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = objc_alloc_init(AXAuditRect);
  -[AXAuditRect setRect:](v7, "setRect:", x, y, width, height);

  return v7;
}

- (unint64_t)hash
{
  [(AXAuditRect *)self rect];
  return (unint64_t)(v5 + v4 + v2 + v3);
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (AXAuditRect *)a3;
  if (self == v4)
  {
    BOOL v17 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(AXAuditRect *)self rect];
      CGFloat v6 = v5;
      CGFloat v8 = v7;
      CGFloat v10 = v9;
      CGFloat v12 = v11;
      [(AXAuditRect *)v4 rect];
      v20.origin.double x = v13;
      v20.origin.double y = v14;
      v20.size.double width = v15;
      v20.size.double height = v16;
      v19.origin.double x = v6;
      v19.origin.double y = v8;
      v19.size.double width = v10;
      v19.size.double height = v12;
      BOOL v17 = NSEqualRects(v19, v20);
    }
    else
    {
      BOOL v17 = 0;
    }
  }

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  [(AXAuditRect *)self rect];
  objc_msgSend(v4, "setRect:");
  return v4;
}

- (CGRect)rect
{
  double x = self->_rect.origin.x;
  double y = self->_rect.origin.y;
  double width = self->_rect.size.width;
  double height = self->_rect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setRect:(CGRect)a3
{
  self->_rect = a3;
}

@end
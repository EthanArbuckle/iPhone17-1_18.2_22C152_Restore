@interface AXAuditSize
+ (id)createWithSize:(CGSize)a3;
+ (void)registerTransportableObjectWithManager:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CGSize)size;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setSize:(CGSize)a3;
@end

@implementation AXAuditSize

+ (void)registerTransportableObjectWithManager:(id)a3
{
  id v3 = a3;
  v5 = [[AXAuditObjectTransportInfoPropertyBased alloc] initWithClass:objc_opt_class() transportKey:@"AXAuditSize_v1"];
  v4 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  [(AXAuditObjectTransportPropertyEntry *)v4 setTransportKey:@"SizeValue_v1"];
  [(AXAuditObjectTransportPropertyEntry *)v4 setLocalValueToTransportValue:&__block_literal_global_7];
  [(AXAuditObjectTransportPropertyEntry *)v4 setPopulateLocalObjectWithTransportValue:&__block_literal_global_10_2];
  [(AXAuditObjectTransportInfoPropertyBased *)v5 addPropertyEntry:v4];
  [v3 registerTransportInfoPropertyBased:v5];
}

uint64_t __54__AXAuditSize_registerTransportableObjectWithManager___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F08D40];
  [a2 size];

  return objc_msgSend(v2, "valueWithSize:");
}

void __54__AXAuditSize_registerTransportableObjectWithManager___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v4 sizeValue];
    objc_msgSend(v5, "setSize:");
  }
}

+ (id)createWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = objc_alloc_init(AXAuditSize);
  -[AXAuditSize setSize:](v5, "setSize:", width, height);

  return v5;
}

- (unint64_t)hash
{
  [(AXAuditSize *)self size];
  return (unint64_t)(v2 + v3);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AXAuditSize *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(AXAuditSize *)self size];
      CGFloat v6 = v5;
      CGFloat v8 = v7;
      [(AXAuditSize *)v4 size];
      v14.double width = v9;
      v14.double height = v10;
      v13.double width = v6;
      v13.double height = v8;
      BOOL v11 = NSEqualSizes(v13, v14);
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
  [(AXAuditSize *)self size];
  objc_msgSend(v4, "setSize:");
  return v4;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

@end
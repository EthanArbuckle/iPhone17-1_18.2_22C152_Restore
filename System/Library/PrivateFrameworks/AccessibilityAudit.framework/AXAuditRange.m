@interface AXAuditRange
+ (id)createWithRange:(_NSRange)a3;
+ (void)registerTransportableObjectWithManager:(id)a3;
- (BOOL)isEqual:(id)a3;
- (_NSRange)range;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setRange:(_NSRange)a3;
@end

@implementation AXAuditRange

+ (void)registerTransportableObjectWithManager:(id)a3
{
  id v3 = a3;
  v5 = [[AXAuditObjectTransportInfoPropertyBased alloc] initWithClass:objc_opt_class() transportKey:@"AXAuditRange_v1"];
  v4 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  [(AXAuditObjectTransportPropertyEntry *)v4 setTransportKey:@"RangeValue_v1"];
  [(AXAuditObjectTransportPropertyEntry *)v4 setLocalValueToTransportValue:&__block_literal_global_8];
  [(AXAuditObjectTransportPropertyEntry *)v4 setPopulateLocalObjectWithTransportValue:&__block_literal_global_10_3];
  [(AXAuditObjectTransportInfoPropertyBased *)v5 addPropertyEntry:v4];
  [v3 registerTransportInfoPropertyBased:v5];
}

uint64_t __55__AXAuditRange_registerTransportableObjectWithManager___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F08D40];
  uint64_t v4 = [a2 range];

  return objc_msgSend(v2, "valueWithRange:", v4, v3);
}

void __55__AXAuditRange_registerTransportableObjectWithManager___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 rangeValue];
    objc_msgSend(v7, "setRange:", v5, v6);
  }
}

+ (id)createWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v5 = objc_alloc_init(AXAuditRange);
  -[AXAuditRange setRange:](v5, "setRange:", location, length);

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2 = [(AXAuditRange *)self range];
  return v2 + v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AXAuditRange *)a3;
  if (self == v4)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [(AXAuditRange *)self range];
      uint64_t v7 = v6;
      BOOL v10 = v5 == [(AXAuditRange *)v4 range] && v7 == v8;
    }
    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v5 = [(AXAuditRange *)self range];
  objc_msgSend(v4, "setRange:", v5, v6);
  return v4;
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

@end
@interface AXAuditPSN
+ (id)createWithPSN:(ProcessSerialNumber)a3;
+ (void)registerTransportableObjectWithManager:(id)a3;
- (BOOL)isEqual:(id)a3;
- (ProcessSerialNumber)psn;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setPsn:(ProcessSerialNumber)a3;
@end

@implementation AXAuditPSN

+ (id)createWithPSN:(ProcessSerialNumber)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setPsn:a3];

  return v4;
}

+ (void)registerTransportableObjectWithManager:(id)a3
{
  id v3 = a3;
  v6 = [[AXAuditObjectTransportInfoPropertyBased alloc] initWithClass:objc_opt_class() transportKey:@"AXAuditPSN_v1"];
  id v4 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  [(AXAuditObjectTransportPropertyEntry *)v4 setTransportKey:@"PsnHigh_v1"];
  [(AXAuditObjectTransportPropertyEntry *)v4 setLocalValueToTransportValue:&__block_literal_global_1];
  [(AXAuditObjectTransportPropertyEntry *)v4 setPopulateLocalObjectWithTransportValue:&__block_literal_global_10];
  v5 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  [(AXAuditObjectTransportPropertyEntry *)v5 setTransportKey:@"PsnLow_v1"];
  [(AXAuditObjectTransportPropertyEntry *)v5 setLocalValueToTransportValue:&__block_literal_global_15];
  [(AXAuditObjectTransportPropertyEntry *)v5 setPopulateLocalObjectWithTransportValue:&__block_literal_global_17];
  [(AXAuditObjectTransportInfoPropertyBased *)v6 addPropertyEntry:v5];
  [(AXAuditObjectTransportInfoPropertyBased *)v6 addPropertyEntry:v4];
  [v3 registerTransportInfoPropertyBased:v6];
}

uint64_t __53__AXAuditPSN_registerTransportableObjectWithManager___block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 psn];

  return [v2 numberWithUnsignedInt:v3];
}

void __53__AXAuditPSN_registerTransportableObjectWithManager___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setPsn:", objc_msgSend(v5, "psn") & 0xFFFFFFFF00000000 | objc_msgSend(v4, "integerValue"));
  }
}

uint64_t __53__AXAuditPSN_registerTransportableObjectWithManager___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  unint64_t v3 = (unint64_t)[a2 psn] >> 32;

  return [v2 numberWithUnsignedInt:v3];
}

void __53__AXAuditPSN_registerTransportableObjectWithManager___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setPsn:", objc_msgSend(v5, "psn") | ((unint64_t)objc_msgSend(v4, "integerValue") << 32));
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setPsn:", -[AXAuditPSN psn](self, "psn"));
  return v4;
}

- (unint64_t)hash
{
  ProcessSerialNumber v2 = [(AXAuditPSN *)self psn];
  return v2.highLongOfPSN ^ HIDWORD(*(unint64_t *)&v2);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AXAuditPSN *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      ProcessSerialNumber v6 = [(AXAuditPSN *)self psn];
      uint64_t v7 = [(AXAuditPSN *)v5 psn];

      BOOL v8 = v6 == v7;
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (ProcessSerialNumber)psn
{
  return self->_psn;
}

- (void)setPsn:(ProcessSerialNumber)a3
{
  self->_psn = a3;
}

@end
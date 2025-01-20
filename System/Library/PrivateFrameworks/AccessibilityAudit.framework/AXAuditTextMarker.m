@interface AXAuditTextMarker
+ (void)registerTransportableObjectWithManager:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)markerDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)platformMarker;
- (unint64_t)hash;
- (void)setMarkerDescription:(id)a3;
- (void)setPlatformMarker:(id)a3;
@end

@implementation AXAuditTextMarker

+ (void)registerTransportableObjectWithManager:(id)a3
{
  id v3 = a3;
  v6 = [[AXAuditObjectTransportInfoPropertyBased alloc] initWithClass:objc_opt_class() transportKey:@"AXAuditTextMarker_v1"];
  v4 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  [(AXAuditObjectTransportPropertyEntry *)v4 setTransportKey:@"PlatformMarkerValue_v1"];
  [(AXAuditObjectTransportPropertyEntry *)v4 setLocalValueToTransportValue:&__block_literal_global_22];
  [(AXAuditObjectTransportPropertyEntry *)v4 setPopulateLocalObjectWithTransportValue:&__block_literal_global_11_2];
  [(AXAuditObjectTransportInfoPropertyBased *)v6 addPropertyEntry:v4];
  [v3 registerTransportInfoPropertyBased:v6];

  v5 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  [(AXAuditObjectTransportInfoPropertyBased *)v6 addPropertyEntry:v5];
  [(AXAuditObjectTransportPropertyEntry *)v5 setTransportKey:@"MarkerDescriptionValue_v1"];
  [(AXAuditObjectTransportPropertyEntry *)v5 setLocalValueToTransportValue:&__block_literal_global_17_4];
  [(AXAuditObjectTransportPropertyEntry *)v5 setPopulateLocalObjectWithTransportValue:&__block_literal_global_20_0];
}

id __60__AXAuditTextMarker_registerTransportableObjectWithManager___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 platformMarker];
  if (v2
    && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    id v3 = v2;
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

void __60__AXAuditTextMarker_registerTransportableObjectWithManager___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    [v5 setPlatformMarker:v4];
  }
}

uint64_t __60__AXAuditTextMarker_registerTransportableObjectWithManager___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 markerDescription];
}

void __60__AXAuditTextMarker_registerTransportableObjectWithManager___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 setMarkerDescription:v4];
  }
}

- (unint64_t)hash
{
  id v3 = [(AXAuditTextMarker *)self platformMarker];
  uint64_t v4 = [v3 hash];
  id v5 = [(AXAuditTextMarker *)self markerDescription];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (AXAuditTextMarker *)a3;
  if (self == v4)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [(AXAuditTextMarker *)self platformMarker];
      uint64_t v7 = [(AXAuditTextMarker *)v5 platformMarker];
      if (v6 | v7 && ![(id)v6 isEqual:v7])
      {
        BOOL v10 = 0;
      }
      else
      {
        uint64_t v8 = [(AXAuditTextMarker *)self markerDescription];
        uint64_t v9 = [(AXAuditTextMarker *)v5 markerDescription];
        BOOL v10 = !(v8 | v9) || [(id)v8 isEqual:v9];
      }
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
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = [(AXAuditTextMarker *)self platformMarker];
  [v4 setPlatformMarker:v5];

  uint64_t v6 = [(AXAuditTextMarker *)self markerDescription];
  [v4 setMarkerDescription:v6];

  return v4;
}

- (id)platformMarker
{
  return self->_platformMarker;
}

- (void)setPlatformMarker:(id)a3
{
}

- (NSString)markerDescription
{
  return self->_markerDescription;
}

- (void)setMarkerDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_markerDescription, 0);

  objc_storeStrong(&self->_platformMarker, 0);
}

@end
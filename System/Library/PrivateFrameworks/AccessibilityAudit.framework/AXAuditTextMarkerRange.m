@interface AXAuditTextMarkerRange
+ (void)registerTransportableObjectWithManager:(id)a3;
- (AXAuditTextMarker)endMarker;
- (AXAuditTextMarker)startMarker;
- (BOOL)isEqual:(id)a3;
- (NSString)markerRangeDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setEndMarker:(id)a3;
- (void)setMarkerRangeDescription:(id)a3;
- (void)setStartMarker:(id)a3;
@end

@implementation AXAuditTextMarkerRange

+ (void)registerTransportableObjectWithManager:(id)a3
{
  id v3 = a3;
  v7 = [[AXAuditObjectTransportInfoPropertyBased alloc] initWithClass:objc_opt_class() transportKey:@"AXAuditTextMarkerRange_v1"];
  v4 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  [(AXAuditObjectTransportInfoPropertyBased *)v7 addPropertyEntry:v4];
  [(AXAuditObjectTransportPropertyEntry *)v4 setTransportKey:@"StartMarkerValue_v1"];
  [(AXAuditObjectTransportPropertyEntry *)v4 setLocalValueToTransportValue:&__block_literal_global_5];
  [(AXAuditObjectTransportPropertyEntry *)v4 setPopulateLocalObjectWithTransportValue:&__block_literal_global_9_0];
  v5 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  [(AXAuditObjectTransportInfoPropertyBased *)v7 addPropertyEntry:v5];
  [(AXAuditObjectTransportPropertyEntry *)v5 setTransportKey:@"EndMarkerValue_v1"];
  [(AXAuditObjectTransportPropertyEntry *)v5 setLocalValueToTransportValue:&__block_literal_global_15_1];
  [(AXAuditObjectTransportPropertyEntry *)v5 setPopulateLocalObjectWithTransportValue:&__block_literal_global_17_1];
  v6 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  [(AXAuditObjectTransportInfoPropertyBased *)v7 addPropertyEntry:v6];
  [(AXAuditObjectTransportPropertyEntry *)v6 setTransportKey:@"MarkerRangeDescriptionValue_v1"];
  [(AXAuditObjectTransportPropertyEntry *)v6 setLocalValueToTransportValue:&__block_literal_global_23];
  [(AXAuditObjectTransportPropertyEntry *)v6 setPopulateLocalObjectWithTransportValue:&__block_literal_global_25];
  [v3 registerTransportInfoPropertyBased:v7];
}

uint64_t __65__AXAuditTextMarkerRange_registerTransportableObjectWithManager___block_invoke(uint64_t a1, void *a2)
{
  return [a2 startMarker];
}

void __65__AXAuditTextMarkerRange_registerTransportableObjectWithManager___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 setStartMarker:v4];
  }
}

uint64_t __65__AXAuditTextMarkerRange_registerTransportableObjectWithManager___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 endMarker];
}

void __65__AXAuditTextMarkerRange_registerTransportableObjectWithManager___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 setEndMarker:v4];
  }
}

uint64_t __65__AXAuditTextMarkerRange_registerTransportableObjectWithManager___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 markerRangeDescription];
}

void __65__AXAuditTextMarkerRange_registerTransportableObjectWithManager___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 setMarkerRangeDescription:v4];
  }
}

- (unint64_t)hash
{
  id v3 = [(AXAuditTextMarkerRange *)self endMarker];
  uint64_t v4 = [v3 hash];
  id v5 = [(AXAuditTextMarkerRange *)self startMarker];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(AXAuditTextMarkerRange *)self markerRangeDescription];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (AXAuditTextMarkerRange *)a3;
  if (self == v4)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [(AXAuditTextMarkerRange *)self startMarker];
      uint64_t v7 = [(AXAuditTextMarkerRange *)v5 startMarker];
      if (v6 | v7 && ![(id)v6 isEqual:v7])
      {
        BOOL v12 = 0;
      }
      else
      {
        uint64_t v8 = [(AXAuditTextMarkerRange *)self endMarker];
        uint64_t v9 = [(AXAuditTextMarkerRange *)v5 endMarker];
        if (v8 | v9 && ![(id)v8 isEqual:v9])
        {
          BOOL v12 = 0;
        }
        else
        {
          uint64_t v10 = [(AXAuditTextMarkerRange *)self markerRangeDescription];
          uint64_t v11 = [(AXAuditTextMarkerRange *)v5 markerRangeDescription];
          BOOL v12 = !(v10 | v11) || [(id)v10 isEqual:v11];
        }
      }
    }
    else
    {
      BOOL v12 = 0;
    }
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = [(AXAuditTextMarkerRange *)self startMarker];
  [v4 setStartMarker:v5];

  uint64_t v6 = [(AXAuditTextMarkerRange *)self endMarker];
  [v4 setEndMarker:v6];

  uint64_t v7 = [(AXAuditTextMarkerRange *)self markerRangeDescription];
  [v4 setMarkerRangeDescription:v7];

  return v4;
}

- (NSString)markerRangeDescription
{
  return self->_markerRangeDescription;
}

- (void)setMarkerRangeDescription:(id)a3
{
}

- (AXAuditTextMarker)startMarker
{
  return self->_startMarker;
}

- (void)setStartMarker:(id)a3
{
}

- (AXAuditTextMarker)endMarker
{
  return self->_endMarker;
}

- (void)setEndMarker:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endMarker, 0);
  objc_storeStrong((id *)&self->_startMarker, 0);

  objc_storeStrong((id *)&self->_markerRangeDescription, 0);
}

@end
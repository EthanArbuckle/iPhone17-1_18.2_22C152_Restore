@interface GEOLocationShiftingIsRequiredRequest
+ (Class)replyClass;
- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate;
- (BOOL)isValid;
- (GEOLocationShiftingIsRequiredRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5;
- (GEOLocationShiftingIsRequiredRequest)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (GEOMapRegion)region;
- (unint64_t)reply;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setCoordinate:(id)a3;
- (void)setRegion:(id)a3;
@end

@implementation GEOLocationShiftingIsRequiredRequest

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

- (GEOLocationShiftingIsRequiredRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return [(GEOXPCRequest *)self initWithMessage:@"locationshift.isRequiredForCoordinate" traits:a3 auditToken:a4 throttleToken:a5];
}

- (GEOLocationShiftingIsRequiredRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)GEOLocationShiftingIsRequiredRequest;
  v7 = [(GEOXPCRequest *)&v18 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    v8 = xpc_dictionary_get_value(v6, "coordinate");
    v9 = v8;
    if (v8)
    {
      long long v17 = 0uLL;
      if (xpc_data_get_bytes(v8, &v17, 0, 0x10uLL) == 16) {
        *(_OWORD *)(v7 + 104) = v17;
      }
    }

    *(void *)&long long v17 = 0;
    data = xpc_dictionary_get_data(v6, "region", (size_t *)&v17);
    if (data)
    {
      v11 = [MEMORY[0x1E4F1C9B8] dataWithBytes:data length:(void)v17];
      v12 = [[GEOMapRegion alloc] initWithData:v11];
    }
    else
    {
      uint64_t v16 = xpc_dictionary_get_value(v6, "region");
      v11 = (void *)v16;
      if (!v16 || MEMORY[0x18C1213B0](v16) != MEMORY[0x1E4F14580]) {
        goto LABEL_8;
      }
      v12 = objc_alloc_init(GEOMapRegion);
    }
    v13 = (void *)*((void *)v7 + 12);
    *((void *)v7 + 12) = v12;

LABEL_8:
    v14 = v7;
  }

  return (GEOLocationShiftingIsRequiredRequest *)v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GEOLocationShiftingIsRequiredRequest;
  [(GEOXPCRequest *)&v8 encodeToXPCDictionary:v4];
  xpc_object_t v5 = xpc_data_create(&self->_coordinate, 0x10uLL);
  if (v5) {
    xpc_dictionary_set_value(v4, "coordinate", v5);
  }

  region = self->_region;
  if (region)
  {
    id v7 = [(GEOMapRegion *)region data];
    xpc_dictionary_set_data(v4, "region", (const void *)[v7 bytes], objc_msgSend(v7, "length"));
  }
}

- (BOOL)isValid
{
  return 1;
}

- (unint64_t)reply
{
  return 1;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (void)setCoordinate:(id)a3
{
  self->_coordinate = ($AB5116BA7E623E054F959CECB034F4E7)a3;
}

- (GEOMapRegion)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
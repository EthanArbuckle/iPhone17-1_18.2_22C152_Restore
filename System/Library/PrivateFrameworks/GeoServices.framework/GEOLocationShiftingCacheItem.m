@interface GEOLocationShiftingCacheItem
- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate;
- (GEOLocationShiftingCacheItem)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (NSDate)addDate;
- (double)radiusMeters;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setAddDate:(id)a3;
- (void)setCoordinate:(id)a3;
- (void)setRadiusMeters:(double)a3;
@end

@implementation GEOLocationShiftingCacheItem

- (GEOLocationShiftingCacheItem)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GEOLocationShiftingCacheItem;
  v6 = [(GEOLocationShiftingCacheItem *)&v14 init];
  if (v6)
  {
    if (xpc_dictionary_get_double(v5, "addDate") != 0.0)
    {
      uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
      v8 = (void *)*((void *)v6 + 1);
      *((void *)v6 + 1) = v7;
    }
    v9 = xpc_dictionary_get_value(v5, "coordinate");
    v10 = v9;
    if (v9)
    {
      long long v13 = 0uLL;
      if (xpc_data_get_bytes(v9, &v13, 0, 0x10uLL) == 16) {
        *(_OWORD *)(v6 + 24) = v13;
      }
    }

    *((double *)v6 + 2) = xpc_dictionary_get_double(v5, "radiusMeters");
    v11 = v6;
  }

  return (GEOLocationShiftingCacheItem *)v6;
}

- (void)encodeToXPCDictionary:(id)a3
{
  xpc_object_t xdict = a3;
  addDate = self->_addDate;
  if (addDate)
  {
    [(NSDate *)addDate timeIntervalSinceReferenceDate];
    if (v5 != 0.0) {
      xpc_dictionary_set_double(xdict, "addDate", v5);
    }
  }
  xpc_object_t v6 = xpc_data_create(&self->_coordinate, 0x10uLL);
  if (v6) {
    xpc_dictionary_set_value(xdict, "coordinate", v6);
  }

  xpc_dictionary_set_double(xdict, "radiusMeters", self->_radiusMeters);
}

- (NSDate)addDate
{
  return self->_addDate;
}

- (void)setAddDate:(id)a3
{
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

- (double)radiusMeters
{
  return self->_radiusMeters;
}

- (void)setRadiusMeters:(double)a3
{
  self->_radiusMeters = a3;
}

- (void).cxx_destruct
{
}

@end
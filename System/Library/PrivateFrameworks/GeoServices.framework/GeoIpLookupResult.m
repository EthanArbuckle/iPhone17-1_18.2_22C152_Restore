@interface GeoIpLookupResult
- ($F24F406B2B787EFB06265DBA3D28CBD5)latLong;
- (GeoIpLookupResult)initWithGEOPDPlaceResponse:(id)a3;
- (NSString)countryCode;
- (NSString)ipAddress;
- (NSString)timeZone;
@end

@implementation GeoIpLookupResult

- (GeoIpLookupResult)initWithGEOPDPlaceResponse:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)GeoIpLookupResult;
  v5 = [(GeoIpLookupResult *)&v19 init];
  if (v5)
  {
    v6 = [v4 globalResult];
    -[GEOPDPlaceGlobalResult ipGeoLookupResult](v6);
    v7 = (id *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      uint64_t v8 = -[GEOPDIpGeoLookupResult ipAddress](v7);
      ipAddress = v5->_ipAddress;
      v5->_ipAddress = (NSString *)v8;

      uint64_t v10 = -[GEOPDIpGeoLookupResult timeZome](v7);
      timeZone = v5->_timeZone;
      v5->_timeZone = (NSString *)v10;

      uint64_t v12 = -[GEOPDIpGeoLookupResult countryCode](v7);
      countryCode = v5->_countryCode;
      v5->_countryCode = (NSString *)v12;

      v14 = -[GEOPDIpGeoLookupResult location](v7);
      [v14 lat];
      v5->_latLong.latitude = v15;

      v16 = -[GEOPDIpGeoLookupResult location](v7);
      [v16 lng];
      v5->_latLong.longitude = v17;
    }
  }

  return v5;
}

- (NSString)ipAddress
{
  return self->_ipAddress;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)latLong
{
  double latitude = self->_latLong.latitude;
  double longitude = self->_latLong.longitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (NSString)timeZone
{
  return self->_timeZone;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);

  objc_storeStrong((id *)&self->_ipAddress, 0);
}

@end
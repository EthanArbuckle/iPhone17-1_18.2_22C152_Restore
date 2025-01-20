@interface GEOURLBackedMapItem
+ (BOOL)urlContainsExtraStorage:(id)a3;
- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate;
- (BOOL)_hasMUID;
- (BOOL)_hasResolvablePartialInformation;
- (BOOL)_hasTelephone;
- (BOOL)_responseStatusIsIncomplete;
- (BOOL)isValid;
- (GEOAddress)geoAddress;
- (GEOFeatureStyleAttributes)_styleAttributes;
- (GEOMapItemIdentifier)_identifier;
- (GEOMapRegion)displayMapRegion;
- (GEOMuninViewState)_muninViewState;
- (GEOURLBackedMapItem)init;
- (GEOURLBackedMapItem)initWithURL:(id)a3;
- (NSString)_businessURL;
- (NSString)_telephone;
- (NSString)name;
- (id)mapItemStorageForGEOMapItem;
- (int)referenceFrame;
- (unint64_t)_muid;
@end

@implementation GEOURLBackedMapItem

+ (BOOL)urlContainsExtraStorage:(id)a3
{
  id v3 = a3;
  v4 = [[GEOMapURLParser alloc] initWithURL:v3];

  if ([(GEOMapURLParser *)v4 parseIncludingCustomParameters:1])
  {
    v5 = [(GEOMapURLParser *)v4 extraStorage];
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (GEOURLBackedMapItem)init
{
  result = (GEOURLBackedMapItem *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOURLBackedMapItem)initWithURL:(id)a3
{
  id v5 = a3;
  if (v5 && +[GEOMapURLParser isValidMapURL:v5])
  {
    BOOL v6 = [[GEOMapURLParser alloc] initWithURL:v5];
    if ([(GEOMapURLParser *)v6 parseIncludingCustomParameters:1])
    {
      v31.receiver = self;
      v31.super_class = (Class)GEOURLBackedMapItem;
      v7 = [(GEOURLBackedMapItem *)&v31 init];
      v8 = v7;
      if (v7)
      {
        objc_storeStrong((id *)&v7->_url, a3);
        uint64_t v9 = [(GEOMapURLParser *)v6 extraStorage];
        extraStorage = v8->_extraStorage;
        v8->_extraStorage = (GEOURLExtraStorage *)v9;

        uint64_t v11 = [(GEOMapURLParser *)v6 muninViewState];
        muninViewState = v8->_muninViewState;
        v8->_muninViewState = (GEOMuninViewState *)v11;

        [(GEOMapURLParser *)v6 centerCoordinate];
        if (v14 < -180.0 || v14 > 180.0 || v13 < -90.0 || v13 > 90.0) {
          [(GEOMapURLParser *)v6 searchCoordinate];
        }
        v8->_coordinate.latitude = v13;
        v8->_coordinate.longitude = v14;
        uint64_t v15 = [(GEOMapURLParser *)v6 searchQuery];
        name = v8->_name;
        v8->_name = (NSString *)v15;

        uint64_t v17 = [(GEOMapURLParser *)v6 searchUID];
        v8->_muid = v17;
        v8->_hasMUID = v17 != 0;
        v18 = -[GEOMapItemIdentifier initWithMUID:resultProviderID:coordinate:]([GEOMapItemIdentifier alloc], "initWithMUID:resultProviderID:coordinate:", v8->_muid, [(GEOMapURLParser *)v6 searchProviderID], v8->_coordinate.latitude, v8->_coordinate.longitude);
        identifier = v8->_identifier;
        v8->_identifier = v18;

        if ([(GEOURLExtraStorage *)v8->_extraStorage hasStyleAttributes])
        {
          v20 = [GEOFeatureStyleAttributes alloc];
          v21 = [(GEOURLExtraStorage *)v8->_extraStorage styleAttributes];
          uint64_t v22 = [(GEOFeatureStyleAttributes *)v20 initWithGEOStyleAttributes:v21];
          styleAttributes = v8->_styleAttributes;
          v8->_styleAttributes = (GEOFeatureStyleAttributes *)v22;
        }
        v24 = [(GEOMapURLParser *)v6 addressString];
        if (v24)
        {
          v25 = objc_alloc_init(GEOAddress);
          [(GEOAddress *)v25 addFormattedAddressLine:v24];
          geoAddress = v8->_geoAddress;
          v8->_geoAddress = v25;
        }
        uint64_t v27 = [(GEOMapURLParser *)v6 enrichmentInfo];
        enrichmentInfo = v8->_enrichmentInfo;
        v8->_enrichmentInfo = (GEOEnrichmentInfo *)v27;
      }
      self = v8;
      v29 = self;
    }
    else
    {
      v29 = 0;
    }
  }
  else
  {
    v29 = 0;
  }

  return v29;
}

- (BOOL)isValid
{
  BOOL result = 0;
  double longitude = self->_coordinate.longitude;
  if (longitude >= -180.0 && longitude <= 180.0)
  {
    double latitude = self->_coordinate.latitude;
    if (latitude >= -90.0 && latitude <= 90.0) {
      return [(NSString *)self->_name length] != 0;
    }
  }
  return result;
}

- (int)referenceFrame
{
  if (+[GEOLocationShifter isLocationShiftRequiredForCoordinate:](GEOLocationShifter, "isLocationShiftRequiredForCoordinate:"))
  {
    return 2;
  }
  else
  {
    return 1;
  }
}

- (BOOL)_hasResolvablePartialInformation
{
  return self->_muid != 0;
}

- (BOOL)_responseStatusIsIncomplete
{
  return 0;
}

- (id)mapItemStorageForGEOMapItem
{
  id v3 = objc_opt_new();
  v4 = [(NSURL *)self->_url absoluteString];
  [v3 setMapsURL:v4];

  return v3;
}

- (BOOL)_hasTelephone
{
  return [(GEOURLExtraStorage *)self->_extraStorage hasPhoneNumber];
}

- (NSString)_telephone
{
  return [(GEOURLExtraStorage *)self->_extraStorage phoneNumber];
}

- (NSString)_businessURL
{
  return [(GEOURLExtraStorage *)self->_extraStorage url];
}

- (GEOMapRegion)displayMapRegion
{
  return [(GEOURLExtraStorage *)self->_extraStorage mapRegion];
}

- (GEOFeatureStyleAttributes)_styleAttributes
{
  return self->_styleAttributes;
}

- (GEOMapItemIdentifier)_identifier
{
  return self->_identifier;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (unint64_t)_muid
{
  return self->_muid;
}

- (BOOL)_hasMUID
{
  return self->_hasMUID;
}

- (GEOAddress)geoAddress
{
  return self->_geoAddress;
}

- (NSString)name
{
  return self->_name;
}

- (GEOMuninViewState)_muninViewState
{
  return self->_muninViewState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enrichmentInfo, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_geoAddress, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_muninViewState, 0);
  objc_storeStrong((id *)&self->_extraStorage, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

@end
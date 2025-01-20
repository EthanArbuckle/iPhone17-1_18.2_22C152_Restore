@interface GEOComposedGeometryRoutePersistentData
+ (BOOL)supportsSecureCoding;
- ($1AB5FA073B851C12C2339EC22442E995)destinationCoordinate;
- ($1AB5FA073B851C12C2339EC22442E995)originCoordinate;
- (BOOL)isAvailableForCurrentCountry;
- (BOOL)isEqual:(id)a3;
- (GEOAddressObject)address;
- (GEOComposedGeometryRoutePersistentData)init;
- (GEOComposedGeometryRoutePersistentData)initWithCoder:(id)a3;
- (GEOComposedRouteAnchorPointList)anchorPoints;
- (GEOElevationProfile)elevationProfile;
- (GEOMapItemIdentifier)tourIdentifier;
- (GEOMapRegion)boundingMapRegion;
- (GEOPDURLData)disclaimerURL;
- (GEORawRouteGeometry)rawRouteGeometry;
- (GEORouteAttributes)routeAttributes;
- (NSArray)routeNameLabels;
- (NSArray)travelDirectionArrows;
- (NSArray)waypoints;
- (NSString)disclaimerText;
- (NSString)iso3166CountryCode;
- (NSString)routeName;
- (NSString)userProvidedName;
- (NSString)userProvidedNotes;
- (NSUUID)routeID;
- (NSUUID)storageID;
- (double)distance;
- (double)duration;
- (int)elevationModel;
- (int)transportType;
- (unint64_t)hash;
- (unint64_t)mapItemMuid;
- (unint64_t)originalVersion;
- (unint64_t)source;
- (unint64_t)tourMuid;
- (unint64_t)version;
- (void)encodeWithCoder:(id)a3;
- (void)setAddress:(id)a3;
- (void)setAnchorPoints:(id)a3;
- (void)setBoundingMapRegion:(id)a3;
- (void)setDisclaimerText:(id)a3;
- (void)setDisclaimerURL:(id)a3;
- (void)setDistance:(double)a3;
- (void)setDuration:(double)a3;
- (void)setElevationModel:(int)a3;
- (void)setElevationProfile:(id)a3;
- (void)setIso3166CountryCode:(id)a3;
- (void)setMapItemMuid:(unint64_t)a3;
- (void)setRawRouteGeometry:(id)a3;
- (void)setRouteAttributes:(id)a3;
- (void)setRouteID:(id)a3;
- (void)setRouteName:(id)a3;
- (void)setRouteNameLabels:(id)a3;
- (void)setSource:(unint64_t)a3;
- (void)setStorageID:(id)a3;
- (void)setTourIdentifier:(id)a3;
- (void)setTourMuid:(unint64_t)a3;
- (void)setTransportType:(int)a3;
- (void)setTravelDirectionArrows:(id)a3;
- (void)setUserProvidedName:(id)a3;
- (void)setUserProvidedNotes:(id)a3;
- (void)setWaypoints:(id)a3;
- (void)updateCountryIfNecessaryWithCompletionHandler:(id)a3;
@end

@implementation GEOComposedGeometryRoutePersistentData

- (GEOComposedGeometryRoutePersistentData)init
{
  v8.receiver = self;
  v8.super_class = (Class)GEOComposedGeometryRoutePersistentData;
  v2 = [(GEOComposedGeometryRoutePersistentData *)&v8 init];
  v3 = (GEOComposedGeometryRoutePersistentData *)v2;
  if (v2)
  {
    *(int64x2_t *)(v2 + 24) = vdupq_n_s64(2uLL);
    uint64_t v4 = geo_isolater_create();
    countryCodeIsolater = v3->_countryCodeIsolater;
    v3->_countryCodeIsolater = (geo_isolater *)v4;

    v6 = v3;
  }

  return v3;
}

- (void)setAddress:(id)a3
{
  id v5 = a3;
  if (![(GEOAddressObject *)self->_address isEqual:v5])
  {
    objc_storeStrong((id *)&self->_address, a3);
    id v6 = v5;
    geo_isolate_sync_data();
  }
}

void __53__GEOComposedGeometryRoutePersistentData_setAddress___block_invoke(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 40) address];
  v2 = [v7 structuredAddress];
  v3 = [v2 countryCode];
  uint64_t v4 = [v3 copy];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 152);
  *(void *)(v5 + 152) = v4;
}

- (NSString)iso3166CountryCode
{
  uint64_t v5 = self->_countryCodeIsolater;
  _geo_isolate_lock_data();
  v3 = self->_iso3166CountryCode;
  _geo_isolate_unlock();

  return v3;
}

- (void)setIso3166CountryCode:(id)a3
{
  id v4 = a3;
  id v7 = self->_countryCodeIsolater;
  _geo_isolate_lock_data();
  uint64_t v5 = (NSString *)[v4 copy];
  iso3166CountryCode = self->_iso3166CountryCode;
  self->_iso3166CountryCode = v5;

  _geo_isolate_unlock();
}

- (void)setWaypoints:(id)a3
{
  objc_msgSend(a3, "_geo_map:", &__block_literal_global_207);
  id v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  waypoints = self->_waypoints;
  self->_waypoints = v4;
}

id __55__GEOComposedGeometryRoutePersistentData_setWaypoints___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = (void *)[v2 copy];
  id v4 = [v2 geoMapItem];

  uint64_t v5 = +[GEOMapItemStorage mapItemStorageForGEOMapItem:v4 forUseType:0];
  [v3 setMapItemStorage:v5];

  return v3;
}

- ($1AB5FA073B851C12C2339EC22442E995)originCoordinate
{
  id v2 = [(GEOComposedRouteAnchorPointList *)self->_anchorPoints firstObject];
  v3 = v2;
  if (v2)
  {
    [v2 locationCoordinate];
    unint64_t v5 = v4;
    unint64_t v7 = v6;
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v9 = 0x7FEFFFFFFFFFFFFFLL;
    unint64_t v5 = 0xC066800000000000;
    unint64_t v7 = 0xC066800000000000;
  }

  double v10 = *(double *)&v5;
  double v11 = *(double *)&v7;
  double v12 = *(double *)&v9;
  result.var2 = v12;
  result.var1 = v11;
  result.var0 = v10;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)destinationCoordinate
{
  id v2 = [(GEOComposedRouteAnchorPointList *)self->_anchorPoints lastObject];
  v3 = v2;
  if (v2)
  {
    [v2 locationCoordinate];
    unint64_t v5 = v4;
    unint64_t v7 = v6;
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v9 = 0x7FEFFFFFFFFFFFFFLL;
    unint64_t v5 = 0xC066800000000000;
    unint64_t v7 = 0xC066800000000000;
  }

  double v10 = *(double *)&v5;
  double v11 = *(double *)&v7;
  double v12 = *(double *)&v9;
  result.var2 = v12;
  result.var1 = v11;
  result.var0 = v10;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v5 = [(NSUUID *)self->_routeID isEqual:v4[8]];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return [(NSUUID *)self->_routeID hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInteger:self->_version forKey:@"_version"];
  [v4 encodeInteger:self->_originalVersion forKey:@"_originalVersion"];
  [v4 encodeObject:self->_storageID forKey:@"_storageID"];
  [v4 encodeObject:self->_userProvidedName forKey:@"_userProvidedName"];
  [v4 encodeObject:self->_userProvidedNotes forKey:@"_userProvidedNotes"];
  [v4 encodeObject:self->_routeID forKey:@"_routeID"];
  [v4 encodeObject:self->_routeName forKey:@"_routeName"];
  [v4 encodeInteger:self->_source forKey:@"_source"];
  [v4 encodeObject:self->_tourIdentifier forKey:@"_tourIdentifier"];
  [v4 encodeInt64:self->_tourMuid forKey:@"_tourMuid"];
  [v4 encodeInt64:self->_mapItemMuid forKey:@"_mapItemMuid"];
  [v4 encodeObject:self->_rawRouteGeometry forKey:@"_rawRouteGeometry"];
  [v4 encodeObject:self->_waypoints forKey:@"_waypoints"];
  [v4 encodeObject:self->_anchorPoints forKey:@"_anchorPoints"];
  [v4 encodeObject:self->_routeAttributes forKey:@"_routeAttributes"];
  [v4 encodeObject:self->_address forKey:@"_address"];
  [v4 encodeInteger:self->_transportType forKey:@"_transportType"];
  [v4 encodeDouble:@"_distance" forKey:self->_distance];
  [v4 encodeDouble:@"_duration" forKey:self->_duration];
  [v4 encodeObject:self->_elevationProfile forKey:@"_elevationProfile"];
  [v4 encodeInteger:self->_elevationModel forKey:@"_elevationModel"];
  [v4 encodeObject:self->_travelDirectionArrows forKey:@"_travelDirectionArrows"];
  [v4 encodeObject:self->_routeNameLabels forKey:@"_routeNameLabels"];
  [v4 encodeObject:self->_boundingMapRegion forKey:@"_boundingMapRegion"];
  [v4 encodeObject:self->_disclaimerText forKey:@"_disclaimerText"];
  [v4 encodeObject:self->_disclaimerURL forKey:@"_disclaimerURL"];
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__101;
  double v10 = __Block_byref_object_dispose__101;
  id v11 = 0;
  uint64_t v5 = MEMORY[0x1E4F143A8];
  geo_isolate_sync_data();
  objc_msgSend(v4, "encodeObject:forKey:", v7[5], @"iso3166CountryCode", v5, 3221225472, __58__GEOComposedGeometryRoutePersistentData_encodeWithCoder___block_invoke, &unk_1E53D89C0, self, &v6);
  _Block_object_dispose(&v6, 8);
}

void __58__GEOComposedGeometryRoutePersistentData_encodeWithCoder___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 152) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (GEOComposedGeometryRoutePersistentData)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(GEOComposedGeometryRoutePersistentData *)self init];
  if (v5)
  {
    v5->_version = [v4 decodeIntegerForKey:@"_version"];
    v5->_originalVersion = [v4 decodeIntegerForKey:@"_originalVersion"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_storageID"];
    storageID = v5->_storageID;
    v5->_storageID = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_userProvidedName"];
    userProvidedName = v5->_userProvidedName;
    v5->_userProvidedName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_userProvidedNotes"];
    userProvidedNotes = v5->_userProvidedNotes;
    v5->_userProvidedNotes = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_routeID"];
    routeID = v5->_routeID;
    v5->_routeID = (NSUUID *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_routeName"];
    routeName = v5->_routeName;
    v5->_routeName = (NSString *)v14;

    v5->_source = [v4 decodeIntegerForKey:@"_source"];
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_tourIdentifier"];
    tourIdentifier = v5->_tourIdentifier;
    v5->_tourIdentifier = (GEOMapItemIdentifier *)v16;

    v5->_tourMuid = [v4 decodeInt64ForKey:@"_tourMuid"];
    v5->_mapItemMuid = [v4 decodeInt64ForKey:@"_mapItemMuid"];
    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_rawRouteGeometry"];
    rawRouteGeometry = v5->_rawRouteGeometry;
    v5->_rawRouteGeometry = (GEORawRouteGeometry *)v18;

    uint64_t v20 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_waypoints"];
    waypoints = v5->_waypoints;
    v5->_waypoints = (NSArray *)v20;

    if (v5->_version < 2)
    {
      v23 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_anchorPoints"];
      uint64_t v24 = +[GEOComposedRouteAnchorPointList listWithAnchorPoints:v23];
      anchorPoints = v5->_anchorPoints;
      v5->_anchorPoints = (GEOComposedRouteAnchorPointList *)v24;
    }
    else
    {
      uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_anchorPoints"];
      v23 = v5->_anchorPoints;
      v5->_anchorPoints = (GEOComposedRouteAnchorPointList *)v22;
    }

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_routeAttributes"];
    routeAttributes = v5->_routeAttributes;
    v5->_routeAttributes = (GEORouteAttributes *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_address"];
    address = v5->_address;
    v5->_address = (GEOAddressObject *)v28;

    v5->_transportType = [v4 decodeIntegerForKey:@"_transportType"];
    [v4 decodeDoubleForKey:@"_distance"];
    v5->_distance = v30;
    [v4 decodeDoubleForKey:@"_duration"];
    v5->_duration = v31;
    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_elevationProfile"];
    elevationProfile = v5->_elevationProfile;
    v5->_elevationProfile = (GEOElevationProfile *)v32;

    v5->_elevationModel = [v4 decodeIntegerForKey:@"_elevationModel"];
    uint64_t v34 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_travelDirectionArrows"];
    travelDirectionArrows = v5->_travelDirectionArrows;
    v5->_travelDirectionArrows = (NSArray *)v34;

    uint64_t v36 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_routeNameLabels"];
    routeNameLabels = v5->_routeNameLabels;
    v5->_routeNameLabels = (NSArray *)v36;

    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_boundingMapRegion"];
    boundingMapRegion = v5->_boundingMapRegion;
    v5->_boundingMapRegion = (GEOMapRegion *)v38;

    uint64_t v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_disclaimerText"];
    disclaimerText = v5->_disclaimerText;
    v5->_disclaimerText = (NSString *)v40;

    uint64_t v42 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_disclaimerURL"];
    disclaimerURL = v5->_disclaimerURL;
    v5->_disclaimerURL = (GEOPDURLData *)v42;

    v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iso3166CountryCode"];
    v48 = v5;
    v49 = v44;
    id v45 = v44;
    geo_isolate_sync_data();
    v5->_version = 2;
    v46 = v48;
  }
  return v5;
}

void __56__GEOComposedGeometryRoutePersistentData_initWithCoder___block_invoke(uint64_t a1)
{
}

- (unint64_t)version
{
  return self->_version;
}

- (unint64_t)originalVersion
{
  return self->_originalVersion;
}

- (NSUUID)storageID
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (void)setStorageID:(id)a3
{
}

- (NSString)userProvidedName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setUserProvidedName:(id)a3
{
}

- (NSString)userProvidedNotes
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setUserProvidedNotes:(id)a3
{
}

- (NSUUID)routeID
{
  return self->_routeID;
}

- (void)setRouteID:(id)a3
{
}

- (NSString)routeName
{
  return self->_routeName;
}

- (void)setRouteName:(id)a3
{
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (GEOMapItemIdentifier)tourIdentifier
{
  return self->_tourIdentifier;
}

- (void)setTourIdentifier:(id)a3
{
}

- (unint64_t)tourMuid
{
  return self->_tourMuid;
}

- (void)setTourMuid:(unint64_t)a3
{
  self->_tourMuid = a3;
}

- (unint64_t)mapItemMuid
{
  return self->_mapItemMuid;
}

- (void)setMapItemMuid:(unint64_t)a3
{
  self->_mapItemMuid = a3;
}

- (GEORawRouteGeometry)rawRouteGeometry
{
  return self->_rawRouteGeometry;
}

- (void)setRawRouteGeometry:(id)a3
{
}

- (NSArray)waypoints
{
  return self->_waypoints;
}

- (GEOComposedRouteAnchorPointList)anchorPoints
{
  return self->_anchorPoints;
}

- (void)setAnchorPoints:(id)a3
{
}

- (GEORouteAttributes)routeAttributes
{
  return self->_routeAttributes;
}

- (void)setRouteAttributes:(id)a3
{
}

- (GEOAddressObject)address
{
  return self->_address;
}

- (int)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(int)a3
{
  self->_transportType = a3;
}

- (double)distance
{
  return self->_distance;
}

- (void)setDistance:(double)a3
{
  self->_distance = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (GEOElevationProfile)elevationProfile
{
  return self->_elevationProfile;
}

- (void)setElevationProfile:(id)a3
{
}

- (int)elevationModel
{
  return self->_elevationModel;
}

- (void)setElevationModel:(int)a3
{
  self->_elevationModel = a3;
}

- (NSArray)travelDirectionArrows
{
  return self->_travelDirectionArrows;
}

- (void)setTravelDirectionArrows:(id)a3
{
}

- (NSArray)routeNameLabels
{
  return self->_routeNameLabels;
}

- (void)setRouteNameLabels:(id)a3
{
}

- (GEOMapRegion)boundingMapRegion
{
  return self->_boundingMapRegion;
}

- (void)setBoundingMapRegion:(id)a3
{
}

- (NSString)disclaimerText
{
  return self->_disclaimerText;
}

- (void)setDisclaimerText:(id)a3
{
}

- (GEOPDURLData)disclaimerURL
{
  return self->_disclaimerURL;
}

- (void)setDisclaimerURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disclaimerURL, 0);
  objc_storeStrong((id *)&self->_disclaimerText, 0);
  objc_storeStrong((id *)&self->_boundingMapRegion, 0);
  objc_storeStrong((id *)&self->_routeNameLabels, 0);
  objc_storeStrong((id *)&self->_travelDirectionArrows, 0);
  objc_storeStrong((id *)&self->_elevationProfile, 0);
  objc_storeStrong((id *)&self->_iso3166CountryCode, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_routeAttributes, 0);
  objc_storeStrong((id *)&self->_anchorPoints, 0);
  objc_storeStrong((id *)&self->_waypoints, 0);
  objc_storeStrong((id *)&self->_rawRouteGeometry, 0);
  objc_storeStrong((id *)&self->_tourIdentifier, 0);
  objc_storeStrong((id *)&self->_routeName, 0);
  objc_storeStrong((id *)&self->_routeID, 0);
  objc_storeStrong((id *)&self->_userProvidedNotes, 0);
  objc_storeStrong((id *)&self->_userProvidedName, 0);
  objc_storeStrong((id *)&self->_storageID, 0);

  objc_storeStrong((id *)&self->_countryCodeIsolater, 0);
}

- (BOOL)isAvailableForCurrentCountry
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__101;
  id v11 = __Block_byref_object_dispose__101;
  id v12 = 0;
  uint64_t v5 = MEMORY[0x1E4F143A8];
  geo_isolate_sync_data();
  uint64_t v2 = +[GEOCountryConfiguration sharedConfiguration];
  char v3 = [v2 countryCode:v8[5] supportsFeature:8];

  _Block_object_dispose(&v7, 8);
  return v3;
}

void __91__GEOComposedGeometryRoutePersistentData_CountryAvailability__isAvailableForCurrentCountry__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 152) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)updateCountryIfNecessaryWithCompletionHandler:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  uint64_t v5 = [(GEOAddressObject *)self->_address address];
  uint64_t v6 = [v5 structuredAddress];
  uint64_t v7 = [v6 countryCode];

  if ((unint64_t)[v7 length] < 2)
  {
    uint64_t v8 = GEOGetGEOComposedRouteLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      address = self->_address;
      uint64_t v10 = [(GEOAddressObject *)address addressDictionary];
      *(_DWORD *)buf = 134218243;
      v56 = address;
      __int16 v57 = 2113;
      v58 = v10;
      _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_ERROR, "No country code from address. Address (%p) is: %{private}@", buf, 0x16u);
    }
    long long v46 = 0u;
    long long v47 = 0u;
    long long v45 = 0u;
    long long v44 = 0u;
    id v11 = self->_anchorPoints;
    uint64_t v12 = [(GEOComposedRouteAnchorPointList *)v11 countByEnumeratingWithState:&v44 objects:v54 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v45;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v45 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(GEOAddressObject **)(*((void *)&v44 + 1) + 8 * i);
          v17 = [(GEOAddressObject *)v16 countryCode];
          if ((unint64_t)[v17 length] >= 2)
          {
            double v31 = GEOGetGEOComposedRouteLog();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138477827;
              v56 = v16;
              _os_log_impl(&dword_188D96000, v31, OS_LOG_TYPE_DEFAULT, "Using country code from anchor point:\n%{private}@", buf, 0xCu);
            }

            uint64_t v38 = MEMORY[0x1E4F143A8];
            uint64_t v39 = 3221225472;
            uint64_t v40 = __109__GEOComposedGeometryRoutePersistentData_CountryAvailability__updateCountryIfNecessaryWithCompletionHandler___block_invoke_275;
            v41 = &unk_1E53D8998;
            uint64_t v42 = self;
            id v43 = v17;
            id v32 = v17;
            geo_isolate_sync_data();
            if (v4) {
              v4[2](v4, 0);
            }

            goto LABEL_21;
          }
        }
        uint64_t v13 = [(GEOComposedRouteAnchorPointList *)v11 countByEnumeratingWithState:&v44 objects:v54 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    [(GEOComposedGeometryRoutePersistentData *)self originCoordinate];
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    [(GEOComposedGeometryRoutePersistentData *)self destinationCoordinate];
    double v25 = v19 + (v24 - v19) * 0.5;
    double v27 = v21 + (v26 - v21) * 0.5;
    double v29 = v23 + (v28 - v23) * 0.5;
    id v11 = -[GEOLocation initWithGEOCoordinate:]([GEOLocation alloc], "initWithGEOCoordinate:", v25, v27);
    global_queue = (void *)geo_get_global_queue();
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __109__GEOComposedGeometryRoutePersistentData_CountryAvailability__updateCountryIfNecessaryWithCompletionHandler___block_invoke_2;
    v33[3] = &unk_1E53F6278;
    v33[4] = self;
    double v35 = v25;
    double v36 = v27;
    double v37 = v29;
    uint64_t v34 = v4;
    +[GEOGeographicMetadataRequester fetchPossibleTerritoriesForLocation:v11 responseQueue:global_queue responseBlock:v33];

LABEL_21:
  }
  else
  {
    uint64_t v48 = MEMORY[0x1E4F143A8];
    uint64_t v49 = 3221225472;
    v50 = __109__GEOComposedGeometryRoutePersistentData_CountryAvailability__updateCountryIfNecessaryWithCompletionHandler___block_invoke;
    v51 = &unk_1E53D8998;
    v52 = self;
    id v53 = v7;
    geo_isolate_sync_data();
    if (v4) {
      v4[2](v4, 0);
    }
  }
}

void __109__GEOComposedGeometryRoutePersistentData_CountryAvailability__updateCountryIfNecessaryWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 152);
  *(void *)(v3 + 152) = v2;
}

void __109__GEOComposedGeometryRoutePersistentData_CountryAvailability__updateCountryIfNecessaryWithCompletionHandler___block_invoke_275(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 152);
  *(void *)(v3 + 152) = v2;
}

void __109__GEOComposedGeometryRoutePersistentData_CountryAvailability__updateCountryIfNecessaryWithCompletionHandler___block_invoke_2(void *a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [a2 anyObject];
  uint64_t v7 = [v6 iso3166CountryCode2];
  if ((unint64_t)[v7 length] < 2)
  {
    uint64_t v12 = GEOGetGEOComposedRouteLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188D96000, v12, OS_LOG_TYPE_ERROR, "Error getting country code from route geometry.", buf, 2u);
    }
  }
  else
  {
    id v8 = v7;
    geo_isolate_sync_data();
    uint64_t v9 = GEOGetGEOComposedRouteLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = a1[6];
      uint64_t v11 = a1[7];
      *(_DWORD *)buf = 138412803;
      id v15 = v8;
      __int16 v16 = 2049;
      uint64_t v17 = v10;
      __int16 v18 = 2049;
      uint64_t v19 = v11;
      _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_DEFAULT, "Found country code (%@) from route geometry at %{private}f, %{private}f.", buf, 0x20u);
    }
  }
  uint64_t v13 = a1[5];
  if (v13) {
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v5);
  }
}

void __109__GEOComposedGeometryRoutePersistentData_CountryAvailability__updateCountryIfNecessaryWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 152);
  *(void *)(v3 + 152) = v2;
}

@end
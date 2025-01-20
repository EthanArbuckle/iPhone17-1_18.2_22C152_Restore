@interface CLSLitePlacemark
+ (BOOL)_isIslandForGeoMapItem:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)popularityScoresOrderedByAOIFromAdditionalPlaceInfos:(id)a3 areasOfInterest:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isIsland;
- (BOOL)isOcean;
- (CLCircularRegion)region;
- (CLLocation)location;
- (CLSLitePlacemark)initWithCLPlacemark:(id)a3;
- (CLSLitePlacemark)initWithCLPlacemark:(id)a3 popularityScoresOrderedByAOI:(id)a4;
- (CLSLitePlacemark)initWithCoder:(id)a3;
- (CLSLitePlacemark)initWithRTMapItem:(id)a3;
- (NSArray)areasOfInterest;
- (NSArray)popularityScoresOrderedByAOI;
- (NSData)revGeoLocationData;
- (NSString)ISOcountryCode;
- (NSString)administrativeArea;
- (NSString)administrativeAreaCode;
- (NSString)geoServiceProvider;
- (NSString)inlandWater;
- (NSString)locality;
- (NSString)ocean;
- (NSString)subAdministrativeArea;
- (NSString)subLocality;
- (NSString)subThoroughfare;
- (NSString)thoroughfare;
- (id)description;
- (void)_extractValuesFromGeoMapItem:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAdministrativeArea:(id)a3;
- (void)setAdministrativeAreaCode:(id)a3;
- (void)setAreasOfInterest:(id)a3;
- (void)setGeoServiceProvider:(id)a3;
- (void)setISOcountryCode:(id)a3;
- (void)setInlandWater:(id)a3;
- (void)setIsIsland:(BOOL)a3;
- (void)setLocality:(id)a3;
- (void)setLocation:(id)a3;
- (void)setOcean:(id)a3;
- (void)setPopularityScoresOrderedByAOI:(id)a3;
- (void)setRegion:(id)a3;
- (void)setRevGeoLocationData:(id)a3;
- (void)setSubAdministrativeArea:(id)a3;
- (void)setSubLocality:(id)a3;
- (void)setSubThoroughfare:(id)a3;
- (void)setThoroughfare:(id)a3;
@end

@implementation CLSLitePlacemark

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_popularityScoresOrderedByAOI, 0);
  objc_storeStrong((id *)&self->_geoServiceProvider, 0);
  objc_storeStrong((id *)&self->_revGeoLocationData, 0);
  objc_storeStrong((id *)&self->_administrativeAreaCode, 0);
  objc_storeStrong((id *)&self->_areasOfInterest, 0);
  objc_storeStrong((id *)&self->_ocean, 0);
  objc_storeStrong((id *)&self->_inlandWater, 0);
  objc_storeStrong((id *)&self->_ISOcountryCode, 0);
  objc_storeStrong((id *)&self->_subAdministrativeArea, 0);
  objc_storeStrong((id *)&self->_administrativeArea, 0);
  objc_storeStrong((id *)&self->_subLocality, 0);
  objc_storeStrong((id *)&self->_locality, 0);
  objc_storeStrong((id *)&self->_subThoroughfare, 0);
  objc_storeStrong((id *)&self->_thoroughfare, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_region, 0);
}

- (void)setPopularityScoresOrderedByAOI:(id)a3
{
}

- (NSArray)popularityScoresOrderedByAOI
{
  return self->_popularityScoresOrderedByAOI;
}

- (void)setGeoServiceProvider:(id)a3
{
}

- (NSString)geoServiceProvider
{
  return self->_geoServiceProvider;
}

- (void)setRevGeoLocationData:(id)a3
{
}

- (NSData)revGeoLocationData
{
  return self->_revGeoLocationData;
}

- (void)setIsIsland:(BOOL)a3
{
  self->_isIsland = a3;
}

- (BOOL)isIsland
{
  return self->_isIsland;
}

- (void)setAdministrativeAreaCode:(id)a3
{
}

- (NSString)administrativeAreaCode
{
  return self->_administrativeAreaCode;
}

- (void)setAreasOfInterest:(id)a3
{
}

- (NSArray)areasOfInterest
{
  return self->_areasOfInterest;
}

- (void)setOcean:(id)a3
{
}

- (NSString)ocean
{
  return self->_ocean;
}

- (void)setInlandWater:(id)a3
{
}

- (NSString)inlandWater
{
  return self->_inlandWater;
}

- (void)setISOcountryCode:(id)a3
{
}

- (NSString)ISOcountryCode
{
  return self->_ISOcountryCode;
}

- (void)setSubAdministrativeArea:(id)a3
{
}

- (NSString)subAdministrativeArea
{
  return self->_subAdministrativeArea;
}

- (void)setAdministrativeArea:(id)a3
{
}

- (NSString)administrativeArea
{
  return self->_administrativeArea;
}

- (void)setSubLocality:(id)a3
{
}

- (NSString)subLocality
{
  return self->_subLocality;
}

- (void)setLocality:(id)a3
{
}

- (NSString)locality
{
  return self->_locality;
}

- (void)setSubThoroughfare:(id)a3
{
}

- (NSString)subThoroughfare
{
  return self->_subThoroughfare;
}

- (void)setThoroughfare:(id)a3
{
}

- (NSString)thoroughfare
{
  return self->_thoroughfare;
}

- (void)setLocation:(id)a3
{
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setRegion:(id)a3
{
}

- (CLCircularRegion)region
{
  return self->_region;
}

- (id)description
{
  NSUInteger v3 = [(NSArray *)self->_popularityScoresOrderedByAOI count];
  if (v3 && (NSUInteger v4 = v3, v3 == [(NSArray *)self->_areasOfInterest count]))
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    for (uint64_t i = 0; i != v4; ++i)
    {
      v7 = [(NSArray *)self->_popularityScoresOrderedByAOI objectAtIndexedSubscript:i];
      [v7 doubleValue];
      uint64_t v9 = v8;

      v10 = NSString;
      v11 = [(NSArray *)self->_areasOfInterest objectAtIndexedSubscript:i];
      v12 = [v10 stringWithFormat:@"%@: %.3f", v11, v9];
      [v5 addObject:v12];
    }
    v13 = NSString;
    v22.receiver = self;
    v22.super_class = (Class)CLSLitePlacemark;
    v14 = [(CLSLitePlacemark *)&v22 description];
    v15 = [(CLSLitePlacemark *)self location];
    v16 = [(CLSLitePlacemark *)self region];
    v17 = [v5 componentsJoinedByString:@", "];
    v18 = [v13 stringWithFormat:@"%@ loc %@, region %@ (score(s): %@)", v14, v15, v16, v17];
  }
  else
  {
    v19 = NSString;
    v21.receiver = self;
    v21.super_class = (Class)CLSLitePlacemark;
    id v5 = [(CLSLitePlacemark *)&v21 description];
    v14 = [(CLSLitePlacemark *)self location];
    v15 = [(CLSLitePlacemark *)self region];
    v18 = [v19 stringWithFormat:@"%@ loc %@, region %@", v5, v14, v15];
  }

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(CLSLitePlacemark *)self location];
    [v6 coordinate];
    double v8 = v7;
    double v10 = v9;

    v11 = [v5 location];
    [v11 coordinate];
    double v13 = v12;
    double v15 = v14;

    if (v8 != v13 || v10 != v15) {
      goto LABEL_54;
    }
    uint64_t v17 = [(CLSLitePlacemark *)self region];
    if (v17)
    {
      v18 = (void *)v17;
      v19 = [(CLSLitePlacemark *)self region];
      v20 = [v5 region];
      int v21 = [v19 isEqual:v20];

      if (!v21) {
        goto LABEL_54;
      }
    }
    else
    {
      v23 = [v5 region];

      if (v23) {
        goto LABEL_54;
      }
    }
    uint64_t v24 = [(CLSLitePlacemark *)self thoroughfare];
    if (v24)
    {
      v25 = (void *)v24;
      v26 = [(CLSLitePlacemark *)self thoroughfare];
      v27 = [v5 thoroughfare];
      int v28 = [v26 isEqualToString:v27];

      if (!v28) {
        goto LABEL_54;
      }
    }
    else
    {
      v29 = [v5 thoroughfare];

      if (v29) {
        goto LABEL_54;
      }
    }
    uint64_t v30 = [(CLSLitePlacemark *)self subThoroughfare];
    if (v30)
    {
      v31 = (void *)v30;
      v32 = [(CLSLitePlacemark *)self subThoroughfare];
      v33 = [v5 subThoroughfare];
      int v34 = [v32 isEqualToString:v33];

      if (!v34) {
        goto LABEL_54;
      }
    }
    else
    {
      v35 = [v5 subThoroughfare];

      if (v35) {
        goto LABEL_54;
      }
    }
    uint64_t v36 = [(CLSLitePlacemark *)self locality];
    if (v36)
    {
      v37 = (void *)v36;
      v38 = [(CLSLitePlacemark *)self locality];
      v39 = [v5 locality];
      int v40 = [v38 isEqualToString:v39];

      if (!v40) {
        goto LABEL_54;
      }
    }
    else
    {
      v41 = [v5 locality];

      if (v41) {
        goto LABEL_54;
      }
    }
    uint64_t v42 = [(CLSLitePlacemark *)self subLocality];
    if (v42)
    {
      v43 = (void *)v42;
      v44 = [(CLSLitePlacemark *)self subLocality];
      v45 = [v5 subLocality];
      int v46 = [v44 isEqualToString:v45];

      if (!v46) {
        goto LABEL_54;
      }
    }
    else
    {
      v47 = [v5 subLocality];

      if (v47) {
        goto LABEL_54;
      }
    }
    uint64_t v48 = [(CLSLitePlacemark *)self administrativeArea];
    if (v48)
    {
      v49 = (void *)v48;
      v50 = [(CLSLitePlacemark *)self administrativeArea];
      v51 = [v5 administrativeArea];
      int v52 = [v50 isEqualToString:v51];

      if (!v52) {
        goto LABEL_54;
      }
    }
    else
    {
      v53 = [v5 administrativeArea];

      if (v53) {
        goto LABEL_54;
      }
    }
    uint64_t v54 = [(CLSLitePlacemark *)self ISOcountryCode];
    if (v54)
    {
      v55 = (void *)v54;
      v56 = [(CLSLitePlacemark *)self ISOcountryCode];
      v57 = [v5 ISOcountryCode];
      int v58 = [v56 isEqualToString:v57];

      if (!v58) {
        goto LABEL_54;
      }
    }
    else
    {
      v59 = [v5 ISOcountryCode];

      if (v59) {
        goto LABEL_54;
      }
    }
    uint64_t v60 = [(CLSLitePlacemark *)self inlandWater];
    if (v60)
    {
      v61 = (void *)v60;
      v62 = [(CLSLitePlacemark *)self inlandWater];
      v63 = [v5 inlandWater];
      int v64 = [v62 isEqualToString:v63];

      if (!v64) {
        goto LABEL_54;
      }
    }
    else
    {
      v65 = [v5 inlandWater];

      if (v65) {
        goto LABEL_54;
      }
    }
    uint64_t v66 = [(CLSLitePlacemark *)self areasOfInterest];
    if (v66)
    {
      v67 = (void *)v66;
      v68 = [(CLSLitePlacemark *)self areasOfInterest];
      v69 = [v5 areasOfInterest];
      int v70 = [v68 isEqual:v69];

      if (!v70) {
        goto LABEL_54;
      }
    }
    else
    {
      v71 = [v5 areasOfInterest];

      if (v71) {
        goto LABEL_54;
      }
    }
    uint64_t v72 = [(CLSLitePlacemark *)self ocean];
    if (v72)
    {
      v73 = (void *)v72;
      v74 = [(CLSLitePlacemark *)self ocean];
      v75 = [v5 ocean];
      int v76 = [v74 isEqual:v75];

      if (!v76) {
        goto LABEL_54;
      }
    }
    else
    {
      v77 = [v5 ocean];

      if (v77) {
        goto LABEL_54;
      }
    }
    int v78 = [(CLSLitePlacemark *)self isIsland];
    if (v78 == [v5 isIsland])
    {
      uint64_t v79 = [(CLSLitePlacemark *)self revGeoLocationData];
      if (v79)
      {
        v80 = (void *)v79;
        v81 = [(CLSLitePlacemark *)self revGeoLocationData];
        v82 = [v5 revGeoLocationData];
        int v83 = [v81 isEqual:v82];

        if (v83)
        {
LABEL_51:
          v84 = [(CLSLitePlacemark *)self popularityScoresOrderedByAOI];
          if (v84)
          {
            v85 = [(CLSLitePlacemark *)self popularityScoresOrderedByAOI];
            v86 = [v5 popularityScoresOrderedByAOI];
            char v22 = [v85 isEqual:v86];
          }
          else
          {
            v85 = [v5 popularityScoresOrderedByAOI];
            char v22 = v85 == 0;
          }

          goto LABEL_55;
        }
      }
      else
      {
        v87 = [v5 revGeoLocationData];

        if (!v87) {
          goto LABEL_51;
        }
      }
    }
LABEL_54:
    char v22 = 0;
LABEL_55:

    goto LABEL_56;
  }
  char v22 = 0;
LABEL_56:

  return v22;
}

- (void)_extractValuesFromGeoMapItem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 geoAddress];
  id v31 = [v5 structuredAddress];

  v6 = [v31 thoroughfare];
  thoroughfare = self->_thoroughfare;
  self->_thoroughfare = v6;

  double v8 = [v31 subThoroughfare];
  subThoroughfare = self->_subThoroughfare;
  self->_subThoroughfare = v8;

  double v10 = [v31 locality];
  locality = self->_locality;
  self->_locality = v10;

  double v12 = [v31 subLocality];
  subLocality = self->_subLocality;
  self->_subLocality = v12;

  double v14 = [v31 administrativeArea];
  administrativeArea = self->_administrativeArea;
  self->_administrativeArea = v14;

  v16 = [v31 subAdministrativeArea];
  subAdministrativeArea = self->_subAdministrativeArea;
  self->_subAdministrativeArea = v16;

  v18 = [v31 countryCode];
  ISOcountryCode = self->_ISOcountryCode;
  self->_ISOcountryCode = v18;

  v20 = [v31 inlandWater];
  inlandWater = self->_inlandWater;
  self->_inlandWater = v20;

  char v22 = [v31 ocean];
  ocean = self->_ocean;
  self->_ocean = v22;

  uint64_t v24 = [v31 areaOfInterests];
  areasOfInterest = self->_areasOfInterest;
  self->_areasOfInterest = v24;

  v26 = [v31 administrativeAreaCode];
  administrativeAreaCode = self->_administrativeAreaCode;
  self->_administrativeAreaCode = v26;

  self->_isIsland = [(id)objc_opt_class() _isIslandForGeoMapItem:v4];
  int v28 = (void *)[objc_alloc(MEMORY[0x1E4F8AB70]) initWithGEOMapItem:v4];

  v29 = [v28 plistData];
  revGeoLocationData = self->_revGeoLocationData;
  self->_revGeoLocationData = v29;
}

- (BOOL)isOcean
{
  v2 = [(CLSLitePlacemark *)self ocean];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  region = self->_region;
  id v6 = a3;
  [v6 encodeObject:region forKey:@"region"];
  [v6 encodeObject:self->_location forKey:@"location"];
  [v6 encodeObject:self->_thoroughfare forKey:@"thoroughfare"];
  [v6 encodeObject:self->_subThoroughfare forKey:@"subThoroughfare"];
  [v6 encodeObject:self->_locality forKey:@"locality"];
  [v6 encodeObject:self->_subLocality forKey:@"subLocality"];
  [v6 encodeObject:self->_administrativeArea forKey:@"administrativeArea"];
  [v6 encodeObject:self->_subAdministrativeArea forKey:@"subAdministrativeArea"];
  [v6 encodeObject:self->_ISOcountryCode forKey:@"ISOCountryCode"];
  [v6 encodeObject:self->_inlandWater forKey:@"inlandWater"];
  [v6 encodeObject:self->_ocean forKey:@"ocean"];
  [v6 encodeObject:self->_areasOfInterest forKey:@"areasOfInterest"];
  id v5 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isIsland];
  [v6 encodeObject:v5 forKey:@"isIsland"];

  [v6 encodeObject:self->_revGeoLocationData forKey:@"revGeoLocationData"];
  [v6 encodeObject:self->_geoServiceProvider forKey:@"geoServiceProvider"];
  [v6 encodeObject:self->_popularityScoresOrderedByAOI forKey:@"popularityScoresOrderedByAOI"];
}

- (CLSLitePlacemark)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CLSLitePlacemark *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"region"];
    region = v5->_region;
    v5->_region = (CLCircularRegion *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"location"];
    location = v5->_location;
    v5->_location = (CLLocation *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"thoroughfare"];
    thoroughfare = v5->_thoroughfare;
    v5->_thoroughfare = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subThoroughfare"];
    subThoroughfare = v5->_subThoroughfare;
    v5->_subThoroughfare = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"locality"];
    locality = v5->_locality;
    v5->_locality = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subLocality"];
    subLocality = v5->_subLocality;
    v5->_subLocality = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"administrativeArea"];
    administrativeArea = v5->_administrativeArea;
    v5->_administrativeArea = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subAdministrativeArea"];
    subAdministrativeArea = v5->_subAdministrativeArea;
    v5->_subAdministrativeArea = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ISOCountryCode"];
    ISOcountryCode = v5->_ISOcountryCode;
    v5->_ISOcountryCode = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inlandWater"];
    inlandWater = v5->_inlandWater;
    v5->_inlandWater = (NSString *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ocean"];
    ocean = v5->_ocean;
    v5->_ocean = (NSString *)v26;

    int v28 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v29 = objc_opt_class();
    uint64_t v30 = objc_msgSend(v28, "setWithObjects:", v29, objc_opt_class(), 0);
    uint64_t v31 = [v4 decodeObjectOfClasses:v30 forKey:@"areasOfInterest"];
    areasOfInterest = v5->_areasOfInterest;
    v5->_areasOfInterest = (NSArray *)v31;

    v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isIsland"];
    v5->_isIsland = [v33 BOOLValue];

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"revGeoLocationData"];
    revGeoLocationData = v5->_revGeoLocationData;
    v5->_revGeoLocationData = (NSData *)v34;

    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"geoServiceProvider"];
    geoServiceProvider = v5->_geoServiceProvider;
    v5->_geoServiceProvider = (NSString *)v36;

    if ([v4 containsValueForKey:@"popularityScoresOrderedByAOI"])
    {
      v38 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v39 = objc_opt_class();
      int v40 = objc_msgSend(v38, "setWithObjects:", v39, objc_opt_class(), 0);
      uint64_t v41 = [v4 decodeObjectOfClasses:v40 forKey:@"popularityScoresOrderedByAOI"];
      popularityScoresOrderedByAOI = v5->_popularityScoresOrderedByAOI;
      v5->_popularityScoresOrderedByAOI = (NSArray *)v41;

      if (!v5->_popularityScoresOrderedByAOI)
      {
        if (v5->_areasOfInterest)
        {
          v43 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
          if ([(NSArray *)v5->_areasOfInterest count])
          {
            unint64_t v44 = 0;
            do
              [(NSArray *)v43 setObject:&unk_1F28F2C30 atIndexedSubscript:v44++];
            while (v44 < [(NSArray *)v5->_areasOfInterest count]);
          }
          v45 = v5->_popularityScoresOrderedByAOI;
          v5->_popularityScoresOrderedByAOI = v43;
        }
      }
    }
  }

  return v5;
}

- (CLSLitePlacemark)initWithRTMapItem:(id)a3
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v69.receiver = self;
  v69.super_class = (Class)CLSLitePlacemark;
  id v5 = [(CLSLitePlacemark *)&v69 init];
  if (v5)
  {
    uint64_t v6 = [v4 location];
    [v6 latitude];
    CLLocationDegrees v8 = v7;
    [v6 longitude];
    CLLocationDegrees v10 = v9;
    [v6 horizontalUncertainty];
    double v12 = v11;
    id v13 = objc_alloc(MEMORY[0x1E4F1E5A8]);
    CLLocationCoordinate2D v14 = CLLocationCoordinate2DMake(v8, v10);
    double v15 = [NSString stringWithFormat:@"<%+.8f,%+.8f> radius %.2f", *(void *)&v8, *(void *)&v10, *(void *)&v12];
    uint64_t v16 = objc_msgSend(v13, "initWithCenter:radius:identifier:", v15, v14.latitude, v14.longitude, v12);
    region = v5->_region;
    v5->_region = (CLCircularRegion *)v16;

    uint64_t v18 = [v4 address];
    uint64_t v19 = [v18 thoroughfare];
    thoroughfare = v5->_thoroughfare;
    v5->_thoroughfare = (NSString *)v19;

    uint64_t v21 = [v18 locality];
    locality = v5->_locality;
    v5->_locality = (NSString *)v21;

    uint64_t v23 = [v18 administrativeArea];
    administrativeArea = v5->_administrativeArea;
    v5->_administrativeArea = (NSString *)v23;

    uint64_t v25 = [v18 subAdministrativeArea];
    subAdministrativeArea = v5->_subAdministrativeArea;
    v5->_subAdministrativeArea = (NSString *)v25;

    uint64_t v27 = [v18 countryCode];
    ISOcountryCode = v5->_ISOcountryCode;
    v5->_ISOcountryCode = (NSString *)v27;

    uint64_t v29 = [MEMORY[0x1E4F8AB68] currentRevGeoProvider];
    geoServiceProvider = v5->_geoServiceProvider;
    v5->_geoServiceProvider = (NSString *)v29;

    uint64_t v31 = [v18 subThoroughfare];
    subThoroughfare = v5->_subThoroughfare;
    v5->_subThoroughfare = (NSString *)v31;

    uint64_t v33 = [v18 administrativeAreaCode];
    administrativeAreaCode = v5->_administrativeAreaCode;
    v5->_administrativeAreaCode = (NSString *)v33;

    uint64_t v35 = [v18 inlandWater];
    inlandWater = v5->_inlandWater;
    v5->_inlandWater = (NSString *)v35;

    uint64_t v37 = [v18 ocean];
    ocean = v5->_ocean;
    v5->_ocean = (NSString *)v37;

    uint64_t v39 = [v18 areasOfInterest];
    areasOfInterest = v5->_areasOfInterest;
    v5->_areasOfInterest = (NSArray *)v39;

    v5->_isIsland = [v18 isIsland];
    uint64_t v41 = [MEMORY[0x1E4F64710] sharedService];
    uint64_t v63 = 0;
    int v64 = &v63;
    uint64_t v65 = 0x3032000000;
    uint64_t v66 = __Block_byref_object_copy__6466;
    v67 = __Block_byref_object_dispose__6467;
    id v68 = 0;
    uint64_t v57 = 0;
    int v58 = &v57;
    uint64_t v59 = 0x3032000000;
    uint64_t v60 = __Block_byref_object_copy__6466;
    v61 = __Block_byref_object_dispose__6467;
    id v62 = 0;
    uint64_t v42 = [(CLSLitePlacemark *)v5 areasOfInterest];
    v43 = [v4 geoMapItemHandle];
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __38__CLSLitePlacemark_initWithRTMapItem___block_invoke;
    v53[3] = &unk_1E69103A0;
    v55 = &v63;
    id v44 = v42;
    id v54 = v44;
    v56 = &v57;
    [v41 resolveMapItemLocallyFromHandle:v43 completionHandler:v53];

    objc_storeStrong((id *)&v5->_popularityScoresOrderedByAOI, (id)v58[5]);
    v45 = (void *)v64[5];
    if (!v45)
    {
      int v46 = +[CLSLogging sharedLogging];
      v47 = [v46 loggingConnection];

      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        v51 = [v4 identifier];
        int v52 = [v51 UUIDString];
        *(_DWORD *)buf = 138412290;
        v71 = v52;
        _os_log_error_impl(&dword_1D2150000, v47, OS_LOG_TYPE_ERROR, "Could not resolve geo map item from handle for map item %@. Using region center as fallback", buf, 0xCu);
      }
      uint64_t v48 = [objc_alloc(MEMORY[0x1E4F1E5F0]) initWithLatitude:v8 longitude:v10];
      v49 = (void *)v64[5];
      v64[5] = v48;

      v45 = (void *)v64[5];
    }
    objc_storeStrong((id *)&v5->_location, v45);

    _Block_object_dispose(&v57, 8);
    _Block_object_dispose(&v63, 8);
  }
  return v5;
}

void __38__CLSLitePlacemark_initWithRTMapItem___block_invoke(void *a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  if (v15)
  {
    [v15 coordinate];
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F1E5F0]) initWithLatitude:v6 longitude:v7];
    uint64_t v9 = *(void *)(a1[5] + 8);
    CLLocationDegrees v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    if (a1[4])
    {
      double v11 = [v15 _additionalPlaceInfos];
      uint64_t v12 = +[CLSLitePlacemark popularityScoresOrderedByAOIFromAdditionalPlaceInfos:v11 areasOfInterest:a1[4]];
      uint64_t v13 = *(void *)(a1[6] + 8);
      CLLocationCoordinate2D v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;
    }
  }
}

- (CLSLitePlacemark)initWithCLPlacemark:(id)a3 popularityScoresOrderedByAOI:(id)a4
{
  id v7 = a4;
  uint64_t v8 = [(CLSLitePlacemark *)self initWithCLPlacemark:a3];
  if (v8)
  {
    uint64_t v9 = [v7 count];
    CLLocationDegrees v10 = [(CLSLitePlacemark *)v8 areasOfInterest];
    uint64_t v11 = [v10 count];

    if (v9 == v11)
    {
      objc_storeStrong((id *)&v8->_popularityScoresOrderedByAOI, a4);
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_fault_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "[CLSLitePlacemark] popularityScoresOrderedByAOI is not populated to be the same length as areasOfInterest.", v13, 2u);
    }
  }

  return v8;
}

- (CLSLitePlacemark)initWithCLPlacemark:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CLSLitePlacemark;
  id v5 = [(CLSLitePlacemark *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 region];
    region = v5->_region;
    v5->_region = (CLCircularRegion *)v6;

    uint64_t v8 = [v4 location];
    location = v5->_location;
    v5->_location = (CLLocation *)v8;

    uint64_t v10 = [MEMORY[0x1E4F8AB68] currentRevGeoProvider];
    geoServiceProvider = v5->_geoServiceProvider;
    v5->_geoServiceProvider = (NSString *)v10;

    uint64_t v12 = [v4 _geoMapItem];
    [(CLSLitePlacemark *)v5 _extractValuesFromGeoMapItem:v12];
    uint64_t v13 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    CLLocationCoordinate2D v14 = [(CLSLitePlacemark *)v5 areasOfInterest];
    id v15 = v14;
    if (v14)
    {
      if ([v14 count] && objc_msgSend(v15, "count"))
      {
        unint64_t v16 = 0;
        do
          [(NSArray *)v13 setObject:&unk_1F28F2C30 atIndexedSubscript:v16++];
        while (v16 < [v15 count]);
      }
    }
    else
    {

      uint64_t v13 = 0;
    }
    popularityScoresOrderedByAOI = v5->_popularityScoresOrderedByAOI;
    v5->_popularityScoresOrderedByAOI = v13;
  }
  return v5;
}

+ (BOOL)_isIslandForGeoMapItem:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1D2602300]();
  id v5 = [v3 areasOfInterest];
  uint64_t v6 = [v5 count];

  if (!v6) {
    goto LABEL_14;
  }
  id v7 = [v3 _additionalPlaceInfos];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (!v8)
  {

LABEL_14:
    int v10 = [v3 _placeType];
    goto LABEL_15;
  }
  uint64_t v9 = v8;
  int v10 = 0;
  uint64_t v11 = *(void *)v16;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v16 != v11) {
        objc_enumerationMutation(v7);
      }
      int v13 = [*(id *)(*((void *)&v15 + 1) + 8 * i) placeType];
      if (v13 > v10) {
        int v10 = v13;
      }
    }
    uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  }
  while (v9);

  if (!v10) {
    goto LABEL_14;
  }
LABEL_15:

  return v10 == 11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)popularityScoresOrderedByAOIFromAdditionalPlaceInfos:(id)a3 areasOfInterest:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v5)
  {
    id v30 = v6;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v37 != v11) {
            objc_enumerationMutation(v8);
          }
          int v13 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          if (objc_msgSend(v13, "placeType", v30) == 8)
          {
            CLLocationCoordinate2D v14 = [v13 name];
            if (v14)
            {
              long long v15 = (void *)MEMORY[0x1E4F28ED0];
              [v13 photosMemoryScore];
              uint64_t v16 = objc_msgSend(v15, "numberWithFloat:");
              if (v16) {
                long long v17 = (void *)v16;
              }
              else {
                long long v17 = &unk_1F28F2C30;
              }
              [v7 setObject:v17 forKeyedSubscript:v14];
            }
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v10);
    }

    id v6 = v30;
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v43 = v6;
    _os_log_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[CLSLitePlacemark] additionalPlaceInfos is nil for AOI array %@", buf, 0xCu);
  }
  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v19 = v6;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v33;
    uint64_t v23 = MEMORY[0x1E4F14500];
    uint64_t v31 = 138477827;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v33 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v25 = *(void **)(*((void *)&v32 + 1) + 8 * j);
        uint64_t v26 = objc_msgSend(v7, "objectForKeyedSubscript:", v25, v31);
        if (v26) {
          uint64_t v27 = (void *)v26;
        }
        else {
          uint64_t v27 = &unk_1F28F2C30;
        }
        if (v26) {
          BOOL v28 = 1;
        }
        else {
          BOOL v28 = v5 == 0;
        }
        if (!v28)
        {
          uint64_t v27 = &unk_1F28F2C30;
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v31;
            id v43 = v25;
            _os_log_error_impl(&dword_1D2150000, v23, OS_LOG_TYPE_ERROR, "[CLSLitePlacemark] AOI %{private}@ in mapItem.areasOfInterest isn't in mapItem.additionalPlaces.", buf, 0xCu);
            uint64_t v27 = &unk_1F28F2C30;
          }
        }
        [v18 addObject:v27];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v21);
  }

  return v18;
}

@end
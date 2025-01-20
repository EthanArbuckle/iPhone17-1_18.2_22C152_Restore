@interface CLPlacemark
+ (BOOL)supportsSecureCoding;
+ (CLPlacemark)placemarkWithGEOMapItem:(id)a3;
+ (id)sourceToString:(unint64_t)a3;
- (CLLocation)location;
- (CLPlacemark)initWithCoder:(id)a3;
- (CLPlacemark)initWithLocation:(id)a3 addressDictionary:(id)a4 region:(id)a5 areasOfInterest:(id)a6;
- (CLPlacemark)initWithLocation:(id)a3 addressDictionary:(id)a4 region:(id)a5 areasOfInterest:(id)a6 mapItemSource:(unint64_t)a7 geoMapItemHandle:(id)a8 category:(id)a9 meCardAddress:(id)a10;
- (CLPlacemark)initWithLocation:(id)a3 addressDictionary:(id)a4 region:(id)a5 areasOfInterest:(id)a6 mapItemSource:(unint64_t)a7 geoMapItemHandle:(id)a8 category:(id)a9 meCardAddress:(id)a10 muid:(unint64_t)a11;
- (CLPlacemark)initWithLocation:(id)a3 addressDictionary:(id)a4 region:(id)a5 areasOfInterest:(id)a6 mapItemSource:(unint64_t)a7 geoMapItemHandle:(id)a8 meCardAddress:(id)a9;
- (CLPlacemark)initWithPlacemark:(CLPlacemark *)placemark;
- (CLRegion)region;
- (CNPostalAddress)postalAddress;
- (NSArray)areasOfInterest;
- (NSDictionary)addressDictionary;
- (NSString)ISOcountryCode;
- (NSString)administrativeArea;
- (NSString)country;
- (NSString)inlandWater;
- (NSString)locality;
- (NSString)name;
- (NSString)ocean;
- (NSString)postalCode;
- (NSString)subAdministrativeArea;
- (NSString)subLocality;
- (NSString)subThoroughfare;
- (NSString)thoroughfare;
- (NSTimeZone)timeZone;
- (id)_geoMapItem;
- (id)_geoMapItemHandle;
- (id)_initWithGeoMapItem:(id)a3;
- (id)_initWithRTMapItem:(id)a3 location:(id)a4;
- (id)category;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)formattedAddressLines;
- (id)fullThoroughfare;
- (id)mecardAddress;
- (unint64_t)mapItemSource;
- (unint64_t)muid;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)fetchFormattedAddress:(id)a3 queue:(id)a4;
@end

@implementation CLPlacemark

+ (CLPlacemark)placemarkWithGEOMapItem:(id)a3
{
  if ([a3 isValid])
  {
    [a3 coordinate];
    id v6 = 0;
    if (v5 >= -180.0 && v5 <= 180.0 && v4 <= 90.0 && v4 >= -90.0) {
      id v6 = [[CLPlacemark alloc] _initWithGeoMapItem:a3];
    }
  }
  else
  {
    id v6 = 0;
  }

  return (CLPlacemark *)v6;
}

- (id)_initWithGeoMapItem:(id)a3
{
  v29.receiver = self;
  v29.super_class = (Class)CLPlacemark;
  double v4 = [(CLPlacemark *)&v29 init];
  if (v4)
  {
    v4->_internal = objc_alloc_init(CLPlacemarkInternal);
    v4->_internal->geoMapItemStorage = (GEOMapItemStorage *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F646E0], "mapItemStorageForGEOMapItem:", a3), "copy");
    int v5 = [a3 referenceFrame];
    if (v5 == 2) {
      uint64_t v6 = 2;
    }
    else {
      uint64_t v6 = v5 == 1;
    }
    v7 = (void *)[(GEOMapItemStorage *)v4->_internal->geoMapItemStorage geoFenceMapRegion];
    if ([v7 hasNorthLat]
      && [v7 hasSouthLat]
      && [v7 hasEastLng]
      && [v7 hasWestLng])
    {
      [v7 northLat];
      double v9 = v8;
      [v7 southLat];
      double v11 = v10;
      [v7 westLng];
      double v13 = v12;
      [v7 eastLng];
      double v15 = (v9 + v11) * 0.5;
      if (v13 <= v14)
      {
        double v17 = (v13 + v14) * 0.5;
      }
      else
      {
        double v16 = v13 + (v14 + 360.0 - v13) * 0.5;
        if (v16 <= 180.0) {
          double v17 = v16;
        }
        else {
          double v17 = v16 + -360.0;
        }
      }
      [v7 southLat];
      double v19 = v18;
      [v7 westLng];
      double v21 = sub_1906D7AA4(v15, v17, v19, v20);
      v22 = [CLCircularRegion alloc];
      v4->_internal->region = (CLRegion *)-[CLCircularRegion initWithCenter:radius:identifier:](v22, "initWithCenter:radius:identifier:", [NSString stringWithFormat:@"<%+.8f,%+.8f> radius %.2f", *(void *)&v15, *(void *)&v17, *(void *)&v21], v15, v17, v21);
      [(CLRegion *)v4->_internal->region setReferenceFrame:v6];
    }
    [(GEOMapItemStorage *)v4->_internal->geoMapItemStorage coordinate];
    double v24 = v23;
    double v26 = v25;
    v27 = [CLLocation alloc];
    v4->_internal->location = -[CLLocation initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:referenceFrame:](v27, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:referenceFrame:", [MEMORY[0x1E4F1C9C8] date], v6, v24, v26, 0.0, 100.0, -1.0);
    v4->_internal->addressDictionary = (NSDictionary *)(id)[(GEOMapItemStorage *)v4->_internal->geoMapItemStorage addressDictionary];
    v4->_internal->areasOfInterest = (NSArray *)(id)[(GEOMapItemStorage *)v4->_internal->geoMapItemStorage areasOfInterest];
    v4->_internal->timeZone = (NSTimeZone *)(id)[(GEOMapItemStorage *)v4->_internal->geoMapItemStorage timezone];
    v4->_internal->category = (NSString *)(id)[(GEOMapItemStorage *)v4->_internal->geoMapItemStorage _poiCategory];
    v4->_internal->_muid = [(GEOMapItemStorage *)v4->_internal->geoMapItemStorage _muid];
  }
  return v4;
}

- (CLLocation)location
{
  return self->_internal->location;
}

- (id)_initWithRTMapItem:(id)a3 location:(id)a4
{
  v7 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a3, "name"), @"Name");
  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(a3, "address"), "thoroughfare"), @"Thoroughfare");
  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(a3, "address"), "subThoroughfare"), @"SubThoroughfare");
  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(a3, "address"), "locality"), @"City");
  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(a3, "address"), "subLocality"), @"SubLocality");
  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(a3, "address"), "administrativeArea"), @"State");
  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(a3, "address"), "subAdministrativeArea"), @"SubAdministrativeArea");
  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(a3, "address"), "postalCode"), @"ZIP");
  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(a3, "address"), "countryCode"), @"CountryCode");
  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(a3, "address"), "country"), @"Country");
  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(a3, "address"), "inlandWater"), @"InlandWater");
  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(a3, "address"), "ocean"), @"Ocean");
  return -[CLPlacemark initWithLocation:addressDictionary:region:areasOfInterest:mapItemSource:geoMapItemHandle:category:meCardAddress:muid:](self, "initWithLocation:addressDictionary:region:areasOfInterest:mapItemSource:geoMapItemHandle:category:meCardAddress:muid:", a4, v7, 0, objc_msgSend((id)objc_msgSend(a3, "address"), "areasOfInterest"), objc_msgSend(a3, "source"), objc_msgSend(a3, "geoMapItemHandle"), objc_msgSend(a3, "category"), &stru_1EE006720, objc_msgSend(a3, "muid"));
}

- (CLPlacemark)initWithLocation:(id)a3 addressDictionary:(id)a4 region:(id)a5 areasOfInterest:(id)a6
{
  v11.receiver = self;
  v11.super_class = (Class)CLPlacemark;
  result = [(CLPlacemark *)&v11 init];
  if (result) {
    return [(CLPlacemark *)result initWithLocation:a3 addressDictionary:a4 region:a5 areasOfInterest:a6 mapItemSource:0 geoMapItemHandle:0 meCardAddress:&stru_1EE006720];
  }
  return result;
}

- (CLPlacemark)initWithLocation:(id)a3 addressDictionary:(id)a4 region:(id)a5 areasOfInterest:(id)a6 mapItemSource:(unint64_t)a7 geoMapItemHandle:(id)a8 meCardAddress:(id)a9
{
  v16.receiver = self;
  v16.super_class = (Class)CLPlacemark;
  result = [(CLPlacemark *)&v16 init];
  if (result) {
    return [(CLPlacemark *)result initWithLocation:a3 addressDictionary:a4 region:a5 areasOfInterest:a6 mapItemSource:a7 geoMapItemHandle:a8 category:0 meCardAddress:a9];
  }
  return result;
}

- (CLPlacemark)initWithLocation:(id)a3 addressDictionary:(id)a4 region:(id)a5 areasOfInterest:(id)a6 mapItemSource:(unint64_t)a7 geoMapItemHandle:(id)a8 category:(id)a9 meCardAddress:(id)a10
{
  v17.receiver = self;
  v17.super_class = (Class)CLPlacemark;
  result = [(CLPlacemark *)&v17 init];
  if (result) {
    return [(CLPlacemark *)result initWithLocation:a3 addressDictionary:a4 region:a5 areasOfInterest:a6 mapItemSource:a7 geoMapItemHandle:a8 category:a9 meCardAddress:a10 muid:0];
  }
  return result;
}

- (CLPlacemark)initWithLocation:(id)a3 addressDictionary:(id)a4 region:(id)a5 areasOfInterest:(id)a6 mapItemSource:(unint64_t)a7 geoMapItemHandle:(id)a8 category:(id)a9 meCardAddress:(id)a10 muid:(unint64_t)a11
{
  v19.receiver = self;
  v19.super_class = (Class)CLPlacemark;
  objc_super v17 = [(CLPlacemark *)&v19 init];
  if (v17)
  {
    v17->_internal = objc_alloc_init(CLPlacemarkInternal);
    v17->_internal->location = (CLLocation *)[a3 copy];
    v17->_internal->addressDictionary = (NSDictionary *)[a4 copy];
    v17->_internal->region = (CLRegion *)[a5 copy];
    v17->_internal->areasOfInterest = (NSArray *)[a6 copy];
    v17->_internal->_cLMapItemSource = a7;
    v17->_internal->_geoMapItemHandle = (NSData *)[a8 copy];
    v17->_internal->category = (NSString *)[a9 copy];
    v17->_internal->mecardAddress = (NSString *)[a10 copy];
    v17->_internal->_muid = a11;
  }
  return v17;
}

- (CLPlacemark)initWithPlacemark:(CLPlacemark *)placemark
{
  v7.receiver = self;
  v7.super_class = (Class)CLPlacemark;
  double v4 = [(CLPlacemark *)&v7 init];
  if (v4)
  {
    v4->_internal = objc_alloc_init(CLPlacemarkInternal);
    v4->_internal->location = (CLLocation *)[(CLLocation *)[(CLPlacemark *)placemark location] copy];
    v4->_internal->addressDictionary = (NSDictionary *)[(NSDictionary *)[(CLPlacemark *)placemark addressDictionary] copy];
    v4->_internal->region = (CLRegion *)[(CLRegion *)[(CLPlacemark *)placemark region] copy];
    v4->_internal->areasOfInterest = (NSArray *)[(NSArray *)[(CLPlacemark *)placemark areasOfInterest] copy];
    if (placemark)
    {
      v4->_internal->geoMapItemStorage = (GEOMapItemStorage *)[(GEOMapItemStorage *)placemark->_internal->geoMapItemStorage copy];
      v4->_internal->_geoMapItemHandle = (NSData *)[(NSData *)placemark->_internal->_geoMapItemHandle copy];
      v4->_internal->category = (NSString *)[(NSString *)placemark->_internal->category copy];
      v4->_internal->mecardAddress = (NSString *)[(NSString *)placemark->_internal->mecardAddress copy];
      v4->_internal->_cLMapItemSource = placemark->_internal->_cLMapItemSource;
      unint64_t muid = placemark->_internal->_muid;
    }
    else
    {
      unint64_t muid = 0;
      v4->_internal->geoMapItemStorage = 0;
      v4->_internal->_geoMapItemHandle = 0;
      v4->_internal->category = 0;
      v4->_internal->mecardAddress = 0;
      v4->_internal->_cLMapItemSource = 0;
    }
    v4->_internal->_unint64_t muid = muid;
  }
  return v4;
}

- (void)dealloc
{
  internal = self->_internal;
  if (internal)
  {
  }
  v4.receiver = self;
  v4.super_class = (Class)CLPlacemark;
  [(CLPlacemark *)&v4 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLPlacemark)initWithCoder:(id)a3
{
  objc_super v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_msgSend(v4, "setWithObjects:", v5, v6, objc_opt_class(), 0);
  uint64_t v20 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLPlacemarkCodingKeyLocation"];
  uint64_t v19 = [a3 decodeObjectOfClasses:v7 forKey:@"kCLPlacemarkCodingKeyAddress"];
  uint64_t v8 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLPlacemarkCodingKeyRegion"];
  double v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0), @"kCLPlacemarkCodingKeyAreasOfInterest");
  uint64_t v12 = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"kCLPlacemarkCodingKeyMapItemSource"), "unsignedIntegerValue");
  uint64_t v13 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLPlacemarkCodingKeyGEOMapItem"];
  uint64_t v14 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLPlacemarkCodingKeyGEOMapItemHandle"];
  uint64_t v15 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLPlacemarkCodingKeyCategory"];
  uint64_t v16 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLPlacemarkCodingKeyMeCardAddress"];
  uint64_t v17 = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"kCLPlacemarkCodingKeyMuid"), "unsignedLongLongValue");
  if (!v13) {
    return [(CLPlacemark *)self initWithLocation:v20 addressDictionary:v19 region:v8 areasOfInterest:v11 mapItemSource:v12 geoMapItemHandle:v14 category:v15 meCardAddress:v16 muid:v17];
  }

  return (CLPlacemark *)[(CLPlacemark *)self _initWithGeoMapItem:v13];
}

- (void)encodeWithCoder:(id)a3
{
  internal = self->_internal;
  [a3 encodeObject:internal->location forKey:@"kCLPlacemarkCodingKeyLocation"];
  [a3 encodeObject:internal->addressDictionary forKey:@"kCLPlacemarkCodingKeyAddress"];
  [a3 encodeObject:internal->region forKey:@"kCLPlacemarkCodingKeyRegion"];
  [a3 encodeObject:internal->areasOfInterest forKey:@"kCLPlacemarkCodingKeyAreasOfInterest"];
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", internal->_cLMapItemSource), @"kCLPlacemarkCodingKeyMapItemSource");
  [a3 encodeObject:internal->geoMapItemStorage forKey:@"kCLPlacemarkCodingKeyGEOMapItem"];
  [a3 encodeObject:internal->_geoMapItemHandle forKey:@"kCLPlacemarkCodingKeyGEOMapItemHandle"];
  [a3 encodeObject:internal->category forKey:@"kCLPlacemarkCodingKeyCategory"];
  [a3 encodeObject:internal->mecardAddress forKey:@"kCLPlacemarkCodingKeyMeCardAddress"];
  uint64_t v5 = [NSNumber numberWithUnsignedLongLong:internal->_muid];

  [a3 encodeObject:v5 forKey:@"kCLPlacemarkCodingKeyMuid"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3 = [(id)objc_opt_class() allocWithZone:a3];

  return (id)MEMORY[0x1F4181798](v3, sel_initWithPlacemark_);
}

- (CLRegion)region
{
  return self->_internal->region;
}

- (NSTimeZone)timeZone
{
  return self->_internal->timeZone;
}

- (id)mecardAddress
{
  return self->_internal->mecardAddress;
}

- (NSDictionary)addressDictionary
{
  return self->_internal->addressDictionary;
}

- (NSString)name
{
  return (NSString *)[(NSDictionary *)self->_internal->addressDictionary objectForKey:@"Name"];
}

- (NSString)thoroughfare
{
  return (NSString *)[(NSDictionary *)self->_internal->addressDictionary objectForKey:@"Thoroughfare"];
}

- (NSString)subThoroughfare
{
  return (NSString *)[(NSDictionary *)self->_internal->addressDictionary objectForKey:@"SubThoroughfare"];
}

- (NSString)locality
{
  return (NSString *)[(NSDictionary *)self->_internal->addressDictionary objectForKey:@"City"];
}

- (NSString)subLocality
{
  return (NSString *)[(NSDictionary *)self->_internal->addressDictionary objectForKey:@"SubLocality"];
}

- (NSString)administrativeArea
{
  return (NSString *)[(NSDictionary *)self->_internal->addressDictionary objectForKey:@"State"];
}

- (NSString)subAdministrativeArea
{
  return (NSString *)[(NSDictionary *)self->_internal->addressDictionary objectForKey:@"SubAdministrativeArea"];
}

- (NSString)postalCode
{
  return (NSString *)[(NSDictionary *)self->_internal->addressDictionary objectForKey:@"ZIP"];
}

- (NSString)ISOcountryCode
{
  return (NSString *)[(NSDictionary *)self->_internal->addressDictionary objectForKey:@"CountryCode"];
}

- (NSString)country
{
  return (NSString *)[(NSDictionary *)self->_internal->addressDictionary objectForKey:@"Country"];
}

- (id)fullThoroughfare
{
  return [(NSDictionary *)self->_internal->addressDictionary objectForKey:@"Street"];
}

- (id)formattedAddressLines
{
  return [(NSDictionary *)self->_internal->addressDictionary objectForKey:@"FormattedAddressLines"];
}

- (void)fetchFormattedAddress:(id)a3 queue:(id)a4
{
  if (a3)
  {
    if (a4) {
      uint64_t v5 = a4;
    }
    else {
      uint64_t v5 = MEMORY[0x1E4F14428];
    }
    geoMapItemHandle = self->_internal->_geoMapItemHandle;
    if (geoMapItemHandle)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = sub_190803CA8;
      v8[3] = &unk_1E5698388;
      v8[4] = v5;
      v8[5] = a3;
      +[CLGeocoder hydrateGeoMapItemLocallyFromHandle:geoMapItemHandle completionHandler:v8];
    }
    else
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = sub_190803D98;
      v7[3] = &unk_1E5696C68;
      v7[4] = self;
      v7[5] = a3;
      dispatch_async(v5, v7);
    }
  }
}

- (NSArray)areasOfInterest
{
  return self->_internal->areasOfInterest;
}

- (NSString)inlandWater
{
  return (NSString *)[(NSDictionary *)self->_internal->addressDictionary objectForKey:@"InlandWater"];
}

- (NSString)ocean
{
  return (NSString *)[(NSDictionary *)self->_internal->addressDictionary objectForKey:@"Ocean"];
}

- (id)_geoMapItem
{
  return self->_internal->geoMapItemStorage;
}

- (id)_geoMapItemHandle
{
  return self->_internal->_geoMapItemHandle;
}

- (id)category
{
  return self->_internal->category;
}

- (unint64_t)mapItemSource
{
  return self->_internal->_cLMapItemSource;
}

- (unint64_t)muid
{
  return self->_internal->_muid;
}

+ (id)sourceToString:(unint64_t)a3
{
  objc_super v4 = (void *)[MEMORY[0x1E4F1CA48] array];
  uint64_t v5 = v4;
  if (!a3)
  {
    uint64_t v6 = @"Unknown";
LABEL_42:
    [v5 addObject:v6];
    goto LABEL_43;
  }
  if (a3)
  {
    [v4 addObject:@"ReverseGeocode"];
    if ((a3 & 2) == 0)
    {
LABEL_4:
      if ((a3 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_25;
    }
  }
  else if ((a3 & 2) == 0)
  {
    goto LABEL_4;
  }
  [v5 addObject:@"ForwardGeocode"];
  if ((a3 & 4) == 0)
  {
LABEL_5:
    if ((a3 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_26;
  }
LABEL_25:
  [v5 addObject:@"Contacts"];
  if ((a3 & 8) == 0)
  {
LABEL_6:
    if ((a3 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_27;
  }
LABEL_26:
  [v5 addObject:@"User"];
  if ((a3 & 0x10) == 0)
  {
LABEL_7:
    if ((a3 & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_28;
  }
LABEL_27:
  [v5 addObject:@"MapsSupportFavorite"];
  if ((a3 & 0x40) == 0)
  {
LABEL_8:
    if ((a3 & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_29;
  }
LABEL_28:
  [v5 addObject:@"MapsSupportHistoryEntryRoute"];
  if ((a3 & 0x80) == 0)
  {
LABEL_9:
    if ((a3 & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_30;
  }
LABEL_29:
  [v5 addObject:@"MapsSupportHistoryEntryPlaceDisplay"];
  if ((a3 & 0x100) == 0)
  {
LABEL_10:
    if ((a3 & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_31;
  }
LABEL_30:
  [v5 addObject:@"EventKit"];
  if ((a3 & 0x200) == 0)
  {
LABEL_11:
    if ((a3 & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_32;
  }
LABEL_31:
  [v5 addObject:@"LocalSearch"];
  if ((a3 & 0x400) == 0)
  {
LABEL_12:
    if ((a3 & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_33;
  }
LABEL_32:
  [v5 addObject:@"MapItemHandle"];
  if ((a3 & 0x800) == 0)
  {
LABEL_13:
    if ((a3 & 0x1000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_34;
  }
LABEL_33:
  [v5 addObject:@"ProactiveExperts"];
  if ((a3 & 0x1000) == 0)
  {
LABEL_14:
    if ((a3 & 0x2000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_35;
  }
LABEL_34:
  [v5 addObject:@"Portrait"];
  if ((a3 & 0x2000) == 0)
  {
LABEL_15:
    if ((a3 & 0x4000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_36;
  }
LABEL_35:
  [v5 addObject:@"LearnedPlace"];
  if ((a3 & 0x4000) == 0)
  {
LABEL_16:
    if ((a3 & 0x8000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_37;
  }
LABEL_36:
  [v5 addObject:@"BluePOI"];
  if ((a3 & 0x8000) == 0)
  {
LABEL_17:
    if ((a3 & 0x10000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_38;
  }
LABEL_37:
  [v5 addObject:@"MapItemURL"];
  if ((a3 & 0x10000) == 0)
  {
LABEL_18:
    if ((a3 & 0x20000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_39;
  }
LABEL_38:
  [v5 addObject:@"CurrentPOI"];
  if ((a3 & 0x20000) == 0)
  {
LABEL_19:
    if ((a3 & 0x40000) == 0) {
      goto LABEL_20;
    }
LABEL_40:
    [v5 addObject:@"ReverseGeocodeRelatedPlaces"];
    if ((a3 & 0x80000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_41;
  }
LABEL_39:
  [v5 addObject:@"CurrentLocation"];
  if ((a3 & 0x40000) != 0) {
    goto LABEL_40;
  }
LABEL_20:
  if ((a3 & 0x80000) != 0)
  {
LABEL_41:
    uint64_t v6 = @"POIHistory";
    goto LABEL_42;
  }
LABEL_43:
  if (![v5 count]) {
    return &stru_1EE006720;
  }

  return (id)[v5 componentsJoinedByString:@", "];
}

- (id)description
{
  uint64_t v3 = (void *)[MEMORY[0x1E4F28E78] stringWithString:&stru_1EE006720];
  objc_super v4 = [(CLPlacemark *)self name];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [(NSString *)v4 length]) {
    [v3 appendString:v4];
  }
  if (self->_internal->addressDictionary)
  {
    id v5 = [(CLPlacemark *)self formattedAddressLines];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v5 count])
      {
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = sub_190804380;
        v16[3] = &unk_1E5697020;
        v16[4] = v3;
        [v5 enumerateObjectsUsingBlock:v16];
      }
    }
  }
  location = self->_internal->location;
  if (location)
  {
    [(CLLocation *)location horizontalAccuracy];
    if (v7 >= 0.0)
    {
      if ([v3 length]) {
        [v3 appendString:@" @ "];
      }
      uint64_t v8 = NSString;
      [(CLLocation *)self->_internal->location coordinate];
      uint64_t v10 = v9;
      [(CLLocation *)self->_internal->location coordinate];
      uint64_t v12 = v11;
      [(CLLocation *)self->_internal->location horizontalAccuracy];
      [v3 appendString:objc_msgSend(v8, "stringWithFormat:", @"<%+.8f,%+.8f> +/- %.2fm", v10, v12, v13)];
    }
  }
  internal = self->_internal;
  if (internal->region)
  {
    if ([v3 length]) {
      [v3 appendString:@", region "];
    }
    objc_msgSend(v3, "appendString:", -[CLRegion description](self->_internal->region, "description"));
    internal = self->_internal;
  }
  if (internal->_cLMapItemSource)
  {
    if ([v3 length]) {
      [v3 appendString:@", source "];
    }
    [v3 appendString:objc_msgSend(NSString, "stringWithFormat:", @"%@", +[CLPlacemark sourceToString:](CLPlacemark, "sourceToString:", self->_internal->_cLMapItemSource))];
    internal = self->_internal;
  }
  if (internal->_muid)
  {
    if ([v3 length]) {
      [v3 appendString:@", muid "];
    }
    [v3 appendString:objc_msgSend(NSString, "stringWithFormat:", @"%lu", self->_internal->_muid)];
    internal = self->_internal;
  }
  if (internal->category)
  {
    if ([v3 length]) {
      [v3 appendString:@", category "];
    }
    objc_msgSend(v3, "appendString:", -[NSString description](self->_internal->category, "description"));
  }
  return v3;
}

- (CNPostalAddress)postalAddress
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(CLPlacemark *)self fullThoroughfare];
  [v3 setObject:v4 forKeyedSubscript:off_1EB2713F0()];
  id v5 = [(CLPlacemark *)self subLocality];
  [v3 setObject:v5 forKeyedSubscript:off_1EB2713F8()];
  uint64_t v6 = [(CLPlacemark *)self locality];
  [v3 setObject:v6 forKeyedSubscript:off_1EB271400()];
  double v7 = [(CLPlacemark *)self subAdministrativeArea];
  [v3 setObject:v7 forKeyedSubscript:off_1EB271408()];
  uint64_t v8 = [(CLPlacemark *)self administrativeArea];
  [v3 setObject:v8 forKeyedSubscript:off_1EB271410()];
  uint64_t v9 = [(CLPlacemark *)self postalCode];
  [v3 setObject:v9 forKeyedSubscript:off_1EB271418()];
  uint64_t v10 = [(CLPlacemark *)self country];
  [v3 setObject:v10 forKeyedSubscript:off_1EB271420()];
  uint64_t v11 = [(CLPlacemark *)self ISOcountryCode];
  [v3 setObject:v11 forKeyedSubscript:off_1EB271428()];
  uint64_t v12 = (CNPostalAddress *)[(Class)off_1EB271430() postalAddressWithDictionaryRepresentation:v3];

  return v12;
}

@end
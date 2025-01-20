@interface RTMapItem
+ (BOOL)hasKnownTypeItem:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (double)weightForExtendedAttributes:(id)a3;
+ (double)weightForSource:(unint64_t)a3;
+ (id)placeTypeToString:(unint64_t)a3;
+ (id)sourceToString:(unint64_t)a3;
- (BOOL)disputed;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMapItem:(id)a3;
- (BOOL)validMUID;
- (NSData)geoMapItemHandle;
- (NSDate)creationDate;
- (NSDate)expirationDate;
- (NSString)category;
- (NSString)displayLanguage;
- (NSString)name;
- (NSUUID)identifier;
- (RTAddress)address;
- (RTLocation)location;
- (RTMapItem)init;
- (RTMapItem)initWithCoder:(id)a3;
- (RTMapItem)initWithIdentifier:(id)a3 name:(id)a4 category:(id)a5 address:(id)a6 location:(id)a7 source:(unint64_t)a8 mapItemPlaceType:(unint64_t)a9 muid:(unint64_t)a10 resultProviderID:(int64_t)a11 geoMapItemHandle:(id)a12 creationDate:(id)a13 expirationDate:(id)a14 extendedAttributes:(id)a15 displayLanguage:(id)a16 disputed:(BOOL)a17;
- (RTMapItemExtendedAttributes)extendedAttributes;
- (double)weight;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)compare:(id)a3;
- (int64_t)resultProviderID;
- (unint64_t)hash;
- (unint64_t)mapItemPlaceType;
- (unint64_t)muid;
- (unint64_t)source;
- (void)encodeWithCoder:(id)a3;
- (void)setExtendedAttributes:(id)a3;
- (void)setSource:(unint64_t)a3;
- (void)updateWeightWithSource:(unint64_t)a3 extendedAttributes:(id)a4;
@end

@implementation RTMapItem

- (RTAddress)address
{
  return self->_address;
}

- (RTLocation)location
{
  return self->_location;
}

- (NSData)geoMapItemHandle
{
  return self->_geoMapItemHandle;
}

- (unint64_t)mapItemPlaceType
{
  return self->_mapItemPlaceType;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v9 = a3;
  [v9 encodeObject:identifier forKey:@"identifier"];
  [v9 encodeObject:self->_address forKey:@"address"];
  [v9 encodeObject:self->_creationDate forKey:@"creationDate"];
  [v9 encodeObject:self->_expirationDate forKey:@"expirationDate"];
  [v9 encodeObject:self->_geoMapItemHandle forKey:@"geoMapItemHandle"];
  [v9 encodeObject:self->_location forKey:@"location"];
  v5 = [NSNumber numberWithUnsignedInteger:self->_mapItemPlaceType];
  [v9 encodeObject:v5 forKey:@"mapItemPlaceType"];

  v6 = [NSNumber numberWithUnsignedInteger:self->_muid];
  [v9 encodeObject:v6 forKey:@"muid"];

  v7 = [NSNumber numberWithInteger:self->_resultProviderID];
  [v9 encodeObject:v7 forKey:@"resultProviderID"];

  [v9 encodeObject:self->_name forKey:@"name"];
  [v9 encodeObject:self->_category forKey:@"category"];
  v8 = [NSNumber numberWithUnsignedInteger:self->_source];
  [v9 encodeObject:v8 forKey:@"source"];

  [v9 encodeObject:self->_extendedAttributes forKey:@"xattrs"];
  [v9 encodeObject:self->_displayLanguage forKey:@"displayLanguage"];
  [v9 encodeBool:self->_disputed forKey:@"disputed"];
}

- (NSString)name
{
  return self->_name;
}

- (RTMapItem)initWithCoder:(id)a3
{
  id v3 = a3;
  v24 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  v23 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"address"];
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"creationDate"];
  v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"expirationDate"];
  v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"geoMapItemHandle"];
  v22 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"location"];
  v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"mapItemPlaceType"];
  uint64_t v21 = [v7 unsignedIntegerValue];

  v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"muid"];
  uint64_t v20 = [v8 unsignedIntegerValue];

  id v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"resultProviderID"];
  uint64_t v19 = [v9 integerValue];

  v10 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"category"];
  v12 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"source"];
  uint64_t v18 = [v12 unsignedIntegerValue];

  v13 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"xattrs"];
  v14 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"displayLanguage"];
  char v15 = [v3 decodeBoolForKey:@"disputed"];

  LOBYTE(v17) = v15;
  v26 = [(RTMapItem *)self initWithIdentifier:v24 name:v10 category:v11 address:v23 location:v22 source:v18 mapItemPlaceType:v21 muid:v20 resultProviderID:v19 geoMapItemHandle:v6 creationDate:v4 expirationDate:v5 extendedAttributes:v13 displayLanguage:v14 disputed:v17];

  return v26;
}

- (RTMapItem)initWithIdentifier:(id)a3 name:(id)a4 category:(id)a5 address:(id)a6 location:(id)a7 source:(unint64_t)a8 mapItemPlaceType:(unint64_t)a9 muid:(unint64_t)a10 resultProviderID:(int64_t)a11 geoMapItemHandle:(id)a12 creationDate:(id)a13 expirationDate:(id)a14 extendedAttributes:(id)a15 displayLanguage:(id)a16 disputed:(BOOL)a17
{
  id v21 = a3;
  id v45 = a4;
  id v39 = a5;
  id v44 = a5;
  id v40 = a6;
  id v22 = a6;
  id v50 = a7;
  id v49 = a12;
  id v48 = a13;
  id v47 = a14;
  id v43 = a15;
  id v23 = a16;
  id v46 = v21;
  if (!v21)
  {
    id v29 = v23;
    v30 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    *(_WORD *)buf = 0;
    v31 = "Invalid parameter not satisfying: identifier";
LABEL_19:
    _os_log_error_impl(&dword_1A8FEF000, v30, OS_LOG_TYPE_ERROR, v31, buf, 2u);
    goto LABEL_20;
  }
  if (!v22)
  {
    id v29 = v23;
    v30 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    *(_WORD *)buf = 0;
    v31 = "Invalid parameter not satisfying: address";
    goto LABEL_19;
  }
  if (!v50)
  {
    id v29 = v23;
    v30 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    *(_WORD *)buf = 0;
    v31 = "Invalid parameter not satisfying: location";
    goto LABEL_19;
  }
  if (!v49)
  {
    id v29 = v23;
    v30 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    *(_WORD *)buf = 0;
    v31 = "Invalid parameter not satisfying: geoMapItemHandle";
    goto LABEL_19;
  }
  if (!v48)
  {
    id v29 = v23;
    v30 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v31 = "Invalid parameter not satisfying: creationDate";
      goto LABEL_19;
    }
LABEL_20:

    v24 = 0;
    v26 = v45;
    v25 = v46;
    v28 = v43;
    v27 = v44;
LABEL_21:
    id v23 = v29;
    goto LABEL_22;
  }
  if (!v47)
  {
    id v29 = v23;
    v34 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v26 = v45;
    v25 = v46;
    v28 = v43;
    v27 = v44;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A8FEF000, v34, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: expirationDate", buf, 2u);
    }

    v24 = 0;
    goto LABEL_21;
  }
  if ((a8 & 0xFFFFFFFFFFF00020) != 0)
  {
    v24 = 0;
    v26 = v45;
    v25 = v46;
    v28 = v43;
    v27 = v44;
LABEL_22:
    v32 = self;
    goto LABEL_23;
  }
  id v37 = v23;
  v51.receiver = self;
  v51.super_class = (Class)RTMapItem;
  v35 = [(RTMapItem *)&v51 init];
  v36 = v35;
  if (v35)
  {
    objc_storeStrong((id *)&v35->_identifier, a3);
    objc_storeStrong((id *)&v36->_name, a4);
    objc_storeStrong((id *)&v36->_category, v39);
    objc_storeStrong((id *)&v36->_address, v40);
    objc_storeStrong((id *)&v36->_location, a7);
    v36->_source = a8;
    v36->_mapItemPlaceType = a9;
    v36->_muid = a10;
    v36->_resultProviderID = a11;
    objc_storeStrong((id *)&v36->_geoMapItemHandle, a12);
    objc_storeStrong((id *)&v36->_creationDate, a13);
    objc_storeStrong((id *)&v36->_expirationDate, a14);
    objc_storeStrong((id *)&v36->_extendedAttributes, a15);
    objc_storeStrong((id *)&v36->_displayLanguage, a16);
    v36->_disputed = a17;
    [(RTMapItem *)v36 updateWeightWithSource:v36->_source extendedAttributes:v36->_extendedAttributes];
  }
  v32 = v36;
  v24 = v32;
  v26 = v45;
  v25 = v46;
  v28 = v43;
  v27 = v44;
  id v23 = v37;
LABEL_23:

  return v24;
}

- (void)updateWeightWithSource:(unint64_t)a3 extendedAttributes:(id)a4
{
  id v6 = a4;
  double v7 = 0.0;
  if ([(RTMapItem *)self validMUID])
  {
    name = self->_name;
    id v9 = [(RTAddress *)self->_address thoroughfare];
    LODWORD(name) = [(NSString *)name isEqualToString:v9];

    if (name) {
      double v7 = 0.0;
    }
    else {
      double v7 = 50.0;
    }
  }
  [(id)objc_opt_class() weightForSource:a3];
  double v11 = v7 + v10;
  [(id)objc_opt_class() weightForExtendedAttributes:v6];
  double v13 = v12;

  self->_weight = v11 + v13;
}

- (BOOL)validMUID
{
  return self->_muid != 0;
}

+ (double)weightForSource:(unint64_t)a3
{
  double v3 = 0.0;
  if (a3) {
    double v3 = 1.0;
  }
  if ((a3 & 0x40000) != 0) {
    double v3 = v3 + 1.0;
  }
  if ((a3 & 2) != 0) {
    double v3 = v3 + 1.0;
  }
  double result = v3 + 1.0;
  if ((a3 & 0x1000) == 0) {
    double result = v3;
  }
  if ((a3 & 0x800) != 0) {
    double result = result + 5.0;
  }
  if ((a3 & 0x200) != 0) {
    double result = result + 7.0;
  }
  if ((a3 & 0x4000) != 0) {
    double result = result + 9.0;
  }
  if ((a3 & 0x80000) != 0) {
    double result = result + 9.0;
  }
  if ((a3 & 0x100) != 0) {
    double result = result + 11.0;
  }
  if ((a3 & 0x40) != 0) {
    double result = result + 13.0;
  }
  if ((a3 & 0x80) != 0) {
    double result = result + 13.0;
  }
  if ((a3 & 8) != 0) {
    double result = result + 23.0;
  }
  if ((a3 & 4) != 0) {
    double result = result + 23.0;
  }
  if ((a3 & 0x10) != 0) {
    return result + 23.0;
  }
  return result;
}

+ (double)weightForExtendedAttributes:(id)a3
{
  if (!a3) {
    return 0.0;
  }
  id v3 = a3;
  [v3 wifiConfidence];
  double v5 = v4 + 0.0;
  int v6 = [v3 isMe];

  double result = v5 + 70.0;
  if (!v6) {
    return v5;
  }
  return result;
}

- (unint64_t)source
{
  return self->_source;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSString)category
{
  return self->_category;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_extendedAttributes, 0);
  objc_storeStrong((id *)&self->_displayLanguage, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_geoMapItemHandle, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (RTMapItem)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithIdentifier_name_category_address_location_source_mapItemPlaceType_muid_resultProviderID_geoMapItemHandle_creationDate_expirationDate_extendedAttributes_displayLanguage_disputed_);
}

- (id)description
{
  id v3 = NSString;
  double v4 = [(NSUUID *)self->_identifier UUIDString];
  long long v17 = *(_OWORD *)&self->_name;
  address = self->_address;
  location = self->_location;
  double v7 = [(id)objc_opt_class() sourceToString:self->_source];
  v8 = [(id)objc_opt_class() placeTypeToString:self->_mapItemPlaceType];
  unint64_t muid = self->_muid;
  int64_t resultProviderID = self->_resultProviderID;
  double weight = self->_weight;
  uint64_t v12 = [(NSDate *)self->_creationDate stringFromDate];
  double v13 = (void *)v12;
  if (self->_disputed) {
    v14 = @"YES";
  }
  else {
    v14 = @"NO";
  }
  char v15 = [v3 stringWithFormat:@"identifier, %@, name, \"%@\", category, %@, address, %@, location, %@, source, %@, map item place type, %@, muid, %lu, result provider ID: %ld, weight, %lf, creationDate, %@, extended attributes, %@, display language, %@, disputed, %@", v4, v17, address, location, v7, v8, muid, resultProviderID, *(void *)&weight, v12, self->_extendedAttributes, self->_displayLanguage, v14];

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (RTMapItem *)a3;
  double v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(RTMapItem *)self isEqualToMapItem:v5];

  return v6;
}

- (unint64_t)hash
{
  id v3 = [NSNumber numberWithUnsignedInteger:self->_muid];
  unint64_t v4 = [v3 hash];
  if (!v4)
  {
    uint64_t v5 = [(NSUUID *)self->_identifier hash];
    unint64_t v4 = [(NSDate *)self->_creationDate hash] ^ v5;
  }

  return v4;
}

- (BOOL)isEqualToMapItem:(id)a3
{
  id v4 = a3;
  identifier = self->_identifier;
  BOOL v6 = [v4 identifier];
  LOBYTE(identifier) = [(NSUUID *)identifier isEqual:v6];

  if (identifier) {
    goto LABEL_2;
  }
  unint64_t muid = self->_muid;
  if (!muid)
  {
    if (![v4 muid]) {
      goto LABEL_8;
    }
    unint64_t muid = self->_muid;
  }
  if (muid == [v4 muid])
  {
    int64_t resultProviderID = self->_resultProviderID;
    if (resultProviderID == [v4 resultProviderID])
    {
LABEL_2:
      char v7 = 1;
      goto LABEL_15;
    }
  }
LABEL_8:
  int v10 = [(RTLocation *)self->_location referenceFrame];
  double v11 = [v4 location];
  int v12 = [v11 referenceFrame];

  if (v10 == v12)
  {
    id v13 = objc_alloc(MEMORY[0x1E4F1E5F0]);
    [(RTLocation *)self->_location latitude];
    double v15 = v14;
    [(RTLocation *)self->_location longitude];
    long long v17 = (void *)[v13 initWithLatitude:v15 longitude:v16];
    id v18 = objc_alloc(MEMORY[0x1E4F1E5F0]);
    uint64_t v19 = [v4 location];
    [v19 latitude];
    double v21 = v20;
    id v22 = [v4 location];
    [v22 longitude];
    v24 = (void *)[v18 initWithLatitude:v21 longitude:v23];

    [v17 distanceFromLocation:v24];
    if (v25 <= 1000.0 && (int disputed = self->_disputed, disputed == [v4 disputed]))
    {
      address = self->_address;
      v28 = [v4 address];
      char v7 = [(RTAddress *)address isEqualToAddress:v28];
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }
LABEL_15:

  return v7;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  double weight = self->_weight;
  [v4 weight];
  if (weight >= v6)
  {
    double v8 = self->_weight;
    [v4 weight];
    int64_t v7 = v8 > v9;
  }
  else
  {
    int64_t v7 = -1;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  LOBYTE(v6) = self->_disputed;
  return (id)[v4 initWithIdentifier:self->_identifier name:self->_name category:self->_category address:self->_address location:self->_location source:self->_source mapItemPlaceType:self->_mapItemPlaceType muid:self->_muid resultProviderID:self->_resultProviderID geoMapItemHandle:self->_geoMapItemHandle creationDate:self->_creationDate expirationDate:self->_expirationDate extendedAttributes:self->_extendedAttributes displayLanguage:self->_displayLanguage disputed:v6];
}

+ (BOOL)hasKnownTypeItem:(id)a3
{
  id v3 = a3;
  if ([v3 count]) {
    BOOL v4 = [v3 indexOfObjectPassingTest:&__block_literal_global_0] != 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

uint64_t __30__RTMapItem_hasKnownTypeItem___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 extendedAttributes];
  uint64_t v3 = [v2 isMe];

  return v3;
}

+ (id)placeTypeToString:(unint64_t)a3
{
  id result = @"AreaOfInterest";
  switch(a3)
  {
    case 0uLL:
      id result = @"Unknown";
      break;
    case 1uLL:
      return result;
    case 2uLL:
      id result = @"PointOfInterest";
      break;
    case 3uLL:
      id result = @"Address";
      break;
    case 4uLL:
    case 5uLL:
      id result = @"Country";
      break;
    case 6uLL:
      id result = @"AdministrativeArea";
      break;
    case 7uLL:
      id result = @"Locality";
      break;
    case 8uLL:
      id result = @"TimeZone";
      break;
    case 9uLL:
      id result = @"SubLocality";
      break;
    case 0xAuLL:
      id result = @"Ocean";
      break;
    case 0xBuLL:
      id result = @"InlandWater";
      break;
    case 0xCuLL:
      id result = @"Island";
      break;
    case 0xDuLL:
      id result = @"Street";
      break;
    case 0xEuLL:
      id result = @"Admin";
      break;
    case 0xFuLL:
      id result = @"Postal";
      break;
    case 0x10uLL:
      id result = @"Intersection";
      break;
    case 0x11uLL:
      id result = @"Building";
      break;
    case 0x12uLL:
      id result = @"Continent";
      break;
    case 0x13uLL:
      id result = @"Region";
      break;
    case 0x14uLL:
      id result = @"Division";
      break;
    default:
      if (a3 == 1000) {
        id result = @"Undefined";
      }
      break;
  }
  return result;
}

+ (id)sourceToString:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v6 = v5;
  if (!a3)
  {
    int64_t v7 = @"Unknown";
LABEL_42:
    [v6 addObject:v7];
    goto LABEL_43;
  }
  if (a3)
  {
    [v5 addObject:@"ReverseGeocode"];
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
  [v6 addObject:@"ForwardGeocode"];
  if ((a3 & 4) == 0)
  {
LABEL_5:
    if ((a3 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_26;
  }
LABEL_25:
  [v6 addObject:@"Contacts"];
  if ((a3 & 8) == 0)
  {
LABEL_6:
    if ((a3 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_27;
  }
LABEL_26:
  [v6 addObject:@"User"];
  if ((a3 & 0x10) == 0)
  {
LABEL_7:
    if ((a3 & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_28;
  }
LABEL_27:
  [v6 addObject:@"MapsSupportFavorite"];
  if ((a3 & 0x40) == 0)
  {
LABEL_8:
    if ((a3 & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_29;
  }
LABEL_28:
  [v6 addObject:@"MapsSupportHistoryEntryRoute"];
  if ((a3 & 0x80) == 0)
  {
LABEL_9:
    if ((a3 & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_30;
  }
LABEL_29:
  [v6 addObject:@"MapsSupportHistoryEntryPlaceDisplay"];
  if ((a3 & 0x100) == 0)
  {
LABEL_10:
    if ((a3 & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_31;
  }
LABEL_30:
  [v6 addObject:@"EventKit"];
  if ((a3 & 0x200) == 0)
  {
LABEL_11:
    if ((a3 & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_32;
  }
LABEL_31:
  [v6 addObject:@"LocalSearch"];
  if ((a3 & 0x400) == 0)
  {
LABEL_12:
    if ((a3 & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_33;
  }
LABEL_32:
  [v6 addObject:@"MapItemHandle"];
  if ((a3 & 0x800) == 0)
  {
LABEL_13:
    if ((a3 & 0x1000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_34;
  }
LABEL_33:
  [v6 addObject:@"ProactiveExperts"];
  if ((a3 & 0x1000) == 0)
  {
LABEL_14:
    if ((a3 & 0x2000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_35;
  }
LABEL_34:
  [v6 addObject:@"Portrait"];
  if ((a3 & 0x2000) == 0)
  {
LABEL_15:
    if ((a3 & 0x4000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_36;
  }
LABEL_35:
  [v6 addObject:@"LearnedPlace"];
  if ((a3 & 0x4000) == 0)
  {
LABEL_16:
    if ((a3 & 0x8000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_37;
  }
LABEL_36:
  [v6 addObject:@"BluePOI"];
  if ((a3 & 0x8000) == 0)
  {
LABEL_17:
    if ((a3 & 0x10000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_38;
  }
LABEL_37:
  [v6 addObject:@"MapItemURL"];
  if ((a3 & 0x10000) == 0)
  {
LABEL_18:
    if ((a3 & 0x20000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_39;
  }
LABEL_38:
  [v6 addObject:@"CurrentPOI"];
  if ((a3 & 0x20000) == 0)
  {
LABEL_19:
    if ((a3 & 0x40000) == 0) {
      goto LABEL_20;
    }
LABEL_40:
    [v6 addObject:@"ReverseGeocodeRelatedPlaces"];
    if ((a3 & 0x80000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_41;
  }
LABEL_39:
  [v6 addObject:@"CurrentLocation"];
  if ((a3 & 0x40000) != 0) {
    goto LABEL_40;
  }
LABEL_20:
  if ((a3 & 0x80000) != 0)
  {
LABEL_41:
    int64_t v7 = @"POIHistory";
    goto LABEL_42;
  }
LABEL_43:
  if (![v6 count])
  {
    double v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      double v11 = NSStringFromSelector(a2);
      int v12 = 138413058;
      id v13 = v11;
      __int16 v14 = 2048;
      unint64_t v15 = a3;
      __int16 v16 = 2080;
      long long v17 = "+[RTMapItem sourceToString:]";
      __int16 v18 = 1024;
      int v19 = 499;
      _os_log_error_impl(&dword_1A8FEF000, v8, OS_LOG_TYPE_ERROR, "%@ does not handle RTMapItemSource, %lu (in %s:%d)", (uint8_t *)&v12, 0x26u);
    }
  }
  if ([v6 count])
  {
    double v9 = [v6 componentsJoinedByString:@", "];
  }
  else
  {
    double v9 = &stru_1EFF84648;
  }

  return v9;
}

- (void)setExtendedAttributes:(id)a3
{
  id v5 = a3;
  if (!-[RTMapItemExtendedAttributes isEqualToMapItemExtendedAttributes:](self->_extendedAttributes, "isEqualToMapItemExtendedAttributes:"))
  {
    objc_storeStrong((id *)&self->_extendedAttributes, a3);
    [(RTMapItem *)self updateWeightWithSource:self->_source extendedAttributes:self->_extendedAttributes];
  }
}

- (void)setSource:(unint64_t)a3
{
  if (self->_source != a3)
  {
    self->_source = a3;
    -[RTMapItem updateWeightWithSource:extendedAttributes:](self, "updateWeightWithSource:extendedAttributes:");
  }
}

- (unint64_t)muid
{
  return self->_muid;
}

- (int64_t)resultProviderID
{
  return self->_resultProviderID;
}

- (NSString)displayLanguage
{
  return self->_displayLanguage;
}

- (RTMapItemExtendedAttributes)extendedAttributes
{
  return self->_extendedAttributes;
}

- (BOOL)disputed
{
  return self->_disputed;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (double)weight
{
  return self->_weight;
}

@end
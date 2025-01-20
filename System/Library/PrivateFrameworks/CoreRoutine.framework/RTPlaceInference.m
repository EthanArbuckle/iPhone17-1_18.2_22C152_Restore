@interface RTPlaceInference
+ (BOOL)supportsSecureCoding;
+ (id)placeTypeToString:(unint64_t)a3;
+ (id)userSpecificPlaceTypeSourceToString:(unint64_t)a3;
+ (id)userSpecificPlaceTypeToString:(unint64_t)a3;
+ (unint64_t)placeInferencePlaceTypeFromMapItem:(id)a3 userType:(unint64_t)a4 source:(unint64_t)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPlaceInference:(id)a3;
- (NSString)preferredName;
- (NSUUID)loiIdentifier;
- (RTLocation)referenceLocation;
- (RTMapItem)finerGranularityMapItem;
- (RTMapItem)mapItem;
- (RTPlaceInference)init;
- (RTPlaceInference)initWithCoder:(id)a3;
- (RTPlaceInference)initWithMapItem:(id)a3 finerGranularityMapItem:(id)a4 userType:(unint64_t)a5 userTypeSource:(unint64_t)a6 placeType:(unint64_t)a7 referenceLocation:(id)a8 confidence:(double)a9 finerGranularityMapItemConfidence:(double)a10 loiIdentifier:(id)a11;
- (RTPlaceInference)initWithMapItem:(id)a3 finerGranularityMapItem:(id)a4 userType:(unint64_t)a5 userTypeSource:(unint64_t)a6 placeType:(unint64_t)a7 referenceLocation:(id)a8 confidence:(double)a9 finerGranularityMapItemConfidence:(double)a10 loiIdentifier:(id)a11 preferredName:(id)a12;
- (RTPlaceInference)initWithMapItem:(id)a3 userType:(unint64_t)a4 userTypeSource:(unint64_t)a5 placeType:(unint64_t)a6 referenceLocation:(id)a7 confidence:(double)a8 loiIdentifier:(id)a9;
- (RTPlaceInference)initWithMapItem:(id)a3 userType:(unint64_t)a4 userTypeSource:(unint64_t)a5 placeType:(unint64_t)a6 referenceLocation:(id)a7 confidence:(double)a8 loiIdentifier:(id)a9 preferredName:(id)a10;
- (double)confidence;
- (double)finerGranularityMapItemConfidence;
- (id)description;
- (id)nameFromUserType:(unint64_t)a3;
- (unint64_t)placeType;
- (unint64_t)userType;
- (unint64_t)userTypeSource;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RTPlaceInference

- (RTMapItem)mapItem
{
  return self->_mapItem;
}

+ (unint64_t)placeInferencePlaceTypeFromMapItem:(id)a3 userType:(unint64_t)a4 source:(unint64_t)a5
{
  char v5 = a5;
  id v7 = a3;
  v8 = v7;
  if (a4)
  {
    unint64_t v9 = 1;
  }
  else if ([v7 mapItemPlaceType] == 1)
  {
    unint64_t v9 = 2;
  }
  else if ((v5 & 1) != 0 || ([v8 validMUID] & 1) == 0)
  {
    unint64_t v9 = 4;
  }
  else
  {
    unint64_t v9 = 3;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  mapItem = self->_mapItem;
  id v10 = a3;
  [v10 encodeObject:mapItem forKey:@"mapItem"];
  [v10 encodeObject:self->_finerGranularityMapItem forKey:@"finerGranularityMapItem"];
  char v5 = [NSNumber numberWithUnsignedInteger:self->_userType];
  [v10 encodeObject:v5 forKey:@"userType"];

  v6 = [NSNumber numberWithUnsignedInteger:self->_userTypeSource];
  [v10 encodeObject:v6 forKey:@"userTypeSource"];

  id v7 = [NSNumber numberWithUnsignedInteger:self->_placeType];
  [v10 encodeObject:v7 forKey:@"placeType"];

  [v10 encodeObject:self->_referenceLocation forKey:@"referenceLocation"];
  v8 = [NSNumber numberWithDouble:self->_confidence];
  [v10 encodeObject:v8 forKey:@"confidence"];

  unint64_t v9 = [NSNumber numberWithDouble:self->_finerGranularityMapItemConfidence];
  [v10 encodeObject:v9 forKey:@"finerGranularityMapItemConfidence"];

  [v10 encodeObject:self->_loiIdentifier forKey:@"loiIdentifier"];
  [v10 encodeObject:self->_preferredName forKey:@"preferredName"];
}

- (RTPlaceInference)initWithCoder:(id)a3
{
  id v4 = a3;
  char v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mapItem"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"finerGranularityMapItem"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userType"];
  uint64_t v8 = [v7 unsignedIntegerValue];

  unint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userTypeSource"];
  uint64_t v10 = [v9 unsignedIntegerValue];

  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"placeType"];
  uint64_t v12 = [v11 unsignedIntegerValue];

  v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"referenceLocation"];
  v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"confidence"];
  [v14 doubleValue];
  double v16 = v15;

  v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"finerGranularityMapItemConfidence"];
  [v17 doubleValue];
  double v19 = v18;

  v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"loiIdentifier"];
  v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preferredName"];

  v22 = [(RTPlaceInference *)self initWithMapItem:v5 finerGranularityMapItem:v6 userType:v8 userTypeSource:v10 placeType:v12 referenceLocation:v13 confidence:v16 finerGranularityMapItemConfidence:v19 loiIdentifier:v20 preferredName:v21];
  return v22;
}

- (RTPlaceInference)initWithMapItem:(id)a3 userType:(unint64_t)a4 userTypeSource:(unint64_t)a5 placeType:(unint64_t)a6 referenceLocation:(id)a7 confidence:(double)a8 loiIdentifier:(id)a9
{
  id v16 = a3;
  id v17 = a7;
  id v18 = a9;
  double v19 = [(RTPlaceInference *)self nameFromUserType:a4];
  if (![v19 length])
  {
    uint64_t v20 = [v16 name];

    double v19 = (void *)v20;
  }
  v21 = [(RTPlaceInference *)self initWithMapItem:v16 userType:a4 userTypeSource:a5 placeType:a6 referenceLocation:v17 confidence:v18 loiIdentifier:a8 preferredName:v19];

  return v21;
}

- (id)nameFromUserType:(unint64_t)a3
{
  if (a3 - 1 > 3)
  {
    char v5 = 0;
  }
  else
  {
    char v5 = objc_msgSend(MEMORY[0x1E4F28B50], "_coreroutine_LocalizedStringForKey:", off_1E5D73A70[a3 - 1], v3);
  }
  return v5;
}

- (RTPlaceInference)initWithMapItem:(id)a3 userType:(unint64_t)a4 userTypeSource:(unint64_t)a5 placeType:(unint64_t)a6 referenceLocation:(id)a7 confidence:(double)a8 loiIdentifier:(id)a9 preferredName:(id)a10
{
  return [(RTPlaceInference *)self initWithMapItem:a3 finerGranularityMapItem:0 userType:a4 userTypeSource:a5 placeType:a6 referenceLocation:a7 confidence:a8 finerGranularityMapItemConfidence:0.0 loiIdentifier:a9 preferredName:a10];
}

- (RTPlaceInference)initWithMapItem:(id)a3 finerGranularityMapItem:(id)a4 userType:(unint64_t)a5 userTypeSource:(unint64_t)a6 placeType:(unint64_t)a7 referenceLocation:(id)a8 confidence:(double)a9 finerGranularityMapItemConfidence:(double)a10 loiIdentifier:(id)a11 preferredName:(id)a12
{
  id v20 = a3;
  id v21 = a4;
  id v36 = a8;
  id v35 = a11;
  id v22 = a12;
  if (a5 >= 8)
  {
    v27 = v22;
    v28 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      goto LABEL_23;
    }
    *(_WORD *)buf = 0;
    v29 = "Invalid parameter not satisfying: RTPlaceInferenceUserSpecificPlaceTypeValid(userType)";
LABEL_22:
    _os_log_error_impl(&dword_1A8FEF000, v28, OS_LOG_TYPE_ERROR, v29, buf, 2u);
    goto LABEL_23;
  }
  if (a6 >= 8)
  {
    v27 = v22;
    v28 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      goto LABEL_23;
    }
    *(_WORD *)buf = 0;
    v29 = "Invalid parameter not satisfying: RTPlaceInferenceUserSpecificPlaceTypeSourceValid(userTypeSource)";
    goto LABEL_22;
  }
  if (a7 >= 8)
  {
    v27 = v22;
    v28 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      goto LABEL_23;
    }
    *(_WORD *)buf = 0;
    v29 = "Invalid parameter not satisfying: RTPlaceInferencePlaceTypeValid(placeType)";
    goto LABEL_22;
  }
  if (!v36)
  {
    v27 = v22;
    v28 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      goto LABEL_23;
    }
    *(_WORD *)buf = 0;
    v29 = "Invalid parameter not satisfying: referenceLocation";
    goto LABEL_22;
  }
  if (a9 < 0.0 || a9 > 1.0)
  {
    v27 = v22;
    v28 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v29 = "Invalid parameter not satisfying: RTPlaceInferenceConfidenceValid(confidence)";
      goto LABEL_22;
    }
LABEL_23:

    v25 = 0;
    v24 = self;
    v26 = v35;
    goto LABEL_24;
  }
  id v32 = v22;
  if (a10 < 0.0 || a10 > 1.0)
  {
    v31 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v26 = v35;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A8FEF000, v31, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: RTPlaceInferenceConfidenceValid(finerGranularityMapItemConfidence)", buf, 2u);
    }

    v25 = 0;
    v27 = v32;
    v24 = self;
  }
  else
  {
    v37.receiver = self;
    v37.super_class = (Class)RTPlaceInference;
    v23 = [(RTPlaceInference *)&v37 init];
    if (v23)
    {
      v34 = v23;
      objc_storeStrong((id *)&v23->_mapItem, a3);
      objc_storeStrong((id *)&v34->_finerGranularityMapItem, a4);
      v34->_userType = a5;
      v34->_userTypeSource = a6;
      v34->_placeType = a7;
      objc_storeStrong((id *)&v34->_referenceLocation, a8);
      v34->_confidence = a9;
      v34->_finerGranularityMapItemConfidence = a10;
      objc_storeStrong((id *)&v34->_loiIdentifier, a11);
      objc_storeStrong((id *)&v34->_preferredName, a12);
      v23 = v34;
    }
    v24 = v23;
    v25 = v24;
    v26 = v35;
    v27 = v32;
  }
LABEL_24:

  return v25;
}

- (RTLocation)referenceLocation
{
  return self->_referenceLocation;
}

- (double)confidence
{
  return self->_confidence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loiIdentifier, 0);
  objc_storeStrong((id *)&self->_preferredName, 0);
  objc_storeStrong((id *)&self->_finerGranularityMapItem, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_referenceLocation, 0);
}

- (unint64_t)userType
{
  return self->_userType;
}

- (unint64_t)placeType
{
  return self->_placeType;
}

- (unint64_t)userTypeSource
{
  return self->_userTypeSource;
}

- (NSString)preferredName
{
  return self->_preferredName;
}

- (NSUUID)loiIdentifier
{
  return self->_loiIdentifier;
}

- (RTPlaceInference)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithMapItem_finerGranularityMapItem_userType_userTypeSource_placeType_referenceLocation_confidence_finerGranularityMapItemConfidence_loiIdentifier_preferredName_);
}

- (RTPlaceInference)initWithMapItem:(id)a3 finerGranularityMapItem:(id)a4 userType:(unint64_t)a5 userTypeSource:(unint64_t)a6 placeType:(unint64_t)a7 referenceLocation:(id)a8 confidence:(double)a9 finerGranularityMapItemConfidence:(double)a10 loiIdentifier:(id)a11
{
  id v19 = a3;
  id v20 = a4;
  id v21 = a8;
  id v22 = a11;
  v23 = [(RTPlaceInference *)self nameFromUserType:a5];
  if (![v23 length])
  {
    uint64_t v24 = [v19 name];

    v23 = (void *)v24;
  }
  v25 = [(RTPlaceInference *)self initWithMapItem:v19 finerGranularityMapItem:v20 userType:a5 userTypeSource:a6 placeType:a7 referenceLocation:v21 confidence:a9 finerGranularityMapItemConfidence:a10 loiIdentifier:v22 preferredName:v23];

  return v25;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = [(RTPlaceInference *)self referenceLocation];
  char v5 = objc_msgSend((id)objc_opt_class(), "userSpecificPlaceTypeToString:", -[RTPlaceInference userType](self, "userType"));
  v6 = objc_msgSend((id)objc_opt_class(), "userSpecificPlaceTypeSourceToString:", -[RTPlaceInference userTypeSource](self, "userTypeSource"));
  id v7 = objc_msgSend((id)objc_opt_class(), "placeTypeToString:", -[RTPlaceInference placeType](self, "placeType"));
  uint64_t v8 = [(RTPlaceInference *)self mapItem];
  unint64_t v9 = [(RTPlaceInference *)self finerGranularityMapItem];
  uint64_t v10 = [(RTPlaceInference *)self preferredName];
  [(RTPlaceInference *)self confidence];
  uint64_t v12 = v11;
  [(RTPlaceInference *)self finerGranularityMapItemConfidence];
  uint64_t v14 = v13;
  double v15 = [(RTPlaceInference *)self loiIdentifier];
  id v16 = [v3 stringWithFormat:@"location, %@, userType, %@, userTypeSource, %@, placeType, %@, map item, %@, finerGranularityMapItem, %@, preferredName, %@, confidence, %f, finerGranularityMapItemConfidence, %f, related LOI identifier, %@", v4, v5, v6, v7, v8, v9, v10, v12, v14, v15];

  return v16;
}

+ (id)userSpecificPlaceTypeToString:(unint64_t)a3
{
  if (a3 > 4) {
    return @"Home";
  }
  else {
    return off_1E5D73A90[a3];
  }
}

+ (id)userSpecificPlaceTypeSourceToString:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  char v5 = [MEMORY[0x1E4F1CA48] array];
  v6 = v5;
  if (!a3)
  {
    id v7 = @"Unknown";
LABEL_10:
    [v6 addObject:v7];
    goto LABEL_11;
  }
  if ((a3 & 1) == 0)
  {
    if ((a3 & 2) == 0) {
      goto LABEL_4;
    }
LABEL_8:
    [v6 addObject:@"MeCard"];
    if ((a3 & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  [v5 addObject:@"Inferred"];
  if ((a3 & 2) != 0) {
    goto LABEL_8;
  }
LABEL_4:
  if ((a3 & 4) != 0)
  {
LABEL_9:
    id v7 = @"User";
    goto LABEL_10;
  }
LABEL_11:
  if (![v6 count])
  {
    uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = NSStringFromSelector(a2);
      int v12 = 138413058;
      uint64_t v13 = v11;
      __int16 v14 = 2048;
      unint64_t v15 = a3;
      __int16 v16 = 2080;
      id v17 = "+[RTPlaceInference userSpecificPlaceTypeSourceToString:]";
      __int16 v18 = 1024;
      int v19 = 299;
      _os_log_error_impl(&dword_1A8FEF000, v8, OS_LOG_TYPE_ERROR, "%@ does not handle RTPlaceInferenceUserSpecificPlaceTypeSource, %lu (in %s:%d)", (uint8_t *)&v12, 0x26u);
    }
  }
  if ([v6 count])
  {
    unint64_t v9 = [v6 componentsJoinedByString:@", "];
  }
  else
  {
    unint64_t v9 = &stru_1EFF84648;
  }

  return v9;
}

+ (id)placeTypeToString:(unint64_t)a3
{
  if (a3 > 4) {
    return @"NonClassified";
  }
  else {
    return off_1E5D73AB8[a3];
  }
}

- (BOOL)isEqualToPlaceInference:(id)a3
{
  id v7 = a3;
  uint64_t v8 = v7;
  referenceLocation = self->_referenceLocation;
  uint64_t v10 = referenceLocation;
  if (referenceLocation)
  {
LABEL_4:
    uint64_t v4 = [v8 referenceLocation];
    char v40 = [(RTLocation *)v10 isEqual:v4];

    if (referenceLocation) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  uint64_t v3 = [v7 referenceLocation];
  if (v3)
  {
    uint64_t v10 = self->_referenceLocation;
    goto LABEL_4;
  }
  char v40 = 1;
LABEL_7:

LABEL_8:
  mapItem = self->_mapItem;
  int v12 = mapItem;
  if (mapItem) {
    goto LABEL_11;
  }
  uint64_t v4 = [v8 mapItem];
  if (v4)
  {
    int v12 = self->_mapItem;
LABEL_11:
    referenceLocation = [v8 mapItem];
    char v39 = [(RTMapItem *)v12 isEqual:referenceLocation];

    if (mapItem) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  char v39 = 1;
LABEL_14:

LABEL_15:
  finerGranularityMapItem = self->_finerGranularityMapItem;
  __int16 v14 = finerGranularityMapItem;
  if (finerGranularityMapItem) {
    goto LABEL_18;
  }
  referenceLocation = [v8 finerGranularityMapItem];
  if (referenceLocation)
  {
    __int16 v14 = self->_finerGranularityMapItem;
LABEL_18:
    char v5 = [v8 finerGranularityMapItem];
    char v38 = [(RTMapItem *)v14 isEqual:v5];

    if (finerGranularityMapItem) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  char v38 = 1;
LABEL_21:

LABEL_22:
  unint64_t userType = self->_userType;
  if (userType)
  {
LABEL_25:
    BOOL v37 = userType != [v8 userType];
    goto LABEL_26;
  }
  if ([v8 userType])
  {
    unint64_t userType = self->_userType;
    goto LABEL_25;
  }
  BOOL v37 = 0;
LABEL_26:
  unint64_t userTypeSource = self->_userTypeSource;
  if (userTypeSource)
  {
LABEL_29:
    BOOL v36 = userTypeSource != [v8 userTypeSource];
    goto LABEL_30;
  }
  if ([v8 userTypeSource])
  {
    unint64_t userTypeSource = self->_userTypeSource;
    goto LABEL_29;
  }
  BOOL v36 = 0;
LABEL_30:
  unint64_t placeType = self->_placeType;
  if (placeType)
  {
LABEL_33:
    BOOL v18 = placeType != [v8 placeType];
    goto LABEL_34;
  }
  if ([v8 placeType])
  {
    unint64_t placeType = self->_placeType;
    goto LABEL_33;
  }
  BOOL v18 = 0;
LABEL_34:
  double confidence = self->_confidence;
  if (confidence != 0.0)
  {
LABEL_37:
    [v8 confidence];
    BOOL v22 = confidence != v21;
    goto LABEL_38;
  }
  [v8 confidence];
  if (v20 != 0.0)
  {
    double confidence = self->_confidence;
    goto LABEL_37;
  }
  BOOL v22 = 0;
LABEL_38:
  double finerGranularityMapItemConfidence = self->_finerGranularityMapItemConfidence;
  if (finerGranularityMapItemConfidence != 0.0)
  {
LABEL_41:
    [v8 finerGranularityMapItemConfidence];
    BOOL v26 = finerGranularityMapItemConfidence != v25;
    goto LABEL_42;
  }
  [v8 finerGranularityMapItemConfidence];
  if (v24 != 0.0)
  {
    double finerGranularityMapItemConfidence = self->_finerGranularityMapItemConfidence;
    goto LABEL_41;
  }
  BOOL v26 = 0;
LABEL_42:
  preferredName = self->_preferredName;
  v28 = preferredName;
  if (preferredName) {
    goto LABEL_45;
  }
  char v5 = [v8 preferredName];
  if (v5)
  {
    v28 = self->_preferredName;
LABEL_45:
    v29 = [v8 preferredName];
    char v30 = [(NSString *)v28 isEqualToString:v29];

    if (preferredName) {
      goto LABEL_54;
    }
    goto LABEL_53;
  }
  char v30 = 1;
LABEL_53:

LABEL_54:
  loiIdentifier = self->_loiIdentifier;
  id v32 = loiIdentifier;
  if (!loiIdentifier)
  {
    char v5 = [v8 loiIdentifier];
    if (!v5)
    {
      char v34 = 1;
LABEL_60:

      goto LABEL_61;
    }
    id v32 = self->_loiIdentifier;
  }
  v33 = [v8 loiIdentifier];
  char v34 = [(NSUUID *)v32 isEqual:v33];

  if (!loiIdentifier) {
    goto LABEL_60;
  }
LABEL_61:

  return v30 & ~(v40 & v39 & v38 ^ 1 | (v37 || v36 || v18 || v22 || v26)) & v34;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (RTPlaceInference *)a3;
  char v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(RTPlaceInference *)self isEqualToPlaceInference:v5];

  return v6;
}

- (RTMapItem)finerGranularityMapItem
{
  return self->_finerGranularityMapItem;
}

- (double)finerGranularityMapItemConfidence
{
  return self->_finerGranularityMapItemConfidence;
}

@end
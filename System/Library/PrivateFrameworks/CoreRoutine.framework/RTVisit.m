@interface RTVisit
+ (BOOL)supportsSecureCoding;
+ (BOOL)validVisitSources:(id)a3;
+ (id)stringFromVisitIncidentType:(int64_t)a3;
+ (int64_t)visitIncidentTypeFromString:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToVisit:(id)a3;
- (NSDate)date;
- (NSDate)entry;
- (NSDate)exit;
- (RTLocation)location;
- (RTPlaceInference)placeInference;
- (RTVisit)init;
- (RTVisit)initWithCoder:(id)a3;
- (RTVisit)initWithDate:(id)a3 type:(int64_t)a4 location:(id)a5 entry:(id)a6 exit:(id)a7 dataPointCount:(int64_t)a8 confidence:(double)a9 placeInference:(id)a10;
- (RTVisit)initWithDate:(id)a3 type:(int64_t)a4 location:(id)a5 entry:(id)a6 exit:(id)a7 dataPointCount:(int64_t)a8 confidence:(double)a9 placeInference:(id)a10 source:(int64_t)a11;
- (double)confidence;
- (id)description;
- (int64_t)dataPointCount;
- (int64_t)source;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setPlaceInference:(id)a3;
@end

@implementation RTVisit

+ (BOOL)validVisitSources:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "unsignedIntValue", (void)v10) > 3)
        {
          BOOL v8 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 1;
LABEL_11:

  return v8;
}

- (NSDate)entry
{
  return self->_entry;
}

- (NSDate)exit
{
  return self->_exit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeInference, 0);
  objc_storeStrong((id *)&self->_exit, 0);
  objc_storeStrong((id *)&self->_entry, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

- (RTVisit)initWithDate:(id)a3 type:(int64_t)a4 location:(id)a5 entry:(id)a6 exit:(id)a7 dataPointCount:(int64_t)a8 confidence:(double)a9 placeInference:(id)a10 source:(int64_t)a11
{
  id v18 = a3;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a10;
  if (!v18)
  {
    v33 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    *(_WORD *)buf = 0;
    v34 = "Invalid parameter not satisfying: date";
LABEL_21:
    _os_log_error_impl(&dword_1A8FEF000, v33, OS_LOG_TYPE_ERROR, v34, buf, 2u);
    goto LABEL_22;
  }
  if (!v19)
  {
    v33 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    *(_WORD *)buf = 0;
    v34 = "Invalid parameter not satisfying: location";
    goto LABEL_21;
  }
  if (!v20)
  {
    v33 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    *(_WORD *)buf = 0;
    v34 = "Invalid parameter not satisfying: entry";
    goto LABEL_21;
  }
  if (v21 && ([v20 isOnOrBefore:v21] & 1) == 0)
  {
    v33 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v34 = "Invalid parameter not satisfying: !exit || [entry isOnOrBefore:exit]";
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  if (a9 < 0.0 || a9 > 1.0)
  {
    v33 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v34 = "Invalid parameter not satisfying: confidence >= RTVisitConfidenceLow && confidence <= RTVisitConfidenceHigh";
      goto LABEL_21;
    }
LABEL_22:

    v32 = 0;
    goto LABEL_23;
  }
  v36.receiver = self;
  v36.super_class = (Class)RTVisit;
  v23 = [(RTVisit *)&v36 init];
  if (v23)
  {
    uint64_t v24 = [v18 copy];
    date = v23->_date;
    v23->_date = (NSDate *)v24;

    v23->_type = a4;
    uint64_t v26 = [v19 copy];
    location = v23->_location;
    v23->_location = (RTLocation *)v26;

    uint64_t v28 = [v20 copy];
    entry = v23->_entry;
    v23->_entry = (NSDate *)v28;

    uint64_t v30 = [v21 copy];
    exit = v23->_exit;
    v23->_exit = (NSDate *)v30;

    v23->_dataPointCount = a8;
    v23->_confidence = a9;
    objc_storeStrong((id *)&v23->_placeInference, a10);
    v23->_source = a11;
  }
  self = v23;
  v32 = self;
LABEL_23:

  return v32;
}

- (RTVisit)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDate_type_location_entry_exit_dataPointCount_confidence_placeInference_source_);
}

- (RTVisit)initWithDate:(id)a3 type:(int64_t)a4 location:(id)a5 entry:(id)a6 exit:(id)a7 dataPointCount:(int64_t)a8 confidence:(double)a9 placeInference:(id)a10
{
  return [(RTVisit *)self initWithDate:a3 type:a4 location:a5 entry:a6 exit:a7 dataPointCount:a8 confidence:a9 placeInference:a10 source:0];
}

- (id)description
{
  v16 = NSString;
  v17 = [(RTVisit *)self date];
  id v3 = [v17 stringFromDate];
  uint64_t v4 = +[RTVisit stringFromVisitIncidentType:[(RTVisit *)self type]];
  uint64_t v5 = [(RTVisit *)self location];
  uint64_t v6 = [(RTVisit *)self entry];
  v7 = [v6 stringFromDate];
  BOOL v8 = [(RTVisit *)self exit];
  v9 = [v8 stringFromDate];
  int64_t v10 = [(RTVisit *)self dataPointCount];
  [(RTVisit *)self confidence];
  uint64_t v12 = v11;
  long long v13 = [(RTVisit *)self placeInference];
  v14 = [v16 stringWithFormat:@"date, %@, type, %@, location, %@, entry, %@, exit, %@, dataPointCount, %lu, confidence, %.2f, placeInference, %@, source, %lu", v3, v4, v5, v7, v9, v10, v12, v13, -[RTVisit source](self, "source")];

  return v14;
}

+ (id)stringFromVisitIncidentType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    return @"RTVisitTypeUnknown";
  }
  else {
    return off_1E5D73AE0[a3 - 1];
  }
}

+ (int64_t)visitIncidentTypeFromString:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3)
  {
    uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315394;
      v9 = "+[RTVisit visitIncidentTypeFromString:]";
      __int16 v10 = 1024;
      LODWORD(v11) = 126;
      _os_log_error_impl(&dword_1A8FEF000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: typeString (in %s:%d)", (uint8_t *)&v8, 0x12u);
    }
  }
  if (([v3 isEqualToString:@"RTVisitTypeUnknown"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"RTVisitTypeEntry"])
    {
      int64_t v5 = 1;
      goto LABEL_13;
    }
    if ([v3 isEqualToString:@"RTVisitTypeEntryResume"])
    {
      int64_t v5 = 2;
      goto LABEL_13;
    }
    if ([v3 isEqualToString:@"RTVisitTypeExit"])
    {
      int64_t v5 = 3;
      goto LABEL_13;
    }
    v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412802;
      v9 = (const char *)v3;
      __int16 v10 = 2080;
      uint64_t v11 = "+[RTVisit visitIncidentTypeFromString:]";
      __int16 v12 = 1024;
      int v13 = 136;
      _os_log_error_impl(&dword_1A8FEF000, v7, OS_LOG_TYPE_ERROR, "Invalid type string, %@. (in %s:%d)", (uint8_t *)&v8, 0x1Cu);
    }
  }
  int64_t v5 = 0;
LABEL_13:

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  date = self->_date;
  id v5 = a3;
  [v5 encodeObject:date forKey:@"date"];
  uint64_t v6 = [NSNumber numberWithInteger:self->_type];
  [v5 encodeObject:v6 forKey:@"type"];

  [v5 encodeObject:self->_location forKey:@"location"];
  [v5 encodeObject:self->_entry forKey:@"entry"];
  [v5 encodeObject:self->_exit forKey:@"exit"];
  v7 = [NSNumber numberWithInteger:self->_dataPointCount];
  [v5 encodeObject:v7 forKey:@"dataPointCount"];

  int v8 = [NSNumber numberWithDouble:self->_confidence];
  [v5 encodeObject:v8 forKey:@"confidence"];

  [v5 encodeObject:self->_placeInference forKey:@"placeInference"];
  id v9 = [NSNumber numberWithInteger:self->_source];
  [v5 encodeObject:v9 forKey:@"source"];
}

- (RTVisit)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
  int64_t v7 = [v6 integerValue];
  self->_type = v7;

  int v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"location"];
  id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"entry"];
  __int16 v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"exit"];
  uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dataPointCount"];
  uint64_t v12 = [v11 integerValue];

  int v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"confidence"];
  double v14 = (double)[v13 integerValue];

  uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"placeInference"];
  v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"source"];

  uint64_t v17 = [v16 unsignedIntValue];
  id v18 = [(RTVisit *)self initWithDate:v5 type:v7 location:v8 entry:v9 exit:v10 dataPointCount:v12 confidence:v14 placeInference:v15 source:v17];

  return v18;
}

- (BOOL)isEqualToVisit:(id)a3
{
  id v8 = a3;
  id v9 = v8;
  date = self->_date;
  uint64_t v11 = date;
  if (date)
  {
LABEL_4:
    uint64_t v12 = [v9 date];
    char v37 = [(NSDate *)v11 isEqualToDate:v12];

    if (date) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  id v3 = [v8 date];
  if (v3)
  {
    uint64_t v11 = self->_date;
    goto LABEL_4;
  }
  char v37 = 1;
LABEL_7:

LABEL_8:
  int64_t type = self->_type;
  uint64_t v35 = [v9 type];
  location = self->_location;
  double v14 = location;
  if (location) {
    goto LABEL_11;
  }
  date = [v9 location];
  if (date)
  {
    double v14 = self->_location;
LABEL_11:
    id v4 = [v9 location];
    char v34 = [(RTLocation *)v14 isEqualToLocation:v4];

    if (location) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  char v34 = 1;
LABEL_14:

LABEL_15:
  entry = self->_entry;
  v16 = entry;
  if (entry) {
    goto LABEL_18;
  }
  id v4 = [v9 entry];
  if (v4)
  {
    v16 = self->_entry;
LABEL_18:
    id v5 = [v9 entry];
    char v17 = [(NSDate *)v16 isEqualToDate:v5];

    if (entry) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  char v17 = 1;
LABEL_21:

LABEL_22:
  exit = self->_exit;
  id v19 = exit;
  if (exit) {
    goto LABEL_25;
  }
  id v5 = [v9 exit];
  if (v5)
  {
    id v19 = self->_exit;
LABEL_25:
    uint64_t v6 = [v9 exit];
    char v20 = [(NSDate *)v19 isEqualToDate:v6];

    if (exit) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  char v20 = 1;
LABEL_28:

LABEL_29:
  int64_t dataPointCount = self->_dataPointCount;
  uint64_t v22 = [v9 dataPointCount];
  double confidence = self->_confidence;
  [v9 confidence];
  double v25 = v24;
  placeInference = self->_placeInference;
  v27 = placeInference;
  if (placeInference) {
    goto LABEL_32;
  }
  uint64_t v6 = [v9 placeInference];
  if (v6)
  {
    v27 = self->_placeInference;
LABEL_32:
    uint64_t v28 = [v9 placeInference];
    char v29 = [(RTPlaceInference *)v27 isEqual:v28];

    if (placeInference) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
  char v29 = 1;
LABEL_35:

LABEL_36:
  char v30 = v37;
  if (type != v35) {
    char v30 = 0;
  }
  char v31 = v30 & v34 & v17 & v20;
  if (dataPointCount != v22) {
    char v31 = 0;
  }
  if (confidence != v25) {
    char v31 = 0;
  }
  char v32 = v31 & v29;

  return v32;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RTVisit *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(RTVisit *)self isEqualToVisit:v5];

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSDate *)self->_date hash];
  id v4 = [NSNumber numberWithInteger:self->_type];
  uint64_t v5 = [v4 hash];
  unint64_t v6 = v3 ^ [(RTLocation *)self->_location hash];
  uint64_t v7 = v5 ^ v6 ^ [(NSDate *)self->_entry hash];
  uint64_t v8 = [(NSDate *)self->_exit hash];
  id v9 = [NSNumber numberWithInteger:self->_dataPointCount];
  uint64_t v10 = v7 ^ v8 ^ [v9 hash];
  uint64_t v11 = [NSNumber numberWithDouble:self->_confidence];
  uint64_t v12 = [v11 hash];
  unint64_t v13 = v10 ^ v12 ^ [(RTPlaceInference *)self->_placeInference hash];

  return v13;
}

- (NSDate)date
{
  return self->_date;
}

- (int64_t)type
{
  return self->_type;
}

- (RTLocation)location
{
  return self->_location;
}

- (double)confidence
{
  return self->_confidence;
}

- (int64_t)source
{
  return self->_source;
}

- (RTPlaceInference)placeInference
{
  return self->_placeInference;
}

- (void)setPlaceInference:(id)a3
{
}

- (int64_t)dataPointCount
{
  return self->_dataPointCount;
}

@end
@interface RTLocationOfInterest
+ (BOOL)locationOfInterestTypeIsValid:(int64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (id)geoMapItemSourceToString:(unint64_t)a3;
+ (id)locationOfInterestTypeSourceToString:(unint64_t)a3;
+ (id)locationOfInterestTypeToString:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)visits;
- (NSString)customLabel;
- (NSString)preferredName;
- (NSUUID)identifier;
- (RTLocation)location;
- (RTLocationOfInterest)init;
- (RTLocationOfInterest)initWithCoder:(id)a3;
- (RTLocationOfInterest)initWithLocation:(id)a3 confidence:(double)a4 identifier:(id)a5 type:(int64_t)a6 typeSource:(unint64_t)a7 visits:(id)a8 customLabel:(id)a9 mapItem:(id)a10;
- (RTMapItem)mapItem;
- (double)confidence;
- (double)latitude;
- (double)longitude;
- (double)uncertainty;
- (id)description;
- (id)nameFromType:(int64_t)a3;
- (id)pruneVisitsWithDateInterval:(id)a3;
- (int64_t)recentCompare:(id)a3;
- (int64_t)type;
- (unint64_t)geoMapItemSource;
- (unint64_t)hash;
- (unint64_t)typeSource;
- (void)encodeWithCoder:(id)a3;
- (void)setLatitude:(double)a3;
- (void)setLongitude:(double)a3;
- (void)setUncertainty:(double)a3;
@end

@implementation RTLocationOfInterest

- (RTMapItem)mapItem
{
  return self->_mapItem;
}

- (int64_t)type
{
  return self->_type;
}

- (unint64_t)hash
{
  v2 = [(RTLocationOfInterest *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (RTLocation)location
{
  return self->_location;
}

- (NSString)customLabel
{
  return self->_customLabel;
}

- (void)encodeWithCoder:(id)a3
{
  location = self->_location;
  id v5 = a3;
  [v5 encodeObject:location forKey:@"location"];
  [v5 encodeDouble:@"confidence" forKey:self->_confidence];
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
  [v5 encodeInteger:self->_type forKey:@"type"];
  [v5 encodeInteger:self->_typeSource forKey:@"typeSource"];
  [v5 encodeObject:self->_visits forKey:@"visits"];
  [v5 encodeObject:self->_customLabel forKey:@"customLabel"];
  [v5 encodeObject:self->_mapItem forKey:@"mapItem"];
}

- (RTLocationOfInterest)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"location"];
  [v4 decodeDoubleForKey:@"confidence"];
  double v7 = v6;
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  uint64_t v9 = [v4 decodeIntegerForKey:@"type"];
  uint64_t v10 = [v4 decodeIntegerForKey:@"typeSource"];
  v11 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v12 = objc_opt_class();
  v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v14 = [v4 decodeObjectOfClasses:v13 forKey:@"visits"];

  v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"customLabel"];
  v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mapItem"];

  v17 = [(RTLocationOfInterest *)self initWithLocation:v5 confidence:v8 identifier:v9 type:v10 typeSource:v14 visits:v15 customLabel:v7 mapItem:v16];
  return v17;
}

- (RTLocationOfInterest)initWithLocation:(id)a3 confidence:(double)a4 identifier:(id)a5 type:(int64_t)a6 typeSource:(unint64_t)a7 visits:(id)a8 customLabel:(id)a9 mapItem:(id)a10
{
  id v31 = a3;
  id v18 = a5;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  if (v18)
  {
    v32.receiver = self;
    v32.super_class = (Class)RTLocationOfInterest;
    v22 = [(RTLocationOfInterest *)&v32 init];
    v23 = v22;
    if (v22)
    {
      objc_storeStrong((id *)&v22->_location, a3);
      v23->_confidence = a4;
      uint64_t v24 = [v18 copy];
      identifier = v23->_identifier;
      v23->_identifier = (NSUUID *)v24;

      v23->_type = a6;
      v23->_typeSource = a7;
      uint64_t v26 = [v19 copy];
      visits = v23->_visits;
      v23->_visits = (NSArray *)v26;

      objc_storeStrong((id *)&v23->_customLabel, a9);
      objc_storeStrong((id *)&v23->_mapItem, a10);
    }
    self = v23;
    v28 = self;
  }
  else
  {
    v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A8FEF000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier", buf, 2u);
    }

    v28 = 0;
  }

  return v28;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customLabel, 0);
  objc_storeStrong((id *)&self->_visits, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)locationOfInterestTypeIsValid:(int64_t)a3
{
  return (unint64_t)(a3 + 1) < 5;
}

+ (id)locationOfInterestTypeToString:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return @"Unknown";
  }
  else {
    return off_1E5D74620[a3];
  }
}

+ (id)locationOfInterestTypeSourceToString:(unint64_t)a3
{
  id v4 = [MEMORY[0x1E4F1CA48] array];
  id v5 = v4;
  if (!a3)
  {
    double v6 = @"None";
LABEL_16:
    [v5 addObject:v6];
    goto LABEL_17;
  }
  if (a3)
  {
    [v4 addObject:@"MeCard"];
    if ((a3 & 2) == 0)
    {
LABEL_4:
      if ((a3 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_12;
    }
  }
  else if ((a3 & 2) == 0)
  {
    goto LABEL_4;
  }
  [v5 addObject:@"Aggregate Inferred"];
  if ((a3 & 4) == 0)
  {
LABEL_5:
    if ((a3 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  [v5 addObject:@"Pattern Based"];
  if ((a3 & 8) == 0)
  {
LABEL_6:
    if ((a3 & 0x10) == 0) {
      goto LABEL_7;
    }
LABEL_14:
    [v5 addObject:@"User"];
    if ((a3 & 0x20) == 0) {
      goto LABEL_17;
    }
    goto LABEL_15;
  }
LABEL_13:
  [v5 addObject:@"Top Median"];
  if ((a3 & 0x10) != 0) {
    goto LABEL_14;
  }
LABEL_7:
  if ((a3 & 0x20) != 0)
  {
LABEL_15:
    double v6 = @"Fallback";
    goto LABEL_16;
  }
LABEL_17:
  double v7 = [v5 componentsJoinedByString:@", "];

  return v7;
}

- (unint64_t)geoMapItemSource
{
  unint64_t v3 = [(RTMapItem *)self->_mapItem source] & 1;
  unint64_t v4 = v3 | (2 * (([(RTMapItem *)self->_mapItem source] >> 2) & 1));
  unint64_t v5 = [(RTMapItem *)self->_mapItem source] & 8;
  unint64_t v6 = v5 | [(RTMapItem *)self->_mapItem source] & 0x10;
  unint64_t v7 = v4 | v6 | [(RTMapItem *)self->_mapItem source] & 0x40;
  unint64_t v8 = [(RTMapItem *)self->_mapItem source] & 0x80;
  unint64_t v9 = v8 | [(RTMapItem *)self->_mapItem source] & 0x100;
  unint64_t v10 = v9 | [(RTMapItem *)self->_mapItem source] & 0x200;
  unint64_t v11 = v7 | v10 | [(RTMapItem *)self->_mapItem source] & 0x400;
  uint64_t v12 = ((unsigned __int16)[(RTMapItem *)self->_mapItem source] << 10) & 0x800;
  uint64_t v13 = v12 | (2 * [(RTMapItem *)self->_mapItem source]) & 0x1000;
  uint64_t v14 = v13 | (2 * [(RTMapItem *)self->_mapItem source]) & 0x2000;
  uint64_t v15 = v11 | v14 | (2 * [(RTMapItem *)self->_mapItem source]) & 0x4000;
  uint64_t v16 = (unsigned __int16)(2 * [(RTMapItem *)self->_mapItem source]) & 0x8000;
  return v15 | v16 | (2 * [(RTMapItem *)self->_mapItem source]) & 0x10000;
}

+ (id)geoMapItemSourceToString:(unint64_t)a3
{
  unint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v5 = v4;
  if (!a3)
  {
    unint64_t v6 = @"None";
LABEL_38:
    [v5 addObject:v6];
    goto LABEL_39;
  }
  if (a3)
  {
    [v4 addObject:@"Reverse Geocode"];
    if ((a3 & 2) == 0)
    {
LABEL_4:
      if ((a3 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_23;
    }
  }
  else if ((a3 & 2) == 0)
  {
    goto LABEL_4;
  }
  [v5 addObject:@"Contacts"];
  if ((a3 & 4) == 0)
  {
LABEL_5:
    if ((a3 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_24;
  }
LABEL_23:
  [v5 addObject:@"Maps Support"];
  if ((a3 & 8) == 0)
  {
LABEL_6:
    if ((a3 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_25;
  }
LABEL_24:
  [v5 addObject:@"User"];
  if ((a3 & 0x10) == 0)
  {
LABEL_7:
    if ((a3 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_26;
  }
LABEL_25:
  [v5 addObject:@"Maps Support Favorite"];
  if ((a3 & 0x20) == 0)
  {
LABEL_8:
    if ((a3 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_27;
  }
LABEL_26:
  [v5 addObject:@"Maps Support History Entry"];
  if ((a3 & 0x40) == 0)
  {
LABEL_9:
    if ((a3 & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_28;
  }
LABEL_27:
  [v5 addObject:@"Maps Support History Entry Route"];
  if ((a3 & 0x80) == 0)
  {
LABEL_10:
    if ((a3 & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_29;
  }
LABEL_28:
  [v5 addObject:@"Maps Support History Entry Place Display"];
  if ((a3 & 0x100) == 0)
  {
LABEL_11:
    if ((a3 & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_30;
  }
LABEL_29:
  [v5 addObject:@"Event Kit"];
  if ((a3 & 0x200) == 0)
  {
LABEL_12:
    if ((a3 & 0x400) == 0) {
      goto LABEL_13;
    }
    goto LABEL_31;
  }
LABEL_30:
  [v5 addObject:@"Local Search"];
  if ((a3 & 0x400) == 0)
  {
LABEL_13:
    if ((a3 & 0x800) == 0) {
      goto LABEL_14;
    }
    goto LABEL_32;
  }
LABEL_31:
  [v5 addObject:@"MapItem Handle"];
  if ((a3 & 0x800) == 0)
  {
LABEL_14:
    if ((a3 & 0x1000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_33;
  }
LABEL_32:
  [v5 addObject:@"Forward Geocode"];
  if ((a3 & 0x1000) == 0)
  {
LABEL_15:
    if ((a3 & 0x2000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_34;
  }
LABEL_33:
  [v5 addObject:@"Proactive Experts"];
  if ((a3 & 0x2000) == 0)
  {
LABEL_16:
    if ((a3 & 0x4000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_35;
  }
LABEL_34:
  [v5 addObject:@"Portrait"];
  if ((a3 & 0x4000) == 0)
  {
LABEL_17:
    if ((a3 & 0x8000) == 0) {
      goto LABEL_18;
    }
LABEL_36:
    [v5 addObject:@"Blue POI"];
    if ((a3 & 0x10000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_37;
  }
LABEL_35:
  [v5 addObject:@"Learned Place"];
  if ((a3 & 0x8000) != 0) {
    goto LABEL_36;
  }
LABEL_18:
  if ((a3 & 0x10000) != 0)
  {
LABEL_37:
    unint64_t v6 = @"MapItemURL";
    goto LABEL_38;
  }
LABEL_39:
  unint64_t v7 = [v5 componentsJoinedByString:@", "];

  return v7;
}

- (double)latitude
{
  [(RTLocation *)self->_location latitude];
  return result;
}

- (void)setLatitude:(double)a3
{
}

- (double)longitude
{
  [(RTLocation *)self->_location longitude];
  return result;
}

- (void)setLongitude:(double)a3
{
}

- (double)uncertainty
{
  [(RTLocation *)self->_location uncertainty];
  return result;
}

- (void)setUncertainty:(double)a3
{
}

- (RTLocationOfInterest)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithLocation_confidence_identifier_type_typeSource_visits_customLabel_mapItem_);
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v5 = (RTLocationOfInterest *)a3;
  unint64_t v6 = v5;
  if (v5 == self)
  {
    char v11 = 1;
  }
  else
  {
    if (v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unint64_t v7 = v6;
        unint64_t v8 = [(RTLocationOfInterest *)self identifier];
        if (v8
          || ([(RTLocationOfInterest *)v7 identifier],
              (unint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          unint64_t v9 = [(RTLocationOfInterest *)self identifier];
          unint64_t v10 = [(RTLocationOfInterest *)v7 identifier];
          char v11 = [v9 isEqual:v10];

          if (v8)
          {
LABEL_12:

            goto LABEL_13;
          }
        }
        else
        {
          char v11 = 1;
        }

        goto LABEL_12;
      }
    }
    char v11 = 0;
  }
LABEL_13:

  return v11;
}

- (id)description
{
  unint64_t v3 = NSString;
  unint64_t v4 = [(RTLocationOfInterest *)self identifier];
  unint64_t v5 = [v4 UUIDString];
  unint64_t v6 = [(RTLocationOfInterest *)self location];
  [(RTLocationOfInterest *)self confidence];
  uint64_t v8 = v7;
  unint64_t v9 = +[RTLocationOfInterest locationOfInterestTypeToString:[(RTLocationOfInterest *)self type]];
  unint64_t v10 = +[RTLocationOfInterest locationOfInterestTypeSourceToString:[(RTLocationOfInterest *)self typeSource]];
  char v11 = [(RTLocationOfInterest *)self mapItem];
  uint64_t v12 = [(RTLocationOfInterest *)self customLabel];
  uint64_t v13 = [(RTLocationOfInterest *)self preferredName];
  uint64_t v14 = [v3 stringWithFormat:@"id, %@, %@, confidence, %f, type, %@, typeSource, %@, mapItem, %@, customLabel, %@, preferredName, %@", v5, v6, v8, v9, v10, v11, v12, v13];

  return v14;
}

- (NSString)preferredName
{
  if ([(NSString *)self->_customLabel length])
  {
    unint64_t v3 = self->_customLabel;
    goto LABEL_9;
  }
  unint64_t v4 = [(RTLocationOfInterest *)self nameFromType:self->_type];
  if ([v4 length])
  {
    unint64_t v5 = v4;
  }
  else
  {
    unint64_t v6 = [(RTMapItem *)self->_mapItem name];
    uint64_t v7 = [v6 length];

    mapItem = self->_mapItem;
    if (!v7)
    {
      unint64_t v10 = [(RTMapItem *)mapItem address];
      unint64_t v3 = [v10 mergedThoroughfare];

      goto LABEL_8;
    }
    unint64_t v5 = [(RTMapItem *)mapItem name];
  }
  unint64_t v3 = v5;
LABEL_8:

LABEL_9:
  return v3;
}

- (id)nameFromType:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
  {
    unint64_t v5 = 0;
  }
  else
  {
    unint64_t v5 = objc_msgSend(MEMORY[0x1E4F28B50], "_coreroutine_LocalizedStringForKey:", off_1E5D74620[a3], v3);
  }
  return v5;
}

- (int64_t)recentCompare:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(RTLocationOfInterest *)self visits];
  unint64_t v6 = [v5 lastObject];

  uint64_t v7 = [v6 exitDate];
  uint64_t v8 = [v4 visits];
  unint64_t v9 = [v8 lastObject];

  unint64_t v10 = [v9 exitDate];
  int64_t v11 = [v7 compare:v10];
  if (!v11)
  {
    uint64_t v12 = [(RTLocationOfInterest *)self visits];
    unint64_t v13 = [v12 count];

    uint64_t v14 = [v4 visits];
    unint64_t v15 = [v14 count];

    if (v13 < v15) {
      int64_t v11 = -1;
    }
    else {
      int64_t v11 = v13 > v15;
    }
  }

  return v11;
}

- (id)pruneVisitsWithDateInterval:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v35 = a3;
  if (v35)
  {
    v34 = [MEMORY[0x1E4F1CA48] array];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v33 = self;
    id obj = [(RTLocationOfInterest *)self visits];
    uint64_t v4 = [obj countByEnumeratingWithState:&v37 objects:v51 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v38 != v6) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          unint64_t v9 = (void *)MEMORY[0x1AD0EBD40]();
          unint64_t v10 = [v8 exitDate];
          int64_t v11 = [v8 entryDate];
          int v12 = [v10 isOnOrBefore:v11];

          if (v12)
          {
            unint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              uint64_t v14 = [v8 identifier];
              unint64_t v15 = [v8 entryDate];
              uint64_t v16 = [v15 stringFromDate];
              v17 = [v8 exitDate];
              id v18 = [v17 stringFromDate];
              *(_DWORD *)buf = 138413314;
              v42 = v14;
              __int16 v43 = 2112;
              v44 = v16;
              __int16 v45 = 2112;
              v46 = v18;
              __int16 v47 = 2080;
              v48 = "-[RTLocationOfInterest pruneVisitsWithDateInterval:]";
              __int16 v49 = 1024;
              int v50 = 457;
              _os_log_error_impl(&dword_1A8FEF000, v13, OS_LOG_TYPE_ERROR, "location of interest visit, %@, has one or more malformed dates, entry, %@, exit, %@ (in %s:%d)", buf, 0x30u);
            }
          }
          else
          {
            id v19 = objc_alloc(MEMORY[0x1E4F28C18]);
            id v20 = [v8 entryDate];
            id v21 = [v8 exitDate];
            unint64_t v13 = [v19 initWithStartDate:v20 endDate:v21];

            if ([v13 intersectsDateInterval:v35]) {
              [v34 addObject:v8];
            }
          }
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v37 objects:v51 count:16];
      }
      while (v5);
    }

    v22 = [RTLocationOfInterest alloc];
    v23 = [(RTLocationOfInterest *)v33 location];
    [(RTLocationOfInterest *)v33 confidence];
    double v25 = v24;
    uint64_t v26 = [(RTLocationOfInterest *)v33 identifier];
    uint64_t v27 = [(RTLocationOfInterest *)v33 type];
    uint64_t v28 = [(RTLocationOfInterest *)v33 typeSource];
    v29 = [(RTLocationOfInterest *)v33 customLabel];
    v30 = [(RTLocationOfInterest *)v33 mapItem];
    id v31 = [(RTLocationOfInterest *)v22 initWithLocation:v23 confidence:v26 identifier:v27 type:v28 typeSource:v34 visits:v29 customLabel:v25 mapItem:v30];
  }
  else
  {
    id v31 = self;
  }

  return v31;
}

- (double)confidence
{
  return self->_confidence;
}

- (unint64_t)typeSource
{
  return self->_typeSource;
}

- (NSArray)visits
{
  return self->_visits;
}

@end
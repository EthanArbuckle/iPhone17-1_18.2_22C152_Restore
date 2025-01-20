@interface CLSLocationOfInterest
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CLCircularRegion)placemarkRegion;
- (CLLocation)location;
- (CLSLocationOfInterest)initWithCoder:(id)a3;
- (CLSLocationOfInterest)initWithIdentifier:(id)a3 locationOfInterestType:(int64_t)a4 location:(id)a5 placemarkRegion:(id)a6 businessItemMuid:(unint64_t)a7 radius:(double)a8;
- (NSArray)visits;
- (NSUUID)identifier;
- (double)placemarkLocationDistanceFromLocation:(id)a3 locationCache:(id)a4;
- (double)radius;
- (id)description;
- (id)placemarkWithLocationCache:(id)a3;
- (int64_t)type;
- (unint64_t)businessItemMuid;
- (unint64_t)hash;
- (void)addVisit:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)removeVisit:(id)a3;
@end

@implementation CLSLocationOfInterest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placemarkRegion, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_placemark, 0);
  objc_storeStrong((id *)&self->_visits, 0);
}

- (unint64_t)businessItemMuid
{
  return self->_businessItemMuid;
}

- (NSArray)visits
{
  return &self->_visits->super;
}

- (double)radius
{
  return self->_radius;
}

- (CLCircularRegion)placemarkRegion
{
  return self->_placemarkRegion;
}

- (CLLocation)location
{
  return self->_location;
}

- (int64_t)type
{
  return self->_type;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (unint64_t)hash
{
  return [(NSUUID *)self->_identifier hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CLSLocationOfInterest *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      identifier = self->_identifier;
      v6 = [(CLSLocationOfInterest *)v4 identifier];
      char v7 = [(NSUUID *)identifier isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (id)description
{
  placemark = self->_placemark;
  if (placemark)
  {
    v4 = [(CLSLitePlacemark *)placemark location];
    [v4 coordinate];
    uint64_t v6 = v5;
    uint64_t v8 = v7;

    v9 = @"placemark";
  }
  else
  {
    [(CLCircularRegion *)self->_placemarkRegion center];
    uint64_t v6 = v10;
    uint64_t v8 = v11;
    v9 = @"region";
  }
  v12 = NSString;
  v20.receiver = self;
  v20.super_class = (Class)CLSLocationOfInterest;
  uint64_t v13 = [(CLSLocationOfInterest *)&v20 description];
  v14 = (void *)v13;
  int64_t type = self->_type;
  v16 = @"Unknown";
  if (type == 1) {
    v16 = @"Work";
  }
  if (type) {
    v17 = v16;
  }
  else {
    v17 = @"Home";
  }
  v18 = [v12 stringWithFormat:@"%@ - {%f, %f} (%@) - %@", v13, v6, v8, v9, v17];

  return v18;
}

- (double)placemarkLocationDistanceFromLocation:(id)a3 locationCache:(id)a4
{
  id v6 = a4;
  double v7 = *MEMORY[0x1E4F1E568];
  [a3 coordinate];
  if (CLLocationCoordinate2DIsValid(v19))
  {
    placemarkRegion = self->_placemarkRegion;
    if (placemarkRegion)
    {
      [(CLCircularRegion *)placemarkRegion center];
      if (CLLocationCoordinate2DIsValid(v20))
      {
        CLLocationCoordinate2DGetDistanceFrom();
        double v7 = v9;
      }
      uint64_t v10 = [(CLSLocationOfInterest *)self placemarkWithLocationCache:v6];
      uint64_t v11 = v10;
      if (v10)
      {
        v12 = [v10 location];
        [v12 coordinate];
        CLLocationDegrees v14 = v13;
        CLLocationDegrees v16 = v15;

        v21.latitude = v14;
        v21.longitude = v16;
        if (CLLocationCoordinate2DIsValid(v21))
        {
          CLLocationCoordinate2DGetDistanceFrom();
          if (v17 < v7) {
            double v7 = v17;
          }
        }
      }
    }
  }

  return v7;
}

- (void)removeVisit:(id)a3
{
  visits = self->_visits;
  id v4 = a3;
  [(NSMutableArray *)visits removeObject:v4];
  [v4 setLocationOfInterest:0];
}

- (void)addVisit:(id)a3
{
  id v4 = a3;
  if ((-[NSMutableArray containsObject:](self->_visits, "containsObject:") & 1) == 0)
  {
    [(NSMutableArray *)self->_visits addObject:v4];
    [v4 setLocationOfInterest:self];
  }
}

- (id)placemarkWithLocationCache:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (!self->_placemarkRegion)
  {
    CLLocationDegrees v14 = 0;
    goto LABEL_14;
  }
  placemark = self->_placemark;
  if (!placemark)
  {
    double v7 = objc_msgSend(v4, "placemarksForLocation:");
    if ([v7 count])
    {
      if ((unint64_t)[v7 count] < 2)
      {
LABEL_12:
        CLLocationCoordinate2D v21 = [v7 firstObject];
        v22 = self->_placemark;
        self->_placemark = v21;

        placemark = self->_placemark;
        goto LABEL_13;
      }
      [(CLCircularRegion *)self->_placemarkRegion center];
      uint64_t v9 = v8;
      uint64_t v11 = v10;
      v12 = +[CLSLogging sharedLogging];
      p_super = [v12 loggingConnection];

      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        int v24 = 134283777;
        uint64_t v25 = v9;
        __int16 v26 = 2049;
        uint64_t v27 = v11;
        _os_log_error_impl(&dword_1D2150000, p_super, OS_LOG_TYPE_ERROR, "More than one placemark found for location {%{private}f, %{private}f}", (uint8_t *)&v24, 0x16u);
      }
    }
    else
    {
      [(CLCircularRegion *)self->_placemarkRegion center];
      uint64_t v16 = v15;
      uint64_t v18 = v17;
      CLLocationCoordinate2D v19 = +[CLSLogging sharedLogging];
      CLLocationCoordinate2D v20 = [v19 loggingConnection];

      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        int v24 = 134283777;
        uint64_t v25 = v16;
        __int16 v26 = 2049;
        uint64_t v27 = v18;
        _os_log_impl(&dword_1D2150000, v20, OS_LOG_TYPE_DEFAULT, "No placemark found for location {%{private}f, %{private}f}", (uint8_t *)&v24, 0x16u);
      }

      p_super = &self->_placemarkRegion->super.super;
      self->_placemarkRegion = 0;
    }

    goto LABEL_12;
  }
LABEL_13:
  CLLocationDegrees v14 = placemark;
LABEL_14:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v7 = a3;
  [v7 encodeObject:identifier forKey:@"identifier"];
  uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_type];
  [v7 encodeObject:v5 forKey:@"type"];

  [v7 encodeDouble:@"radius" forKey:self->_radius];
  [v7 encodeObject:self->_location forKey:@"location"];
  id v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:self->_businessItemMuid];
  [v7 encodeObject:v6 forKey:@"businessItemMuid"];

  [v7 encodeObject:self->_placemark forKey:@"placemark"];
  [v7 encodeObject:self->_placemarkRegion forKey:@"placemarkRegion"];
}

- (CLSLocationOfInterest)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
  uint64_t v7 = [v6 unsignedIntegerValue];

  [v4 decodeDoubleForKey:@"radius"];
  double v9 = v8;
  uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"location"];
  uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"businessItemMuid"];
  uint64_t v12 = [v11 unsignedIntegerValue];

  double v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"placemark"];
  CLLocationDegrees v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"placemarkRegion"];

  if (v13 && !v14)
  {
    CLLocationDegrees v14 = [v13 region];
  }
  uint64_t v15 = [(CLSLocationOfInterest *)self initWithIdentifier:v5 locationOfInterestType:v7 location:v10 placemarkRegion:v14 businessItemMuid:v12 radius:v9];
  uint64_t v16 = v15;
  if (v15) {
    objc_storeStrong((id *)&v15->_placemark, v13);
  }

  return v16;
}

- (CLSLocationOfInterest)initWithIdentifier:(id)a3 locationOfInterestType:(int64_t)a4 location:(id)a5 placemarkRegion:(id)a6 businessItemMuid:(unint64_t)a7 radius:(double)a8
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  v23.receiver = self;
  v23.super_class = (Class)CLSLocationOfInterest;
  uint64_t v18 = [(CLSLocationOfInterest *)&v23 init];
  CLLocationCoordinate2D v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_identifier, a3);
    v19->_int64_t type = a4;
    v19->_radius = a8;
    uint64_t v20 = [MEMORY[0x1E4F1CA48] array];
    visits = v19->_visits;
    v19->_visits = (NSMutableArray *)v20;

    objc_storeStrong((id *)&v19->_location, a5);
    v19->_businessItemMuid = a7;
    objc_storeStrong((id *)&v19->_placemarkRegion, a6);
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
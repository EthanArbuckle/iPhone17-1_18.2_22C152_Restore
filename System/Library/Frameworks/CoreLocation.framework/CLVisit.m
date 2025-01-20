@interface CLVisit
+ (BOOL)supportsSecureCoding;
- (BOOL)hasArrivalDate;
- (BOOL)hasDepartureDate;
- (CLLocationAccuracy)horizontalAccuracy;
- (CLLocationCoordinate2D)coordinate;
- (CLVisit)initWithCoder:(id)a3;
- (CLVisit)initWithCoordinate:(CLLocationCoordinate2D)a3 horizontalAccuracy:(double)a4 arrivalDate:(id)a5 departureDate:(id)a6 detectionDate:(id)a7;
- (CLVisit)initWithCoordinate:(CLLocationCoordinate2D)a3 horizontalAccuracy:(double)a4 arrivalDate:(id)a5 departureDate:(id)a6 detectionDate:(id)a7 placeInference:(id)a8;
- (NSDate)arrivalDate;
- (NSDate)departureDate;
- (NSDate)detectionDate;
- (_CLPlaceInference)_placeInference;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLVisit

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLVisit)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLVisit.m", 32, @"Invalid parameter not satisfying: %@", @"[decoder allowsKeyedCoding]");
  }
  [a3 decodeDoubleForKey:@"kCLVisitCodingKeyLatitude"];
  [a3 decodeDoubleForKey:@"kCLVisitCodingKeyLongitude"];
  [a3 decodeDoubleForKey:@"kCLVisitCodingKeyHorizontalAccuracy"];
  [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLVisitCodingKeyArrivalDate"];
  [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLVisitCodingKeyDepartureDate"];
  [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLVisitCodingKeyDetectionDate"];
  [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLVisitCodingKeyPlaceInference"];

  return (CLVisit *)MEMORY[0x1F4181798](self, sel_initWithCoordinate_horizontalAccuracy_arrivalDate_departureDate_detectionDate_placeInference_);
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLVisit.m", 48, @"Invalid parameter not satisfying: %@", @"[encoder allowsKeyedCoding]");
  }
  [(CLVisit *)self coordinate];
  objc_msgSend(a3, "encodeDouble:forKey:", @"kCLVisitCodingKeyLatitude");
  [(CLVisit *)self coordinate];
  [a3 encodeDouble:@"kCLVisitCodingKeyLongitude" forKey:v6];
  [(CLVisit *)self horizontalAccuracy];
  objc_msgSend(a3, "encodeDouble:forKey:", @"kCLVisitCodingKeyHorizontalAccuracy");
  objc_msgSend(a3, "encodeObject:forKey:", -[CLVisit arrivalDate](self, "arrivalDate"), @"kCLVisitCodingKeyArrivalDate");
  objc_msgSend(a3, "encodeObject:forKey:", -[CLVisit departureDate](self, "departureDate"), @"kCLVisitCodingKeyDepartureDate");
  objc_msgSend(a3, "encodeObject:forKey:", -[CLVisit detectionDate](self, "detectionDate"), @"kCLVisitCodingKeyDetectionDate");
  v7 = [(CLVisit *)self _placeInference];

  [a3 encodeObject:v7 forKey:@"kCLVisitCodingKeyPlaceInference"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[CLVisit allocWithZone:a3];
  [(CLVisit *)self coordinate];
  [(CLVisit *)self horizontalAccuracy];
  [(CLVisit *)self arrivalDate];
  [(CLVisit *)self departureDate];
  [(CLVisit *)self detectionDate];
  [(CLVisit *)self _placeInference];

  return (id)MEMORY[0x1F4181798](v4, sel_initWithCoordinate_horizontalAccuracy_arrivalDate_departureDate_detectionDate_placeInference_);
}

- (CLVisit)initWithCoordinate:(CLLocationCoordinate2D)a3 horizontalAccuracy:(double)a4 arrivalDate:(id)a5 departureDate:(id)a6 detectionDate:(id)a7 placeInference:(id)a8
{
  CLLocationDegrees longitude = a3.longitude;
  CLLocationDegrees latitude = a3.latitude;
  v17.receiver = self;
  v17.super_class = (Class)CLVisit;
  v15 = [(CLVisit *)&v17 init];
  if (v15)
  {
    if (a6)
    {
      if (a5)
      {
LABEL_4:
        v15->_coordinate.CLLocationDegrees latitude = latitude;
        v15->_coordinate.CLLocationDegrees longitude = longitude;
        v15->_horizontalAccuracy = a4;
        v15->_arrivalDate = (NSDate *)a5;
        v15->_departureDate = (NSDate *)a6;
        v15->_detectionDate = (NSDate *)a7;
        v15->__placeInference = (_CLPlaceInference *)a8;
        return v15;
      }
    }
    else
    {
      a6 = (id)[MEMORY[0x1E4F1C9C8] distantFuture];
      if (a5) {
        goto LABEL_4;
      }
    }
    a5 = (id)[MEMORY[0x1E4F1C9C8] distantPast];
    goto LABEL_4;
  }
  return v15;
}

- (CLVisit)initWithCoordinate:(CLLocationCoordinate2D)a3 horizontalAccuracy:(double)a4 arrivalDate:(id)a5 departureDate:(id)a6 detectionDate:(id)a7
{
  return (CLVisit *)MEMORY[0x1F4181798](self, sel_initWithCoordinate_horizontalAccuracy_arrivalDate_departureDate_detectionDate_placeInference_);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLVisit;
  [(CLVisit *)&v3 dealloc];
}

- (id)description
{
  if ([(CLVisit *)self hasArrivalDate]) {
    objc_super v3 = [(NSDate *)[(CLVisit *)self arrivalDate] description];
  }
  else {
    objc_super v3 = @"-";
  }
  if ([(CLVisit *)self hasDepartureDate]) {
    v4 = [(NSDate *)[(CLVisit *)self departureDate] description];
  }
  else {
    v4 = @"-";
  }
  v5 = NSString;
  [(CLVisit *)self coordinate];
  uint64_t v7 = v6;
  [(CLVisit *)self coordinate];
  uint64_t v9 = v8;
  [(CLVisit *)self horizontalAccuracy];
  return (id)[v5 stringWithFormat:@"<%+.8f,%+.8f> +/- %.2fm (%@ to %@) %@", v7, v9, v10, v3, v4, -[CLVisit _placeInference](self, "_placeInference")];
}

- (BOOL)hasArrivalDate
{
  v2 = [(CLVisit *)self arrivalDate];
  return -[NSDate isEqual:](v2, "isEqual:", [MEMORY[0x1E4F1C9C8] distantPast]) ^ 1;
}

- (BOOL)hasDepartureDate
{
  v2 = [(CLVisit *)self departureDate];
  return -[NSDate isEqual:](v2, "isEqual:", [MEMORY[0x1E4F1C9C8] distantFuture]) ^ 1;
}

- (NSDate)arrivalDate
{
  return self->_arrivalDate;
}

- (NSDate)departureDate
{
  return self->_departureDate;
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (CLLocationAccuracy)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

- (NSDate)detectionDate
{
  return self->_detectionDate;
}

- (_CLPlaceInference)_placeInference
{
  return self->__placeInference;
}

@end
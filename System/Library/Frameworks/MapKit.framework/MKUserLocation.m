@interface MKUserLocation
+ (id)keyPathsForValuesAffectingSubtitle;
+ (id)title;
+ (void)_setAnnotationClass:(Class)a3;
- (BOOL)hasValidHeading;
- (BOOL)isEqualToLocation:(id)a3;
- (BOOL)isUpdating;
- (CLHeading)heading;
- (CLLocation)fixedLocation;
- (CLLocation)location;
- (CLLocation)predictedLocation;
- (CLLocationCoordinate2D)coordinate;
- (MKUserLocation)init;
- (NSString)shortDescription;
- (NSString)subtitle;
- (NSString)title;
- (double)accuracy;
- (double)course;
- (double)expectedCoordinateUpdateInterval;
- (double)expectedHeadingUpdateInterval;
- (double)headingDegrees;
- (double)timestamp;
- (id)annotation;
- (void)_updateCoordinate;
- (void)dealloc;
- (void)reset;
- (void)setCoordinate:(CLLocationCoordinate2D)a3;
- (void)setCourse:(double)a3;
- (void)setExpectedCoordinateUpdateInterval:(double)a3;
- (void)setExpectedHeadingUpdateInterval:(double)a3;
- (void)setFixedLocation:(id)a3;
- (void)setHeading:(id)a3;
- (void)setLocation:(id)a3;
- (void)setPredictedLocation:(id)a3;
- (void)setSubtitle:(NSString *)subtitle;
- (void)setTimestamp:(double)a3;
- (void)setTitle:(NSString *)title;
- (void)setUpdating:(BOOL)a3;
@end

@implementation MKUserLocation

- (CLLocationCoordinate2D)coordinate
{
  [(MKAnnotationPrivate *)self->_internal->_annotation coordinate];
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

- (void)setLocation:(id)a3
{
  id v6 = a3;
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    id v4 = [(MKAnnotationPrivate *)self->_internal->_annotation location];

    if (v4 != v6)
    {
      [(MKAnnotationPrivate *)self->_internal->_annotation setLocation:v6];
      [(MKUserLocation *)self _updateCoordinate];
      [v6 course];
      self->_internal->course = v5;
    }
  }
}

- (void)setExpectedCoordinateUpdateInterval:(double)a3
{
  self->_expectedCoordinateUpdateInterval = a3;
}

- (double)expectedCoordinateUpdateInterval
{
  return self->_expectedCoordinateUpdateInterval;
}

- (void)_updateCoordinate
{
  double v3 = [(MKUserLocation *)self location];
  id v5 = v3;
  if (v3) {
    [v3 coordinate];
  }
  else {
    double v4 = -180.0;
  }
  [(MKUserLocation *)self setCoordinate:v4];
}

- (void)setPredictedLocation:(id)a3
{
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  if (objc_opt_respondsToSelector())
  {
    annotation = self->_internal->_annotation;
    -[MKAnnotationPrivate setCoordinate:](annotation, "setCoordinate:", latitude, longitude);
  }
}

- (BOOL)isEqualToLocation:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v5 = [(MKAnnotationPrivate *)self->_internal->_annotation location];
    [v4 coordinate];
    if (objc_msgSend(v5, "_navigation_isEqualToLocationCoordinate:"))
    {
      id v6 = [(MKAnnotationPrivate *)self->_internal->_annotation location];
      [v6 horizontalAccuracy];
      double v8 = v7;
      [v4 horizontalAccuracy];
      if (vabdd_f64(v8, v9) >= 0.001)
      {
        BOOL v14 = 0;
      }
      else
      {
        v10 = [(MKAnnotationPrivate *)self->_internal->_annotation location];
        int v11 = [v10 type];
        if (v11 == [v4 type])
        {
          v12 = [(MKAnnotationPrivate *)self->_internal->_annotation location];
          int v13 = objc_msgSend(v12, "_navigation_isStale");
          if (v13 == objc_msgSend(v4, "_navigation_isStale"))
          {
            v15 = [(MKAnnotationPrivate *)self->_internal->_annotation location];
            int v16 = objc_msgSend(v15, "_navigation_hasValidCourse");
            if (v16 == objc_msgSend(v4, "_navigation_hasValidCourse"))
            {
              v17 = [(MKAnnotationPrivate *)self->_internal->_annotation location];
              uint64_t v18 = objc_opt_class();
              if (v18 == objc_opt_class())
              {
                v19 = [(MKAnnotationPrivate *)self->_internal->_annotation location];
                v20 = objc_msgSend(v19, "_navigation_routeMatch");
                v21 = objc_msgSend(v4, "_navigation_routeMatch");
                BOOL v14 = v20 == v21;
              }
              else
              {
                BOOL v14 = 0;
              }
            }
            else
            {
              BOOL v14 = 0;
            }
          }
          else
          {
            BOOL v14 = 0;
          }
        }
        else
        {
          BOOL v14 = 0;
        }
      }
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (CLLocation)location
{
  fixedLocation = self->_internal->fixedLocation;
  if (fixedLocation)
  {
    double v3 = fixedLocation;
  }
  else if (objc_opt_respondsToSelector())
  {
    double v3 = [(MKAnnotationPrivate *)self->_internal->_annotation location];
  }
  else
  {
    double v3 = 0;
  }

  return v3;
}

- (CLHeading)heading
{
  return [(MKUserLocationInternal *)self->_internal heading];
}

- (void)setHeading:(id)a3
{
}

- (void)setExpectedHeadingUpdateInterval:(double)a3
{
  self->_expectedHeadingUpdateInterval = a3;
}

- (id)annotation
{
  return self->_internal->_annotation;
}

+ (id)keyPathsForValuesAffectingSubtitle
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"annotation.subtitle"];
}

- (void)setUpdating:(BOOL)a3
{
}

- (BOOL)isUpdating
{
  return [(MKUserLocationInternal *)self->_internal isUpdating];
}

- (MKUserLocation)init
{
  v10.receiver = self;
  v10.super_class = (Class)MKUserLocation;
  double v2 = [(MKUserLocation *)&v10 init];
  if (v2)
  {
    double v3 = objc_alloc_init(MKUserLocationInternal);
    internal = v2->_internal;
    v2->_internal = v3;

    id v5 = (objc_class *)sAnnotationClass;
    if (!sAnnotationClass) {
      id v5 = (objc_class *)objc_opt_class();
    }
    id v6 = (MKAnnotationPrivate *)objc_alloc_init(v5);
    double v7 = v2->_internal;
    annotation = v7->_annotation;
    v7->_annotation = v6;
  }
  return v2;
}

+ (void)_setAnnotationClass:(Class)a3
{
  if ((Class)sAnnotationClass != a3)
  {
    if ([(objc_class *)a3 conformsToProtocol:&unk_1ED9D34D8]) {
      sAnnotationClass = (uint64_t)a3;
    }
  }
}

+ (id)title
{
  double v2 = +[MKLocationManager sharedLocationManager];
  if ([v2 isLocationServicesApproved]
    && ([v2 isAuthorizedForPreciseLocation] & 1) == 0)
  {
    uint64_t v3 = MKLocalizedStringForApproximateLocation();
  }
  else
  {
    uint64_t v3 = MKLocalizedStringForCurrentLocation();
  }
  id v4 = (void *)v3;

  return v4;
}

- (void)dealloc
{
  [(MKUserLocation *)self setLocation:0];
  [(MKUserLocation *)self setFixedLocation:0];
  [(MKUserLocation *)self setPredictedLocation:0];
  [(MKUserLocation *)self setHeading:0];
  internal = self->_internal;
  annotation = internal->_annotation;
  internal->_annotation = 0;

  v5.receiver = self;
  v5.super_class = (Class)MKUserLocation;
  [(MKUserLocation *)&v5 dealloc];
}

- (CLLocation)fixedLocation
{
  return [(MKUserLocationInternal *)self->_internal fixedLocation];
}

- (void)setFixedLocation:(id)a3
{
}

- (CLLocation)predictedLocation
{
  return [(MKUserLocationInternal *)self->_internal predictedLocation];
}

- (double)timestamp
{
  [(MKUserLocationInternal *)self->_internal timestamp];
  return result;
}

- (void)setTimestamp:(double)a3
{
}

- (NSString)title
{
  uint64_t v3 = [(MKUserLocationInternal *)self->_internal title];

  if (!v3)
  {
    id v4 = [(id)objc_opt_class() title];
    [(MKUserLocationInternal *)self->_internal setTitle:v4];
  }
  internal = self->_internal;

  return [(MKUserLocationInternal *)internal title];
}

- (void)setTitle:(NSString *)title
{
}

- (double)course
{
  [(MKUserLocationInternal *)self->_internal course];
  return result;
}

- (void)setCourse:(double)a3
{
}

- (NSString)subtitle
{
  uint64_t v3 = [(MKUserLocation *)self annotation];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    objc_super v5 = [(MKUserLocation *)self annotation];
    id v6 = [v5 subtitle];
  }
  else
  {
    id v6 = self->_internal->subtitle;
  }

  return v6;
}

- (void)setSubtitle:(NSString *)subtitle
{
  double v9 = subtitle;
  char v4 = [(MKUserLocation *)self annotation];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(MKUserLocation *)self annotation];
    [v6 setSubtitle:v9];
  }
  else
  {
    uint64_t v7 = [(NSString *)v9 copy];
    internal = self->_internal;
    id v6 = internal->subtitle;
    internal->subtitle = (NSString *)v7;
  }
}

- (double)accuracy
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return -1.0;
  }
  uint64_t v3 = [(MKAnnotationPrivate *)self->_internal->_annotation location];
  [v3 horizontalAccuracy];
  double v5 = v4;

  return v5;
}

- (BOOL)hasValidHeading
{
  heading = self->_internal->heading;
  if (heading)
  {
    [(CLHeading *)heading headingAccuracy];
    LOBYTE(heading) = v3 >= 0.0;
  }
  return (char)heading;
}

- (double)headingDegrees
{
  [(CLHeading *)self->_internal->heading heading];
  return result;
}

- (NSString)shortDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v23.receiver = self;
  v23.super_class = (Class)MKUserLocation;
  double v4 = [(MKUserLocation *)&v23 description];
  double v5 = (void *)[v3 initWithString:v4];

  if (objc_opt_respondsToSelector())
  {
    id v6 = [(MKAnnotationPrivate *)self->_internal->_annotation location];

    if (v6)
    {
      uint64_t v7 = [(MKAnnotationPrivate *)self->_internal->_annotation location];
      [v7 coordinate];
      objc_super v10 = [NSString stringWithFormat:@"%+.8f, %+.8f", v8, v9];
      [v5 appendFormat:@" %@", v10];
    }
  }
  internal = self->_internal;
  fixedLocation = internal->fixedLocation;
  if (fixedLocation)
  {
    [(CLLocation *)fixedLocation coordinate];
    v15 = [NSString stringWithFormat:@"%+.8f, %+.8f", v13, v14];
    [v5 appendFormat:@" fixed:%@", v15];

    internal = self->_internal;
  }
  predictedLocation = internal->predictedLocation;
  if (predictedLocation)
  {
    [(CLLocation *)predictedLocation coordinate];
    v19 = [NSString stringWithFormat:@"%+.8f, %+.8f", v17, v18];
    [v5 appendFormat:@" predicted:%@", v19];

    internal = self->_internal;
  }
  heading = internal->heading;
  if (heading)
  {
    v21 = [(CLHeading *)heading compactDescription];
    [v5 appendFormat:@" heading:%@", v21];
  }

  return (NSString *)v5;
}

- (void)reset
{
  [(MKUserLocation *)self setLocation:0];
  [(MKUserLocation *)self setFixedLocation:0];
  [(MKUserLocation *)self setPredictedLocation:0];

  [(MKUserLocation *)self setHeading:0];
}

- (double)expectedHeadingUpdateInterval
{
  return self->_expectedHeadingUpdateInterval;
}

- (void).cxx_destruct
{
}

@end
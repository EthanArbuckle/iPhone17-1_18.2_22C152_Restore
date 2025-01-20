@interface CLSInputLocationClue
+ (id)clueWithLocation:(id)a3 locationCache:(id)a4;
+ (id)cluesWithLocations:(id)a3 locationCache:(id)a4;
- (BOOL)isDefinite;
- (CLLocationCoordinate2D)closestCoordinates;
- (double)gpsHorizontalAccuracy;
- (id)description;
- (id)location;
- (id)place;
- (id)placemark;
- (id)projectedLocation;
- (id)region;
- (id)regionInPlacemark;
- (unint64_t)numberOfAssets;
- (void)_prepareWithProgressBlock:(id)a3;
- (void)setNumberOfAssets:(unint64_t)a3;
@end

@implementation CLSInputLocationClue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationCache, 0);
  objc_storeStrong((id *)&self->_place, 0);
}

- (void)setNumberOfAssets:(unint64_t)a3
{
  self->numberOfAssets = a3;
}

- (unint64_t)numberOfAssets
{
  return self->numberOfAssets;
}

- (void)_prepareWithProgressBlock:(id)a3
{
  id v4 = a3;
  if (!self->_locationCache) {
    __assert_rtn("-[CLSInputLocationClue _prepareWithProgressBlock:]", "CLSClue.m", 870, "_locationCache != nil");
  }
  id v22 = v4;
  v5 = [(CLSClue *)self value];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v7 = [CLSPlace alloc];
    v8 = [(CLSClue *)self value];
    v9 = [(CLSPlace *)v7 initWithPlacemark:v8];
    place = self->_place;
    self->_place = v9;
  }
  else
  {
    v11 = [(CLSClue *)self value];
    objc_opt_class();
    char v12 = objc_opt_isKindOfClass();

    if (v12)
    {
      locationCache = self->_locationCache;
      v14 = [(CLSClue *)self value];
      v8 = [(CLSLocationCache *)locationCache placemarksForLocation:v14];

      place = [v8 firstObject];
      v15 = [[CLSPlace alloc] initWithPlacemark:place];
      v16 = self->_place;
      self->_place = v15;
    }
    else
    {
      v17 = [(CLSClue *)self value];
      v8 = +[CLSCachedGeocoderOperation operationWithLocation:v17];

      v18 = [v8 performSynchronouslyWithLocationCache:self->_locationCache error:0];
      place = v18;
      if (v18)
      {
        v19 = [v18 firstObject];
        v20 = [[CLSPlace alloc] initWithPlacemark:v19];
        v21 = self->_place;
        self->_place = v20;
      }
    }
  }
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v29.receiver = self;
  v29.super_class = (Class)CLSInputLocationClue;
  id v4 = [(CLSClue *)&v29 description];
  v5 = [v3 stringWithString:v4];

  v6 = [(CLSClue *)self value];
  [v5 appendFormat:@"\n\tvalue:[%@]", v6];

  objc_msgSend(v5, "appendFormat:", @"\n\tisDefinite:[%d]", -[CLSInputLocationClue isDefinite](self, "isDefinite"));
  v7 = [(CLSInputLocationClue *)self location];
  [v5 appendFormat:@"\n\tlocation:[%@]", v7];

  v8 = [(CLSInputLocationClue *)self region];
  [v5 appendFormat:@"\n\tregion:[%@]", v8];

  v9 = [(CLSInputLocationClue *)self regionInPlacemark];
  [v5 appendFormat:@"\n\tregionInPlacemark:[%@]", v9];

  v10 = [(CLSInputLocationClue *)self placemark];
  v11 = v10;
  if (v10)
  {
    v25 = [v10 location];
    v28 = [v11 region];
    v24 = [v11 thoroughfare];
    v27 = [v11 subThoroughfare];
    v23 = [v11 locality];
    v26 = [v11 subLocality];
    v21 = [v11 administrativeArea];
    v20 = [v11 subAdministrativeArea];
    char v12 = [v11 ISOcountryCode];
    v19 = [v11 inlandWater];
    v13 = [v11 ocean];
    id v22 = [v11 areasOfInterest];
    v14 = [v22 flattenWithSeparator:@", "];
    v15 = [v11 location];
    v16 = [(CLSInputLocationClue *)self location];
    [v15 distanceFromLocation:v16];
    [v5 appendFormat:@"\n\tplacemark:\n\t\tlocation:[%@]\n\t\tregion:[%@]\n\t\t thoroughfare:[%@] subThoroughfare:[%@] locality:[%@] subLocality:[%@]\n\t\tadministrativeArea:[%@] subAdministrativeArea:[%@] ISOcountryCode:[%@]\n\t\tinlandWater:[%@] ocean:[%@] areasOfInterest:[%@]\n\tdistanceDifference:[%lf]", v25, v28, v24, v27, v23, v26, v21, v20, v12, v19, v13, v14, v17];
  }
  return v5;
}

- (BOOL)isDefinite
{
  v3 = [(CLSInputLocationClue *)self region];
  [v3 radius];
  if (v4 <= 20.0)
  {
    BOOL v12 = 1;
  }
  else
  {
    v5 = [(CLSInputLocationClue *)self location];
    v6 = [(CLSInputLocationClue *)self placemark];
    v7 = [v6 location];
    [v5 distanceFromLocation:v7];
    if (v8 >= 0.01)
    {
      BOOL v12 = 0;
    }
    else
    {
      v9 = [(CLSInputLocationClue *)self placemark];
      v10 = [v9 region];
      [v10 radius];
      BOOL v12 = v11 <= 100.0;
    }
  }

  return v12;
}

- (CLLocationCoordinate2D)closestCoordinates
{
  v3 = [(CLSInputLocationClue *)self location];
  [v3 coordinate];
  double v5 = v4;
  double v7 = v6;

  double v8 = [(CLSInputLocationClue *)self projectedLocation];
  v9 = [(CLSInputLocationClue *)self location];
  [v8 distanceFromLocation:v9];
  double v11 = v10;

  if (v11 <= 15.0)
  {
    BOOL v12 = [(CLSInputLocationClue *)self projectedLocation];
    [v12 coordinate];
    double v5 = v13;
    double v7 = v14;
  }
  double v15 = v5;
  double v16 = v7;
  result.longitude = v16;
  result.latitude = v15;
  return result;
}

- (id)projectedLocation
{
  v2 = [(CLSInputLocationClue *)self placemark];
  v3 = [v2 location];

  return v3;
}

- (double)gpsHorizontalAccuracy
{
  v3 = [(CLSClue *)self value];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  double v5 = [(CLSClue *)self value];
  double v6 = v5;
  if (isKindOfClass)
  {
    [v5 clsHorizontalAccuracy];
  }
  else
  {
    objc_opt_class();
    char v8 = objc_opt_isKindOfClass();

    if ((v8 & 1) == 0)
    {
      double v6 = [(CLSInputLocationClue *)self placemark];
      double v10 = [v6 location];
      [v10 horizontalAccuracy];
      double v9 = v11;

      goto LABEL_7;
    }
    double v6 = [(CLSClue *)self value];
    [v6 horizontalAccuracy];
  }
  double v9 = v7;
LABEL_7:

  return v9;
}

- (id)location
{
  v3 = [(CLSClue *)self value];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  double v5 = [(CLSClue *)self value];
  if (isKindOfClass)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1E5F0]);
    [v5 center];
    double v8 = v7;
    double v10 = v9;
    [v5 clsHorizontalAccuracy];
    double v12 = v11;
    double v13 = [MEMORY[0x1E4F1C9C8] date];
    double v14 = objc_msgSend(v6, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v13, v8, v10, 0.0, v12, 0.0);
  }
  else
  {
    objc_opt_class();
    char v15 = objc_opt_isKindOfClass();

    if (v15)
    {
      double v14 = [(CLSClue *)self value];
      goto LABEL_7;
    }
    double v5 = [(CLSInputLocationClue *)self placemark];
    double v14 = [v5 location];
  }

LABEL_7:
  return v14;
}

- (id)regionInPlacemark
{
  id v3 = objc_alloc(MEMORY[0x1E4F1E5A8]);
  double v4 = [(CLSInputLocationClue *)self placemark];
  double v5 = [v4 location];
  [v5 coordinate];
  double v7 = v6;
  double v9 = v8;
  double v10 = [(CLSInputLocationClue *)self placemark];
  double v11 = [v10 region];
  [v11 radius];
  double v13 = v12;
  double v14 = objc_msgSend(NSString, "cls_generateUUID");
  char v15 = objc_msgSend(v3, "initWithCenter:radius:identifier:", v14, v7, v9, v13);

  return v15;
}

- (id)region
{
  id v3 = [(CLSClue *)self value];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v5 = [(CLSClue *)self value];
  }
  else
  {
    double v6 = [(CLSInputLocationClue *)self placemark];
    double v5 = [v6 region];
  }
  return v5;
}

- (id)placemark
{
  [(CLSInputClue *)self prepareIfNeeded];
  place = self->_place;
  return [(CLSPlace *)place placemark];
}

- (id)place
{
  [(CLSInputClue *)self prepareIfNeeded];
  place = self->_place;
  return place;
}

+ (id)cluesWithLocations:(id)a3 locationCache:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  double v7 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        double v13 = objc_msgSend((id)objc_opt_class(), "clueWithLocation:locationCache:", *(void *)(*((void *)&v15 + 1) + 8 * i), v6, (void)v15);
        [v7 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v7;
}

+ (id)clueWithLocation:(id)a3 locationCache:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  double v7 = +[CLSClue _clueWithValue:v6 forKey:@"Global Location"];
  id v8 = (void *)v7[14];
  v7[14] = v5;
  id v9 = v5;

  objc_opt_class();
  LOBYTE(v9) = objc_opt_isKindOfClass();

  double v10 = 0.9;
  if ((v9 & 1) == 0) {
    double v10 = 1.0;
  }
  [v7 setConfidence:v10];
  return v7;
}

@end
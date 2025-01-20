@interface MKPointAnnotation
- (BOOL)_isPendingSelectionAnimated;
- (BOOL)_shouldDeselectWhenDragged;
- (BOOL)isPersistent;
- (BOOL)shouldRepresentSelf;
- (BOOL)showsBalloonCallout;
- (CLLocation)location;
- (CLLocationCoordinate2D)coordinate;
- (MKPointAnnotation)init;
- (MKPointAnnotation)initWithCoordinate:(CLLocationCoordinate2D)coordinate;
- (MKPointAnnotation)initWithCoordinate:(CLLocationCoordinate2D)coordinate title:(NSString *)title subtitle:(NSString *)subtitle;
- (id)_initWithGeoJSONObject:(id)a3 error:(id *)a4;
- (id)feature;
- (id)reuseIdentifier;
- (id)viewRepresentation;
- (int64_t)representation;
- (void)setCoordinate:(CLLocationCoordinate2D)coordinate;
- (void)setLocation:(id)a3;
- (void)setRepresentation:(int64_t)a3;
@end

@implementation MKPointAnnotation

- (id)_initWithGeoJSONObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(MKPointAnnotation *)self init];
  if (!v7) {
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = [v6 objectForKeyedSubscript:@"type"];
    uint64_t v9 = _geoJSONGeometryType((uint64_t)v8);

    if (v9 == 1)
    {
      id v10 = [v6 objectForKeyedSubscript:@"coordinates"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ((unint64_t)[v10 count] > 1)
        {
          if ((unint64_t)[v10 count] >= 4)
          {
            v14 = MKGetMKGeoJSONSerializationLog();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_18BAEC000, v14, OS_LOG_TYPE_INFO, "GeoJSON positions SHOULD NOT extend positions beyond three elements", buf, 2u);
            }
          }
          v15 = [v10 objectAtIndexedSubscript:0];
          v16 = [v10 objectAtIndexedSubscript:1];
          objc_opt_class();
          if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
          {
            [v16 doubleValue];
            CLLocationDegrees v18 = v17;
            [v15 doubleValue];
            CLLocationCoordinate2D v20 = CLLocationCoordinate2DMake(v18, v19);
            if (v20.longitude >= -180.0 && v20.longitude <= 180.0 && v20.latitude >= -90.0 && v20.latitude <= 90.0)
            {

              -[MKPointAnnotation setCoordinate:](v7, "setCoordinate:", v20.latitude, v20.longitude);
              v13 = v7;
LABEL_32:

              goto LABEL_33;
            }
            if (a4)
            {
              v22 = NSString;
              v23 = [NSString stringWithFormat:@"%+.8f, %+.8f", *(void *)&v20.latitude, *(void *)&v20.longitude];
              v24 = [v22 stringWithFormat:@"Invalid coordinate position: %@", v23];
              _errorWithReason(v24);
              *a4 = (id)objc_claimAutoreleasedReturnValue();
            }
          }
          else if (a4)
          {
            _errorWithReason(@"GeoJSON positions must be an array of numbers");
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
        }
        else if (a4)
        {
          v11 = @"GeoJSON positions must have at least two values";
LABEL_16:
          _errorWithReason(v11);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      else if (a4)
      {
        v11 = @"coordinate value is not an array";
        goto LABEL_16;
      }

      v13 = 0;
      goto LABEL_32;
    }
    if (a4)
    {
      v12 = @"Input is not a Point GeoJSON object";
      goto LABEL_12;
    }
LABEL_13:
    v13 = 0;
    goto LABEL_33;
  }
  if (!a4) {
    goto LABEL_13;
  }
  v12 = @"Point object must be a dictionary";
LABEL_12:
  _errorWithReason(v12);
  v13 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_33:

  return v13;
}

- (MKPointAnnotation)init
{
  v3.receiver = self;
  v3.super_class = (Class)MKPointAnnotation;
  return [(MKPointAnnotation *)&v3 init];
}

- (MKPointAnnotation)initWithCoordinate:(CLLocationCoordinate2D)coordinate
{
  double longitude = coordinate.longitude;
  double latitude = coordinate.latitude;
  v5 = [(MKPointAnnotation *)self init];
  id v6 = v5;
  if (v5)
  {
    -[MKPointAnnotation setCoordinate:](v5, "setCoordinate:", latitude, longitude);
    v7 = v6;
  }

  return v6;
}

- (MKPointAnnotation)initWithCoordinate:(CLLocationCoordinate2D)coordinate title:(NSString *)title subtitle:(NSString *)subtitle
{
  double longitude = coordinate.longitude;
  double latitude = coordinate.latitude;
  uint64_t v9 = title;
  id v10 = subtitle;
  v11 = [(MKPointAnnotation *)self init];
  v12 = v11;
  if (v11)
  {
    -[MKPointAnnotation setCoordinate:](v11, "setCoordinate:", latitude, longitude);
    [(MKShape *)v12 setTitle:v9];
    [(MKShape *)v12 setSubtitle:v10];
    v13 = v12;
  }

  return v12;
}

- (id)feature
{
  customFeature = self->_customFeature;
  if (!customFeature)
  {
    if (self->_representation)
    {
      v4 = (VKCustomFeature *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB39F8]), "initWithCoordinate:", self->_coordinate.latitude, self->_coordinate.longitude);
      v5 = self->_customFeature;
      self->_customFeature = v4;

      id v6 = [(MKShape *)self title];
      uint64_t v7 = [v6 length];

      v8 = self->_customFeature;
      if (v7)
      {
        uint64_t v9 = [(MKShape *)self title];
        [(VKCustomFeature *)v8 setText:v9 locale:0];
      }
      else
      {
        [(VKCustomFeature *)self->_customFeature setText:@" " locale:0];
      }
      id v10 = [(MKShape *)self subtitle];
      uint64_t v11 = [v10 length];

      if (v11)
      {
        v12 = self->_customFeature;
        v13 = [(MKShape *)self subtitle];
        [(VKCustomFeature *)v12 setAnnotationText:v13 locale:0];
      }
      v14 = [MEMORY[0x1E4F645A0] genericMarkerStyleAttributes];
      v15 = v14;
      if (self->_representation == 2)
      {
        uint64_t v17 = 0x100010022;
        [v14 replaceAttributes:&v17 count:1];
      }
      [(VKCustomFeature *)self->_customFeature setStyleAttributes:v15];

      customFeature = self->_customFeature;
    }
    else
    {
      customFeature = 0;
    }
  }

  return customFeature;
}

- (BOOL)showsBalloonCallout
{
  return 1;
}

- (BOOL)shouldRepresentSelf
{
  return self->_representation != 0;
}

- (id)viewRepresentation
{
  return 0;
}

- (id)reuseIdentifier
{
  return 0;
}

- (BOOL)isPersistent
{
  return 0;
}

- (BOOL)_isPendingSelectionAnimated
{
  return 1;
}

- (BOOL)_shouldDeselectWhenDragged
{
  return 1;
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (void)setCoordinate:(CLLocationCoordinate2D)coordinate
{
  self->_coordinate = coordinate;
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (int64_t)representation
{
  return self->_representation;
}

- (void)setRepresentation:(int64_t)a3
{
  self->_representation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);

  objc_storeStrong((id *)&self->_customFeature, 0);
}

@end
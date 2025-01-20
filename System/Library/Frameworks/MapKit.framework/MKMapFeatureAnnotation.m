@interface MKMapFeatureAnnotation
- (CLLocationCoordinate2D)coordinate;
- (MKIconStyle)iconStyle;
- (MKMapFeatureAnnotation)initWithVKLabelMarker:(id)a3 isHybridMap:(BOOL)a4;
- (MKMapFeatureType)featureType;
- (MKPointOfInterestCategory)pointOfInterestCategory;
- (NSString)subtitle;
- (NSString)title;
- (VKLabelMarker)marker;
- (void)_setProperties;
@end

@implementation MKMapFeatureAnnotation

- (MKMapFeatureAnnotation)initWithVKLabelMarker:(id)a3 isHybridMap:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MKMapFeatureAnnotation;
  v8 = [(MKMapFeatureAnnotation *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_marker, a3);
    v9->_isHybridMap = a4;
    [(MKMapFeatureAnnotation *)v9 _setProperties];
  }

  return v9;
}

- (CLLocationCoordinate2D)coordinate
{
  [(VKLabelMarker *)self->_marker coordinate];
  CLLocationDegrees v4 = v3;
  [(VKLabelMarker *)self->_marker coordinate];

  CLLocationCoordinate2D v8 = CLLocationCoordinate2DMake(v4, v5);
  double longitude = v8.longitude;
  double latitude = v8.latitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (NSString)title
{
  return (NSString *)[(VKLabelMarker *)self->_marker text];
}

- (NSString)subtitle
{
  return (NSString *)[(VKLabelMarker *)self->_marker subtext];
}

- (void)_setProperties
{
  if ([(VKLabelMarker *)self->_marker externalFeatureCategory] == 3)
  {
    int64_t v3 = 2;
LABEL_5:
    self->_featureType = v3;
    return;
  }
  if ([(VKLabelMarker *)self->_marker externalFeatureCategory] == 2)
  {
    int64_t v3 = 1;
    goto LABEL_5;
  }
  if ([(VKLabelMarker *)self->_marker externalFeatureCategory] == 1)
  {
    id v9 = [(VKLabelMarker *)self->_marker styleAttributes];
    self->_featureType = 0;
    CLLocationDegrees v4 = [v9 poiCategory];
    MKPointOfInterestCategoryForGEOPOICategory(v4);
    CLLocationDegrees v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    pointOfInterestCategory = self->_pointOfInterestCategory;
    self->_pointOfInterestCategory = v5;

    id v7 = [[MKIconStyle alloc] initWithStyleAttributes:v9 isHybridMap:self->_isHybridMap];
    iconStyle = self->_iconStyle;
    self->_iconStyle = v7;
  }
}

- (MKMapFeatureType)featureType
{
  return self->_featureType;
}

- (MKIconStyle)iconStyle
{
  return self->_iconStyle;
}

- (MKPointOfInterestCategory)pointOfInterestCategory
{
  return self->_pointOfInterestCategory;
}

- (VKLabelMarker)marker
{
  return self->_marker;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_marker, 0);
  objc_storeStrong((id *)&self->_pointOfInterestCategory, 0);

  objc_storeStrong((id *)&self->_iconStyle, 0);
}

@end
@interface MKMapSnapshotFeatureAnnotation
+ (BOOL)supportsSecureCoding;
- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate;
- (BOOL)showsBalloonCallout;
- (MKMapSnapshotFeatureAnnotation)initWithCoder:(id)a3;
- (MKMapSnapshotFeatureAnnotation)initWithCoordinate:(CLLocationCoordinate2D)a3 title:(id)a4 representation:(int64_t)a5;
- (NSString)description;
- (id)feature;
- (int64_t)representation;
- (void)encodeWithCoder:(id)a3;
- (void)setCoordinate:(id)a3;
@end

@implementation MKMapSnapshotFeatureAnnotation

- (MKMapSnapshotFeatureAnnotation)initWithCoordinate:(CLLocationCoordinate2D)a3 title:(id)a4 representation:(int64_t)a5
{
  CLLocationDegrees longitude = a3.longitude;
  CLLocationDegrees latitude = a3.latitude;
  id v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)MKMapSnapshotFeatureAnnotation;
  v10 = [(MKMapSnapshotFeatureAnnotation *)&v20 init];
  v11 = v10;
  if (v10)
  {
    v10->_representation = a5;
    v10->_coordinate.CLLocationDegrees latitude = latitude;
    v10->_coordinate.CLLocationDegrees longitude = longitude;
    uint64_t v12 = [v9 copy];
    title = v11->_title;
    v11->_title = (NSString *)v12;

    uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB39F8]), "initWithCoordinate:", v11->_coordinate.latitude, v11->_coordinate.longitude);
    customFeature = v11->_customFeature;
    v11->_customFeature = (VKCustomFeature *)v14;

    [(VKCustomFeature *)v11->_customFeature setSortKey:0];
    if ([v9 length]) {
      [(VKCustomFeature *)v11->_customFeature setText:v9 locale:0];
    }
    v16 = [MEMORY[0x1E4F645A0] annotationViewProvidedCustomFeatureStyleAttributes];
    v17 = v16;
    if (a5 == 2)
    {
      uint64_t v19 = 0x100010022;
      [v16 replaceAttributes:&v19 count:1];
    }
    [(VKCustomFeature *)v11->_customFeature setStyleAttributes:v17];
  }
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MKMapSnapshotFeatureAnnotation)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeDoubleForKey:@"coordinate.latitude"];
  double v6 = v5;
  [v4 decodeDoubleForKey:@"coordinate.longitude"];
  double v8 = v7;
  id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
  uint64_t v10 = [v4 decodeIntegerForKey:@"representation"];

  v11 = -[MKMapSnapshotFeatureAnnotation initWithCoordinate:title:representation:](self, "initWithCoordinate:title:representation:", v9, v10, v6, v8);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  double latitude = self->_coordinate.latitude;
  id v5 = a3;
  [v5 encodeDouble:@"coordinate.latitude" forKey:latitude];
  [v5 encodeDouble:@"coordinate.longitude" forKey:self->_coordinate.longitude];
  [v5 encodeObject:self->_title forKey:@"title"];
  [v5 encodeInteger:self->_representation forKey:@"representation"];
}

- (NSString)description
{
  v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)MKMapSnapshotFeatureAnnotation;
  id v4 = [(MKMapSnapshotFeatureAnnotation *)&v10 description];
  uint64_t v5 = [NSString stringWithFormat:@"%+.8f, %+.8f", *(void *)&self->_coordinate.latitude, *(void *)&self->_coordinate.longitude];
  double v6 = (void *)v5;
  if (self->_representation == 1) {
    double v7 = @"Generic";
  }
  else {
    double v7 = @"Search";
  }
  double v8 = [v3 stringWithFormat:@"%@ coordinate:%@ title:'%@' representation:%@", v4, v5, self->_title, v7];

  return (NSString *)v8;
}

- (id)feature
{
  return self->_customFeature;
}

- (BOOL)showsBalloonCallout
{
  return 1;
}

- (int64_t)representation
{
  return self->_representation;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (void)setCoordinate:(id)a3
{
  self->_coordinate = ($AB5116BA7E623E054F959CECB034F4E7)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customFeature, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end
@interface _MKMapItemCustomFeature
+ (BOOL)supportsSecureCoding;
- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate;
- (BOOL)showsBalloonCallout;
- (_MKMapItemCustomFeature)initWithCoder:(id)a3;
- (_MKMapItemCustomFeature)initWithMapItem:(id)a3;
- (id)feature;
- (void)deselect;
- (void)encodeWithCoder:(id)a3;
- (void)select;
- (void)setCoordinate:(id)a3;
@end

@implementation _MKMapItemCustomFeature

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  double latitude = self->_coordinate.latitude;
  id v5 = a3;
  [v5 encodeDouble:@"coordinate.latitude" forKey:latitude];
  [v5 encodeDouble:@"coordinate.longitude" forKey:self->_coordinate.longitude];
  [v5 encodeObject:self->_feature forKey:@"feature"];
  [v5 encodeObject:self->_styleAttributes forKey:@"styleAttributes"];
}

- (_MKMapItemCustomFeature)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_MKMapItemCustomFeature;
  id v5 = [(_MKMapItemCustomFeature *)&v13 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"coordinate.latitude"];
    v5->_coordinate.double latitude = v6;
    [v4 decodeDoubleForKey:@"coordinate.longitude"];
    v5->_coordinate.longitude = v7;
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"feature"];
    feature = v5->_feature;
    v5->_feature = (VKCustomFeature *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"styleAttributes"];
    styleAttributes = v5->_styleAttributes;
    v5->_styleAttributes = (GEOFeatureStyleAttributes *)v10;
  }
  return v5;
}

- (_MKMapItemCustomFeature)initWithMapItem:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_MKMapItemCustomFeature;
  id v5 = [(_MKMapItemCustomFeature *)&v17 init];
  if (v5)
  {
    double v6 = [v4 placemark];
    [v6 coordinate];
    v5->_coordinate.double latitude = v7;

    uint64_t v8 = [v4 placemark];
    [v8 coordinate];
    v5->_coordinate.longitude = v9;

    uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB39F8]), "initWithCoordinate:", v5->_coordinate.latitude, v5->_coordinate.longitude);
    feature = v5->_feature;
    v5->_feature = (VKCustomFeature *)v10;

    v12 = v5->_feature;
    objc_super v13 = [v4 name];
    [(VKCustomFeature *)v12 setText:v13 locale:0];

    v14 = [v4 _styleAttributes];
    v18[0] = xmmword_18BD1B6E8;
    v18[1] = unk_18BD1B6F8;
    v18[2] = xmmword_18BD1B708;
    [v14 replaceAttributes:v18 count:6];
    [(VKCustomFeature *)v5->_feature setStyleAttributes:v14];
    -[VKCustomFeature setBusinessID:](v5->_feature, "setBusinessID:", [v4 _muid]);
    -[VKCustomFeature setFeatureID:](v5->_feature, "setFeatureID:", [v4 _customIconID]);
    styleAttributes = v5->_styleAttributes;
    v5->_styleAttributes = (GEOFeatureStyleAttributes *)v14;
  }
  return v5;
}

- (id)feature
{
  return self->_feature;
}

- (BOOL)showsBalloonCallout
{
  return 1;
}

- (void)deselect
{
  styleAttributes = self->_styleAttributes;
  uint64_t v5 = 65573;
  id v4 = styleAttributes;
  [(GEOFeatureStyleAttributes *)v4 replaceAttributes:&v5 count:1];
  [(VKCustomFeature *)self->_feature setStyleAttributes:v4];
}

- (void)select
{
  styleAttributes = self->_styleAttributes;
  uint64_t v5 = 0x100010025;
  id v4 = styleAttributes;
  [(GEOFeatureStyleAttributes *)v4 replaceAttributes:&v5 count:1];
  [(VKCustomFeature *)self->_feature setStyleAttributes:v4];
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
  objc_storeStrong((id *)&self->_styleAttributes, 0);

  objc_storeStrong((id *)&self->_feature, 0);
}

@end
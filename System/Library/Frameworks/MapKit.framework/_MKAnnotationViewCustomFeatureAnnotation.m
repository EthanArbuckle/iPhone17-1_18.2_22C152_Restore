@interface _MKAnnotationViewCustomFeatureAnnotation
+ (BOOL)supportsSecureCoding;
- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate;
- (MKAnnotationView)annotationView;
- (VKCustomFeature)feature;
- (_MKAnnotationViewCustomFeatureAnnotation)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAnnotationView:(id)a3;
- (void)setCoordinate:(id)a3;
- (void)setCustomFeature:(id)a3;
@end

@implementation _MKAnnotationViewCustomFeatureAnnotation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [(_MKAnnotationViewCustomFeatureAnnotation *)self coordinate];
  objc_msgSend(v4, "encodeDouble:forKey:", @"lat");
  [(_MKAnnotationViewCustomFeatureAnnotation *)self coordinate];
  [v4 encodeDouble:@"lng" forKey:v5];
  id v6 = [(_MKAnnotationViewCustomFeatureAnnotation *)self feature];
  [v4 encodeObject:v6 forKey:@"feature"];
}

- (_MKAnnotationViewCustomFeatureAnnotation)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_MKAnnotationViewCustomFeatureAnnotation;
  double v5 = [(_MKAnnotationViewCustomFeatureAnnotation *)&v11 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"lat"];
    v5->_coordinate.latitude = v6;
    [v4 decodeDoubleForKey:@"lng"];
    v5->_coordinate.longitude = v7;
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"feature"];
    customFeature = v5->_customFeature;
    v5->_customFeature = (VKCustomFeature *)v8;
  }
  return v5;
}

- (void)setCustomFeature:(id)a3
{
}

- (VKCustomFeature)feature
{
  customFeature = self->_customFeature;
  if (!customFeature)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_annotationView);
    [WeakRetained coordinate];
    self->_coordinate.latitude = v5;
    self->_coordinate.longitude = v6;
    double v7 = (VKCustomFeature *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB39F8]), "initWithCoordinate:", self->_coordinate.latitude, self->_coordinate.longitude);
    uint64_t v8 = self->_customFeature;
    self->_customFeature = v7;

    id v9 = objc_loadWeakRetained((id *)&self->_annotationView);
    -[VKCustomFeature setFeatureID:](self->_customFeature, "setFeatureID:", [v9 _featureId]);

    v10 = [MEMORY[0x1E4F645A0] annotationViewProvidedCustomFeatureStyleAttributes];
    if ([WeakRetained isSelected])
    {
      uint64_t v11 = [MEMORY[0x1E4F645A0] styleAttributesForCalloutWithAttributes:v10];

      v10 = (void *)v11;
    }
    [(VKCustomFeature *)self->_customFeature setStyleAttributes:v10];
    [WeakRetained _collisionFrame];
    CGRect v26 = CGRectInset(v25, 5.0, 5.0);
    double width = v26.size.width;
    double height = v26.size.height;
    objc_msgSend(WeakRetained, "_collisionAlignmentRectInsets", v26.origin.x, v26.origin.y);
    double v16 = (v14 - v15) * 0.5;
    double v19 = (v17 - v18) * 0.5;
    [WeakRetained centerOffset];
    -[VKCustomFeature setPlaceholderIconWithSize:anchorPoint:isRound:](self->_customFeature, "setPlaceholderIconWithSize:anchorPoint:isRound:", [WeakRetained collisionMode] == 1, width, height, width * 0.5 - (v20 + v16), height * 0.5 - (v21 + v19));
    id v22 = objc_loadWeakRetained((id *)&self->_annotationView);
    [v22 configureCustomFeature:self->_customFeature];

    customFeature = self->_customFeature;
  }

  return customFeature;
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

- (MKAnnotationView)annotationView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_annotationView);

  return (MKAnnotationView *)WeakRetained;
}

- (void)setAnnotationView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_annotationView);

  objc_storeStrong((id *)&self->_customFeature, 0);
}

@end
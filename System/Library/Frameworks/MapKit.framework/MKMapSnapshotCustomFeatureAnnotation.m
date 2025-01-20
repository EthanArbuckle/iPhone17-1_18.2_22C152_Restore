@interface MKMapSnapshotCustomFeatureAnnotation
+ (BOOL)supportsSecureCoding;
+ (id)customFeatureAnnotationForMapItem:(id)a3;
+ (id)customFeatureAnnotationForMapItem:(id)a3 styleAttributes:(id)a4;
+ (id)customFeatureAnnotationForMapItem:(id)a3 styleAttributes:(id)a4 suppressLabel:(BOOL)a5;
- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate;
- (BOOL)showsBalloonCallout;
- (MKMapSnapshotCustomFeatureAnnotation)initWithCoder:(id)a3;
- (MKMapSnapshotCustomFeatureAnnotation)initWithCustomFeature:(id)a3 coordinate:(id)a4;
- (_MKAnnotationViewCustomFeatureAnnotation)internalCustomFeatureAnnotation;
- (id)feature;
- (void)encodeWithCoder:(id)a3;
- (void)setCoordinate:(id)a3;
- (void)setInternalCustomFeatureAnnotation:(id)a3;
@end

@implementation MKMapSnapshotCustomFeatureAnnotation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MKMapSnapshotCustomFeatureAnnotation)initWithCustomFeature:(id)a3 coordinate:(id)a4
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MKMapSnapshotCustomFeatureAnnotation;
  v8 = [(MKMapSnapshotCustomFeatureAnnotation *)&v12 init];
  if (v8)
  {
    v9 = objc_alloc_init(_MKAnnotationViewCustomFeatureAnnotation);
    internalCustomFeatureAnnotation = v8->_internalCustomFeatureAnnotation;
    v8->_internalCustomFeatureAnnotation = v9;

    -[_MKAnnotationViewCustomFeatureAnnotation setCoordinate:](v8->_internalCustomFeatureAnnotation, "setCoordinate:", var0, var1);
    [(_MKAnnotationViewCustomFeatureAnnotation *)v8->_internalCustomFeatureAnnotation setCustomFeature:v7];
  }

  return v8;
}

- (MKMapSnapshotCustomFeatureAnnotation)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MKMapSnapshotCustomFeatureAnnotation;
  v5 = [(MKMapSnapshotCustomFeatureAnnotation *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"featureAnnotation"];
    internalCustomFeatureAnnotation = v5->_internalCustomFeatureAnnotation;
    v5->_internalCustomFeatureAnnotation = (_MKAnnotationViewCustomFeatureAnnotation *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(MKMapSnapshotCustomFeatureAnnotation *)self internalCustomFeatureAnnotation];
  [v4 encodeObject:v5 forKey:@"featureAnnotation"];
}

- (id)feature
{
  return [(_MKAnnotationViewCustomFeatureAnnotation *)self->_internalCustomFeatureAnnotation feature];
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  [(_MKAnnotationViewCustomFeatureAnnotation *)self->_internalCustomFeatureAnnotation coordinate];
  result.double var1 = v3;
  result.double var0 = v2;
  return result;
}

- (void)setCoordinate:(id)a3
{
}

- (BOOL)showsBalloonCallout
{
  return 1;
}

+ (id)customFeatureAnnotationForMapItem:(id)a3
{
  return (id)[a1 customFeatureAnnotationForMapItem:a3 styleAttributes:0];
}

+ (id)customFeatureAnnotationForMapItem:(id)a3 styleAttributes:(id)a4
{
  return (id)[a1 customFeatureAnnotationForMapItem:a3 styleAttributes:a4 suppressLabel:0];
}

+ (id)customFeatureAnnotationForMapItem:(id)a3 styleAttributes:(id)a4 suppressLabel:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  [v7 _coordinate];
  double v10 = v9;
  [v7 _coordinate];
  double v12 = v11;
  v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB39F8]), "initWithCoordinate:", v10, v11);
  v14 = v13;
  if (v5) {
    [v13 setTextDisplayMode:3];
  }
  v15 = [v7 name];
  [v14 setText:v15 locale:0];

  if (v8)
  {
    id v16 = v8;
  }
  else
  {
    id v16 = [v7 _styleAttributes];
  }
  v17 = v16;
  if (([v16 hasAttributes] & 1) == 0)
  {
    uint64_t v18 = [MEMORY[0x1E4F645A0] markerStyleAttributes];

    v17 = (void *)v18;
  }
  v19 = (void *)[v17 copy];

  long long v22 = xmmword_18BD1B410;
  [v19 replaceAttributes:&v22 count:2];
  [v14 setStyleAttributes:v19];
  v20 = -[MKMapSnapshotCustomFeatureAnnotation initWithCustomFeature:coordinate:]([MKMapSnapshotCustomFeatureAnnotation alloc], "initWithCustomFeature:coordinate:", v14, v10, v12);

  return v20;
}

- (_MKAnnotationViewCustomFeatureAnnotation)internalCustomFeatureAnnotation
{
  return self->_internalCustomFeatureAnnotation;
}

- (void)setInternalCustomFeatureAnnotation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
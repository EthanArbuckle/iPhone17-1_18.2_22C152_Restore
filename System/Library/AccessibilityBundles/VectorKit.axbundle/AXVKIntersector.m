@interface AXVKIntersector
- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinates;
- (AXVKIntersector)initWithFeature:(id)a3 coordinates:(id)a4 isDeadEnd:(BOOL)a5;
- (AXVKIntersector)initWithFeatureWrapper:(id)a3 coordinates:(id)a4 isDeadEnd:(BOOL)a5;
- (AXVKMultiSectionFeatureWrapper)featureWrapper;
- (BOOL)isDeadEnd;
- (BOOL)isEqual:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)setCoordinates:(id)a3;
- (void)setFeatureWrapper:(id)a3;
- (void)setIsDeadEnd:(BOOL)a3;
@end

@implementation AXVKIntersector

- (AXVKIntersector)initWithFeatureWrapper:(id)a3 coordinates:(id)a4 isDeadEnd:(BOOL)a5
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AXVKIntersector;
  v11 = [(AXVKIntersector *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_featureWrapper, a3);
    v12->_coordinates.latitude = var0;
    v12->_coordinates.longitude = var1;
    v12->_isDeadEnd = a5;
  }

  return v12;
}

- (AXVKIntersector)initWithFeature:(id)a3 coordinates:(id)a4 isDeadEnd:(BOOL)a5
{
  BOOL v5 = a5;
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v9 = a3;
  id v10 = [[AXVKMultiSectionFeatureWrapper alloc] initWithFeature:v9];
  v11 = -[AXVKIntersector initWithFeatureWrapper:coordinates:isDeadEnd:](self, "initWithFeatureWrapper:coordinates:isDeadEnd:", v10, v5, var0, var1);

  return v11;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  BOOL v5 = [(AXVKMultiSectionFeatureWrapper *)self->_featureWrapper featureName];
  v6 = [v3 stringWithFormat:@"%@:%p: %@ - (%f, %f)", v4, self, v5, *(void *)&self->_coordinates.latitude, *(void *)&self->_coordinates.longitude];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (AXVKIntersector *)a3;
  if (self == v4)
  {
    BOOL v15 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v5 = v4;
      v6 = [(AXVKIntersector *)v5 featureWrapper];
      char IsSameRoad = GEOMultiSectionFeatureIsSameRoad();

      double latitude = self->_coordinates.latitude;
      [(AXVKIntersector *)v5 coordinates];
      double v10 = v9;
      double longitude = self->_coordinates.longitude;
      [(AXVKIntersector *)v5 coordinates];
      double v13 = vabdd_f64(longitude, v12);
      if (vabdd_f64(latitude, v10) < 0.001) {
        BOOL v14 = IsSameRoad;
      }
      else {
        BOOL v14 = 0;
      }
      BOOL v15 = v13 < 0.001 && v14;
    }
    else
    {
      BOOL v15 = 0;
    }
  }

  return v15;
}

- (unint64_t)hash
{
  v3 = [(GEOMultiSectionFeature *)self->_featureWrapper->_feature feature];
  uint64_t v4 = AXVKFeatureLabelsAndShieldsHash(v3);

  return (unint64_t)(self->_coordinates.longitude
                          + (double)(53
                                   * (unint64_t)(self->_coordinates.latitude
                                                      + (double)(unint64_t)(53 * v4 + 2809))));
}

- (AXVKMultiSectionFeatureWrapper)featureWrapper
{
  return self->_featureWrapper;
}

- (void)setFeatureWrapper:(id)a3
{
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinates
{
  double latitude = self->_coordinates.latitude;
  double longitude = self->_coordinates.longitude;
  result.double var1 = longitude;
  result.double var0 = latitude;
  return result;
}

- (void)setCoordinates:(id)a3
{
  self->_coordinates = ($AB5116BA7E623E054F959CECB034F4E7)a3;
}

- (BOOL)isDeadEnd
{
  return self->_isDeadEnd;
}

- (void)setIsDeadEnd:(BOOL)a3
{
  self->_isDeadEnd = a3;
}

- (void).cxx_destruct
{
}

@end
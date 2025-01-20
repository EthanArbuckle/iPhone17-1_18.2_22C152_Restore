@interface ARWorldTrackingFeaturePointData
+ (BOOL)supportsSecureCoding;
- (ARPointCloud)featurePoints;
- (ARPointCloud)visionFeaturePoints;
- (ARWorldTrackingFeaturePointData)initWithCoder:(id)a3;
- (ARWorldTrackingFeaturePointData)initWithTimestamp:(double)a3;
- (BOOL)isEqual:(id)a3;
- (double)timestamp;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setFeaturePoints:(id)a3;
- (void)setVisionFeaturePoints:(id)a3;
@end

@implementation ARWorldTrackingFeaturePointData

- (ARWorldTrackingFeaturePointData)initWithTimestamp:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ARWorldTrackingFeaturePointData;
  result = [(ARWorldTrackingFeaturePointData *)&v5 init];
  if (result) {
    result->_timestamp = a3;
  }
  return result;
}

- (void)setVisionFeaturePoints:(id)a3
{
  objc_storeStrong((id *)&self->_visionFeaturePoints, a3);
  id v5 = a3;
  id v7 = [(ARPointCloud *)self->_visionFeaturePoints pointCloudByApplyingTransform:ARVisionToRenderingCoordinateTransform()];
  if ([v7 count]) {
    v6 = v7;
  }
  else {
    v6 = 0;
  }
  objc_storeStrong((id *)&self->_featurePoints, v6);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ARWorldTrackingFeaturePointData)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ARWorldTrackingFeaturePointData;
  id v5 = [(ARWorldTrackingFeaturePointData *)&v12 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"timestamp"];
    v5->_timestamp = v6;
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"visionFeaturePoints"];
    visionFeaturePoints = v5->_visionFeaturePoints;
    v5->_visionFeaturePoints = (ARPointCloud *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"featurePoints"];
    featurePoints = v5->_featurePoints;
    v5->_featurePoints = (ARPointCloud *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double timestamp = self->_timestamp;
  id v5 = a3;
  [v5 encodeDouble:@"timestamp" forKey:timestamp];
  [v5 encodeObject:self->_visionFeaturePoints forKey:@"visionFeaturePoints"];
  [v5 encodeObject:self->_featurePoints forKey:@"featurePoints"];
}

- (unint64_t)hash
{
  return (unint64_t)(self->_timestamp * 1000.0);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if (vabdd_f64(self->_timestamp, *((double *)v5 + 1)) < 2.22044605e-16
      && ((visionFeaturePoints = self->_visionFeaturePoints, visionFeaturePoints == *((ARPointCloud **)v5 + 2))
       || -[ARPointCloud isEqual:](visionFeaturePoints, "isEqual:")))
    {
      featurePoints = self->_featurePoints;
      if (featurePoints == *((ARPointCloud **)v5 + 3)) {
        char v8 = 1;
      }
      else {
        char v8 = -[ARPointCloud isEqual:](featurePoints, "isEqual:");
      }
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (ARPointCloud)visionFeaturePoints
{
  return self->_visionFeaturePoints;
}

- (ARPointCloud)featurePoints
{
  return self->_featurePoints;
}

- (void)setFeaturePoints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featurePoints, 0);
  objc_storeStrong((id *)&self->_visionFeaturePoints, 0);
}

@end
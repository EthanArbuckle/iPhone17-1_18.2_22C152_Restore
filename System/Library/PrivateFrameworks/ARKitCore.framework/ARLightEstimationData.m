@interface ARLightEstimationData
- (ARLightEstimate)lightEstimate;
- (double)timestamp;
- (void)setLightEstimate:(id)a3;
@end

@implementation ARLightEstimationData

- (double)timestamp
{
  v3 = [(ARLightEstimationData *)self lightEstimate];
  objc_opt_class();
  double v4 = -1.0;
  if (objc_opt_isKindOfClass())
  {
    v5 = [(ARLightEstimationData *)self lightEstimate];
    [v5 timestamp];
    double v4 = v6;
  }
  return v4;
}

- (ARLightEstimate)lightEstimate
{
  return self->_lightEstimate;
}

- (void)setLightEstimate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
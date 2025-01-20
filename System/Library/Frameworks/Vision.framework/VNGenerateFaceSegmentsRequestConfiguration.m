@interface VNGenerateFaceSegmentsRequestConfiguration
+ (BOOL)expansionRatioWithinValidRange:(float)a3;
+ (float)beginRangeFaceBoundingBoxExpansionRatio;
+ (float)defaultFaceBoundingBoxExpansionRatio;
+ (float)endRangeFaceBoundingBoxExpansionRatio;
- (VNGenerateFaceSegmentsRequestConfiguration)initWithRequestClass:(Class)a3;
- (float)faceBoundingBoxExpansionRatio;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setFaceBoundingBoxExpansionRatio:(float)a3;
@end

@implementation VNGenerateFaceSegmentsRequestConfiguration

- (float)faceBoundingBoxExpansionRatio
{
  return self->_faceBoundingBoxExpansionRatio;
}

- (VNGenerateFaceSegmentsRequestConfiguration)initWithRequestClass:(Class)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VNGenerateFaceSegmentsRequestConfiguration;
  v3 = [(VNImageBasedRequestConfiguration *)&v7 initWithRequestClass:a3];
  if (v3)
  {
    [(id)objc_opt_class() defaultFaceBoundingBoxExpansionRatio];
    v3->_faceBoundingBoxExpansionRatio = v4;
    v5 = v3;
  }

  return v3;
}

+ (float)defaultFaceBoundingBoxExpansionRatio
{
  return 1.2;
}

- (void)setFaceBoundingBoxExpansionRatio:(float)a3
{
  v5 = objc_opt_class();
  *(float *)&double v6 = a3;
  if ([v5 expansionRatioWithinValidRange:v6]) {
    self->_faceBoundingBoxExpansionRatio = a3;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)VNGenerateFaceSegmentsRequestConfiguration;
  id v4 = [(VNImageBasedRequestConfiguration *)&v8 copyWithZone:a3];
  double v6 = v4;
  if (v4)
  {
    *(float *)&double v5 = self->_faceBoundingBoxExpansionRatio;
    [v4 setFaceBoundingBoxExpansionRatio:v5];
  }
  return v6;
}

+ (BOOL)expansionRatioWithinValidRange:(float)a3
{
  id v4 = objc_opt_class();
  [v4 beginRangeFaceBoundingBoxExpansionRatio];
  if (v5 > a3) {
    return 0;
  }
  [v4 endRangeFaceBoundingBoxExpansionRatio];
  return v7 >= a3;
}

+ (float)endRangeFaceBoundingBoxExpansionRatio
{
  return 1.5;
}

+ (float)beginRangeFaceBoundingBoxExpansionRatio
{
  return 1.0;
}

@end
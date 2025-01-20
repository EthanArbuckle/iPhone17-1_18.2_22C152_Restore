@interface VNDetectHumanRectanglesRequestConfiguration
- (BOOL)upperBodyOnly;
- (VNDetectHumanRectanglesRequestConfiguration)initWithRequestClass:(Class)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setUpperBodyOnly:(BOOL)a3;
@end

@implementation VNDetectHumanRectanglesRequestConfiguration

- (void)setUpperBodyOnly:(BOOL)a3
{
  self->_upperBodyOnly = a3;
}

- (BOOL)upperBodyOnly
{
  return self->_upperBodyOnly;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VNDetectHumanRectanglesRequestConfiguration;
  id v4 = [(VNImageBasedRequestConfiguration *)&v7 copyWithZone:a3];
  v5 = v4;
  if (v4) {
    [v4 setUpperBodyOnly:self->_upperBodyOnly];
  }
  return v5;
}

- (VNDetectHumanRectanglesRequestConfiguration)initWithRequestClass:(Class)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VNDetectHumanRectanglesRequestConfiguration;
  v3 = [(VNImageBasedRequestConfiguration *)&v7 initWithRequestClass:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_upperBodyOnly = 1;
    v5 = v3;
  }

  return v4;
}

@end
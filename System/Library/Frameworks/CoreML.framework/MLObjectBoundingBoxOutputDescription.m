@interface MLObjectBoundingBoxOutputDescription
- (NSArray)labelNames;
- (NSString)confidenceFeatureName;
- (NSString)coordinatesFeatureName;
- (int)format;
- (void)setConfidenceFeatureName:(id)a3;
- (void)setCoordinatesFeatureName:(id)a3;
- (void)setFormat:(int)a3;
- (void)setLabelNames:(id)a3;
@end

@implementation MLObjectBoundingBoxOutputDescription

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelNames, 0);
  objc_storeStrong((id *)&self->_coordinatesFeatureName, 0);

  objc_storeStrong((id *)&self->_confidenceFeatureName, 0);
}

- (void)setLabelNames:(id)a3
{
}

- (NSArray)labelNames
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCoordinatesFeatureName:(id)a3
{
}

- (NSString)coordinatesFeatureName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setConfidenceFeatureName:(id)a3
{
}

- (NSString)confidenceFeatureName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFormat:(int)a3
{
  self->_format = a3;
}

- (int)format
{
  return self->_format;
}

@end
@interface MLKNearestNeighborsClassifierParameters
- (NSObject)defaultLabel;
- (NSString)nearestDistancesFeatureName;
- (NSString)nearestLabelsFeatureName;
- (int64_t)indexType;
- (int64_t)weightingScheme;
- (unint64_t)leafSize;
- (unint64_t)numberOfDimensions;
- (void)setDefaultLabel:(id)a3;
- (void)setIndexType:(int64_t)a3;
- (void)setLeafSize:(unint64_t)a3;
- (void)setNearestDistancesFeatureName:(id)a3;
- (void)setNearestLabelsFeatureName:(id)a3;
- (void)setNumberOfDimensions:(unint64_t)a3;
- (void)setWeightingScheme:(int64_t)a3;
@end

@implementation MLKNearestNeighborsClassifierParameters

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nearestDistancesFeatureName, 0);
  objc_storeStrong((id *)&self->_nearestLabelsFeatureName, 0);

  objc_storeStrong((id *)&self->_defaultLabel, 0);
}

- (void)setNearestDistancesFeatureName:(id)a3
{
}

- (NSString)nearestDistancesFeatureName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setNearestLabelsFeatureName:(id)a3
{
}

- (NSString)nearestLabelsFeatureName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDefaultLabel:(id)a3
{
}

- (NSObject)defaultLabel
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setLeafSize:(unint64_t)a3
{
  self->_leafSize = a3;
}

- (unint64_t)leafSize
{
  return self->_leafSize;
}

- (void)setIndexType:(int64_t)a3
{
  self->_indexType = a3;
}

- (int64_t)indexType
{
  return self->_indexType;
}

- (void)setWeightingScheme:(int64_t)a3
{
  self->_weightingScheme = a3;
}

- (int64_t)weightingScheme
{
  return self->_weightingScheme;
}

- (void)setNumberOfDimensions:(unint64_t)a3
{
  self->_numberOfDimensions = a3;
}

- (unint64_t)numberOfDimensions
{
  return self->_numberOfDimensions;
}

@end
@interface VNMPContext
- (BOOL)performClustersPostprocessing;
- (BOOL)performSceneClassification;
- (BOOL)useTimestampAdjustedDistances;
- (NSArray)qualityCriteriaList;
- (float)inliersRatioThreshold;
- (float)naturalClusteringDistanceThreshold;
- (float)roiAreaThreshold;
- (int)clusterSplitDistanceType;
- (int)debugMode;
- (int)numberOfKeypointsToConsider;
- (int)timerMode;
- (void)setClusterSplitDistanceType:(int)a3;
- (void)setDebugMode:(int)a3;
- (void)setInliersRatioThreshold:(float)a3;
- (void)setNaturalClusteringDistanceThreshold:(float)a3;
- (void)setNumberOfKeypointsToConsider:(int)a3;
- (void)setPerformClustersPostprocessing:(BOOL)a3;
- (void)setPerformSceneClassification:(BOOL)a3;
- (void)setQualityCriteriaList:(id)a3;
- (void)setRoiAreaThreshold:(float)a3;
- (void)setTimerMode:(int)a3;
- (void)setUseTimestampAdjustedDistances:(BOOL)a3;
@end

@implementation VNMPContext

- (void).cxx_destruct
{
}

- (void)setNaturalClusteringDistanceThreshold:(float)a3
{
  self->_naturalClusteringDistanceThreshold = a3;
}

- (float)naturalClusteringDistanceThreshold
{
  return self->_naturalClusteringDistanceThreshold;
}

- (void)setNumberOfKeypointsToConsider:(int)a3
{
  self->_numberOfKeypointsToConsider = a3;
}

- (int)numberOfKeypointsToConsider
{
  return self->_numberOfKeypointsToConsider;
}

- (void)setInliersRatioThreshold:(float)a3
{
  self->_inliersRatioThreshold = a3;
}

- (float)inliersRatioThreshold
{
  return self->_inliersRatioThreshold;
}

- (void)setRoiAreaThreshold:(float)a3
{
  self->_roiAreaThreshold = a3;
}

- (float)roiAreaThreshold
{
  return self->_roiAreaThreshold;
}

- (void)setPerformSceneClassification:(BOOL)a3
{
  self->_performSceneClassification = a3;
}

- (BOOL)performSceneClassification
{
  return self->_performSceneClassification;
}

- (void)setPerformClustersPostprocessing:(BOOL)a3
{
  self->_performClustersPostprocessing = a3;
}

- (BOOL)performClustersPostprocessing
{
  return self->_performClustersPostprocessing;
}

- (void)setUseTimestampAdjustedDistances:(BOOL)a3
{
  self->_useTimestampAdjustedDistances = a3;
}

- (BOOL)useTimestampAdjustedDistances
{
  return self->_useTimestampAdjustedDistances;
}

- (void)setQualityCriteriaList:(id)a3
{
}

- (NSArray)qualityCriteriaList
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setClusterSplitDistanceType:(int)a3
{
  self->_clusterSplitDistanceType = a3;
}

- (int)clusterSplitDistanceType
{
  return self->_clusterSplitDistanceType;
}

- (void)setTimerMode:(int)a3
{
  self->_timerMode = a3;
}

- (int)timerMode
{
  return self->_timerMode;
}

- (void)setDebugMode:(int)a3
{
  self->_debugMode = a3;
}

- (int)debugMode
{
  return self->_debugMode;
}

@end
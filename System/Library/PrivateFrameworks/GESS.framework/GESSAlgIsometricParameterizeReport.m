@interface GESSAlgIsometricParameterizeReport
- (GESSAlgIsometricParameterizeReport)init;
- (double)chartMergingTime;
- (double)chartingTime;
- (double)fixSelfIntersectionTime;
- (double)initialParameterizationTime;
- (double)packingTime;
- (double)splitParameterizationTime;
- (float)averageStretchRatio;
- (float)maximumStretchRatio;
- (float)selfIntersectionRatio;
- (int)parameterizeStatus;
- (unsigned)numOfCharts;
- (unsigned)numOfPackedTextures;
- (void)setAverageStretchRatio:(float)a3;
- (void)setChartMergingTime:(double)a3;
- (void)setChartingTime:(double)a3;
- (void)setFixSelfIntersectionTime:(double)a3;
- (void)setInitialParameterizationTime:(double)a3;
- (void)setMaximumStretchRatio:(float)a3;
- (void)setNumOfCharts:(unsigned int)a3;
- (void)setNumOfPackedTextures:(unsigned int)a3;
- (void)setPackingTime:(double)a3;
- (void)setParameterizeStatus:(int)a3;
- (void)setSelfIntersectionRatio:(float)a3;
- (void)setSplitParameterizationTime:(double)a3;
@end

@implementation GESSAlgIsometricParameterizeReport

- (GESSAlgIsometricParameterizeReport)init
{
  v5.receiver = self;
  v5.super_class = (Class)GESSAlgIsometricParameterizeReport;
  v2 = [(GESSAlgReport *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(GESSAlgIsometricParameterizeReport *)v2 setChartingTime:0.0];
    [(GESSAlgIsometricParameterizeReport *)v3 setInitialParameterizationTime:0.0];
    [(GESSAlgIsometricParameterizeReport *)v3 setSplitParameterizationTime:0.0];
    [(GESSAlgIsometricParameterizeReport *)v3 setChartMergingTime:0.0];
    [(GESSAlgIsometricParameterizeReport *)v3 setFixSelfIntersectionTime:0.0];
    [(GESSAlgIsometricParameterizeReport *)v3 setPackingTime:0.0];
    [(GESSAlgIsometricParameterizeReport *)v3 setNumOfCharts:0];
    [(GESSAlgIsometricParameterizeReport *)v3 setNumOfPackedTextures:0];
    [(GESSAlgIsometricParameterizeReport *)v3 setMaximumStretchRatio:0.0];
    [(GESSAlgIsometricParameterizeReport *)v3 setAverageStretchRatio:0.0];
    [(GESSAlgIsometricParameterizeReport *)v3 setSelfIntersectionRatio:0.0];
    [(GESSAlgIsometricParameterizeReport *)v3 setParameterizeStatus:3];
  }
  return v3;
}

- (double)chartingTime
{
  return self->chartingTime;
}

- (void)setChartingTime:(double)a3
{
  self->chartingTime = a3;
}

- (double)initialParameterizationTime
{
  return self->initialParameterizationTime;
}

- (void)setInitialParameterizationTime:(double)a3
{
  self->initialParameterizationTime = a3;
}

- (double)splitParameterizationTime
{
  return self->splitParameterizationTime;
}

- (void)setSplitParameterizationTime:(double)a3
{
  self->splitParameterizationTime = a3;
}

- (double)chartMergingTime
{
  return self->chartMergingTime;
}

- (void)setChartMergingTime:(double)a3
{
  self->chartMergingTime = a3;
}

- (double)fixSelfIntersectionTime
{
  return self->fixSelfIntersectionTime;
}

- (void)setFixSelfIntersectionTime:(double)a3
{
  self->fixSelfIntersectionTime = a3;
}

- (double)packingTime
{
  return self->packingTime;
}

- (void)setPackingTime:(double)a3
{
  self->packingTime = a3;
}

- (unsigned)numOfCharts
{
  return self->numOfCharts;
}

- (void)setNumOfCharts:(unsigned int)a3
{
  self->numOfCharts = a3;
}

- (unsigned)numOfPackedTextures
{
  return self->numOfPackedTextures;
}

- (void)setNumOfPackedTextures:(unsigned int)a3
{
  self->numOfPackedTextures = a3;
}

- (float)maximumStretchRatio
{
  return self->maximumStretchRatio;
}

- (void)setMaximumStretchRatio:(float)a3
{
  self->maximumStretchRatio = a3;
}

- (float)averageStretchRatio
{
  return self->averageStretchRatio;
}

- (void)setAverageStretchRatio:(float)a3
{
  self->averageStretchRatio = a3;
}

- (float)selfIntersectionRatio
{
  return self->selfIntersectionRatio;
}

- (void)setSelfIntersectionRatio:(float)a3
{
  self->selfIntersectionRatio = a3;
}

- (int)parameterizeStatus
{
  return self->parameterizeStatus;
}

- (void)setParameterizeStatus:(int)a3
{
  self->parameterizeStatus = a3;
}

@end
@interface FRCOpticalFlowEstimatorConfiguration
- (BOOL)adaptationLayerOnly;
- (BOOL)disableOutputFlowScaling;
- (BOOL)legacyNormalization;
- (BOOL)skipLastLevel;
- (BOOL)streamingMode;
- (FRCOpticalFlowEstimatorConfiguration)init;
- (int64_t)mode;
- (int64_t)revision;
- (unsigned)matchOutputDimensions;
- (unsigned)outputPixelFormat;
- (void)setAdaptationLayerOnly:(BOOL)a3;
- (void)setDisableOutputFlowScaling:(BOOL)a3;
- (void)setLegacyNormalization:(BOOL)a3;
- (void)setMatchOutputDimensions:(unsigned int)a3;
- (void)setMode:(int64_t)a3;
- (void)setOutputPixelFormat:(unsigned int)a3;
- (void)setRevision:(int64_t)a3;
- (void)setSkipLastLevel:(BOOL)a3;
- (void)setStreamingMode:(BOOL)a3;
@end

@implementation FRCOpticalFlowEstimatorConfiguration

- (FRCOpticalFlowEstimatorConfiguration)init
{
  v6.receiver = self;
  v6.super_class = (Class)FRCOpticalFlowEstimatorConfiguration;
  v2 = [(FRCOpticalFlowEstimatorConfiguration *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_revision = 1;
    v2->_outputPixelFormat = 1278226536;
    v4 = v2;
  }

  return v3;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (BOOL)disableOutputFlowScaling
{
  return self->_disableOutputFlowScaling;
}

- (void)setDisableOutputFlowScaling:(BOOL)a3
{
  self->_disableOutputFlowScaling = a3;
}

- (BOOL)streamingMode
{
  return self->_streamingMode;
}

- (void)setStreamingMode:(BOOL)a3
{
  self->_streamingMode = a3;
}

- (int64_t)revision
{
  return self->_revision;
}

- (void)setRevision:(int64_t)a3
{
  self->_revision = a3;
}

- (BOOL)skipLastLevel
{
  return self->_skipLastLevel;
}

- (void)setSkipLastLevel:(BOOL)a3
{
  self->_skipLastLevel = a3;
}

- (BOOL)adaptationLayerOnly
{
  return self->_adaptationLayerOnly;
}

- (void)setAdaptationLayerOnly:(BOOL)a3
{
  self->_adaptationLayerOnly = a3;
}

- (BOOL)legacyNormalization
{
  return self->_legacyNormalization;
}

- (void)setLegacyNormalization:(BOOL)a3
{
  self->_legacyNormalization = a3;
}

- (unsigned)outputPixelFormat
{
  return self->_outputPixelFormat;
}

- (void)setOutputPixelFormat:(unsigned int)a3
{
  self->_outputPixelFormat = a3;
}

- (unsigned)matchOutputDimensions
{
  return self->_matchOutputDimensions;
}

- (void)setMatchOutputDimensions:(unsigned int)a3
{
  self->_matchOutputDimensions = a3;
}

@end
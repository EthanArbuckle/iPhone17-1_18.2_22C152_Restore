@interface CVABackgroundRequestImplSDOF
- (CGRect)primaryCaptureRect;
- (NSDictionary)sbufMetadata;
- (float)simulatedFocalRatio;
- (float)sourceColorGain;
- (float)sourceColorLux;
- (void)setPrimaryCaptureRect:(CGRect)a3;
- (void)setSbufMetadata:(id)a3;
- (void)setSimulatedFocalRatio:(float)a3;
- (void)setSourceColorGain:(float)a3;
- (void)setSourceColorLux:(float)a3;
@end

@implementation CVABackgroundRequestImplSDOF

- (void).cxx_destruct
{
}

- (void)setPrimaryCaptureRect:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_primaryCaptureRect, &v3, 32, 1, 0);
}

- (CGRect)primaryCaptureRect
{
  objc_copyStruct(v6, &self->_primaryCaptureRect, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setSbufMetadata:(id)a3
{
}

- (NSDictionary)sbufMetadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSourceColorLux:(float)a3
{
  self->_sourceColorLux = a3;
}

- (float)sourceColorLux
{
  return self->_sourceColorLux;
}

- (void)setSourceColorGain:(float)a3
{
  self->_sourceColorGain = a3;
}

- (float)sourceColorGain
{
  return self->_sourceColorGain;
}

- (void)setSimulatedFocalRatio:(float)a3
{
  self->_simulatedFocalRatio = a3;
}

- (float)simulatedFocalRatio
{
  return self->_simulatedFocalRatio;
}

@end
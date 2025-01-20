@interface BKSMutableHIDEventHitTestLayerInformation
- (BOOL)backgroundStatisticsValid;
- (void)setBackgroundAverage:(float)a3;
- (void)setBackgroundAverageContrastThreshold:(float)a3;
- (void)setBackgroundStandardDeviation:(float)a3;
- (void)setBackgroundStatisticsValid:(BOOL)a3;
- (void)setCumulativeContentsTransform:(CATransform3D *)a3;
- (void)setCumulativeLayerTransform:(CATransform3D *)a3;
- (void)setCumulativeOpacity:(float)a3;
- (void)setDetectedOcclusion:(BOOL)a3;
- (void)setHasInsecureFilter:(BOOL)a3;
- (void)setValidMask:(unint64_t)a3;
@end

@implementation BKSMutableHIDEventHitTestLayerInformation

- (void)setBackgroundStatisticsValid:(BOOL)a3
{
  *(&self->super._detectedOcclusion + 1) = a3;
}

- (BOOL)backgroundStatisticsValid
{
  return *(&self->super._detectedOcclusion + 1);
}

- (void)setBackgroundAverageContrastThreshold:(float)a3
{
  self->super._backgroundAverageContrastThreshold = a3;
}

- (void)setBackgroundStandardDeviation:(float)a3
{
  self->super._backgroundStandardDeviation = a3;
}

- (void)setBackgroundAverage:(float)a3
{
  self->super._backgroundAverage = a3;
}

- (void)setDetectedOcclusion:(BOOL)a3
{
  self->super._detectedOcclusion = a3;
}

- (void)setHasInsecureFilter:(BOOL)a3
{
  self->super._hasInsecureFilter = a3;
}

- (void)setCumulativeOpacity:(float)a3
{
  self->super._cumulativeOpacity = a3;
}

- (void)setCumulativeContentsTransform:(CATransform3D *)a3
{
  long long v3 = *(_OWORD *)&a3->m11;
  long long v4 = *(_OWORD *)&a3->m13;
  long long v5 = *(_OWORD *)&a3->m23;
  *(_OWORD *)&self->super._cumulativeContentsTransform.m21 = *(_OWORD *)&a3->m21;
  *(_OWORD *)&self->super._cumulativeContentsTransform.m23 = v5;
  *(_OWORD *)&self->super._cumulativeContentsTransform.m11 = v3;
  *(_OWORD *)&self->super._cumulativeContentsTransform.m13 = v4;
  long long v6 = *(_OWORD *)&a3->m31;
  long long v7 = *(_OWORD *)&a3->m33;
  long long v8 = *(_OWORD *)&a3->m43;
  *(_OWORD *)&self->super._cumulativeContentsTransform.m41 = *(_OWORD *)&a3->m41;
  *(_OWORD *)&self->super._cumulativeContentsTransform.m43 = v8;
  *(_OWORD *)&self->super._cumulativeContentsTransform.m31 = v6;
  *(_OWORD *)&self->super._cumulativeContentsTransform.m33 = v7;
}

- (void)setCumulativeLayerTransform:(CATransform3D *)a3
{
  long long v3 = *(_OWORD *)&a3->m11;
  long long v4 = *(_OWORD *)&a3->m13;
  long long v5 = *(_OWORD *)&a3->m23;
  *(_OWORD *)&self->super._cumulativeLayerTransform.m21 = *(_OWORD *)&a3->m21;
  *(_OWORD *)&self->super._cumulativeLayerTransform.m23 = v5;
  *(_OWORD *)&self->super._cumulativeLayerTransform.m11 = v3;
  *(_OWORD *)&self->super._cumulativeLayerTransform.m13 = v4;
  long long v6 = *(_OWORD *)&a3->m31;
  long long v7 = *(_OWORD *)&a3->m33;
  long long v8 = *(_OWORD *)&a3->m43;
  *(_OWORD *)&self->super._cumulativeLayerTransform.m41 = *(_OWORD *)&a3->m41;
  *(_OWORD *)&self->super._cumulativeLayerTransform.m43 = v8;
  *(_OWORD *)&self->super._cumulativeLayerTransform.m31 = v6;
  *(_OWORD *)&self->super._cumulativeLayerTransform.m33 = v7;
}

- (void)setValidMask:(unint64_t)a3
{
  self->super._validMask = a3;
}

@end
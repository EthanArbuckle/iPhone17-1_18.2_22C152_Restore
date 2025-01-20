@interface BKSMutableWindowServerHitTestSecurityAnalysis
- (id)copyWithZone:(_NSZone *)a3;
- (void)setCumulativeLayerTransform:(CATransform3D *)a3;
- (void)setCumulativeOpacity:(float)a3;
- (void)setHasInsecureFilter:(BOOL)a3;
- (void)setOcclusionMask:(unsigned int)a3;
- (void)setOcclusionPercentage:(float)a3;
- (void)setOcclusionType:(int64_t)a3;
- (void)setParentsHaveInsecureLayerProperties:(BOOL)a3;
@end

@implementation BKSMutableWindowServerHitTestSecurityAnalysis

- (void)setOcclusionType:(int64_t)a3
{
  self->super._occlusionType = a3;
}

- (void)setOcclusionPercentage:(float)a3
{
  self->super._occlusionPercentage = a3;
}

- (void)setOcclusionMask:(unsigned int)a3
{
  self->super._occlusionMask = a3;
}

- (void)setParentsHaveInsecureLayerProperties:(BOOL)a3
{
  self->super._parentsHaveInsecureLayerProperties = a3;
}

- (void)setHasInsecureFilter:(BOOL)a3
{
  self->super._hasInsecureFilter = a3;
}

- (void)setCumulativeOpacity:(float)a3
{
  self->super._cumulativeOpacity = a3;
}

- (void)setCumulativeLayerTransform:(CATransform3D *)a3
{
  long long v3 = *(_OWORD *)&a3->m11;
  long long v4 = *(_OWORD *)&a3->m13;
  long long v5 = *(_OWORD *)&a3->m21;
  *(_OWORD *)&self->super._cumulativeLayerTransform.m23 = *(_OWORD *)&a3->m23;
  *(_OWORD *)&self->super._cumulativeLayerTransform.m21 = v5;
  *(_OWORD *)&self->super._cumulativeLayerTransform.m13 = v4;
  *(_OWORD *)&self->super._cumulativeLayerTransform.m11 = v3;
  long long v6 = *(_OWORD *)&a3->m31;
  long long v7 = *(_OWORD *)&a3->m33;
  long long v8 = *(_OWORD *)&a3->m41;
  *(_OWORD *)&self->super._cumulativeLayerTransform.m43 = *(_OWORD *)&a3->m43;
  *(_OWORD *)&self->super._cumulativeLayerTransform.m41 = v8;
  *(_OWORD *)&self->super._cumulativeLayerTransform.m33 = v7;
  *(_OWORD *)&self->super._cumulativeLayerTransform.m31 = v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  long long v4 = [BKSWindowServerHitTestSecurityAnalysis alloc];
  return -[BKSWindowServerHitTestSecurityAnalysis _initWithCopyOf:](v4, self);
}

@end
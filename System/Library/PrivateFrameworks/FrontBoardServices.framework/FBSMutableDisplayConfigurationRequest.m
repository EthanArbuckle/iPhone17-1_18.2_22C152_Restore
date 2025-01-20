@interface FBSMutableDisplayConfigurationRequest
- (id)copyWithZone:(_NSZone *)a3;
- (void)setHdrMode:(int64_t)a3;
- (void)setLogicalScale:(CGSize)a3;
- (void)setNativePixelSize:(CGSize)a3;
- (void)setOverscanCompensation:(int64_t)a3;
- (void)setPointScale:(double)a3;
- (void)setRefreshRate:(double)a3;
@end

@implementation FBSMutableDisplayConfigurationRequest

- (void)setOverscanCompensation:(int64_t)a3
{
  self->super._overscanCompensation = a3;
}

- (void)setNativePixelSize:(CGSize)a3
{
  self->super._nativePixelSize = a3;
}

- (void)setPointScale:(double)a3
{
  self->super._pointScale = a3;
}

- (void)setRefreshRate:(double)a3
{
  self->super._refreshRate = a3;
}

- (void)setHdrMode:(int64_t)a3
{
  self->super._hdrMode = a3;
}

- (void)setLogicalScale:(CGSize)a3
{
  self->super._logicalScale = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [+[FBSDisplayConfigurationRequest allocWithZone:a3] init];
  *((void *)result + 1) = self->super._overscanCompensation;
  *((_OWORD *)result + 1) = self->super._nativePixelSize;
  *((void *)result + 4) = *(void *)&self->super._pointScale;
  *((void *)result + 5) = *(void *)&self->super._refreshRate;
  *((void *)result + 6) = self->super._hdrMode;
  *(CGSize *)((char *)result + 56) = self->super._logicalScale;
  return result;
}

@end
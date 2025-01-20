@interface VNTrackMaskRequestConfiguration
- (BOOL)generateCropRect;
- (VNTrackMaskRequestConfiguration)initWithRequestClass:(Class)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setGenerateCropRect:(BOOL)a3;
@end

@implementation VNTrackMaskRequestConfiguration

- (void)setGenerateCropRect:(BOOL)a3
{
  self->_generateCropRect = a3;
}

- (BOOL)generateCropRect
{
  return self->_generateCropRect;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VNTrackMaskRequestConfiguration;
  id v4 = [(VNStatefulRequestConfiguration *)&v6 copyWithZone:a3];
  if (v4) {
    objc_msgSend(v4, "setGenerateCropRect:", -[VNTrackMaskRequestConfiguration generateCropRect](self, "generateCropRect"));
  }
  return v4;
}

- (VNTrackMaskRequestConfiguration)initWithRequestClass:(Class)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VNTrackMaskRequestConfiguration;
  result = [(VNStatefulRequestConfiguration *)&v4 initWithRequestClass:a3];
  if (result) {
    result->_generateCropRect = 0;
  }
  return result;
}

@end
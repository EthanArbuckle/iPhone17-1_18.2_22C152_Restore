@interface AVApplePortraitMetadataInternal
- (AVApplePortraitMetadataInternal)init;
- (CGRect)focusRectangle;
- (NSData)faceObservationsData;
- (NSIndexSet)indexesOfShallowDepthOfFieldObservations;
- (float)apertureFocalRatio;
- (float)luminanceNoiseAmplitude;
- (float)maximumApertureFocalRatio;
- (float)minimumApertureFocalRatio;
- (float)portraitLightingEffectStrength;
- (int)faceOrientation;
- (int)version;
- (unsigned)SDOFRenderingVersion;
- (void)dealloc;
- (void)setApertureFocalRatio:(float)a3;
- (void)setFaceObservationsData:(id)a3;
- (void)setFaceOrientation:(int)a3;
- (void)setFocusRectangle:(CGRect)a3;
- (void)setIndexesOfShallowDepthOfFieldObservations:(id)a3;
- (void)setLuminanceNoiseAmplitude:(float)a3;
- (void)setMaximumApertureFocalRatio:(float)a3;
- (void)setMinimumApertureFocalRatio:(float)a3;
- (void)setPortraitLightingEffectStrength:(float)a3;
- (void)setSDOFRenderingVersion:(unsigned int)a3;
- (void)setVersion:(int)a3;
@end

@implementation AVApplePortraitMetadataInternal

- (AVApplePortraitMetadataInternal)init
{
  v4.receiver = self;
  v4.super_class = (Class)AVApplePortraitMetadataInternal;
  result = [(AVApplePortraitMetadataInternal *)&v4 init];
  if (result)
  {
    CGSize v3 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    result->focusRectangle.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    result->focusRectangle.size = v3;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVApplePortraitMetadataInternal;
  [(AVApplePortraitMetadataInternal *)&v3 dealloc];
}

- (int)version
{
  return self->version;
}

- (void)setVersion:(int)a3
{
  self->version = a3;
}

- (float)apertureFocalRatio
{
  return self->apertureFocalRatio;
}

- (void)setApertureFocalRatio:(float)a3
{
  self->apertureFocalRatio = a3;
}

- (float)minimumApertureFocalRatio
{
  return self->minimumApertureFocalRatio;
}

- (void)setMinimumApertureFocalRatio:(float)a3
{
  self->minimumApertureFocalRatio = a3;
}

- (float)maximumApertureFocalRatio
{
  return self->maximumApertureFocalRatio;
}

- (void)setMaximumApertureFocalRatio:(float)a3
{
  self->maximumApertureFocalRatio = a3;
}

- (float)portraitLightingEffectStrength
{
  return self->portraitLightingEffectStrength;
}

- (void)setPortraitLightingEffectStrength:(float)a3
{
  self->portraitLightingEffectStrength = a3;
}

- (float)luminanceNoiseAmplitude
{
  return self->luminanceNoiseAmplitude;
}

- (void)setLuminanceNoiseAmplitude:(float)a3
{
  self->luminanceNoiseAmplitude = a3;
}

- (int)faceOrientation
{
  return self->faceOrientation;
}

- (void)setFaceOrientation:(int)a3
{
  self->faceOrientation = a3;
}

- (NSData)faceObservationsData
{
  return self->faceObservationsData;
}

- (void)setFaceObservationsData:(id)a3
{
}

- (NSIndexSet)indexesOfShallowDepthOfFieldObservations
{
  return self->indexesOfShallowDepthOfFieldObservations;
}

- (void)setIndexesOfShallowDepthOfFieldObservations:(id)a3
{
}

- (CGRect)focusRectangle
{
  double x = self->focusRectangle.origin.x;
  double y = self->focusRectangle.origin.y;
  double width = self->focusRectangle.size.width;
  double height = self->focusRectangle.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFocusRectangle:(CGRect)a3
{
  self->focusRectangle = a3;
}

- (unsigned)SDOFRenderingVersion
{
  return self->SDOFRenderingVersion;
}

- (void)setSDOFRenderingVersion:(unsigned int)a3
{
  self->SDOFRenderingVersion = a3;
}

@end
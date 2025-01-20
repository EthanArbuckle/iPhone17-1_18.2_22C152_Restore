@interface BWStreamingCVAFilterRendererAnimator
+ (void)initialize;
- ($3BA783FF50B239963188BE194EBFFEBA)simulateNextFrameWithEffectStatus:(int)a3 portraitStability:(float)a4 clientSuppliedSimulatedAperture:(float)a5;
- (BOOL)isDepthAvailable;
- (BWStreamingCVAFilterRendererAnimator)init;
- (BWStreamingCVAFilterRendererAnimator)initWithEffectStatus:(int)a3 overCaptureEnabled:(BOOL)a4;
- (uint64_t)_resetSimulatedApertureRampWithEffectStatus:(float)a3 clientSuppliedSimulatedAperture:;
- (void)dealloc;
@end

@implementation BWStreamingCVAFilterRendererAnimator

+ (void)initialize
{
}

- (BWStreamingCVAFilterRendererAnimator)init
{
  return [(BWStreamingCVAFilterRendererAnimator *)self initWithEffectStatus:0 overCaptureEnabled:0];
}

- (BWStreamingCVAFilterRendererAnimator)initWithEffectStatus:(int)a3 overCaptureEnabled:(BOOL)a4
{
  v9.receiver = self;
  v9.super_class = (Class)BWStreamingCVAFilterRendererAnimator;
  v6 = [(BWStreamingCVAFilterRendererAnimator *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_mostRecentEffectStatus = a3;
    v6->_simulatedApertureRamp = [[BWRamp alloc] initWithName:@"SimulatedApertureRamp"];
    v7->_overCaptureEnabled = a4;
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWStreamingCVAFilterRendererAnimator;
  [(BWStreamingCVAFilterRendererAnimator *)&v3 dealloc];
}

- ($3BA783FF50B239963188BE194EBFFEBA)simulateNextFrameWithEffectStatus:(int)a3 portraitStability:(float)a4 clientSuppliedSimulatedAperture:(float)a5
{
  if (a3 > 0xE || (float v7 = a5, ((1 << a3) & 0x6202) == 0)) {
    float v7 = 1000.0;
  }
  if (self->_mostRecentEffectStatus != a3) {
    -[BWStreamingCVAFilterRendererAnimator _resetSimulatedApertureRampWithEffectStatus:clientSuppliedSimulatedAperture:]((uint64_t)self, a3, a5);
  }
  if ([(BWRamp *)self->_simulatedApertureRamp isRamping])
  {
    [(BWRamp *)self->_simulatedApertureRamp updateRampForNextIteration];
    float v7 = v8;
  }
  self->_currentFrame.simulatedAperture = v7;
  p_currentFrame = &self->_currentFrame;
  LODWORD(p_currentFrame[1].simulatedAperture) = a3;
  return ($3BA783FF50B239963188BE194EBFFEBA *)p_currentFrame;
}

- (uint64_t)_resetSimulatedApertureRampWithEffectStatus:(float)a3 clientSuppliedSimulatedAperture:
{
  if (!result) {
    return result;
  }
  uint64_t v5 = result;
  result = [*(id *)(result + 16) isRamping];
  unsigned int v8 = (*(_DWORD *)(v5 + 12) < 0xFu) & (0x6202u >> *(_DWORD *)(v5 + 12));
  if (a2 > 0xE || ((1 << a2) & 0x6202) == 0)
  {
    if (((*(_DWORD *)(v5 + 12) < 0xFu) & (0x6202u >> *(_DWORD *)(v5 + 12))) == 0) {
      return result;
    }
    v10 = *(void **)(v5 + 16);
    LODWORD(v7) = 16.0;
    *(float *)&double v6 = a3;
    uint64_t v9 = 4;
    uint64_t v11 = 1;
    goto LABEL_13;
  }
  if (!*(unsigned char *)(v5 + 24))
  {
    uint64_t v9 = 3;
    LODWORD(v6) = 1148846080;
    if (((*(_DWORD *)(v5 + 12) < 0xFu) & (0x6202u >> *(_DWORD *)(v5 + 12))) != 0) {
      return result;
    }
    goto LABEL_10;
  }
  LODWORD(v6) = 25.0;
  if (result) {
    result = objc_msgSend(*(id *)(v5 + 16), "updateRampForNextIteration", v6);
  }
  uint64_t v9 = (int)(float)(40.0 - (float)((float)(25.0 - *(float *)&v6) / 40.0));
  if ((v8 & 1) == 0)
  {
LABEL_10:
    v10 = *(void **)(v5 + 16);
    *(float *)&double v7 = a3;
    uint64_t v11 = 2;
LABEL_13:
    return [v10 startRampFrom:v9 to:v11 iterations:v6 shape:v7];
  }
  return result;
}

- (BOOL)isDepthAvailable
{
  return (self->_mostRecentEffectStatus < 0xFu) & (0x6202u >> self->_mostRecentEffectStatus);
}

@end
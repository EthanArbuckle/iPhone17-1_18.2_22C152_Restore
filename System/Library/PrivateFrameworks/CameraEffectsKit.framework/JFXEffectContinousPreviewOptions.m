@interface JFXEffectContinousPreviewOptions
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)effectAnimationDuration;
- (BOOL)loopAnimation;
- (NSArray)effectsToApplyToBackground;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initContinousPreviewOptions;
- (id)renderPropertiesConfigurationBlock;
- (unint64_t)backgroundType;
- (unsigned)maxFramesRenderedAtATime;
- (void)setBackgroundType:(unint64_t)a3;
- (void)setEffectAnimationDuration:(id *)a3;
- (void)setEffectsToApplyToBackground:(id)a3;
- (void)setLoopAnimation:(BOOL)a3;
- (void)setMaxFramesRenderedAtATime:(unsigned int)a3;
- (void)setRenderPropertiesConfigurationBlock:(id)a3;
@end

@implementation JFXEffectContinousPreviewOptions

- (id)initContinousPreviewOptions
{
  v6.receiver = self;
  v6.super_class = (Class)JFXEffectContinousPreviewOptions;
  v2 = [(JFXEffectPreviewOptions *)&v6 initPreviewOptions];
  if (v2)
  {
    CMTimeMakeWithSeconds(&v5, 1.0, 30);
    long long v3 = *(_OWORD *)&v5.value;
    v2[10] = v5.epoch;
    *((_OWORD *)v2 + 4) = v3;
    *((unsigned char *)v2 + 32) = 1;
    v2[5] = 0;
    *((_DWORD *)v2 + 9) = 2;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)JFXEffectContinousPreviewOptions;
  v4 = [(JFXEffectPreviewOptions *)&v11 copyWithZone:a3];
  long long v5 = *(_OWORD *)&self->_effectAnimationDuration.value;
  v4[10] = self->_effectAnimationDuration.epoch;
  *((_OWORD *)v4 + 4) = v5;
  *((unsigned char *)v4 + 32) = self->_loopAnimation;
  v4[5] = self->_backgroundType;
  uint64_t v6 = MEMORY[0x237DD15A0](self->_renderPropertiesConfigurationBlock);
  v7 = (void *)v4[7];
  v4[7] = v6;

  uint64_t v8 = [(NSArray *)self->_effectsToApplyToBackground copy];
  v9 = (void *)v4[6];
  v4[6] = v8;

  return v4;
}

- (unint64_t)backgroundType
{
  return self->_backgroundType;
}

- (void)setBackgroundType:(unint64_t)a3
{
  self->_backgroundType = a3;
}

- (NSArray)effectsToApplyToBackground
{
  return self->_effectsToApplyToBackground;
}

- (void)setEffectsToApplyToBackground:(id)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)effectAnimationDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 64);
  return self;
}

- (void)setEffectAnimationDuration:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_effectAnimationDuration.value = *(_OWORD *)&a3->var0;
  self->_effectAnimationDuration.epoch = var3;
}

- (BOOL)loopAnimation
{
  return self->_loopAnimation;
}

- (void)setLoopAnimation:(BOOL)a3
{
  self->_loopAnimation = a3;
}

- (unsigned)maxFramesRenderedAtATime
{
  return self->_maxFramesRenderedAtATime;
}

- (void)setMaxFramesRenderedAtATime:(unsigned int)a3
{
  self->_maxFramesRenderedAtATime = a3;
}

- (id)renderPropertiesConfigurationBlock
{
  return self->_renderPropertiesConfigurationBlock;
}

- (void)setRenderPropertiesConfigurationBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_renderPropertiesConfigurationBlock, 0);
  objc_storeStrong((id *)&self->_effectsToApplyToBackground, 0);
}

@end
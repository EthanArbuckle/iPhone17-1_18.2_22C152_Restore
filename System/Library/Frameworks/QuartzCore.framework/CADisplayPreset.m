@interface CADisplayPreset
- (BOOL)allowAutoBrightness;
- (BOOL)allowNightShift;
- (BOOL)allowTrueTone;
- (BOOL)isReference;
- (CADisplayPreset)initWithIsReference:(BOOL)a3 userAdjustment:(id)a4;
- (CADisplayPreset)initWithIsReference:(BOOL)a3 userAdjustment:(id)a4 autoLuminanceBoost:(float)a5;
- (CAUserAdjustment)userAdjustment;
- (double)maxSliderBrightness;
- (double)minSliderBrightness;
- (id)userAdjustmentCommand;
- (void)applyUserAdjustmentCommand:(id)a3;
- (void)dealloc;
@end

@implementation CADisplayPreset

- (CAUserAdjustment)userAdjustment
{
  return self->_userAdjustment;
}

- (BOOL)isReference
{
  return self->_isReference;
}

- (double)maxSliderBrightness
{
  return self->_maxSliderBrightness;
}

- (double)minSliderBrightness
{
  return self->_minSliderBrightness;
}

- (BOOL)allowAutoBrightness
{
  return self->_allowAutoBrightness;
}

- (BOOL)allowNightShift
{
  return self->_allowNightShift;
}

- (BOOL)allowTrueTone
{
  return self->_allowTrueTone;
}

- (void)applyUserAdjustmentCommand:(id)a3
{
  id v5 = (id)[a3 userAdjustment];

  self->_userAdjustment = (CAUserAdjustment *)[a3 userAdjustment];
}

- (id)userAdjustmentCommand
{
  if (!self->_isReference) {
    return 0;
  }
  v3 = [CAUserAdjustmentCommand alloc];
  *(float *)&double v4 = self->_autoLuminanceBoost;
  id v5 = [(CAUserAdjustmentCommand *)v3 initWithUserAdjustment:self->_userAdjustment autoLuminanceBoost:v4];

  return v5;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)CADisplayPreset;
  [(CADisplayPreset *)&v3 dealloc];
}

- (CADisplayPreset)initWithIsReference:(BOOL)a3 userAdjustment:(id)a4 autoLuminanceBoost:(float)a5
{
  BOOL v7 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)CADisplayPreset;
  v8 = [(CADisplayPreset *)&v13 init];
  v9 = v8;
  if (v8)
  {
    v8->_autoLuminanceBoost = a5;
    double v10 = 100.0;
    double v11 = 2.0;
    if (v7) {
      double v11 = 100.0;
    }
    else {
      double v10 = 600.0;
    }
    v8->_allowTrueTone = !v7;
    v8->_allowNightShift = !v7;
    v8->_allowAutoBrightness = !v7;
    v8->_minSliderBrightness = v11;
    v8->_maxSliderBrightness = v10;
    v8->_isReference = v7;
    v8->_userAdjustment = (CAUserAdjustment *)a4;
  }
  return v9;
}

- (CADisplayPreset)initWithIsReference:(BOOL)a3 userAdjustment:(id)a4
{
  LODWORD(v4) = 1.0;
  return [(CADisplayPreset *)self initWithIsReference:a3 userAdjustment:a4 autoLuminanceBoost:v4];
}

@end
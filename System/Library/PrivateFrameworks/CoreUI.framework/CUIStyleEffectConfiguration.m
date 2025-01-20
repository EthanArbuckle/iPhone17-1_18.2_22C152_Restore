@interface CUIStyleEffectConfiguration
- (BOOL)foregroundColorShouldTintEffects;
- (BOOL)shouldIgnoreForegroundColor;
- (BOOL)shouldRespectOutputBlending;
- (BOOL)useSimplifiedEffect;
- (CUIStyleEffectConfiguration)init;
- (NSString)appearanceName;
- (double)brightnessMultiplier;
- (double)effectScale;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)presentationState;
- (int64_t)state;
- (int64_t)value;
- (unint64_t)colorTemperature;
- (unint64_t)dimension1;
- (void)dealloc;
- (void)setAppearanceName:(id)a3;
- (void)setBrightnessMultiplier:(double)a3;
- (void)setColorTemperature:(unint64_t)a3;
- (void)setDimension1:(unint64_t)a3;
- (void)setEffectScale:(double)a3;
- (void)setForegroundColorShouldTintEffects:(BOOL)a3;
- (void)setPresentationState:(int64_t)a3;
- (void)setState:(int64_t)a3;
- (void)setUseSimplifiedEffect:(BOOL)a3;
- (void)setValue:(int64_t)a3;
@end

@implementation CUIStyleEffectConfiguration

- (BOOL)useSimplifiedEffect
{
  return self->_useSimplifiedEffect;
}

- (void)setAppearanceName:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
  {
    v4[1] = self->_state;
    v4[2] = self->_presentationState;
    v4[3] = self->_value;
    v4[4] = self->_dimension1;
    v4[5] = [(NSString *)self->_appearanceName copy];
    *((unsigned char *)v5 + 48) = self->_useSimplifiedEffect;
    *((unsigned char *)v5 + 49) = self->_foregroundColorShouldTintEffects;
    v5[7] = *(void *)&self->_brightnessMultiplier;
    v5[8] = *(void *)&self->_effectScale;
  }
  return v5;
}

- (CUIStyleEffectConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)CUIStyleEffectConfiguration;
  return [(CUIStyleEffectConfiguration *)&v3 init];
}

- (NSString)appearanceName
{
  return self->_appearanceName;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CUIStyleEffectConfiguration;
  [(CUIStyleEffectConfiguration *)&v3 dealloc];
}

- (BOOL)shouldIgnoreForegroundColor
{
  return 0;
}

- (BOOL)shouldRespectOutputBlending
{
  return 0;
}

- (id)description
{
  objc_super v3 = (objc_class *)objc_opt_class();
  return +[NSString stringWithFormat:@"<%@:%p useSimplifiedEffect %d\nstate: %d\nvalue: %ddimension1: %d appearance: %@> ", NSStringFromClass(v3), self, [(CUIStyleEffectConfiguration *)self useSimplifiedEffect], [(CUIStyleEffectConfiguration *)self state], [(CUIStyleEffectConfiguration *)self value], [(CUIStyleEffectConfiguration *)self dimension1], self->_appearanceName];
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (int64_t)presentationState
{
  return self->_presentationState;
}

- (void)setPresentationState:(int64_t)a3
{
  self->_presentationState = a3;
}

- (int64_t)value
{
  return self->_value;
}

- (void)setValue:(int64_t)a3
{
  self->_value = a3;
}

- (unint64_t)dimension1
{
  return self->_dimension1;
}

- (void)setDimension1:(unint64_t)a3
{
  self->_dimension1 = a3;
}

- (void)setUseSimplifiedEffect:(BOOL)a3
{
  self->_useSimplifiedEffect = a3;
}

- (BOOL)foregroundColorShouldTintEffects
{
  return self->_foregroundColorShouldTintEffects;
}

- (void)setForegroundColorShouldTintEffects:(BOOL)a3
{
  self->_foregroundColorShouldTintEffects = a3;
}

- (double)brightnessMultiplier
{
  return self->_brightnessMultiplier;
}

- (void)setBrightnessMultiplier:(double)a3
{
  self->_brightnessMultiplier = a3;
}

- (unint64_t)colorTemperature
{
  return self->_colorTemperature;
}

- (void)setColorTemperature:(unint64_t)a3
{
  self->_colorTemperature = a3;
}

- (double)effectScale
{
  return self->_effectScale;
}

- (void)setEffectScale:(double)a3
{
  self->_effectScale = a3;
}

@end
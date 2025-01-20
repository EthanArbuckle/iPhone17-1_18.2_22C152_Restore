@interface CustomBlurEffect
+ (id)effectWithStyle:(int64_t)a3;
- (NSNumber)customBlurRadius;
- (NSNumber)customColorTintAlpha;
- (NSNumber)customSaturation;
- (UIColor)customColorTint;
- (id)effectSettings;
- (void)setCustomBlurRadius:(id)a3;
- (void)setCustomColorTint:(id)a3;
- (void)setCustomColorTintAlpha:(id)a3;
- (void)setCustomSaturation:(id)a3;
@end

@implementation CustomBlurEffect

+ (id)effectWithStyle:(int64_t)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CustomBlurEffect;
  v3 = objc_msgSendSuper2(&v5, sel_effectWithStyle_, a3);
  return v3;
}

- (id)effectSettings
{
  v5.receiver = self;
  v5.super_class = (Class)CustomBlurEffect;
  v2 = [(UIBlurEffect *)&v5 effectSettings];
  v3 = [MEMORY[0x263F825C8] colorWithRed:0.42 green:0.42 blue:0.42 alpha:1.0];
  [v2 setColorTint:v3];

  [v2 setColorTintAlpha:0.35];
  [v2 setSaturationDeltaFactor:1.0];
  [v2 setBlurRadius:50.0];
  return v2;
}

- (NSNumber)customBlurRadius
{
  return self->_customBlurRadius;
}

- (void)setCustomBlurRadius:(id)a3
{
}

- (NSNumber)customSaturation
{
  return self->_customSaturation;
}

- (void)setCustomSaturation:(id)a3
{
}

- (UIColor)customColorTint
{
  return self->_customColorTint;
}

- (void)setCustomColorTint:(id)a3
{
}

- (NSNumber)customColorTintAlpha
{
  return self->_customColorTintAlpha;
}

- (void)setCustomColorTintAlpha:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customColorTintAlpha, 0);
  objc_storeStrong((id *)&self->_customColorTint, 0);
  objc_storeStrong((id *)&self->_customSaturation, 0);
  objc_storeStrong((id *)&self->_customBlurRadius, 0);
}

@end
@interface BSUIAnimationFactorySettings
+ (id)settingsControllerModule;
- (BOOL)slowAnimations;
- (double)effectiveSlowDownFactor;
- (double)slowDownFactor;
- (void)setDefaultValues;
- (void)setSlowAnimations:(BOOL)a3;
- (void)setSlowDownFactor:(double)a3;
@end

@implementation BSUIAnimationFactorySettings

- (double)effectiveSlowDownFactor
{
  if (self->_slowAnimations) {
    return self->_slowDownFactor;
  }
  else {
    return 1.0;
  }
}

- (void)setDefaultValues
{
  [(BSUIAnimationFactorySettings *)self setSlowAnimations:0];

  [(BSUIAnimationFactorySettings *)self setSlowDownFactor:4.0];
}

+ (id)settingsControllerModule
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"slowAnimations == YES"];
  v3 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Slow Animations" valueKeyPath:@"slowAnimations"];
  v14[0] = v3;
  v4 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Slow Factor" valueKeyPath:@"slowDownFactor"];
  v5 = [v4 minValue:1.0 maxValue:5.0];
  v6 = [v5 condition:v2];
  v14[1] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];

  v8 = (void *)MEMORY[0x1E4F94160];
  v9 = [MEMORY[0x1E4F94160] sectionWithRows:v7];
  v13 = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
  v11 = [v8 moduleWithTitle:@"Slow Animations" contents:v10];

  return v11;
}

- (BOOL)slowAnimations
{
  return self->_slowAnimations;
}

- (void)setSlowAnimations:(BOOL)a3
{
  self->_slowAnimations = a3;
}

- (double)slowDownFactor
{
  return self->_slowDownFactor;
}

- (void)setSlowDownFactor:(double)a3
{
  self->_slowDownFactor = a3;
}

@end
@interface _MTLumaDodgePillLowQualityEffectView
- (BOOL)_shouldAnimatePropertyAdditivelyWithKey:(id)a3;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
@end

@implementation _MTLumaDodgePillLowQualityEffectView

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  if (__supportedAnimationPropertyKey(v4))
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_MTLumaDodgePillLowQualityEffectView;
    BOOL v5 = [(_MTLumaDodgePillLowQualityEffectView *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return v5;
}

- (BOOL)_shouldAnimatePropertyAdditivelyWithKey:(id)a3
{
  id v4 = a3;
  if (__supportedAnimationPropertyKey(v4))
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_MTLumaDodgePillLowQualityEffectView;
    BOOL v5 = [(_MTLumaDodgePillLowQualityEffectView *)&v7 _shouldAnimatePropertyAdditivelyWithKey:v4];
  }

  return v5;
}

@end